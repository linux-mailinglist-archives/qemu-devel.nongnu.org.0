Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 382034D0946
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 22:20:23 +0100 (CET)
Received: from localhost ([::1]:47350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRKmE-0005cH-Bh
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 16:20:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nRKiv-0000KQ-6K
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 16:16:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nRKiq-0000aX-6F
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 16:16:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646687811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KCL4s1oWVVgFbaSzYuwDwQsNuFYm6/osfpXc/Qc+HkY=;
 b=agXMvomzCOLljm6dNo4Eul0kCy347IOg7eFDZYaE7lPOkA42JmjJpMfhgLKOtvsAfcTAIw
 BphcufdT1MvuqGrTN0xFq+T/aEAyeQ0PhFEec9XxA3rKH/QR51P1sSUs4JgoCfG8tTnql5
 UQuj0wudBACGs78RVK3BB8JOyWZr+/U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-8X7OzYSuMJqHE_NGPpKqjA-1; Mon, 07 Mar 2022 16:16:48 -0500
X-MC-Unique: 8X7OzYSuMJqHE_NGPpKqjA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1847C1006AA5;
 Mon,  7 Mar 2022 21:16:47 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DBEE02D1F1;
 Mon,  7 Mar 2022 21:16:20 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, pbonzini@redhat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
 david@gibson.dropbear.id.au, clg@kaod.org, eesposit@redhat.com,
 Coiby.Xu@gmail.com, stefanha@redhat.com
Subject: [PATCH v4 2/4] tests/qtest/libqos: Skip hotplug tests if pci root bus
 is not hotpluggable
Date: Mon,  7 Mar 2022 22:14:37 +0100
Message-Id: <20220307211439.213133-3-eric.auger@redhat.com>
In-Reply-To: <20220307211439.213133-1-eric.auger@redhat.com>
References: <20220307211439.213133-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: jean-philippe@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ARM does not not support hotplug on pcie.0. Add a flag on the bus
which tells if devices can be hotplugged and skip hotplug tests
if the bus cannot be hotplugged. This is a temporary solution to
enable the other pci tests on aarch64.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Acked-by: Thomas Huth <thuth@redhat.com>

---

v1 ->v2:
- reword g_test_skip msg into "pci bus does not support hotplug"
---
 tests/qtest/e1000e-test.c         |  6 ++++++
 tests/qtest/libqos/pci.h          |  1 +
 tests/qtest/vhost-user-blk-test.c | 10 ++++++++++
 tests/qtest/virtio-blk-test.c     |  5 +++++
 tests/qtest/virtio-net-test.c     |  5 +++++
 tests/qtest/virtio-rng-test.c     |  5 +++++
 6 files changed, 32 insertions(+)

diff --git a/tests/qtest/e1000e-test.c b/tests/qtest/e1000e-test.c
index 0273fe4c15..48f3dbb0fd 100644
--- a/tests/qtest/e1000e-test.c
+++ b/tests/qtest/e1000e-test.c
@@ -235,6 +235,12 @@ static void test_e1000e_multiple_transfers(void *obj, void *data,
 static void test_e1000e_hotplug(void *obj, void *data, QGuestAllocator * alloc)
 {
     QTestState *qts = global_qtest;  /* TODO: get rid of global_qtest here */
+    QE1000E_PCI *dev = obj;
+
+    if (dev->pci_dev.bus->not_hotpluggable) {
+        g_test_skip("pci bus does not support hotplug");
+        return;
+    }
 
     qtest_qmp_device_add(qts, "e1000e", "e1000e_net", "{'addr': '0x06'}");
     qpci_unplug_acpi_device_test(qts, "e1000e_net", 0x06);
diff --git a/tests/qtest/libqos/pci.h b/tests/qtest/libqos/pci.h
index 44f6806fe4..6a28b40522 100644
--- a/tests/qtest/libqos/pci.h
+++ b/tests/qtest/libqos/pci.h
@@ -52,6 +52,7 @@ struct QPCIBus {
     uint64_t pio_alloc_ptr, pio_limit;
     uint64_t mmio_alloc_ptr, mmio_limit;
     bool has_buggy_msi; /* TRUE for spapr, FALSE for pci */
+    bool not_hotpluggable; /* TRUE if devices cannot be hotplugged */
 
 };
 
diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk-test.c
index 62e670f39b..1316aae0fa 100644
--- a/tests/qtest/vhost-user-blk-test.c
+++ b/tests/qtest/vhost-user-blk-test.c
@@ -676,6 +676,11 @@ static void pci_hotplug(void *obj, void *data, QGuestAllocator *t_alloc)
     QVirtioPCIDevice *dev;
     QTestState *qts = dev1->pdev->bus->qts;
 
+    if (dev1->pdev->bus->not_hotpluggable) {
+        g_test_skip("pci bus does not support hotplug");
+        return;
+    }
+
     /* plug secondary disk */
     qtest_qmp_device_add(qts, "vhost-user-blk-pci", "drv1",
                          "{'addr': %s, 'chardev': 'char2'}",
@@ -703,6 +708,11 @@ static void multiqueue(void *obj, void *data, QGuestAllocator *t_alloc)
     uint64_t features;
     uint16_t num_queues;
 
+    if (pdev1->pdev->bus->not_hotpluggable) {
+        g_test_skip("bus pci.0 does not support hotplug");
+        return;
+    }
+
     /*
      * The primary device has 1 queue and VIRTIO_BLK_F_MQ is not enabled. The
      * VIRTIO specification allows VIRTIO_BLK_F_MQ to be enabled when there is
diff --git a/tests/qtest/virtio-blk-test.c b/tests/qtest/virtio-blk-test.c
index 2a23698211..acb44c9fb8 100644
--- a/tests/qtest/virtio-blk-test.c
+++ b/tests/qtest/virtio-blk-test.c
@@ -701,6 +701,11 @@ static void pci_hotplug(void *obj, void *data, QGuestAllocator *t_alloc)
     QVirtioPCIDevice *dev;
     QTestState *qts = dev1->pdev->bus->qts;
 
+    if (dev1->pdev->bus->not_hotpluggable) {
+        g_test_skip("pci bus does not support hotplug");
+        return;
+    }
+
     /* plug secondary disk */
     qtest_qmp_device_add(qts, "virtio-blk-pci", "drv1",
                          "{'addr': %s, 'drive': 'drive1'}",
diff --git a/tests/qtest/virtio-net-test.c b/tests/qtest/virtio-net-test.c
index 8bf74e516c..af3027144f 100644
--- a/tests/qtest/virtio-net-test.c
+++ b/tests/qtest/virtio-net-test.c
@@ -174,6 +174,11 @@ static void hotplug(void *obj, void *data, QGuestAllocator *t_alloc)
     QTestState *qts = dev->pdev->bus->qts;
     const char *arch = qtest_get_arch();
 
+    if (dev->pdev->bus->not_hotpluggable) {
+        g_test_skip("pci bus does not support hotplug");
+        return;
+    }
+
     qtest_qmp_device_add(qts, "virtio-net-pci", "net1",
                          "{'addr': %s}", stringify(PCI_SLOT_HP));
 
diff --git a/tests/qtest/virtio-rng-test.c b/tests/qtest/virtio-rng-test.c
index e6b8cd8e0c..5ce444ad72 100644
--- a/tests/qtest/virtio-rng-test.c
+++ b/tests/qtest/virtio-rng-test.c
@@ -20,6 +20,11 @@ static void rng_hotplug(void *obj, void *data, QGuestAllocator *alloc)
     QVirtioPCIDevice *dev = obj;
     QTestState *qts = dev->pdev->bus->qts;
 
+   if (dev->pdev->bus->not_hotpluggable) {
+        g_test_skip("pci bus does not support hotplug");
+        return;
+    }
+
     const char *arch = qtest_get_arch();
 
     qtest_qmp_device_add(qts, "virtio-rng-pci", "rng1",
-- 
2.26.3


