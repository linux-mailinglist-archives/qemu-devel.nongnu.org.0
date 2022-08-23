Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C58E59EAF4
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 20:27:47 +0200 (CEST)
Received: from localhost ([::1]:48990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQYcs-0005Wk-4B
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 14:27:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQYVu-0005HW-DX
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 14:20:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQYVf-00032a-8l
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 14:20:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661278818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PKFdaN2tkUi5mrhylR6MDQmGbp3hAyCJTgJURDlH6rQ=;
 b=VvUY3mVoKMlL3o2PWIIDCzbjYhdODGV0E8MwbQncStFWupmxPQOUFVsEH0B2QtglODFxVb
 BOO/C2vi9bJJH22U0In4uNYGSkEk8pz9h/EyuhfaxhpOpzwIAUp8c1wrKPYa+AAosuOzoi
 zuywjjANyx0vSml3I7qw6pJJph5ZeK8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-XDA0a584Ml-8CWUBQngS5g-1; Tue, 23 Aug 2022 14:20:16 -0400
X-MC-Unique: XDA0a584Ml-8CWUBQngS5g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CF9B85A58B;
 Tue, 23 Aug 2022 18:20:16 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AA0904010D2A;
 Tue, 23 Aug 2022 18:20:14 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Lei Yang <leiyang@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2 2/7] vdpa: do not save failed dma maps in SVQ iova tree
Date: Tue, 23 Aug 2022 20:20:03 +0200
Message-Id: <20220823182008.97141-3-eperezma@redhat.com>
In-Reply-To: <20220823182008.97141-1-eperezma@redhat.com>
References: <20220823182008.97141-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

If a map fails for whatever reason, it must not be saved in the tree.
Otherwise, qemu will try to unmap it in cleanup, leaving to more errors.

Fixes: 34e3c94eda ("vdpa: Add custom IOTLB translations to SVQ")
Reported-by: Lei Yang <leiyang@redhat.com>
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 983d3697b0..7e28d2f674 100644
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
2.31.1


