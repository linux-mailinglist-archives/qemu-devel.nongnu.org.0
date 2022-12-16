Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3736864EA41
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 12:24:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p68nB-00024b-Db; Fri, 16 Dec 2022 06:22:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p68n7-00021p-3h
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:22:13 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p68n4-00067W-Ch
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:22:12 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 h8-20020a1c2108000000b003d1efd60b65so3930380wmh.0
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 03:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o7ONNtZko/D7zxPBYYwgczl/QYapCZF+U7bzptFrlow=;
 b=fmz19iOT/CC4P4/jKWqmobA+vICz6o4EG/SM2dnDCgkZa08kdYRLn53AH22Mpf4cc7
 JuVZ2NIW11jQIqyv1CrBKgW/9metTqIkh7TB1vWo964pTMC2v+EROI/3dvN7dtXcvzmW
 pThL1bBodcyC/SaK9bfmale0YmyDgdIedFWCJqskbZ/jvC88DFtQE9RmQI11RsxIsagE
 81EqwTetEvK+5WrK/2bmiahobQgT031ejH9gb77z95mstFP0meCzGYIE1B3IElRVHpqW
 SwuEejBCI1ofuRvvwh6Z8HWIwOD6oTKlu1FHNOrXYiCiONn3IMVZmR1ApQybpvVMqZ0D
 32tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o7ONNtZko/D7zxPBYYwgczl/QYapCZF+U7bzptFrlow=;
 b=SlqJjxMQ3M3DBQCST7ftZb3puYuQjhA9zKUPuhyGo/rzDcrRCdXi5TMWYjWE1/7IGv
 JahKSKoo3xNdYs3PaAd0DcsoRLv0p/avd5EFGbBZaJbnDSetTuaLonyOCO+TtqU/oHKr
 0cQlArltQ9S0spdJzkF+z6Z6rB5vP8lbPKpgZGhJTtaF4ILWl6MAXlyJBXm0zp9pGWJe
 NbIAy5hpwQCTKW6nb2ukKFlHmcYvMeAGH5kNreifkCSEkES8U00LajV16lHPQnX1Bo62
 uVWm/YnU0TFYEy/zcgu5fgNo/sypafgRW+7DWsHtW898bd/JxGJW+lEpYBdThHNsy6z9
 wqjw==
X-Gm-Message-State: ANoB5pnUMDoxPq3Ktv+rXJDeY1FvPlBRhamA7QR6l1NnXd5zf7LTq9Fm
 i5YhBzc02ZaEyfGEMmFlZOPFrA==
X-Google-Smtp-Source: AA0mqf5nvky0erekedvBS0A/v0HeQuaJj/z1s52MSgZ+kdu7DSRh8eCa6Ba8WaOt+prBfDResEG7pQ==
X-Received: by 2002:a05:600c:1d27:b0:3d2:27ba:dde0 with SMTP id
 l39-20020a05600c1d2700b003d227badde0mr15061502wms.33.1671189728918; 
 Fri, 16 Dec 2022 03:22:08 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 az13-20020a05600c600d00b003c6bd12ac27sm2329980wmb.37.2022.12.16.03.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 03:22:07 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 462D91FFBC;
 Fri, 16 Dec 2022 11:22:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH  v1 04/10] gdbstub: split GDBConnection from main structure
Date: Fri, 16 Dec 2022 11:22:00 +0000
Message-Id: <20221216112206.3171578-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221216112206.3171578-1-alex.bennee@linaro.org>
References: <20221216112206.3171578-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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

In preparation for moving user/softmmu specific bits from the main
gdbstub file we need to separate the connection details to what will
eventually become an anonymous pointer.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/gdbstub.c | 99 +++++++++++++++++++++++++++--------------------
 1 file changed, 58 insertions(+), 41 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index be88ca0d71..14ce911bf2 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -342,6 +342,20 @@ enum RSState {
     RS_CHKSUM1,
     RS_CHKSUM2,
 };
