Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B162FE874
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 12:13:07 +0100 (CET)
Received: from localhost ([::1]:48094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Xti-0005dS-Iw
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 06:13:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l2Xnq-0006fi-RA
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 06:07:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l2Xnp-0006oW-3U
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 06:07:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611227220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mWEw3+5k7i3rGOT+RAkM8dvXGyIW//mZaV3sM6Sli0E=;
 b=HVaEdeA+u4/5hglNoww89y8pK3JHeSV+V23SV4DJUtFIgkK23Qt9wis2sn+5Zcg05iqtnj
 i6ZxANWV30hzL9kjZox6Inn/1HuOsCbS3pzq1D7GVNhKNqtwdCFaPOzlWhDmOlRQyaBxf2
 Tm+Hsv+tVTo1QEUTBDPrP7inzTf8rL8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-AtYIAb-5OBmNdBpdh8-ZHg-1; Thu, 21 Jan 2021 06:06:56 -0500
X-MC-Unique: AtYIAb-5OBmNdBpdh8-ZHg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8478E107ACF5;
 Thu, 21 Jan 2021 11:06:55 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-70.ams2.redhat.com [10.36.115.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 07FF810013BD;
 Thu, 21 Jan 2021 11:06:46 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 05/11] vfio: Query and store the maximum number of possible
 DMA mappings
Date: Thu, 21 Jan 2021 12:05:34 +0100
Message-Id: <20210121110540.33704-6-david@redhat.com>
In-Reply-To: <20210121110540.33704-1-david@redhat.com>
References: <20210121110540.33704-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's query the maximum number of possible DMA mappings by querying the
available mappings when creating the container (before any mappings are
created). We'll use this informaton soon to perform some sanity checks
and warn the user.

Reviewed-by: Alex Williamson <alex.williamson@redhat.com>
Acked-by: Alex Williamson <alex.williamson@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Auger Eric <eric.auger@redhat.com>
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
Cc: teawater <teawaterz@linux.alibaba.com>
Cc: Marek Kedzierski <mkedzier@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/vfio/common.c              | 4 ++++
 include/hw/vfio/vfio-common.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index f68370de6c..78be813a53 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1937,6 +1937,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     container->fd = fd;
     container->error = NULL;
     container->dirty_pages_supported = false;
+    container->dma_max_mappings = 0;
     QLIST_INIT(&container->giommu_list);
     QLIST_INIT(&container->hostwin_list);
     QLIST_INIT(&container->vrdl_list);
@@ -1968,7 +1969,10 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
         vfio_host_win_add(container, 0, (hwaddr)-1, info->iova_pgsizes);
         container->pgsizes = info->iova_pgsizes;
 
+        /* The default in the kernel ("dma_entry_limit") is 65535. */
+        container->dma_max_mappings = 65535;
         if (!ret) {
+            vfio_get_info_dma_avail(info, &container->dma_max_mappings);
             vfio_get_iommu_info_migration(container, info);
         }
         g_free(info);
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index af6f8d1b22..4b28c6e8ac 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -88,6 +88,7 @@ typedef struct VFIOContainer {
     uint64_t dirty_pgsizes;
     uint64_t max_dirty_bitmap_size;
     unsigned long pgsizes;
+    unsigned int dma_max_mappings;
     QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
     QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
     QLIST_HEAD(, VFIOGroup) group_list;
-- 
2.29.2


