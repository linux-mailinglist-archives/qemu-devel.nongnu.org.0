Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A3A327215
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 12:26:59 +0100 (CET)
Received: from localhost ([::1]:35768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGKDy-0008Qr-9M
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 06:26:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lGKBt-0007jT-VI
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 06:24:50 -0500
Received: from indium.canonical.com ([91.189.90.7]:46352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lGKBr-0003eN-IF
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 06:24:49 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lGKBp-0006LN-HF
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 11:24:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 77AE62E8142
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 11:24:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 28 Feb 2021 11:13:43 -0000
From: "Cheolwoo,Myung" <1523811@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: assert usb
X-Launchpad-Bug-Information-Type: Public Security
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: yes
X-Launchpad-Bug-Commenters: cwmyung janitor joveler th-huth
X-Launchpad-Bug-Reporter: Hajin Jang (joveler)
X-Launchpad-Bug-Modifier: Cheolwoo,Myung (cwmyung)
References: <20151208084519.14688.79647.malonedeb@wampee.canonical.com>
Message-Id: <161451082357.13768.8179163753159102043.malone@chaenomeles.canonical.com>
Subject: [Bug 1523811] Re: USB assert failure on dev-storage.c
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="cd61f0bfc5208dd4b58a15e953892eaabba1e0b8"; Instance="production"
X-Launchpad-Hash: 44f1d53e5b62bf32efefcb9d0e12391a3b399942
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1523811 <1523811@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using hypervisor fuzzer, hyfuzz, I found an assertion failure through
nec-usb-xhci emulator.

A malicious guest user/process could use this flaw to abort the QEMU
process on the host, resulting in a denial of service.

This was found in version 5.2.0 (master,
51db2d7cf26d05a961ec0ee0eb773594b32cc4a1)

To reproduce the assertion failure, please run the QEMU with the
following command line.

```

$ qemu-system-i386 -m 512 -drive
file=3D./hyfuzz.img,index=3D0,media=3Ddisk,format=3Draw -drive
if=3Dnone,id=3Dstick,file=3D./usbdisk.img,format=3Draw -device nec-usb-
xhci,id=3Dusb -device usb-storage,bus=3Dusb.0,drive=3Dstick


```


```

qemu-system-i386: ../hw/usb/dev-storage.c:454: void
usb_msd_handle_data(USBDevice *, USBPacket *): Assertion
`le32_to_cpu(s->csw.residue) =3D=3D 0' failed.

#0  0x00007ffff1a60fb7 in __GI_raise (sig=3Dsig@entry=3D0x6) at ../sysdeps/=
unix/sysv/linux/raise.c:51
#1  0x00007ffff1a62921 in __GI_abort () at abort.c:79
#2  0x00007ffff1a5248a in __assert_fail_base (fmt=3D0x7ffff1bd9750 "%s%s%s:=
%u: %s%sAssertion `%s' failed.\n%n", assertion=3Dassertion@entry=3D0x555557=
518dc0 <.str.30> "le32_to_cpu(s->csw.residue) =3D=3D 0", file=3Dfile@entry=
=3D0x5555575189e0 <.str.19> "../hw/usb/dev-storage.c", line=3Dline@entry=3D=
0x1c6, function=3Dfunction@entry=3D0x555557518e20 <__PRETTY_FUNCTION__.usb_=
msd_handle_data> "void usb_msd_handle_data(USBDevice *, USBPacket *)") at a=
ssert.c:92
#3  0x00007ffff1a52502 in __GI___assert_fail (assertion=3D0x555557518dc0 <.=
str.30> "le32_to_cpu(s->csw.residue) =3D=3D 0", file=3D0x5555575189e0 <.str=
.19> "../hw/usb/dev-storage.c", line=3D0x1c6, function=3D0x555557518e20 <__=
PRETTY_FUNCTION__.usb_msd_handle_data> "void usb_msd_handle_data(USBDevice =
*, USBPacket *)") at assert.c:101
#4  0x0000555556299749 in usb_msd_handle_data (dev=3D<optimized out>, p=3D<=
optimized out>) at ../hw/usb/dev-storage.c:454
#5  0x00005555563120b3 in usb_device_handle_data (dev=3D0x62300000a900, p=
=3D0x611001da3fc8) at ../hw/usb/bus.c:180
#6  0x000055555610ac07 in usb_process_one (p=3D0x611001da3fc8) at ../hw/usb=
/core.c:406
#7  0x0000555556109d8f in usb_handle_packet (dev=3D0x62300000a900, p=3D<opt=
imized out>) at ../hw/usb/core.c:438
#8  0x000055555687de55 in xhci_submit (xhci=3D<optimized out>, xfer=3D<opti=
mized out>, epctx=3D<optimized out>) at ../hw/usb/hcd-xhci.c:1779
#9  0x000055555687de55 in xhci_fire_transfer (xhci=3D<optimized out>, xfer=
=3D<optimized out>, epctx=3D<optimized out>) at ../hw/usb/hcd-xhci.c:1788
#10 0x000055555687de55 in xhci_kick_epctx (epctx=3D<optimized out>, streami=
d=3D0x0) at ../hw/usb/hcd-xhci.c:1947
#11 0x000055555688c7f6 in xhci_kick_ep (xhci=3D<optimized out>, slotid=3D<o=
ptimized out>, epid=3D<optimized out>, streamid=3D0x0) at ../hw/usb/hcd-xhc=
i.c:1813
#12 0x00005555568943b7 in xhci_doorbell_write (ptr=3D<optimized out>, reg=
=3D0x1, val=3D0x4, size=3D<optimized out>) at ../hw/usb/hcd-xhci.c:3114
#13 0x0000555556c6617a in memory_region_write_accessor (mr=3D<optimized out=
>, addr=3D<optimized out>, value=3D<optimized out>, size=3D<optimized out>,=
 shift=3D<optimized out>, mask=3D<optimized out>, attrs=3D...) at ../softmm=
u/memory.c:491
#14 0x0000555556c65d96 in access_with_adjusted_size (addr=3D<optimized out>=
, value=3D<optimized out>, size=3D<optimized out>, access_size_min=3D<optim=
ized out>, access_size_max=3D<optimized out>, access_fn=3D<optimized out>, =
mr=3D<optimized out>, attrs=3D...)
    at ../softmmu/memory.c:552
#15 0x0000555556c65d96 in memory_region_dispatch_write (mr=3D<optimized out=
>, addr=3D<optimized out>, data=3D<optimized out>, op=3D<optimized out>, at=
trs=3D...) at ../softmmu/memory.c:1501
#16 0x0000555556fb4b90 in flatview_write_continue (fv=3D0x6060002bf460, add=
r=3D0xfebf2004, attrs=3D..., ptr=3D<optimized out>, len=3D0x4, addr1=3D0x7f=
ff775fa810, l=3D<optimized out>, mr=3D0x7fff74937610) at ../softmmu/physmem=
.c:2776
#17 0x0000555556fb9e3d in flatview_write (fv=3D<optimized out>, addr=3D<opt=
imized out>, attrs=3D..., len=3D0x4, buf=3D<optimized out>) at ../softmmu/p=
hysmem.c:2816
#18 0x0000555556fb9e3d in subpage_write (opaque=3D<optimized out>, addr=3D<=
optimized out>, value=3D<optimized out>, len=3D<optimized out>, attrs=3D...=
) at ../softmmu/physmem.c:2482
#19 0x0000555556c668ff in memory_region_write_with_attrs_accessor (mr=3D<op=
timized out>, addr=3D<optimized out>, value=3D<optimized out>, size=3D<opti=
mized out>, shift=3D<optimized out>, mask=3D<optimized out>, attrs=3D...) a=
t ../softmmu/memory.c:511
#20 0x0000555556c65de6 in access_with_adjusted_size (addr=3D<optimized out>=
, size=3D<optimized out>, access_size_min=3D<optimized out>, access_size_ma=
x=3D<optimized out>, mr=3D<optimized out>, attrs=3D..., value=3D<optimized =
out>, access_fn=3D<optimized out>)
    at ../softmmu/memory.c:552
#21 0x0000555556c65de6 in memory_region_dispatch_write (mr=3D<optimized out=
>, addr=3D<optimized out>, data=3D<optimized out>, op=3D<optimized out>, at=
trs=3D...) at ../softmmu/memory.c:1508
#22 0x0000555556cd2796 in io_writex (iotlbentry=3D<optimized out>, mmu_idx=
=3D<optimized out>, val=3D<optimized out>, addr=3D<optimized out>, retaddr=
=3D<optimized out>, op=3D4054192055, env=3D<optimized out>) at ../accel/tcg=
/cputlb.c:1425
#23 0x0000555556cd2796 in store_helper (env=3D<optimized out>, addr=3D<opti=
mized out>, val=3D0x4, oi=3D<optimized out>, retaddr=3D<optimized out>, op=
=3DMO_32) at ../accel/tcg/cputlb.c:2444
#24 0x0000555556cd2796 in helper_le_stl_mmu (env=3D<optimized out>, addr=3D=
<optimized out>, val=3D0x1ca6828, oi=3D<optimized out>, retaddr=3D0x7fff97c=
4ce9f) at ../accel/tcg/cputlb.c:2510
#25 0x00007fff97c4ce9f in code_gen_buffer ()
#26 0x0000555556f3ea44 in cpu_tb_exec (cpu=3D0x62e000000400, itb=3D<optimiz=
ed out>, tb_exit=3D0x7fff775fbf20) at ../accel/tcg/cpu-exec.c:191
#27 0x0000555556f40cf4 in cpu_loop_exec_tb (tb=3D<optimized out>, tb_exit=
=3D<optimized out>, cpu=3D<optimized out>, last_tb=3D<optimized out>) at ..=
/accel/tcg/cpu-exec.c:672
#28 0x0000555556f40cf4 in cpu_exec (cpu=3D0x62e000000400) at ../accel/tcg/c=
pu-exec.c:797
#29 0x0000555556c5cd73 in tcg_cpus_exec (cpu=3D0x62e000000400) at ../accel/=
tcg/tcg-accel-ops.c:60
#30 0x0000555556cfd60d in mttcg_cpu_thread_fn (arg=3D0x62e000000400) at ../=
accel/tcg/tcg-accel-ops-mttcg.c:70
#31 0x00005555573f75cf in qemu_thread_start (args=3D0x6030000d9870) at ../u=
til/qemu-thread-posix.c:521
#32 0x0000555556022f5f in __asan::AsanThread::ThreadStart(unsigned long, __=
sanitizer::atomic_uintptr_t*) ()
#33 0x00007ffff243e6db in start_thread (arg=3D0x7fff775ff700) at pthread_cr=
eate.c:463
#34 0x00007ffff1b4371f in clone () at ../sysdeps/unix/sysv/linux/x86_64/clo=
ne.S:95

```


** Attachment added: "fuzzer"
   https://bugs.launchpad.net/qemu/+bug/1523811/+attachment/5470004/+files/=
attachment.tar.gz

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1523811

Title:
  USB assert failure on dev-storage.c

Status in QEMU:
  Expired

Bug description:
  On executing the attached python script in the guest OS, QEMU dies
  with assert failure:

  [run python script in guest root shell]
  # python a.py

  [host message]
  qemu-system-x86_64: hw/usb/dev-storage.c:445: usb_msd_handle_data: Assert=
ion `le32_to_cpu(s->csw.residue) =3D=3D 0' failed.
  Aborted (core dumped)

  =

  When I detach the kernel driver and send CBW and reattach it again, witho=
ut conforming to the command/data/status protocol, QEMU dies.
  I think this is due to misimplementation of Command/Data/Status protocol =
in Bulk-only transfer.
  This kind of assert failure can be misused by malwares to avoid being ana=
lyzed by terminating only in the virtual environments and still execute the=
 malicious code in real machines.
  Before running python script, make sure to change a.py that it should poi=
nts to usb mass storage's vid and pid.

  QEMU was running on these environment : =

  [CPU model]    Intel(R) Core(TM) i5-4590 CPU @ 3.30GHz
  [qemu version] QEMU 2.5.0-rc2 (compiled from source, gcc 4.8.4)
  [host info]    Ubuntu 14.04.3, x86_64, 3.19.0-32-generic
  [guest info]   Ubuntu 14.04.3, x86_64, 3.19.0-28-generic
  [QEMU argument]
  x86_64-softmmu/qemu-system-x86_64 -hda /media/hdd/img/ubuntu1404.qcow2.5 \
  	-m 512 \
  	--usbdevice disk:format=3Dqcow2:../usb.img.5 \
  	--enable-kvm

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1523811/+subscriptions

