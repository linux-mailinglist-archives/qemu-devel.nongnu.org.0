Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB5D3F387F
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 06:17:13 +0200 (CEST)
Received: from localhost ([::1]:54978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHIRU-0003oF-2R
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 00:17:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mHIQ3-0001kI-So
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 00:15:45 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:42786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mHIPz-0006Z3-Tm
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 00:15:43 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id A3BA73F7AD
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 04:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629519337;
 bh=ObCn+aSIlD30DJSWWjkOXe9Upy5/Q3paaKyiJ/Vaags=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=sVdQGjSweZbn61TE6R7dDc6jlSVGkRGcrW2Xv2ygzqoNlXAE/SucD9G/uXfVp7Msn
 Qo4Ncc46KVRmoF/Y3LwC3Iwm3MxxXkfysn3dnaFbZyHWkD7TvDPjhJS12o/8jxO5wJ
 PS6wm4/aSiBY5fNbzbnMmCVGG5Xk+4+8Ztb2QzCCOSOQBTGTkfQY+dq4dhNQZYTEr3
 OeVuqGTJw5lHKSvrWUfZwMG/WN/c56ztg5SqGBGR9edUQ8/0PAJrmU1xdYN/Blxmb4
 QVE+DgE5eP9jHE5Mo/iMyGOSq4cljRMtQ4AFez1/m5GpJhgGBzKJkUENdUSavuPohJ
 RTxviOYD7SCDQ==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 990C22E816D
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 04:15:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Aug 2021 04:09:42 -0000
From: Alexander Bulekov <1888714@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: fuzzer test
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Alexander Bulekov (a1xndr)
References: <159552501514.3414.9224287999042731513.malonedeb@gac.canonical.com>
Message-Id: <162951898260.3321.2213388557615618301.malone@soybean.canonical.com>
Subject: [Bug 1888714] Re: Memory Leak in hpet_timer results in unusable
 machine
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="25edfd4b3e79d9ee9d9c3a750eb93e4d41d56c9e"; Instance="production"
X-Launchpad-Hash: 954b91d411261d31c974df348528f69f8853ed3c
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1888714 <1888714@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I moved this report over to QEMU's new bug tracker on gitlab.com.
Please continue with the discussion here:

https://gitlab.com/qemu-project/qemu/-/issues/538

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #538
   https://gitlab.com/qemu-project/qemu/-/issues/538

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1888714

Title:
  Memory Leak in hpet_timer results in unusable machine

Status in QEMU:
  Confirmed

Bug description:
  Fair warning: this might be specific to QTest (specifically its
  clock_step) command. This reproducer only works with -accel qtest.
  Build with --enable-sanitizers to exit once we hit 1G RSS.

  export ASAN_OPTIONS=3Dhard_rss_limit_mb=3D1000=20
  cat << EOF | ./i386-softmmu/qemu-system-i386 -nographic \
  -nodefaults -qtest stdio -accel qtest
  writeq 0xfed0000e 0x15151515151515f1
  clock_step
  clock_step
  clock_step
  clock_step
  writeq 0xfed00100 0x5e90c5be00ff5e9e
  writeq 0xfed00109 0xffffe0ff5cfec0ff
  clock_step
  EOF

  On my machine it takes around 10 seconds to reach the RSS limit.

  Unfortunately, I can't find a way to tell ASAN to log each malloc to
  figure out whats going on, but running the original fuzzing test case
  with the libfuzzer -trace_malloc=3D2 flag, I found that the allocations
  happen here:

  MALLOC[130968] 0x60300069ac90 32
      #0 0x55fa3f615851 in __sanitizer_print_stack_trace (/home/alxndr/Deve=
lopment/qemu/build/i386-softmmu/qemu-fuzz-i386+0x2683851)
      #1 0x55fa3f55fe88 in fuzzer::PrintStackTrace() (/home/alxndr/Developm=
ent/qemu/build/i386-softmmu/qemu-fuzz-i386+0x25cde88)
      #2 0x55fa3f5447d6 in fuzzer::MallocHook(void const volatile*, unsigne=
d long) (/home/alxndr/Development/qemu/build/i386-softmmu/qemu-fuzz-i386+0x=
25b27d6)
      #3 0x55fa3f61bbb7 in __sanitizer::RunMallocHooks(void const*, unsigne=
