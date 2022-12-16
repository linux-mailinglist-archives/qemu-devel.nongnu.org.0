Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 396E764EA42
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 12:24:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p68nE-00026e-VD; Fri, 16 Dec 2022 06:22:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p68nC-00025T-82
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:22:18 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p68n7-00068q-L8
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:22:18 -0500
Received: by mail-wr1-x42a.google.com with SMTP id h12so2139348wrv.10
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 03:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zn2qZ2ED+XJpJJ6BWb3XW+ZOzHNM7ZYpmytU1qsqmpY=;
 b=UHxmpCFdv1E1LxXT1pErtesi58tkFKwwmb/54xYMkorg9Ts+867FhVPw+/yUOtbG/X
 cgZqcWppUeV4PAXjHTph4rpk9bZlNE3gMLra7biQqYBvQNBJZOqWnsVaqvg09sKtKl80
 5tX1TTAU9MSpCHFNeF4fkS8YGcRwRL/YV7RR/YKegH8FE6MFpItu9LgKwjcSl7da0I/+
 usOMz2Fq2yaj8v5pbKVw4Djjfi0LpZJ0O6Sw4TsJDfPbDBDOBJIQ+qexyb1OHTAifEY4
 hIC3Tl0LcgsKQDnl/X0uWtDugdGiYd/g1at99sdkEE9l/7jWtnNQd88GwpEsTMwPzYd5
 9Qng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zn2qZ2ED+XJpJJ6BWb3XW+ZOzHNM7ZYpmytU1qsqmpY=;
 b=RNBIZcXnQRV89tGqvdpmq1Q9qTVr+b6BjZkCsa27q68wDU+bZwgroAJxai3dESsOVB
 vxboIPyltkB55ynUNanAg9KKsm+OZbqdZyv6LZIZHYtQc02G/B9YdCJDFDGam7TbBQzh
 uQA+BRRY2hQG1/PuzizX3onf+HPG53KBO4aBhfgey6EwIMTlq/hrVvZOBYHKuYlVYxFf
 3t5RMGcQRTwfxhR8ABE/j4zMUAYBXA6Pd2ZNWmgPeCMiiX7os5P7WnYmuOkX4pJIGgmG
 YfvskRpBDa2CcpTIVec+UDlAwGtom82MYUOGtnZm1X7H7hIaarP0pD4/agvHfiqsTxoJ
 JsAw==
X-Gm-Message-State: ANoB5plSPP+nKXf3lcKuKQYpgbuDkWUXES6ZazC+pRfxk8+yW64CPqT/
 0Opf41lGLFFfOrnyVfSUQCGwXQ==
X-Google-Smtp-Source: AA0mqf4XeZnuWcwpJW5RUixoUBRP7BOr78HAL765uG632sN2bufrgXV81JWLjlOjWedHMG1ckPqMVA==
X-Received: by 2002:a5d:66c9:0:b0:242:5878:291e with SMTP id
 k9-20020a5d66c9000000b002425878291emr20107028wrw.51.1671189731791; 
 Fri, 16 Dec 2022 03:22:11 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 w12-20020adff9cc000000b0023c8026841csm2041836wrr.23.2022.12.16.03.22.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 03:22:09 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DE52A1FFB7;
 Fri, 16 Dec 2022 11:22:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v1 08/10] gdbstub: move chunk of softmmu functionality to own
 file
Date: Fri, 16 Dec 2022 11:22:04 +0000
Message-Id: <20221216112206.3171578-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221216112206.3171578-1-alex.bennee@linaro.org>
References: <20221216112206.3171578-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is mostly code motion but a number of things needed to be done
for this minimal patch set:

  - move shared structures to internals.h
  - convert some helpers to public gdb_ functions (via internals.h)
  - splitting some functions into user and softmmu versions
  - fixing a few casting issues to keep softmmu common

More CONFIG_USER_ONLY stuff will be handled in a following patches.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/internals.h  |  60 +++++
 gdbstub/gdbstub.c    | 618 ++++++++-----------------------------------
 gdbstub/softmmu.c    | 420 +++++++++++++++++++++++++++++
 gdbstub/trace-events |   4 +-
 4 files changed, 595 insertions(+), 507 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index 462a93e41c..50eac269c8 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -15,6 +15,18 @@
  * Shared structures and definitions
  */
 
