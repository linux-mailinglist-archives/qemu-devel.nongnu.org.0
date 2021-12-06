Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A9646AB62
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 23:25:31 +0100 (CET)
Received: from localhost ([::1]:50702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muMQM-00085x-GM
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 17:25:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1muMMQ-0002RE-GF
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 17:21:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1muMMN-0002ly-NM
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 17:21:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638829282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NsEOaIaBJ4nOWP55lL1PQcqTyFBO5LNY06EH54sR9pI=;
 b=PDhfB8NyXCr7AT4PhpCf+dncoDrDScNFRLcGBnpYx7S7NCQNGr550Cv77ZIq7/kHNu0KgG
 qYOtWJT3MfrGRcVk6ztfmm+8MXu64av5Pk1FhwAXmZqomY+dykT2jgDNNfKRVQSTp3E8yI
 zfFqNDPEleB4off8Np7GYugswMSxuCs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-VqWZzx2hNdS4fAHijgSP3Q-1; Mon, 06 Dec 2021 17:21:20 -0500
X-MC-Unique: VqWZzx2hNdS4fAHijgSP3Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7BDD6408E
 for <qemu-devel@nongnu.org>; Mon,  6 Dec 2021 22:21:19 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6409F67842;
 Mon,  6 Dec 2021 22:21:18 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 5/6] test/libqtest: add some virtio-net failover migration
 cancelling tests
Date: Mon,  6 Dec 2021 23:20:39 +0100
Message-Id: <20211206222040.3872253-6-lvivier@redhat.com>
In-Reply-To: <20211206222040.3872253-1-lvivier@redhat.com>
References: <20211206222040.3872253-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Jens Freimann <jfreimann@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add some tests to check the state of the machine if the migration
is cancelled while we are using virtio-net failover.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 tests/qtest/virtio-net-failover.c | 291 ++++++++++++++++++++++++++++++
 1 file changed, 291 insertions(+)

diff --git a/tests/qtest/virtio-net-failover.c b/tests/qtest/virtio-net-failover.c
index c88f8ddec39a..57abb99e7f6e 100644
--- a/tests/qtest/virtio-net-failover.c
+++ b/tests/qtest/virtio-net-failover.c
@@ -682,6 +682,289 @@ static void test_migrate_in(gconstpointer opaque)
     machine_stop(qts);
 }
 
