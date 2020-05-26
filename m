Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7211CE1C2
	for <lists+qemu-devel@lfdr.de>; Mon, 11 May 2020 19:33:34 +0200 (CEST)
Received: from localhost ([::1]:40108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYCJ3-0008Ug-R8
	for lists+qemu-devel@lfdr.de; Mon, 11 May 2020 13:33:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jYCGG-0006sa-Qm
 for qemu-devel@nongnu.org; Mon, 11 May 2020 13:30:40 -0400
Received: from indium.canonical.com ([91.189.90.7]:45308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jYCGF-0000xV-9Q
 for qemu-devel@nongnu.org; Mon, 11 May 2020 13:30:40 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jYCGD-0002ew-5u
 for <qemu-devel@nongnu.org>; Mon, 11 May 2020 17:30:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 27F272E8105
 for <qemu-devel@nongnu.org>; Mon, 11 May 2020 17:30:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2020 17:23:22 -0000
From: Alexander Bulekov <1878054@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Alexander Bulekov (a1xndr)
Message-Id: <158921780313.11557.11335648957795976711.malonedeb@wampee.canonical.com>
Subject: [Bug 1878054] [NEW] Hang with high CPU usage in sdhci_data_transfer
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fbdff7602bd10fb883bf7e2ddcc7fd5a16f60398";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 5ab1ed8a6d417101c99e3d02ca9310c1a7201c84
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/11 11:35:34
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
Reply-To: Bug 1878054 <1878054@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Hello,
While fuzzing, I found an input that causes QEMU to hang with 100% CPU usag=
e.
I have waited several minutes, and QEMU is still unresponsive. Using gdb, It
appears that it is stuck in an sdhci_data_transfer:

#0   memory_region_access_valid (mr=3D<optimized out>, addr=3D0x10284920, s=
ize=3D<optimized out>, is_write=3D0xff, attrs=3D...) at /home/alxndr/Develo=
pment/qemu/memory.c:1378
#1   memory_region_dispatch_write (mr=3D<optimized out>, addr=3D<optimized =
out>, data=3D<optimized out>, op=3DMO_32, attrs=3D...) at /home/alxndr/Deve=
lopment/qemu/memory.c:1463
#2   flatview_write_continue (fv=3D<optimized out>, addr=3D0x10284920, attr=
s=3D..., ptr=3D<optimized out>, len=3D0xb7, addr1=3D0x5555582798e0, l=3D<op=
timized out>, mr=3D0x5555582798e0 <io_mem_unassigned>) at /home/alxndr/Deve=
lopment/qemu/exec.c:3137
#3   flatview_write (fv=3D0x606000045da0, addr=3D<optimized out>, attrs=3D.=
.., buf=3D<optimized out>, len=3D<optimized out>) at /home/alxndr/Developme=
nt/qemu/exec.c:3177
#4   address_space_write (as=3D<optimized out>, addr=3D<optimized out>, att=
rs=3D..., buf=3D0xaaaab04f325, len=3D0x4) at /home/alxndr/Development/qemu/=
exec.c:3268
#5   address_space_rw (as=3D0x5555572509ac <unassigned_mem_ops+44>, addr=3D=
0x5555582798e0, attrs=3D..., attrs@entry=3D..., buf=3D0xaaaab04f325, len=3D=
0x4, is_write=3D0xb8, is_write@entry=3D0x1) at
/home/alxndr/Development/qemu/exec.c:3278
#6   dma_memory_rw_relaxed (as=3D0x5555572509ac <unassigned_mem_ops+44>, ad=
dr=3D0x5555582798e0, buf=3D0xaaaab04f325, len=3D0x4, dir=3DDMA_DIRECTION_FR=
OM_DEVICE) at /home/alxndr/Development/qemu/include/sysemu/dma.h:87
#7   dma_memory_rw (as=3D0x5555572509ac <unassigned_mem_ops+44>, addr=3D0x5=
555582798e0, buf=3D0xaaaab04f325, len=3D0x4, dir=3DDMA_DIRECTION_FROM_DEVIC=
E) at /home/alxndr/Development/qemu/include/sysemu/dma.h:110
#8   dma_memory_write (as=3D0x5555572509ac <unassigned_mem_ops+44>, addr=3D=
0x5555582798e0, buf=3D0xaaaab04f325, len=3D0x4) at /home/alxndr/Development=
/qemu/include/sysemu/dma.h:122
#9   sdhci_sdma_transfer_multi_blocks (s=3D<optimized out>) at /home/alxndr=
/Development/qemu/hw/sd/sdhci.c:618
#10  sdhci_data_transfer (opaque=3D0x61e000021080) at /home/alxndr/Developm=
ent/qemu/hw/sd/sdhci.c:891
#11  sdhci_send_command (s=3D0x61e000021080) at /home/alxndr/Development/qe=
mu/hw/sd/sdhci.c:364
#12  sdhci_write (opaque=3D<optimized out>, offset=3D0xc, val=3D<optimized =
out>, size=3D<optimized out>) at /home/alxndr/Development/qemu/hw/sd/sdhci.=
c:1158
#13  memory_region_write_accessor (mr=3D<optimized out>, addr=3D<optimized =
out>, value=3D<optimized out>, size=3D<optimized out>, shift=3D<optimized o=
ut>, mask=3D<optimized out>, attrs=3D...) at
/home/alxndr/Development/qemu/memory.c:483
#14  access_with_adjusted_size (addr=3D<optimized out>, value=3D<optimized =
out>, size=3D<optimized out>, access_size_min=3D<optimized out>, access_siz=
e_max=3D<optimized out>, access_fn=3D<optimized out>, mr=3D0x61e0000219f0, =
attrs=3D...) at /home/alxndr/Development/qemu/memory.c:544
#15  memory_region_dispatch_write (mr=3D<optimized out>, addr=3D<optimized =
out>, data=3D0x1ffe0ff, op=3D<optimized out>, attrs=3D...) at /home/alxndr/=
Development/qemu/memory.c:1476
#16  flatview_write_continue (fv=3D<optimized out>, addr=3D0xe106800c, attr=
s=3D..., ptr=3D<optimized out>, len=3D0xff3, addr1=3D0x5555582798e0, l=3D<o=
ptimized out>, mr=3D0x61e0000219f0) at /home/alxndr/Development/qemu/exec.c=
:3137
#17  flatview_write (fv=3D0x606000045da0, addr=3D<optimized out>, attrs=3D.=
.., buf=3D<optimized out>, len=3D<optimized out>) at /home/alxndr/Developme=
nt/qemu/exec.c:3177
#18  address_space_write (as=3D<optimized out>, addr=3D<optimized out>, att=
rs=3D..., attrs@entry=3D..., buf=3D0xaaaab04f325, buf@entry=3D0x62100008ad0=
0, len=3D0x4) at /home/alxndr/Development/qemu/exec.c:3268
#19  qtest_process_command (chr=3D<optimized out>, chr@entry=3D0x55555827c0=
40 <qtest_chr>, words=3D<optimized out>) at /home/alxndr/Development/qemu/q=
test.c:567
#20  qtest_process_inbuf (chr=3D0x55555827c040 <qtest_chr>, inbuf=3D0x61900=
000f640) at /home/alxndr/Development/qemu/qtest.c:710


