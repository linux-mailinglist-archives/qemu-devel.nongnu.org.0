Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F028A2C3
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Aug 2019 17:59:31 +0200 (CEST)
Received: from localhost ([::1]:46780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxCjK-0006u2-GR
	for lists+qemu-devel@lfdr.de; Mon, 12 Aug 2019 11:59:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49453)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1hxCic-0005j9-Ns
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 11:58:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1hxCib-0007ty-4R
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 11:58:46 -0400
Received: from relay.sw.ru ([185.231.240.75]:46402)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1hxCia-0007sj-SX
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 11:58:45 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1hxCiW-0001HP-8n; Mon, 12 Aug 2019 18:58:40 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-devel@nongnu.org
Date: Mon, 12 Aug 2019 18:58:29 +0300
Message-Id: <1565625509-404969-3-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1565625509-404969-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1565625509-404969-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v4 2/2] char-socket: Lock tcp_chr_disconnect()
 and socket_reconnect_timeout()
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
Cc: vsementsov@virtuozzo.com, berrange@redhat.com, berto@igalia.com,
 marcandre.lureau@redhat.com, andrey.shinkevich@virtuozzo.com,
 pbonzini@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alberto Garcia <berto@igalia.com>

There's a race condition in which the tcp_chr_read() ioc handler can
close a connection that is being written to from another thread.

Running iotest 136 in a loop triggers this problem and crashes QEMU.

 (gdb) bt
 #0  0x00005558b842902d in object_get_class (obj=0x0) at qom/object.c:860
 #1  0x00005558b84f92db in qio_channel_writev_full (ioc=0x0, iov=0x7ffc355decf0, niov=1, fds=0x0, nfds=0, errp=0x0) at io/channel.c:76
 #2  0x00005558b84e0e9e in io_channel_send_full (ioc=0x0, buf=0x5558baf5beb0, len=138, fds=0x0, nfds=0) at chardev/char-io.c:123
 #3  0x00005558b84e4a69 in tcp_chr_write (chr=0x5558ba460380, buf=0x5558baf5beb0 "...", len=138) at chardev/char-socket.c:135
 #4  0x00005558b84dca55 in qemu_chr_write_buffer (s=0x5558ba460380, buf=0x5558baf5beb0 "...", len=138, offset=0x7ffc355dedd0, write_all=false) at chardev/char.c:112
 #5  0x00005558b84dcbc2 in qemu_chr_write (s=0x5558ba460380, buf=0x5558baf5beb0 "...", len=138, write_all=false) at chardev/char.c:147
 #6  0x00005558b84dfb26 in qemu_chr_fe_write (be=0x5558ba476610, buf=0x5558baf5beb0 "...", len=138) at chardev/char-fe.c:42
 #7  0x00005558b8088c86 in monitor_flush_locked (mon=0x5558ba476610) at monitor.c:406
 #8  0x00005558b8088e8c in monitor_puts (mon=0x5558ba476610, str=0x5558ba921e49 "") at monitor.c:449
 #9  0x00005558b8089178 in qmp_send_response (mon=0x5558ba476610, rsp=0x5558bb161600) at monitor.c:498
 #10 0x00005558b808920c in monitor_qapi_event_emit (event=QAPI_EVENT_SHUTDOWN, qdict=0x5558bb161600) at monitor.c:526
 #11 0x00005558b8089307 in monitor_qapi_event_queue_no_reenter (event=QAPI_EVENT_SHUTDOWN, qdict=0x5558bb161600) at monitor.c:551
 #12 0x00005558b80896c0 in qapi_event_emit (event=QAPI_EVENT_SHUTDOWN, qdict=0x5558bb161600) at monitor.c:626
 #13 0x00005558b855f23b in qapi_event_send_shutdown (guest=false, reason=SHUTDOWN_CAUSE_HOST_QMP_QUIT) at qapi/qapi-events-run-state.c:43
 #14 0x00005558b81911ef in qemu_system_shutdown (cause=SHUTDOWN_CAUSE_HOST_QMP_QUIT) at vl.c:1837
 #15 0x00005558b8191308 in main_loop_should_exit () at vl.c:1885
 #16 0x00005558b819140d in main_loop () at vl.c:1924
 #17 0x00005558b8198c84 in main (argc=18, argv=0x7ffc355df3f8, envp=0x7ffc355df490) at vl.c:4665

This patch adds a lock to protect tcp_chr_disconnect() and
socket_reconnect_timeout()

Signed-off-by: Alberto Garcia <berto@igalia.com>
Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 chardev/char-socket.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 7ca5d97..03f0340 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -150,7 +150,7 @@ static void tcp_chr_accept(QIONetListener *listener,
                            void *opaque);
 
 static int tcp_chr_read_poll(void *opaque);
-static void tcp_chr_disconnect(Chardev *chr);
+static void tcp_chr_disconnect_locked(Chardev *chr);
 
 /* Called with chr_write_lock held.  */
 static int tcp_chr_write(Chardev *chr, const uint8_t *buf, int len)
@@ -174,7 +174,7 @@ static int tcp_chr_write(Chardev *chr, const uint8_t *buf, int len)
 
         if (ret < 0 && errno != EAGAIN) {
             if (tcp_chr_read_poll(chr) <= 0) {
-                tcp_chr_disconnect(chr);
+                tcp_chr_disconnect_locked(chr);
                 return len;
             } /* else let the read handler finish it properly */
         }
@@ -469,8 +469,9 @@ static void update_disconnected_filename(SocketChardev *s)
 /* NB may be called even if tcp_chr_connect has not been
  * reached, due to TLS or telnet initialization failure,
  * so can *not* assume s->state == TCP_CHARDEV_STATE_CONNECTED
+ * This must be called with chr->chr_write_lock held.
  */
-static void tcp_chr_disconnect(Chardev *chr)
+static void tcp_chr_disconnect_locked(Chardev *chr)
 {
     SocketChardev *s = SOCKET_CHARDEV(chr);
     bool emit_close = s->state == TCP_CHARDEV_STATE_CONNECTED;
@@ -490,6 +491,13 @@ static void tcp_chr_disconnect(Chardev *chr)
     }
 }
 
+static void tcp_chr_disconnect(Chardev *chr)
+{
+    qemu_mutex_lock(&chr->chr_write_lock);
+    tcp_chr_disconnect_locked(chr);
+    qemu_mutex_unlock(&chr->chr_write_lock);
+}
+
 static gboolean tcp_chr_read(QIOChannel *chan, GIOCondition cond, void *opaque)
 {
     Chardev *chr = CHARDEV(opaque);
@@ -1131,8 +1139,10 @@ static gboolean socket_reconnect_timeout(gpointer opaque)
     Chardev *chr = CHARDEV(opaque);
     SocketChardev *s = SOCKET_CHARDEV(opaque);
 
+    qemu_mutex_lock(&chr->chr_write_lock);
     g_source_unref(s->reconnect_timer);
     s->reconnect_timer = NULL;
+    qemu_mutex_unlock(&chr->chr_write_lock);
 
     if (chr->be_open) {
         return false;
-- 
1.8.3.1


