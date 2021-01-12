Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A922F3BBC
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 22:08:52 +0100 (CET)
Received: from localhost ([::1]:43834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzQuJ-0002WY-NF
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 16:08:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>) id 1kzQq9-0007N5-JH
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:04:33 -0500
Received: from home.keithp.com ([63.227.221.253]:41552 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>) id 1kzQq6-0000AI-WF
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:04:33 -0500
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id CBB213F2E77B;
 Tue, 12 Jan 2021 13:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1610485467; bh=ld1gKjzLv+O7RWaahWAnmnHTLDHyIytV9VjtlF0mN2U=;
 h=From:To:Cc:Subject:Date:From;
 b=QoI6jnoRpbtq1RhWGDdijkNwHnfN8yW6mm1Yzu3lideyDZ49r0xlf4bAgNHqecO/J
 A+LtyYfDvgWCbLuh2W9fT0pTPkjUXUUu6UZxMJ6pmDYU0bAarVw6sG5PatUbmX/gkf
 0vUFwykwCTT6yeyi9lCDkvQzcrpv7h2urXuTG+rXAUnKpdVLQ7oI+Ju/N+b5U4rmDl
 Srv/iMcPZudT+o3Bs2y5ERipakvzcBerFfhdOCfGfZO6VP6QBHgaB6lMUoNsblykLa
 +9D0CPx7M0tJzYUNNA+Qjmt9AfA5VBwy4BbvPLeb55IvuAPoFla0Y2KELQuL7jPjGZ
 x3GwHw5dGG4Bw==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id BUR8CZLgFRWy; Tue, 12 Jan 2021 13:04:27 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id 518E13F2E776;
 Tue, 12 Jan 2021 13:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1610485467; bh=ld1gKjzLv+O7RWaahWAnmnHTLDHyIytV9VjtlF0mN2U=;
 h=From:To:Cc:Subject:Date:From;
 b=QoI6jnoRpbtq1RhWGDdijkNwHnfN8yW6mm1Yzu3lideyDZ49r0xlf4bAgNHqecO/J
 A+LtyYfDvgWCbLuh2W9fT0pTPkjUXUUu6UZxMJ6pmDYU0bAarVw6sG5PatUbmX/gkf
 0vUFwykwCTT6yeyi9lCDkvQzcrpv7h2urXuTG+rXAUnKpdVLQ7oI+Ju/N+b5U4rmDl
 Srv/iMcPZudT+o3Bs2y5ERipakvzcBerFfhdOCfGfZO6VP6QBHgaB6lMUoNsblykLa
 +9D0CPx7M0tJzYUNNA+Qjmt9AfA5VBwy4BbvPLeb55IvuAPoFla0Y2KELQuL7jPjGZ
 x3GwHw5dGG4Bw==
Received: by keithp.com (Postfix, from userid 1000)
 id 2DAA91582498; Tue, 12 Jan 2021 13:04:27 -0800 (PST)
To: qemu-devel@nongnu.org
Subject: [PATCH] Create API for checking and clearing GDB connection status
Date: Tue, 12 Jan 2021 13:04:18 -0800
Message-Id: <20210112210418.1471412-1-keithp@keithp.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.227.221.253; envelope-from=keithp@keithp.com;
 helo=elaine.keithp.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Keith Packard <keithp@keithp.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Keith Packard <keithp@keithp.com>
From: Keith Packard via <qemu-devel@nongnu.org>

When checking whether there is a live gdb connection, code shouldn't
use 'gdbserver_state.init' as that value is set when the
gdbserver_state structure is initialized in init_gdbserver_state, not
when the gdb socket has a valid connection.

I've created two new functions to manage the gdb connection status:

	/* Check whether GDB is currently connected */
	static int gdb_is_connected(void)

	#ifdef CONFIG_USER_ONLY

	/* Close GDB connection */
	static void gdb_disconnect(void)

	#endif

The first checks whether there is an active GDB connection, the second
closes that connection and resets the connection status indication.

The 'handle_detach' function used 'gdbserver_state.c_cpu' as an
indication of whether there is a connection, so I've used the same in
gdb_is_connected as that is independent of CONFIG_USER_ONLY.

This avoids a segfault when qemu is run with the '-s' flag (create a
gdb protocol socket), but without the '-S' flag (delay until 'c'
command is received).

