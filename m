Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BE64BD9AB
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 13:29:10 +0100 (CET)
Received: from localhost ([::1]:54454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM7oT-0003cv-Ks
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 07:29:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nM7O0-0003wM-HC
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:01:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nM7Ny-0000sJ-LX
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:01:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645444904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W52uQ+9CMKaRb5Sd1RhbZAT4Z21h4CTZcfBSHccg4p0=;
 b=TWaTEAuXlKs4xYZxVIXk47W7G7IAFtyX8TFxdSiiiD3as/2byWqXa84cJ/SX4hf8IeUI6Z
 jsYO84ZXpCowaJ9bhnFjadth5uG/+AAQBai1eQNRSPX826d/sK7ELKtGhFX2L68z4XPSxE
 uLk/OUFYL1fRPiufZ/eyvhYgswET1cw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-bp-LfozyPHiIVP_rXFsDzA-1; Mon, 21 Feb 2022 07:01:43 -0500
X-MC-Unique: bp-LfozyPHiIVP_rXFsDzA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F370814246;
 Mon, 21 Feb 2022 12:01:42 +0000 (UTC)
Received: from thuth.com (unknown [10.39.195.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73F7E73162;
 Mon, 21 Feb 2022 12:01:41 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/25] tests/qtest: failover: test migration if the guest
 doesn't support failover
Date: Mon, 21 Feb 2022 12:59:54 +0100
Message-Id: <20220221120008.600114-12-thuth@redhat.com>
In-Reply-To: <20220221120008.600114-1-thuth@redhat.com>
References: <20220221120008.600114-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

The primary device is not plugged and the migration is done only with
the standby device

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Message-Id: <20220203141537.972317-7-lvivier@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/virtio-net-failover.c | 142 ++++++++++++++++++++++++++++++
 1 file changed, 142 insertions(+)

diff --git a/tests/qtest/virtio-net-failover.c b/tests/qtest/virtio-net-failover.c
index c99599bdcc..54a0a03241 100644
--- a/tests/qtest/virtio-net-failover.c
+++ b/tests/qtest/virtio-net-failover.c
@@ -944,6 +944,144 @@ static void test_off_migrate_in(gconstpointer opaque)
     machine_stop(qts);
 }
 
+static void test_guest_off_migrate_out(gconstpointer opaque)
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
+    check_one_card(qts, true, "standby0", MAC_STANDBY0);
+    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
+
+    qos_object_destroy((QOSGraphObject *)vdev);
+    machine_stop(qts);
+}
+
+static void test_guest_off_migrate_in(gconstpointer opaque)
+{
+    QTestState *qts;
+    QDict *resp, *args, *ret;
+    g_autofree gchar *uri = g_strdup_printf("exec: cat %s", (gchar *)opaque);
+
+    qts = machine_start(BASE_MACHINE
+                     "-netdev user,id=hs0 "
+                     "-netdev user,id=hs1 "
+                     "-incoming defer ",
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
+    check_one_card(qts, true, "standby0", MAC_STANDBY0);
+    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
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
 static void test_migrate_abort_wait_unplug(gconstpointer opaque)
 {
     QTestState *qts;
@@ -1531,6 +1669,10 @@ int main(int argc, char **argv)
                         test_off_migrate_out);
     qtest_add_data_func("failover-virtio-net/migrate/off/in", tmpfile,
                         test_off_migrate_in);
+    qtest_add_data_func("failover-virtio-net/migrate/guest_off/out", tmpfile,
+                        test_guest_off_migrate_out);
+    qtest_add_data_func("failover-virtio-net/migrate/guest_off/in", tmpfile,
+                        test_guest_off_migrate_in);
     qtest_add_data_func("failover-virtio-net/migrate/abort/wait-unplug",
                         tmpfile, test_migrate_abort_wait_unplug);
     qtest_add_data_func("failover-virtio-net/migrate/abort/active", tmpfile,
-- 
2.27.0


