Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D61CA2925FF
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 12:47:13 +0200 (CEST)
Received: from localhost ([::1]:34494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUSh6-00010E-Te
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 06:47:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kUSdK-0006tc-9K
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 06:43:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kUSdH-0000mR-3E
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 06:43:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603104192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EBg7yTumPavB1ZmFZrCmAuxjArpJraj3MHMjrjoNE0Q=;
 b=Jaer5V/TfJauaxFHePUN4brJnH6DT07vs3UX8PbNnXUWTHCUYI0Kq8vWUkvdTN4C5D5ctZ
 rhgow3SFZGTgCv8+4wZXEUYPCFg0wu9XxpKoSUin4gXiuLhBghIOci2HnwKkvyf8PRwbBV
 k/1y3e5D4wnoY7cSh5hPbIDSvwo/d2c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-81fJ3z3AMQu9ScfmZoOjjw-1; Mon, 19 Oct 2020 06:43:10 -0400
X-MC-Unique: 81fJ3z3AMQu9ScfmZoOjjw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C7D48030A6;
 Mon, 19 Oct 2020 10:43:08 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-113-59.ams2.redhat.com [10.36.113.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D1E35577A;
 Mon, 19 Oct 2020 10:43:03 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v2 1/5] memory: Rename memory_region_notify_one to
 memory_region_notify_iommu_one
Date: Mon, 19 Oct 2020 12:42:40 +0200
Message-Id: <20201019104244.21830-2-eperezma@redhat.com>
In-Reply-To: <20201019104244.21830-1-eperezma@redhat.com>
References: <20201019104244.21830-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 01:44:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-ppc@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Avi Kivity <avi@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Previous name didn't reflect the iommu operation.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 include/exec/memory.h | 6 +++---
 hw/arm/smmu-common.c  | 2 +-
 hw/arm/smmuv3.c       | 2 +-
 hw/i386/intel_iommu.c | 4 ++--
 softmmu/memory.c      | 6 +++---
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 622207bde1..ac6bca1ba0 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -221,7 +221,7 @@ enum IOMMUMemoryRegionAttr {
  * The IOMMU implementation must use the IOMMU notifier infrastructure
  * to report whenever mappings are changed, by calling
  * memory_region_notify_iommu() (or, if necessary, by calling
- * memory_region_notify_one() for each registered notifier).
+ * memory_region_notify_iommu_one() for each registered notifier).
  *
  * Conceptually an IOMMU provides a mapping from input address
  * to an output TLB entry. If the IOMMU is aware of memory transaction
@@ -1300,7 +1300,7 @@ void memory_region_notify_iommu(IOMMUMemoryRegion *iommu_mr,
                                 IOMMUTLBEntry entry);
 
 /**
- * memory_region_notify_one: notify a change in an IOMMU translation
+ * memory_region_notify_iommu_one: notify a change in an IOMMU translation
  *                           entry to a single notifier
  *
  * This works just like memory_region_notify_iommu(), but it only
@@ -1311,7 +1311,7 @@ void memory_region_notify_iommu(IOMMUMemoryRegion *iommu_mr,
  *         replaces all old entries for the same virtual I/O address range.
  *         Deleted entries have .@perm == 0.
  */
-void memory_region_notify_one(IOMMUNotifier *notifier,
+void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
                               IOMMUTLBEntry *entry);
 
 /**
diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 3838db1395..88d2c454f0 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -472,7 +472,7 @@ static void smmu_unmap_notifier_range(IOMMUNotifier *n)
     entry.perm = IOMMU_NONE;
     entry.addr_mask = n->end - n->start;
 
-    memory_region_notify_one(n, &entry);
+    memory_region_notify_iommu_one(n, &entry);
 }
 
 /* Unmap all notifiers attached to @mr */
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 0122700e72..0a893ae918 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -827,7 +827,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
     entry.addr_mask = num_pages * (1 << granule) - 1;
     entry.perm = IOMMU_NONE;
 
-    memory_region_notify_one(n, &entry);
+    memory_region_notify_iommu_one(n, &entry);
 }
 
 /* invalidate an asid/iova range tuple in all mr's */
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 749eb6ad63..56bab589d4 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3497,7 +3497,7 @@ static void vtd_address_space_unmap(VTDAddressSpace *as, IOMMUNotifier *n)
         /* This field is meaningless for unmap */
         entry.translated_addr = 0;
 
-        memory_region_notify_one(n, &entry);
+        memory_region_notify_iommu_one(n, &entry);
 
         start += mask;
         remain -= mask;
@@ -3535,7 +3535,7 @@ static void vtd_address_space_refresh_all(IntelIOMMUState *s)
 
 static int vtd_replay_hook(IOMMUTLBEntry *entry, void *private)
 {
-    memory_region_notify_one((IOMMUNotifier *)private, entry);
+    memory_region_notify_iommu_one((IOMMUNotifier *)private, entry);
     return 0;
 }
 
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 403ff3abc9..f37a4569ac 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1905,8 +1905,8 @@ void memory_region_unregister_iommu_notifier(MemoryRegion *mr,
     memory_region_update_iommu_notify_flags(iommu_mr, NULL);
 }
 
-void memory_region_notify_one(IOMMUNotifier *notifier,
-                              IOMMUTLBEntry *entry)
+void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
+                                    IOMMUTLBEntry *entry)
 {
     IOMMUNotifierFlag request_flags;
     hwaddr entry_end = entry->iova + entry->addr_mask;
@@ -1942,7 +1942,7 @@ void memory_region_notify_iommu(IOMMUMemoryRegion *iommu_mr,
 
     IOMMU_NOTIFIER_FOREACH(iommu_notifier, iommu_mr) {
         if (iommu_notifier->iommu_idx == iommu_idx) {
-            memory_region_notify_one(iommu_notifier, &entry);
+            memory_region_notify_iommu_one(iommu_notifier, &entry);
         }
     }
 }
-- 
2.18.1