+enum {
+    GDB_SIGNAL_0 = 0,
+    GDB_SIGNAL_INT = 2,
+    GDB_SIGNAL_QUIT = 3,
+    GDB_SIGNAL_TRAP = 5,
+    GDB_SIGNAL_ABRT = 6,
+    GDB_SIGNAL_ALRM = 14,
+    GDB_SIGNAL_IO = 23,
+    GDB_SIGNAL_XCPU = 24,
+    GDB_SIGNAL_UNKNOWN = 143
+};
+
 typedef struct GDBProcess {
     uint32_t pid;
     bool attached;
@@ -34,6 +46,9 @@ enum RSState {
 
 typedef struct GDBConnection GDBConnection;
 
+/* mode helper to initialise structure */
+GDBConnection *gdb_init_connection_data(void);
+
 typedef struct GDBState {
     bool init;       /* have we been initialised? */
     CPUState *c_cpu; /* current CPU for step/continue ops */
@@ -58,6 +73,51 @@ typedef struct GDBState {
     int supported_sstep_flags;
 } GDBState;
 
+/*
+ * Connection helpers for both softmmu and user backends
+ */
+void gdb_put_buffer(const uint8_t *buf, int len);
+int gdb_put_packet(const char *buf);
+void gdb_hextomem(GByteArray *mem, const char *buf, int len);
+void gdb_memtohex(GString *buf, const uint8_t *mem, int len);
+void gdb_read_byte(uint8_t ch);
+
+/* utility helpers */
+CPUState *gdb_first_attached_cpu(void);
+void gdb_append_thread_id(CPUState *cpu, GString *buf);
+int gdb_get_cpu_index(CPUState *cpu);
+
+void gdb_create_default_process(GDBState *s);
+
+/*
+ * Command handlers - either softmmu or user only
+ */
+void gdb_init_gdbserver_state(void);
+
+typedef enum GDBThreadIdKind {
+    GDB_ONE_THREAD = 0,
+    GDB_ALL_THREADS,     /* One process, all threads */
+    GDB_ALL_PROCESSES,
+    GDB_READ_THREAD_ERR
+} GDBThreadIdKind;
+
+typedef union GdbCmdVariant {
+    const char *data;
+    uint8_t opcode;
+    unsigned long val_ul;
+    unsigned long long val_ull;
+    struct {
+        GDBThreadIdKind kind;
+        uint32_t pid;
+        uint32_t tid;
+    } thread_id;
+} GdbCmdVariant;
+
+#define get_param(p, i)    (&g_array_index(p, GdbCmdVariant, i))
+
+void gdb_handle_query_rcmd(GArray *params, void *user_ctx); /* softmmu */
+
+
 /*
  * Break/Watch point support - there is an implementation for softmmu
  * and user mode.
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 28f97a55ea..ec4b6ac4e4 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -24,8 +24,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qapi/error.h"
-#include "qemu/error-report.h"
 #include "qemu/ctype.h"
 #include "qemu/cutils.h"
 #include "qemu/module.h"
@@ -34,9 +32,6 @@
 #ifdef CONFIG_USER_ONLY
 #include "qemu.h"
 #else
-#include "monitor/monitor.h"
-#include "chardev/char.h"
-#include "chardev/char-fe.h"
 #include "hw/cpu/cluster.h"
 #include "hw/boards.h"
 #endif
@@ -85,32 +80,18 @@ static inline int target_memory_rw_debug(CPUState *cpu, target_ulong addr,
     return cpu_memory_rw_debug(cpu, addr, buf, len, is_write);
 }
 
-/* Return the GDB index for a given vCPU state.
+/*
+ * Return the GDB index for a given vCPU state.
  *
- * For user mode this is simply the thread id. In system mode GDB
- * numbers CPUs from 1 as 0 is reserved as an "any cpu" index.
+ * For user mode this is simply the thread id.
  */
-static inline int cpu_gdb_index(CPUState *cpu)
-{
 #if defined(CONFIG_USER_ONLY)
+int gdb_get_cpu_index(CPUState *cpu)
+{
     TaskState *ts = (TaskState *) cpu->opaque;
     return ts ? ts->ts_tid : -1;
-#else
-    return cpu->cpu_index + 1;
-#endif
 }
-
-enum {
-    GDB_SIGNAL_0 = 0,
-    GDB_SIGNAL_INT = 2,
-    GDB_SIGNAL_QUIT = 3,
-    GDB_SIGNAL_TRAP = 5,
-    GDB_SIGNAL_ABRT = 6,
-    GDB_SIGNAL_ALRM = 14,
-    GDB_SIGNAL_IO = 23,
-    GDB_SIGNAL_XCPU = 24,
-    GDB_SIGNAL_UNKNOWN = 143
-};
+#endif
 
 #ifdef CONFIG_USER_ONLY
 
@@ -331,16 +312,11 @@ typedef struct GDBConnection {
     char *socket_path;
     int running_state;
 } GDBConnection;
-#else
-typedef struct GDBConnection {
-    CharBackend chr;
-    Chardev *mon_chr;
-} GDBConnection;
 #endif
 
-static GDBState gdbserver_state;
+GDBState gdbserver_state;
 
-static void init_gdbserver_state(void)
+void gdb_init_gdbserver_state(void)
 {
     g_assert(!gdbserver_state.init);
     memset(&gdbserver_state, 0, sizeof(GDBState));
@@ -362,17 +338,12 @@ static void init_gdbserver_state(void)
      * The following is differs depending on USER/SOFTMMU, we just
      * hid it in the typedef.
      */
+#ifdef CONFIG_USER_ONLY
     gdbserver_state.connection = g_new(GDBConnection, 1);
-}
-
-#ifndef CONFIG_USER_ONLY
-static void reset_gdbserver_state(void)
-{
-    g_free(gdbserver_state.processes);
-    gdbserver_state.processes = NULL;
-    gdbserver_state.process_num = 0;
-}
+#else
+    gdbserver_state.connection = gdb_init_connection_data();
 #endif
+}
 
 bool gdb_has_xml;
 
@@ -528,9 +499,9 @@ static int gdb_continue_partial(char *newstates)
     return res;
 }
 
-static void put_buffer(const uint8_t *buf, int len)
-{
 #ifdef CONFIG_USER_ONLY
+void gdb_put_buffer(const uint8_t *buf, int len)
+{
     int ret;
 
     while (len > 0) {
@@ -543,12 +514,8 @@ static void put_buffer(const uint8_t *buf, int len)
             len -= ret;
         }
     }
-#else
-    /* XXX this blocks entire thread. Rewrite to use
-     * qemu_chr_fe_write and background I/O callbacks */
-    qemu_chr_fe_write_all(&gdbserver_state.connection->chr, buf, len);
-#endif
 }
+#endif
 
 static inline int fromhex(int v)
 {
@@ -571,7 +538,7 @@ static inline int tohex(int v)
 }
 
 /* writes 2*len+1 bytes in buf */
-static void memtohex(GString *buf, const uint8_t *mem, int len)
+void gdb_memtohex(GString *buf, const uint8_t *mem, int len)
 {
     int i, c;
     for(i = 0; i < len; i++) {
@@ -582,7 +549,7 @@ static void memtohex(GString *buf, const uint8_t *mem, int len)
     g_string_append_c(buf, '\0');
 }
 
-static void hextomem(GByteArray *mem, const char *buf, int len)
+void gdb_hextomem(GByteArray *mem, const char *buf, int len)
 {
     int i;
 
@@ -651,7 +618,7 @@ static int put_packet_binary(const char *buf, int len, bool dump)
         footer[2] = tohex((csum) & 0xf);
         g_byte_array_append(gdbserver_state.last_packet, footer, 3);
 
-        put_buffer(gdbserver_state.last_packet->data,
+        gdb_put_buffer(gdbserver_state.last_packet->data,
                    gdbserver_state.last_packet->len);
 
 #ifdef CONFIG_USER_ONLY
@@ -668,7 +635,7 @@ static int put_packet_binary(const char *buf, int len, bool dump)
 }
 
 /* return -1 if error, 0 if OK */
-static int put_packet(const char *buf)
+int gdb_put_packet(const char *buf)
 {
     trace_gdbstub_io_reply(buf);
 
@@ -677,7 +644,7 @@ static int put_packet(const char *buf)
 
 static void put_strbuf(void)
 {
-    put_packet(gdbserver_state.str_buf->str);
+    gdb_put_packet(gdbserver_state.str_buf->str);
 }
 
 /* Encode data using the encoding for 'x' packets.  */
@@ -738,7 +705,7 @@ static CPUState *find_cpu(uint32_t thread_id)
     CPUState *cpu;
 
     CPU_FOREACH(cpu) {
-        if (cpu_gdb_index(cpu) == thread_id) {
+        if (gdb_get_cpu_index(cpu) == thread_id) {
             return cpu;
         }
     }
@@ -792,7 +759,7 @@ static CPUState *gdb_next_attached_cpu(CPUState *cpu)
 }
 
 /* Return the first attached cpu */
-static CPUState *gdb_first_attached_cpu(void)
+CPUState *gdb_first_attached_cpu(void)
 {
     CPUState *cpu = first_cpu;
     GDBProcess *process = gdb_get_cpu_process(cpu);
@@ -1006,23 +973,16 @@ static void gdb_set_cpu_pc(target_ulong pc)
     cpu_set_pc(cpu, pc);
 }
 
-static void gdb_append_thread_id(CPUState *cpu, GString *buf)
+void gdb_append_thread_id(CPUState *cpu, GString *buf)
 {
     if (gdbserver_state.multiprocess) {
         g_string_append_printf(buf, "p%02x.%02x",
-                               gdb_get_cpu_pid(cpu), cpu_gdb_index(cpu));
+                               gdb_get_cpu_pid(cpu), gdb_get_cpu_index(cpu));
     } else {
-        g_string_append_printf(buf, "%02x", cpu_gdb_index(cpu));
+        g_string_append_printf(buf, "%02x", gdb_get_cpu_index(cpu));
     }
 }
 
-typedef enum GDBThreadIdKind {
-    GDB_ONE_THREAD = 0,
-    GDB_ALL_THREADS,     /* One process, all threads */
-    GDB_ALL_PROCESSES,
-    GDB_READ_THREAD_ERR
-} GDBThreadIdKind;
-
 static GDBThreadIdKind read_thread_id(const char *buf, const char **end_buf,
                                       uint32_t *pid, uint32_t *tid)
 {
@@ -1203,20 +1163,6 @@ out:
     return res;
 }
 
-typedef union GdbCmdVariant {
-    const char *data;
-    uint8_t opcode;
-    unsigned long val_ul;
-    unsigned long long val_ull;
-    struct {
-        GDBThreadIdKind kind;
-        uint32_t pid;
-        uint32_t tid;
-    } thread_id;
-} GdbCmdVariant;
-
-#define get_param(p, i)    (&g_array_index(p, GdbCmdVariant, i))
-
 static const char *cmd_next_param(const char *param, const char delimiter)
 {
     static const char all_delimiters[] = ",;:=";
@@ -1383,7 +1329,7 @@ static void run_cmd_parser(const char *data, const GdbCmdParseEntry *cmd)
     /* In case there was an error during the command parsing we must
     * send a NULL packet to indicate the command is not supported */
     if (process_string_cmd(NULL, data, cmd, 1)) {
-        put_packet("");
+        gdb_put_packet("");
     }
 }
 
@@ -1394,7 +1340,7 @@ static void handle_detach(GArray *params, void *user_ctx)
 
     if (gdbserver_state.multiprocess) {
         if (!params->len) {
-            put_packet("E22");
+            gdb_put_packet("E22");
             return;
         }
 
@@ -1418,7 +1364,7 @@ static void handle_detach(GArray *params, void *user_ctx)
         gdb_syscall_mode = GDB_SYS_DISABLED;
         gdb_continue();
     }
-    put_packet("OK");
+    gdb_put_packet("OK");
 }
 
 static void handle_thread_alive(GArray *params, void *user_ctx)
@@ -1426,23 +1372,23 @@ static void handle_thread_alive(GArray *params, void *user_ctx)
     CPUState *cpu;
 
     if (!params->len) {
-        put_packet("E22");
+        gdb_put_packet("E22");
         return;
     }
 
     if (get_param(params, 0)->thread_id.kind == GDB_READ_THREAD_ERR) {
-        put_packet("E22");
+        gdb_put_packet("E22");
         return;
     }
 
     cpu = gdb_get_cpu(get_param(params, 0)->thread_id.pid,
                       get_param(params, 0)->thread_id.tid);
     if (!cpu) {
-        put_packet("E22");
+        gdb_put_packet("E22");
         return;
     }
 
-    put_packet("OK");
+    gdb_put_packet("OK");
 }
 
 static void handle_continue(GArray *params, void *user_ctx)
@@ -1479,24 +1425,24 @@ static void handle_set_thread(GArray *params, void *user_ctx)
     CPUState *cpu;
 
     if (params->len != 2) {
-        put_packet("E22");
+        gdb_put_packet("E22");
         return;
     }
 
     if (get_param(params, 1)->thread_id.kind == GDB_READ_THREAD_ERR) {
-        put_packet("E22");
+        gdb_put_packet("E22");
         return;
     }
 
     if (get_param(params, 1)->thread_id.kind != GDB_ONE_THREAD) {
-        put_packet("OK");
+        gdb_put_packet("OK");
         return;
     }
 
     cpu = gdb_get_cpu(get_param(params, 1)->thread_id.pid,
                       get_param(params, 1)->thread_id.tid);
     if (!cpu) {
-        put_packet("E22");
+        gdb_put_packet("E22");
         return;
     }
 
@@ -1507,14 +1453,14 @@ static void handle_set_thread(GArray *params, void *user_ctx)
     switch (get_param(params, 0)->opcode) {
     case 'c':
         gdbserver_state.c_cpu = cpu;
-        put_packet("OK");
+        gdb_put_packet("OK");
         break;
     case 'g':
         gdbserver_state.g_cpu = cpu;
-        put_packet("OK");
+        gdb_put_packet("OK");
         break;
     default:
-        put_packet("E22");
+        gdb_put_packet("E22");
         break;
     }
 }
@@ -1524,7 +1470,7 @@ static void handle_insert_bp(GArray *params, void *user_ctx)
     int res;
 
     if (params->len != 3) {
-        put_packet("E22");
+        gdb_put_packet("E22");
         return;
     }
 
@@ -1533,14 +1479,14 @@ static void handle_insert_bp(GArray *params, void *user_ctx)
                                 get_param(params, 1)->val_ull,
                                 get_param(params, 2)->val_ull);
     if (res >= 0) {
-        put_packet("OK");
+        gdb_put_packet("OK");
         return;
     } else if (res == -ENOSYS) {
-        put_packet("");
+        gdb_put_packet("");
         return;
     }
 
