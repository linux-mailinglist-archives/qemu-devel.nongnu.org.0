Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A9A5AA84A
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 08:48:28 +0200 (CEST)
Received: from localhost ([::1]:33624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU0Tb-0004Td-6k
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 02:48:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oU0NM-00077i-DA
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 02:42:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oU0NH-0004l8-TB
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 02:41:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662100915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oq3pgxHYD1TAQ56GSAAjvNLpVaC+gsB3rAkBvL0ynnY=;
 b=bk8Jgkve2meQPke23ubkMUQZGdzzl+DL+ZcdrQ3ii6il4MoxoTSdVH+AtPVk9DpDo77J8K
 VvHmYNqK5jPsg0atCZaf3dFnrxVoPOxrzSnZ1N4jJvjDXiAPfIht1Urj4iDPNYi3L7FZnu
 toleiW1VbHMRzwMkECohBAhRRzpRwuk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-LEDBWOV8O62QK4-m0Qk8Cw-1; Fri, 02 Sep 2022 02:41:51 -0400
X-MC-Unique: LEDBWOV8O62QK4-m0Qk8Cw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E2AC800124;
 Fri,  2 Sep 2022 06:41:51 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-152.pek2.redhat.com
 [10.72.12.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1D8B1415137;
 Fri,  2 Sep 2022 06:41:47 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Lei Yang <leiyang@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 02/21] vdpa: do not save failed dma maps in SVQ iova tree
Date: Fri,  2 Sep 2022 14:41:19 +0800
Message-Id: <20220902064138.56468-3-jasowang@redhat.com>
In-Reply-To: <20220902064138.56468-1-jasowang@redhat.com>
References: <20220902064138.56468-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eugenio Pérez <eperezma@redhat.com>

If a map fails for whatever reason, it must not be saved in the tree.
Otherwise, qemu will try to unmap it in cleanup, leaving to more errors.

Fixes: 34e3c94eda ("vdpa: Add custom IOTLB translations to SVQ")
Reported-by: Lei Yang <leiyang@redhat.com>
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 983d369..7e28d2f 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -176,6 +176,7 @@ static void vhost_vdpa_listener_commit(MemoryListener *listener)
 static void vhost_vdpa_listener_region_add(MemoryListener *listener,
                                            MemoryRegionSection *section)
 {
+    DMAMap mem_region = {};
     struct vhost_vdpa *v = container_of(listener, struct vhost_vdpa, listener);
     hwaddr iova;
     Int128 llend, llsize;
@@ -212,13 +213,13 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
 
     llsize = int128_sub(llend, int128_make64(iova));
     if (v->shadow_vqs_enabled) {
-        DMAMap mem_region = {
-            .translated_addr = (hwaddr)(uintptr_t)vaddr,
-            .size = int128_get64(llsize) - 1,
-            .perm = IOMMU_ACCESS_FLAG(true, section->readonly),
-        };
+        int r;
 
-        int r = vhost_iova_tree_map_alloc(v->iova_tree, &mem_region);
+        mem_region.translated_addr = (hwaddr)(uintptr_t)vaddr,
+        mem_region.size = int128_get64(llsize) - 1,
+        mem_region.perm = IOMMU_ACCESS_FLAG(true, section->readonly),
+
+        r = vhost_iova_tree_map_alloc(v->iova_tree, &mem_region);
         if (unlikely(r != IOVA_OK)) {
             error_report("Can't allocate a mapping (%d)", r);
             goto fail;
@@ -232,11 +233,16 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
                              vaddr, section->readonly);
     if (ret) {
         error_report("vhost vdpa map fail!");
-        goto fail;
+        goto fail_map;
     }
 
     return;
 
+fail_map:
+    if (v->shadow_vqs_enabled) {
+        vhost_iova_tree_remove(v->iova_tree, &mem_region);
+    }
+
 fail:
     /*
      * On the initfn path, store the first error in the container so we
-- 
2.7.4


