Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7AF46D420
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 14:09:54 +0100 (CET)
Received: from localhost ([::1]:54732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muwhk-0008FR-QK
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 08:09:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1muwco-0005hv-Ag
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 08:04:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1muwcl-0001Fp-GX
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 08:04:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638968683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jzk2l9mBPoZ7WpzhCBuUOoGoDQ4CLeRbxqemPkkxFzM=;
 b=DtrHJJE9MF8p2DE4k6ySKzGupdUYX4fS35yv9KYgH0yqRr2gzyYMR/qZu9UMosVcUmC0+2
 Z88cKEpM0W99sMyFHtfG4zUTI1gutsuNMrSP+1LuCsJenaqDTwu+uhlWNlhndfnzNf4FxN
 886mJZezZzYYsXOUgQd82zygdcK6W/k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-349-cJTH9JQNMXacBli-hS-9ZQ-1; Wed, 08 Dec 2021 08:04:41 -0500
X-MC-Unique: cJTH9JQNMXacBli-hS-9ZQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F40D61023F50
 for <qemu-devel@nongnu.org>; Wed,  8 Dec 2021 13:04:40 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F61D60C4A;
 Wed,  8 Dec 2021 13:04:39 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 4/4] tests/libqtest: add a migration test with two couples
 of failover devices
Date: Wed,  8 Dec 2021 14:03:50 +0100
Message-Id: <20211208130350.10178-5-lvivier@redhat.com>
In-Reply-To: <20211208130350.10178-1-lvivier@redhat.com>
References: <20211208130350.10178-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Acked-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/virtio-net-failover.c | 282 ++++++++++++++++++++++++++++++
 1 file changed, 282 insertions(+)

diff --git a/tests/qtest/virtio-net-failover.c b/tests/qtest/virtio-net-failover.c
index e998a546b031..4b2ba8a106b1 100644
--- a/tests/qtest/virtio-net-failover.c
+++ b/tests/qtest/virtio-net-failover.c
@@ -20,6 +20,7 @@
 
 #define ACPI_PCIHP_ADDR_ICH9    0x0cc0
 #define PCI_EJ_BASE             0x0008
+#define PCI_SEL_BASE            0x0010
 
 #define BASE_MACHINE "-M q35 -nodefaults " \
     "-device pcie-root-port,id=root0,addr=0x1,bus=pcie.0,chassis=1 " \
@@ -27,6 +28,8 @@
 
 #define MAC_PRIMARY0 "52:54:00:11:11:11"
 #define MAC_STANDBY0 "52:54:00:22:22:22"
+#define MAC_PRIMARY1 "52:54:00:33:33:33"
+#define MAC_STANDBY1 "52:54:00:44:44:44"
 
 static QGuestAllocator guest_malloc;
 static QPCIBus *pcibus;
@@ -1026,6 +1029,281 @@ static void test_migrate_abort_timeout(gconstpointer opaque)
     machine_stop(qts);
 }
 