-    put_packet("E22");
+    gdb_put_packet("E22");
 }
 
 static void handle_remove_bp(GArray *params, void *user_ctx)
@@ -1548,7 +1494,7 @@ static void handle_remove_bp(GArray *params, void *user_ctx)
     int res;
 
     if (params->len != 3) {
-        put_packet("E22");
+        gdb_put_packet("E22");
         return;
     }
 
@@ -1557,14 +1503,14 @@ static void handle_remove_bp(GArray *params, void *user_ctx)
                                 get_param(params, 1)->val_ull,
                                 get_param(params, 2)->val_ull);
     if (res >= 0) {
-        put_packet("OK");
+        gdb_put_packet("OK");
         return;
     } else if (res == -ENOSYS) {
-        put_packet("");
+        gdb_put_packet("");
         return;
     }
 
-    put_packet("E22");
+    gdb_put_packet("E22");
 }
 
 /*
@@ -1583,20 +1529,20 @@ static void handle_set_reg(GArray *params, void *user_ctx)
     int reg_size;
 
     if (!gdb_has_xml) {
-        put_packet("");
+        gdb_put_packet("");
         return;
     }
 
     if (params->len != 2) {
-        put_packet("E22");
+        gdb_put_packet("E22");
         return;
     }
 
     reg_size = strlen(get_param(params, 1)->data) / 2;
-    hextomem(gdbserver_state.mem_buf, get_param(params, 1)->data, reg_size);
+    gdb_hextomem(gdbserver_state.mem_buf, get_param(params, 1)->data, reg_size);
     gdb_write_register(gdbserver_state.g_cpu, gdbserver_state.mem_buf->data,
                        get_param(params, 0)->val_ull);
-    put_packet("OK");
+    gdb_put_packet("OK");
 }
 
 static void handle_get_reg(GArray *params, void *user_ctx)
@@ -1604,12 +1550,12 @@ static void handle_get_reg(GArray *params, void *user_ctx)
     int reg_size;
 
     if (!gdb_has_xml) {
-        put_packet("");
+        gdb_put_packet("");
         return;
     }
 
     if (!params->len) {
-        put_packet("E14");
+        gdb_put_packet("E14");
         return;
     }
 
@@ -1617,53 +1563,53 @@ static void handle_get_reg(GArray *params, void *user_ctx)
                                  gdbserver_state.mem_buf,
                                  get_param(params, 0)->val_ull);
     if (!reg_size) {
-        put_packet("E14");
+        gdb_put_packet("E14");
         return;
     } else {
         g_byte_array_set_size(gdbserver_state.mem_buf, reg_size);
     }
 
-    memtohex(gdbserver_state.str_buf, gdbserver_state.mem_buf->data, reg_size);
+    gdb_memtohex(gdbserver_state.str_buf, gdbserver_state.mem_buf->data, reg_size);
     put_strbuf();
 }
 
 static void handle_write_mem(GArray *params, void *user_ctx)
 {
     if (params->len != 3) {
-        put_packet("E22");
+        gdb_put_packet("E22");
         return;
     }
 
-    /* hextomem() reads 2*len bytes */
+    /* gdb_hextomem() reads 2*len bytes */
     if (get_param(params, 1)->val_ull >
         strlen(get_param(params, 2)->data) / 2) {
-        put_packet("E22");
+        gdb_put_packet("E22");
         return;
     }
 
-    hextomem(gdbserver_state.mem_buf, get_param(params, 2)->data,
+    gdb_hextomem(gdbserver_state.mem_buf, get_param(params, 2)->data,
              get_param(params, 1)->val_ull);
     if (target_memory_rw_debug(gdbserver_state.g_cpu,
                                get_param(params, 0)->val_ull,
                                gdbserver_state.mem_buf->data,
                                gdbserver_state.mem_buf->len, true)) {
-        put_packet("E14");
+        gdb_put_packet("E14");
         return;
     }
 
-    put_packet("OK");
+    gdb_put_packet("OK");
 }
 
 static void handle_read_mem(GArray *params, void *user_ctx)
 {
     if (params->len != 2) {
-        put_packet("E22");
+        gdb_put_packet("E22");
         return;
     }
 
-    /* memtohex() doubles the required space */
+    /* gdb_memtohex() doubles the required space */
     if (get_param(params, 1)->val_ull > MAX_PACKET_LENGTH / 2) {
-        put_packet("E22");
+        gdb_put_packet("E22");
         return;
     }
 
@@ -1674,11 +1620,11 @@ static void handle_read_mem(GArray *params, void *user_ctx)
                                get_param(params, 0)->val_ull,
                                gdbserver_state.mem_buf->data,
                                gdbserver_state.mem_buf->len, false)) {
-        put_packet("E14");
+        gdb_put_packet("E14");
         return;
     }
 
-    memtohex(gdbserver_state.str_buf, gdbserver_state.mem_buf->data,
+    gdb_memtohex(gdbserver_state.str_buf, gdbserver_state.mem_buf->data,
              gdbserver_state.mem_buf->len);
     put_strbuf();
 }
@@ -1695,7 +1641,7 @@ static void handle_write_all_regs(GArray *params, void *user_ctx)
 
     cpu_synchronize_state(gdbserver_state.g_cpu);
     len = strlen(get_param(params, 0)->data) / 2;
-    hextomem(gdbserver_state.mem_buf, get_param(params, 0)->data, len);
+    gdb_hextomem(gdbserver_state.mem_buf, get_param(params, 0)->data, len);
     registers = gdbserver_state.mem_buf->data;
     for (addr = 0; addr < gdbserver_state.g_cpu->gdb_num_g_regs && len > 0;
          addr++) {
@@ -1703,7 +1649,7 @@ static void handle_write_all_regs(GArray *params, void *user_ctx)
         len -= reg_size;
         registers += reg_size;
     }
