Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 820203A728C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 01:36:45 +0200 (CEST)
Received: from localhost ([::1]:45822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsw8K-0002Ev-If
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 19:36:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lsw7A-0008Tn-7h
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 19:35:32 -0400
Received: from indium.canonical.com ([91.189.90.7]:41820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lsw78-0001Y2-2o
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 19:35:31 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lsw75-0006Od-N3
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 23:35:27 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9F8FD2E8075
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 23:35:27 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Jun 2021 23:27:31 -0000
From: Alexander Bulekov <1878057@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr philmd th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Alexander Bulekov (a1xndr)
References: <158921834595.12757.16112597546001644574.malonedeb@wampee.canonical.com>
Message-Id: <162371325191.17206.6648324200954824188.malone@gac.canonical.com>
Subject: [Bug 1878057] Re: null-ptr dereference in megasas_command_complete
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ed184eb8c3e03c8a0c3f47e69a5c546619a1af7c"; Instance="production"
X-Launchpad-Hash: 94254477738b213af2a0b622f2713ac3986f880a
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
Reply-To: Bug 1878057 <1878057@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Looks like OSS-Fuzz has a reproducer that still works:
https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=3D29192#c3

I'll move this one over to gitlab

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1878057

Title:
  null-ptr dereference in megasas_command_complete

Status in QEMU:
  Incomplete

Bug description:
  Hello,
  While fuzzing, I found an input that triggers a null-pointer dereference =
in
  megasas_command_complete:

  =3D=3D14959=3D=3DERROR: AddressSanitizer: SEGV on unknown address 0x00000=
0000003 (pc 0x55b1d11b4df1 bp 0x7ffeb55ca450 sp 0x7ffeb55ca1e0 T0)
  =3D=3D14959=3D=3DThe signal is caused by a WRITE memory access.
  =3D=3D14959=3D=3DHint: address points to the zero page.
      #0 0x55b1d11b4df1 in megasas_command_complete /home/alxndr/Developmen=
t/qemu/hw/scsi/megasas.c:1877:40
      #1 0x55b1d11759ec in scsi_req_complete /home/alxndr/Development/qemu/=
hw/scsi/scsi-bus.c:1430:5
      #2 0x55b1d115c98f in scsi_aio_complete /home/alxndr/Development/qemu/=
hw/scsi/scsi-disk.c:216:5
      #3 0x55b1d151c638 in blk_aio_complete /home/alxndr/Development/qemu/b=
lock/block-backend.c:1375:9
      #4 0x55b1d151c638 in blk_aio_complete_bh /home/alxndr/Development/qem=
u/block/block-backend.c:1385:5
      #5 0x55b1d16f3a5b in aio_bh_call /home/alxndr/Development/qemu/util/a=
sync.c:136:5
      #6 0x55b1d16f3a5b in aio_bh_poll /home/alxndr/Development/qemu/util/a=
sync.c:164:13
      #7 0x55b1d16fe43e in aio_dispatch /home/alxndr/Development/qemu/util/=
aio-posix.c:380:5
      #8 0x55b1d16f54fa in aio_ctx_dispatch /home/alxndr/Development/qemu/u=
til/async.c:306:5
      #9 0x7f47937c89ed in g_main_context_dispatch (/usr/lib/x86_64-linux-g=
nu/libglib-2.0.so.0+0x4e9ed)
      #10 0x55b1d16fbef4 in glib_pollfds_poll /home/alxndr/Development/qemu=
/util/main-loop.c:219:9
      #11 0x55b1d16fbef4 in os_host_main_loop_wait /home/alxndr/Development=
/qemu/util/main-loop.c:242:5
      #12 0x55b1d16fbef4 in main_loop_wait /home/alxndr/Development/qemu/ut=
il/main-loop.c:518:11
      #13 0x55b1d0cd16a6 in qemu_main_loop /home/alxndr/Development/qemu/so=
ftmmu/vl.c:1664:9
      #14 0x55b1d1608dca in main /home/alxndr/Development/qemu/softmmu/main=
.c:49:5
      #15 0x7f4792378e0a in __libc_start_main /build/glibc-GwnBeO/glibc-2.3=
0/csu/../csu/libc-start.c:308:16
      #16 0x55b1d091d7b9 in _start (/home/alxndr/Development/qemu/build/i38=
6-softmmu/qemu-system-i386+0x8f47b9)

  I can reproduce it in qemu 5.0 built with using:
  cat << EOF | ~/Development/qemu/build/i386-softmmu/qemu-system-i386 -M pc=
-q35-5.0 -no-shutdown -M q35 -device megasas -device scsi-cd,drive=3Dnull0 =
-blockdev driver=3Dnull-co,read-zeroes=3Don,node-name=3Dnull0 -nographic -q=
test stdio -monitor none -serial none
  outl 0xcf8 0x80001814
  outl 0xcfc 0xc021
  outl 0xcf8 0x80001818
  outl 0xcf8 0x80001804
  outw 0xcfc 0x7
  outl 0xcf8 0x80001810
  outl 0xcfc 0xe10c0000
  outl 0xcf8 0x8000f810
  write 0x44b20 0x1 0x35
  write 0x44b00 0x1 0x03
  write 0xc021e10c0040 0x81 0x014b04000131000000014b04000138000000014b04000=
13f000000014b04000146000000014b0400014d000000014b04000154000000014b0400015b=
000000014b04000162000000014b04000169000000014b04000170000000014b04000177000=
000014b0400017e000000014b04000185000000014b0400018c000000014b04
  EOF

  I also attached the trace to this launchpad report, in case the
  formatting is broken:

  qemu-system-i386 -qtest stdio -monitor none -serial none -M pc-q35-5.0
  -no-shutdown -M q35 -device megasas -device scsi-cd,drive=3Dnull0
  -blockdev driver=3Dnull-co,read-zeroes=3Don,node-name=3Dnull0 -nographic <
  attachment

  Please let me know if I can provide any further info.
  -Alex

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1878057/+subscriptions