+static void test_migrate_abort_wait_unplug(gconstpointer opaque)
+{
+    QTestState *qts;
+    QDict *resp, *args, *data, *ret;
+    g_autofree gchar *uri = g_strdup_printf("exec: cat > %s", (gchar *)opaque);
+    const gchar *status;
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
+    start_virtio_net(qts, 1, 0, "standby0");
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
+    /* the event is sent whan QEMU asks the OS to unplug the card */
+    resp = qtest_qmp_eventwait_ref(qts, "UNPLUG_PRIMARY");
+    g_assert(qdict_haskey(resp, "data"));
+
+    data = qdict_get_qdict(resp, "data");
+    g_assert(qdict_haskey(data, "device-id"));
+    g_assert_cmpstr(qdict_get_str(data, "device-id"), ==, "primary0");
+
+    qobject_unref(resp);
+
+    resp = qtest_qmp(qts, "{ 'execute': 'migrate_cancel' }");
+    g_assert(qdict_haskey(resp, "return"));
+    qobject_unref(resp);
+
+    /* migration has been cancelled while the unplug was in progress */
+
+    /* while the card is not ejected, we must be in "cancelling" state */
+    ret = migrate_status(qts);
+
+    status = qdict_get_str(ret, "status");
+    g_assert_cmpstr(status, ==, "cancelling");
+    qobject_unref(ret);
+
+    /* OS unplugs the cards, QEMU can move from wait-unplug state */
+    qtest_outl(qts, ACPI_PCIHP_ADDR_ICH9 + PCI_EJ_BASE, 1);
+
+    while (true) {
+        ret = migrate_status(qts);
+
+        status = qdict_get_str(ret, "status");
+        if (strcmp(status, "cancelled") == 0) {
+            break;
+        }
+        g_assert_cmpstr(status, !=, "failed");
+        g_assert_cmpstr(status, !=, "active");
+        qobject_unref(ret);
+    }
+    qobject_unref(ret);
+
+    check_one_card(qts, true, "standby0", MAC_STANDBY0);
+    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
+
+    machine_stop(qts);
+}
+
+static void test_migrate_abort_active(gconstpointer opaque)
+{
+    QTestState *qts;
+    QDict *resp, *args, *data, *ret;
+    g_autofree gchar *uri = g_strdup_printf("exec: cat > %s", (gchar *)opaque);
+    const gchar *status;
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
+    start_virtio_net(qts, 1, 0, "standby0");
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
+    /* the event is sent whan QEMU asks the OS to unplug the card */
+    resp = qtest_qmp_eventwait_ref(qts, "UNPLUG_PRIMARY");
+    g_assert(qdict_haskey(resp, "data"));
+
+    data = qdict_get_qdict(resp, "data");
+    g_assert(qdict_haskey(data, "device-id"));
+    g_assert_cmpstr(qdict_get_str(data, "device-id"), ==, "primary0");
+
+    qobject_unref(resp);
+
+    /* OS unplugs the cards, QEMU can move from wait-unplug state */
+    qtest_outl(qts, ACPI_PCIHP_ADDR_ICH9 + PCI_EJ_BASE, 1);
+
+    while (true) {
+        ret = migrate_status(qts);
+
+        status = qdict_get_str(ret, "status");
+        if (strcmp(status, "wait-unplug") != 0) {
+            break;
+        }
+        g_assert_cmpstr(status, !=, "failed");
+        qobject_unref(ret);
+    }
+    qobject_unref(resp);
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
+            break;
+        }
+        g_assert_cmpstr(status, !=, "failed");
+        g_assert_cmpstr(status, !=, "active");
+        qobject_unref(ret);
+    }
+    qobject_unref(ret);
+
+    check_one_card(qts, true, "standby0", MAC_STANDBY0);
+    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
+
+    machine_stop(qts);
+}
+
+static void test_migrate_abort_timeout(gconstpointer opaque)
+{
+    QTestState *qts;
+    QDict *resp, *args, *data, *ret;
+    g_autofree gchar *uri = g_strdup_printf("exec: cat > %s", (gchar *)opaque);
+    const gchar *status;
+    int total;
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
+    start_virtio_net(qts, 1, 0, "standby0");
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
+    /* the event is sent whan QEMU asks the OS to unplug the card */
+    resp = qtest_qmp_eventwait_ref(qts, "UNPLUG_PRIMARY");
+    g_assert(qdict_haskey(resp, "data"));
+
+    data = qdict_get_qdict(resp, "data");
+    g_assert(qdict_haskey(data, "device-id"));
+    g_assert_cmpstr(qdict_get_str(data, "device-id"), ==, "primary0");
+
+    qobject_unref(resp);
+
+    resp = qtest_qmp(qts, "{ 'execute': 'migrate_cancel' }");
+    g_assert(qdict_haskey(resp, "return"));
+    qobject_unref(resp);
+
+    /* migration has been cancelled while the unplug was in progress */
+
+    /* while the card is not ejected, we must be in "cancelling" state */
+
+    total = 0;
+    while (true) {
+        ret = migrate_status(qts);
+
+        status = qdict_get_str(ret, "status");
+        if (strcmp(status, "cancelled") == 0) {
+            break;
+        }
+        g_assert_cmpstr(status, ==, "cancelling");
+        g_assert(qdict_haskey(ret, "total-time"));
+        total = qdict_get_int(ret, "total-time");
+        qobject_unref(ret);
+    }
+    qobject_unref(ret);
+
+    /*
+     * migration timeout in this case is 30 seconds
+     * check we exit on the timeout (ms)
+     */
+    g_assert_cmpint(total, >, 30000);
+
+    check_one_card(qts, true, "standby0", MAC_STANDBY0);
+    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
+
+    machine_stop(qts);
+}
+
 int main(int argc, char **argv)
 {
     gchar *tmpfile = g_strdup_printf("/tmp/failover_test_migrate-%u-%u",
@@ -714,6 +997,14 @@ int main(int argc, char **argv)
                         test_migrate_out);
     qtest_add_data_func("failover-virtio-net/migrate/in", tmpfile,
                         test_migrate_in);
+    qtest_add_data_func("failover-virtio-net/migrate/abort/wait-unplug",
+                        tmpfile, test_migrate_abort_wait_unplug);
+    qtest_add_data_func("failover-virtio-net/migrate/abort/active", tmpfile,
+                        test_migrate_abort_active);
+    if (g_test_slow()) {
+        qtest_add_data_func("failover-virtio-net/migrate/abort/timeout",
+                            tmpfile, test_migrate_abort_timeout);
+    }
 
     ret = g_test_run();
 
-- 
2.33.1


