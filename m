Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 917B03760AC
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 08:47:28 +0200 (CEST)
Received: from localhost ([::1]:47996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leuGl-0005uG-IN
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 02:47:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leuFQ-0005Tp-9R
 for qemu-devel@nongnu.org; Fri, 07 May 2021 02:46:04 -0400
Received: from indium.canonical.com ([91.189.90.7]:49568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leuF3-0001i5-AD
 for qemu-devel@nongnu.org; Fri, 07 May 2021 02:46:04 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leuF2-00027O-14
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 06:45:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 06FB12E8136
 for <qemu-devel@nongnu.org>; Fri,  7 May 2021 06:45:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 May 2021 06:38:24 -0000
From: =?utf-8?q?Eugenio_P=C3=A9rez?= <1885175@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: iommu
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: eperezma th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Eugenio_P=C3=A9rez_=28eperezma=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Eugenio_P=C3=A9rez_=28eperezma=29?=
References: <159311159018.14164.3191713731245794696.malonedeb@wampee.canonical.com>
Message-Id: <162036950562.14295.12479052355353493850.launchpad@soybean.canonical.com>
Subject: [Bug 1885175] Re: memory.c range assertion hit at full invalidating
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 038fb47b3ba377352e02084773734494d6c52815
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1885175 <1885175@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Incomplete =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1885175

Title:
  memory.c range assertion hit at full invalidating

Status in QEMU:
  Fix Released

Bug description:
  I am able to hit this assertion when a Red Hat 7 guest virtio_net
  device raises an "Invalidation" of all the TLB entries. This happens
  in the guest's startup if 'intel_iommu=3Don' argument is passed to the
  guest kernel and right IOMMU/ATS devices are declared in qemu's
  command line.

  Command line: /home/qemu/x86_64-softmmu/qemu-system-x86_64 -name
  guest=3Drhel7-test,debug-threads=3Don -machine
  pc-q35-5.1,accel=3Dkvm,usb=3Doff,dump-guest-core=3Doff,kernel_irqchip=3Ds=
plit
  -cpu
  Broadwell,vme=3Don,ss=3Don,vmx=3Don,f16c=3Don,rdrand=3Don,hypervisor=3Don=
,arat=3Don
  ,tsc-adjust=3Don,umip=3Don,arch-
  capabilities=3Don,xsaveopt=3Don,pdpe1gb=3Don,abm=3Don,skip-l1dfl-
  vmentry=3Don,rtm=3Don,hle=3Don -m 8096 -realtime mlock=3Doff -smp
  2,sockets=3D2,cores=3D1,threads=3D1 -uuid d022ecbf-679e-4755-87ce-
  eb87fc5bbc5d -display none -no-user-config -nodefaults -rtc
  base=3Dutc,driftfix=3Dslew -global kvm-pit.lost_tick_policy=3Ddelay -no-h=
pet
  -no-shutdown -global ICH9-LPC.disable_s3=3D1 -global
  ICH9-LPC.disable_s4=3D1 -boot strict=3Don -device intel-iommu,intremap=3D=
on
  ,device-iotlb=3Don -device pcie-root-
  port,port=3D0x8,chassis=3D1,id=3Dpci.1,bus=3Dpcie.0,multifunction=3Don,ad=
dr=3D0x1
  -device pcie-root-
  port,port=3D0x9,chassis=3D2,id=3Dpci.2,bus=3Dpcie.0,addr=3D0x1.0x1 -devic=
e pcie-
  root-port,port=3D0xa,chassis=3D3,id=3Dpci.3,bus=3Dpcie.0,addr=3D0x1.0x2 -=
device
  pcie-root-port,port=3D0xb,chassis=3D4,id=3Dpci.4,bus=3Dpcie.0,addr=3D0x1.=
0x3
  -device pcie-root-
  port,port=3D0xc,chassis=3D5,id=3Dpci.5,bus=3Dpcie.0,addr=3D0x1.0x4 -devic=
e pcie-
  root-port,port=3D0xd,chassis=3D6,id=3Dpci.6,bus=3Dpcie.0,addr=3D0x1.0x5 -=
device
  pcie-root-port,port=3D0xe,chassis=3D7,id=3Dpci.7,bus=3Dpcie.0,addr=3D0x1.=
0x6
  -device qemu-xhci,p2=3D15,p3=3D15,id=3Dusb,bus=3Dpci.2,addr=3D0x0 -device
  virtio-serial-pci,id=3Dvirtio-serial0,bus=3Dpci.3,addr=3D0x0 -drive
  file=3D/home/virtio-test2.qcow2,format=3Dqcow2,if=3Dnone,id=3Ddrive-virti=
o-
  disk0 -device virtio-blk-pci,scsi=3Doff,bus=3Dpci.4,addr=3D0x0,drive=3Ddr=
ive-
  virtio-disk0,id=3Dvirtio-disk0,bootindex=3D1 -netdev
  tap,id=3Dhostnet0,vhost=3Don,vhostforce=3Don -device virtio-net-
  pci,netdev=3Dhostnet0,id=3Dnet0,mac=3D52:54:00:0d:1d:f2,bus=3Dpci.1,addr=
=3D0x0,iommu_platform=3Don,ats=3Don
  -device virtio-balloon-pci,id=3Dballoon0,bus=3Dpci.5,addr=3D0x0 -object r=
ng-
  random,id=3Dobjrng0,filename=3D/dev/urandom -device virtio-rng-
  pci,rng=3Dobjrng0,id=3Drng0,bus=3Dpci.6,addr=3D0x0 -s -msg timestamp=3Don

  Full backtrace:

  #0  0x00007ffff521370f in raise () at /lib64/libc.so.6
  #1  0x00007ffff51fdb25 in abort () at /lib64/libc.so.6
  #2  0x00007ffff51fd9f9 in _nl_load_domain.cold.0 () at /lib64/libc.so.6
  #3  0x00007ffff520bcc6 in .annobin_assert.c_end () at /lib64/libc.so.6
  #4  0x0000555555888171 in memory_region_notify_one (notifier=3D0x7ffde05d=
fde8, entry=3D0x7ffde5dfe200) at /home/qemu/memory.c:1918
  #5  0x0000555555888247 in memory_region_notify_iommu (iommu_mr=3D0x555556=
f6c0b0, iommu_idx=3D0, entry=3D...) at /home/qemu/memory.c:1941
  #6  0x0000555555951c8d in vtd_process_device_iotlb_desc (s=3D0x5555576090=
