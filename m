Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8DF257684
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Aug 2020 11:30:59 +0200 (CEST)
Received: from localhost ([::1]:53664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCg9S-0005Yh-ST
	for lists+qemu-devel@lfdr.de; Mon, 31 Aug 2020 05:30:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dimastep@yandex-team.ru>)
 id 1kCg6b-0001YW-NS; Mon, 31 Aug 2020 05:28:01 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:58212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dimastep@yandex-team.ru>)
 id 1kCg6Z-0004zq-Cz; Mon, 31 Aug 2020 05:28:01 -0400
Received: from sas1-ec30c78b6c5b.qloud-c.yandex.net
 (sas1-ec30c78b6c5b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:2704:0:640:ec30:c78b])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 1C7C92E1666;
 Mon, 31 Aug 2020 12:27:57 +0300 (MSK)
Received: from sas1-58a37b48fb94.qloud-c.yandex.net
 (sas1-58a37b48fb94.qloud-c.yandex.net [2a02:6b8:c08:1d1b:0:640:58a3:7b48])
 by sas1-ec30c78b6c5b.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 YIJyRZsaXO-RsvKR2Ht; Mon, 31 Aug 2020 12:27:56 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1598866076; bh=gDOPq1RV3CLuGyPljyeYmAP4zg0EO7xHieFeyJevpn0=;
 h=In-Reply-To:In-Reply-To:Message-Id:References:References:Date:
 Subject:To:From:Cc;
 b=zf3Lzc2t6+6X9RKsKEw3iaTl3BgCuO8FGwaoVmEBF0JgrKdLnSCBdqxilkBi1LHMF
 v9FjXHBDzxusBply0wYBwjfy22x7JoaKSpAgb67mbgziuHiqFLwAxAc1alDDop1JmE
 TRXOJjytXQfjt5ZscZ4USXHs2Ad7er2xo1MOAXH4=
Authentication-Results: sas1-ec30c78b6c5b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:216::1:a])
 by sas1-58a37b48fb94.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 yaozkQMlmT-Rsm8S903; Mon, 31 Aug 2020 12:27:54 +0300
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (Client certificate not present)
From: Dima Stepanov <dimastep@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/7] tests/qtest/vhost-user-test: prepare the tests for
 adding new dev class
Date: Mon, 31 Aug 2020 12:27:19 +0300
Message-Id: <769cf817bad80e2534093e5887837b1c5e4675e2.1598865610.git.dimastep@yandex-team.ru>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1598865610.git.dimastep@yandex-team.ru>
References: <cover.1598865610.git.dimastep@yandex-team.ru>
In-Reply-To: <cover.1598865610.git.dimastep@yandex-team.ru>
References: <cover.1598865610.git.dimastep@yandex-team.ru>
Received-SPF: pass client-ip=77.88.29.217;
 envelope-from=dimastep@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 04:37:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, lvivier@redhat.com, thuth@redhat.com,
 qemu-block@nongnu.org, mst@redhat.com, jasowang@redhat.com,
 dgilbert@redhat.com, mreitz@redhat.com, fengli@smartx.com,
 yc-core@yandex-team.ru, pbonzini@redhat.com, raphael.norwitz@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For now only vhost-user-net device is supported by the test. Other
vhost-user devices are not tested. As a first step make source code
refactoring so new devices can reuse the same test routines. To make
this provide a new vhost_user_ops structure with the methods to
initialize device, its command line or make a proper vhost-user
responses.

Signed-off-by: Dima Stepanov <dimastep@yandex-team.ru>
---
 tests/qtest/vhost-user-test.c | 105 ++++++++++++++++++++++++++++++------------
 1 file changed, 76 insertions(+), 29 deletions(-)

diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index 9ee0f1e..3df5322 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -135,6 +135,10 @@ enum {
     TEST_FLAGS_END,
 };
 
