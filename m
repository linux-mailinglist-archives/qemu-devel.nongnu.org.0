Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6E620AD36
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 09:34:22 +0200 (CEST)
Received: from localhost ([::1]:59756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joisO-0008DD-Pn
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 03:34:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1joijG-0001lE-JD
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 03:24:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29908
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1joijD-0003r8-QK
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 03:24:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593156291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QV/i1z2MdoLcEveXzKrfJK9Ga4VeN9xqfQfrvYILfX0=;
 b=MYK9NZhlcBM64mhuN4WuQUJ2k0MfDOPI/E3Rko51HRPjvYqmtd3kT/e76pLw18Pir3ax2B
 1smdG4NSRh/98DKT4sALmScDPzOdfgLGIP+yKot+tDjfx/KQ8c7kBGm5O1xEQEWO0ztcds
 D3kjLuAYouwcq9fmuDSSBJmexat3Vx4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-O7EhWTsyPK-tQ04PiLPOCA-1; Fri, 26 Jun 2020 03:24:49 -0400
X-MC-Unique: O7EhWTsyPK-tQ04PiLPOCA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BCD2464;
 Fri, 26 Jun 2020 07:24:48 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-35.ams2.redhat.com [10.36.113.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 469247C1FB;
 Fri, 26 Jun 2020 07:24:46 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 18/21] virtio-mem: Migration sanity checks
Date: Fri, 26 Jun 2020 09:22:45 +0200
Message-Id: <20200626072248.78761-19-david@redhat.com>
In-Reply-To: <20200626072248.78761-1-david@redhat.com>
References: <20200626072248.78761-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=207.211.31.120; envelope-from=david@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 01:49:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to make sure that certain properties don't change during
migration, especially to catch user errors in a nice way. Let's migrate
a temporary structure and validate that the properties didn't change.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/virtio-mem.c | 70 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index 2df33f9125..6ed5409669 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -519,12 +519,82 @@ static int virtio_mem_post_load(void *opaque, int version_id)
     return virtio_mem_restore_unplugged(VIRTIO_MEM(opaque));
 }
 
+typedef struct VirtIOMEMMigSanityChecks {
+    VirtIOMEM *parent;
+    uint64_t addr;
+    uint64_t region_size;
+    uint64_t block_size;
+    uint32_t node;
+} VirtIOMEMMigSanityChecks;
+
+static int virtio_mem_mig_sanity_checks_pre_save(void *opaque)
+{
+    VirtIOMEMMigSanityChecks *tmp = opaque;
+    VirtIOMEM *vmem = tmp->parent;
+
+    tmp->addr = vmem->addr;
+    tmp->region_size = memory_region_size(&vmem->memdev->mr);
+    tmp->block_size = vmem->block_size;
+    tmp->node = vmem->node;
+    return 0;
+}
+
+static int virtio_mem_mig_sanity_checks_post_load(void *opaque, int version_id)
+{
+    VirtIOMEMMigSanityChecks *tmp = opaque;
+    VirtIOMEM *vmem = tmp->parent;
+    const uint64_t new_region_size = memory_region_size(&vmem->memdev->mr);
+
+    if (tmp->addr != vmem->addr) {
+        error_report("Property '%s' changed from 0x%" PRIx64 " to 0x%" PRIx64,
+                     VIRTIO_MEM_ADDR_PROP, tmp->addr, vmem->addr);
+        return -EINVAL;
+    }
+    /*
+     * Note: Preparation for resizeable memory regions. The maximum size
+     * of the memory region must not change during migration.
+     */
+    if (tmp->region_size != new_region_size) {
+        error_report("Property '%s' size changed from 0x%" PRIx64 " to 0x%"
+                     PRIx64, VIRTIO_MEM_MEMDEV_PROP, tmp->region_size,
+                     new_region_size);
+        return -EINVAL;
+    }
+    if (tmp->block_size != vmem->block_size) {
+        error_report("Property '%s' changed from 0x%" PRIx64 " to 0x%" PRIx64,
+                     VIRTIO_MEM_BLOCK_SIZE_PROP, tmp->block_size,
+                     vmem->block_size);
+        return -EINVAL;
+    }
+    if (tmp->node != vmem->node) {
+        error_report("Property '%s' changed from %" PRIu32 " to %" PRIu32,
+                     VIRTIO_MEM_NODE_PROP, tmp->node, vmem->node);
+        return -EINVAL;
+    }
+    return 0;
+}
+
+static const VMStateDescription vmstate_virtio_mem_sanity_checks = {
+    .name = "virtio-mem-device/sanity-checks",
+    .pre_save = virtio_mem_mig_sanity_checks_pre_save,
+    .post_load = virtio_mem_mig_sanity_checks_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(addr, VirtIOMEMMigSanityChecks),
+        VMSTATE_UINT64(region_size, VirtIOMEMMigSanityChecks),
+        VMSTATE_UINT64(block_size, VirtIOMEMMigSanityChecks),
+        VMSTATE_UINT32(node, VirtIOMEMMigSanityChecks),
+        VMSTATE_END_OF_LIST(),
+    },
+};
+
 static const VMStateDescription vmstate_virtio_mem_device = {
     .name = "virtio-mem-device",
     .minimum_version_id = 1,
     .version_id = 1,
     .post_load = virtio_mem_post_load,
     .fields = (VMStateField[]) {
+        VMSTATE_WITH_TMP(VirtIOMEM, VirtIOMEMMigSanityChecks,
+                         vmstate_virtio_mem_sanity_checks),
         VMSTATE_UINT64(usable_region_size, VirtIOMEM),
         VMSTATE_UINT64(size, VirtIOMEM),
         VMSTATE_UINT64(requested_size, VirtIOMEM),
-- 
2.26.2