+static void test_multi_out(gconstpointer opaque)
+{
+    QTestState *qts;
+    QDict *resp, *args, *ret;
+    g_autofree gchar *uri = g_strdup_printf("exec: cat > %s", (gchar *)opaque);
+    const gchar *status, *expected;
+    QVirtioPCIDevice *vdev0, *vdev1;
+
+    qts = machine_start(BASE_MACHINE
+                "-device pcie-root-port,id=root2,addr=0x3,bus=pcie.0,chassis=3 "
+                "-device pcie-root-port,id=root3,addr=0x4,bus=pcie.0,chassis=4 "
+                "-netdev user,id=hs0 "
+                "-netdev user,id=hs1 "
+                "-netdev user,id=hs2 "
+                "-netdev user,id=hs3 ",
+                4);
+
+    check_one_card(qts, false, "standby0", MAC_STANDBY0);
+    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
+    check_one_card(qts, false, "standby1", MAC_STANDBY1);
+    check_one_card(qts, false, "primary1", MAC_PRIMARY1);
+
+    qtest_qmp_device_add(qts, "virtio-net", "standby0",
+                         "{'bus': 'root0',"
+                         "'failover': 'on',"
+                         "'netdev': 'hs0',"
+                         "'mac': '"MAC_STANDBY0"'}");
+
+    check_one_card(qts, true, "standby0", MAC_STANDBY0);
+    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
+    check_one_card(qts, false, "standby1", MAC_STANDBY1);
+    check_one_card(qts, false, "primary1", MAC_PRIMARY1);
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
+    check_one_card(qts, false, "standby1", MAC_STANDBY1);
+    check_one_card(qts, false, "primary1", MAC_PRIMARY1);
+
+    vdev0 = start_virtio_net(qts, 1, 0, "standby0");
+
+    check_one_card(qts, true, "standby0", MAC_STANDBY0);
+    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
+    check_one_card(qts, false, "standby1", MAC_STANDBY1);
+    check_one_card(qts, false, "primary1", MAC_PRIMARY1);
+
+    qtest_qmp_device_add(qts, "virtio-net", "standby1",
+                         "{'bus': 'root2',"
+                         "'failover': 'on',"
+                         "'netdev': 'hs2',"
+                         "'mac': '"MAC_STANDBY1"'}");
+
+    check_one_card(qts, true, "standby0", MAC_STANDBY0);
+    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
+    check_one_card(qts, true, "standby1", MAC_STANDBY1);
+    check_one_card(qts, false, "primary1", MAC_PRIMARY1);
+
+    qtest_qmp_device_add(qts, "virtio-net", "primary1",
+                         "{'bus': 'root3',"
+                         "'failover_pair_id': 'standby1',"
+                         "'netdev': 'hs3',"
+                         "'rombar': 0,"
+                         "'romfile': '',"
+                         "'mac': '"MAC_PRIMARY1"'}");
+
+    check_one_card(qts, true, "standby0", MAC_STANDBY0);
+    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
+    check_one_card(qts, true, "standby1", MAC_STANDBY1);
+    check_one_card(qts, false, "primary1", MAC_PRIMARY1);
+
+    vdev1 = start_virtio_net(qts, 3, 0, "standby1");
+
+    check_one_card(qts, true, "standby0", MAC_STANDBY0);
+    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
+    check_one_card(qts, true, "standby1", MAC_STANDBY1);
+    check_one_card(qts, true, "primary1", MAC_PRIMARY1);
+
+    args = qdict_from_jsonf_nofail("{}");
+    g_assert_nonnull(args);
+    qdict_put_str(args, "uri", uri);
+
+    resp = qtest_qmp(qts, "{ 'execute': 'migrate', 'arguments': %p}", args);
+    g_assert(qdict_haskey(resp, "return"));
+    qobject_unref(resp);
+
+    /* the event is sent when QEMU asks the OS to unplug the card */
+    resp = get_unplug_primary_event(qts);
+    if (strcmp(qdict_get_str(resp, "device-id"), "primary0") == 0) {
+        expected = "primary1";
+    } else if (strcmp(qdict_get_str(resp, "device-id"), "primary1") == 0) {
+        expected = "primary0";
+    } else {
+        g_assert_not_reached();
+    }
+    qobject_unref(resp);
+
+    resp = get_unplug_primary_event(qts);
+    g_assert_cmpstr(qdict_get_str(resp, "device-id"), ==, expected);
+    qobject_unref(resp);
+
+    /* wait the end of the migration setup phase */
+    while (true) {
+        ret = migrate_status(qts);
+
+        status = qdict_get_str(ret, "status");
+        if (strcmp(status, "wait-unplug") == 0) {
+            qobject_unref(ret);
+            break;
+        }
+
+        /* The migration must not start if the card is not ejected */
+        g_assert_cmpstr(status, !=, "active");
+        g_assert_cmpstr(status, !=, "completed");
+        g_assert_cmpstr(status, !=, "failed");
+        g_assert_cmpstr(status, !=, "cancelling");
+        g_assert_cmpstr(status, !=, "cancelled");
+
+        qobject_unref(ret);
+    }
+
+    /* OS unplugs primary1, but we must wait the second */
+    qtest_outl(qts, ACPI_PCIHP_ADDR_ICH9 + PCI_EJ_BASE, 1);
+
+    ret = migrate_status(qts);
+    status = qdict_get_str(ret, "status");
+    g_assert_cmpstr(status, ==, "wait-unplug");
+    qobject_unref(ret);
+
+    if (g_test_slow()) {
+        /* check we stay in wait-unplug while the card is not ejected */
+        for (int i = 0; i < 5; i++) {
+            sleep(1);
+            ret = migrate_status(qts);
+            status = qdict_get_str(ret, "status");
+            g_assert_cmpstr(status, ==, "wait-unplug");
+            qobject_unref(ret);
+        }
+    }
+
+    /* OS unplugs primary0, QEMU can move from wait-unplug state */
+    qtest_outl(qts, ACPI_PCIHP_ADDR_ICH9 + PCI_SEL_BASE, 2);
+    qtest_outl(qts, ACPI_PCIHP_ADDR_ICH9 + PCI_EJ_BASE, 1);
+
+    while (true) {
+        ret = migrate_status(qts);
+
+        status = qdict_get_str(ret, "status");
+        if (strcmp(status, "completed") == 0) {
+            qobject_unref(ret);
+            break;
+        }
+        g_assert_cmpstr(status, !=, "failed");
+        g_assert_cmpstr(status, !=, "cancelling");
+        g_assert_cmpstr(status, !=, "cancelled");
+        qobject_unref(ret);
+    }
+
+    qtest_qmp_eventwait(qts, "STOP");
+
+    qos_object_destroy((QOSGraphObject *)vdev0);
+    qos_object_destroy((QOSGraphObject *)vdev1);
+    machine_stop(qts);
+}
+
+static void test_multi_in(gconstpointer opaque)
+{
+    QTestState *qts;
+    QDict *resp, *args, *ret;
+    g_autofree gchar *uri = g_strdup_printf("exec: cat %s", (gchar *)opaque);
+
+    qts = machine_start(BASE_MACHINE
+                "-device pcie-root-port,id=root2,addr=0x3,bus=pcie.0,chassis=3 "
+                "-device pcie-root-port,id=root3,addr=0x4,bus=pcie.0,chassis=4 "
+                "-netdev user,id=hs0 "
+                "-netdev user,id=hs1 "
+                "-netdev user,id=hs2 "
+                "-netdev user,id=hs3 "
+                "-incoming defer ",
+                4);
+
+    check_one_card(qts, false, "standby0", MAC_STANDBY0);
+    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
+    check_one_card(qts, false, "standby1", MAC_STANDBY1);
+    check_one_card(qts, false, "primary1", MAC_PRIMARY1);
+
+    qtest_qmp_device_add(qts, "virtio-net", "standby0",
+                         "{'bus': 'root0',"
+                         "'failover': 'on',"
+                         "'netdev': 'hs0',"
+                         "'mac': '"MAC_STANDBY0"'}");
+
+    check_one_card(qts, true, "standby0", MAC_STANDBY0);
+    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
+    check_one_card(qts, false, "standby1", MAC_STANDBY1);
+    check_one_card(qts, false, "primary1", MAC_PRIMARY1);
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
+    check_one_card(qts, false, "standby1", MAC_STANDBY1);
+    check_one_card(qts, false, "primary1", MAC_PRIMARY1);
+
+    qtest_qmp_device_add(qts, "virtio-net", "standby1",
+                         "{'bus': 'root2',"
+                         "'failover': 'on',"
+                         "'netdev': 'hs2',"
+                         "'mac': '"MAC_STANDBY1"'}");
+
+    check_one_card(qts, true, "standby0", MAC_STANDBY0);
+    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
+    check_one_card(qts, true, "standby1", MAC_STANDBY1);
+    check_one_card(qts, false, "primary1", MAC_PRIMARY1);
+
+    qtest_qmp_device_add(qts, "virtio-net", "primary1",
+                         "{'bus': 'root3',"
+                         "'failover_pair_id': 'standby1',"
+                         "'netdev': 'hs3',"
+                         "'rombar': 0,"
+                         "'romfile': '',"
+                         "'mac': '"MAC_PRIMARY1"'}");
+
+    check_one_card(qts, true, "standby0", MAC_STANDBY0);
+    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
+    check_one_card(qts, true, "standby1", MAC_STANDBY1);
+    check_one_card(qts, false, "primary1", MAC_PRIMARY1);
+
+    args = qdict_from_jsonf_nofail("{}");
+    g_assert_nonnull(args);
+    qdict_put_str(args, "uri", uri);
+
+    resp = qtest_qmp(qts, "{ 'execute': 'migrate-incoming', 'arguments': %p}",
+                     args);
+    g_assert(qdict_haskey(resp, "return"));
+    qobject_unref(resp);
+
+    resp = get_migration_event(qts);
+    g_assert_cmpstr(qdict_get_str(resp, "status"), ==, "setup");
+    qobject_unref(resp);
+
+    resp = get_failover_negociated_event(qts);
+    g_assert_cmpstr(qdict_get_str(resp, "device-id"), ==, "standby0");
+    qobject_unref(resp);
+
+    resp = get_failover_negociated_event(qts);
+    g_assert_cmpstr(qdict_get_str(resp, "device-id"), ==, "standby1");
+    qobject_unref(resp);
+
+    check_one_card(qts, true, "standby0", MAC_STANDBY0);
+    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
+    check_one_card(qts, true, "standby1", MAC_STANDBY1);
+    check_one_card(qts, true, "primary1", MAC_PRIMARY1);
+
+    qtest_qmp_eventwait(qts, "RESUME");
+
+    ret = migrate_status(qts);
+    g_assert_cmpstr(qdict_get_str(ret, "status"), ==, "completed");
+    qobject_unref(ret);
+
+    machine_stop(qts);
+}
+
 int main(int argc, char **argv)
 {
     const gchar *tmpdir = g_get_tmp_dir();
@@ -1060,6 +1338,10 @@ int main(int argc, char **argv)
         qtest_add_data_func("failover-virtio-net/migrate/abort/timeout",
                             tmpfile, test_migrate_abort_timeout);
     }
+    qtest_add_data_func("failover-virtio-net/multi/out",
+                        tmpfile, test_multi_out);
+    qtest_add_data_func("failover-virtio-net/multi/in",
+                   tmpfile, test_multi_in);
 
     ret = g_test_run();
 
-- 
2.33.1


