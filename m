Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F632FA80F
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 18:57:59 +0100 (CET)
Received: from localhost ([::1]:60930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Yms-0003ir-P5
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 12:57:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l1YRL-0001hb-SL
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 12:35:45 -0500
Received: from indium.canonical.com ([91.189.90.7]:59662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l1YRH-0006al-Nj
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 12:35:43 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l1YRE-0006rt-Fl
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 17:35:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 74BA52E813B
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 17:35:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 Jan 2021 17:27:21 -0000
From: Richard Henderson <1912065@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=In Progress; importance=Undecided;
 assignee=rth@twiddle.net; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: balaton-4 harrysintonen rth
X-Launchpad-Bug-Reporter: Harry Sintonen (harrysintonen)
X-Launchpad-Bug-Modifier: Richard Henderson (rth)
References: <161081817733.30007.5357056175605529567.malonedeb@chaenomeles.canonical.com>
Message-Id: <161099084144.30067.897245088295398204.malone@chaenomeles.canonical.com>
Subject: [Bug 1912065] Re: Segfaults in tcg/optimize.c:212 after commit
 7c79721606be11b5bc556449e5bcbc331ef6867d
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="511b4a3b6512aa3d421c5f7d74f3527e78bff26e"; Instance="production"
X-Launchpad-Hash: a855cb50dd87c1f1b522a1eaac6e3fd4da793128
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
Reply-To: Bug 1912065 <1912065@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The problem is that we're now generating many more temporaries
than before, and running out of the statically allocated amount.
Changing a debug assert to a full assert will change the SEGV
into an ABRT.  :-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 8f8badb61c..c376afe56a 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1207,7 +1207,7 @@ void tcg_func_start(TCGContext *s)
 static inline TCGTemp *tcg_temp_alloc(TCGContext *s)
 {
     int n =3D s->nb_temps++;
-    tcg_debug_assert(n < TCG_MAX_TEMPS);
+    g_assert(n < TCG_MAX_TEMPS);
     return memset(&s->temps[n], 0, sizeof(TCGTemp));
 }
 =


The problem can be worked around temporarily by increasing the
number of temporaries:

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 504c5e9bb0..8fe32bb03c 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -275,7 +275,7 @@ typedef struct TCGPool {
 =

 #define TCG_POOL_CHUNK_SIZE 32768
 =

-#define TCG_MAX_TEMPS 512
+#define TCG_MAX_TEMPS 2048
 #define TCG_MAX_INSNS 512
 =

 /* when the size of the arguments of a called function is smaller than


But a proper solution is to dynamically allocate the temps.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1912065

Title:
  Segfaults in tcg/optimize.c:212 after commit
  7c79721606be11b5bc556449e5bcbc331ef6867d

Status in QEMU:
  In Progress

Bug description:
  QEMU segfaults to NULL dereference in tcg/optimize.c:212 semi-randomly
  after commit 7c79721606be11b5bc556449e5bcbc331ef6867d

  Exception Type:        EXC_BAD_ACCESS (SIGSEGV)
  Exception Codes:       KERN_INVALID_ADDRESS at 0x0000000000000020
  Exception Note:        EXC_CORPSE_NOTIFY

  ...

  Thread 4 Crashed:
  0   qemu-system-ppc               	0x0000000109cd26d2 tcg_opt_gen_mov + 1=
78 (optimize.c:212)
  1   qemu-system-ppc               	0x0000000109ccf838 tcg_optimize + 5656
  2   qemu-system-ppc               	0x0000000109c27600 tcg_gen_code + 64 (=
tcg.c:4490)
  3   qemu-system-ppc               	0x0000000109c17b6d tb_gen_code + 493 (=
translate-all.c:1952)
  4   qemu-system-ppc               	0x0000000109c16085 tb_find + 41 (cpu-e=
xec.c:454) [inlined]
  5   qemu-system-ppc               	0x0000000109c16085 cpu_exec + 2117 (cp=
u-exec.c:810)
  6   qemu-system-ppc               	0x0000000109c09ac3 tcg_cpus_exec + 35 =
(tcg-cpus.c:57)
  7   qemu-system-ppc               	0x0000000109c75edd rr_cpu_thread_fn + =
445 (tcg-cpus-rr.c:217)
  8   qemu-system-ppc               	0x0000000109e41fae qemu_thread_start +=
 126 (qemu-thread-posix.c:521)
  9   libsystem_pthread.dylib       	0x00007fff2038e950 _pthread_start + 224
  10  libsystem_pthread.dylib       	0x00007fff2038a47b thread_start + 15

  Here the crash is in tcg/optimize.c line 212:

    mask =3D si->mask;

  "si" is NULL. The NULL value arises from tcg/optimize.c line 198:

   si =3D ts_info(src_ts);

  I did not attempt to determine the root cause of this issue, however.
  It clearly is related to the "tcg/optimize" changes in this commit.
  The previous commit c0dd6654f207810b16a75b673258f5ce2ceffbf0 doesn't
  crash.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1912065/+subscriptions