-    put_packet("OK");
+    gdb_put_packet("OK");
 }
 
 static void handle_read_all_regs(GArray *params, void *user_ctx)
@@ -1720,7 +1666,7 @@ static void handle_read_all_regs(GArray *params, void *user_ctx)
     }
     g_assert(len == gdbserver_state.mem_buf->len);
 
-    memtohex(gdbserver_state.str_buf, gdbserver_state.mem_buf->data, len);
+    gdb_memtohex(gdbserver_state.str_buf, gdbserver_state.mem_buf->data, len);
     put_strbuf();
 }
 
@@ -1772,7 +1718,7 @@ static void handle_file_io(GArray *params, void *user_ctx)
     }
 
     if (params->len >= 3 && get_param(params, 2)->opcode == (uint8_t)'C') {
-        put_packet("T02");
+        gdb_put_packet("T02");
         return;
     }
 
@@ -1792,7 +1738,7 @@ static void handle_step(GArray *params, void *user_ctx)
 static void handle_backward(GArray *params, void *user_ctx)
 {
     if (!stub_can_reverse()) {
-        put_packet("E22");
+        gdb_put_packet("E22");
     }
     if (params->len == 1) {
         switch (get_param(params, 0)->opcode) {
@@ -1800,26 +1746,26 @@ static void handle_backward(GArray *params, void *user_ctx)
             if (replay_reverse_step()) {
                 gdb_continue();
             } else {
-                put_packet("E14");
+                gdb_put_packet("E14");
             }
             return;
         case 'c':
             if (replay_reverse_continue()) {
                 gdb_continue();
             } else {
-                put_packet("E14");
+                gdb_put_packet("E14");
             }
             return;
         }
     }
 
     /* Default invalid command */
-    put_packet("");
+    gdb_put_packet("");
 }
 
 static void handle_v_cont_query(GArray *params, void *user_ctx)
 {
-    put_packet("vCont;c;C;s;S");
+    gdb_put_packet("vCont;c;C;s;S");
 }
 
 static void handle_v_cont(GArray *params, void *user_ctx)
@@ -1832,9 +1778,9 @@ static void handle_v_cont(GArray *params, void *user_ctx)
 
     res = gdb_handle_vcont(get_param(params, 0)->data);
     if ((res == -EINVAL) || (res == -ERANGE)) {
-        put_packet("E22");
+        gdb_put_packet("E22");
     } else if (res) {
-        put_packet("");
+        gdb_put_packet("");
     }
 }
 
@@ -1872,7 +1818,7 @@ cleanup:
 static void handle_v_kill(GArray *params, void *user_ctx)
 {
     /* Kill the target */
-    put_packet("OK");
+    gdb_put_packet("OK");
     error_report("QEMU: Terminated via GDBstub");
     gdb_exit(0);
     exit(0);
@@ -1913,7 +1859,7 @@ static void handle_v_commands(GArray *params, void *user_ctx)
     if (process_string_cmd(NULL, get_param(params, 0)->data,
                            gdb_v_commands_table,
                            ARRAY_SIZE(gdb_v_commands_table))) {
-        put_packet("");
+        gdb_put_packet("");
     }
 }
 
@@ -1945,12 +1891,12 @@ static void handle_set_qemu_sstep(GArray *params, void *user_ctx)
     new_sstep_flags = get_param(params, 0)->val_ul;
 
     if (new_sstep_flags  & ~gdbserver_state.supported_sstep_flags) {
-        put_packet("E22");
+        gdb_put_packet("E22");
         return;
     }
 
     gdbserver_state.sstep_flags = new_sstep_flags;
-    put_packet("OK");
+    gdb_put_packet("OK");
 }
 
 static void handle_query_qemu_sstep(GArray *params, void *user_ctx)
@@ -1980,7 +1926,7 @@ static void handle_query_curr_tid(GArray *params, void *user_ctx)
 static void handle_query_threads(GArray *params, void *user_ctx)
 {
     if (!gdbserver_state.query_cpu) {
-        put_packet("l");
+        gdb_put_packet("l");
         return;
     }
 
@@ -2003,7 +1949,7 @@ static void handle_query_thread_extra(GArray *params, void *user_ctx)
 
     if (!params->len ||
         get_param(params, 0)->thread_id.kind == GDB_READ_THREAD_ERR) {
-        put_packet("E22");
+        gdb_put_packet("E22");
         return;
     }
 
@@ -2028,7 +1974,7 @@ static void handle_query_thread_extra(GArray *params, void *user_ctx)
                         cpu->halted ? "halted " : "running");
     }
     trace_gdbstub_op_extra_info(rs->str);
-    memtohex(gdbserver_state.str_buf, (uint8_t *)rs->str, rs->len);
+    gdb_memtohex(gdbserver_state.str_buf, (uint8_t *)rs->str, rs->len);
     put_strbuf();
 }
 
@@ -2047,32 +1993,6 @@ static void handle_query_offsets(GArray *params, void *user_ctx)
                     ts->info->data_offset);
     put_strbuf();
 }
-#else
-static void handle_query_rcmd(GArray *params, void *user_ctx)
-{
-    const guint8 zero = 0;
-    int len;
-
-    if (!params->len) {
-        put_packet("E22");
-        return;
-    }
-
-    len = strlen(get_param(params, 0)->data);
-    if (len % 2) {
-        put_packet("E01");
-        return;
-    }
-
-    g_assert(gdbserver_state.mem_buf->len == 0);
-    len = len / 2;
-    hextomem(gdbserver_state.mem_buf, get_param(params, 0)->data, len);
-    g_byte_array_append(gdbserver_state.mem_buf, &zero, 1);
-    qemu_chr_be_write(gdbserver_state.connection->mon_chr,
-                      gdbserver_state.mem_buf->data,
-                      gdbserver_state.mem_buf->len);
-    put_packet("OK");
-}
 #endif
 
 static void handle_query_supported(GArray *params, void *user_ctx)
@@ -2114,14 +2034,14 @@ static void handle_query_xfer_features(GArray *params, void *user_ctx)
     const char *p;
 
     if (params->len < 3) {
-        put_packet("E22");
+        gdb_put_packet("E22");
         return;
     }
 
     process = gdb_get_cpu_process(gdbserver_state.g_cpu);
     cc = CPU_GET_CLASS(gdbserver_state.g_cpu);
     if (!cc->gdb_core_xml_file) {
-        put_packet("");
+        gdb_put_packet("");
         return;
     }
 
@@ -2129,7 +2049,7 @@ static void handle_query_xfer_features(GArray *params, void *user_ctx)
     p = get_param(params, 0)->data;
     xml = get_feature_xml(p, &p, process);
     if (!xml) {
-        put_packet("E00");
+        gdb_put_packet("E00");
         return;
     }
 
@@ -2137,7 +2057,7 @@ static void handle_query_xfer_features(GArray *params, void *user_ctx)
     len = get_param(params, 2)->val_ul;
     total_len = strlen(xml);
     if (addr > total_len) {
-        put_packet("E00");
+        gdb_put_packet("E00");
         return;
     }
 
@@ -2164,7 +2084,7 @@ static void handle_query_xfer_auxv(GArray *params, void *user_ctx)
     unsigned long offset, len, saved_auxv, auxv_len;
 
     if (params->len < 2) {
-        put_packet("E22");
+        gdb_put_packet("E22");
         return;
     }
 
@@ -2175,7 +2095,7 @@ static void handle_query_xfer_auxv(GArray *params, void *user_ctx)
     auxv_len = ts->info->auxv_len;
 
     if (offset >= auxv_len) {
-        put_packet("E00");
+        gdb_put_packet("E00");
         return;
     }
 
@@ -2193,7 +2113,7 @@ static void handle_query_xfer_auxv(GArray *params, void *user_ctx)
     g_byte_array_set_size(gdbserver_state.mem_buf, len);
     if (target_memory_rw_debug(gdbserver_state.g_cpu, saved_auxv + offset,
                                gdbserver_state.mem_buf->data, len, false)) {
-        put_packet("E14");
+        gdb_put_packet("E14");
         return;
     }
 
