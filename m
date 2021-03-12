Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C99F23381B4
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 00:48:31 +0100 (CET)
Received: from localhost ([::1]:54962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKV2c-0006mW-TI
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 18:48:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lKUzT-0003Z5-LG
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 18:45:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lKUzR-0003jH-HD
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 18:45:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615506312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5httC4uvGDdHdev+bhurYgKh+LbsEq56qgX19Qx3it0=;
 b=icWRxIXaEbxkMHpQM5UpdlWeAHeMcBrEh5xZL562k66vBS3DNYMBGGmhBP5RjwvrwTGFl/
 nswV6jjAnSWHoAmiIbbqHZAPlHm0lqec3/q3vYdj59nAroZX5LI3J/JIzIhILCev2lighJ
 4tuRGuAGlv+MLPIvwZZ4jcpWQ1dosoU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-RxFmlnVDO4mb6DM3d9GwSg-1; Thu, 11 Mar 2021 18:45:10 -0500
X-MC-Unique: RxFmlnVDO4mb6DM3d9GwSg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88930881D70;
 Thu, 11 Mar 2021 23:44:45 +0000 (UTC)
Received: from gimli.home (ovpn-112-255.phx2.redhat.com [10.3.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BC2918BBE;
 Thu, 11 Mar 2021 23:44:45 +0000 (UTC)
Subject: [PULL 08/10] vfio: Avoid disabling and enabling vectors repeatedly
 in VFIO migration
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 11 Mar 2021 16:44:45 -0700
Message-ID: <161550628491.21070.3497758199665693384.stgit@gimli.home>
In-Reply-To: <161550593889.21070.5662039089881992714.stgit@gimli.home>
References: <161550593889.21070.5662039089881992714.stgit@gimli.home>
User-Agent: StGit/0.21-2-g8ef5
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Shenming Lu <lushenming@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Shenming Lu <lushenming@huawei.com>

In VFIO migration resume phase and some guest startups, there are
already unmasked vectors in the vector table when calling
vfio_msix_enable(). So in order to avoid inefficiently disabling
and enabling vectors repeatedly, let's allocate all needed vectors
first and then enable these unmasked vectors one by one without
disabling.

Signed-off-by: Shenming Lu <lushenming@huawei.com>
Message-Id: <20210310030233.1133-4-lushenming@huawei.com>
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/pci.c |   20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 759a3b1abf4b..5c65aa0a98e2 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -569,6 +569,9 @@ static void vfio_msix_vector_release(PCIDevice *pdev, unsigned int nr)
 
 static void vfio_msix_enable(VFIOPCIDevice *vdev)
 {
+    PCIDevice *pdev = &vdev->pdev;
+    unsigned int nr, max_vec = 0;
+
     vfio_disable_interrupts(vdev);
 
     vdev->msi_vectors = g_new0(VFIOMSIVector, vdev->msix->entries);
@@ -587,11 +590,22 @@ static void vfio_msix_enable(VFIOPCIDevice *vdev)
      * triggering to userspace, then immediately release the vector, leaving
      * the physical device with no vectors enabled, but MSI-X enabled, just
      * like the guest view.
+     * If there are already unmasked vectors (in migration resume phase and
+     * some guest startups) which will be enabled soon, we can allocate all
+     * of them here to avoid inefficiently disabling and enabling vectors
+     * repeatedly later.
      */
-    vfio_msix_vector_do_use(&vdev->pdev, 0, NULL, NULL);
-    vfio_msix_vector_release(&vdev->pdev, 0);
+    if (!pdev->msix_function_masked) {
+        for (nr = 0; nr < msix_nr_vectors_allocated(pdev); nr++) {
+            if (!msix_is_masked(pdev, nr)) {
+                max_vec = nr;
+            }
+        }
+    }
+    vfio_msix_vector_do_use(pdev, max_vec, NULL, NULL);
+    vfio_msix_vector_release(pdev, max_vec);
 
-    if (msix_set_vector_notifiers(&vdev->pdev, vfio_msix_vector_use,
+    if (msix_set_vector_notifiers(pdev, vfio_msix_vector_use,
                                   vfio_msix_vector_release, NULL)) {
         error_report("vfio: msix_set_vector_notifiers failed");
     }


