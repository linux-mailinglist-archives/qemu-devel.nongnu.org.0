Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6C62A48CF
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Nov 2020 15:59:27 +0100 (CET)
Received: from localhost ([::1]:33436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZxmQ-0002SS-KO
	for lists+qemu-devel@lfdr.de; Tue, 03 Nov 2020 09:59:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kZxRr-00006D-1L
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 09:38:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kZxRo-0007fw-Vv
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 09:38:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604414287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CO5kV6TOgl7VkllXO+Cj7QHVQ3FQj45OIYdaYC1hBZU=;
 b=Frw3ouKuBlR5IGlKInQb8KoGK1l+6PvhzhztT3mc068BBH/ovMZc2jUsfIXva2dgBwlU/a
 z5fzJiJiS8jop9tRyF8eEkDjGrwAaKz39g2HtIrJoxYERGKy+I48t1jqYtDSZ1BJx6+OYO
 1MlQMEYTbTtcxR3O205WjKOdNlcxWZc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-8L66t7TsMPqQDZ3wA5TVaw-1; Tue, 03 Nov 2020 09:34:47 -0500
X-MC-Unique: 8L66t7TsMPqQDZ3wA5TVaw-1
Received: by mail-wm1-f72.google.com with SMTP id z7so4670466wme.8
 for <qemu-devel@nongnu.org>; Tue, 03 Nov 2020 06:34:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CO5kV6TOgl7VkllXO+Cj7QHVQ3FQj45OIYdaYC1hBZU=;
 b=S4oALmZ9jlwfJkGejh8lypY6Vp4dLu8ZnGdDjQ4CTjWyD/wEAue0F5MZ/iEJyLBkDu
 lx87rCWpdVTFvuG5k215zmkvTZBSyeOeK+GQE7IUhOviCcn1sq0cmxDjfNbw6HRvkNhT
 XyWphVrAdKZa0Rpm6AYuuo+0JPK07g0qOiItcL1KilLUZwAgelUpZkJ7Jaa3VYrVMNO/
 JUHoE5lWu58Wi99SsvnhhpE7j9jvoc4Nf+xxkUsr1dU/83efkOgglNaF9N3c+LzQ1z1m
 ADGCo19Z/hjBLLytDYnfXFRioeFfnHOWNGTonISvIXAP1l3fUUd2vdLRZ32ZPkWSjx5l
 kBHA==
X-Gm-Message-State: AOAM531M1KdUIz+b+/gKmjfK//QGb58XswmoLyr3LmjwhvqMlNlNnIin
 M6wjf5pGwqqfhVVDUs4ef42EU2jw777ySsB4oUwTHo/5W+v90FaTrdVRJX1aE7Zd86Z/H/64ypW
 m7hcoVziUTrPBso8=
X-Received: by 2002:adf:f20e:: with SMTP id p14mr25733376wro.376.1604414085441; 
 Tue, 03 Nov 2020 06:34:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJycKFIn+1p6nKCuBF+jY+mIK8n0wzysbh//uAD9L6WzpSfxSpZC4bfThjDva8j9aRcovolh4w==
X-Received: by 2002:adf:f20e:: with SMTP id p14mr25733358wro.376.1604414085239; 
 Tue, 03 Nov 2020 06:34:45 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id a15sm718229wrn.75.2020.11.03.06.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 06:34:44 -0800 (PST)
Date: Tue, 3 Nov 2020 09:34:42 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/38] virtio-iommu: Call memory notifiers in attach/detach
Message-ID: <20201103142306.71782-17-mst@redhat.com>
References: <20201103142306.71782-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201103142306.71782-1-mst@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 01:02:05
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


