Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A383828258E
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Oct 2020 19:25:33 +0200 (CEST)
Received: from localhost ([::1]:50040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOlHl-0007rZ-3j
	for lists+qemu-devel@lfdr.de; Sat, 03 Oct 2020 13:25:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kOl6Y-00030h-GW
 for qemu-devel@nongnu.org; Sat, 03 Oct 2020 13:13:55 -0400
Received: from mail.ispras.ru ([83.149.199.84]:36072)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kOl6W-0008Ji-Bg
 for qemu-devel@nongnu.org; Sat, 03 Oct 2020 13:13:54 -0400
Received: from [127.0.1.1] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 70E0840A1DB0;
 Sat,  3 Oct 2020 17:13:50 +0000 (UTC)
Subject: [PATCH v7 11/14] gdbstub: add reverse continue support in replay mode
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Sat, 03 Oct 2020 20:13:49 +0300
Message-ID: <160174522930.12451.6994758004725016836.stgit@pasha-ThinkPad-X280>
In-Reply-To: <160174516520.12451.10785284392438702137.stgit@pasha-ThinkPad-X280>
References: <160174516520.12451.10785284392438702137.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/03 13:12:47
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Cc: kwolf@redhat.com, wrampazz@redhat.com, pavel.dovgalyuk@ispras.ru,
 ehabkost@redhat.com, alex.bennee@linaro.org, mtosatti@redhat.com,
 armbru@redhat.com, mreitz@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, philmd@redhat.com, zhiwei_liu@c-sky.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>

This patch adds support of the reverse continue operation for gdbstub.
Reverse continue finds the last breakpoint that would happen in normal
execution from the beginning to the current moment.
Implementation of the reverse continue replays the execution twice:
to find the breakpoints that were hit and to seek to the last breakpoint.
Reverse continue loads the previous snapshot and tries to find the breakpoint
since that moment. If there are no such breakpoints, it proceeds to
the earlier snapshot, and so on. When no breakpoints or watchpoints were
hit at all, execution stops at the beginning of the replay log.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
---
 exec.c                    |    1 +
 gdbstub.c                 |   10 ++++++
 include/sysemu/replay.h   |    8 +++++
 replay/replay-debugging.c |   72 +++++++++++++++++++++++++++++++++++++++++++++
 softmmu/cpus.c            |    5 +++
 stubs/replay.c            |    5 +++
 6 files changed, 100 insertions(+), 1 deletion(-)

diff --git a/exec.c b/exec.c
index 80db218c99..f4a6d4cf62 100644
--- a/exec.c
+++ b/exec.c
@@ -2757,6 +2757,7 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
                  * Don't process the watchpoints when we are
                  * in a reverse debugging operation.
                  */
+                replay_breakpoint();
                 return;
             }
             if (flags == BP_MEM_READ) {
diff --git a/gdbstub.c b/gdbstub.c
index 79e8ccc050..ac92273018 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1907,6 +1907,13 @@ static void handle_backward(GdbCmdContext *gdb_ctx, void *user_ctx)
                 put_packet("E14");
             }
             return;
+        case 'c':
+            if (replay_reverse_continue()) {
+                gdb_continue();
+            } else {
+                put_packet("E14");
+            }
+            return;
         }
     }
 
