Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FAD323A15
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 11:02:13 +0100 (CET)
Received: from localhost ([::1]:33806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEqzk-0004ng-Ab
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 05:02:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lEqpA-00031h-DM
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 04:51:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lEqp6-0007sZ-Ux
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 04:51:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614160272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2cYpr5y6IMHquQU/MKyo34cDlpHwjTVoCXSqUgQUYDY=;
 b=aSPFQ4ZC0/anQ0qEo1z78SGamvl7vNYiYMnBn46IF/zZhbIMTBCRSGapjjpzz+iJYYU7Oc
 wqOXBeXT6TL5fGHreNrSh8P2SfSra6VA01qas6pfLpANnKYsP3L9pioiABdBI05cl0sE51
 BDPvhH7nm2sYt832O19I+Adr5TptiQM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-zfe32JHlPTmAYpBlmIeffQ-1; Wed, 24 Feb 2021 04:51:09 -0500
X-MC-Unique: zfe32JHlPTmAYpBlmIeffQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1CA8100A8FF;
 Wed, 24 Feb 2021 09:51:08 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-83.ams2.redhat.com [10.36.114.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1844722CE;
 Wed, 24 Feb 2021 09:50:57 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 09/13] vfio: Support for RamDiscardManager in the vIOMMU
 case
Date: Wed, 24 Feb 2021 10:49:05 +0100
Message-Id: <20210224094910.44986-10-david@redhat.com>
In-Reply-To: <20210224094910.44986-1-david@redhat.com>
References: <20210224094910.44986-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vIOMMU support works already with RamDiscardManager as long as guests only
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
IOMMUs get restored and start creating mappings in vfio, RamDiscardManager
implementations might not be back up and running yet: let's add runstate
priorities to enforce the order when restoring.

Acked-by: Alex Williamson <alex.williamson@redhat.com>
Reviewed-by: Alex Williamson <alex.williamson@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
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
 hw/vfio/common.c            | 39 +++++++++++++++++++++++++++++++++++++
 hw/virtio/virtio-mem.c      |  1 +
 include/migration/vmstate.h |  1 +
 3 files changed, 41 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 66091fd306..765b9be9b6 100644
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
@@ -574,6 +575,44 @@ static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
         error_report("iommu map to non memory area %"HWADDR_PRIx"",
                      xlat);
         return false;
+    } else if (memory_region_has_ram_discard_manager(mr)) {
+        RamDiscardManager *rdm = memory_region_get_ram_discard_manager(mr);
+        MemoryRegionSection tmp = {
+            .mr = mr,
+            .offset_within_region = xlat,
+            .size = int128_make64(len),
+        };
+
+        /*
+         * Malicious VMs can map memory into the IOMMU, which is expected
+         * to remain discarded. vfio will pin all pages, populating memory.
+         * Disallow that. vmstate priorities make sure any RamDiscardManager
+         * were already restored before IOMMUs are restored.
+         */
+        if (!ram_discard_manager_is_populated(rdm, &tmp)) {
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
index e209b56057..cbd07fc9f1 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -886,6 +886,7 @@ static const VMStateDescription vmstate_virtio_mem_device = {
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


