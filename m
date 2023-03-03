Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 881986A8F7D
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 03:59:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXvcj-0007S5-2z; Thu, 02 Mar 2023 21:58:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvce-0007QM-It
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:17 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvcb-0001oX-GX
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:15 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 x20-20020a17090a8a9400b00233ba727724so4666977pjn.1
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 18:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677812292;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4pRbYqRY0VGEczpozM4adTEzmEIYOjfBRmRXe4bR2kk=;
 b=Lj5VwkC/JiuoekgfDDEN6rCbPaZzybHf4YEMCtoVZyd3aHa2sJp40EwJesaX/t7sno
 ErQ3TXBmoN71VPiIHWmTqomf3jFXgz2lnXwc1vX2cFMgYirSKfMk06GaKD9zYCN1gS2l
 R8ZDI44gQOfbHYQmUDmDLvGZZy2P6zMCZZQKvovod+IRujRtNNlxfnd5Nd6YP32AgiQc
 3jhLLl7GlcT5BlFHR60B9WTkYx/+KgZszjqtbYHxAUyqA2rUpBHY4eC/oggJ8+LtKGCQ
 eRxz5wm50d/iJNNPmheco6OFIL+To8t+e6VPENh3zatklKVNWiXB8GUnvZuLOPhhhYbG
 U0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677812292;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4pRbYqRY0VGEczpozM4adTEzmEIYOjfBRmRXe4bR2kk=;
 b=eEmPPGDif4aJsyXInyeldC1O+XkJkW1zNdLLv3DsoOvMk2xlr4hBUBK6YMB4oNPemR
 px8K6OgTyekkPPaceELYqiZwNBfhQELdrx4pTt26RB8K31ikNMQs9BpWKTflQYoB0dWc
 owPIVQiZMZhp9qvwAwruxgUmg7kE62O3xF8mxiaMUHkHwfoFWgpUj10HQrJoldF2ARxd
 5ydMsAF4oBwbGsf3OpM6Yav086ybkIDqxJl3X0Eh6ZLrHsXbWgGDUcvYbx8QmMJDZODE
 8qO1H6IfaiwX36bfbZsEmdY2QMyvPZYz6In/+0ezVwINni5v3oKm1qnbZcNsey+m+vWq
 I7pA==
X-Gm-Message-State: AO0yUKVRmuTN8R+zriHtWW2qt5UPLHZ7wG/01TTNoLWF5TOXuUFzdQ+5
 1TaPoGYhxErJV9irGXkReLMOZOKKBBij4sAAWQQ=
X-Google-Smtp-Source: AK7set/C8zoCb31ByGj4HtmKWO+hV02r5eCUJ9b+25j7Mf0JZbxmtPFV4kKIe1aB3TrO4CRYYho/9w==
X-Received: by 2002:a17:902:bc42:b0:19c:faaf:b9d6 with SMTP id
 t2-20020a170902bc4200b0019cfaafb9d6mr499760plz.8.1677812291901; 
 Thu, 02 Mar 2023 18:58:11 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a17090301c400b001992e74d055sm372244plh.12.2023.03.02.18.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 18:58:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH v4.5 05/29] gdbstub: define separate user/system structures
Date: Thu,  2 Mar 2023 18:57:41 -0800
Message-Id: <20230303025805.625589-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303025805.625589-1-richard.henderson@linaro.org>
References: <20230303025805.625589-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

From: Alex Bennée <alex.bennee@linaro.org>

In preparation for moving user/softmmu specific bits from the main
gdbstub file we need to separate the connection details into a
user/softmmu state. As these will eventually be defined in their own
files we move them out of the common GDBState structure.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Message-Id: <20230302190846.2593720-6-alex.bennee@linaro.org>
---
 gdbstub/gdbstub.c | 94 ++++++++++++++++++++++++++---------------------
 1 file changed, 53 insertions(+), 41 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 63b56f0027..1e6f8978b5 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -341,6 +341,22 @@ enum RSState {
     RS_CHKSUM1,
     RS_CHKSUM2,
 };