00, inv_desc=3D0x7ffde5dfe2d0)
  =C2=A0=C2=A0=C2=A0=C2=A0at /home/qemu/hw/i386/intel_iommu.c:2468
  #7  0x0000555555951e6a in vtd_process_inv_desc (s=3D0x555557609000) at /h=
ome/qemu/hw/i386/intel_iommu.c:2531
  #8  0x0000555555951fa5 in vtd_fetch_inv_desc (s=3D0x555557609000) at /hom=
e/qemu/hw/i386/intel_iommu.c:2563
  #9  0x00005555559520e5 in vtd_handle_iqt_write (s=3D0x555557609000) at /h=
ome/qemu/hw/i386/intel_iommu.c:2590
  #10 0x0000555555952b45 in vtd_mem_write (opaque=3D0x555557609000, addr=3D=
136, val=3D2688, size=3D4) at /home/qemu/hw/i386/intel_iommu.c:2837
  #11 0x0000555555883e17 in memory_region_write_accessor
  =C2=A0=C2=A0=C2=A0=C2=A0(mr=3D0x555557609330, addr=3D136, value=3D0x7ffde=
5dfe478, size=3D4, shift=3D0, mask=3D4294967295, attrs=3D...) at /home/qemu=
/memory.c:483
  #12 0x000055555588401d in access_with_adjusted_size
  =C2=A0=C2=A0=C2=A0=C2=A0(addr=3D136, value=3D0x7ffde5dfe478, size=3D4, ac=
cess_size_min=3D4, access_size_max=3D8, access_fn=3D
  =C2=A0=C2=A0=C2=A0=C2=A00x555555883d38 <memory_region_write_accessor>, mr=
=3D0x555557609330, attrs=3D...) at /home/qemu/memory.c:544
  #13 0x0000555555886f37 in memory_region_dispatch_write (mr=3D0x5555576093=
30, addr=3D136, data=3D2688, op=3DMO_32, attrs=3D...)
  =C2=A0=C2=A0=C2=A0=C2=A0at /home/qemu/memory.c:1476
  #14 0x0000555555827a03 in flatview_write_continue
  =C2=A0=C2=A0=C2=A0=C2=A0(fv=3D0x7ffde00935d0, addr=3D4275634312, attrs=3D=
..., ptr=3D0x7ffff7ff0028, len=3D4, addr1=3D136, l=3D4, mr=3D0x555557609330=
) at /home/qemu/exec.c:3146
  #15 0x0000555555827b48 in flatview_write (fv=3D0x7ffde00935d0, addr=3D427=
5634312, attrs=3D..., buf=3D0x7ffff7ff0028, len=3D4)
  =C2=A0=C2=A0=C2=A0=C2=A0at /home/qemu/exec.c:3186
  #16 0x0000555555827e9d in address_space_write
  =C2=A0=C2=A0=C2=A0=C2=A0(as=3D0x5555567ca640 <address_space_memory>, addr=
=3D4275634312, attrs=3D..., buf=3D0x7ffff7ff0028, len=3D4) at /home/qemu/ex=
ec.c:3277
  #17 0x0000555555827f0a in address_space_rw
  =C2=A0=C2=A0=C2=A0=C2=A0(as=3D0x5555567ca640 <address_space_memory>, addr=
=3D4275634312, attrs=3D..., buf=3D0x7ffff7ff0028, len=3D4, is_write=3Dtrue)
  =C2=A0=C2=A0=C2=A0=C2=A0at /home/qemu/exec.c:3287
  #18 0x000055555589b633 in kvm_cpu_exec (cpu=3D0x555556b65640) at /home/qe=
mu/accel/kvm/kvm-all.c:2511
  #19 0x0000555555876ba8 in qemu_kvm_cpu_thread_fn (arg=3D0x555556b65640) a=
t /home/qemu/cpus.c:1284
  #20 0x0000555555dafff1 in qemu_thread_start (args=3D0x555556b8c3b0) at ut=
il/qemu-thread-posix.c:521
  #21 0x00007ffff55a62de in start_thread () at /lib64/libpthread.so.0
  #22 0x00007ffff52d7e83 in clone () at /lib64/libc.so.6

  --

  If we examinate *entry in frame 4 of backtrace:
  *entry =3D {target_as =3D 0x555556f6c050, iova =3D 0x0, translated_addr =
=3D 0x0, addr_mask =3D 0xffffffffffffffff, perm =3D 0x0}

  Which (I think) tries to invalidate all the TLB registers of the
  device.

  Just deleting that assert is enough for the VM to start and
  communicate using IOMMU, but maybe a better alternative is possible.
  We could move it to the caller functions in other cases than IOMMU
  invalidation, or make it conditional only if not invalidating.

  Guest kernel version: kernel-3.10.0-1151.el7.x86_64

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1885175/+subscriptions