I am attaching the qtest commands for reproducing it.
I can reproduce it in a qemu 5.0 build using:

qemu-system-i386 -M pc-q35-5.0 -qtest stdio -device sdhci-pci,sd-spec-
version=3D3 -device sd-card,drive=3Dmydrive -drive if=3Dsd,index=3D0,file=
=3Dnull-
co://,format=3Draw,id=3Dmydrive -nographic -nographic -serial none -monitor
none < attachment

Please let me know if I can provide any further info.
-Alex

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1878054

Title:
  Hang with high CPU usage in sdhci_data_transfer

Status in QEMU:
  New

Bug description:
  Hello,
  While fuzzing, I found an input that causes QEMU to hang with 100% CPU us=
age.
  I have waited several minutes, and QEMU is still unresponsive. Using gdb,=
 It
  appears that it is stuck in an sdhci_data_transfer:

  #0   memory_region_access_valid (mr=3D<optimized out>, addr=3D0x10284920,=
 size=3D<optimized out>, is_write=3D0xff, attrs=3D...) at /home/alxndr/Deve=
lopment/qemu/memory.c:1378
  #1   memory_region_dispatch_write (mr=3D<optimized out>, addr=3D<optimize=
d out>, data=3D<optimized out>, op=3DMO_32, attrs=3D...) at /home/alxndr/De=
velopment/qemu/memory.c:1463
  #2   flatview_write_continue (fv=3D<optimized out>, addr=3D0x10284920, at=
trs=3D..., ptr=3D<optimized out>, len=3D0xb7, addr1=3D0x5555582798e0, l=3D<=
optimized out>, mr=3D0x5555582798e0 <io_mem_unassigned>) at /home/alxndr/De=
velopment/qemu/exec.c:3137
  #3   flatview_write (fv=3D0x606000045da0, addr=3D<optimized out>, attrs=
=3D..., buf=3D<optimized out>, len=3D<optimized out>) at /home/alxndr/Devel=
opment/qemu/exec.c:3177
  #4   address_space_write (as=3D<optimized out>, addr=3D<optimized out>, a=
ttrs=3D..., buf=3D0xaaaab04f325, len=3D0x4) at /home/alxndr/Development/qem=
u/exec.c:3268
  #5   address_space_rw (as=3D0x5555572509ac <unassigned_mem_ops+44>, addr=
