Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACB12C0F41
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 16:48:41 +0100 (CET)
Received: from localhost ([::1]:34466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khE52-0007cp-9U
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 10:48:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1khE1l-0005a8-5h; Mon, 23 Nov 2020 10:45:17 -0500
Received: from relay.sw.ru ([185.231.240.75]:43536 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1khE1g-0008UK-MR; Mon, 23 Nov 2020 10:45:16 -0500
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1khE1K-009zBo-Lx; Mon, 23 Nov 2020 18:44:50 +0300
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com, armbru@redhat.com,
 dgilbert@redhat.com, den@openvz.org, vsementsov@virtuozzo.com,
 andrey.shinkevich@virtuozzo.com
Subject: [PATCH v2 2/2] monitor: increase amount of data for monitor to read
Date: Mon, 23 Nov 2020 18:44:34 +0300
Message-Id: <1606146274-246154-3-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1606146274-246154-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1606146274-246154-1-git-send-email-andrey.shinkevich@virtuozzo.com>
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay3.sw.ru
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
From: Andrey Shinkevich via <qemu-devel@nongnu.org>

QMP and HMP monitors read one byte at a time from the socket or stdin,
which is very inefficient. With 100+ VMs on the host, this results in
multiple extra system calls and CPU overuse.
This patch increases the amount of read data up to 4096 bytes that fits
the buffer size on the channel level.
A JSON little parser is introduced to throttle QMP commands read from
the buffer so that incoming requests do not overflow the monitor input
queue.

Suggested-by: Denis V. Lunev <den@openvz.org>
Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 chardev/char-fd.c      | 35 +++++++++++++++++++++++++++++++++--
 chardev/char-socket.c  | 42 +++++++++++++++++++++++++++++++++++++++---
 chardev/char.c         | 41 +++++++++++++++++++++++++++++++++++++++++
 include/chardev/char.h | 15 +++++++++++++++
 monitor/monitor.c      |  2 +-
 5 files changed, 129 insertions(+), 6 deletions(-)

diff --git a/chardev/char-fd.c b/chardev/char-fd.c
index 1cd62f2..15bc8f4 100644
--- a/chardev/char-fd.c
+++ b/chardev/char-fd.c
@@ -33,6 +33,8 @@
 #include "chardev/char-fd.h"
 #include "chardev/char-io.h"
 
+#include "monitor/monitor-internal.h"
+
 /* Called with chr_write_lock held.  */
 static int fd_chr_write(Chardev *chr, const uint8_t *buf, int len)
 {
@@ -45,8 +47,12 @@ static gboolean fd_chr_read(QIOChannel *chan, GIOCondition cond, void *opaque)
 {
     Chardev *chr = CHARDEV(opaque);
     FDChardev *s = FD_CHARDEV(opaque);
+    CharBackend *be = chr->be;
+    Monitor *mon = (Monitor *)be->opaque;
     int len;
     uint8_t buf[CHR_READ_BUF_LEN];
+    uint8_t *cursor;
+    int load, size, pos;
     ssize_t ret;
 
     len = sizeof(buf);
@@ -62,10 +68,35 @@ static gboolean fd_chr_read(QIOChannel *chan, GIOCondition cond, void *opaque)
     if (ret == 0) {
         remove_fd_in_watch(chr);
         qemu_chr_be_event(chr, CHR_EVENT_CLOSED);
+        chr->json_thl = (const JSONthrottle){0};
         return FALSE;
     }
-    if (ret > 0) {
-        qemu_chr_be_write(chr, buf, ret);
+    if (ret < 0) {
+        return TRUE;
+    }
+    load = ret;
+    cursor = buf;
+
+    while (load > 0) {
+        size = load;
+        if (monitor_is_qmp(mon)) {
+            /* Find the end position of a JSON command in the input buffer */
+            pos = qemu_chr_end_position((const char *) cursor, size,
+                                        &chr->json_thl);
+            if (pos >= 0) {
+                size = pos + 1;
+            }
+        }
+
+        qemu_chr_be_write(chr, cursor, size);
+        cursor += size;
+        load -= size;
+
+        if (load > 0) {
+            while (qatomic_mb_read(&mon->suspend_cnt)) {
+                g_usleep(40);
+            }
+        }
     }
 
     return TRUE;
diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 213a4c8..30ad1d4 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -38,6 +38,8 @@
 #include "chardev/char-io.h"
 #include "qom/object.h"
 
+#include "monitor/monitor-internal.h"
+
 /***********************************************************/
 /* TCP Net console */
 
@@ -522,7 +524,11 @@ static gboolean tcp_chr_read(QIOChannel *chan, GIOCondition cond, void *opaque)
 {
     Chardev *chr = CHARDEV(opaque);
     SocketChardev *s = SOCKET_CHARDEV(opaque);
+    CharBackend *be = chr->be;
+    Monitor *mon = (Monitor *)be->opaque;
     uint8_t buf[CHR_READ_BUF_LEN];
+    uint8_t *cursor;
+    int load, pos;
     int len, size;
 
     if ((s->state != TCP_CHARDEV_STATE_CONNECTED) ||
@@ -537,12 +543,42 @@ static gboolean tcp_chr_read(QIOChannel *chan, GIOCondition cond, void *opaque)
     if (size == 0 || (size == -1 && errno != EAGAIN)) {
         /* connection closed */
         tcp_chr_disconnect(chr);
-    } else if (size > 0) {
+        chr->json_thl = (const JSONthrottle){0};
+        return TRUE;
+    }
+    if (size < 0) {
+        return TRUE;
+    }
+    load = size;
+    cursor = buf;
+
+    while (load > 0) {
+        size = load;
+        if (monitor_is_qmp(mon)) {
+            /* Find the end position of a JSON command in the input buffer */
+            pos = qemu_chr_end_position((const char *) cursor, size,
+                                        &chr->json_thl);
+            if (pos >= 0) {
+                size = pos + 1;
+            }
+        }
+        len = size;
+
         if (s->do_telnetopt) {
-            tcp_chr_process_IAC_bytes(chr, s, buf, &size);
+            tcp_chr_process_IAC_bytes(chr, s, cursor, &size);
         }
         if (size > 0) {
-            qemu_chr_be_write(chr, buf, size);
+            qemu_chr_be_write(chr, cursor, size);
+            cursor += size;
+            load -= size;
+        } else {
+            cursor += len;
+            load -= len;
+        }
+        if (load > 0) {
+            while (qatomic_mb_read(&mon->suspend_cnt)) {
+                g_usleep(40);
+            }
         }
     }
 
diff --git a/chardev/char.c b/chardev/char.c
index aa42821..75c7bc7 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -1178,6 +1178,47 @@ GSource *qemu_chr_timeout_add_ms(Chardev *chr, guint ms,
     return source;
 }
 
+/*
+ * Split up the incoming buffered stream into separate QMP commands so that the
+ * QMP monitor queue is not overflown with requests. The function looks for
+ * the last paired brace/bracket in a JSON format text. It is a simplified
+ * parser implemented in the json_message_process_token() function.
+ */
+int qemu_chr_end_position(const char *buf, int size, JSONthrottle *thl)
+{
+    int i;
+
+    for (i = 0; i < size; i++) {
+        switch (buf[i]) {
+        case ' ':
+        case '\n':
+        case '\r':
+            continue;
+        case '{':
+            thl->brace_count++;
+            break;
+        case '}':
+            thl->brace_count--;
+            break;
+        case '[':
+            thl->bracket_count++;
+            break;
+        case ']':
+            thl->bracket_count--;
+            break;
+        default:
+            break;
+        }
+        /* The same condition as it is in the json_message_process_token() */
+        if ((thl->brace_count > 0 || thl->bracket_count > 0)
+            && thl->brace_count >= 0 && thl->bracket_count >= 0) {
+            continue;
+        }
+        return i;
+    }
+    return -1;
+}
+
 void qemu_chr_cleanup(void)
 {
     object_unparent(get_chardevs_root());
diff --git a/include/chardev/char.h b/include/chardev/char.h
index db42f0a..6026293 100644
--- a/include/chardev/char.h
+++ b/include/chardev/char.h
@@ -16,6 +16,8 @@
 
 /* character device */
 typedef struct CharBackend CharBackend;
+/* Throttler helper to separate QMP commands in JSON format text */
+typedef struct JSONthrottle JSONthrottle;
 
 typedef enum {
     CHR_EVENT_BREAK, /* serial break char */
@@ -56,6 +58,11 @@ typedef enum {
 
 #define qemu_chr_replay(chr) qemu_chr_has_feature(chr, QEMU_CHAR_FEATURE_REPLAY)
 
+struct JSONthrottle {
+    int brace_count;
+    int bracket_count;
+};
+
 struct Chardev {
     Object parent_obj;
 
@@ -65,6 +72,7 @@ struct Chardev {
     char *filename;
     int logfd;
     int be_open;
+    JSONthrottle json_thl;
     GSource *gsource;
     GMainContext *gcontext;
     DECLARE_BITMAP(features, QEMU_CHAR_FEATURE_LAST);
@@ -141,6 +149,13 @@ Chardev *qemu_chr_new_mux_mon(const char *label, const char *filename,
 void qemu_chr_change(QemuOpts *opts, Error **errp);
 
 /**
+ * Split the incoming buffered stream so that the QMP monitor queue is not
+ * overflown with requests. The function looks for the last paired
+ * brace/bracket in a JSON command.
+ */
+int qemu_chr_end_position(const char *buf, int size, JSONthrottle *thl);
+
+/**
  * qemu_chr_cleanup:
  *
  * Delete all chardevs (when leaving qemu)
diff --git a/monitor/monitor.c b/monitor/monitor.c
index 84222cd..43d2d3b 100644
--- a/monitor/monitor.c
+++ b/monitor/monitor.c
@@ -566,7 +566,7 @@ int monitor_can_read(void *opaque)
 {
     Monitor *mon = opaque;
 
-    return !qatomic_mb_read(&mon->suspend_cnt);
+    return !qatomic_mb_read(&mon->suspend_cnt) ? CHR_READ_BUF_LEN : 0;
 }
 
 void monitor_list_append(Monitor *mon)
-- 
1.8.3.1


