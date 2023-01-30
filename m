Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC60681B3F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:19:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMack-0002J6-Ii; Mon, 30 Jan 2023 15:19:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMaca-0002HF-JF
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:19:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMacY-0006rj-R8
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:19:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675109958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LB98aNlG5vR9wuhrC4m7cx7P3QS/+WwtJNeC3Few8bE=;
 b=Hafk66yzu99nhTafJCjPMGiZmtx/5D4xrTvCIZQY24VEOokeyoW7FoLXhCYzDa6ZOr0Sk+
 9dB2PJkczJDWZ7d5J56jtNPh4QmuMIj3qtL3wIU9sStUf46qgjrxDNfiNN14XkpW5cJ9X+
 kUmE6Iwe59w++Wa9LhHB4GNA4F926/U=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-313-LXUV-DNMN1W8zDwCz3Bhhw-1; Mon, 30 Jan 2023 15:19:16 -0500
X-MC-Unique: LXUV-DNMN1W8zDwCz3Bhhw-1
Received: by mail-ed1-f71.google.com with SMTP id
 t26-20020aa7d71a000000b004a244cc7ee8so2815493edq.2
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:19:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LB98aNlG5vR9wuhrC4m7cx7P3QS/+WwtJNeC3Few8bE=;
 b=hc4632n7uTapgFNqpUgehRTvN7tlF6tDx6SG+pa2OS22CNpCXgYQeLmISom5RTOT8B
 l67muYi7U+7KGQDic6rCuNf8PhzrFuj1hf5FmBr1Jci/yQPOIK/zP6imsgtPCJ/8pdHs
 p4pUPaKTTSFoBAF6eZcNDas91ODvXVMvyvYuy/yX9E4KVbAsbRbhFUM9xnBxQqFWsqnK
 AyxfHYvHlWBlY4QGGHtd/bLO76jMv7+I00ysoxRa0WQI3SZFmIj9RmlzfMtTgrOnJ2pm
 YBqlV4vEiW0LxWG4hXaYF0NqUwtYU8+Mv+oyQf+k2eTQQDaKkfKVdMGWvnI4N7zX4HCH
 z0ug==
X-Gm-Message-State: AFqh2kocNlgFGFJJT8GMoLZncqxiWA6ZrCZd0g0ZNwzlCYb8wxP9GPQl
 TM2FsZgqSa60DxHKrEWkP+8APqwU/nybCH2JDQUTXvjQFs4Dnl/rYCHvCAazUH8paKwSmeMXMXi
 CH+DOK9+Rmw2msLddCETs5XNgdIM3WxrUssN+GXOnijxFHpdUdzzxmZOTaLFO
X-Received: by 2002:a17:907:b17:b0:873:699f:e87c with SMTP id
 h23-20020a1709070b1700b00873699fe87cmr51921866ejl.71.1675109954844; 
 Mon, 30 Jan 2023 12:19:14 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu2/eKWS++r/HYwWl8O8hQ7/yUjz/D07iL5C6jLQEiMIwz/iCMiu4vIztmNCgZEg/3LkmOVHA==
X-Received: by 2002:a17:907:b17:b0:873:699f:e87c with SMTP id
 h23-20020a1709070b1700b00873699fe87cmr51921845ejl.71.1675109954531; 
 Mon, 30 Jan 2023 12:19:14 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 c7-20020a170906d18700b00871f66bf354sm7241011ejz.204.2023.01.30.12.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:19:14 -0800 (PST)
Date: Mon, 30 Jan 2023 15:19:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 09/56] intel-iommu: Document iova_tree
Message-ID: <20230130201810.11518-10-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Peter Xu <peterx@redhat.com>

It seems not super clear on when iova_tree is used, and why.  Add a rich
comment above iova_tree to track why we needed the iova_tree, and when we
need it.

Also comment for the map/unmap messages, on how they're used and
implications (e.g. unmap can be larger than the mapped ranges).

Suggested-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20230109193727.1360190-1-peterx@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/exec/memory.h         | 26 ++++++++++++++++++++++++
 include/hw/i386/intel_iommu.h | 38 ++++++++++++++++++++++++++++++++++-
 2 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index c37ffdbcd1..2e602a2fad 100644
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
MST


