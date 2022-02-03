Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F3F4A862F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 15:29:15 +0100 (CET)
Received: from localhost ([::1]:33514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFd6o-0001zE-NM
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 09:29:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1nFcvK-0005ND-9P
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 09:17:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1nFcv8-0006AA-QQ
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 09:17:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643897750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AoTyF1P1D4W5b4czTqtGncbS9M62aDlJP7cbGNaHPfI=;
 b=PZWfnbr11iC2xuD8Om6o40LHH9bjFwmHlrVFBiqmbRNBFlnG+PDhBKTvvKBlV5XKNvuhoH
 Q96M3ASXiFb/xnXY1/fAwy+ystq6RQoJN3UqaF3QhLWCHrJmrx+7ISi1/ILlCNef5apsFf
 p2+p529TG9/rWW1B5haS7g2qZjCCrmI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-s8PZYk3RPpi-a9qiHl8jWw-1; Thu, 03 Feb 2022 09:15:48 -0500
X-MC-Unique: s8PZYk3RPpi-a9qiHl8jWw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E826484DA42
 for <qemu-devel@nongnu.org>; Thu,  3 Feb 2022 14:15:47 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.193.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A187108647C;
 Thu,  3 Feb 2022 14:15:46 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/7] tests/qtest: failover: check the feature is correctly
 provided
Date: Thu,  3 Feb 2022 15:15:33 +0100
Message-Id: <20220203141537.972317-4-lvivier@redhat.com>
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

Check QEMU provides the VIRTIO_NET_F_STANDBY if failover is on,
and doesn't if failover is off

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 tests/qtest/virtio-net-failover.c | 139 ++++++++++++++++++------------
 1 file changed, 86 insertions(+), 53 deletions(-)

diff --git a/tests/qtest/virtio-net-failover.c b/tests/qtest/virtio-net-failover.c
index 070e53de1292..42367963685c 100644
--- a/tests/qtest/virtio-net-failover.c
+++ b/tests/qtest/virtio-net-failover.c
@@ -18,6 +18,8 @@
 #include "libqos/virtio-pci.h"
 #include "hw/pci/pci.h"
 
+#define VIRTIO_NET_F_STANDBY    62
+
 #define ACPI_PCIHP_ADDR_ICH9    0x0cc0
 #define PCI_EJ_BASE             0x0008
 #define PCI_SEL_BASE            0x0010
@@ -246,6 +248,65 @@ do {                                                            \
     qobject_unref(bus);                                         \
 } while (0)
 
+static QDict *get_failover_negociated_event(QTestState *qts)
+{
+    QDict *resp;
+    QDict *data;
+
+    resp = qtest_qmp_eventwait_ref(qts, "FAILOVER_NEGOTIATED");
+    g_assert(qdict_haskey(resp, "data"));
+
+    data = qdict_get_qdict(resp, "data");
+    g_assert(qdict_haskey(data, "device-id"));
+    qobject_ref(data);
+    qobject_unref(resp);
+
+    return data;
+}
+
+static QVirtioPCIDevice *start_virtio_net_internal(QTestState *qts,
+                                                   int bus, int slot,
+                                                   uint64_t *features)
+{
+    QVirtioPCIDevice *dev;
+    QPCIAddress addr;
+
+    addr.devfn = QPCI_DEVFN((bus << 5) + slot, 0);
+    dev = virtio_pci_new(pcibus, &addr);
+    g_assert_nonnull(dev);
+    qvirtio_pci_device_enable(dev);
+    qvirtio_start_device(&dev->vdev);
+    *features &= qvirtio_get_features(&dev->vdev);
+    qvirtio_set_features(&dev->vdev, *features);
+    qvirtio_set_driver_ok(&dev->vdev);
+    return dev;
+}
+
+static QVirtioPCIDevice *start_virtio_net(QTestState *qts, int bus, int slot,
+                                          const char *id, bool failover)
+{
+    QVirtioPCIDevice *dev;
+    uint64_t features;
+
+    features = ~(QVIRTIO_F_BAD_FEATURE |
+                 (1ull << VIRTIO_RING_F_INDIRECT_DESC) |
+                 (1ull << VIRTIO_RING_F_EVENT_IDX));
+
+    dev = start_virtio_net_internal(qts, bus, slot, &features);
+
+    g_assert(!!(features & (1ull << VIRTIO_NET_F_STANDBY)) == failover);
+
+    if (failover) {
+        QDict *resp;
+
+        resp = get_failover_negociated_event(qts);
+        g_assert_cmpstr(qdict_get_str(resp, "device-id"), ==, id);
+        qobject_unref(resp);
+    }
+
+    return dev;
+}
+
 static void test_on(void)
 {
     QTestState *qts;
@@ -254,6 +315,7 @@ static void test_on(void)
                         "-netdev user,id=hs0 "
                         "-device virtio-net,bus=root0,id=standby0,"
                         "failover=on,netdev=hs0,mac="MAC_STANDBY0" "
+                        "-netdev user,id=hs1 "
                         "-device virtio-net,bus=root1,id=primary0,"
                         "failover_pair_id=standby0,netdev=hs1,mac="MAC_PRIMARY0,
                         2);
