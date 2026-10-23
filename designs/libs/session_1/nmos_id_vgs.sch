v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -30 -120 -30 -30 {lab=VDS}
N -30 -120 100 -120 {lab=VDS}
N 100 -120 100 -40 {lab=VDS}
N -30 30 -30 100 {lab=GND}
N -30 100 100 100 {lab=GND}
N 100 20 100 100 {lab=GND}
N -120 100 -30 100 {lab=GND}
N -120 70 -120 100 {lab=GND}
N -120 -0 -70 -0 {lab=VGS}
N -120 -0 -120 10 {lab=VGS}
N -30 -0 60 -0 {lab=GND}
N 60 -0 60 100 {lab=GND}
C {symbols/nfet_03v3.sym} -50 0 0 0 {name=M1
L=1u
W=20u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {code_shown.sym} 210 -60 0 0 {name=Simulation only_toplevel=false 

value=

"
.control
save all @m.xm1.m0[id] @m.xm1.m0[gm] @m.xm1.m0[vth]
dc VGS 0 3.3 0.01
plot @m.xm1.m0[id]
plot @m.xm1.m0[gm]
.endc

"}
C {devices/code_shown.sym} 210 -180 0 0 {name=Models only_toplevel=false
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {vsource.sym} 100 -10 0 0 {name=VDS value= 3.3 savecurrent=false}
C {vsource.sym} -120 40 0 1 {name=VGS value= 0 savecurrent=false}
C {gnd.sym} 0 100 0 0 {name=l2 lab=GND}
C {lab_wire.sym} -30 -120 0 0 {name=p1 sig_type=std_logic lab= VDS}
C {lab_wire.sym} -120 0 0 0 {name=p2 sig_type=std_logic lab= VGS}
