Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F1B6AF291
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:54:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZcQu-0002qS-0q; Tue, 07 Mar 2023 13:53:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pZcQr-0002px-Av
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:53:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pZcQp-0002Ru-Nl
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:53:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678215183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nOyaqTinm0bxnMy6KGLDs0ByGxFENSRFLdipnmmg0A4=;
 b=UKT3xj1IE0iHc/VyRrZxG1Ow1zLEWiWDXIVAxTWH3AUufuQhhJDvkwkE9rWLJQPZ8icjh0
 iScp5wGBzhdrYm2MwTV/z9y/xqA+IEzODxW5N0zln5fzSYg8h0YKNAmStDlbuPU+/5bMKA
 ThsNSg4s7OVxMgfeKLsegvrlo5eGT8E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-CRw1o4jiPCiy33itl7ukKA-1; Tue, 07 Mar 2023 13:52:59 -0500
X-MC-Unique: CRw1o4jiPCiy33itl7ukKA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A832858F09;
 Tue,  7 Mar 2023 18:52:59 +0000 (UTC)
Received: from [172.30.41.16] (unknown [10.22.16.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3F094029A7A;
 Tue,  7 Mar 2023 18:52:58 +0000 (UTC)
Subject: [PULL 07/17] vfio/common: Consolidate skip/invalid section into helper
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com, avihaih@nvidia.com, clg@redhat.com,
 joao.m.martins@oracle.com
Date: Tue, 07 Mar 2023 11:52:58 -0700
Message-ID: <167821517842.619792.8405486677850724595.stgit@omen>
In-Reply-To: <167821508699.619792.1719671327865445814.stgit@omen>
References: <167821508699.619792.1719671327865445814.stgit@omen>
User-Agent: StGit/1.5.dev2+g9ce680a52bd9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
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

From: Joao Martins <joao.m.martins@oracle.com>

The checks are replicated against region_add and region_del
and will be soon added in another memory listener dedicated
for dirty tracking.

Move these into a new helper for avoid duplication.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Avihai Horon <avihaih@nvidia.com>
Link: https://lore.kernel.org/r/20230307125450.62409-8-joao.m.martins@oracle.com
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/common.c |   55 +++++++++++++++++++++++-------------------------------
 1 file changed, 23 insertions(+), 32 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 1cb62efa9743..d38b7c1969b9 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -933,23 +933,15 @@ static bool vfio_known_safe_misalignment(MemoryRegionSection *section)
     return true;
 }
 
-static void vfio_listener_region_add(MemoryListener *listener,
-                                     MemoryRegionSection *section)
+static bool vfio_listener_valid_section(MemoryRegionSection *section,
+                                        const char *name)
 {
-    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
-    hwaddr iova, end;
-    Int128 llend, llsize;
-    void *vaddr;
-    int ret;
-    VFIOHostDMAWindow *hostwin;
-    Error *err = NULL;
-
     if (vfio_listener_skipped_section(section)) {
-        trace_vfio_listener_region_skip("region_add",
+        trace_vfio_listener_region_skip(name,
                 section->offset_within_address_space,
                 section->offset_within_address_space +
                 int128_get64(int128_sub(section->size, int128_one())));
-        return;
+        return false;
     }
 
     if (unlikely((section->offset_within_address_space &
@@ -964,6 +956,24 @@ static void vfio_listener_region_add(MemoryListener *listener,
                          section->offset_within_region,
                          qemu_real_host_page_size());
         }
+        return false;
+    }
+
+    return true;
+}
+
+static void vfio_listener_region_add(MemoryListener *listener,
+                                     MemoryRegionSection *section)
+{
+    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
+    hwaddr iova, end;
+    Int128 llend, llsize;
+    void *vaddr;
+    int ret;
+    VFIOHostDMAWindow *hostwin;
+    Error *err = NULL;
+
+    if (!vfio_listener_valid_section(section, "region_add")) {
         return;
     }
 
@@ -1182,26 +1192,7 @@ static void vfio_listener_region_del(MemoryListener *listener,
     int ret;
     bool try_unmap = true;
 
-    if (vfio_listener_skipped_section(section)) {
-        trace_vfio_listener_region_skip("region_del",
-                section->offset_within_address_space,
-                section->offset_within_address_space +
-                int128_get64(int128_sub(section->size, int128_one())));
-        return;
-    }
-
-    if (unlikely((section->offset_within_address_space &
-                  ~qemu_real_host_page_mask()) !=
-                 (section->offset_within_region & ~qemu_real_host_page_mask()))) {
-        if (!vfio_known_safe_misalignment(section)) {
-            error_report("%s received unaligned region %s iova=0x%"PRIx64
-                         " offset_within_region=0x%"PRIx64
-                         " qemu_real_host_page_size=0x%"PRIxPTR,
-                         __func__, memory_region_name(section->mr),
-                         section->offset_within_address_space,
-                         section->offset_within_region,
-                         qemu_real_host_page_size());
-        }
+    if (!vfio_listener_valid_section(section, "region_del")) {
         return;
     }
 



