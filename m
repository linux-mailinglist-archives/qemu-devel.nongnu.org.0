Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3116396C2
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Nov 2022 16:27:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyx42-0008VN-6G; Sat, 26 Nov 2022 10:25:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1oyx3w-0008SB-T6
 for qemu-devel@nongnu.org; Sat, 26 Nov 2022 10:25:52 -0500
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1oyx3v-0006ut-9O
 for qemu-devel@nongnu.org; Sat, 26 Nov 2022 10:25:52 -0500
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id 2561ADA16F8;
 Sat, 26 Nov 2022 16:25:50 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id 227D146000E; Sat, 26 Nov 2022 16:25:50 +0100 (CET)
To: qemu-devel@nongnu.org,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Stefan Weil <sw@weilnetz.de>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 for-7.2 6/6] Add G_GNUC_PRINTF to function
 qemu_set_info_str and fix related issues
Date: Sat, 26 Nov 2022 16:25:07 +0100
Message-Id: <20221126152507.283271-7-sw@weilnetz.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221126152507.283271-1-sw@weilnetz.de>
References: <20221126152507.283271-1-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

With the G_GNUC_PRINTF function attribute the compiler detects
two potential insecure format strings:

../../../net/stream.c:248:31: warning: format string is not a string literal (potentially insecure) [-Wformat-security]
    qemu_set_info_str(&s->nc, uri);
                              ^~~
../../../net/stream.c:322:31: warning: format string is not a string literal (potentially insecure) [-Wformat-security]
    qemu_set_info_str(&s->nc, uri);
                              ^~~

There are also two other warnings:

../../../net/socket.c:182:35: warning: zero-length gnu_printf format string [-Wformat-zero-length]
  182 |         qemu_set_info_str(&s->nc, "");
      |                                   ^~
../../../net/stream.c:170:35: warning: zero-length gnu_printf format string [-Wformat-zero-length]
  170 |         qemu_set_info_str(&s->nc, "");

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 include/net/net.h | 3 ++-
 net/socket.c      | 2 +-
 net/stream.c      | 6 +++---
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/include/net/net.h b/include/net/net.h
index 3db75ff841..dc20b31e9f 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -177,7 +177,8 @@ ssize_t qemu_send_packet_async(NetClientState *nc, const uint8_t *buf,
 void qemu_purge_queued_packets(NetClientState *nc);
 void qemu_flush_queued_packets(NetClientState *nc);
 void qemu_flush_or_purge_queued_packets(NetClientState *nc, bool purge);
-void qemu_set_info_str(NetClientState *nc, const char *fmt, ...);
+void qemu_set_info_str(NetClientState *nc,
+                       const char *fmt, ...) G_GNUC_PRINTF(2, 3);
 void qemu_format_nic_info_str(NetClientState *nc, uint8_t macaddr[6]);
 bool qemu_has_ufo(NetClientState *nc);
 bool qemu_has_vnet_hdr(NetClientState *nc);
diff --git a/net/socket.c b/net/socket.c
index 4944bb70d5..e62137c839 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -179,7 +179,7 @@ static void net_socket_send(void *opaque)
         s->fd = -1;
         net_socket_rs_init(&s->rs, net_socket_rs_finalize, false);
         s->nc.link_down = true;
-        qemu_set_info_str(&s->nc, "");
+        qemu_set_info_str(&s->nc, "%s", "");
 
         return;
     }
diff --git a/net/stream.c b/net/stream.c
index 53b7040cc4..37ff727e0c 100644
--- a/net/stream.c
+++ b/net/stream.c
@@ -167,7 +167,7 @@ static gboolean net_stream_send(QIOChannel *ioc,
 
         net_socket_rs_init(&s->rs, net_stream_rs_finalize, false);
         s->nc.link_down = true;
-        qemu_set_info_str(&s->nc, "");
+        qemu_set_info_str(&s->nc, "%s", "");
 
         qapi_event_send_netdev_stream_disconnected(s->nc.name);
 
@@ -245,7 +245,7 @@ static void net_stream_listen(QIONetListener *listener,
     }
     g_assert(addr != NULL);
     uri = socket_uri(addr);
-    qemu_set_info_str(&s->nc, uri);
+    qemu_set_info_str(&s->nc, "%s", uri);
     g_free(uri);
     qapi_event_send_netdev_stream_connected(s->nc.name, addr);
     qapi_free_SocketAddress(addr);
@@ -319,7 +319,7 @@ static void net_stream_client_connected(QIOTask *task, gpointer opaque)
     addr = qio_channel_socket_get_remote_address(sioc, NULL);
     g_assert(addr != NULL);
     uri = socket_uri(addr);
-    qemu_set_info_str(&s->nc, uri);
+    qemu_set_info_str(&s->nc, "%s", uri);
     g_free(uri);
 
     ret = qemu_socket_try_set_nonblock(sioc->fd);
-- 
2.35.1


