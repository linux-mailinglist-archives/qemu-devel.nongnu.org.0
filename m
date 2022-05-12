Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C58525560
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 21:08:01 +0200 (CEST)
Received: from localhost ([::1]:57252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npEAJ-0001kf-QR
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 15:08:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1npD4d-0000NW-CG
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:58:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1npD4b-0001hz-OY
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:58:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652378281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iY4ieypF1u3bLIJmHhsw+EpUiurJRhvqodmb1z++LGw=;
 b=GWXbkDnmWZGLD2W2dXaQU3UlItu03eKK4+dAekKUWVKS+wHzG0g4lXFqF6E+JvlFJTSYNF
 zwnBeDzISgN99u7csxyRl5o9AyShej1Q29xOUeBFeVgZp71AbhW9RoOGRQU9tHYGnVSiVZ
 AzYkbnyDi+T8sfREqpQXXLCZLgkyPqg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-154-YzXp2Mo_PkaaKeiX8FMLiA-1; Thu, 12 May 2022 13:57:55 -0400
X-MC-Unique: YzXp2Mo_PkaaKeiX8FMLiA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D05358EFAF5;
 Thu, 12 May 2022 17:57:53 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0532543E390;
 Thu, 12 May 2022 17:57:51 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gautam Dawar <gdawar@xilinx.com>, Laurent Vivier <lvivier@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, qemu-stable@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Cindy Lu <lulu@redhat.com>
Subject: [PATCH 1/6] vhost: Track descriptor chain in private at SVQ
Date: Thu, 12 May 2022 19:57:42 +0200
Message-Id: <20220512175747.142058-2-eperezma@redhat.com>
In-Reply-To: <20220512175747.142058-1-eperezma@redhat.com>
References: <20220512175747.142058-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

The device could have access to modify them, and it definitely have
access when we implement packed vq. Harden SVQ maintaining a private
copy of the descriptor chain. Other fields like buffer addresses are
already maintained sepparatedly.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |  6 ++++++
 hw/virtio/vhost-shadow-virtqueue.c | 12 +++++++-----
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index e5e24c536d..c132c994e9 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -53,6 +53,12 @@ typedef struct VhostShadowVirtqueue {
     /* Next VirtQueue element that guest made available */
     VirtQueueElement *next_guest_avail_elem;

+    /*
+     * Backup next field for each descriptor so we can recover securely, not
+     * needing to trust the device access.
+     */
+    uint16_t *desc_next;
+
     /* Next head to expose to the device */
     uint16_t shadow_avail_idx;

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 1e5cfe2af6..1d6552b0fe 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -138,6 +138,7 @@ static void vhost_vring_write_descs(VhostShadowVirtqueue *svq, hwaddr *sg,
     for (n = 0; n < num; n++) {
         if (more_descs || (n + 1 < num)) {
             descs[i].flags = flags | cpu_to_le16(VRING_DESC_F_NEXT);
+            descs[i].next = cpu_to_le16(svq->desc_next[i]);
         } else {
             descs[i].flags = flags;
         }
@@ -145,10 +146,10 @@ static void vhost_vring_write_descs(VhostShadowVirtqueue *svq, hwaddr *sg,
         descs[i].len = cpu_to_le32(iovec[n].iov_len);

         last = i;
-        i = cpu_to_le16(descs[i].next);
+        i = cpu_to_le16(svq->desc_next[i]);
     }

-    svq->free_head = le16_to_cpu(descs[last].next);
+    svq->free_head = le16_to_cpu(svq->desc_next[last]);
 }

 static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
@@ -336,7 +337,6 @@ static void vhost_svq_disable_notification(VhostShadowVirtqueue *svq)
 static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
                                            uint32_t *len)
 {
-    vring_desc_t *descs = svq->vring.desc;
     const vring_used_t *used = svq->vring.used;
     vring_used_elem_t used_elem;
     uint16_t last_used;
@@ -365,7 +365,7 @@ static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
         return NULL;
     }

-    descs[used_elem.id].next = svq->free_head;
+    svq->desc_next[used_elem.id] = svq->free_head;
     svq->free_head = used_elem.id;

     *len = used_elem.len;
@@ -540,8 +540,9 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
     svq->vring.used = qemu_memalign(qemu_real_host_page_size(), device_size);
     memset(svq->vring.used, 0, device_size);
     svq->ring_id_maps = g_new0(VirtQueueElement *, svq->vring.num);
+    svq->desc_next = g_new0(uint16_t, svq->vring.num);
     for (unsigned i = 0; i < svq->vring.num - 1; i++) {
-        svq->vring.desc[i].next = cpu_to_le16(i + 1);
+        svq->desc_next[i] = cpu_to_le16(i + 1);
     }
 }

@@ -574,6 +575,7 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
         virtqueue_detach_element(svq->vq, next_avail_elem, 0);
     }
     svq->vq = NULL;
+    g_free(svq->desc_next);
     g_free(svq->ring_id_maps);
     qemu_vfree(svq->vring.desc);
     qemu_vfree(svq->vring.used);
--
2.27.0