+
+#ifdef CONFIG_USER_ONLY
+typedef struct {
+    int fd;
+    char *socket_path;
+    int running_state;
+} GDBConnection;
+#else
+typedef struct {
+    CharBackend chr;
+    Chardev *mon_chr;
+} GDBConnection;
+#endif
+
 typedef struct GDBState {
     bool init;       /* have we been initialised? */
     CPUState *c_cpu; /* current CPU for step/continue ops */
@@ -354,14 +368,7 @@ typedef struct GDBState {
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
+    GDBConnection *connection;
     bool multiprocess;
     GDBProcess *processes;
     int process_num;
@@ -392,6 +399,12 @@ static void init_gdbserver_state(void)
     gdbserver_state.supported_sstep_flags = accel_supported_gdbstub_sstep_flags();
     gdbserver_state.sstep_flags = SSTEP_ENABLE | SSTEP_NOIRQ | SSTEP_NOTIMER;
     gdbserver_state.sstep_flags &= gdbserver_state.supported_sstep_flags;
+
+    /*
+     * The following is differs depending on USER/SOFTMMU, we just
+     * hid it in the typedef.
+     */
+    gdbserver_state.connection = g_new(GDBConnection, 1);
 }
 
 #ifndef CONFIG_USER_ONLY
@@ -413,15 +426,17 @@ static int get_char(void)
     int ret;
 
     for(;;) {
-        ret = recv(gdbserver_state.fd, &ch, 1, 0);
+        ret = recv(gdbserver_state.connection->fd, &ch, 1, 0);
         if (ret < 0) {
-            if (errno == ECONNRESET)
-                gdbserver_state.fd = -1;
-            if (errno != EINTR)
+            if (errno == ECONNRESET) {
+                gdbserver_state.connection->fd = -1;
+            }
+            if (errno != EINTR) {
                 return -1;
+            }
         } else if (ret == 0) {
-            close(gdbserver_state.fd);
-            gdbserver_state.fd = -1;
+            close(gdbserver_state.connection->fd);
+            gdbserver_state.connection->fd = -1;
             return -1;
         } else {
             break;
@@ -480,7 +495,7 @@ static inline void gdb_continue(void)
 {
 
 #ifdef CONFIG_USER_ONLY
-    gdbserver_state.running_state = 1;
+    gdbserver_state.connection->running_state = 1;
     trace_gdbstub_op_continue();
 #else
     if (!runstate_needs_reset()) {
@@ -509,7 +524,7 @@ static int gdb_continue_partial(char *newstates)
             cpu_single_step(cpu, gdbserver_state.sstep_flags);
         }
     }
-    gdbserver_state.running_state = 1;
+    gdbserver_state.connection->running_state = 1;
 #else
     int flag = 0;
 
@@ -561,7 +576,7 @@ static void put_buffer(const uint8_t *buf, int len)
     int ret;
 
     while (len > 0) {
-        ret = send(gdbserver_state.fd, buf, len, 0);
+        ret = send(gdbserver_state.connection->fd, buf, len, 0);
         if (ret < 0) {
             if (errno != EINTR)
                 return;
@@ -573,7 +588,7 @@ static void put_buffer(const uint8_t *buf, int len)
 #else
     /* XXX this blocks entire thread. Rewrite to use
      * qemu_chr_fe_write and background I/O callbacks */
-    qemu_chr_fe_write_all(&gdbserver_state.chr, buf, len);
+    qemu_chr_fe_write_all(&gdbserver_state.connection->chr, buf, len);
 #endif
 }
 
@@ -2095,7 +2110,8 @@ static void handle_query_rcmd(GArray *params, void *user_ctx)
     len = len / 2;
     hextomem(gdbserver_state.mem_buf, get_param(params, 0)->data, len);
     g_byte_array_append(gdbserver_state.mem_buf, &zero, 1);
-    qemu_chr_be_write(gdbserver_state.mon_chr, gdbserver_state.mem_buf->data,
+    qemu_chr_be_write(gdbserver_state.connection->mon_chr,
+                      gdbserver_state.mem_buf->data,
                       gdbserver_state.mem_buf->len);
     put_packet("OK");
 }
@@ -3028,10 +3044,10 @@ void gdb_exit(int code)
       return;
   }
 #ifdef CONFIG_USER_ONLY
-  if (gdbserver_state.socket_path) {
-      unlink(gdbserver_state.socket_path);
+  if (gdbserver_state.connection->socket_path) {
+      unlink(gdbserver_state.connection->socket_path);
   }
-  if (gdbserver_state.fd < 0) {
+  if (gdbserver_state.connection->fd < 0) {
       return;
   }
 #endif
@@ -3042,7 +3058,7 @@ void gdb_exit(int code)
   put_packet(buf);
 
 #ifndef CONFIG_USER_ONLY
-  qemu_chr_fe_deinit(&gdbserver_state.chr, true);
+  qemu_chr_fe_deinit(&gdbserver_state.connection->chr, true);
 #endif
 }
 
@@ -3078,7 +3094,7 @@ gdb_handlesig(CPUState *cpu, int sig)
     char buf[256];
     int n;
 
-    if (!gdbserver_state.init || gdbserver_state.fd < 0) {
+    if (!gdbserver_state.init || gdbserver_state.connection->fd < 0) {
         return sig;
     }
 
@@ -3096,15 +3112,15 @@ gdb_handlesig(CPUState *cpu, int sig)
     }
     /* put_packet() might have detected that the peer terminated the
        connection.  */
-    if (gdbserver_state.fd < 0) {
+    if (gdbserver_state.connection->fd < 0) {
         return sig;
     }
 
     sig = 0;
     gdbserver_state.state = RS_IDLE;
-    gdbserver_state.running_state = 0;
-    while (gdbserver_state.running_state == 0) {
-        n = read(gdbserver_state.fd, buf, 256);
+    gdbserver_state.connection->running_state = 0;
+    while (gdbserver_state.connection->running_state == 0) {
+        n = read(gdbserver_state.connection->fd, buf, 256);
         if (n > 0) {
             int i;
 
@@ -3115,9 +3131,9 @@ gdb_handlesig(CPUState *cpu, int sig)
             /* XXX: Connection closed.  Should probably wait for another
                connection before continuing.  */
             if (n == 0) {
-                close(gdbserver_state.fd);
+                close(gdbserver_state.connection->fd);
             }
-            gdbserver_state.fd = -1;
+            gdbserver_state.connection->fd = -1;
             return sig;
         }
     }
@@ -3131,7 +3147,7 @@ void gdb_signalled(CPUArchState *env, int sig)
 {
     char buf[4];
 
-    if (!gdbserver_state.init || gdbserver_state.fd < 0) {
+    if (!gdbserver_state.init || gdbserver_state.connection->fd < 0) {
         return;
     }
 
@@ -3146,7 +3162,7 @@ static void gdb_accept_init(int fd)
     gdbserver_state.processes[0].attached = true;
     gdbserver_state.c_cpu = gdb_first_attached_cpu();
     gdbserver_state.g_cpu = gdbserver_state.c_cpu;
-    gdbserver_state.fd = fd;
+    gdbserver_state.connection->fd = fd;
     gdb_has_xml = false;
 }
 
@@ -3278,7 +3294,7 @@ int gdbserver_start(const char *port_or_path)
     if (port > 0 && gdb_accept_tcp(gdb_fd)) {
         return 0;
     } else if (gdb_accept_socket(gdb_fd)) {
-        gdbserver_state.socket_path = g_strdup(port_or_path);
+        gdbserver_state.connection->socket_path = g_strdup(port_or_path);
         return 0;
     }
 
@@ -3290,11 +3306,11 @@ int gdbserver_start(const char *port_or_path)
 /* Disable gdb stub for child processes.  */
 void gdbserver_fork(CPUState *cpu)
 {
-    if (!gdbserver_state.init || gdbserver_state.fd < 0) {
+    if (!gdbserver_state.init || gdbserver_state.connection->fd < 0) {
         return;
     }
-    close(gdbserver_state.fd);
-    gdbserver_state.fd = -1;
+    close(gdbserver_state.connection->fd);
+    gdbserver_state.connection->fd = -1;
     cpu_breakpoint_remove_all(cpu, BP_GDB);
     cpu_watchpoint_remove_all(cpu, BP_GDB);
 }
@@ -3488,21 +3504,22 @@ int gdbserver_start(const char *device)
                                    NULL, NULL, &error_abort);
         monitor_init_hmp(mon_chr, false, &error_abort);
     } else {
-        qemu_chr_fe_deinit(&gdbserver_state.chr, true);
-        mon_chr = gdbserver_state.mon_chr;
+        qemu_chr_fe_deinit(&gdbserver_state.connection->chr, true);
+        mon_chr = gdbserver_state.connection->mon_chr;
         reset_gdbserver_state();
     }
 
     create_processes(&gdbserver_state);
 
     if (chr) {
-        qemu_chr_fe_init(&gdbserver_state.chr, chr, &error_abort);
-        qemu_chr_fe_set_handlers(&gdbserver_state.chr, gdb_chr_can_receive,
+        qemu_chr_fe_init(&gdbserver_state.connection->chr, chr, &error_abort);
+        qemu_chr_fe_set_handlers(&gdbserver_state.connection->chr,
+                                 gdb_chr_can_receive,
                                  gdb_chr_receive, gdb_chr_event,
                                  NULL, &gdbserver_state, NULL, true);
     }
     gdbserver_state.state = chr ? RS_IDLE : RS_INACTIVE;
-    gdbserver_state.mon_chr = mon_chr;
+    gdbserver_state.connection->mon_chr = mon_chr;
     gdbserver_state.current_syscall_cb = NULL;
 
     return 0;
-- 
2.34.1