+
+#ifdef CONFIG_USER_ONLY
+typedef struct {
+    int fd;
+    char *socket_path;
+    int running_state;
+} GDBUserState;
+static GDBUserState gdbserver_user_state;
+#else
+typedef struct {
+    CharBackend chr;
+    Chardev *mon_chr;
+} GDBSystemState;
+static GDBSystemState gdbserver_system_state;
+#endif
+
 typedef struct GDBState {
     bool init;       /* have we been initialised? */
     CPUState *c_cpu; /* current CPU for step/continue ops */
@@ -353,14 +369,6 @@ typedef struct GDBState {
     int line_csum; /* checksum at the end of the packet */
     GByteArray *last_packet;
     int signal;
-#ifdef CONFIG_USER_ONLY
-    int fd;
-    char *socket_path;
-    int running_state;
-#else
-    CharBackend chr;
-    Chardev *mon_chr;
-#endif
     bool multiprocess;
     GDBProcess *processes;
     int process_num;
@@ -412,15 +420,17 @@ static int get_char(void)
     int ret;
 
     for(;;) {
-        ret = recv(gdbserver_state.fd, &ch, 1, 0);
+        ret = recv(gdbserver_user_state.fd, &ch, 1, 0);
         if (ret < 0) {
-            if (errno == ECONNRESET)
-                gdbserver_state.fd = -1;
-            if (errno != EINTR)
+            if (errno == ECONNRESET) {
+                gdbserver_user_state.fd = -1;
+            }
+            if (errno != EINTR) {
                 return -1;
+            }
         } else if (ret == 0) {
-            close(gdbserver_state.fd);
-            gdbserver_state.fd = -1;
+            close(gdbserver_user_state.fd);
+            gdbserver_user_state.fd = -1;
             return -1;
         } else {
             break;
@@ -479,7 +489,7 @@ static inline void gdb_continue(void)
 {
 
 #ifdef CONFIG_USER_ONLY
-    gdbserver_state.running_state = 1;
+    gdbserver_user_state.running_state = 1;
     trace_gdbstub_op_continue();
 #else
     if (!runstate_needs_reset()) {
@@ -508,7 +518,7 @@ static int gdb_continue_partial(char *newstates)
             cpu_single_step(cpu, gdbserver_state.sstep_flags);
         }
     }
-    gdbserver_state.running_state = 1;
+    gdbserver_user_state.running_state = 1;
 #else
     int flag = 0;
 
@@ -560,7 +570,7 @@ static void put_buffer(const uint8_t *buf, int len)
     int ret;
 
     while (len > 0) {
-        ret = send(gdbserver_state.fd, buf, len, 0);
+        ret = send(gdbserver_user_state.fd, buf, len, 0);
         if (ret < 0) {
             if (errno != EINTR)
                 return;
@@ -572,7 +582,7 @@ static void put_buffer(const uint8_t *buf, int len)
 #else
     /* XXX this blocks entire thread. Rewrite to use
      * qemu_chr_fe_write and background I/O callbacks */
-    qemu_chr_fe_write_all(&gdbserver_state.chr, buf, len);
+    qemu_chr_fe_write_all(&gdbserver_system_state.chr, buf, len);
 #endif
 }
 
@@ -2094,7 +2104,8 @@ static void handle_query_rcmd(GArray *params, void *user_ctx)
     len = len / 2;
     hextomem(gdbserver_state.mem_buf, get_param(params, 0)->data, len);
     g_byte_array_append(gdbserver_state.mem_buf, &zero, 1);
-    qemu_chr_be_write(gdbserver_state.mon_chr, gdbserver_state.mem_buf->data,
+    qemu_chr_be_write(gdbserver_system_state.mon_chr,
+                      gdbserver_state.mem_buf->data,
                       gdbserver_state.mem_buf->len);
     put_packet("OK");
 }
@@ -3027,10 +3038,10 @@ void gdb_exit(int code)
         return;
     }
 #ifdef CONFIG_USER_ONLY
-    if (gdbserver_state.socket_path) {
-        unlink(gdbserver_state.socket_path);
+    if (gdbserver_user_state.socket_path) {
+        unlink(gdbserver_user_state.socket_path);
     }
-    if (gdbserver_state.fd < 0) {
+    if (gdbserver_user_state.fd < 0) {
         return;
     }
 #endif
@@ -3041,7 +3052,7 @@ void gdb_exit(int code)
     put_packet(buf);
 
 #ifndef CONFIG_USER_ONLY
-    qemu_chr_fe_deinit(&gdbserver_state.chr, true);
+    qemu_chr_fe_deinit(&gdbserver_system_state.chr, true);
 #endif
 }
 
@@ -3077,7 +3088,7 @@ gdb_handlesig(CPUState *cpu, int sig)
     char buf[256];
     int n;
 
-    if (!gdbserver_state.init || gdbserver_state.fd < 0) {
+    if (!gdbserver_state.init || gdbserver_user_state.fd < 0) {
         return sig;
     }
 
@@ -3095,15 +3106,15 @@ gdb_handlesig(CPUState *cpu, int sig)
     }
     /* put_packet() might have detected that the peer terminated the
        connection.  */
-    if (gdbserver_state.fd < 0) {
+    if (gdbserver_user_state.fd < 0) {
         return sig;
     }
 
     sig = 0;
     gdbserver_state.state = RS_IDLE;
-    gdbserver_state.running_state = 0;
-    while (gdbserver_state.running_state == 0) {
-        n = read(gdbserver_state.fd, buf, 256);
+    gdbserver_user_state.running_state = 0;
+    while (gdbserver_user_state.running_state == 0) {
+        n = read(gdbserver_user_state.fd, buf, 256);
         if (n > 0) {
             int i;
 
@@ -3114,9 +3125,9 @@ gdb_handlesig(CPUState *cpu, int sig)
             /* XXX: Connection closed.  Should probably wait for another
                connection before continuing.  */
             if (n == 0) {
-                close(gdbserver_state.fd);
+                close(gdbserver_user_state.fd);
             }
-            gdbserver_state.fd = -1;
+            gdbserver_user_state.fd = -1;
             return sig;
         }
     }
@@ -3130,7 +3141,7 @@ void gdb_signalled(CPUArchState *env, int sig)
 {
     char buf[4];
 
-    if (!gdbserver_state.init || gdbserver_state.fd < 0) {
+    if (!gdbserver_state.init || gdbserver_user_state.fd < 0) {
         return;
     }
 
@@ -3145,7 +3156,7 @@ static void gdb_accept_init(int fd)
     gdbserver_state.processes[0].attached = true;
     gdbserver_state.c_cpu = gdb_first_attached_cpu();
     gdbserver_state.g_cpu = gdbserver_state.c_cpu;
-    gdbserver_state.fd = fd;
+    gdbserver_user_state.fd = fd;
     gdb_has_xml = false;
 }
 
@@ -3277,7 +3288,7 @@ int gdbserver_start(const char *port_or_path)
     if (port > 0 && gdb_accept_tcp(gdb_fd)) {
         return 0;
     } else if (gdb_accept_socket(gdb_fd)) {
-        gdbserver_state.socket_path = g_strdup(port_or_path);
+        gdbserver_user_state.socket_path = g_strdup(port_or_path);
         return 0;
     }
 
@@ -3289,11 +3300,11 @@ int gdbserver_start(const char *port_or_path)
 /* Disable gdb stub for child processes.  */
 void gdbserver_fork(CPUState *cpu)
 {
-    if (!gdbserver_state.init || gdbserver_state.fd < 0) {
+    if (!gdbserver_state.init || gdbserver_user_state.fd < 0) {
         return;
     }
-    close(gdbserver_state.fd);
-    gdbserver_state.fd = -1;
+    close(gdbserver_user_state.fd);
+    gdbserver_user_state.fd = -1;
     cpu_breakpoint_remove_all(cpu, BP_GDB);
     cpu_watchpoint_remove_all(cpu, BP_GDB);
 }
@@ -3487,21 +3498,22 @@ int gdbserver_start(const char *device)
                                    NULL, NULL, &error_abort);
         monitor_init_hmp(mon_chr, false, &error_abort);
     } else {
-        qemu_chr_fe_deinit(&gdbserver_state.chr, true);
-        mon_chr = gdbserver_state.mon_chr;
+        qemu_chr_fe_deinit(&gdbserver_system_state.chr, true);
+        mon_chr = gdbserver_system_state.mon_chr;
         reset_gdbserver_state();
     }
 
     create_processes(&gdbserver_state);
 
     if (chr) {
-        qemu_chr_fe_init(&gdbserver_state.chr, chr, &error_abort);
-        qemu_chr_fe_set_handlers(&gdbserver_state.chr, gdb_chr_can_receive,
+        qemu_chr_fe_init(&gdbserver_system_state.chr, chr, &error_abort);
+        qemu_chr_fe_set_handlers(&gdbserver_system_state.chr,
+                                 gdb_chr_can_receive,
                                  gdb_chr_receive, gdb_chr_event,
                                  NULL, &gdbserver_state, NULL, true);
     }
     gdbserver_state.state = chr ? RS_IDLE : RS_INACTIVE;
-    gdbserver_state.mon_chr = mon_chr;
+    gdbserver_system_state.mon_chr = mon_chr;
     gdbserver_state.current_syscall_cb = NULL;
 
     return 0;
-- 
2.34.1


