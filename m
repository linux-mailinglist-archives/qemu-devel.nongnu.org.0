Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AE95BA053
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 19:21:00 +0200 (CEST)
Received: from localhost ([::1]:33866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYsXp-0007Db-U2
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 13:20:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1oYsVY-0004yY-PP
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 13:18:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1oYsVS-0008Mq-Ei
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 13:18:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663262309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Z0EMHQD95IGfuMsMhnXpEI94+P61EvU9qbslVrJfqhY=;
 b=YqI5ll7As8Na8l5NZEAVeBj+Sr3gJgm/I+u1usLS7EffN2chaLdrGL3jDuRoxlA8kYFBdQ
 VYixQ1JOoYcE4FwZhYJgH1TAE25s53IlDT1XCPul4PmdRC7XeLpunu8BEp/89WPSvoBYhq
 54KKmk9C0534KJZ7BSERCFNF+zLf40Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-tMqOqBv5PXClKw_2iPamuQ-1; Thu, 15 Sep 2022 13:18:28 -0400
X-MC-Unique: tMqOqBv5PXClKw_2iPamuQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0BE5185A583;
 Thu, 15 Sep 2022 17:18:28 +0000 (UTC)
Received: from [172.30.42.193] (unknown [10.22.8.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD93C2084836;
 Thu, 15 Sep 2022 17:18:27 +0000 (UTC)
Subject: [PATCH] vfio/common: Fix vfio_iommu_type1_info use after free
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com, nicolinc@nvidia.com, cohuck@redhat.com
Date: Thu, 15 Sep 2022 11:18:27 -0600
Message-ID: <166326219630.3388898.12882473157184946072.stgit@omen>
User-Agent: StGit/1.5.dev2+g9ce680a52bd9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On error, vfio_get_iommu_info() frees and clears *info, but
vfio_connect_container() continues to use the pointer regardless
of the return value.  Restructure the code such that a failure
of this function triggers an error and clean up the remainder of
the function, including updating an outdated comment that had
drifted from its relevant line of code and using host page size
for a default for better compatibility on non-4KB systems.

Reported-by: Nicolin Chen <nicolinc@nvidia.com>
Link: https://lore.kernel.org/all/20220910004245.2878-1-nicolinc@nvidia.com/
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/common.c |   36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

Turns out I had the errno vs ret correct the first time from the
thread in the above Link, vfio_get_iommu_info() returns -errno.

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index ace9562a9ba1..6b5d8c0bf694 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -2111,29 +2111,31 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     {
         struct vfio_iommu_type1_info *info;
 
-        /*
-         * FIXME: This assumes that a Type1 IOMMU can map any 64-bit
-         * IOVA whatsoever.  That's not actually true, but the current
-         * kernel interface doesn't tell us what it can map, and the
-         * existing Type1 IOMMUs generally support any IOVA we're
-         * going to actually try in practice.
-         */
         ret = vfio_get_iommu_info(container, &info);
+        if (ret) {
+            error_setg_errno(errp, -ret, "Failed to get VFIO IOMMU info");
+            goto enable_discards_exit;
+        }
 
-        if (ret || !(info->flags & VFIO_IOMMU_INFO_PGSIZES)) {
-            /* Assume 4k IOVA page size */
-            info->iova_pgsizes = 4096;
+        if (info->flags & VFIO_IOMMU_INFO_PGSIZES) {
+            container->pgsizes = info->iova_pgsizes;
+        } else {
+            container->pgsizes = qemu_real_host_page_size();
         }
-        vfio_host_win_add(container, 0, (hwaddr)-1, info->iova_pgsizes);
-        container->pgsizes = info->iova_pgsizes;
 
-        /* The default in the kernel ("dma_entry_limit") is 65535. */
-        container->dma_max_mappings = 65535;
-        if (!ret) {
-            vfio_get_info_dma_avail(info, &container->dma_max_mappings);
-            vfio_get_iommu_info_migration(container, info);
+        if (!vfio_get_info_dma_avail(info, &container->dma_max_mappings)) {
+            container->dma_max_mappings = 65535;
         }
+        vfio_get_iommu_info_migration(container, info);
         g_free(info);
+
+        /*
+         * FIXME: We should parse VFIO_IOMMU_TYPE1_INFO_CAP_IOVA_RANGE
+         * information to get the actual window extent rather than assume
+         * a 64-bit IOVA address space.
+         */
+        vfio_host_win_add(container, 0, (hwaddr)-1, container->pgsizes);
+
         break;
     }
     case VFIO_SPAPR_TCE_v2_IOMMU:



