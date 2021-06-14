Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 327173A727D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 01:32:38 +0200 (CEST)
Received: from localhost ([::1]:55734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsw4K-0006JW-R2
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 19:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lsw2e-0004vk-SW
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 19:30:52 -0400
Received: from indium.canonical.com ([91.189.90.7]:41676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lsw2b-00077a-Pm
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 19:30:52 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lsw2W-00060o-FZ
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 23:30:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 53DEE2E8086
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 23:30:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Jun 2021 23:22:47 -0000
From: Alexander Bulekov <1878323@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Alexander Bulekov (a1xndr)
References: <158933876258.19393.11272084108763872012.malonedeb@chaenomeles.canonical.com>
Message-Id: <162371296780.10386.8116398012633007367.malone@soybean.canonical.com>
Subject: [Bug 1878323] Re: Assertion-failure in usb_detach
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ed184eb8c3e03c8a0c3f47e69a5c546619a1af7c"; Instance="production"
X-Launchpad-Hash: a836ab4cce1c5f6b045459b8d3e6f80ddb09bc0a
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1878323 <1878323@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

OSS-Fuzz never found it, though we are fuzzing a slightly different ehci
configuration there. I made a note of the arguments we should start
fuzzing on OSS-Fuzz, but I think this is safe to close.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1878323

Title:
  Assertion-failure in usb_detach

Status in QEMU:
  Incomplete

Bug description:
  Hello,
  While fuzzing, I found an input that triggers an assertion-failure in usb=
_detach

  /home/alxndr/Development/qemu/hw/usb/core.c:69: void usb_detach(USBPort *=
): Assertion `dev->state !=3D USB_STATE_NOTATTACHED' failed.
  #3  0x00007ffff6866092 in __GI___assert_fail (assertion=3D0x555557fd2040 =
<str> "dev->state !=3D USB_STATE_NOTATTACHED", file=3D0x555557fd1ec0 <str> =
"/home/alxndr/Development/qemu/hw/usb/core.c", line=3D0x45, function=3D0x55=
5557fd2000 <__PRETTY_FUNCTION__.usb_detach> "void usb_detach(USBPort *)") a=
t assert.c:101
  #4  0x000055555723f0ce in usb_detach (port=3D0x62100002df30) at /home/alx=
ndr/Development/qemu/hw/usb/core.c:69
  #5  0x00005555572a05a4 in ehci_reset (opaque=3D0x62100002d9f0) at /home/a=
lxndr/Development/qemu/hw/usb/hcd-ehci.c:863
  #6  0x00005555572bf941 in ehci_opreg_write (ptr=3D0x62100002d9f0, addr=3D=
0x0, val=3D0xbebebebe, size=3D0x4) at /home/alxndr/Development/qemu/hw/usb/=
hcd-ehci.c:1032
  #7  0x00005555564938b5 in memory_region_write_accessor (mr=3D0x62100002dc=
b0, addr=3D0x0, value=3D0x7fffffffaad0, size=3D0x4, shift=3D0x0, mask=3D0xf=
fffffff, attrs=3D...) at /home/alxndr/Development/qemu/memory.c:483
  #8  0x000055555649328a in access_with_adjusted_size (addr=3D0x0, value=3D=
0x7fffffffaad0, size=3D0x4, access_size_min=3D0x1, access_size_max=3D0x4, a=
ccess_fn=3D0x555556493360 <memory_region_write_accessor>, mr=3D0x62100002dc=
b0, attrs=3D...) at /home/alxndr/Development/qemu/memory.c:544
  #9  0x0000555556491df6 in memory_region_dispatch_write (mr=3D0x62100002dc=
b0, addr=3D0x0, data=3D0xbebebebe, op=3DMO_32, attrs=3D...) at /home/alxndr=
/Development/qemu/memory.c:1476
  #10 0x00005555562cbbf4 in flatview_write_continue (fv=3D0x60600003e600, a=
ddr=3D0xe0000020, attrs=3D..., ptr=3D0x625000260000, len=3D0xfe0, addr1=3D0=
x0, l=3D0x4, mr=3D0x62100002dcb0) at /home/alxndr/Development/qemu/exec.c:3=
137
  #11 0x00005555562bbad9 in flatview_write (fv=3D0x60600003e600, addr=3D0xe=
0000000, attrs=3D..., buf=3D0x625000260000, len=3D0x1000) at /home/alxndr/D=
evelopment/qemu/exec.c:3177
  #12 0x00005555562bb609 in address_space_write (as=3D0x62100002d328, addr=
=3D0xe0000000, attrs=3D..., buf=3D0x625000260000, len=3D0x1000) at /home/al=
xndr/Development/qemu/exec.c:3268
  #13 0x00005555562c06a6 in address_space_unmap (as=3D0x62100002d328, buffe=
r=3D0x625000260000, len=3D0x1000, is_write=3D0x1, access_len=3D0x1000) at /=
home/alxndr/Development/qemu/exec.c:3592
  #14 0x0000555557257d73 in dma_memory_unmap (as=3D0x62100002d328, buffer=
=3D0x625000260000, len=3D0x1000, dir=3DDMA_DIRECTION_FROM_DEVICE, access_le=
n=3D0x1000) at /home/alxndr/Development/qemu/include/sysemu/dma.h:145
  #15 0x0000555557257c57 in usb_packet_unmap (p=3D0x6110000484c0, sgl=3D0x6=
11000048548) at /home/alxndr/Development/qemu/hw/usb/libhw.c:65
  #16 0x00005555572a5953 in ehci_free_packet (p=3D0x611000048480) at /home/=
alxndr/Development/qemu/hw/usb/hcd-ehci.c:536
  #17 0x00005555572a4ed4 in ehci_cancel_queue (q=3D0x60d000004f10) at /home=
/alxndr/Development/qemu/hw/usb/hcd-ehci.c:584
  #18 0x00005555572a49ab in ehci_free_queue (q=3D0x60d000004f10, warn=3D0x0=
) at /home/alxndr/Development/qemu/hw/usb/hcd-ehci.c:611
  #19 0x00005555572b102d in ehci_queues_rip_device (ehci=3D0x62100002d9f0, =
dev=3D0x623000001d00, async=3D0x1) at /home/alxndr/Development/qemu/hw/usb/=
hcd-ehci.c:674
  #20 0x00005555572af7a3 in ehci_detach (port=3D0x62100002df78) at /home/al=
xndr/Development/qemu/hw/usb/hcd-ehci.c:733
  #21 0x000055555723f15c in usb_detach (port=3D0x62100002df78) at /home/alx=
ndr/Development/qemu/hw/usb/core.c:70
  #22 0x00005555572a05a4 in ehci_reset (opaque=3D0x62100002d9f0) at /home/a=
lxndr/Development/qemu/hw/usb/hcd-ehci.c:863
  #23 0x00005555572bf941 in ehci_opreg_write (ptr=3D0x62100002d9f0, addr=3D=
0x0, val=3D0xbebebebe, size=3D0x4) at /home/alxndr/Development/qemu/hw/usb/=
hcd-ehci.c:1032
  #24 0x00005555564938b5 in memory_region_write_accessor (mr=3D0x62100002dc=
b0, addr=3D0x0, value=3D0x7fffffffc410, size=3D0x4, shift=3D0x0, mask=3D0xf=
fffffff, attrs=3D...) at /home/alxndr/Development/qemu/memory.c:483
  #25 0x000055555649328a in access_with_adjusted_size (addr=3D0x0, value=3D=
0x7fffffffc410, size=3D0x4, access_size_min=3D0x1, access_size_max=3D0x4, a=
ccess_fn=3D0x555556493360 <memory_region_write_accessor>, mr=3D0x62100002dc=
b0, attrs=3D...) at /home/alxndr/Development/qemu/memory.c:544
  #26 0x0000555556491df6 in memory_region_dispatch_write (mr=3D0x62100002dc=
b0, addr=3D0x0, data=3D0xbebebebe, op=3DMO_32, attrs=3D...) at /home/alxndr=
/Development/qemu/memory.c:1476
  #27 0x00005555562cbbf4 in flatview_write_continue (fv=3D0x60600003e600, a=
ddr=3D0xe0000020, attrs=3D..., ptr=3D0x625000260000, len=3D0xfe0, addr1=3D0=
x0, l=3D0x4, mr=3D0x62100002dcb0) at /home/alxndr/Development/qemu/exec.c:3=
137
  #28 0x00005555562bbad9 in flatview_write (fv=3D0x60600003e600, addr=3D0xe=
0000000, attrs=3D..., buf=3D0x625000260000, len=3D0x1000) at /home/alxndr/D=
evelopment/qemu/exec.c:3177
  #29 0x00005555562bb609 in address_space_write (as=3D0x62100002d328, addr=
=3D0xe0000000, attrs=3D..., buf=3D0x625000260000, len=3D0x1000) at /home/al=
xndr/Development/qemu/exec.c:3268
  #30 0x00005555562c06a6 in address_space_unmap (as=3D0x62100002d328, buffe=
r=3D0x625000260000, len=3D0x1000, is_write=3D0x1, access_len=3D0x1000) at /=
home/alxndr/Development/qemu/exec.c:3592
  #31 0x0000555557257d73 in dma_memory_unmap (as=3D0x62100002d328, buffer=
=3D0x625000260000, len=3D0x1000, dir=3DDMA_DIRECTION_FROM_DEVICE, access_le=
n=3D0x1000) at /home/alxndr/Development/qemu/include/sysemu/dma.h:145
  #32 0x0000555557257c57 in usb_packet_unmap (p=3D0x6110000484c0, sgl=3D0x6=
11000048548) at /home/alxndr/Development/qemu/hw/usb/libhw.c:65
  #33 0x00005555572aa87e in ehci_execute_complete (q=3D0x60d000004f10) at /=
home/alxndr/Development/qemu/hw/usb/hcd-ehci.c:1324
  #34 0x00005555572a7b8c in ehci_state_executing (q=3D0x60d000004f10) at /h=
ome/alxndr/Development/qemu/hw/usb/hcd-ehci.c:1973
  #35 0x00005555572b3685 in ehci_advance_state (ehci=3D0x62100002d9f0, asyn=
c=3D0x1) at /home/alxndr/Development/qemu/hw/usb/hcd-ehci.c:2094
  #36 0x00005555572b2db9 in ehci_advance_async_state (ehci=3D0x62100002d9f0=
) at /home/alxndr/Development/qemu/hw/usb/hcd-ehci.c:2152
  #37 0x00005555572a29c3 in ehci_work_bh (opaque=3D0x62100002d9f0) at /home=
/alxndr/Development/qemu/hw/usb/hcd-ehci.c:2320
  #38 0x0000555557bfba60 in aio_bh_call (bh=3D0x60400001cd90) at /home/alxn=
dr/Development/qemu/util/async.c:136

  =

  I can reproduce it in qemu 5.0 using the commands in the attachment:

  qemu-system-i386 \
  -qtest stdio -nographic -monitor none -serial none \
  -M pc-q35-5.0 -machine q35 \
  -device ich9-usb-ehci1,bus=3Dpcie.0,addr=3D1d.7,multifunction=3Don,id=3Di=
ch9-ehci-1 \
  -device ich9-usb-uhci1,bus=3Dpcie.0,addr=3D1d.0,multifunction=3Don,master=
bus=3Dich9-ehci-1.0,firstport=3D0 \
  -device ich9-usb-uhci2,bus=3Dpcie.0,addr=3D1d.1,multifunction=3Don,master=
bus=3Dich9-ehci-1.0,firstport=3D2 \
  -device ich9-usb-uhci3,bus=3Dpcie.0,addr=3D1d.2,multifunction=3Don,master=
bus=3Dich9-ehci-1.0,firstport=3D4 \
  -drive if=3Dnone,id=3Dusbcdrom,media=3Dcdrom \
  -device usb-tablet,bus=3Dich9-ehci-1.0,port=3D1,usb_version=3D1 \
  -device usb-storage,bus=3Dich9-ehci-1.0,port=3D2,drive=3Dusbcdrom \
  -display none -nodefaults -nographic < attachment

  Please let me know if I can provide any further info.
  -Alex

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1878323/+subscriptions

