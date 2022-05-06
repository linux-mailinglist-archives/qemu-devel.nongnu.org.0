Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF82551E045
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 22:48:51 +0200 (CEST)
Received: from localhost ([::1]:45110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn4sc-0001zi-Me
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 16:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nn4rJ-0008Lh-9V
 for qemu-devel@nongnu.org; Fri, 06 May 2022 16:47:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nn4rG-0005jj-FQ
 for qemu-devel@nongnu.org; Fri, 06 May 2022 16:47:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651870045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eSs4ueRhiNRSq+ZOCP6XUxoT9jdxpS09FzbfZPbCZsA=;
 b=NaFBTNaQ+1eR7/l9HgpWTVPhb6o70e7VinePHnXM6EDYtreJtiR+s31NkgKKsiRyyvhe8g
 2SxNWqbMj8vsD6TgVn3xrmhpyao3+DFVrsDitu+8ei0G0afQJ1Ihgk/N2YCo6sQ8Px/eG9
 mP4zA7cFYj3yfJiQ3o3IwmQo+4e972U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457-xgQHVtvyOI-r2TE4JGZf3g-1; Fri, 06 May 2022 16:47:24 -0400
X-MC-Unique: xgQHVtvyOI-r2TE4JGZf3g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5ABC93C92FC9;
 Fri,  6 May 2022 20:47:24 +0000 (UTC)
Received: from [172.30.41.16] (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F311554A2D;
 Fri,  6 May 2022 20:47:24 +0000 (UTC)
Subject: [PULL 04/11] Revert "vfio: Avoid disabling and enabling vectors
 repeatedly in VFIO migration"
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Longpeng (Mike)" <longpeng2@huawei.com>
Date: Fri, 06 May 2022 14:47:23 -0600
Message-ID: <165187003945.4166595.1537735498887991261.stgit@omen>
In-Reply-To: <165186988363.4166595.3147442303200167674.stgit@omen>
References: <165186988363.4166595.3147442303200167674.stgit@omen>
User-Agent: StGit/1.0-8-g6af9-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124;
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

Commit ecebe53fe993 ("vfio: Avoid disabling and enabling vectors
repeatedly in VFIO migration") avoids inefficiently disabling and
enabling vectors repeatedly and lets the unmasked vectors be enabled
one by one.

But we want to batch multiple routes and defer the commit, and only
commit once outside the loop of setting vector notifiers, so we
cannot enable the vectors one by one in the loop now.

Revert that commit and we will take another way in the next patch,
it can not only avoid disabling/enabling vectors repeatedly, but
also satisfy our requirement of defer to commit.

Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
Link: https://lore.kernel.org/r/20220326060226.1892-5-longpeng2@huawei.com
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/pci.c |   20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 50562629ea8f..8bc36f081afd 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -572,9 +572,6 @@ static void vfio_msix_vector_release(PCIDevice *pdev, unsigned int nr)
 
 static void vfio_msix_enable(VFIOPCIDevice *vdev)
 {
-    PCIDevice *pdev = &vdev->pdev;
-    unsigned int nr, max_vec = 0;
-
     vfio_disable_interrupts(vdev);
 
     vdev->msi_vectors = g_new0(VFIOMSIVector, vdev->msix->entries);
@@ -593,22 +590,11 @@ static void vfio_msix_enable(VFIOPCIDevice *vdev)
      * triggering to userspace, then immediately release the vector, leaving
      * the physical device with no vectors enabled, but MSI-X enabled, just
      * like the guest view.
-     * If there are already unmasked vectors (in migration resume phase and
-     * some guest startups) which will be enabled soon, we can allocate all
-     * of them here to avoid inefficiently disabling and enabling vectors
-     * repeatedly later.
      */
-    if (!pdev->msix_function_masked) {
-        for (nr = 0; nr < msix_nr_vectors_allocated(pdev); nr++) {
-            if (!msix_is_masked(pdev, nr)) {
-                max_vec = nr;
-            }
-        }
-    }
-    vfio_msix_vector_do_use(pdev, max_vec, NULL, NULL);
-    vfio_msix_vector_release(pdev, max_vec);
+    vfio_msix_vector_do_use(&vdev->pdev, 0, NULL, NULL);
+    vfio_msix_vector_release(&vdev->pdev, 0);
 
-    if (msix_set_vector_notifiers(pdev, vfio_msix_vector_use,
+    if (msix_set_vector_notifiers(&vdev->pdev, vfio_msix_vector_use,
                                   vfio_msix_vector_release, NULL)) {
         error_report("vfio: msix_set_vector_notifiers failed");
     }