=3D0x5555582798e0, attrs=3D..., attrs@entry=3D..., buf=3D0xaaaab04f325, len=
=3D0x4, is_write=3D0xb8, is_write@entry=3D0x1) at
  /home/alxndr/Development/qemu/exec.c:3278
  #6   dma_memory_rw_relaxed (as=3D0x5555572509ac <unassigned_mem_ops+44>, =
addr=3D0x5555582798e0, buf=3D0xaaaab04f325, len=3D0x4, dir=3DDMA_DIRECTION_=
FROM_DEVICE) at /home/alxndr/Development/qemu/include/sysemu/dma.h:87
  #7   dma_memory_rw (as=3D0x5555572509ac <unassigned_mem_ops+44>, addr=3D0=
x5555582798e0, buf=3D0xaaaab04f325, len=3D0x4, dir=3DDMA_DIRECTION_FROM_DEV=
ICE) at /home/alxndr/Development/qemu/include/sysemu/dma.h:110
  #8   dma_memory_write (as=3D0x5555572509ac <unassigned_mem_ops+44>, addr=
=3D0x5555582798e0, buf=3D0xaaaab04f325, len=3D0x4) at /home/alxndr/Developm=
ent/qemu/include/sysemu/dma.h:122
  #9   sdhci_sdma_transfer_multi_blocks (s=3D<optimized out>) at /home/alxn=
dr/Development/qemu/hw/sd/sdhci.c:618
  #10  sdhci_data_transfer (opaque=3D0x61e000021080) at /home/alxndr/Develo=
pment/qemu/hw/sd/sdhci.c:891
  #11  sdhci_send_command (s=3D0x61e000021080) at /home/alxndr/Development/=
qemu/hw/sd/sdhci.c:364
  #12  sdhci_write (opaque=3D<optimized out>, offset=3D0xc, val=3D<optimize=
d out>, size=3D<optimized out>) at /home/alxndr/Development/qemu/hw/sd/sdhc=
i.c:1158
  #13  memory_region_write_accessor (mr=3D<optimized out>, addr=3D<optimize=
d out>, value=3D<optimized out>, size=3D<optimized out>, shift=3D<optimized=
 out>, mask=3D<optimized out>, attrs=3D...) at
  /home/alxndr/Development/qemu/memory.c:483
  #14  access_with_adjusted_size (addr=3D<optimized out>, value=3D<optimize=
d out>, size=3D<optimized out>, access_size_min=3D<optimized out>, access_s=
ize_max=3D<optimized out>, access_fn=3D<optimized out>, mr=3D0x61e0000219f0=
, attrs=3D...) at /home/alxndr/Development/qemu/memory.c:544
  #15  memory_region_dispatch_write (mr=3D<optimized out>, addr=3D<optimize=
d out>, data=3D0x1ffe0ff, op=3D<optimized out>, attrs=3D...) at /home/alxnd=
r/Development/qemu/memory.c:1476
  #16  flatview_write_continue (fv=3D<optimized out>, addr=3D0xe106800c, at=
trs=3D..., ptr=3D<optimized out>, len=3D0xff3, addr1=3D0x5555582798e0, l=3D=
<optimized out>, mr=3D0x61e0000219f0) at /home/alxndr/Development/qemu/exec=
.c:3137
  #17  flatview_write (fv=3D0x606000045da0, addr=3D<optimized out>, attrs=
=3D..., buf=3D<optimized out>, len=3D<optimized out>) at /home/alxndr/Devel=
opment/qemu/exec.c:3177
  #18  address_space_write (as=3D<optimized out>, addr=3D<optimized out>, a=
ttrs=3D..., attrs@entry=3D..., buf=3D0xaaaab04f325, buf@entry=3D0x62100008a=
d00, len=3D0x4) at /home/alxndr/Development/qemu/exec.c:3268
  #19  qtest_process_command (chr=3D<optimized out>, chr@entry=3D0x55555827=
c040 <qtest_chr>, words=3D<optimized out>) at /home/alxndr/Development/qemu=
/qtest.c:567
  #20  qtest_process_inbuf (chr=3D0x55555827c040 <qtest_chr>, inbuf=3D0x619=
00000f640) at /home/alxndr/Development/qemu/qtest.c:710

  =

  I am attaching the qtest commands for reproducing it.
  I can reproduce it in a qemu 5.0 build using:

  qemu-system-i386 -M pc-q35-5.0 -qtest stdio -device sdhci-pci,sd-spec-
  version=3D3 -device sd-card,drive=3Dmydrive -drive if=3Dsd,index=3D0,file
  =3Dnull-co://,format=3Draw,id=3Dmydrive -nographic -nographic -serial none
  -monitor none < attachment

  Please let me know if I can provide any further info.
  -Alex

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1878054/+subscriptions

