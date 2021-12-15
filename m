Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F3D4753E6
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 08:53:04 +0100 (CET)
Received: from localhost ([::1]:38642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxP5y-0001js-Nl
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 02:53:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxOnr-0002sy-0p
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 02:34:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxOno-0004Hm-Vb
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 02:34:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639553656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hDccuJRmOKS8XndqVAKyNP8D1hqIYNEqNT4cjM33gm8=;
 b=BRkF2ID7FDDXnlPaq0HsfXaOJCmsIqE4+he1SgmpS6d7vpnxxFV9p2hI10DTK3tdAPT5/t
 mkV1/hpA7CmSIXkEre6NxuBBLbmi6voTXEWwpyQlhv3V2E2PE7odlbEQvlJGjEpSvqN+br
 w5cLN9y0hh97uOmws0VG1O5J81kTq24=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-132-_olG6vhGMFyCGp4qrkR5cQ-1; Wed, 15 Dec 2021 02:34:13 -0500
X-MC-Unique: _olG6vhGMFyCGp4qrkR5cQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23AA02F43;
 Wed, 15 Dec 2021 07:34:12 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 572D01092790;
 Wed, 15 Dec 2021 07:34:11 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/16] tests/libqtest: add a migration test with two couples of
 failover devices
Date: Wed, 15 Dec 2021 08:33:50 +0100
Message-Id: <20211215073402.144286-5-thuth@redhat.com>
In-Reply-To: <20211215073402.144286-1-thuth@redhat.com>
References: <20211215073402.144286-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Acked-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20211208130350.10178-5-lvivier@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/virtio-net-failover.c | 282 ++++++++++++++++++++++++++++++
 1 file changed, 282 insertions(+)

diff --git a/tests/qtest/virtio-net-failover.c b/tests/qtest/virtio-net-failover.c
index e998a546b0..4b2ba8a106 100644
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
2.27.0


