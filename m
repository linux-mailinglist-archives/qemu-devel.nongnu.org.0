Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C26C66308A
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 20:38:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pExxq-00032h-IH; Mon, 09 Jan 2023 14:37:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pExxk-00031c-9c
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 14:37:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pExxf-0007vC-74
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 14:37:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673293052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=lES8RRQeXCmyZDAMYKwnhb59HsPmbB9PxGO8Zsos7Wk=;
 b=AYuxLVGkOBEHD5nZ2KCaihrg2F+0jDVk/Vt59kUWMBu7Gpl2ARKb2D+pxNSBN3aOKeSNHx
 TCp/f6ghvulezRpy901WOVjIybKeHT0DWpBNqOprGmMZ2sCtdh/N59OW82FvPqzrPljZ1X
 BMsjkKCOQXzD4GL/ygbqj13DuHTv6Hk=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-237-TL2M3b_OPxm8NfOBRazt8Q-1; Mon, 09 Jan 2023 14:37:31 -0500
X-MC-Unique: TL2M3b_OPxm8NfOBRazt8Q-1
Received: by mail-qt1-f198.google.com with SMTP id
 gd12-20020a05622a5c0c00b003ae18bc7847so969637qtb.5
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 11:37:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lES8RRQeXCmyZDAMYKwnhb59HsPmbB9PxGO8Zsos7Wk=;
 b=c6bofVDB6OVsY71gb/V3Q66w2p2BXQfnIdpTyjyIJTHPUW3NO2GH5OfGvATqO2UQkz
 KrxB6grn/niP4F8mSW/zpuxeFb7BiY1F+uUlLURLjliGJVQakj3BMGgBuvkF52Ex82Q/
 P24fmq1KZ+MbOpQX9DPBDncCnN0SKScaDS+7AZl+aYKN01rS6UvjRNAMdLRqAJZj/jlT
 kT03CU+s0pDsaw5afb4cml/nyKzlYH8rnOOYxsOesqg9EmYCqdiZxjBtzegAtMr1aM+q
 5cSaBjT4IV05EGe76kt2kzbLhdiihXOQMiQWCWQUQuW5Am4552n3WINXGkDblLFYH+Op
 XZbg==
X-Gm-Message-State: AFqh2krzk941hsiSZYkEl1ZuVlftIDIceAT8a7UB+Xq7gvMWja5HPZhH
 c7CCyT2L7Lc/V+weBfCRfGHrtrg2w7DW4T4UxWUzyOr4a8hwP8VkNkwgd+mIZKnk3NVLETKcjAC
 bNGb8pwSYePl6UlTHvpaIiUDgLQczmhwVVUgteMRSzZl9aHmJLsuKpVpNw8W0xwoV
X-Received: by 2002:ac8:1085:0:b0:3a6:a4ed:7c42 with SMTP id
 a5-20020ac81085000000b003a6a4ed7c42mr85116086qtj.54.1673293049737; 
 Mon, 09 Jan 2023 11:37:29 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtDE8GIHot9EBXZqfR7WBbNwGbvHc6bkrbfS1w2m0c3s3Fuyg8nbSnbDWBbpJl5PGfuStEkhA==
X-Received: by 2002:ac8:1085:0:b0:3a6:a4ed:7c42 with SMTP id
 a5-20020ac81085000000b003a6a4ed7c42mr85116046qtj.54.1673293049277; 
 Mon, 09 Jan 2023 11:37:29 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-39-70-52-228-144.dsl.bell.ca. [70.52.228.144])
 by smtp.gmail.com with ESMTPSA id
 b26-20020ac8755a000000b003a50248b89esm4963208qtr.26.2023.01.09.11.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 11:37:28 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Jason Wang <jasowang@redhat.com>, peterx@redhat.com,
 "Michael S . Tsirkin" <mst@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Yi Liu <yi.l.liu@intel.com>
Subject: [PATCH v4] intel-iommu: Document iova_tree
Date: Mon,  9 Jan 2023 14:37:27 -0500
Message-Id: <20230109193727.1360190-1-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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
v4:
- Adjust according to Jason's comment on the possible enlarged unmap events
---
 include/exec/memory.h         | 26 ++++++++++++++++++++++++
 include/hw/i386/intel_iommu.h | 38 ++++++++++++++++++++++++++++++++++-
 2 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 91f8a2395a..61907d2222 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -129,6 +129,32 @@ struct IOMMUTLBEntry {
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
+ *       page table for the address space, and the UNMAP messages can cover
+ *       more than the pages that used to get mapped.  The IOMMU notifiee
+ *       should be able to take care of over-sized invalidations.
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


