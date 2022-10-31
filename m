Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F309613B13
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 17:20:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opXVk-0006dI-KL; Mon, 31 Oct 2022 12:19:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1opXVZ-0006X9-29
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 12:19:33 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1opXVT-0001Mt-IK
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 12:19:25 -0400
HMM_SOURCE_IP: 172.18.0.218:50162.1127588867
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.138.180.88 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id F1C012800EB;
 Tue,  1 Nov 2022 00:19:19 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([182.138.180.88])
 by app0025 with ESMTP id 12140b2b8d884782bed90ebce6c67986 for
 qemu-devel@nongnu.org; Tue, 01 Nov 2022 00:19:21 CST
X-Transaction-ID: 12140b2b8d884782bed90ebce6c67986
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 182.138.180.88
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 =?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?= <huangy81@chinatelecom.cn>
Subject: [PATCH RFC 4/4] vhost-user-test: Add negotiated features check
Date: Tue,  1 Nov 2022 00:19:02 +0800
Message-Id: <b231921735c0db1edee5993dbf9e045478f64652.1667232396.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1667232396.git.huangy81@chinatelecom.cn>
References: <cover.1667232396.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1667232396.git.huangy81@chinatelecom.cn>
References: <cover.1667232396.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

For vhost-user network device, Qemu backup the final features as
acked_features internally after guest acknowledging features during
virtio-net driver initialization, so the acked_features could be
used as input of VHOST_USER_SET_FEATURES command when slave device
restore from an unexpected failure.

Negotiated features check just assert if the acked_features in Qemu
is exactly the same as features in vhost slave device, which
checks if features are negotiated correctly via vhost user protocol.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 tests/qtest/vhost-user-test.c | 67 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index bf9f7c4..f8bf2fa 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -29,6 +29,9 @@
 #include "libqos/qgraph_internal.h"
 #include "hw/virtio/virtio-net.h"
 
+#include "migration-helpers.h"
+#include "qapi/qmp/qlist.h"
+
 #include "standard-headers/linux/vhost_types.h"
 #include "standard-headers/linux/virtio_ids.h"
 #include "standard-headers/linux/virtio_net.h"
@@ -167,6 +170,7 @@ typedef struct TestServer {
     int test_flags;
     int queues;
     struct vhost_user_ops *vu_ops;
+    uint64_t features;
 } TestServer;
 
 struct vhost_user_ops {
@@ -796,6 +800,64 @@ static void test_read_guest_mem(void *obj, void *arg, QGuestAllocator *alloc)
     read_guest_mem_server(global_qtest, server);
 }
 
+static QDict *query_netdev(QTestState *who)
+{
+    QDict *rsp;
+
+    rsp = qtest_qmp(who, "{ 'execute': 'query-netdev' }");
+    g_assert(!qdict_haskey(rsp, "error"));
+    g_assert(qdict_haskey(rsp, "return"));
+
+    return rsp;
+}
+
+static uint64_t get_acked_features(QTestState *who)
+{
+    QDict *rsp_return;
+    QList *info_list;
+    const QListEntry *entry;
+    QDict *info;
+    uint64_t acked_features;
+
+    rsp_return = query_netdev(who);
+    g_assert(rsp_return);
+
+    info_list = qdict_get_qlist(rsp_return, "return");
+    g_assert(info_list && !qlist_empty(info_list));
+
+    entry = qlist_first(info_list);
+    g_assert(entry);
+
+    info = qobject_to(QDict, qlist_entry_obj(entry));
+    g_assert(info);
+
+    acked_features = qdict_get_try_int(info, "acked-features", 0);
+
+    qobject_unref(rsp_return);
+    return acked_features;
+}
+
+static void read_acked_features(QTestState *qts, TestServer *s)
+{
+    uint64_t acked_features;
+
+    acked_features = get_acked_features(qts);
+    g_assert_cmpint(acked_features, ==, s->features);
+}
+
+static void test_read_acked_features(void *obj,
+                                     void *arg,
+                                     QGuestAllocator *alloc)
+{
+    TestServer *server = arg;
+
+    if (!wait_for_fds(server)) {
+        return;
+    }
+
+    read_acked_features(global_qtest, server);
+}
+
 static void test_migrate(void *obj, void *arg, QGuestAllocator *alloc)
 {
     TestServer *s = arg;
@@ -1037,6 +1099,7 @@ static void vu_net_set_features(TestServer *s, CharBackend *chr,
         qemu_chr_fe_disconnect(chr);
         s->test_flags = TEST_FLAGS_BAD;
     }
+    s->features = msg->payload.u64;
 }
 
 static void vu_net_get_protocol_features(TestServer *s, CharBackend *chr,
@@ -1078,6 +1141,10 @@ static void register_vhost_user_test(void)
                  "virtio-net",
                  test_read_guest_mem, &opts);
 
+    qos_add_test("vhost-user/read_acked_features",
+                 "virtio-net",
+                 test_read_acked_features, &opts);
+
     if (qemu_memfd_check(MFD_ALLOW_SEALING)) {
         opts.before = vhost_user_test_setup_memfd;
         qos_add_test("vhost-user/read-guest-mem/memfd",
-- 
1.8.3.1


