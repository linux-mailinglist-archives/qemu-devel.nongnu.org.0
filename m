Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC5B6AF785
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:25:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZekq-0001fh-4X; Tue, 07 Mar 2023 16:21:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZekj-0001Xq-Ut
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:21:45 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZekh-00081e-Ns
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:21:45 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso24049wmb.0
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 13:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678224102;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kV3VwBQc2zc0YwDkPCS/8fY1JZ2IvGW167JZgbKQuxQ=;
 b=khL1K1j+l+WLSGQWXDIP0u89wiaGP/29yYG1Oj1kwi/1xiVsUUc2US9cxIkDt/Lo67
 yEb1dLWLxh8+IqSj1sh4v0tthbM8ffKkqA9ua0yMs/SIHbTbyN4bFStjpp0yl2Hf39tI
 D8wC8Y85+c3Mcm2DelJrBJ807dNoEl5V4y3GkFFvg7OIP4lbJv8eVWN70HUg+eTqk5R4
 0ryXPJpI4C5Dr8oo8JZGDwrbM/mjEz6A+GajTIpDj+8LhH2cjsK4GL8vuV6ZCOtpFV/G
 9DEhTptem5t+BjZ90NTEbTB39Dv39I7i3ZiGOPxc0An+WoPN6IkJGNiKpt69hfVgftn4
 x1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678224102;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kV3VwBQc2zc0YwDkPCS/8fY1JZ2IvGW167JZgbKQuxQ=;
 b=SG6kI2VYDrzZXrqb5DEZdG69qf3Brfwl2PgfCFi7BcUoE5vH77BDAEjUjg4jnUb7PT
 F4adGw0+blvX7SQ/PFRGNZvaYdS4YvK1dwhaEVozgtVXl4YbJxDV+EwHW49W+1igjq9N
 oesFlMAJjX3pefv671gnCR7ogb+S+4mQlNsP21GmPiQSPM1WP/wVxqUBbAddHYpkSoa2
 Sk0ofo58NwNRmCDpd73ah0RGHCPtWM2QHKiGvkXy+i1Of2j/4XO+GtWz0ykh1dC/yssO
 F/FnWVtanxflq9qiyZun18cd/EVhHOQg+Xk6w5vbSn8HEo8kYGIP+EJjZcPYm0ldXVY6
 ygEg==
X-Gm-Message-State: AO0yUKWRoEzk2nawpxpJ/LqO9+33iF39S5T1DivboU2CciT0Ak0ewaMV
 I2XB2Nl4aDoO2ICl18wGWK1wgWv5wV0XNDMHgD8=
X-Google-Smtp-Source: AK7set8Vkk8Il3XI46O74Z37oyaMP3fxPYsY2Hl+7CwpP8P+bw3tpd76IawTNZ5rzKIhVSLzLOQYVQ==
X-Received: by 2002:a05:600c:190b:b0:3eb:38e6:f64f with SMTP id
 j11-20020a05600c190b00b003eb38e6f64fmr13904239wmq.8.1678224102289; 
 Tue, 07 Mar 2023 13:21:42 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t17-20020a05600c41d100b003dc4fd6e624sm13503156wmh.19.2023.03.07.13.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 13:21:41 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ADE191FFBD;
 Tue,  7 Mar 2023 21:21:39 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 05/30] gdbstub: define separate user/system structures
Date: Tue,  7 Mar 2023 21:21:14 +0000
Message-Id: <20230307212139.883112-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307212139.883112-1-alex.bennee@linaro.org>
References: <20230307212139.883112-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
gdbstub file we need to separate the connection details into a
user/softmmu state. As these will eventually be defined in their own
files we move them out of the common GDBState structure.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Message-Id: <20230302190846.2593720-6-alex.bennee@linaro.org>
Message-Id: <20230303025805.625589-6-richard.henderson@linaro.org>

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
2.39.2


