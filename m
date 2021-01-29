Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0CF3083ED
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 03:52:41 +0100 (CET)
Received: from localhost ([::1]:56802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Jto-0000ze-6c
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 21:52:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l5Jrr-00007l-PU
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 21:50:39 -0500
Received: from indium.canonical.com ([91.189.90.7]:44980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l5Jrp-0006mF-NY
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 21:50:39 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l5Jrn-0004vm-GP
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 02:50:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 786C62E8138
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 02:50:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 Jan 2021 02:36:16 -0000
From: Alexander Bulekov <1913669@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: fuzzer
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Alexander Bulekov (a1xndr)
Message-Id: <161188777664.14361.8613380647852564408.malonedeb@wampee.canonical.com>
Subject: [Bug 1913669] [NEW] FPE in npcm7xx_adc_convert
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e00fb96b2e64b75333d0178ec15cb78e5aadb64d"; Instance="production"
X-Launchpad-Hash: 2b3f28cf8a6589dc75700afc2942f9a1f33afee5
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
Reply-To: Bug 1913669 <1913669@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Reproducer:
cat << EOF | ./qemu-system-aarch64 -M npcm750-evb \
-accel qtest -qtest stdio
write 0xf000c000 0x4 0x02400200
clock_step
EOF

Trace:
../hw/adc/npcm7xx_adc.c:60:51: runtime error: division by zero
SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../hw/adc/npcm7xx_a=
dc.c:60:51 in
AddressSanitizer:DEADLYSIGNAL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=3D=3D717962=3D=3DERROR: AddressSanitizer: FPE on unknown address 0x55901aa=
6e67a (pc 0x55901aa6e67a bp 0x7fff0ac087e0 sp 0x7fff0ac087a0 T0)
#0 0x55901aa6e67a in npcm7xx_adc_convert /hw/adc/npcm7xx_adc.c:60:51
#1 0x55901aa6e67a in npcm7xx_adc_convert_done /hw/adc/npcm7xx_adc.c:106:15
#2 0x55901ceb847e in timerlist_run_timers /util/qemu-timer.c:574:9
#3 0x55901c05d804 in qtest_clock_warp /softmmu/qtest.c:356:9
#4 0x55901c059781 in qtest_process_command /softmmu/qtest.c:752:9
#5 0x55901c051b97 in qtest_process_inbuf /softmmu/qtest.c:797:9
#6 0x55901c8a2286 in fd_chr_read /chardev/char-fd.c:68:9
#7 0x7fa5c43f1aae in g_main_context_dispatch (/usr/lib/x86_64-linux-gnu/lib=
glib-2.0.so.0+0x51aae)
#8 0x55901cefd363 in glib_pollfds_poll /util/main-loop.c:232:9
#9 0x55901cefd363 in os_host_main_loop_wait /util/main-loop.c:255:5
#10 0x55901cefd363 in main_loop_wait /util/main-loop.c:531:11
#11 0x55901bfb8599 in qemu_main_loop /softmmu/runstate.c:721:9
#12 0x55901a2451fd in main /softmmu/main.c:50:5
#13 0x7fa5c3e96cc9 in __libc_start_main csu/../csu/libc-start.c:308:16
#14 0x55901a198bc9 in _start (/home/alxndr/Development/qemu/build/qemu-syst=
em-aarch64+0x3350bc9)

AddressSanitizer can not provide additional info.
SUMMARY: AddressSanitizer: FPE /hw/adc/npcm7xx_adc.c:60:51 in npcm7xx_adc_c=
onvert

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: fuzzer

** Tags added: fuzzer

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1913669

Title:
  FPE in npcm7xx_adc_convert

Status in QEMU:
  New

Bug description:
  Reproducer:
  cat << EOF | ./qemu-system-aarch64 -M npcm750-evb \
  -accel qtest -qtest stdio
  write 0xf000c000 0x4 0x02400200
  clock_step
  EOF

  Trace:
  ../hw/adc/npcm7xx_adc.c:60:51: runtime error: division by zero
  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../hw/adc/npcm7xx=
_adc.c:60:51 in
  AddressSanitizer:DEADLYSIGNAL
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  =3D=3D717962=3D=3DERROR: AddressSanitizer: FPE on unknown address 0x55901=
aa6e67a (pc 0x55901aa6e67a bp 0x7fff0ac087e0 sp 0x7fff0ac087a0 T0)
  #0 0x55901aa6e67a in npcm7xx_adc_convert /hw/adc/npcm7xx_adc.c:60:51
  #1 0x55901aa6e67a in npcm7xx_adc_convert_done /hw/adc/npcm7xx_adc.c:106:15
  #2 0x55901ceb847e in timerlist_run_timers /util/qemu-timer.c:574:9
  #3 0x55901c05d804 in qtest_clock_warp /softmmu/qtest.c:356:9
  #4 0x55901c059781 in qtest_process_command /softmmu/qtest.c:752:9
  #5 0x55901c051b97 in qtest_process_inbuf /softmmu/qtest.c:797:9
  #6 0x55901c8a2286 in fd_chr_read /chardev/char-fd.c:68:9
  #7 0x7fa5c43f1aae in g_main_context_dispatch (/usr/lib/x86_64-linux-gnu/l=
ibglib-2.0.so.0+0x51aae)
  #8 0x55901cefd363 in glib_pollfds_poll /util/main-loop.c:232:9
  #9 0x55901cefd363 in os_host_main_loop_wait /util/main-loop.c:255:5
  #10 0x55901cefd363 in main_loop_wait /util/main-loop.c:531:11
  #11 0x55901bfb8599 in qemu_main_loop /softmmu/runstate.c:721:9
  #12 0x55901a2451fd in main /softmmu/main.c:50:5
  #13 0x7fa5c3e96cc9 in __libc_start_main csu/../csu/libc-start.c:308:16
  #14 0x55901a198bc9 in _start (/home/alxndr/Development/qemu/build/qemu-sy=
stem-aarch64+0x3350bc9)

  AddressSanitizer can not provide additional info.
  SUMMARY: AddressSanitizer: FPE /hw/adc/npcm7xx_adc.c:60:51 in npcm7xx_adc=
_convert

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1913669/+subscriptions