Signed-off-by: Keith Packard <keithp@keithp.com>
---
 gdbstub.c | 51 +++++++++++++++++++++++++++++++++------------------
 1 file changed, 33 insertions(+), 18 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index d99bc0bf2e..8ee7e442d5 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -413,8 +413,28 @@ static void reset_gdbserver_state(void)
 
 bool gdb_has_xml;
 
+/* Check whether GDB is currently connected */
+static int gdb_is_connected(void)
+{
+    /*
+     * XXX c_cpu is NULL until gdb_accept_init has been called, so use
+     * this as a proxy for whether the gdb connection is active
+     */
+    return gdbserver_state.c_cpu != NULL;
+}
+
 #ifdef CONFIG_USER_ONLY
 
+/* Close GDB connection */
+static void gdb_disconnect(void)
+{
+    if (gdb_is_connected()) {
+        close(gdbserver_state.fd);
+        gdbserver_state.fd = -1;
+        gdbserver_state.c_cpu = NULL;
+    }
+}
+
 static int get_char(void)
 {
     uint8_t ch;
@@ -424,12 +444,11 @@ static int get_char(void)
         ret = qemu_recv(gdbserver_state.fd, &ch, 1, 0);
         if (ret < 0) {
             if (errno == ECONNRESET)
-                gdbserver_state.fd = -1;
+                gdb_disconnect();
             if (errno != EINTR)
                 return -1;
         } else if (ret == 0) {
-            close(gdbserver_state.fd);
-            gdbserver_state.fd = -1;
+            gdb_disconnect();
             return -1;
         } else {
             break;
@@ -2796,7 +2815,7 @@ void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va)
     target_ulong addr;
     uint64_t i64;
 
-    if (!gdbserver_state.init) {
+    if (!gdb_is_connected()) {
         return;
     }
 
@@ -3025,9 +3044,9 @@ void gdb_exit(CPUArchState *env, int code)
   if (gdbserver_state.socket_path) {
       unlink(gdbserver_state.socket_path);
   }
-  if (gdbserver_state.fd < 0) {
-      return;
-  }
+    if (!gdb_is_connected()) {
+        return;
+    }
 #endif
 
   trace_gdbstub_op_exiting((uint8_t)code);
@@ -3072,7 +3091,7 @@ gdb_handlesig(CPUState *cpu, int sig)
     char buf[256];
     int n;
 
-    if (!gdbserver_state.init || gdbserver_state.fd < 0) {
+    if (!gdb_is_connected()) {
         return sig;
     }
 
@@ -3086,14 +3105,14 @@ gdb_handlesig(CPUState *cpu, int sig)
     }
     /* put_packet() might have detected that the peer terminated the
        connection.  */
-    if (gdbserver_state.fd < 0) {
+    if (!gdb_is_connected()) {
         return sig;
     }
 
     sig = 0;
     gdbserver_state.state = RS_IDLE;
     gdbserver_state.running_state = 0;
-    while (gdbserver_state.running_state == 0) {
+    while (gdbserver_state.running_state == 0 && gdb_is_connected()) {
         n = read(gdbserver_state.fd, buf, 256);
         if (n > 0) {
             int i;
@@ -3104,10 +3123,7 @@ gdb_handlesig(CPUState *cpu, int sig)
         } else {
             /* XXX: Connection closed.  Should probably wait for another
                connection before continuing.  */
-            if (n == 0) {
-                close(gdbserver_state.fd);
-            }
-            gdbserver_state.fd = -1;
+            gdb_disconnect();
             return sig;
         }
     }
@@ -3121,7 +3137,7 @@ void gdb_signalled(CPUArchState *env, int sig)
 {
     char buf[4];
 
-    if (!gdbserver_state.init || gdbserver_state.fd < 0) {
+    if (!gdb_is_connected()) {
         return;
     }
 
@@ -3280,11 +3296,10 @@ int gdbserver_start(const char *port_or_path)
 /* Disable gdb stub for child processes.  */
 void gdbserver_fork(CPUState *cpu)
 {
-    if (!gdbserver_state.init || gdbserver_state.fd < 0) {
+    if (!gdb_is_connected()) {
         return;
     }
-    close(gdbserver_state.fd);
-    gdbserver_state.fd = -1;
+    gdb_disconnect();
     cpu_breakpoint_remove_all(cpu, BP_GDB);
     cpu_watchpoint_remove_all(cpu, BP_GDB);
 }
-- 
2.30.0


