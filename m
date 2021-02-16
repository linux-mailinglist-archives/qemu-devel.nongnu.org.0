Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CEE31CAC1
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 13:52:57 +0100 (CET)
Received: from localhost ([::1]:60638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBzqa-0006ec-4T
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 07:52:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lBzpb-00063a-KW
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 07:51:55 -0500
Received: from mail.ispras.ru ([83.149.199.84]:46156)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lBzpY-0003ZA-V4
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 07:51:55 -0500
Received: from [127.0.1.1] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 27A0040755FA;
 Tue, 16 Feb 2021 12:51:45 +0000 (UTC)
Subject: [PATCH] replay: fix icount request when replaying clock access
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Tue, 16 Feb 2021 15:51:44 +0300
Message-ID: <161347990483.1313189.8371838968343494161.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.bennee@linaro.org, pbonzini@redhat.com, pavel.dovgalyuk@ispras.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Record/replay provides REPLAY_CLOCK_LOCKED macro to access
the clock when vm_clock_seqlock is locked. This macro is
needed because replay internals operate icount. In locked case
replay use icount_get_raw_locked for icount request, which prevents
excess locking which leads to deadlock. But previously only
record code used *_locked function and replay did not.
Therefore sometimes clock access lead to deadlocks.
This patch fixes clock access for replay too and uses *_locked
icount access function.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
---
 include/sysemu/replay.h  |   14 ++++++++------
 replay/replay-internal.c |   29 +++++++++++++++++++++++++----
 replay/replay-time.c     |    4 ++--
 replay/replay.c          |   23 +----------------------
 stubs/replay-tools.c     |    2 +-
 5 files changed, 37 insertions(+), 35 deletions(-)

diff --git a/include/sysemu/replay.h b/include/sysemu/replay.h
index 56c0c17c30..0f3b0f7eac 100644
--- a/include/sysemu/replay.h
+++ b/include/sysemu/replay.h
@@ -128,18 +128,20 @@ bool replay_has_interrupt(void);
 int64_t replay_save_clock(ReplayClockKind kind, int64_t clock,
                           int64_t raw_icount);
 /*! Read the specified clock from the log or return cached data */
-int64_t replay_read_clock(ReplayClockKind kind);
+int64_t replay_read_clock(ReplayClockKind kind, int64_t raw_icount);
 /*! Saves or reads the clock depending on the current replay mode. */
 #define REPLAY_CLOCK(clock, value)                                      \
-    (replay_mode == REPLAY_MODE_PLAY ? replay_read_clock((clock))       \
+    (replay_mode == REPLAY_MODE_PLAY                                    \
+        ? replay_read_clock((clock), icount_get_raw())                  \
         : replay_mode == REPLAY_MODE_RECORD                             \
-            ? replay_save_clock((clock), (value), icount_get_raw()) \
-        : (value))
+            ? replay_save_clock((clock), (value), icount_get_raw())     \
+            : (value))
 #define REPLAY_CLOCK_LOCKED(clock, value)                               \
-    (replay_mode == REPLAY_MODE_PLAY ? replay_read_clock((clock))       \
+    (replay_mode == REPLAY_MODE_PLAY                                    \
+        ? replay_read_clock((clock), icount_get_raw_locked())           \
         : replay_mode == REPLAY_MODE_RECORD                             \
             ? replay_save_clock((clock), (value), icount_get_raw_locked()) \
-        : (value))
+            : (value))
 
 /* Processing data from random generators */
 
diff --git a/replay/replay-internal.c b/replay/replay-internal.c
index 2e8a3e947a..77d0c82327 100644
--- a/replay/replay-internal.c
+++ b/replay/replay-internal.c
@@ -247,10 +247,31 @@ void replay_advance_current_icount(uint64_t current_icount)
     /* Time can only go forward */
     assert(diff >= 0);
 
-    if (diff > 0) {
-        replay_put_event(EVENT_INSTRUCTION);
-        replay_put_dword(diff);
-        replay_state.current_icount += diff;
+    if (replay_mode == REPLAY_MODE_RECORD) {
+        if (diff > 0) {
+            replay_put_event(EVENT_INSTRUCTION);
+            replay_put_dword(diff);
+            replay_state.current_icount += diff;
+        }
+    } else if (replay_mode == REPLAY_MODE_PLAY) {
+        if (diff > 0) {
+            replay_state.instruction_count -= diff;
+            replay_state.current_icount += diff;
+            if (replay_state.instruction_count == 0) {
+                assert(replay_state.data_kind == EVENT_INSTRUCTION);
+                replay_finish_event();
+                /* Wake up iothread. This is required because
+                    timers will not expire until clock counters
+                    will be read from the log. */
+                qemu_notify_event();
+            }
+        }
+        /* Execution reached the break step */
+        if (replay_break_icount == replay_state.current_icount) {
+            /* Cannot make callback directly from the vCPU thread */
+            timer_mod_ns(replay_break_timer,
+                qemu_clock_get_ns(QEMU_CLOCK_REALTIME));
+        }
     }
 }
 
diff --git a/replay/replay-time.c b/replay/replay-time.c
index 43357c9f24..00ebcb7a49 100644
--- a/replay/replay-time.c
+++ b/replay/replay-time.c
@@ -46,12 +46,12 @@ void replay_read_next_clock(ReplayClockKind kind)
 }
 
 /*! Reads next clock event from the input. */
-int64_t replay_read_clock(ReplayClockKind kind)
+int64_t replay_read_clock(ReplayClockKind kind, int64_t raw_icount)
 {
     int64_t ret;
     g_assert(replay_file && replay_mutex_locked());
 
-    replay_account_executed_instructions();
+    replay_advance_current_icount(raw_icount);
 
     if (replay_next_event_is(EVENT_CLOCK + kind)) {
         replay_read_next_clock(kind);
diff --git a/replay/replay.c b/replay/replay.c
index d4c228ab28..c806fec69a 100644
--- a/replay/replay.c
+++ b/replay/replay.c
@@ -94,28 +94,7 @@ void replay_account_executed_instructions(void)
     if (replay_mode == REPLAY_MODE_PLAY) {
         g_assert(replay_mutex_locked());
         if (replay_state.instruction_count > 0) {
-            int count = (int)(replay_get_current_icount()
-                              - replay_state.current_icount);
-
-            /* Time can only go forward */
-            assert(count >= 0);
-
-            replay_state.instruction_count -= count;
-            replay_state.current_icount += count;
-            if (replay_state.instruction_count == 0) {
-                assert(replay_state.data_kind == EVENT_INSTRUCTION);
-                replay_finish_event();
-                /* Wake up iothread. This is required because
-                   timers will not expire until clock counters
-                   will be read from the log. */
-                qemu_notify_event();
-            }
-            /* Execution reached the break step */
-            if (replay_break_icount == replay_state.current_icount) {
-                /* Cannot make callback directly from the vCPU thread */
-                timer_mod_ns(replay_break_timer,
-                    qemu_clock_get_ns(QEMU_CLOCK_REALTIME));
-            }
+            replay_advance_current_icount(replay_get_current_icount());
         }
     }
 }
diff --git a/stubs/replay-tools.c b/stubs/replay-tools.c
index c06b360e22..43296b3d4e 100644
--- a/stubs/replay-tools.c
+++ b/stubs/replay-tools.c
@@ -13,7 +13,7 @@ int64_t replay_save_clock(unsigned int kind, int64_t clock, int64_t raw_icount)
     return 0;
 }
 
-int64_t replay_read_clock(unsigned int kind)
+int64_t replay_read_clock(unsigned int kind, int64_t raw_icount)
 {
     abort();
     return 0;


