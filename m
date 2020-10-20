Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B27C4282589
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Oct 2020 19:23:32 +0200 (CEST)
Received: from localhost ([::1]:47102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOlFr-0006eY-Qr
	for lists+qemu-devel@lfdr.de; Sat, 03 Oct 2020 13:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kOl6V-0002vo-P1
 for qemu-devel@nongnu.org; Sat, 03 Oct 2020 13:13:51 -0400
Received: from mail.ispras.ru ([83.149.199.84]:36064)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kOl6T-0008Jc-Hr
 for qemu-devel@nongnu.org; Sat, 03 Oct 2020 13:13:51 -0400
Received: from [127.0.1.1] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 8D41F40A1DAD;
 Sat,  3 Oct 2020 17:13:44 +0000 (UTC)
Subject: [PATCH v7 10/14] gdbstub: add reverse step support in replay mode
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Sat, 03 Oct 2020 20:13:43 +0300
Message-ID: <160174522341.12451.1498758422543765253.stgit@pasha-ThinkPad-X280>
In-Reply-To: <160174516520.12451.10785284392438702137.stgit@pasha-ThinkPad-X280>
References: <160174516520.12451.10785284392438702137.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

GDB remote protocol supports two reverse debugging commands:
reverse step and reverse continue.
This patch adds support of the first one to the gdbstub.
Reverse step is intended to step one instruction in the backwards
direction. This is not possible in regular execution.
But replayed execution is deterministic, therefore we can load one of
the prior snapshots and proceed to the desired step. It is equivalent
to stepping one instruction back.
There should be at least one snapshot preceding the debugged part of
the replay log.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

--

v4 changes:
 - inverted condition in cpu_handle_guest_debug (suggested by Alex Bennée)
---
 accel/tcg/translator.c    |    1 +
 exec.c                    |    7 ++++++
 gdbstub.c                 |   55 +++++++++++++++++++++++++++++++++++++++++++--
 include/sysemu/replay.h   |   11 +++++++++
 replay/replay-debugging.c |   34 ++++++++++++++++++++++++++++
 softmmu/cpus.c            |   14 +++++++++--
 stubs/replay.c            |    5 ++++
 7 files changed, 122 insertions(+), 5 deletions(-)

diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index 603d17ff83..fb1e19c585 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -17,6 +17,7 @@
 #include "exec/log.h"
 #include "exec/translator.h"
 #include "exec/plugin-gen.h"
+#include "sysemu/replay.h"
 
 /* Pairs with tcg_clear_temp_count.
    To be called by #TranslatorOps.{translate_insn,tb_stop} if
diff --git a/exec.c b/exec.c
index c088559d94..80db218c99 100644
--- a/exec.c
+++ b/exec.c
@@ -2752,6 +2752,13 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
     QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
         if (watchpoint_address_matches(wp, addr, len)
             && (wp->flags & flags)) {
+            if (replay_running_debug()) {
+                /*
+                 * Don't process the watchpoints when we are
+                 * in a reverse debugging operation.
+                 */
+                return;
+            }
             if (flags == BP_MEM_READ) {
                 wp->flags |= BP_WATCHPOINT_HIT_READ;
             } else {
diff --git a/gdbstub.c b/gdbstub.c
index 9dfb6e4142..79e8ccc050 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -51,6 +51,7 @@
 #include "sysemu/runstate.h"
 #include "hw/semihosting/semihost.h"
 #include "exec/exec-all.h"
+#include "sysemu/replay.h"
 
 #ifdef CONFIG_USER_ONLY
 #define GDB_ATTACHED "0"
@@ -375,6 +376,20 @@ typedef struct GDBState {
  */
 static int sstep_flags = SSTEP_ENABLE|SSTEP_NOIRQ|SSTEP_NOTIMER;
 
+/* Retrieves flags for single step mode. */
+static int get_sstep_flags(void)
+{
+    /*
+     * In replay mode all events written into the log should be replayed.
+     * That is why NOIRQ flag is removed in this mode.
+     */
+    if (replay_mode != REPLAY_MODE_NONE) {
+        return SSTEP_ENABLE;
+    } else {
+        return sstep_flags;
+    }
+}
+
 static GDBState gdbserver_state;
 
 static void init_gdbserver_state(void)
@@ -501,7 +516,7 @@ static int gdb_continue_partial(char *newstates)
                 break; /* nothing to do here */
             case 's':
                 trace_gdbstub_op_stepping(cpu->cpu_index);
-                cpu_single_step(cpu, sstep_flags);
+                cpu_single_step(cpu, get_sstep_flags());
                 cpu_resume(cpu);
                 flag = 1;
                 break;
@@ -1874,10 +1889,31 @@ static void handle_step(GdbCmdContext *gdb_ctx, void *user_ctx)
         gdb_set_cpu_pc((target_ulong)gdb_ctx->params[0].val_ull);
     }
 
-    cpu_single_step(gdbserver_state.c_cpu, sstep_flags);
+    cpu_single_step(gdbserver_state.c_cpu, get_sstep_flags());
     gdb_continue();
 }
 