d long) (/home/alxndr/Development/qemu/build/i386-softmmu/qemu-fuzz-i386+0x=
2689bb7)
      #4 0x55fa3f596d75 in __asan::Allocator::Allocate(unsigned long, unsig=
ned long, __sanitizer::BufferedStackTrace*, __asan::AllocType, bool) (/home=
/alxndr/Development/qemu/build/i386-softmmu/qemu-fuzz-i386+0x2604d75)
      #5 0x55fa3f596f7a in __asan::asan_calloc(unsigned long, unsigned long=
, __sanitizer::BufferedStackTrace*) (/home/alxndr/Development/qemu/build/i3=
86-softmmu/qemu-fuzz-i386+0x2604f7a)
      #6 0x55fa3f60d173 in calloc (/home/alxndr/Development/qemu/build/i386=
-softmmu/qemu-fuzz-i386+0x267b173)
      #7 0x7fb300737548 in g_malloc0 (/usr/lib/x86_64-linux-gnu/libglib-2.0=
.so.0+0x54548)
      #8 0x55fa40157689 in async_run_on_cpu /home/alxndr/Development/qemu/c=
pus-common.c:163:10
      #9 0x55fa409fab83 in hpet_timer /home/alxndr/Development/qemu/hw/time=
r/hpet.c:376:9
      #10 0x55fa416a5751 in timerlist_run_timers /home/alxndr/Development/q=
emu/util/qemu-timer.c:572:9
      #11 0x55fa3fcfdac4 in qtest_clock_warp /home/alxndr/Development/qemu/=
softmmu/cpus.c:507:9
      #12 0x55fa3fd65c35 in qtest_process_command /home/alxndr/Development/=
qemu/softmmu/qtest.c:665:9
      #13 0x55fa3fd5e128 in qtest_process_inbuf /home/alxndr/Development/qe=
mu/softmmu/qtest.c:710:9
      #14 0x55fa3fd5de67 in qtest_server_inproc_recv /home/alxndr/Developme=
nt/qemu/softmmu/qtest.c:817:9
      #15 0x55fa4142b64b in qtest_sendf /home/alxndr/Development/qemu/tests=
/qtest/libqtest.c:424:5
      #16 0x55fa4142c482 in qtest_clock_step_next /home/alxndr/Development/=
qemu/tests/qtest/libqtest.c:864:5
      #17 0x55fa414b12d1 in general_fuzz /home/alxndr/Development/qemu/test=
s/qtest/fuzz/general_fuzz.c:581:17

  It doesn't look like we ever exit out of the loop in
  timerlist_run_timers, ie timer_list->active_timers is always True.

 =20
  Info From GDB:
  #0  0x0000555558070d31 in address_space_stl_internal (as=3D0x55555f0e8f20=
 <address_space_memory>, addr=3D0x0, val=3D0x0, attrs=3D..., result=3D0x0, =
endian=3DDEVICE_LITTLE_ENDIAN) at /home/alxndr/Development/qemu/memory_ldst=
.inc.c:323
  #1  0x0000555558071339 in address_space_stl_le (as=3D0x55555f0e8f20 <addr=
ess_space_memory>, addr=3D0x0, val=3D0x0, attrs=3D..., result=3D0x0) at /ho=
me/alxndr/Development/qemu/memory_ldst.inc.c:357
  #2  0x000055555a6a6f95 in update_irq (timer=3D0x61f0000005b8, set=3D0x1) =
at /home/alxndr/Development/qemu/hw/timer/hpet.c:210
  #3  0x000055555a6ae55f in hpet_timer (opaque=3D0x61f0000005b8) at /home/a=
lxndr/Development/qemu/hw/timer/hpet.c:386
  #4  0x000055555c03d178 in timerlist_run_timers (timer_list=3D0x60b0000528=
f0) at /home/alxndr/Development/qemu/util/qemu-timer.c:572
  #5  0x000055555c03d6b5 in qemu_clock_run_timers (type=3DQEMU_CLOCK_VIRTUA=
L) at /home/alxndr/Development/qemu/util/qemu-timer.c:586
  #6  0x0000555558c3d0c4 in qtest_clock_warp (dest=3D0x3461864) at /home/al=
xndr/Development/qemu/softmmu/cpus.c:507

 =20
  -Alex

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1888714/+subscriptions


