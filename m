Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60074644E6E
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 23:15:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2gCK-00007o-Gu; Tue, 06 Dec 2022 17:13:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p2gCJ-00007V-9t
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 17:13:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p2gCH-00039A-Le
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 17:13:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670364832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rDJOFehaHwdedJQ2epRoiZ4lijzLwjpAJt96/KDm43I=;
 b=N5Yht8Fq2aIlWx85CuD9OhNh7hXtB498BcZGtTAGu6N+DGyAIhhkxXQzX2/J6I/QBAJ1xU
 EGx+wMZTfS3V8+SeXEUQk/P6wb26nX1OieKVStGIw+uqL3kj0mmJR25GJ/FB2FyvAJ5ohf
 KmbRDoUP34wxckgTPI1Kr/y0td5xffc=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-58-LflilQW0N2Gu9MV3d0KmXg-1; Tue, 06 Dec 2022 17:13:51 -0500
X-MC-Unique: LflilQW0N2Gu9MV3d0KmXg-1
Received: by mail-qk1-f199.google.com with SMTP id
 bi42-20020a05620a31aa00b006faaa1664b9so22142543qkb.8
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 14:13:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rDJOFehaHwdedJQ2epRoiZ4lijzLwjpAJt96/KDm43I=;
 b=KkeqACWLrJpg3zwYKT1rDfF7IR4kIFCq5P6qOv2SEaVKRXpZLFCWKx+brQcP7PcGfj
 yD/uNCOeU5zHuDPRaavYwVbaGLOxu6a2ads66t/+WkGal2uMbEwtmMLnQwBGR2Y+SoWk
 IqlNrK0YNQ0RDok30KdzrXmNhnu4wDvUzz1xtk4ux8Vghd5mD5dXweSYFYq+KBXVR9UI
 gVpxi4QPZmtK3bGFlSzH1236wJr4BhUza+bcw0XHk7OZZkPs1GVR8aW6GyUZlpa26wfe
 Olnk+5niJ1/Ld00Gq6ZRX1aSyjd8nZTSmRdYNoSnCvGjU5SgcoNyrYve/kOt8VxYVpIT
 byiA==
X-Gm-Message-State: ANoB5pnwlWWyO6sKFnLGzBGp9oZ8NZe1giCzvNhJFEKjxvbWNlJOkkVD
 h3wMEzMAxEai/FNBDEB7sEhItfOT5c1x7fduCGq5ibhs6bnvtjAlaZ8k4vnFfkARZLhNz6ESa15
 zC3wrgG7JzJPTdxdxHvgGuyWQh4I6fT4I+WYPMXSPCmFKRUk+YPUQ8s2NPJKDWy3q
X-Received: by 2002:ac8:5756:0:b0:3a6:8700:b471 with SMTP id
 22-20020ac85756000000b003a68700b471mr968377qtx.38.1670364830410; 
 Tue, 06 Dec 2022 14:13:50 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7UcHyE/U5Fewt9gFOYe1/SYpX8LgA52OohVbZKMTg8pRnu/npAqgg8g7ETL1Qyt2UmMqzbVw==
X-Received: by 2002:ac8:5756:0:b0:3a6:8700:b471 with SMTP id
 22-20020ac85756000000b003a68700b471mr968362qtx.38.1670364829979; 
 Tue, 06 Dec 2022 14:13:49 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a05620a414300b006f9c2be0b4bsm15532370qko.135.2022.12.06.14.13.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 14:13:49 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, peterx@redhat.com,
 "Michael S . Tsirkin" <mst@redhat.com>, Yi Liu <yi.l.liu@intel.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PATCH v3] intel-iommu: Document iova_tree
Date: Tue,  6 Dec 2022 17:13:48 -0500
Message-Id: <20221206221348.396020-1-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

It seems not super clear on when iova_tree is used, and why.  Add a rich
comment above iova_tree to track why we needed the iova_tree, and when we
need it.

Also comment for the map/unmap messages, on how they're used and
implications (e.g. unmap can be larger than the mapped ranges).

