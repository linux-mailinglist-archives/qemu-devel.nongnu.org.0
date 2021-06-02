Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E149A39846A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 10:42:33 +0200 (CEST)
Received: from localhost ([::1]:53706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loMSP-00080K-0d
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 04:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1loMRL-0006NR-2H
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 04:41:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1loMRJ-0003fm-HY
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 04:41:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622623284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eAYC3tJKs+qL04BDfVKy+xILBP58PJDFLvNSXkSRuJQ=;
 b=LDZmtAg+72yTNzPi6WC+SyVR6PeVofThk/GQWpY9hsJbJ3MQMRuN7hdPY2mN1ejQjvF/oH
 qOAF3Ij/0Ezze1rdVZuk+u+OSO7KkWHD7yCngERdnZ8gEvpMaREK1wRwnJmY93Pm2bBe/9
 NrhjbnBdZa1nV+4S5E5ZAE4RrPS9oBI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-fTy7F-fkP7iIJ-IghieAoQ-1; Wed, 02 Jun 2021 04:41:23 -0400
X-MC-Unique: fTy7F-fkP7iIJ-IghieAoQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5090F8042B7;
 Wed,  2 Jun 2021 08:41:22 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-208.pek2.redhat.com
 [10.72.12.208])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 103E85C6DE;
 Wed,  2 Jun 2021 08:41:14 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH V2 1/2] vhost-vdpa: skip ram device from the IOTLB mapping
Date: Wed,  2 Jun 2021 16:41:05 +0800
Message-Id: <20210602084106.43186-2-jasowang@redhat.com>
In-Reply-To: <20210602084106.43186-1-jasowang@redhat.com>
References: <20210602084106.43186-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: si-wei.liu@oracle.com, elic@nvidia.com, lingshan.zhu@intel.com,
 Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vDPA is not tie to any specific hardware, for safety and simplicity,
vhost-vDPA doesn't allow MMIO area to be mapped via IOTLB. Only the
doorbell could be mapped via mmap(). So this patch exclude skip the
ram device from the IOTLB mapping.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 01d2101d09..dd4321bac2 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -27,6 +27,8 @@ static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section)
 {
     return (!memory_region_is_ram(section->mr) &&
             !memory_region_is_iommu(section->mr)) ||
+           /* vhost-vDPA doesn't allow MMIO to be mapped  */
+            memory_region_is_ram_device(section->mr) ||
            /*
             * Sizing an enabled 64-bit BAR can cause spurious mappings to
             * addresses in the upper part of the 64-bit address space.  These
@@ -171,22 +173,12 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
                              vaddr, section->readonly);
     if (ret) {
         error_report("vhost vdpa map fail!");
-        if (memory_region_is_ram_device(section->mr)) {
-            /* Allow unexpected mappings not to be fatal for RAM devices */
-            error_report("map ram fail!");
-          return ;
-        }
         goto fail;
     }
 
     return;
 
 fail:
-    if (memory_region_is_ram_device(section->mr)) {
-        error_report("failed to vdpa_dma_map. pci p2p may not work");
-        return;
-
-    }
     /*
      * On the initfn path, store the first error in the container so we
      * can gracefully fail.  Runtime, there's not much we can do other
-- 
2.25.1


