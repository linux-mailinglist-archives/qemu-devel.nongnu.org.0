Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B76148A1EE
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 22:28:38 +0100 (CET)
Received: from localhost ([::1]:55020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n72DV-0006fr-8s
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 16:28:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n725p-0005Uz-OV
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:20:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n725o-0006nj-3R
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:20:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641849639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GKo6kzqtR7aaqfRFQC4AAGP2Trfsx9n7RW7LK5BxaG8=;
 b=bZ6EqH7V4XOyglzXwt6xXn6bM3lRmUs8u+93kpFKklpMlzM0//jO4+Vv108laJPzLpap3V
 dvHUHeWuZE6Cv/DXaeyYIId+CQmgofXSMOYQwgU+b1I2eOvJ12378kB3H+qajiRo0p+/21
 rRvWgG215lYZmTtrMzXx2RzmKqbKEo8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-APiVmWJRPx6PSz25z1sZLA-1; Mon, 10 Jan 2022 16:20:38 -0500
X-MC-Unique: APiVmWJRPx6PSz25z1sZLA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3228835E20;
 Mon, 10 Jan 2022 21:20:36 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.194.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0607545D62;
 Mon, 10 Jan 2022 21:20:29 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, thuth@redhat.com,
 pbonzini@redhat.com, lvivier@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 david@gibson.dropbear.id.au, clg@kaod.org
Subject: [PATCH 4/6] tests/qtest/vhost-user-blk-test: Setup MSIx to avoid
 error on aarch64
Date: Mon, 10 Jan 2022 22:19:13 +0100
Message-Id: <20220110211915.2749082-5-eric.auger@redhat.com>
In-Reply-To: <20220110211915.2749082-1-eric.auger@redhat.com>
References: <20220110211915.2749082-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
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
Cc: jean-philippe@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When run on ARM, basic and indirect tests currently fail with the
following error:

ERROR:../tests/qtest/libqos/virtio.c:224:qvirtio_wait_used_elem:
assertion failed (got_desc_idx == desc_idx): (50331648 == 0)
Bail out! ERROR:../tests/qtest/libqos/virtio.c:224: qvirtio_wait_used_elem:
assertion failed (got_desc_idx == desc_idx): (50331648 == 0)

Setting up and enabling MSIX fixes the issue.

Also remove the useless libqos/libqos-pc.h header inclusion.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 tests/qtest/vhost-user-blk-test.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk-test.c
index cea2570884b..2024aa5923e 100644
--- a/tests/qtest/vhost-user-blk-test.c
+++ b/tests/qtest/vhost-user-blk-test.c
@@ -19,7 +19,6 @@
 #include "standard-headers/linux/virtio_pci.h"
 #include "libqos/qgraph.h"
 #include "libqos/vhost-user-blk.h"
-#include "libqos/libqos-pc.h"
 
 #define TEST_IMAGE_SIZE         (64 * 1024 * 1024)
 #define QVIRTIO_BLK_TIMEOUT_US  (30 * 1000 * 1000)
@@ -224,6 +223,10 @@ static QVirtQueue *test_basic(QVirtioDevice *dev, QGuestAllocator *alloc)
     char *data;
     QTestState *qts = global_qtest;
     QVirtQueue *vq;
+    QVirtioPCIDevice *vpcidev = container_of(dev, QVirtioPCIDevice, vdev);
+
+    qpci_msix_enable(vpcidev->pdev);
+    qvirtio_pci_set_msix_configuration_vector(vpcidev, alloc, 0);
 
     features = qvirtio_get_features(dev);
     features = features & ~(QVIRTIO_F_BAD_FEATURE |
@@ -236,9 +239,12 @@ static QVirtQueue *test_basic(QVirtioDevice *dev, QGuestAllocator *alloc)
     g_assert_cmpint(capacity, ==, TEST_IMAGE_SIZE / 512);
 
     vq = qvirtqueue_setup(dev, alloc, 0);
+    qvirtqueue_pci_msix_setup(vpcidev, (QVirtQueuePCI *)vq, alloc, 1);
 
     qvirtio_set_driver_ok(dev);
 
+    qvirtio_wait_queue_isr(qts, dev, vq, QVIRTIO_BLK_TIMEOUT_US);
+
     /* Write and read with 3 descriptor layout */
     /* Write request */
     req.type = VIRTIO_BLK_T_OUT;
@@ -468,6 +474,10 @@ static void indirect(void *obj, void *u_data, QGuestAllocator *t_alloc)
     uint8_t status;
     char *data;
     QTestState *qts = global_qtest;
+    QVirtioPCIDevice *vpcidev = container_of(dev, QVirtioPCIDevice, vdev);
+
+    qpci_msix_enable(vpcidev->pdev);
+    qvirtio_pci_set_msix_configuration_vector(vpcidev, t_alloc, 0);
 
     features = qvirtio_get_features(dev);
     g_assert_cmphex(features & (1u << VIRTIO_RING_F_INDIRECT_DESC), !=, 0);
@@ -480,8 +490,12 @@ static void indirect(void *obj, void *u_data, QGuestAllocator *t_alloc)
     g_assert_cmpint(capacity, ==, TEST_IMAGE_SIZE / 512);
 
     vq = qvirtqueue_setup(dev, t_alloc, 0);
+    qvirtqueue_pci_msix_setup(vpcidev, (QVirtQueuePCI *)vq, t_alloc, 1);
+
     qvirtio_set_driver_ok(dev);
 
+    qvirtio_wait_queue_isr(qts, dev, vq, QVIRTIO_BLK_TIMEOUT_US);
+
     /* Write request */
     req.type = VIRTIO_BLK_T_OUT;
     req.ioprio = 1;
-- 
2.26.3