@@ -2161,7 +2168,8 @@ static void handle_query_supported(GdbCmdContext *gdb_ctx, void *user_ctx)
     }
 
     if (replay_mode == REPLAY_MODE_PLAY) {
-        g_string_append(gdbserver_state.str_buf, ";ReverseStep+");
+        g_string_append(gdbserver_state.str_buf,
+            ";ReverseStep+;ReverseContinue+");
     }
 
     if (gdb_ctx->num_params &&
diff --git a/include/sysemu/replay.h b/include/sysemu/replay.h
index 13a8123b09..b6cac175c4 100644
--- a/include/sysemu/replay.h
+++ b/include/sysemu/replay.h
@@ -81,11 +81,19 @@ const char *replay_get_filename(void);
  * Returns true on success.
  */
 bool replay_reverse_step(void);
+/*
+ * Start searching the last breakpoint/watchpoint.
+ * Used by gdbstub for backwards debugging.
+ * Returns true if the process successfully started.
+ */
+bool replay_reverse_continue(void);
 /*
  * Returns true if replay module is processing
  * reverse_continue or reverse_step request
  */
 bool replay_running_debug(void);
+/* Called in reverse debugging mode to collect breakpoint information */
+void replay_breakpoint(void);
 
 /* Processing the instructions */
 
diff --git a/replay/replay-debugging.c b/replay/replay-debugging.c
index 1e1dec0295..30ca38e5dd 100644
--- a/replay/replay-debugging.c
+++ b/replay/replay-debugging.c
@@ -23,6 +23,8 @@
 #include "migration/snapshot.h"
 
 static bool replay_is_debugging;
+static int64_t replay_last_breakpoint;
+static int64_t replay_last_snapshot;
 
 bool replay_running_debug(void)
 {
@@ -246,3 +248,73 @@ bool replay_reverse_step(void)
 
     return false;
 }
+
+static void replay_continue_end(void)
+{
+    replay_is_debugging = false;
+    vm_stop(RUN_STATE_DEBUG);
+    replay_delete_break();
+}
+
+static void replay_continue_stop(void *opaque)
+{
+    Error *err = NULL;
+    if (replay_last_breakpoint != -1LL) {
+        replay_seek(replay_last_breakpoint, replay_stop_vm_debug, &err);
+        if (err) {
+            error_free(err);
+            replay_continue_end();
+        }
+        return;
+    }
+    /*
+     * No breakpoints since the last snapshot.
+     * Find previous snapshot and try again.
+     */
+    if (replay_last_snapshot != 0) {
+        replay_seek(replay_last_snapshot - 1, replay_continue_stop, &err);
+        if (err) {
+            error_free(err);
+            replay_continue_end();
+        }
+        replay_last_snapshot = replay_get_current_icount();
+        return;
+    } else {
+        /* Seek to the very first step */
+        replay_seek(0, replay_stop_vm_debug, &err);
+        if (err) {
+            error_free(err);
+            replay_continue_end();
+        }
+        return;
+    }
+    replay_continue_end();
+}
+
+bool replay_reverse_continue(void)
+{
+    Error *err = NULL;
+
+    assert(replay_mode == REPLAY_MODE_PLAY);
+
+    if (replay_get_current_icount() != 0) {
+        replay_seek(replay_get_current_icount() - 1,
+                    replay_continue_stop, &err);
+        if (err) {
+            error_free(err);
+            return false;
+        }
+        replay_last_breakpoint = -1LL;
+        replay_is_debugging = true;
+        replay_last_snapshot = replay_get_current_icount();
+        return true;
+    }
+
+    return false;
+}
+
+void replay_breakpoint(void)
+{
+    assert(replay_mode == REPLAY_MODE_PLAY);
+    replay_last_breakpoint = replay_get_current_icount();
+}
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 1fa9c4c1de..8334dceab4 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -1006,6 +1006,11 @@ static void cpu_handle_guest_debug(CPUState *cpu)
 {
     if (replay_running_debug()) {
         if (!cpu->singlestep_enabled) {
+            /*
+             * Report about the breakpoint and
+             * make a single step to skip it
+             */
+            replay_breakpoint();
             cpu_single_step(cpu, SSTEP_ENABLE);
         } else {
             cpu_single_step(cpu, 0);
diff --git a/stubs/replay.c b/stubs/replay.c
index d5b52302e9..45ebe77fb9 100644
--- a/stubs/replay.c
+++ b/stubs/replay.c
@@ -98,3 +98,8 @@ bool replay_reverse_step(void)
 {
     return false;
 }
+
+bool replay_reverse_continue(void)
+{
+    return false;
+}


