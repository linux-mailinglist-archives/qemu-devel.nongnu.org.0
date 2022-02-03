Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 843DD4A86C0
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 15:41:16 +0100 (CET)
Received: from localhost ([::1]:54376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFdIR-0007xa-KI
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 09:41:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1nFcvN-0005Ou-Pf
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 09:17:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1nFcvD-0006DA-41
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 09:17:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643897757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N9PSwprvbo1nQh5G7WZibNxih2Hsef7DDd8yH8YXI+Y=;
 b=KCv8B8O5228y/bDeJo7h+I/J9ySSaqYbA0bc4s8XP2TMnH34n8itmoOuE3rW/CYHAZtuXE
 VBD0VecqhCdOQF5wSxBCidASD0sLOaqIKU61Y/i0iQnV13imP6MUQ4gjskunyxnbzXf/Z1
 z9yfJsXeAO2Ibj+jQks0n1mjuWfITXQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-2qQRTfYTN0mHD8Pfxw2ZVQ-1; Thu, 03 Feb 2022 09:15:56 -0500
X-MC-Unique: 2qQRTfYTN0mHD8Pfxw2ZVQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A178D193F578
 for <qemu-devel@nongnu.org>; Thu,  3 Feb 2022 14:15:55 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.193.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4CFEC108647C;
 Thu,  3 Feb 2022 14:15:53 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/7] tests/qtest: failover: migration abort test with failover
 off
Date: Thu,  3 Feb 2022 15:15:37 +0100
Message-Id: <20220203141537.972317-8-lvivier@redhat.com>
In-Reply-To: <20220203141537.972317-1-lvivier@redhat.com>
References: <20220203141537.972317-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Test abort during active migration when failover is disabled from QEMU
or from guest side.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 tests/qtest/virtio-net-failover.c | 180 ++++++++++++++++++++++++++++++
 1 file changed, 180 insertions(+)

diff --git a/tests/qtest/virtio-net-failover.c b/tests/qtest/virtio-net-failover.c
index 54a0a0324192..80292eecf65f 100644
--- a/tests/qtest/virtio-net-failover.c
+++ b/tests/qtest/virtio-net-failover.c
@@ -1082,6 +1082,97 @@ static void test_guest_off_migrate_in(gconstpointer opaque)
     machine_stop(qts);
 }
 
+static void test_migrate_guest_off_abort(gconstpointer opaque)
+{
+    QTestState *qts;
+    QDict *resp, *args, *ret;
+    g_autofree gchar *uri = g_strdup_printf("exec: cat > %s", (gchar *)opaque);
+    const gchar *status;
+    QVirtioPCIDevice *vdev;
+    uint64_t features;
+
+    qts = machine_start(BASE_MACHINE
+                     "-netdev user,id=hs0 "
+                     "-netdev user,id=hs1 ",
+                     2);
+
+    check_one_card(qts, false, "standby0", MAC_STANDBY0);
+    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
+
+    qtest_qmp_device_add(qts, "virtio-net", "standby0",
+                         "{'bus': 'root0',"
+                         "'failover': 'on',"
+                         "'netdev': 'hs0',"
+                         "'mac': '"MAC_STANDBY0"'}");
+
+    check_one_card(qts, true, "standby0", MAC_STANDBY0);
+    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
+
+    qtest_qmp_device_add(qts, "virtio-net", "primary0",
+                         "{'bus': 'root1',"
+                         "'failover_pair_id': 'standby0',"
+                         "'netdev': 'hs1',"
+                         "'rombar': 0,"
+                         "'romfile': '',"
+                         "'mac': '"MAC_PRIMARY0"'}");
+
+    check_one_card(qts, true, "standby0", MAC_STANDBY0);
+    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
+
+    features = ~(QVIRTIO_F_BAD_FEATURE |
+                 (1ull << VIRTIO_RING_F_INDIRECT_DESC) |
+                 (1ull << VIRTIO_RING_F_EVENT_IDX) |
+                 (1ull << VIRTIO_NET_F_STANDBY));
+
+    vdev = start_virtio_net_internal(qts, 1, 0, &features);
+
+    check_one_card(qts, true, "standby0", MAC_STANDBY0);
+    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
+
+    args = qdict_from_jsonf_nofail("{}");
+    g_assert_nonnull(args);
+    qdict_put_str(args, "uri", uri);
+
+    resp = qtest_qmp(qts, "{ 'execute': 'migrate', 'arguments': %p}", args);
+    g_assert(qdict_haskey(resp, "return"));
+    qobject_unref(resp);
+
+    while (true) {
+        ret = migrate_status(qts);
+
+        status = qdict_get_str(ret, "status");
+        if (strcmp(status, "active") == 0) {
+            qobject_unref(ret);
+            break;
+        }
+        g_assert_cmpstr(status, !=, "failed");
+        qobject_unref(ret);
+    }
+
+    resp = qtest_qmp(qts, "{ 'execute': 'migrate_cancel' }");
+    g_assert(qdict_haskey(resp, "return"));
+    qobject_unref(resp);
+
+    while (true) {
+        ret = migrate_status(qts);
+
+        status = qdict_get_str(ret, "status");
+        if (strcmp(status, "cancelled") == 0) {
+            qobject_unref(ret);
+            break;
+        }
+        g_assert_cmpstr(status, !=, "failed");
+        g_assert_cmpstr(status, !=, "active");
+        qobject_unref(ret);
+    }
+
+    check_one_card(qts, true, "standby0", MAC_STANDBY0);
+    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
+
+    qos_object_destroy((QOSGraphObject *)vdev);
+    machine_stop(qts);
+}
+
 static void test_migrate_abort_wait_unplug(gconstpointer opaque)
 {
     QTestState *qts;
@@ -1265,6 +1356,91 @@ static void test_migrate_abort_active(gconstpointer opaque)
     machine_stop(qts);
 }
 