@@ -2206,7 +2126,7 @@ static void handle_query_xfer_auxv(GArray *params, void *user_ctx)
 
 static void handle_query_attached(GArray *params, void *user_ctx)
 {
-    put_packet(GDB_ATTACHED);
+    gdb_put_packet(GDB_ATTACHED);
 }
 
 static void handle_query_qemu_supported(GArray *params, void *user_ctx)
@@ -2229,7 +2149,7 @@ static void handle_query_qemu_phy_mem_mode(GArray *params,
 static void handle_set_qemu_phy_mem_mode(GArray *params, void *user_ctx)
 {
     if (!params->len) {
-        put_packet("E22");
+        gdb_put_packet("E22");
         return;
     }
 
@@ -2238,7 +2158,7 @@ static void handle_set_qemu_phy_mem_mode(GArray *params, void *user_ctx)
     } else {
         phy_memory_mode = 1;
     }
-    put_packet("OK");
+    gdb_put_packet("OK");
 }
 #endif
 
@@ -2286,7 +2206,7 @@ static const GdbCmdParseEntry gdb_gen_query_table[] = {
     },
 #else
     {
-        .handler = handle_query_rcmd,
+        .handler = gdb_handle_query_rcmd,
         .cmd = "Rcmd,",
         .cmd_startswith = 1,
         .schema = "s0"
@@ -2371,7 +2291,7 @@ static void handle_gen_query(GArray *params, void *user_ctx)
     if (process_string_cmd(NULL, get_param(params, 0)->data,
                            gdb_gen_query_table,
                            ARRAY_SIZE(gdb_gen_query_table))) {
-        put_packet("");
+        gdb_put_packet("");
     }
 }
 
@@ -2390,7 +2310,7 @@ static void handle_gen_set(GArray *params, void *user_ctx)
     if (process_string_cmd(NULL, get_param(params, 0)->data,
                            gdb_gen_set_table,
                            ARRAY_SIZE(gdb_gen_set_table))) {
-        put_packet("");
+        gdb_put_packet("");
     }
 }
 
@@ -2416,7 +2336,7 @@ static int gdb_handle_packet(const char *line_buf)
 
     switch (line_buf[0]) {
     case '!':
-        put_packet("OK");
+        gdb_put_packet("OK");
         break;
     case '?':
         {
@@ -2643,7 +2563,7 @@ static int gdb_handle_packet(const char *line_buf)
         break;
     default:
         /* put empty packet */
-        put_packet("");
+        gdb_put_packet("");
         break;
     }
 
@@ -2670,100 +2590,6 @@ void gdb_set_stop_cpu(CPUState *cpu)
     gdbserver_state.g_cpu = cpu;
 }
 
-#ifndef CONFIG_USER_ONLY
-static void gdb_vm_state_change(void *opaque, bool running, RunState state)
-{
-    CPUState *cpu = gdbserver_state.c_cpu;
-    g_autoptr(GString) buf = g_string_new(NULL);
-    g_autoptr(GString) tid = g_string_new(NULL);
-    const char *type;
-    int ret;
-
-    if (running || gdbserver_state.state == RS_INACTIVE) {
-        return;
-    }
-    /* Is there a GDB syscall waiting to be sent?  */
-    if (gdbserver_state.current_syscall_cb) {
-        put_packet(gdbserver_state.syscall_buf);
-        return;
-    }
-
-    if (cpu == NULL) {
-        /* No process attached */
-        return;
-    }
-
-    gdb_append_thread_id(cpu, tid);
-
-    switch (state) {
-    case RUN_STATE_DEBUG:
-        if (cpu->watchpoint_hit) {
-            switch (cpu->watchpoint_hit->flags & BP_MEM_ACCESS) {
-            case BP_MEM_READ:
-                type = "r";
-                break;
-            case BP_MEM_ACCESS:
-                type = "a";
-                break;
-            default:
-                type = "";
-                break;
-            }
-            trace_gdbstub_hit_watchpoint(type, cpu_gdb_index(cpu),
-                    (target_ulong)cpu->watchpoint_hit->vaddr);
-            g_string_printf(buf, "T%02xthread:%s;%swatch:" TARGET_FMT_lx ";",
-                            GDB_SIGNAL_TRAP, tid->str, type,
-                            (target_ulong)cpu->watchpoint_hit->vaddr);
-            cpu->watchpoint_hit = NULL;
-            goto send_packet;
-        } else {
-            trace_gdbstub_hit_break();
-        }
-        tb_flush(cpu);
-        ret = GDB_SIGNAL_TRAP;
-        break;
-    case RUN_STATE_PAUSED:
-        trace_gdbstub_hit_paused();
-        ret = GDB_SIGNAL_INT;
-        break;
-    case RUN_STATE_SHUTDOWN:
-        trace_gdbstub_hit_shutdown();
-        ret = GDB_SIGNAL_QUIT;
-        break;
-    case RUN_STATE_IO_ERROR:
-        trace_gdbstub_hit_io_error();
-        ret = GDB_SIGNAL_IO;
-        break;
-    case RUN_STATE_WATCHDOG:
-        trace_gdbstub_hit_watchdog();
-        ret = GDB_SIGNAL_ALRM;
-        break;
-    case RUN_STATE_INTERNAL_ERROR:
-        trace_gdbstub_hit_internal_error();
-        ret = GDB_SIGNAL_ABRT;
-        break;
-    case RUN_STATE_SAVE_VM:
-    case RUN_STATE_RESTORE_VM:
-        return;
-    case RUN_STATE_FINISH_MIGRATE:
-        ret = GDB_SIGNAL_XCPU;
-        break;
-    default:
-        trace_gdbstub_hit_unknown(state);
-        ret = GDB_SIGNAL_UNKNOWN;
-        break;
-    }
-    gdb_set_stop_cpu(cpu);
-    g_string_printf(buf, "T%02xthread:%s;", ret, tid->str);
-
-send_packet:
-    put_packet(buf->str);
-
-    /* disable single step if it was enabled */
-    cpu_single_step(cpu, 0);
-}
-#endif
-
 /* Send a gdb syscall request.
    This accepts limited printf-style format specifiers, specifically:
     %x  - target_ulong argument printed in hex.
@@ -2818,7 +2644,7 @@ void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va)
     }
     *p = 0;
 #ifdef CONFIG_USER_ONLY
-    put_packet(gdbserver_state.syscall_buf);
+    gdb_put_packet(gdbserver_state.syscall_buf);
     /* Return control to gdb for it to process the syscall request.
      * Since the protocol requires that gdb hands control back to us
      * using a "here are the results" F packet, we don't need to check
@@ -2846,7 +2672,7 @@ void gdb_do_syscall(gdb_syscall_complete_cb cb, const char *fmt, ...)
     va_end(va);
 }
 
-static void gdb_read_byte(uint8_t ch)
+void gdb_read_byte(uint8_t ch)
 {
     uint8_t reply;
 
@@ -2856,7 +2682,7 @@ static void gdb_read_byte(uint8_t ch)
            of a new command then abandon the previous response.  */
         if (ch == '-') {
             trace_gdbstub_err_got_nack();
-            put_buffer(gdbserver_state.last_packet->data,
+            gdb_put_buffer(gdbserver_state.last_packet->data,
                        gdbserver_state.last_packet->len);
         } else if (ch == '+') {
             trace_gdbstub_io_got_ack();
@@ -2978,12 +2804,12 @@ static void gdb_read_byte(uint8_t ch)
                 trace_gdbstub_err_checksum_incorrect(gdbserver_state.line_sum, gdbserver_state.line_csum);
                 /* send NAK reply */
                 reply = '-';
-                put_buffer(&reply, 1);
+                gdb_put_buffer(&reply, 1);
                 gdbserver_state.state = RS_IDLE;
             } else {
                 /* send ACK reply */
                 reply = '+';
-                put_buffer(&reply, 1);
+                gdb_put_buffer(&reply, 1);
                 gdbserver_state.state = gdb_handle_packet(gdbserver_state.line_buf);
             }
             break;
@@ -2993,6 +2819,7 @@ static void gdb_read_byte(uint8_t ch)
     }
 }
 
