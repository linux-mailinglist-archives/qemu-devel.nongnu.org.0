Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB6B2A5DA7
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Nov 2020 06:17:46 +0100 (CET)
Received: from localhost ([::1]:40158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaBB3-0001Xq-LW
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 00:17:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kaApJ-0004R9-12
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 23:55:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kaApA-0005oH-Ll
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 23:55:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604465707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CO5kV6TOgl7VkllXO+Cj7QHVQ3FQj45OIYdaYC1hBZU=;
 b=ald0BJOg2uufUkPLARaWt7iOQvxpWHWrG74+7S+gVTeqcPDshlg8P7pXGy7tN5C1BGNtvk
 bMC155H8euP56FVYjFi3UDa83a9lfz1pH+M1S/zRn3bOiy+ywiyPtsT2hjenzjeBGeGI0n
 V66Gj9flVCGCv7ROIb71Dkx3zJYFJ7E=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-maGUCr2INZKC-8hmwcHBnQ-1; Tue, 03 Nov 2020 23:51:30 -0500
X-MC-Unique: maGUCr2INZKC-8hmwcHBnQ-1
Received: by mail-wr1-f72.google.com with SMTP id t14so8789124wrs.2
 for <qemu-devel@nongnu.org>; Tue, 03 Nov 2020 20:51:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CO5kV6TOgl7VkllXO+Cj7QHVQ3FQj45OIYdaYC1hBZU=;
 b=bNI64ZUKfYQFMRwJbfhl1PxS/iYjEUiJkZCTzhJZax8Cc6D4cEIHnV7ilEcYG2pmNt
 HOsKwK0mXkX4f04sTcbdptq7mV+BK44kEG8ipH43KnCFBSXhmqvyUmhhiMC3WNGUflO9
 fJjq6aXXcpHv3TmaBWX00j9N/Mk27BliKDZvTYHCyC02afF6k+78xKd0uMwoBJJr5QBa
 KJm6wrHHxz0IfUp8lFAW/bG2N/R+uYR4DAIuOYjpXHFIzcAF/Tdi9G5PuxpST9IrziDt
 OsMWw4pZ/yvy5uhQnOM7ryn+QOmNk9VAWpSIUjxAk14pPlHNTcfW7piMqqHmmtmjI0yA
 LKnQ==
X-Gm-Message-State: AOAM530oRd1do1TOQcXuy3ohFxY/fwhWMCxGRqj+HvKfohWa7yUblLWC
 MFTYTrWqTqEm9RqCiQs0fps8BlWwoH0k8eYhTz4+ADLTHZ5M6PF4LujHB7LsGluLbYu1o5rTE38
 ry2+MQubDqkwDRl0=
X-Received: by 2002:adf:fb0f:: with SMTP id c15mr28598133wrr.86.1604465488159; 
 Tue, 03 Nov 2020 20:51:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwRZPLaryJFJHgZvyaU93cZcFvJtW3aI4hv8+EdSZMLKtsAUr6L2VfA3B/J0sMJZrQFpRpAJw==
X-Received: by 2002:adf:fb0f:: with SMTP id c15mr28598127wrr.86.1604465488045; 
 Tue, 03 Nov 2020 20:51:28 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id b14sm907479wrx.35.2020.11.03.20.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 20:51:27 -0800 (PST)
Date: Tue, 3 Nov 2020 23:51:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 16/38] virtio-iommu: Call memory notifiers in attach/detach
Message-ID: <20201104044937.226370-17-mst@redhat.com>
References: <20201104044937.226370-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201104044937.226370-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 22:09:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Bharat Bhushan <bbhushan2@marvell.com>, Eric Auger <eric.auger@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bharat Bhushan <bbhushan2@marvell.com>

Call the memory notifiers when attaching an endpoint to a domain, to
replay existing mappings, and when detaching the endpoint, to remove all
mappings.

Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Message-Id: <20201030180510.747225-5-jean-philippe@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-iommu.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 7dd15c5eac..7b64892351 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -170,11 +170,39 @@ static void virtio_iommu_notify_unmap(IOMMUMemoryRegion *mr, hwaddr virt_start,
     memory_region_notify_iommu(mr, 0, entry);
 }
 
+static gboolean virtio_iommu_notify_unmap_cb(gpointer key, gpointer value,
+                                             gpointer data)
+{
+    VirtIOIOMMUInterval *interval = (VirtIOIOMMUInterval *) key;
+    IOMMUMemoryRegion *mr = (IOMMUMemoryRegion *) data;
+
+    virtio_iommu_notify_unmap(mr, interval->low, interval->high);
+
+    return false;
+}
+
+static gboolean virtio_iommu_notify_map_cb(gpointer key, gpointer value,
+                                           gpointer data)
+{
+    VirtIOIOMMUMapping *mapping = (VirtIOIOMMUMapping *) value;
+    VirtIOIOMMUInterval *interval = (VirtIOIOMMUInterval *) key;
+    IOMMUMemoryRegion *mr = (IOMMUMemoryRegion *) data;
+
+    virtio_iommu_notify_map(mr, interval->low, interval->high,
+                            mapping->phys_addr, mapping->flags);
+
+    return false;
+}
+
 static void virtio_iommu_detach_endpoint_from_domain(VirtIOIOMMUEndpoint *ep)
 {
+    VirtIOIOMMUDomain *domain = ep->domain;
+
     if (!ep->domain) {
         return;
     }
+    g_tree_foreach(domain->mappings, virtio_iommu_notify_unmap_cb,
+                   ep->iommu_mr);
     QLIST_REMOVE(ep, next);
     ep->domain = NULL;
 }
@@ -317,6 +345,10 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
 
     ep->domain = domain;
 
+    /* Replay domain mappings on the associated memory region */
+    g_tree_foreach(domain->mappings, virtio_iommu_notify_map_cb,
+                   ep->iommu_mr);
+
     return VIRTIO_IOMMU_S_OK;
 }
 
-- 
MST


