Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6BA51E04A
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 22:49:31 +0200 (CEST)
Received: from localhost ([::1]:47458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn4tG-0003a0-J1
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 16:49:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nn4qt-0007ON-6W
 for qemu-devel@nongnu.org; Fri, 06 May 2022 16:47:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nn4qr-0005f5-Cx
 for qemu-devel@nongnu.org; Fri, 06 May 2022 16:47:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651870020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0PgnS/MOgqGJpG1/gybB3D7xtnL4b+xzg5aImGSy2Yw=;
 b=Qbn8eRcaL/d38vI0ShwIVu4u69ysGLTjnO/15Z6gvt3ya78FVUaF1XFgBpkCPDQjt9AEU2
 hf0HCxN8Ii/AqK1kGhTATs0lqejYU3wkBq3Uwa/tCL0IRT3JXhM2uLKVhebGV+yXL9xUAI
 7AlRpukjW4jFr6mL+U7J3UQ3jyEFUxs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-218-tu-AXZbXPS6Yte1971W45g-1; Fri, 06 May 2022 16:46:57 -0400
X-MC-Unique: tu-AXZbXPS6Yte1971W45g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1FDA1296A603;
 Fri,  6 May 2022 20:46:57 +0000 (UTC)
Received: from [172.30.41.16] (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9BC940CF8E8;
 Fri,  6 May 2022 20:46:56 +0000 (UTC)
Subject: [PULL 02/11] vfio: move re-enabling INTX out of the common helper
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Longpeng (Mike)" <longpeng2@huawei.com>
Date: Fri, 06 May 2022 14:46:56 -0600
Message-ID: <165187001325.4166595.12497497370534530517.stgit@omen>
In-Reply-To: <165186988363.4166595.3147442303200167674.stgit@omen>
References: <165186988363.4166595.3147442303200167674.stgit@omen>
User-Agent: StGit/1.0-8-g6af9-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Longpeng(Mike) <longpeng2@huawei.com>

Move re-enabling INTX out, and the callers should decide to
re-enable it or not.

Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
Link: https://lore.kernel.org/r/20220326060226.1892-3-longpeng2@huawei.com
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/pci.c |   17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index cab1a6ef57f1..b3c27c22aaeb 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -693,7 +693,6 @@ retry:
 
 static void vfio_msi_disable_common(VFIOPCIDevice *vdev)
 {
-    Error *err = NULL;
     int i;
 
     for (i = 0; i < vdev->nr_vectors; i++) {
@@ -712,15 +711,11 @@ static void vfio_msi_disable_common(VFIOPCIDevice *vdev)
     vdev->msi_vectors = NULL;
     vdev->nr_vectors = 0;
     vdev->interrupt = VFIO_INT_NONE;
-
-    vfio_intx_enable(vdev, &err);
-    if (err) {
-        error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
-    }
 }
 
 static void vfio_msix_disable(VFIOPCIDevice *vdev)
 {
+    Error *err = NULL;
     int i;
 
     msix_unset_vector_notifiers(&vdev->pdev);
@@ -741,6 +736,10 @@ static void vfio_msix_disable(VFIOPCIDevice *vdev)
     }
 
     vfio_msi_disable_common(vdev);
+    vfio_intx_enable(vdev, &err);
+    if (err) {
+        error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
+    }
 
     memset(vdev->msix->pending, 0,
            BITS_TO_LONGS(vdev->msix->entries) * sizeof(unsigned long));
@@ -750,8 +749,14 @@ static void vfio_msix_disable(VFIOPCIDevice *vdev)
 
 static void vfio_msi_disable(VFIOPCIDevice *vdev)
 {
+    Error *err = NULL;
+
     vfio_disable_irqindex(&vdev->vbasedev, VFIO_PCI_MSI_IRQ_INDEX);
     vfio_msi_disable_common(vdev);
+    vfio_intx_enable(vdev, &err);
+    if (err) {
+        error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
+    }
 
     trace_vfio_msi_disable(vdev->vbasedev.name);
 }



