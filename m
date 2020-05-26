Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E32D1CC626
	for <lists+qemu-devel@lfdr.de>; Sun, 10 May 2020 04:21:36 +0200 (CEST)
Received: from localhost ([::1]:41618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jXbaw-0005py-TD
	for lists+qemu-devel@lfdr.de; Sat, 09 May 2020 22:21:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jXba4-00059O-Ob
 for qemu-devel@nongnu.org; Sat, 09 May 2020 22:20:40 -0400
Received: from indium.canonical.com ([91.189.90.7]:56048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jXba2-0006fB-Nh
 for qemu-devel@nongnu.org; Sat, 09 May 2020 22:20:40 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jXba0-0000F3-HE
 for <qemu-devel@nongnu.org>; Sun, 10 May 2020 02:20:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 699A12E8105
 for <qemu-devel@nongnu.org>; Sun, 10 May 2020 02:20:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 10 May 2020 02:13:37 -0000
From: John Hartley <1876678@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: graphdrum
X-Launchpad-Bug-Reporter: John Hartley (graphdrum)
X-Launchpad-Bug-Modifier: John Hartley (graphdrum)
References: <158858209471.12655.6550590823696382929.malonedeb@gac.canonical.com>
Message-Id: <158907681805.10702.10820547078947800365.malone@wampee.canonical.com>
Subject: [Bug 1876678] Re: Ubuntu 20.04 KVM / QEMU Failure with nested FreeBSD
 bhyve
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fbdff7602bd10fb883bf7e2ddcc7fd5a16f60398";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 0a1733d975b218420c7c08bf3b3d482c02747d54
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/09 22:20:36
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1876678 <1876678@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Ubuntu / KVM Maintainers,

I have now done additional diagnostics on this bug and it appears to be
triggered in nested virtualization case when apic virtualisation is
available in Layer 0 HW and then passed forward to Layer 1 VM via
Libvirt: <cpu mode=3D'host-model' check=3D'partial'> .

Testing found that in case where Layer 1 FreeBSD host had this feature,
see "VID,PostIntr" in "VT-x: PAT,HLT,MTF,PAUSE,EPT,UG,VPID,VID,PostIntr"
from CPU Feature below:

<<START LAYER 1 - FreeBSD CPU Report from dmesg.boot>>
...
...
CPU: Intel Core Processor (Broadwell, IBRS) (2600.09-MHz K8-class CPU)
  Origin=3D"GenuineIntel"  Id=3D0x306d2  Family=3D0x6  Model=3D0x3d  Steppi=
ng=3D2
  Features=3D0xf83fbff<FPU,VME,DE,PSE,TSC,MSR,PAE,MCE,CX8,APIC,SEP,MTRR,PGE=
,MCA,CMOV,PAT,PSE36,MMX,FXSR,SSE,SSE2,SS>
  Features2=3D0xfffa3223<SSE3,PCLMULQDQ,VMX,SSSE3,FMA,CX16,PCID,SSE4.1,SSE4=
.2,x2APIC,MOVBE,POPCNT,TSCDLT,AESNI,XSAVE,OSXSAVE,AVX,F16C,RDRAND,HV>
  AMD Features=3D0x2c100800<SYSCALL,NX,Page1GB,RDTSCP,LM>
  AMD Features2=3D0x121<LAHF,ABM,Prefetch>
  Structured Extended Features=3D0x1c0fbb<FSGSBASE,TSCADJ,BMI1,HLE,AVX2,SME=
P,BMI2,ERMS,INVPCID,RTM,RDSEED,ADX,SMAP>
  Structured Extended Features2=3D0x4<UMIP>
  Structured Extended Features3=3D0xac000400<MD_CLEAR,IBPB,STIBP,ARCH_CAP,S=
SBD>
  XSAVE Features=3D0x1<XSAVEOPT>
  IA32_ARCH_CAPS=3D0x8<SKIP_L1DFL_VME>
  AMD Extended Feature Extensions ID EBX=3D0x1001000
  VT-x: PAT,HLT,MTF,PAUSE,EPT,UG,VPID,VID,PostIntr
Hypervisor: Origin =3D "KVMKVMKVM"
...
...
<END LAYER 1 - dimes.log>>

In my case with Intel Broadwell chipset this is available, in case of
desktop "core i5-8250U" chip- this reports as:

VT-x: PAT,HLT,MTF,PAUSE,EPT,UG,VPID

For this case HW case, nested:
Layer 0 - Ubuntu 20.04, Layer 1 - FreeBSD 12.1 with bhyve, Layer 2 - FreeBS=
D 12.1
Works.

Workaround is to disable APIC virtual interrupt delivery:

1. Add entry into Layer 1 - FreeBSD Guest / Host: /boot/loader.conf:
hw.vmm.vmx.use_apic_vid=3D0

2. Reboot

3. Check via sysctl that virtual_interupt_delivery is disabled:
# sysctl hw.vmm.vmx.cap.virtual_interrupt_delivery
hw.vmm.vmx.cap.virtual_interrupt_delivery: 0          <- should be zero


Questions is:

While FreeBSD triggers this bug, is this a KVM issue or a FreeBSD bhyve
one ?

In doing some searching on Web I see that there is already work being
done with KVM 5.6 around APIC virtualisation and its handling. So not
sure if this a potentially know problem:
https://events19.linuxfoundation.org/wp-content/uploads/2017/12
/Improving-KVM-x86-Nested-Virtualization-Liran-Alon-Oracle.pdf

APIC Virtualisation support was introduced back in FreeBSD 11.0 way back
in Sept 2016:

https://www.freebsd.org/releases/11.0R/relnotes.html#hardware-
virtualization

Thanks to Peter Graham on FreeBSD virtualization bug tracker for helping
to find source of problem.

Should this BUG go to KVM / QEMU upstream ?

Cheers,

John Hartley.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1876678

Title:
  Ubuntu 20.04 KVM / QEMU Failure with nested FreeBSD bhyve

Status in QEMU:
  New

Bug description:
  BUG:

  Starting FreeBSD Layer 2 bhyve Guest within Layer 1 FreeBSD VM Host on
  Layer 0 Ubuntu 20.04 KVM / QEMU Host result in Layer 1 Guest / Host
  Pausing with "Emulation Failure"

  TESTING:

  My test scenario is nested virtualisation:
  Layer 0 - Ubuntu 20.04 Host
  Layer 1 - FreeBSD 12.1 with OVMF + bhyve hypervisor Guest/Host
  Layer 2 - FreeBSD 12.1 guest

  Layer 0 Host is: Ubuntu 20.04 LTS KVM / QEMU / libvirt

  <<START QEMU VERSION>>
  $ virsh -c qemu:///system version --daemon
  Compiled against library: libvirt 6.0.0
  Using library: libvirt 6.0.0
  Using API: QEMU 6.0.0
  Running hypervisor: QEMU 4.2.0
  Running against daemon: 6.0.0
  <<END QEMU VERSION>

  <<START Intel VMX Support & Nesting Enabled>>
  $ cat /proc/cpuinfo | grep -c vmx
  64
  $ cat /sys/module/kvm_intel/parameters/nested
  Y
  <<END Intel VMS>>


  Layer 1 Guest / Host is: FreeBSD Q35 v4.2 with OVMF:

  Pass Host VMX support to Layer 1 Guest via <cpu mode=3D'host-model>

  <<LIBVIRT CONFIG SNIPPET>>
  ...
  ...
    <os>
      <type arch=3D'x86_64' machine=3D'pc-q35-4.2'>hvm</type>
      <loader readonly=3D'yes' type=3D'pflash'>/usr/share/OVMF/OVMF_CODE.fd=
</loader>
      <nvram>/home/USER/swarm.bhyve.freebsd/OVMF_VARS.fd</nvram>
    </os>
    <features>
      <acpi/>
      <apic/>
      <vmport state=3D'off'/>
    </features>
    <cpu mode=3D'host-model' check=3D'partial'/>
  ...
  ...
  <END LIBVIRT CONFIG SNIPPET>>

  Checked that Layer 1 - FreeBSD Quest / Host has VMX feature available:

  <<LAYER 1 - FreeBSD CPU Features>>
  # uname -a
  FreeBSD swarm.DOMAIN.HERE 12.1-RELEASE FreeBSD 12.1-RELEASE GENERIC  amd64

  # grep Features /var/run/dmesg.boot =

    Features=3D0xf83fbff<FPU,VME,DE,PSE,TSC,MSR,PAE,MCE,CX8,APIC,SEP,MTRR,P=
GE,MCA,CMOV,PAT,PSE36,MMX,FXSR,SSE,SSE2,SS>
    Features2=3D0xfffa3223<SSE3,PCLMULQDQ,VMX,SSSE3,FMA,CX16,PCID,SSE4.1,SS=
E4.2,x2APIC,MOVBE,POPCNT,TSCDLT,AESNI,XSAVE,OSXSAVE,AVX,F16C,RDRAND,HV>
    AMD Features=3D0x2c100800<SYSCALL,NX,Page1GB,RDTSCP,LM>
    AMD Features2=3D0x121<LAHF,ABM,Prefetch>
    Structured Extended Features=3D0x1c0fbb<FSGSBASE,TSCADJ,BMI1,HLE,AVX2,S=
MEP,BMI2,ERMS,INVPCID,RTM,RDSEED,ADX,SMAP>
    Structured Extended Features2=3D0x4<UMIP>
    Structured Extended Features3=3D0xac000400<MD_CLEAR,IBPB,STIBP,ARCH_CAP=
,SSBD>
    XSAVE Features=3D0x1<XSAVEOPT>
  <<END LAYER 1 - FreeBSD CPU Features>

  On Layer 1 FreeBSD Guest / Host start up the Layer 2 guest..

  <<START LAYER 2 GUEST START>>
  # ls
  FreeBSD-11.2-RELEASE-amd64-bootonly.iso	FreeBSD-12.1-RELEASE-amd64-dvd1.i=
so	bee-hd1-01.img
  # /usr/sbin/bhyve -c 2 -m 2048 -H -A -s 0:0,hostbridge -s 1:0,lpc -s 2:0,=
e1000,tap0 -s 3:0,ahci-hd,bee-hd1-01.img -l com1,stdio -s 5:0,ahci-cd,./Fre=
eBSD-12.1-RELEASE-amd64-dvd1.iso bee
  <<END LAYER 2 GUEST START>>

  Result is that Layer 1 - FreeBSD Host guest "paused".

  To Layer 1 machines freezes I cannot get any further diagnostics from
  this machine, so I run tail on libvirt log from Layer 0 - Ubuntu Host

  <<LAYER 0 LOG TAIL>>
  char device redirected to /dev/pts/29 (label charserial0)
  2020-05-04T06:09:15.310474Z qemu-system-x86_64: warning: host doesn't sup=
port requested feature: MSR(48FH).vmx-exit-load-perf-global-ctrl [bit 12]
  2020-05-04T06:09:15.310531Z qemu-system-x86_64: warning: host doesn't sup=
port requested feature: MSR(490H).vmx-entry-load-perf-global-ctrl [bit 13]
  2020-05-04T06:09:15.312533Z qemu-system-x86_64: warning: host doesn't sup=
port requested feature: MSR(48FH).vmx-exit-load-perf-global-ctrl [bit 12]
  2020-05-04T06:09:15.312548Z qemu-system-x86_64: warning: host doesn't sup=
port requested feature: MSR(490H).vmx-entry-load-perf-global-ctrl [bit 13]
  2020-05-04T06:09:15.313828Z qemu-system-x86_64: warning: host doesn't sup=
port requested feature: MSR(48FH).vmx-exit-load-perf-global-ctrl [bit 12]
  2020-05-04T06:09:15.313841Z qemu-system-x86_64: warning: host doesn't sup=
port requested feature: MSR(490H).vmx-entry-load-perf-global-ctrl [bit 13]
  2020-05-04T06:09:15.315185Z qemu-system-x86_64: warning: host doesn't sup=
port requested feature: MSR(48FH).vmx-exit-load-perf-global-ctrl [bit 12]
  2020-05-04T06:09:15.315201Z qemu-system-x86_64: warning: host doesn't sup=
port requested feature: MSR(490H).vmx-entry-load-perf-global-ctrl [bit 13]
  KVM internal error. Suberror: 1
  emulation failure
  EAX=3D00000000 EBX=3D00000000 ECX=3D00000000 EDX=3D00000000
  ESI=3D00000000 EDI=3D00000000 EBP=3D00000000 ESP=3D00000000
  EIP=3D00000000 EFL=3D00000000 [-------] CPL=3D0 II=3D0 A20=3D1 SMM=3D0 HL=
T=3D0
  ES =3D0000 00000000 00000000 00008000 DPL=3D0 <hiword>
  CS =3D0000 00000000 00000000 00008000 DPL=3D0 <hiword>
  SS =3D0000 00000000 00000000 00008000 DPL=3D0 <hiword>
  DS =3D0000 00000000 00000000 00008000 DPL=3D0 <hiword>
  FS =3D0000 00000000 00000000 00008000 DPL=3D0 <hiword>
  GS =3D0000 00000000 00000000 00008000 DPL=3D0 <hiword>
  LDT=3D0000 00000000 00000000 00008000 DPL=3D0 <hiword>
  TR =3D0000 00000000 00000000 00008000 DPL=3D0 <hiword>
  GDT=3D     0000000000000000 00000000
  IDT=3D     0000000000000000 00000000
  CR0=3D80050033 CR2=3D0000000000000000 CR3=3D0000000000000000 CR4=3D003720=
60
  DR0=3D0000000000000000 DR1=3D0000000000000000 DR2=3D0000000000000000 DR3=
=3D0000000000000000 =

  DR6=3D00000000ffff0ff0 DR7=3D0000000000000400
  EFER=3D0000000000000d01
  Code=3D<??> ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?=
? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?=
? ?? ?? ??
  2020-05-04T06:35:39.186799Z qemu-system-x86_64: terminating on signal 15 =
from pid 2155 (/usr/sbin/libvirtd)
  2020-05-04 06:35:39.386+0000: shutting down, reason=3Ddestroyed
  <<END LAYER 0 LOG TAIL>>

  =

  I am reporting this bug here as result is very similar to that seen with =
QEMU seabios failure reported here: https://bugs.launchpad.net/qemu/+bug/18=
66870

  However in this case my VM Layer 1 VM is using OVMF.

  NOTE 1: I have also tested with Q35 v3.1 and 2.12 and get the same result.
  NOTE 2: Due to bug in FreeBSD networking code, I had to compile custom ke=
rnel with "netmap driver disabled".  This is known bug in FreeBSD that I ha=
ve reported separately.
  NOTE 3: I will cross posted this bug report on FreeBSD bugzilla as well: =
https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=3D246168
  NOTE 4: Have done extensive testing of Ubuntu 20.04 Nested virtualisation=
 with just Ubuntu hosts  and OVMF and the nested virtualisation runs correc=
tly, so problem is specific to using FreeBSD / bhyve guest / host.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1876678/+subscriptions