+#ifdef CONFIG_USER_ONLY
 /* Tell the remote gdb that the process has exited.  */
 void gdb_exit(int code)
 {
@@ -3001,31 +2828,26 @@ void gdb_exit(int code)
   if (!gdbserver_state.init) {
       return;
   }
-#ifdef CONFIG_USER_ONLY
   if (gdbserver_state.connection->socket_path) {
       unlink(gdbserver_state.connection->socket_path);
   }
   if (gdbserver_state.connection->fd < 0) {
       return;
   }
-#endif
 
   trace_gdbstub_op_exiting((uint8_t)code);
 
   snprintf(buf, sizeof(buf), "W%02x", (uint8_t)code);
-  put_packet(buf);
-
-#ifndef CONFIG_USER_ONLY
-  qemu_chr_fe_deinit(&gdbserver_state.connection->chr, true);
-#endif
+  gdb_put_packet(buf);
 }
+#endif
 
 /*
  * Create the process that will contain all the "orphan" CPUs (that are not
  * part of a CPU cluster). Note that if this process contains no CPUs, it won't
  * be attachable and thus will be invisible to the user.
  */
-static void create_default_process(GDBState *s)
+void gdb_create_default_process(GDBState *s)
 {
     GDBProcess *process;
     int max_pid = 0;
@@ -3068,7 +2890,7 @@ gdb_handlesig(CPUState *cpu, int sig)
         g_string_append_c(gdbserver_state.str_buf, ';');
         put_strbuf();
     }
-    /* put_packet() might have detected that the peer terminated the
+    /* gdb_put_packet() might have detected that the peer terminated the
        connection.  */
     if (gdbserver_state.connection->fd < 0) {
         return sig;
@@ -3110,13 +2932,13 @@ void gdb_signalled(CPUArchState *env, int sig)
     }
 
     snprintf(buf, sizeof(buf), "X%02x", target_signal_to_gdb(sig));
-    put_packet(buf);
+    gdb_put_packet(buf);
 }
 
 static void gdb_accept_init(int fd)
 {
-    init_gdbserver_state();
-    create_default_process(&gdbserver_state);
+    gdb_init_gdbserver_state();
+    gdb_create_default_process(&gdbserver_state);
     gdbserver_state.processes[0].attached = true;
     gdbserver_state.c_cpu = gdb_first_attached_cpu();
     gdbserver_state.g_cpu = gdbserver_state.c_cpu;
@@ -3273,220 +3095,4 @@ void gdbserver_fork(CPUState *cpu)
     cpu_watchpoint_remove_all(cpu, BP_GDB);
 }
 #else
-static int gdb_chr_can_receive(void *opaque)
-{
-  /* We can handle an arbitrarily large amount of data.
-   Pick the maximum packet size, which is as good as anything.  */
-  return MAX_PACKET_LENGTH;
-}
-
-static void gdb_chr_receive(void *opaque, const uint8_t *buf, int size)
-{
-    int i;
-
-    for (i = 0; i < size; i++) {
-        gdb_read_byte(buf[i]);
-    }
-}
-
-static void gdb_chr_event(void *opaque, QEMUChrEvent event)
-{
-    int i;
-    GDBState *s = (GDBState *) opaque;
-
-    switch (event) {
-    case CHR_EVENT_OPENED:
-        /* Start with first process attached, others detached */
-        for (i = 0; i < s->process_num; i++) {
-            s->processes[i].attached = !i;
-        }
-
-        s->c_cpu = gdb_first_attached_cpu();
-        s->g_cpu = s->c_cpu;
-
-        vm_stop(RUN_STATE_PAUSED);
-        replay_gdb_attached();
-        gdb_has_xml = false;
-        break;
-    default:
-        break;
-    }
-}
-
-static int gdb_monitor_write(Chardev *chr, const uint8_t *buf, int len)
-{
-    g_autoptr(GString) hex_buf = g_string_new("O");
-    memtohex(hex_buf, buf, len);
-    put_packet(hex_buf->str);
-    return len;
-}
-
-#ifndef _WIN32
-static void gdb_sigterm_handler(int signal)
-{
-    if (runstate_is_running()) {
-        vm_stop(RUN_STATE_PAUSED);
-    }
-}
-#endif
-
-static void gdb_monitor_open(Chardev *chr, ChardevBackend *backend,
-                             bool *be_opened, Error **errp)
-{
-    *be_opened = false;
-}
-
-static void char_gdb_class_init(ObjectClass *oc, void *data)
-{
-    ChardevClass *cc = CHARDEV_CLASS(oc);
-
-    cc->internal = true;
-    cc->open = gdb_monitor_open;
-    cc->chr_write = gdb_monitor_write;
-}
-
-#define TYPE_CHARDEV_GDB "chardev-gdb"
-
-static const TypeInfo char_gdb_type_info = {
-    .name = TYPE_CHARDEV_GDB,
-    .parent = TYPE_CHARDEV,
-    .class_init = char_gdb_class_init,
-};
-
-static int find_cpu_clusters(Object *child, void *opaque)
-{
-    if (object_dynamic_cast(child, TYPE_CPU_CLUSTER)) {
-        GDBState *s = (GDBState *) opaque;
-        CPUClusterState *cluster = CPU_CLUSTER(child);
-        GDBProcess *process;
-
-        s->processes = g_renew(GDBProcess, s->processes, ++s->process_num);
-
-        process = &s->processes[s->process_num - 1];
-
-        /*
-         * GDB process IDs -1 and 0 are reserved. To avoid subtle errors at
-         * runtime, we enforce here that the machine does not use a cluster ID
-         * that would lead to PID 0.
-         */
-        assert(cluster->cluster_id != UINT32_MAX);
-        process->pid = cluster->cluster_id + 1;
-        process->attached = false;
-        process->target_xml[0] = '\0';
-
-        return 0;
-    }
-
-    return object_child_foreach(child, find_cpu_clusters, opaque);
-}
-
-static int pid_order(const void *a, const void *b)
-{
-    GDBProcess *pa = (GDBProcess *) a;
-    GDBProcess *pb = (GDBProcess *) b;
-
-    if (pa->pid < pb->pid) {
-        return -1;
-    } else if (pa->pid > pb->pid) {
-        return 1;
-    } else {
-        return 0;
-    }
-}
-
-static void create_processes(GDBState *s)
-{
-    object_child_foreach(object_get_root(), find_cpu_clusters, s);
-
-    if (gdbserver_state.processes) {
-        /* Sort by PID */
-        qsort(gdbserver_state.processes, gdbserver_state.process_num, sizeof(gdbserver_state.processes[0]), pid_order);
-    }
-
-    create_default_process(s);
-}
-
-int gdbserver_start(const char *device)
-{
-    trace_gdbstub_op_start(device);
-
-    char gdbstub_device_name[128];
-    Chardev *chr = NULL;
-    Chardev *mon_chr;
-
-    if (!first_cpu) {
-        error_report("gdbstub: meaningless to attach gdb to a "
-                     "machine without any CPU.");
-        return -1;
-    }
-
-    if (!gdb_supports_guest_debug()) {
-        error_report("gdbstub: current accelerator doesn't support guest debugging");
-        return -1;
-    }
-
-    if (!device)
-        return -1;
-    if (strcmp(device, "none") != 0) {
-        if (strstart(device, "tcp:", NULL)) {
-            /* enforce required TCP attributes */
-            snprintf(gdbstub_device_name, sizeof(gdbstub_device_name),
-                     "%s,wait=off,nodelay=on,server=on", device);
-            device = gdbstub_device_name;
-        }
-#ifndef _WIN32
-        else if (strcmp(device, "stdio") == 0) {
-            struct sigaction act;
-
-            memset(&act, 0, sizeof(act));
-            act.sa_handler = gdb_sigterm_handler;
-            sigaction(SIGINT, &act, NULL);
-        }
-#endif
-        /*
-         * FIXME: it's a bit weird to allow using a mux chardev here
-         * and implicitly setup a monitor. We may want to break this.
-         */
-        chr = qemu_chr_new_noreplay("gdb", device, true, NULL);
-        if (!chr)
-            return -1;
-    }
-
-    if (!gdbserver_state.init) {
-        init_gdbserver_state();
-
-        qemu_add_vm_change_state_handler(gdb_vm_state_change, NULL);
-
-        /* Initialize a monitor terminal for gdb */
-        mon_chr = qemu_chardev_new(NULL, TYPE_CHARDEV_GDB,
-                                   NULL, NULL, &error_abort);
-        monitor_init_hmp(mon_chr, false, &error_abort);
-    } else {
-        qemu_chr_fe_deinit(&gdbserver_state.connection->chr, true);
-        mon_chr = gdbserver_state.connection->mon_chr;
-        reset_gdbserver_state();
-    }
-
-    create_processes(&gdbserver_state);
-
-    if (chr) {
-        qemu_chr_fe_init(&gdbserver_state.connection->chr, chr, &error_abort);
-        qemu_chr_fe_set_handlers(&gdbserver_state.connection->chr,
-                                 gdb_chr_can_receive,
-                                 gdb_chr_receive, gdb_chr_event,
-                                 NULL, &gdbserver_state, NULL, true);
-    }
-    gdbserver_state.state = chr ? RS_IDLE : RS_INACTIVE;
-    gdbserver_state.connection->mon_chr = mon_chr;
-    gdbserver_state.current_syscall_cb = NULL;
-
-    return 0;
-}
-
-static void register_types(void)
-{
-    type_register_static(&char_gdb_type_info);
-}
-
-type_init(register_types);
 #endif
diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index 183dfb40e4..b7a335b183 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -11,11 +11,431 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+#include "qemu/cutils.h"
 #include "exec/gdbstub.h"
 #include "exec/hwaddr.h"
+#include "exec/tb-flush.h"
 #include "sysemu/cpus.h"
+#include "sysemu/runstate.h"
+#include "sysemu/replay.h"
+#include "hw/core/cpu.h"
+#include "hw/cpu/cluster.h"
+#include "hw/boards.h"
+#include "chardev/char.h"
+#include "chardev/char-fe.h"
+#include "monitor/monitor.h"
+#include "trace.h"
 #include "internals.h"
 
+/* system emulation connection details */
+typedef struct GDBConnection {
+    CharBackend chr;
+    Chardev *mon_chr;
+} GDBConnection;
+
+extern GDBState gdbserver_state;
+
+GDBConnection *gdb_init_connection_data(void)
+{
+    return g_new(GDBConnection, 1);
+}
+
+static void reset_gdbserver_state(void)
+{
+    g_free(gdbserver_state.processes);
+    gdbserver_state.processes = NULL;
+    gdbserver_state.process_num = 0;
+}
+
+/*
+ * Return the GDB index for a given vCPU state.
+ *
+ * In system mode GDB numbers CPUs from 1 as 0 is reserved as an "any
+ * cpu" index.
+ */
+int gdb_get_cpu_index(CPUState *cpu)
+{
+    return cpu->cpu_index + 1;
+}
+
+/*
+ * GDB Connection management. For system emulation we do all of this
+ * via our existing Chardev infrastructure which allows us to support
+ * network and unix sockets.
+ */
+
+void gdb_put_buffer(const uint8_t *buf, int len)
+{
+    /* XXX this blocks entire thread. Rewrite to use
+     * qemu_chr_fe_write and background I/O callbacks */
+    qemu_chr_fe_write_all(&gdbserver_state.connection->chr, buf, len);
+}
+
+static void gdb_chr_event(void *opaque, QEMUChrEvent event)
+{
+    int i;
+    GDBState *s = (GDBState *) opaque;
+
+    switch (event) {
+    case CHR_EVENT_OPENED:
+        /* Start with first process attached, others detached */
+        for (i = 0; i < s->process_num; i++) {
+            s->processes[i].attached = !i;
+        }
+
+        s->c_cpu = gdb_first_attached_cpu();
+        s->g_cpu = s->c_cpu;
+
+        vm_stop(RUN_STATE_PAUSED);
+        replay_gdb_attached();
+        gdb_has_xml = false;
+        break;
+    default:
+        break;
+    }
+}
+
+static void gdb_vm_state_change(void *opaque, bool running, RunState state)
+{
+    CPUState *cpu = gdbserver_state.c_cpu;
+    g_autoptr(GString) buf = g_string_new(NULL);
+    g_autoptr(GString) tid = g_string_new(NULL);
+    const char *type;
+    int ret;
+
+    if (running || gdbserver_state.state == RS_INACTIVE) {
+        return;
+    }
+    /* Is there a GDB syscall waiting to be sent?  */
+    if (gdbserver_state.current_syscall_cb) {
+        gdb_put_packet(gdbserver_state.syscall_buf);
+        return;
+    }
+
+    if (cpu == NULL) {
+        /* No process attached */
+        return;
+    }
+
+    gdb_append_thread_id(cpu, tid);
+
+    switch (state) {
+    case RUN_STATE_DEBUG:
+        if (cpu->watchpoint_hit) {
+            switch (cpu->watchpoint_hit->flags & BP_MEM_ACCESS) {
+            case BP_MEM_READ:
+                type = "r";
+                break;
+            case BP_MEM_ACCESS:
+                type = "a";
+                break;
+            default:
+                type = "";
+                break;
+            }
+            trace_gdbstub_hit_watchpoint(type,
+                                         gdb_get_cpu_index(cpu),
+                                         cpu->watchpoint_hit->vaddr);
+            g_string_printf(buf, "T%02xthread:%s;%swatch:%" VADDR_PRIx ";",
+                            GDB_SIGNAL_TRAP, tid->str, type,
+                            cpu->watchpoint_hit->vaddr);
+            cpu->watchpoint_hit = NULL;
+            goto send_packet;
+        } else {
+            trace_gdbstub_hit_break();
+        }
+        tb_flush(cpu);
+        ret = GDB_SIGNAL_TRAP;
+        break;
+    case RUN_STATE_PAUSED:
+        trace_gdbstub_hit_paused();
+        ret = GDB_SIGNAL_INT;
+        break;
+    case RUN_STATE_SHUTDOWN:
+        trace_gdbstub_hit_shutdown();
+        ret = GDB_SIGNAL_QUIT;
+        break;
+    case RUN_STATE_IO_ERROR:
+        trace_gdbstub_hit_io_error();
+        ret = GDB_SIGNAL_IO;
+        break;
+    case RUN_STATE_WATCHDOG:
+        trace_gdbstub_hit_watchdog();
+        ret = GDB_SIGNAL_ALRM;
+        break;
+    case RUN_STATE_INTERNAL_ERROR:
+        trace_gdbstub_hit_internal_error();
+        ret = GDB_SIGNAL_ABRT;
+        break;
+    case RUN_STATE_SAVE_VM:
+    case RUN_STATE_RESTORE_VM:
+        return;
+    case RUN_STATE_FINISH_MIGRATE:
+        ret = GDB_SIGNAL_XCPU;
+        break;
+    default:
+        trace_gdbstub_hit_unknown(state);
+        ret = GDB_SIGNAL_UNKNOWN;
+        break;
+    }
+    gdb_set_stop_cpu(cpu);
+    g_string_printf(buf, "T%02xthread:%s;", ret, tid->str);
+
+send_packet:
+    gdb_put_packet(buf->str);
+
+    /* disable single step if it was enabled */
+    cpu_single_step(cpu, 0);
+}
+
+#ifndef _WIN32
+static void gdb_sigterm_handler(int signal)
+{
+    if (runstate_is_running()) {
+        vm_stop(RUN_STATE_PAUSED);
+    }
+}
+#endif
+
+static int gdb_monitor_write(Chardev *chr, const uint8_t *buf, int len)
+{
+    g_autoptr(GString) hex_buf = g_string_new("O");
+    gdb_memtohex(hex_buf, buf, len);
+    gdb_put_packet(hex_buf->str);
+    return len;
+}
+
+static void gdb_monitor_open(Chardev *chr, ChardevBackend *backend,
+                             bool *be_opened, Error **errp)
+{
+    *be_opened = false;
+}
+
+static void char_gdb_class_init(ObjectClass *oc, void *data)
+{
+    ChardevClass *cc = CHARDEV_CLASS(oc);
+
+    cc->internal = true;
+    cc->open = gdb_monitor_open;
+    cc->chr_write = gdb_monitor_write;
+}
+
+#define TYPE_CHARDEV_GDB "chardev-gdb"
+
+static const TypeInfo char_gdb_type_info = {
+    .name = TYPE_CHARDEV_GDB,
+    .parent = TYPE_CHARDEV,
+    .class_init = char_gdb_class_init,
+};
+
+static int gdb_chr_can_receive(void *opaque)
+{
+  /* We can handle an arbitrarily large amount of data.
+   Pick the maximum packet size, which is as good as anything.  */
+  return MAX_PACKET_LENGTH;
+}
+
+static void gdb_chr_receive(void *opaque, const uint8_t *buf, int size)
+{
+    int i;
+
+    for (i = 0; i < size; i++) {
+        gdb_read_byte(buf[i]);
+    }
+}
+
+static int find_cpu_clusters(Object *child, void *opaque)
+{
+    if (object_dynamic_cast(child, TYPE_CPU_CLUSTER)) {
+        GDBState *s = (GDBState *) opaque;
+        CPUClusterState *cluster = CPU_CLUSTER(child);
+        GDBProcess *process;
+
+        s->processes = g_renew(GDBProcess, s->processes, ++s->process_num);
+
+        process = &s->processes[s->process_num - 1];
+
+        /*
+         * GDB process IDs -1 and 0 are reserved. To avoid subtle errors at
+         * runtime, we enforce here that the machine does not use a cluster ID
+         * that would lead to PID 0.
+         */
+        assert(cluster->cluster_id != UINT32_MAX);
+        process->pid = cluster->cluster_id + 1;
+        process->attached = false;
+        process->target_xml[0] = '\0';
+
+        return 0;
+    }
+
+    return object_child_foreach(child, find_cpu_clusters, opaque);
+}
+
+static int pid_order(const void *a, const void *b)
+{
+    GDBProcess *pa = (GDBProcess *) a;
+    GDBProcess *pb = (GDBProcess *) b;
+
+    if (pa->pid < pb->pid) {
+        return -1;
+    } else if (pa->pid > pb->pid) {
+        return 1;
+    } else {
+        return 0;
+    }
+}
+
+static void create_processes(GDBState *s)
+{
+    object_child_foreach(object_get_root(), find_cpu_clusters, s);
+
+    if (gdbserver_state.processes) {
+        /* Sort by PID */
+        qsort(gdbserver_state.processes,
+              gdbserver_state.process_num,
+              sizeof(gdbserver_state.processes[0]),
+              pid_order);
+    }
+
+    gdb_create_default_process(s);
+}
+
+int gdbserver_start(const char *device)
+{
+    trace_gdbstub_op_start(device);
+
+    char gdbstub_device_name[128];
+    Chardev *chr = NULL;
+    Chardev *mon_chr;
+
+    if (!first_cpu) {
+        error_report("gdbstub: meaningless to attach gdb to a "
+                     "machine without any CPU.");
+        return -1;
+    }
+
+    if (!gdb_supports_guest_debug()) {
+        error_report("gdbstub: current accelerator doesn't support guest debugging");
+        return -1;
+    }
+
+    if (!device)
+        return -1;
+    if (strcmp(device, "none") != 0) {
+        if (strstart(device, "tcp:", NULL)) {
+            /* enforce required TCP attributes */
+            snprintf(gdbstub_device_name, sizeof(gdbstub_device_name),
+                     "%s,wait=off,nodelay=on,server=on", device);
+            device = gdbstub_device_name;
+        }
+#ifndef _WIN32
+        else if (strcmp(device, "stdio") == 0) {
+            struct sigaction act;
+
+            memset(&act, 0, sizeof(act));
+            act.sa_handler = gdb_sigterm_handler;
+            sigaction(SIGINT, &act, NULL);
+        }
+#endif
+        /*
+         * FIXME: it's a bit weird to allow using a mux chardev here
+         * and implicitly setup a monitor. We may want to break this.
+         */
+        chr = qemu_chr_new_noreplay("gdb", device, true, NULL);
+        if (!chr)
+            return -1;
+    }
+
+    if (!gdbserver_state.init) {
+        gdb_init_gdbserver_state();
+
+        qemu_add_vm_change_state_handler(gdb_vm_state_change, NULL);
+
+        /* Initialize a monitor terminal for gdb */
+        mon_chr = qemu_chardev_new(NULL, TYPE_CHARDEV_GDB,
+                                   NULL, NULL, &error_abort);
+        monitor_init_hmp(mon_chr, false, &error_abort);
+    } else {
+        qemu_chr_fe_deinit(&gdbserver_state.connection->chr, true);
+        mon_chr = gdbserver_state.connection->mon_chr;
+        reset_gdbserver_state();
+    }
+
+    create_processes(&gdbserver_state);
+
+    if (chr) {
+        qemu_chr_fe_init(&gdbserver_state.connection->chr, chr, &error_abort);
+        qemu_chr_fe_set_handlers(&gdbserver_state.connection->chr,
+                                 gdb_chr_can_receive,
+                                 gdb_chr_receive, gdb_chr_event,
+                                 NULL, &gdbserver_state, NULL, true);
+    }
+    gdbserver_state.state = chr ? RS_IDLE : RS_INACTIVE;
+    gdbserver_state.connection->mon_chr = mon_chr;
+    gdbserver_state.current_syscall_cb = NULL;
+
+    return 0;
+}
+
+static void register_types(void)
+{
+    type_register_static(&char_gdb_type_info);
+}
+
+type_init(register_types);
+
+/* Tell the remote gdb that the process has exited.  */
+void gdb_exit(int code)
+{
+  char buf[4];
+
+  if (!gdbserver_state.init) {
+      return;
+  }
+
+  trace_gdbstub_op_exiting((uint8_t)code);
+
+  snprintf(buf, sizeof(buf), "W%02x", (uint8_t)code);
+  gdb_put_packet(buf);
+
+  qemu_chr_fe_deinit(&gdbserver_state.connection->chr, true);
+}
+
+/*
+ * Softmmu specific command helpers
+ */
+void gdb_handle_query_rcmd(GArray *params, void *user_ctx)
+{
+    const guint8 zero = 0;
+    int len;
+
+    if (!params->len) {
+        gdb_put_packet("E22");
+        return;
+    }
+
+    len = strlen(get_param(params, 0)->data);
+    if (len % 2) {
+        gdb_put_packet("E01");
+        return;
+    }
+
+    g_assert(gdbserver_state.mem_buf->len == 0);
+    len = len / 2;
+    gdb_hextomem(gdbserver_state.mem_buf, get_param(params, 0)->data, len);
+    g_byte_array_append(gdbserver_state.mem_buf, &zero, 1);
+    qemu_chr_be_write(gdbserver_state.connection->mon_chr,
+                      gdbserver_state.mem_buf->data,
+                      gdbserver_state.mem_buf->len);
+    gdb_put_packet("OK");
+}
+
+/*
+ * Break/Watch point helpers
+ */
+
 bool gdb_supports_guest_debug(void)
 {
     const AccelOpsClass *ops = cpus_get_accel();
diff --git a/gdbstub/trace-events b/gdbstub/trace-events
index 03f0c303bf..0c18a4d70a 100644
--- a/gdbstub/trace-events
+++ b/gdbstub/trace-events
@@ -7,7 +7,6 @@ gdbstub_op_continue(void) "Continuing all CPUs"
 gdbstub_op_continue_cpu(int cpu_index) "Continuing CPU %d"
 gdbstub_op_stepping(int cpu_index) "Stepping CPU %d"
 gdbstub_op_extra_info(const char *info) "Thread extra info: %s"
-gdbstub_hit_watchpoint(const char *type, int cpu_gdb_index, uint64_t vaddr) "Watchpoint hit, type=\"%s\" cpu=%d, vaddr=0x%" PRIx64 ""
 gdbstub_hit_internal_error(void) "RUN_STATE_INTERNAL_ERROR"
 gdbstub_hit_break(void) "RUN_STATE_DEBUG"
 gdbstub_hit_paused(void) "RUN_STATE_PAUSED"
@@ -27,3 +26,6 @@ gdbstub_err_invalid_repeat(uint8_t ch) "got invalid RLE count: 0x%02x"
 gdbstub_err_invalid_rle(void) "got invalid RLE sequence"
 gdbstub_err_checksum_invalid(uint8_t ch) "got invalid command checksum digit: 0x%02x"
 gdbstub_err_checksum_incorrect(uint8_t expected, uint8_t got) "got command packet with incorrect checksum, expected=0x%02x, received=0x%02x"
+
+# softmmu.c
+gdbstub_hit_watchpoint(const char *type, int cpu_gdb_index, uint64_t vaddr) "Watchpoint hit, type=\"%s\" cpu=%d, vaddr=0x%" PRIx64 ""
-- 
2.34.1