Suggested-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
v3:
- Adjust according to Eric's comment
---
 include/exec/memory.h         | 28 ++++++++++++++++++++++++++
 include/hw/i386/intel_iommu.h | 38 ++++++++++++++++++++++++++++++++++-
 2 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 91f8a2395a..269ecb873b 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -129,6 +129,34 @@ struct IOMMUTLBEntry {
 /*
  * Bitmap for different IOMMUNotifier capabilities. Each notifier can
  * register with one or multiple IOMMU Notifier capability bit(s).
+ *
+ * Normally there're two use cases for the notifiers:
+ *
+ *   (1) When the device needs accurate synchronizations of the vIOMMU page
+ *       tables, it needs to register with both MAP|UNMAP notifies (which
+ *       is defined as IOMMU_NOTIFIER_IOTLB_EVENTS below).
+ *
+ *       Regarding to accurate synchronization, it's when the notified
+ *       device maintains a shadow page table and must be notified on each
+ *       guest MAP (page table entry creation) and UNMAP (invalidation)
+ *       events (e.g. VFIO). Both notifications must be accurate so that
+ *       the shadow page table is fully in sync with the guest view.
+ *
+ *   (2) When the device doesn't need accurate synchronizations of the
+ *       vIOMMU page tables, it needs to register only with UNMAP or
+ *       DEVIOTLB_UNMAP notifies.
+ *
+ *       It's when the device maintains a cache of IOMMU translations
+ *       (IOTLB) and is able to fill that cache by requesting translations
+ *       from the vIOMMU through a protocol similar to ATS (Address
+ *       Translation Service).
+ *
+ *       Note that in this mode the vIOMMU will not maintain a shadowed
+ *       page table for the address space, and the UNMAP messages can be
+ *       actually larger than the real invalidations (just like how the
+ *       Linux IOMMU driver normally works, where an invalidation can be
+ *       enlarged as long as it still covers the target range).  The IOMMU
+ *       notifiee should be able to take care of over-sized invalidations.
  */
 typedef enum {
     IOMMU_NOTIFIER_NONE = 0,
diff --git a/include/hw/i386/intel_iommu.h b/include/hw/i386/intel_iommu.h
index 46d973e629..89dcbc5e1e 100644
--- a/include/hw/i386/intel_iommu.h
+++ b/include/hw/i386/intel_iommu.h
@@ -109,7 +109,43 @@ struct VTDAddressSpace {
     QLIST_ENTRY(VTDAddressSpace) next;
     /* Superset of notifier flags that this address space has */
     IOMMUNotifierFlag notifier_flags;
-    IOVATree *iova_tree;          /* Traces mapped IOVA ranges */
+    /*
+     * @iova_tree traces mapped IOVA ranges.
+     *
+     * The tree is not needed if no MAP notifier is registered with current
+     * VTD address space, because all guest invalidate commands can be
+     * directly passed to the IOMMU UNMAP notifiers without any further
+     * reshuffling.
+     *
+     * The tree OTOH is required for MAP typed iommu notifiers for a few
+     * reasons.
+     *
+     * Firstly, there's no way to identify whether an PSI (Page Selective
+     * Invalidations) or DSI (Domain Selective Invalidations) event is an
+     * MAP or UNMAP event within the message itself.  Without having prior
+     * knowledge of existing state vIOMMU doesn't know whether it should
+     * notify MAP or UNMAP for a PSI message it received when caching mode
+     * is enabled (for MAP notifiers).
+     *
+     * Secondly, PSI messages received from guest driver can be enlarged in
+     * range, covers but not limited to what the guest driver wanted to
+     * invalidate.  When the range to invalidates gets bigger than the
+     * limit of a PSI message, it can even become a DSI which will
+     * invalidate the whole domain.  If the vIOMMU directly notifies the
+     * registered device with the unmodified range, it may confuse the
+     * registered drivers (e.g. vfio-pci) on either:
+     *
+     *   (1) Trying to map the same region more than once (for
+     *       VFIO_IOMMU_MAP_DMA, -EEXIST will trigger), or,
+     *
+     *   (2) Trying to UNMAP a range that is still partially mapped.
+     *
+     * That accuracy is not required for UNMAP-only notifiers, but it is a
+     * must-to-have for notifiers registered with MAP events, because the
+     * vIOMMU needs to make sure the shadow page table is always in sync
+     * with the guest IOMMU pgtables for a device.
+     */
+    IOVATree *iova_tree;
 };
 
 struct VTDIOTLBEntry {
-- 
2.37.3


