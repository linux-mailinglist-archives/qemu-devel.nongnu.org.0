Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5924A5FB1E4
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 13:59:00 +0200 (CEST)
Received: from localhost ([::1]:32962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiDuV-0002fi-ET
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 07:58:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oiCiO-0004r7-7z
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:42:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oiCiM-0007pe-An
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:42:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JjLZSMxDoJzukfhronBWmF9VBo9r0DM5fgqfGZCuCT8=;
 b=eBT3NtbRWIWau6gBcbXn1I8EBLdBADmOCXX0DHBlk7Yas/xoxtsRl2Cu3Yze1VWRWiL6ez
 3IA2ZF0wmzDOzCG/y7iOTidRRas6R7bHnIEUzAn58ujkrH4KKJyEZ6vnp/KRnG71uE6BOS
 ZBMqblsnUlAiJpbbsVZrXpx0qPAvzh0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-nV4AtLQ3Oxyct-JUmFvcQA-1; Tue, 11 Oct 2022 06:42:18 -0400
X-MC-Unique: nV4AtLQ3Oxyct-JUmFvcQA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD56F299E754;
 Tue, 11 Oct 2022 10:42:17 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5293492B10;
 Tue, 11 Oct 2022 10:42:14 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gautam Dawar <gdawar@xilinx.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Jason Wang <jasowang@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Parav Pandit <parav@mellanox.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Cindy Lu <lulu@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, Harpreet Singh Anand <hanand@xilinx.com>
Subject: [PATCH v5 5/6] vdpa: Add listener_shadow_vq to vhost_vdpa
Date: Tue, 11 Oct 2022 12:41:53 +0200
Message-Id: <20221011104154.1209338-6-eperezma@redhat.com>
In-Reply-To: <20221011104154.1209338-1-eperezma@redhat.com>
References: <20221011104154.1209338-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The memory listener that thells the device how to convert GPA to qemu's
va is registered against CVQ vhost_vdpa. This series try to map the
memory listener translations to ASID 0, while it maps the CVQ ones to
ASID 1.

Let's tell the listener if it needs to register them on iova tree or
not.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
v5: Solve conflict about vhost_iova_tree_remove accepting mem_region by
    value.
---
 include/hw/virtio/vhost-vdpa.h | 2 ++
 hw/virtio/vhost-vdpa.c         | 6 +++---
 net/vhost-vdpa.c               | 1 +
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index 6560bb9d78..0c3ed2d69b 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -34,6 +34,8 @@ typedef struct vhost_vdpa {
     struct vhost_vdpa_iova_range iova_range;
     uint64_t acked_features;
     bool shadow_vqs_enabled;
+    /* The listener must send iova tree addresses, not GPA */
+    bool listener_shadow_vq;
     /* IOVA mapping used by the Shadow Virtqueue */
     VhostIOVATree *iova_tree;
     GPtrArray *shadow_vqs;
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index ad663feacc..29d009c02b 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -220,7 +220,7 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
                                          vaddr, section->readonly);
 
     llsize = int128_sub(llend, int128_make64(iova));
-    if (v->shadow_vqs_enabled) {
+    if (v->listener_shadow_vq) {
         int r;
 
         mem_region.translated_addr = (hwaddr)(uintptr_t)vaddr,
@@ -247,7 +247,7 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
     return;
 
 fail_map:
-    if (v->shadow_vqs_enabled) {
+    if (v->listener_shadow_vq) {
         vhost_iova_tree_remove(v->iova_tree, mem_region);
     }
 
@@ -292,7 +292,7 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
 
     llsize = int128_sub(llend, int128_make64(iova));
 
-    if (v->shadow_vqs_enabled) {
+    if (v->listener_shadow_vq) {
         const DMAMap *result;
         const void *vaddr = memory_region_get_ram_ptr(section->mr) +
             section->offset_within_region +
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index e8c78e4813..f7831aeb8d 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -604,6 +604,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
     s->vhost_vdpa.index = queue_pair_index;
     s->always_svq = svq;
     s->vhost_vdpa.shadow_vqs_enabled = svq;
+    s->vhost_vdpa.listener_shadow_vq = svq;
     s->vhost_vdpa.iova_tree = iova_tree;
     if (!is_datapath) {
         s->cvq_cmd_out_buffer = qemu_memalign(qemu_real_host_page_size(),
-- 
2.31.1


