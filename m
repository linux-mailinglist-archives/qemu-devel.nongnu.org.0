Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B642ED0F3
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 14:41:47 +0100 (CET)
Received: from localhost ([::1]:56654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxVXu-00020g-Dp
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 08:41:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kxVT4-0005mD-9K
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 08:36:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kxVSl-0004cE-Jm
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 08:36:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610026586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/8PKGC0beMkcQTTfQzgN0oTseHZB9CI8DIQMmrEErgI=;
 b=I+zmYzCGoBHF/vH2YSaQxOeYFg8Hq1riTrKhDSab7afiyDfEgwuLulXpVF+WFhUCqyyBhe
 CS3qgreelZSSfEs1MMfNqzu1y2+sr4RMdW2CFsRB6QfBSpvaeZgsthfxuUUjNtbWhmIbmm
 xyKV0Zn1zYzUVCcTUCP0gPd2LyriI4I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-CkpOLo_YMOyyMbFJhUUxBA-1; Thu, 07 Jan 2021 08:36:22 -0500
X-MC-Unique: CkpOLo_YMOyyMbFJhUUxBA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F30818C89D9;
 Thu,  7 Jan 2021 13:36:21 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-161.ams2.redhat.com [10.36.114.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21F0A71C82;
 Thu,  7 Jan 2021 13:36:03 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/11] vfio: Support for RamDiscardMgr in the vIOMMU case
Date: Thu,  7 Jan 2021 14:34:19 +0100
Message-Id: <20210107133423.44964-8-david@redhat.com>
In-Reply-To: <20210107133423.44964-1-david@redhat.com>
References: <20210107133423.44964-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
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

vIOMMU support works already with RamDiscardMgr as long as guests only
map populated memory. Both, populated and discarded memory is mapped
into &address_space_memory, where vfio_get_xlat_addr() will find that
memory, to create the vfio mapping.

Sane guests will never map discarded memory (e.g., unplugged memory
blocks in virtio-mem) into an IOMMU - or keep it mapped into an IOMMU while
memory is getting discarded. However, there are two cases where a malicious
guests could trigger pinning of more memory than intended.

One case is easy to handle: the guest trying to map discarded memory
into an IOMMU.

The other case is harder to handle: the guest keeping memory mapped in
the IOMMU while it is getting discarded. We would have to walk over all
mappings when discarding memory and identify if any mapping would be a
violation. Let's keep it simple for now and print a warning, indicating
that setting RLIMIT_MEMLOCK can mitigate such attacks.

We have to take care of incoming migration: at the point the
IOMMUs get restored and start creating mappings in vfio, RamDiscardMgr
implementations might not be back up and running yet. Let's rely on the
runstate. An alternative would be using vmstate priorities - but current
handling is cleaner and more obvious.

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
 hw/vfio/common.c            | 35 +++++++++++++++++++++++++++++++++++
 hw/virtio/virtio-mem.c      |  1 +
 include/migration/vmstate.h |  1 +
 3 files changed, 37 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index bc20f738ce..2b9ba3f8c9 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -36,6 +36,7 @@
 #include "qemu/range.h"
 #include "sysemu/kvm.h"
 #include "sysemu/reset.h"
+#include "sysemu/runstate.h"
 #include "trace.h"
 #include "qapi/error.h"
 #include "migration/migration.h"
@@ -574,6 +575,40 @@ static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
         error_report("iommu map to non memory area %"HWADDR_PRIx"",
                      xlat);
         return false;
+    } else if (memory_region_has_ram_discard_mgr(mr)) {
+        RamDiscardMgr *rdm = memory_region_get_ram_discard_mgr(mr);
+        RamDiscardMgrClass *rdmc = RAM_DISCARD_MGR_GET_CLASS(rdm);
+
+        /*
+         * Malicious VMs can map memory into the IOMMU, which is expected
+         * to remain discarded. vfio will pin all pages, populating memory.
+         * Disallow that. vmstate priorities make sure any RamDiscardMgr were
+         * already restored before IOMMUs are restored.
+         */
+        if (!rdmc->is_populated(rdm, mr, xlat, len)) {
+            error_report("iommu map to discarded memory (e.g., unplugged via"
+                         " virtio-mem): %"HWADDR_PRIx"",
+                         iotlb->translated_addr);
+            return false;
+        }
+
+        /*
+         * Malicious VMs might trigger discarding of IOMMU-mapped memory. The
+         * pages will remain pinned inside vfio until unmapped, resulting in a
+         * higher memory consumption than expected. If memory would get
+         * populated again later, there would be an inconsistency between pages
+         * pinned by vfio and pages seen by QEMU. This is the case until
+         * unmapped from the IOMMU (e.g., during device reset).
+         *
+         * With malicious guests, we really only care about pinning more memory
+         * than expected. RLIMIT_MEMLOCK set for the user/process can never be
+         * exceeded and can be used to mitigate this problem.
+         */
+        warn_report_once("Using vfio with vIOMMUs and coordinated discarding of"
+                         " RAM (e.g., virtio-mem) works, however, malicious"
+                         " guests can trigger pinning of more memory than"
+                         " intended via an IOMMU. It's possible to mitigate "
+                         " by setting/adjusting RLIMIT_MEMLOCK.");
     }
 
     /*
diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index 6200813bb8..f419a758f3 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -871,6 +871,7 @@ static const VMStateDescription vmstate_virtio_mem_device = {
     .name = "virtio-mem-device",
     .minimum_version_id = 1,
     .version_id = 1,
+    .priority = MIG_PRI_VIRTIO_MEM,
     .post_load = virtio_mem_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_WITH_TMP(VirtIOMEM, VirtIOMEMMigSanityChecks,
diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index 075ee80096..3bf58ff043 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -153,6 +153,7 @@ typedef enum {
     MIG_PRI_DEFAULT = 0,
     MIG_PRI_IOMMU,              /* Must happen before PCI devices */
     MIG_PRI_PCI_BUS,            /* Must happen before IOMMU */
+    MIG_PRI_VIRTIO_MEM,         /* Must happen before IOMMU */
     MIG_PRI_GICV3_ITS,          /* Must happen before PCI devices */
     MIG_PRI_GICV3,              /* Must happen before the ITS */
     MIG_PRI_MAX,
-- 
2.29.2


