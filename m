Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E54B2702E33
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:35:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXr6-0004fs-UY; Mon, 15 May 2023 09:03:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pyXqi-0004NN-5G
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:02:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pyXqg-0000zO-AH
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:02:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684155764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=063Wkz46boUh95jEY6Wg8BdHSzMUAzj+P9SdvWac5xM=;
 b=Igb4iLask/wAOVlrRGpxKAMec9xvYBjMZQl2A8esFngsIrO9A4UkvSBnzr2AYSF2okrypQ
 c8kagRHXTyTjvusjBX3Nccou0AaTliChIfX+3cBustJUvDI6S5AeB9MWbsTTcAeWN3gH5c
 yaAK4L232iXOjMCXwagaeI/zOJ+FLp0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-2yiGEoXCP66pUfZaIfj3Rg-1; Mon, 15 May 2023 09:02:42 -0400
X-MC-Unique: 2yiGEoXCP66pUfZaIfj3Rg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E1361C0ED07;
 Mon, 15 May 2023 13:02:41 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84F3040C6EC4;
 Mon, 15 May 2023 13:02:39 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: Laurent Vivier <lvivier@redhat.com>
Subject: [PULL 03/21] net: stream: test reconnect option with an unix socket
Date: Mon, 15 May 2023 15:02:15 +0200
Message-Id: <20230515130233.418183-4-thuth@redhat.com>
In-Reply-To: <20230515130233.418183-1-thuth@redhat.com>
References: <20230515130233.418183-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Laurent Vivier <lvivier@redhat.com>

We can have failure with the inet type test because the port address
is not allocated atomically and can be taken by another test between its
selection and the start of QEMU. To avoid that, use an unix socket with
a path that is unique

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Message-Id: <20230503094109.1198248-1-lvivier@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/netdev-socket.c | 39 +++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/tests/qtest/netdev-socket.c b/tests/qtest/netdev-socket.c
index 9cf1b0698e..097abc0230 100644
--- a/tests/qtest/netdev-socket.c
+++ b/tests/qtest/netdev-socket.c
@@ -189,28 +189,26 @@ static void wait_stream_disconnected(QTestState *qts, const char *id)
     qobject_unref(resp);
 }
 
-static void test_stream_inet_reconnect(void)
+static void test_stream_unix_reconnect(void)
 {
     QTestState *qts0, *qts1;
-    int port;
     SocketAddress *addr;
+    gchar *path;
 
-    port = inet_get_free_port(false);
+    path = g_strconcat(tmpdir, "/stream_unix_reconnect", NULL);
     qts0 = qtest_initf("-nodefaults -M none "
-                       "-netdev stream,id=st0,server=true,addr.type=inet,"
-                       "addr.ipv4=on,addr.ipv6=off,"
-                       "addr.host=127.0.0.1,addr.port=%d", port);
+                       "-netdev stream,id=st0,server=true,addr.type=unix,"
+                       "addr.path=%s", path);
 
     EXPECT_STATE(qts0, "st0: index=0,type=stream,\r\n", 0);
 
     qts1 = qtest_initf("-nodefaults -M none "
-                       "-netdev stream,server=false,id=st0,addr.type=inet,"
-                       "addr.ipv4=on,addr.ipv6=off,reconnect=1,"
-                       "addr.host=127.0.0.1,addr.port=%d", port);
+                       "-netdev stream,server=false,id=st0,addr.type=unix,"
+                       "addr.path=%s,reconnect=1", path);
 
     wait_stream_connected(qts0, "st0", &addr);
-    g_assert_cmpint(addr->type, ==, SOCKET_ADDRESS_TYPE_INET);
-    g_assert_cmpstr(addr->u.inet.host, ==, "127.0.0.1");
+    g_assert_cmpint(addr->type, ==, SOCKET_ADDRESS_TYPE_UNIX);
+    g_assert_cmpstr(addr->u.q_unix.path, ==, path);
     qapi_free_SocketAddress(addr);
 
     /* kill server */
@@ -221,24 +219,23 @@ static void test_stream_inet_reconnect(void)
 
     /* restart server */
     qts0 = qtest_initf("-nodefaults -M none "
-                       "-netdev stream,id=st0,server=true,addr.type=inet,"
-                       "addr.ipv4=on,addr.ipv6=off,"
-                       "addr.host=127.0.0.1,addr.port=%d", port);
+                       "-netdev stream,id=st0,server=true,addr.type=unix,"
+                       "addr.path=%s", path);
 
     /* wait connection events*/
     wait_stream_connected(qts0, "st0", &addr);
-    g_assert_cmpint(addr->type, ==, SOCKET_ADDRESS_TYPE_INET);
-    g_assert_cmpstr(addr->u.inet.host, ==, "127.0.0.1");
+    g_assert_cmpint(addr->type, ==, SOCKET_ADDRESS_TYPE_UNIX);
+    g_assert_cmpstr(addr->u.q_unix.path, ==, path);
     qapi_free_SocketAddress(addr);
 
     wait_stream_connected(qts1, "st0", &addr);
-    g_assert_cmpint(addr->type, ==, SOCKET_ADDRESS_TYPE_INET);
-    g_assert_cmpstr(addr->u.inet.host, ==, "127.0.0.1");
-    g_assert_cmpint(atoi(addr->u.inet.port), ==, port);
+    g_assert_cmpint(addr->type, ==, SOCKET_ADDRESS_TYPE_UNIX);
+    g_assert_cmpstr(addr->u.q_unix.path, ==, path);
     qapi_free_SocketAddress(addr);
 
     qtest_quit(qts1);
     qtest_quit(qts0);
+    g_free(path);
 }
 
 static void test_stream_inet_ipv6(void)
@@ -517,8 +514,6 @@ int main(int argc, char **argv)
 #ifndef _WIN32
         qtest_add_func("/netdev/dgram/mcast", test_dgram_mcast);
 #endif
-        qtest_add_func("/netdev/stream/inet/reconnect",
-                       test_stream_inet_reconnect);
     }
     if (has_ipv6) {
         qtest_add_func("/netdev/stream/inet/ipv6", test_stream_inet_ipv6);
@@ -530,6 +525,8 @@ int main(int argc, char **argv)
         qtest_add_func("/netdev/dgram/unix", test_dgram_unix);
 #endif
         qtest_add_func("/netdev/stream/unix", test_stream_unix);
+        qtest_add_func("/netdev/stream/unix/reconnect",
+                       test_stream_unix_reconnect);
 #ifdef CONFIG_LINUX
         qtest_add_func("/netdev/stream/unix/abstract",
                        test_stream_unix_abstract);
-- 
2.31.1


