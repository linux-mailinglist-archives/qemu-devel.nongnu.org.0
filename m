Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F063492FB9
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 21:51:44 +0100 (CET)
Received: from localhost ([::1]:44988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9vSA-00034E-Ai
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 15:51:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n9vGU-0006jz-Pz
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 15:39:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n9vGT-0003LB-5g
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 15:39:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642538374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tNydDTYaWN8bVxhXPpl3ShPmt922xSEsE9g+zjMcyqY=;
 b=WGecIQIgHkcnedNpeFCSjpxFlsPUf22+jQUJh4FgTtIZ04jLz5skKi4XVhL++K+2HuCZ3P
 OEn2HVkrHroEVI4vRXynf0/zMszwIEArMdKH5FCQBjU0LNXrdrext32sPSamyqw6UVHuQW
 ILBeUYSBdar85Iyevdu6bkNJDYafQdw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-QBjAVd-5OpKUnQ-CMtiyCA-1; Tue, 18 Jan 2022 15:39:31 -0500
X-MC-Unique: QBjAVd-5OpKUnQ-CMtiyCA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD57485EE61;
 Tue, 18 Jan 2022 20:39:29 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.194.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD9D045D95;
 Tue, 18 Jan 2022 20:39:22 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, thuth@redhat.com,
 pbonzini@redhat.com, lvivier@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 david@gibson.dropbear.id.au, clg@kaod.org, eesposit@redhat.com
Subject: [PATCH v2 5/6] tests/qtest/vhost-user-blk-test: Factorize vq setup
 code
Date: Tue, 18 Jan 2022 21:38:32 +0100
Message-Id: <20220118203833.316741-6-eric.auger@redhat.com>
In-Reply-To: <20220118203833.316741-1-eric.auger@redhat.com>
References: <20220118203833.316741-1-eric.auger@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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

The vq setup code is repeated several times and can be
easily factorized.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/vhost-user-blk-test.c | 33 +++++++++++++++----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk-test.c
index 2606428df3..9567f3dc42 100644
--- a/tests/qtest/vhost-user-blk-test.c
+++ b/tests/qtest/vhost-user-blk-test.c
@@ -211,6 +211,19 @@ static void test_invalid_discard_write_zeroes(QVirtioDevice *dev,
     guest_free(alloc, req_addr);
 }
 
+static QVirtQueue *setup_vq(QVirtioDevice *dev, QGuestAllocator *alloc)
+{
+    QVirtioPCIDevice *vpcidev = container_of(dev, QVirtioPCIDevice, vdev);
+    QVirtQueue *vq;
+
+    qpci_msix_enable(vpcidev->pdev);
+    qvirtio_pci_set_msix_configuration_vector(vpcidev, alloc, 0);
+
+    vq = qvirtqueue_setup(dev, alloc, 0);
+    qvirtqueue_pci_msix_setup(vpcidev, (QVirtQueuePCI *)vq, alloc, 1);
+    return vq;
+}
+
 /* Returns the request virtqueue so the caller can perform further tests */
 static QVirtQueue *test_basic(QVirtioDevice *dev, QGuestAllocator *alloc)
 {
@@ -223,10 +236,6 @@ static QVirtQueue *test_basic(QVirtioDevice *dev, QGuestAllocator *alloc)
     char *data;
     QTestState *qts = global_qtest;
     QVirtQueue *vq;
-    QVirtioPCIDevice *vpcidev = container_of(dev, QVirtioPCIDevice, vdev);
-
-    qpci_msix_enable(vpcidev->pdev);
-    qvirtio_pci_set_msix_configuration_vector(vpcidev, alloc, 0);
 
     features = qvirtio_get_features(dev);
     features = features & ~(QVIRTIO_F_BAD_FEATURE |
@@ -238,8 +247,7 @@ static QVirtQueue *test_basic(QVirtioDevice *dev, QGuestAllocator *alloc)
     capacity = qvirtio_config_readq(dev, 0);
     g_assert_cmpint(capacity, ==, TEST_IMAGE_SIZE / 512);
 
-    vq = qvirtqueue_setup(dev, alloc, 0);
-    qvirtqueue_pci_msix_setup(vpcidev, (QVirtQueuePCI *)vq, alloc, 1);
+    vq = setup_vq(dev, alloc);
 
     qvirtio_set_driver_ok(dev);
 
@@ -474,10 +482,6 @@ static void indirect(void *obj, void *u_data, QGuestAllocator *t_alloc)
     uint8_t status;
     char *data;
     QTestState *qts = global_qtest;
-    QVirtioPCIDevice *vpcidev = container_of(dev, QVirtioPCIDevice, vdev);
-
-    qpci_msix_enable(vpcidev->pdev);
-    qvirtio_pci_set_msix_configuration_vector(vpcidev, t_alloc, 0);
 
     features = qvirtio_get_features(dev);
     g_assert_cmphex(features & (1u << VIRTIO_RING_F_INDIRECT_DESC), !=, 0);
@@ -489,8 +493,7 @@ static void indirect(void *obj, void *u_data, QGuestAllocator *t_alloc)
     capacity = qvirtio_config_readq(dev, 0);
     g_assert_cmpint(capacity, ==, TEST_IMAGE_SIZE / 512);
 
-    vq = qvirtqueue_setup(dev, t_alloc, 0);
-    qvirtqueue_pci_msix_setup(vpcidev, (QVirtQueuePCI *)vq, t_alloc, 1);
+    vq = setup_vq(dev, t_alloc);
 
     qvirtio_set_driver_ok(dev);
 
@@ -576,9 +579,6 @@ static void idx(void *obj, void *u_data, QGuestAllocator *t_alloc)
         return;
     }
 
-    qpci_msix_enable(pdev->pdev);
-    qvirtio_pci_set_msix_configuration_vector(pdev, t_alloc, 0);
-
     features = qvirtio_get_features(dev);
     features = features & ~(QVIRTIO_F_BAD_FEATURE |
                             (1u << VIRTIO_RING_F_INDIRECT_DESC) |
@@ -589,8 +589,7 @@ static void idx(void *obj, void *u_data, QGuestAllocator *t_alloc)
     capacity = qvirtio_config_readq(dev, 0);
     g_assert_cmpint(capacity, ==, TEST_IMAGE_SIZE / 512);
 
-    vq = qvirtqueue_setup(dev, t_alloc, 0);
-    qvirtqueue_pci_msix_setup(pdev, (QVirtQueuePCI *)vq, t_alloc, 1);
+    vq = setup_vq(dev, t_alloc);
 
     qvirtio_set_driver_ok(dev);
 
-- 
2.26.3


