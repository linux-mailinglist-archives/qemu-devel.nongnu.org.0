Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D6B393137
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 16:44:34 +0200 (CEST)
Received: from localhost ([::1]:58854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmHFR-0002hJ-TG
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 10:44:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lmHBw-0006tJ-Jx
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:40:56 -0400
Received: from indium.canonical.com ([91.189.90.7]:56680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lmHBt-0005l5-GP
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:40:56 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lmHBr-0003Jg-MO
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 14:40:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A45D32E8136
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 14:40:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 May 2021 14:34:41 -0000
From: Thomas Huth <1892966@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159840961185.2736.14207649461351396494.malonedeb@chaenomeles.canonical.com>
Message-Id: <162212608174.7558.9772657220695442370.malone@wampee.canonical.com>
Subject: [Bug 1892966] Re: Null-pointer dereference in blk_bs through
 ide_cancel_dma_sync
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="325c8b1be58d11b29d8346f2c6d59878e7a2e6ff"; Instance="production"
X-Launchpad-Hash: de2f1e3fe54c33d6821975148c8051715a768fcb
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
Reply-To: Bug 1892966 <1892966@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This problem does not trigger anymore for me with the current version of
QEMU. Could you please check whether you can still reproduce it somehow
with the latest version?

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1892966

Title:
  Null-pointer dereference in blk_bs through ide_cancel_dma_sync

Status in QEMU:
  Incomplete

Bug description:
  Hello,
  Reproducer:
  cat << EOF | ./qemu-system-i386 -M pc \
  -drive file=3Dnull-co://,if=3Dnone,format=3Draw,id=3Ddisk0 \
  -device ide-hd,drive=3Ddisk0,bus=3Dide.1,unit=3D1 \
  -display none -nodefaults -display none -qtest stdio -accel qtest
  outw 0x176 0x35b3
  outb 0x376 0x5f
  outb 0x376 0x40
  outl 0xcf8 0x80000904
  outl 0xcfc 0x5c0525b7
  outb 0x176 0x0
  outl 0xcf8 0x8000091e
  outl 0xcfc 0xd7580584
  write 0x187 0x1 0x34
  write 0x277 0x1 0x34
  write 0x44f 0x1 0x5c
  write 0x53f 0x1 0x5c
  write 0x717 0x1 0x34
  write 0x807 0x1 0x34
  write 0x9df 0x1 0x5c
  write 0xbb7 0x1 0x34
  write 0xca7 0x1 0x34
  write 0xe7f 0x1 0x5c
  write 0xf6f 0x1 0x5c
  outb 0xd758 0x5f
  outb 0xd758 0x40
  EOF

  =

  Trace:
  [S +0.083320] OK
  [R +0.083328] outb 0xd758 0x5f
  OK
  [S +0.084167] OK
  [R +0.084183] outb 0xd758 0x40
  ../block/block-backend.c:714:17: runtime error: member access within null=
 pointer of type 'BlockBackend' (aka 'struct BlockBackend')
  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../block/block-ba=
ckend.c:714:17 in =

  AddressSanitizer:DEADLYSIGNAL
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  =3D=3D843136=3D=3DERROR: AddressSanitizer: SEGV on unknown address 0x0000=
00000010 (pc 0x5593520d8ebc bp 0x7ffc0bb9e0b0 sp 0x7ffc0bb9e010 T0)
  =3D=3D843136=3D=3DThe signal is caused by a READ memory access.
  =3D=3D843136=3D=3DHint: address points to the zero page.
      #0 0x5593520d8ebc in blk_bs /home/alxndr/Development/qemu/general-fuz=
z/build/../block/block-backend.c:714:12
      #1 0x5593520d2d07 in blk_drain /home/alxndr/Development/qemu/general-=
fuzz/build/../block/block-backend.c:1715:28
      #2 0x55935096e9dc in ide_cancel_dma_sync /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/ide/core.c:723:9
      #3 0x55934f96b9ed in bmdma_cmd_writeb /home/alxndr/Development/qemu/g=
eneral-fuzz/build/../hw/ide/pci.c:298:13
      #4 0x55934fea0547 in bmdma_write /home/alxndr/Development/qemu/genera=
l-fuzz/build/../hw/ide/piix.c:75:9
      #5 0x55935175dde0 in memory_region_write_accessor /home/alxndr/Develo=
pment/qemu/general-fuzz/build/../softmmu/memory.c:483:5
      #6 0x55935175d2bd in access_with_adjusted_size /home/alxndr/Developme=
nt/qemu/general-fuzz/build/../softmmu/memory.c:544:18
      #7 0x55935175af70 in memory_region_dispatch_write /home/alxndr/Develo=
pment/qemu/general-fuzz/build/../softmmu/memory.c:1466:16
      #8 0x5593513b98a6 in flatview_write_continue /home/alxndr/Development=
/qemu/general-fuzz/build/../exec.c:3176:23
      #9 0x5593513a2878 in flatview_write /home/alxndr/Development/qemu/gen=
eral-fuzz/build/../exec.c:3216:14
      #10 0x5593513a23a8 in address_space_write /home/alxndr/Development/qe=
mu/general-fuzz/build/../exec.c:3308:18
      #11 0x559351803e07 in cpu_outb /home/alxndr/Development/qemu/general-=
fuzz/build/../softmmu/ioport.c:60:5
      #12 0x5593516c7b6d in qtest_process_command /home/alxndr/Development/=
qemu/general-fuzz/build/../softmmu/qtest.c:392:13
      #13 0x5593516c363e in qtest_process_inbuf /home/alxndr/Development/qe=
mu/general-fuzz/build/../softmmu/qtest.c:710:9
      #14 0x5593516c23e3 in qtest_read /home/alxndr/Development/qemu/genera=
l-fuzz/build/../softmmu/qtest.c:722:5
      #15 0x5593527c8762 in qemu_chr_be_write_impl /home/alxndr/Development=
/qemu/general-fuzz/build/../chardev/char.c:188:9
      #16 0x5593527c88aa in qemu_chr_be_write /home/alxndr/Development/qemu=
/general-fuzz/build/../chardev/char.c:200:9
      #17 0x5593527ee514 in fd_chr_read /home/alxndr/Development/qemu/gener=
al-fuzz/build/../chardev/char-fd.c:68:9
      #18 0x5593526da736 in qio_channel_fd_source_dispatch /home/alxndr/Dev=
elopment/qemu/general-fuzz/build/../io/channel-watch.c:84:12
      #19 0x7f3be18ef4cd in g_main_context_dispatch (/usr/lib/x86_64-linux-=
gnu/libglib-2.0.so.0+0x504cd)
      #20 0x559352c65c67 in glib_pollfds_poll /home/alxndr/Development/qemu=
/general-fuzz/build/../util/main-loop.c:217:9
      #21 0x559352c63567 in os_host_main_loop_wait /home/alxndr/Development=
/qemu/general-fuzz/build/../util/main-loop.c:240:5
      #22 0x559352c62f47 in main_loop_wait /home/alxndr/Development/qemu/ge=
neral-fuzz/build/../util/main-loop.c:516:11
      #23 0x55935144108d in qemu_main_loop /home/alxndr/Development/qemu/ge=
neral-fuzz/build/../softmmu/vl.c:1676:9
      #24 0x55934edd351c in main /home/alxndr/Development/qemu/general-fuzz=
/build/../softmmu/main.c:50:5
      #25 0x7f3be10f8cc9 in __libc_start_main csu/../csu/libc-start.c:308:16
      #26 0x55934ed28cf9 in _start (/home/alxndr/Development/qemu/general-f=
uzz/build/qemu-system-i386+0x2cb0cf9)

  AddressSanitizer can not provide additional info.
  SUMMARY: AddressSanitizer: SEGV /home/alxndr/Development/qemu/general-fuz=
z/build/../block/block-backend.c:714:12 in blk_bs
  =3D=3D843136=3D=3DABORTING

  -Alex

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1892966/+subscriptions