@@ -267,6 +329,7 @@ static void test_on(void)
 static void test_on_mismatch(void)
 {
     QTestState *qts;
+    QVirtioPCIDevice *vdev;
 
     qts = machine_start(BASE_MACHINE
                      "-netdev user,id=hs0 "
@@ -280,12 +343,19 @@ static void test_on_mismatch(void)
     check_one_card(qts, true, "standby0", MAC_STANDBY0);
     check_one_card(qts, true, "primary0", MAC_PRIMARY0);
 
+    vdev = start_virtio_net(qts, 1, 0, "standby0", true);
+
+    check_one_card(qts, true, "standby0", MAC_STANDBY0);
+    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
+
+    qos_object_destroy((QOSGraphObject *)vdev);
     machine_stop(qts);
 }
 
 static void test_off(void)
 {
     QTestState *qts;
+    QVirtioPCIDevice *vdev;
 
     qts = machine_start(BASE_MACHINE
                      "-netdev user,id=hs0 "
@@ -299,50 +369,13 @@ static void test_off(void)
     check_one_card(qts, true, "standby0", MAC_STANDBY0);
     check_one_card(qts, true, "primary0", MAC_PRIMARY0);
 
-    machine_stop(qts);
-}
+    vdev = start_virtio_net(qts, 1, 0, "standby0", false);
 
-static QDict *get_failover_negociated_event(QTestState *qts)
-{
-    QDict *resp;
-    QDict *data;
-
-    resp = qtest_qmp_eventwait_ref(qts, "FAILOVER_NEGOTIATED");
-    g_assert(qdict_haskey(resp, "data"));
-
-    data = qdict_get_qdict(resp, "data");
-    g_assert(qdict_haskey(data, "device-id"));
-    qobject_ref(data);
-    qobject_unref(resp);
-
-    return data;
-}
-
-static QVirtioPCIDevice *start_virtio_net(QTestState *qts, int bus, int slot,
-                             const char *id)
-{
-    QVirtioPCIDevice *dev;
-    uint64_t features;
-    QPCIAddress addr;
-    QDict *resp;
-
-    addr.devfn = QPCI_DEVFN((bus << 5) + slot, 0);
-    dev = virtio_pci_new(pcibus, &addr);
-    g_assert_nonnull(dev);
-    qvirtio_pci_device_enable(dev);
-    qvirtio_start_device(&dev->vdev);
-    features = qvirtio_get_features(&dev->vdev);
-    features = features & ~(QVIRTIO_F_BAD_FEATURE |
-                            (1ull << VIRTIO_RING_F_INDIRECT_DESC) |
-                            (1ull << VIRTIO_RING_F_EVENT_IDX));
-    qvirtio_set_features(&dev->vdev, features);
-    qvirtio_set_driver_ok(&dev->vdev);
-
-    resp = get_failover_negociated_event(qts);
-    g_assert_cmpstr(qdict_get_str(resp, "device-id"), ==, id);
-    qobject_unref(resp);
+    check_one_card(qts, true, "standby0", MAC_STANDBY0);
+    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
 
-    return dev;
+    qos_object_destroy((QOSGraphObject *)vdev);
+    machine_stop(qts);
 }
 
 static void test_enabled(void)
@@ -362,7 +395,7 @@ static void test_enabled(void)
     check_one_card(qts, true, "standby0", MAC_STANDBY0);
     check_one_card(qts, false, "primary0", MAC_PRIMARY0);
 
-    vdev = start_virtio_net(qts, 1, 0, "standby0");
+    vdev = start_virtio_net(qts, 1, 0, "standby0", true);
 
     check_one_card(qts, true, "standby0", MAC_STANDBY0);
     check_one_card(qts, true, "primary0", MAC_PRIMARY0);
@@ -385,7 +418,7 @@ static void test_hotplug_1(void)
     check_one_card(qts, true, "standby0", MAC_STANDBY0);
     check_one_card(qts, false, "primary0", MAC_PRIMARY0);
 
-    vdev = start_virtio_net(qts, 1, 0, "standby0");
+    vdev = start_virtio_net(qts, 1, 0, "standby0", true);
 
     check_one_card(qts, true, "standby0", MAC_STANDBY0);
     check_one_card(qts, false, "primary0", MAC_PRIMARY0);
@@ -427,7 +460,7 @@ static void test_hotplug_1_reverse(void)
     check_one_card(qts, true, "standby0", MAC_STANDBY0);
     check_one_card(qts, true, "primary0", MAC_PRIMARY0);
 
-    vdev = start_virtio_net(qts, 1, 0, "standby0");
+    vdev = start_virtio_net(qts, 1, 0, "standby0", true);
 
     check_one_card(qts, true, "standby0", MAC_STANDBY0);
     check_one_card(qts, true, "primary0", MAC_PRIMARY0);
@@ -458,7 +491,7 @@ static void test_hotplug_2(void)
     check_one_card(qts, true, "standby0", MAC_STANDBY0);
     check_one_card(qts, false, "primary0", MAC_PRIMARY0);
 
-    vdev = start_virtio_net(qts, 1, 0, "standby0");
+    vdev = start_virtio_net(qts, 1, 0, "standby0", true);
 
     check_one_card(qts, true, "standby0", MAC_STANDBY0);
     check_one_card(qts, false, "primary0", MAC_PRIMARY0);
@@ -514,7 +547,7 @@ static void test_hotplug_2_reverse(void)
     check_one_card(qts, true, "standby0", MAC_STANDBY0);
     check_one_card(qts, true, "primary0", MAC_PRIMARY0);
 
-    vdev = start_virtio_net(qts, 1, 0, "standby0");
+    vdev = start_virtio_net(qts, 1, 0, "standby0", true);
 
     check_one_card(qts, true, "standby0", MAC_STANDBY0);
     check_one_card(qts, true, "primary0", MAC_PRIMARY0);
@@ -579,7 +612,7 @@ static void test_migrate_out(gconstpointer opaque)
     check_one_card(qts, true, "standby0", MAC_STANDBY0);
     check_one_card(qts, false, "primary0", MAC_PRIMARY0);
 
-    vdev = start_virtio_net(qts, 1, 0, "standby0");
+    vdev = start_virtio_net(qts, 1, 0, "standby0", true);
 
     check_one_card(qts, true, "standby0", MAC_STANDBY0);
     check_one_card(qts, false, "primary0", MAC_PRIMARY0);
@@ -775,7 +808,7 @@ static void test_migrate_abort_wait_unplug(gconstpointer opaque)
     check_one_card(qts, true, "standby0", MAC_STANDBY0);
     check_one_card(qts, false, "primary0", MAC_PRIMARY0);
 
-    vdev = start_virtio_net(qts, 1, 0, "standby0");
+    vdev = start_virtio_net(qts, 1, 0, "standby0", true);
 
     check_one_card(qts, true, "standby0", MAC_STANDBY0);
     check_one_card(qts, false, "primary0", MAC_PRIMARY0);
@@ -865,7 +898,7 @@ static void test_migrate_abort_active(gconstpointer opaque)
     check_one_card(qts, true, "standby0", MAC_STANDBY0);
     check_one_card(qts, false, "primary0", MAC_PRIMARY0);
 
-    vdev = start_virtio_net(qts, 1, 0, "standby0");
+    vdev = start_virtio_net(qts, 1, 0, "standby0", true);
 
     check_one_card(qts, true, "standby0", MAC_STANDBY0);
     check_one_card(qts, false, "primary0", MAC_PRIMARY0);
@@ -959,7 +992,7 @@ static void test_migrate_abort_timeout(gconstpointer opaque)
     check_one_card(qts, true, "standby0", MAC_STANDBY0);
     check_one_card(qts, false, "primary0", MAC_PRIMARY0);
 
-    vdev = start_virtio_net(qts, 1, 0, "standby0");
+    vdev = start_virtio_net(qts, 1, 0, "standby0", true);
 
     check_one_card(qts, true, "standby0", MAC_STANDBY0);
     check_one_card(qts, false, "primary0", MAC_PRIMARY0);
@@ -1070,7 +1103,7 @@ static void test_multi_out(gconstpointer opaque)
     check_one_card(qts, false, "standby1", MAC_STANDBY1);
     check_one_card(qts, false, "primary1", MAC_PRIMARY1);
 
-    vdev0 = start_virtio_net(qts, 1, 0, "standby0");
+    vdev0 = start_virtio_net(qts, 1, 0, "standby0", true);
 
     check_one_card(qts, true, "standby0", MAC_STANDBY0);
     check_one_card(qts, true, "primary0", MAC_PRIMARY0);
@@ -1101,7 +1134,7 @@ static void test_multi_out(gconstpointer opaque)
     check_one_card(qts, true, "standby1", MAC_STANDBY1);
     check_one_card(qts, false, "primary1", MAC_PRIMARY1);
 
-    vdev1 = start_virtio_net(qts, 3, 0, "standby1");
+    vdev1 = start_virtio_net(qts, 3, 0, "standby1", true);
 
     check_one_card(qts, true, "standby0", MAC_STANDBY0);
     check_one_card(qts, true, "primary0", MAC_PRIMARY0);
-- 
2.34.1


