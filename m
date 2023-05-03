Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A5C6F54F3
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:41:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8zD-0003Qp-7x; Wed, 03 May 2023 05:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pu8zB-0003Q9-CP
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:41:21 -0400
Received: from mout.kundenserver.de ([212.227.126.134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pu8z8-0001TC-2z
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:41:21 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mm9NA-1qcFE83IA4-00i9rA; Wed, 03 May 2023 11:41:12 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] net: stream: test reconnect option with an unix socket
Date: Wed,  3 May 2023 11:41:09 +0200
Message-Id: <20230503094109.1198248-1-lvivier@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:k5Gh3kG8GsZ2zk7zVFG9iLX9WXX4hbOgmUDVk7c3WmWr2ea/hdA
 iZxfWbVH/H0WW+hII40WnmDZrCMoFtmnR2SrESvEL2eIVHlLBKfdR9xztwvLrOBlu7WPiI4
 qTljy9Ee0IzJeVr05s+Jm827waGqjtfOnribtDKdVPlIWtirWdkhhlAAnz1ee3qmhX1LP6m
 Rn8hcP/tyQL8Jmn2KCKZA==
UI-OutboundReport: notjunk:1;M01:P0:cCgdSlU9GMI=;0Akc5qOmvwfsILpGUlljpg6YfdI
 SsXRLnBaUeC1QDEhTizWmLH9geLFEifLry5oiRG/By43aeHtwLMdNfrpCBmO6xnHMhAqd6sbM
 Ox8m1FMyL4ExQ3Or5PR5oJQjPPsDoTRaV/MrCn3uPXR9XT1YNkPoCYlD3K33GImRaTbh9X3fl
 Sw1mg0jzmAexvXGu65BiUPGIV4zjcEDHGZdK+HHRfF1K8nCAauL5vrsKL7EdcSFro2A1STkyj
 0roJDj1bi51aGSq2py6FBbkV2HWGP4a1CiSS39Vx9c7pboUP4otFVBffhnKJ760khkNQ9Hj2P
 1MzjtRZ90nyYBmfuaZuXsdTJECIU5Ze6AALj2vfhOjlueQSMyFh1oORND+u8k2Io+xRceBB/5
 gTT3puYLaW02P0QmYapA6ZyndUsYQKUEbRg1CccSxoX0RT+HnokkHPI+nTzs/FlrRJUaEMHd5
 EX8pvflZxE3oxi1bWOzyRNChi3HI+SJhTLK9nN4XVlttX6SRiTl7TkFRadUBfL1Xc1a7iedsW
 qb3Fub6oF+xZ1sQ6EjDEIfPAjG2m8lp9wokq4sBIVXNmaLMxkh+7N7kY3gD222taLPt8bS9OS
 c8wn8feUdWiLOqA9vroIipWaK5QwZmTNkCxazafZDv1q+ApciYzHcst7A/SAfXVnd7RQ5TnZP
 3khYBiTYYcIHspqeBlZ1fV8gSjdPwEW0G/RGHygaMg==
Received-SPF: permerror client-ip=212.227.126.134;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_FAIL=0.001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

We can have failure with the inet type test because the port address
is not allocated atomically and can be taken by another test between its
selection and the start of QEMU. To avoid that, use an unix socket with
a path that is unique

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 tests/qtest/netdev-socket.c | 39 +++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/tests/qtest/netdev-socket.c b/tests/qtest/netdev-socket.c
index 9cf1b0698eba..097abc0230b9 100644
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
2.39.2