+static void test_migrate_off_abort(gconstpointer opaque)
+{
+    QTestState *qts;
+    QDict *resp, *args, *ret;
+    g_autofree gchar *uri = g_strdup_printf("exec: cat > %s", (gchar *)opaque);
+    const gchar *status;
+    QVirtioPCIDevice *vdev;
+
+    qts = machine_start(BASE_MACHINE
+                     "-netdev user,id=hs0 "
+                     "-netdev user,id=hs1 ",
+                     2);
+
+    check_one_card(qts, false, "standby0", MAC_STANDBY0);
+    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
+
+    qtest_qmp_device_add(qts, "virtio-net", "standby0",
+                         "{'bus': 'root0',"
+                         "'failover': 'off',"
+                         "'netdev': 'hs0',"
+                         "'mac': '"MAC_STANDBY0"'}");
+
+    check_one_card(qts, true, "standby0", MAC_STANDBY0);
+    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
+
+    vdev = start_virtio_net(qts, 1, 0, "standby0", false);
+
+    check_one_card(qts, true, "standby0", MAC_STANDBY0);
+    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
+
+    qtest_qmp_device_add(qts, "virtio-net", "primary0",
+                         "{'bus': 'root1',"
+                         "'failover_pair_id': 'standby0',"
+                         "'netdev': 'hs1',"
+                         "'rombar': 0,"
+                         "'romfile': '',"
+                         "'mac': '"MAC_PRIMARY0"'}");
+
+    check_one_card(qts, true, "standby0", MAC_STANDBY0);
+    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
+
+    args = qdict_from_jsonf_nofail("{}");
+    g_assert_nonnull(args);
+    qdict_put_str(args, "uri", uri);
+
+    resp = qtest_qmp(qts, "{ 'execute': 'migrate', 'arguments': %p}", args);
+    g_assert(qdict_haskey(resp, "return"));
+    qobject_unref(resp);
+
+    while (true) {
+        ret = migrate_status(qts);
+
+        status = qdict_get_str(ret, "status");
+        if (strcmp(status, "active") == 0) {
+            qobject_unref(ret);
+            break;
+        }
+        g_assert_cmpstr(status, !=, "failed");
+        qobject_unref(ret);
+    }
+
+    resp = qtest_qmp(qts, "{ 'execute': 'migrate_cancel' }");
+    g_assert(qdict_haskey(resp, "return"));
+    qobject_unref(resp);
+
+    while (true) {
+        ret = migrate_status(qts);
+
+        status = qdict_get_str(ret, "status");
+        if (strcmp(status, "cancelled") == 0) {
+            qobject_unref(ret);
+            break;
+        }
+        g_assert_cmpstr(status, !=, "failed");
+        g_assert_cmpstr(status, !=, "active");
+        qobject_unref(ret);
+    }
+
+    check_one_card(qts, true, "standby0", MAC_STANDBY0);
+    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
+
+    qos_object_destroy((QOSGraphObject *)vdev);
+    machine_stop(qts);
+}
+
 static void test_migrate_abort_timeout(gconstpointer opaque)
 {
     QTestState *qts;
@@ -1669,10 +1845,14 @@ int main(int argc, char **argv)
                         test_off_migrate_out);
     qtest_add_data_func("failover-virtio-net/migrate/off/in", tmpfile,
                         test_off_migrate_in);
+    qtest_add_data_func("failover-virtio-net/migrate/off/abort", tmpfile,
+                        test_migrate_off_abort);
     qtest_add_data_func("failover-virtio-net/migrate/guest_off/out", tmpfile,
                         test_guest_off_migrate_out);
     qtest_add_data_func("failover-virtio-net/migrate/guest_off/in", tmpfile,
                         test_guest_off_migrate_in);
+    qtest_add_data_func("failover-virtio-net/migrate/guest_off/abort", tmpfile,
+                        test_migrate_guest_off_abort);
     qtest_add_data_func("failover-virtio-net/migrate/abort/wait-unplug",
                         tmpfile, test_migrate_abort_wait_unplug);
     qtest_add_data_func("failover-virtio-net/migrate/abort/active", tmpfile,
-- 
2.34.1