+enum {
+    VHOST_USER_NET,
+};
+
 typedef struct TestServer {
     gchar *socket_path;
     gchar *mig_path;
@@ -154,10 +158,25 @@ typedef struct TestServer {
     bool test_fail;
     int test_flags;
     int queues;
+    struct vhost_user_ops *vu_ops;
 } TestServer;
 
+struct vhost_user_ops {
+    /* Device types. */
+    int type;
+    void (*append_opts)(TestServer *s, GString *cmd_line,
+            const char *chr_opts);
+
+    /* VHOST-USER commands. */
+    void (*set_features)(TestServer *s, CharBackend *chr,
+            VhostUserMsg *msg);
+    void (*get_protocol_features)(TestServer *s,
+            CharBackend *chr, VhostUserMsg *msg);
+};
+
 static const char *init_hugepagefs(void);
-static TestServer *test_server_new(const gchar *name);
+static TestServer *test_server_new(const gchar *name,
+        struct vhost_user_ops *ops);
 static void test_server_free(TestServer *server);
 static void test_server_listen(TestServer *server);
 
@@ -167,7 +186,7 @@ enum test_memfd {
     TEST_MEMFD_NO,
 };
 
-static void append_vhost_opts(TestServer *s, GString *cmd_line,
+static void append_vhost_net_opts(TestServer *s, GString *cmd_line,
                              const char *chr_opts)
 {
     g_string_append_printf(cmd_line, QEMU_CMD_CHR QEMU_CMD_NETDEV,
@@ -332,25 +351,15 @@ static void chr_read(void *opaque, const uint8_t *buf, int size)
         break;
 
     case VHOST_USER_SET_FEATURES:
-        g_assert_cmpint(msg.payload.u64 & (0x1ULL << VHOST_USER_F_PROTOCOL_FEATURES),
-                        !=, 0ULL);
-        if (s->test_flags == TEST_FLAGS_DISCONNECT) {
-            qemu_chr_fe_disconnect(chr);
-            s->test_flags = TEST_FLAGS_BAD;
+        if (s->vu_ops->set_features) {
+            s->vu_ops->set_features(s, chr, &msg);
         }
         break;
 
     case VHOST_USER_GET_PROTOCOL_FEATURES:
-        /* send back features to qemu */
-        msg.flags |= VHOST_USER_REPLY_MASK;
-        msg.size = sizeof(m.payload.u64);
-        msg.payload.u64 = 1 << VHOST_USER_PROTOCOL_F_LOG_SHMFD;
-        msg.payload.u64 |= 1 << VHOST_USER_PROTOCOL_F_CROSS_ENDIAN;
-        if (s->queues > 1) {
-            msg.payload.u64 |= 1 << VHOST_USER_PROTOCOL_F_MQ;
+        if (s->vu_ops->get_protocol_features) {
+            s->vu_ops->get_protocol_features(s, chr, &msg);
         }
-        p = (uint8_t *) &msg;
-        qemu_chr_fe_write_all(chr, p, VHOST_USER_HDR_SIZE + msg.size);
         break;
 
     case VHOST_USER_GET_VRING_BASE:
@@ -467,7 +476,8 @@ static const char *init_hugepagefs(void)
 #endif
 }
 
-static TestServer *test_server_new(const gchar *name)
+static TestServer *test_server_new(const gchar *name,
+        struct vhost_user_ops *ops)
 {
     TestServer *server = g_new0(TestServer, 1);
     char template[] = "/tmp/vhost-test-XXXXXX";
@@ -495,6 +505,7 @@ static TestServer *test_server_new(const gchar *name)
 
     server->log_fd = -1;
     server->queues = 1;
+    server->vu_ops = ops;
 
     return server;
 }
@@ -669,11 +680,11 @@ static void vhost_user_test_cleanup(void *s)
 
 static void *vhost_user_test_setup(GString *cmd_line, void *arg)
 {
-    TestServer *server = test_server_new("vhost-user-test");
+    TestServer *server = test_server_new("vhost-user-test", arg);
     test_server_listen(server);
 
     append_mem_opts(server, cmd_line, 256, TEST_MEMFD_AUTO);
-    append_vhost_opts(server, cmd_line, "");
+    server->vu_ops->append_opts(server, cmd_line, "");
 
     g_test_queue_destroy(vhost_user_test_cleanup, server);
 
@@ -682,11 +693,11 @@ static void *vhost_user_test_setup(GString *cmd_line, void *arg)
 
 static void *vhost_user_test_setup_memfd(GString *cmd_line, void *arg)
 {
-    TestServer *server = test_server_new("vhost-user-test");
+    TestServer *server = test_server_new("vhost-user-test", arg);
     test_server_listen(server);
 
     append_mem_opts(server, cmd_line, 256, TEST_MEMFD_YES);
-    append_vhost_opts(server, cmd_line, "");
+    server->vu_ops->append_opts(server, cmd_line, "");
 
     g_test_queue_destroy(vhost_user_test_cleanup, server);
 
@@ -720,7 +731,7 @@ static void test_migrate(void *obj, void *arg, QGuestAllocator *alloc)
         return;
     }
 
-    dest = test_server_new("dest");
+    dest = test_server_new("dest", s->vu_ops);
     dest_cmdline = g_string_new(qos_get_current_command_line());
     uri = g_strdup_printf("%s%s", "unix:", dest->mig_path);
 
@@ -730,7 +741,7 @@ static void test_migrate(void *obj, void *arg, QGuestAllocator *alloc)
     test_server_listen(dest);
     g_string_append_printf(dest_cmdline, " -incoming %s", uri);
     append_mem_opts(dest, dest_cmdline, 256, TEST_MEMFD_AUTO);
-    append_vhost_opts(dest, dest_cmdline, "");
+    dest->vu_ops->append_opts(dest, dest_cmdline, "");
     to = qtest_init(dest_cmdline->str);
 
     /* This would be where you call qos_allocate_objects(to, NULL), if you want
@@ -831,11 +842,11 @@ connect_thread(gpointer data)
 
 static void *vhost_user_test_setup_reconnect(GString *cmd_line, void *arg)
 {
-    TestServer *s = test_server_new("reconnect");
+    TestServer *s = test_server_new("reconnect", arg);
 
     g_thread_new("connect", connect_thread, s);
     append_mem_opts(s, cmd_line, 256, TEST_MEMFD_AUTO);
-    append_vhost_opts(s, cmd_line, ",server");
+    s->vu_ops->append_opts(s, cmd_line, ",server");
 
     g_test_queue_destroy(vhost_user_test_cleanup, s);
 
@@ -866,13 +877,13 @@ static void test_reconnect(void *obj, void *arg, QGuestAllocator *alloc)
 
 static void *vhost_user_test_setup_connect_fail(GString *cmd_line, void *arg)
 {
-    TestServer *s = test_server_new("connect-fail");
+    TestServer *s = test_server_new("connect-fail", arg);
 
     s->test_fail = true;
 
     g_thread_new("connect", connect_thread, s);
     append_mem_opts(s, cmd_line, 256, TEST_MEMFD_AUTO);
-    append_vhost_opts(s, cmd_line, ",server");
+    s->vu_ops->append_opts(s, cmd_line, ",server");
 
     g_test_queue_destroy(vhost_user_test_cleanup, s);
 
@@ -881,13 +892,13 @@ static void *vhost_user_test_setup_connect_fail(GString *cmd_line, void *arg)
 
 static void *vhost_user_test_setup_flags_mismatch(GString *cmd_line, void *arg)
 {
-    TestServer *s = test_server_new("flags-mismatch");
+    TestServer *s = test_server_new("flags-mismatch", arg);
 
     s->test_flags = TEST_FLAGS_DISCONNECT;
 
     g_thread_new("connect", connect_thread, s);
     append_mem_opts(s, cmd_line, 256, TEST_MEMFD_AUTO);
-    append_vhost_opts(s, cmd_line, ",server");
+    s->vu_ops->append_opts(s, cmd_line, ",server");
 
     g_test_queue_destroy(vhost_user_test_cleanup, s);
 
@@ -924,11 +935,47 @@ static void test_multiqueue(void *obj, void *arg, QGuestAllocator *alloc)
     wait_for_rings_started(s, s->queues * 2);
 }
 
+static void vu_net_set_features(TestServer *s, CharBackend *chr,
+        VhostUserMsg *msg)
+{
+    g_assert_cmpint(msg->payload.u64 &
+            (0x1ULL << VHOST_USER_F_PROTOCOL_FEATURES), !=, 0ULL);
+    if (s->test_flags == TEST_FLAGS_DISCONNECT) {
+        qemu_chr_fe_disconnect(chr);
+        s->test_flags = TEST_FLAGS_BAD;
+    }
+}
+
+static void vu_net_get_protocol_features(TestServer *s, CharBackend *chr,
+        VhostUserMsg *msg)
+{
+    /* send back features to qemu */
+    msg->flags |= VHOST_USER_REPLY_MASK;
+    msg->size = sizeof(m.payload.u64);
+    msg->payload.u64 = 1 << VHOST_USER_PROTOCOL_F_LOG_SHMFD;
+    msg->payload.u64 |= 1 << VHOST_USER_PROTOCOL_F_CROSS_ENDIAN;
+    if (s->queues > 1) {
+        msg->payload.u64 |= 1 << VHOST_USER_PROTOCOL_F_MQ;
+    }
+    qemu_chr_fe_write_all(chr, (uint8_t *)msg, VHOST_USER_HDR_SIZE + msg->size);
+}
+
+/* Each VHOST-USER device should have its ops structure defined. */
+static struct vhost_user_ops g_vu_net_ops = {
+    .type = VHOST_USER_NET,
+
+    .append_opts = append_vhost_net_opts,
+
+    .set_features = vu_net_set_features,
+    .get_protocol_features = vu_net_get_protocol_features,
+};
+
 static void register_vhost_user_test(void)
 {
     QOSGraphTestOptions opts = {
         .before = vhost_user_test_setup,
         .subprocess = true,
+        .arg = &g_vu_net_ops,
     };
 
     qemu_add_opts(&qemu_chardev_opts);
-- 
2.7.4