+static void handle_backward(GdbCmdContext *gdb_ctx, void *user_ctx)
+{
+    if (replay_mode != REPLAY_MODE_PLAY) {
+        put_packet("E22");
+    }
+    if (gdb_ctx->num_params == 1) {
+        switch (gdb_ctx->params[0].opcode) {
+        case 's':
+            if (replay_reverse_step()) {
+                gdb_continue();
+            } else {
+                put_packet("E14");
+            }
+            return;
+        }
+    }
+
+    /* Default invalid command */
+    put_packet("");
+}
+
 static void handle_v_cont_query(GdbCmdContext *gdb_ctx, void *user_ctx)
 {
     put_packet("vCont;c;C;s;S");
@@ -2124,6 +2160,10 @@ static void handle_query_supported(GdbCmdContext *gdb_ctx, void *user_ctx)
         g_string_append(gdbserver_state.str_buf, ";qXfer:features:read+");
     }
 
+    if (replay_mode == REPLAY_MODE_PLAY) {
+        g_string_append(gdbserver_state.str_buf, ";ReverseStep+");
+    }
+
     if (gdb_ctx->num_params &&
         strstr(gdb_ctx->params[0].data, "multiprocess+")) {
         gdbserver_state.multiprocess = true;
@@ -2460,6 +2500,17 @@ static int gdb_handle_packet(const char *line_buf)
             cmd_parser = &step_cmd_desc;
         }
         break;
+    case 'b':
+        {
+            static const GdbCmdParseEntry backward_cmd_desc = {
+                .handler = handle_backward,
+                .cmd = "b",
+                .cmd_startswith = 1,
+                .schema = "o0"
+            };
+            cmd_parser = &backward_cmd_desc;
+        }
+        break;
     case 'F':
         {
             static const GdbCmdParseEntry file_io_cmd_desc = {
diff --git a/include/sysemu/replay.h b/include/sysemu/replay.h
index 239c01e7df..13a8123b09 100644
--- a/include/sysemu/replay.h
+++ b/include/sysemu/replay.h
@@ -75,6 +75,17 @@ void replay_finish(void);
 void replay_add_blocker(Error *reason);
 /* Returns name of the replay log file */
 const char *replay_get_filename(void);
+/*
+ * Start making one step in backward direction.
+ * Used by gdbstub for backwards debugging.
+ * Returns true on success.
+ */
+bool replay_reverse_step(void);
+/*
+ * Returns true if replay module is processing
+ * reverse_continue or reverse_step request
+ */
+bool replay_running_debug(void);
 
 /* Processing the instructions */
 
diff --git a/replay/replay-debugging.c b/replay/replay-debugging.c
index e1fe6b8661..1e1dec0295 100644
--- a/replay/replay-debugging.c
+++ b/replay/replay-debugging.c
@@ -22,6 +22,13 @@
 #include "block/snapshot.h"
 #include "migration/snapshot.h"
 
+static bool replay_is_debugging;
+
+bool replay_running_debug(void)
+{
+    return replay_is_debugging;
+}
+
 void hmp_info_replay(Monitor *mon, const QDict *qdict)
 {
     if (replay_mode == REPLAY_MODE_NONE) {
@@ -212,3 +219,30 @@ void hmp_replay_seek(Monitor *mon, const QDict *qdict)
         return;
     }
 }
+
+static void replay_stop_vm_debug(void *opaque)
+{
+    replay_is_debugging = false;
+    vm_stop(RUN_STATE_DEBUG);
+    replay_delete_break();
+}
+
+bool replay_reverse_step(void)
+{
+    Error *err = NULL;
+
+    assert(replay_mode == REPLAY_MODE_PLAY);
+
+    if (replay_get_current_icount() != 0) {
+        replay_seek(replay_get_current_icount() - 1,
+                    replay_stop_vm_debug, &err);
+        if (err) {
+            error_free(err);
+            return false;
+        }
+        replay_is_debugging = true;
+        return true;
+    }
+
+    return false;
+}
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index ac8940d52e..1fa9c4c1de 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -1004,9 +1004,17 @@ static bool cpu_can_run(CPUState *cpu)
 
 static void cpu_handle_guest_debug(CPUState *cpu)
 {
-    gdb_set_stop_cpu(cpu);
-    qemu_system_debug_request();
-    cpu->stopped = true;
+    if (replay_running_debug()) {
+        if (!cpu->singlestep_enabled) {
+            cpu_single_step(cpu, SSTEP_ENABLE);
+        } else {
+            cpu_single_step(cpu, 0);
+        }
+    } else {
+        gdb_set_stop_cpu(cpu);
+        qemu_system_debug_request();
+        cpu->stopped = true;
+    }
 }
 
 #ifdef CONFIG_LINUX
diff --git a/stubs/replay.c b/stubs/replay.c
index eacb366aa8..d5b52302e9 100644
--- a/stubs/replay.c
+++ b/stubs/replay.c
@@ -93,3 +93,8 @@ uint64_t replay_get_current_icount(void)
 {
     return 0;
 }
+
+bool replay_reverse_step(void)
+{
+    return false;
+}


