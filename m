Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DCB3C1AB1
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 22:47:48 +0200 (CEST)
Received: from localhost ([::1]:53974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1avz-00043Q-LE
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 16:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m1aA0-0007Sz-2N
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:58:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m1a9x-0002i4-V7
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:58:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625774289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2+8IfqQN0CCqbn+cyAHI5vCXe7BGvi3hH9f/m9ZiP5M=;
 b=TUQN1HgwhrHRmwvNphCyojqO2zuYT6B7ufBlSY32MohCDUOjl8n11wkx6k1G/KFtP1gLgy
 zDvU47NguH3N/JB9D87zKT24s23Z69F07qgthgX2EEuJe2MY+9Z+fJ4ONFZIJsX6E0Njpx
 msScu/gO3d10+ggXTDOqUvMBAUZ5Qrw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-vrprVoINPeq2R6AZcJf-Bw-1; Thu, 08 Jul 2021 15:58:04 -0400
X-MC-Unique: vrprVoINPeq2R6AZcJf-Bw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 359A9824F8D;
 Thu,  8 Jul 2021 19:57:46 +0000 (UTC)
Received: from localhost (unknown [10.22.8.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D649960C13;
 Thu,  8 Jul 2021 19:57:45 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL v2 11/15] vfio: Support for RamDiscardManager in the vIOMMU case
Date: Thu,  8 Jul 2021 15:55:48 -0400
Message-Id: <20210708195552.2730970-12-ehabkost@redhat.com>
In-Reply-To: <20210708195552.2730970-1-ehabkost@redhat.com>
References: <20210708195552.2730970-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

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
Message-Id: <20210413095531.25603-10-david@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/migration/vmstate.h |  1 +
 hw/vfio/common.c            | 39 +++++++++++++++++++++++++++++++++++++
 hw/virtio/virtio-mem.c      |  1 +
 3 files changed, 41 insertions(+)

diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index 8df7b69f389..017c03675ca 100644
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
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index f8a2fe8441a..8a9bbf27918 100644
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
@@ -569,6 +570,44 @@ static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
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
index f60cb8a3fc0..368ae1db903 100644
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
-- 
2.31.1


