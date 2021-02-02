Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7160930C06A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 14:59:56 +0100 (CET)
Received: from localhost ([::1]:56192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6wDj-00089h-DR
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 08:59:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l6w4x-0007u9-CL
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:50:51 -0500
Received: from indium.canonical.com ([91.189.90.7]:46154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l6w4u-0003Sh-VE
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:50:51 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l6w4t-0004Lv-9L
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 13:50:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3E89B2E813B
 for <qemu-devel@nongnu.org>; Tue,  2 Feb 2021 13:50:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Feb 2021 13:40:14 -0000
From: P J P <1914236@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: cve security
X-Launchpad-Bug-Information-Type: Public Security
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: yes
X-Launchpad-Bug-Commenters: pjps
X-Launchpad-Bug-Reporter: P J P (pjps)
X-Launchpad-Bug-Modifier: P J P (pjps)
References: <161227122749.4264.9390983978445748910.malonedeb@chaenomeles.canonical.com>
Message-Id: <161227321472.4708.18238341332198140746.malone@chaenomeles.canonical.com>
Subject: [Bug 1914236] Re: QEMU: scsi: use-after-free in
 mptsas_process_scsi_io_request() of mptsas1068 emulator
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3d7abcb776ec05aa0a89112accc21bf8b41dfc24"; Instance="production"
X-Launchpad-Hash: 57fe2ae583c80399ba6376d6bef281ea51b465f0
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
Reply-To: Bug 1914236 <1914236@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Upstream patch
  -> https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg00488.html

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1914236

Title:
  QEMU: scsi: use-after-free in mptsas_process_scsi_io_request() of
  mptsas1068 emulator

Status in QEMU:
  New

Bug description:
  * Cheolwoo Myung of Seoul National University reported a use-after-free i=
ssue in the SCSI Megaraid
    emulator of the QEMU.

  * It occurs while handling mptsas_process_scsi_io_request(), as it does n=
ot
    check a list in s->pending.

  * This was found in version 5.2.0 (master)

  =3D=3D31872=3D=3DERROR: AddressSanitizer: heap-use-after-free on address
  0x60c000107568 at pc 0x564514950c7c bp 0x7fff524ef4b0 sp 0x7fff524ef4a0 W=
RITE of size 8 at 0x60c000107568 thread T0
  #0 0x564514950c7b in mptsas_process_scsi_io_request ../hw/scsi/mptsas.c:3=
06
  #1 0x564514950c7b in mptsas_fetch_request ../hw/scsi/mptsas.c:775
  #2 0x564514950c7b in mptsas_fetch_requests ../hw/scsi/mptsas.c:790
  #3 0x56451585c25d in aio_bh_poll ../util/async.c:164
  #4 0x5645158d7e7d in aio_dispatch ../util/aio-posix.c:381
  #5 0x56451585be2d in aio_ctx_dispatch ../util/async.c:306
  #6 0x7f1cc8af4416 in g_main_context_dispatch
  (/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x4c416)
  #7 0x56451583f059 in glib_pollfds_poll ../util/main-loop.c:221
  #8 0x56451583f059 in os_host_main_loop_wait ../util/main-loop.c:244
  #9 0x56451583f059 in main_loop_wait ../util/main-loop.c:520
  #10 0x56451536b181 in qemu_main_loop ../softmmu/vl.c:1537
  #11 0x5645143ddd3d in main ../softmmu/main.c:50
  #12 0x7f1cc2650b96 in __libc_start_main
  (/lib/x86_64-linux-gnu/libc.so.6+0x21b96)
  #13 0x5645143eece9 in _start
  (/home/cwmyung/prj/hyfuzz/src/qemu-repro/build/qemu-system-i386+0x1d55ce9)

  0x60c000107568 is located 104 bytes inside of 120-byte region
  [0x60c000107500,0x60c000107578)
  freed by thread T0 here:
  #0 0x7f1cca9777a8 in __interceptor_free
  (/usr/lib/x86_64-linux-gnu/libasan.so.4+0xde7a8)
  #1 0x56451495008b in mptsas_process_scsi_io_request ../hw/scsi/mptsas.c:3=
58
  #2 0x56451495008b in mptsas_fetch_request ../hw/scsi/mptsas.c:775
  #3 0x56451495008b in mptsas_fetch_requests ../hw/scsi/mptsas.c:790
  #4 0x7fff524ef8bf (<unknown module>)

  previously allocated by thread T0 here:
  #0 0x7f1cca977d28 in __interceptor_calloc
  (/usr/lib/x86_64-linux-gnu/libasan.so.4+0xded28)
  #1 0x7f1cc8af9b10 in g_malloc0
  (/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x51b10)
  #2 0x7fff524ef8bf (<unknown module>)

  SUMMARY: AddressSanitizer: heap-use-after-free ../hw/scsi/mptsas.c:306
  in mptsas_process_scsi_io_request
  Shadow bytes around the buggy address:
  0x0c1880018e50: fa fa fa fa fa fa fa fa fd fd fd fd fd fd fd fd
  0x0c1880018e60: fd fd fd fd fd fd fd fd fa fa fa fa fa fa fa fa
  0x0c1880018e70: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
  0x0c1880018e80: fa fa fa fa fa fa fa fa fd fd fd fd fd fd fd fd
  0x0c1880018e90: fd fd fd fd fd fd fd fd fa fa fa fa fa fa fa fa
  =3D>0x0c1880018ea0: fd fd fd fd fd fd fd fd fd fd fd fd fd[fd]fd fa
  0x0c1880018eb0: fa fa fa fa fa fa fa fa 00 00 00 00 00 00 00 00
  0x0c1880018ec0: 00 00 00 00 00 00 00 fa fa fa fa fa fa fa fa fa
  0x0c1880018ed0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
  0x0c1880018ee0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
  0x0c1880018ef0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
  Shadow byte legend (one shadow byte represents 8 application bytes):
  Addressable: 00
  Partially addressable: 01 02 03 04 05 06 07
  Heap left redzone: fa
  Freed heap region: fd
  Stack left redzone: f1
  Stack mid redzone: f2
  Stack right redzone: f3
  Stack after return: f5
  Stack use after scope: f8
  Global redzone: f9
  Global init order: f6
  Poisoned by user: f7
  Container overflow: fc
  Array cookie: ac
  Intra object redzone: bb
  ASan internal: fe
  Left alloca redzone: ca
  Right alloca redzone: cb
  =3D=3D31872=3D=3DABORTING

  =

  To reproduce this issue, please run the QEMU with the following command
  line.

  =

  # To enable ASan option, please set configuration with the following comm=
and
  $ ./configure --target-list=3Di386-softmmu --disable-werror --enable-sani=
tizers
  $ make

  # To reproduce this issue, please run the QEMU process with the
  following command line.
  $ ./qemu-system-i386 -m 512 -drive
  file=3D./hyfuzz.img,index=3D0,media=3Ddisk,format=3Draw -device
  mptsas1068,id=3Dscsi -device scsi-hd,drive=3DSysDisk -drive
  id=3DSysDisk,if=3Dnone,file=3D./disk.img

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1914236/+subscriptions

