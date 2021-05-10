Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C584378CC3
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 15:29:32 +0200 (CEST)
Received: from localhost ([::1]:38942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg5yV-00060q-A4
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 09:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lg5rG-0004wF-Rj
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:22:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lg5rD-0002xJ-Na
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:22:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620652919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1jgolTzqCiC0POG3pNNyLFYJ43yHlCdS2iGPYwEwBSo=;
 b=Ss7O5lZDsooa+u3nM8tSXmqMh9IzmPMl7Bqjcg0GMwbpn69evGxL6rurbxkY3J2L/Cbhme
 o4ZA9wPUwE1/677iZHNN6vAJBYi4ic1UZWSWLem+WyvCsIbcVDN6Ca7wV4bmj5JuUJ/1Fi
 RJCprbubbyiZjNhEBv3xKkwiYKxfC14=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-8tDSHnCBNxaKn0EVB2l5vg-1; Mon, 10 May 2021 09:21:57 -0400
X-MC-Unique: 8tDSHnCBNxaKn0EVB2l5vg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 801A01927800
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 13:21:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FFE619C45;
 Mon, 10 May 2021 13:21:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 83915180060F; Mon, 10 May 2021 15:20:51 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/25] virtio-gpu: handle partial maps properly
Date: Mon, 10 May 2021 15:20:35 +0200
Message-Id: <20210510132051.2208563-10-kraxel@redhat.com>
In-Reply-To: <20210510132051.2208563-1-kraxel@redhat.com>
References: <20210510132051.2208563-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

dma_memory_map() may map only a part of the request.  Happens if the
request can't be mapped in one go, for example due to a iommu creating
a linear dma mapping for scattered physical pages.  Should that be the
case virtio-gpu must call dma_memory_map() again with the remaining
range instead of simply throwing an error.

Note that this change implies the number of iov entries may differ from
the number of mapping entries sent by the guest.  Therefore the iov_len
bookkeeping needs some updates too, we have to explicitly pass around
the iov length now.

Reported-by: Auger Eric <eric.auger@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-id: 20210506091001.1301250-1-kraxel@redhat.com
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20210506091001.1301250-1-kraxel@redhat.com>
---
 include/hw/virtio/virtio-gpu.h |  3 +-
 hw/display/virtio-gpu-3d.c     |  7 ++--
 hw/display/virtio-gpu.c        | 76 ++++++++++++++++++++--------------
 3 files changed, 52 insertions(+), 34 deletions(-)

diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index fae149235c58..0d15af41d96d 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -209,7 +209,8 @@ void virtio_gpu_get_edid(VirtIOGPU *g,
 int virtio_gpu_create_mapping_iov(VirtIOGPU *g,
                                   struct virtio_gpu_resource_attach_backing *ab,
                                   struct virtio_gpu_ctrl_command *cmd,
-                                  uint64_t **addr, struct iovec **iov);
+                                  uint64_t **addr, struct iovec **iov,
+                                  uint32_t *niov);
 void virtio_gpu_cleanup_mapping_iov(VirtIOGPU *g,
                                     struct iovec *iov, uint32_t count);
 void virtio_gpu_process_cmdq(VirtIOGPU *g);
diff --git a/hw/display/virtio-gpu-3d.c b/hw/display/virtio-gpu-3d.c
index d98964858e13..72c14d91324b 100644
--- a/hw/display/virtio-gpu-3d.c
+++ b/hw/display/virtio-gpu-3d.c
@@ -283,22 +283,23 @@ static void virgl_resource_attach_backing(VirtIOGPU *g,
 {
     struct virtio_gpu_resource_attach_backing att_rb;
     struct iovec *res_iovs;
+    uint32_t res_niov;
     int ret;
 
     VIRTIO_GPU_FILL_CMD(att_rb);
     trace_virtio_gpu_cmd_res_back_attach(att_rb.resource_id);
 
-    ret = virtio_gpu_create_mapping_iov(g, &att_rb, cmd, NULL, &res_iovs);
+    ret = virtio_gpu_create_mapping_iov(g, &att_rb, cmd, NULL, &res_iovs, &res_niov);
     if (ret != 0) {
         cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
         return;
     }
 
     ret = virgl_renderer_resource_attach_iov(att_rb.resource_id,
-                                             res_iovs, att_rb.nr_entries);
+                                             res_iovs, res_niov);
 
     if (ret != 0)
-        virtio_gpu_cleanup_mapping_iov(g, res_iovs, att_rb.nr_entries);
+        virtio_gpu_cleanup_mapping_iov(g, res_iovs, res_niov);
 }
 
 static void virgl_resource_detach_backing(VirtIOGPU *g,
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index c9f5e36fd076..6f3791deb3ae 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -608,11 +608,12 @@ static void virtio_gpu_set_scanout(VirtIOGPU *g,
 int virtio_gpu_create_mapping_iov(VirtIOGPU *g,
                                   struct virtio_gpu_resource_attach_backing *ab,
                                   struct virtio_gpu_ctrl_command *cmd,
-                                  uint64_t **addr, struct iovec **iov)
+                                  uint64_t **addr, struct iovec **iov,
+                                  uint32_t *niov)
 {
     struct virtio_gpu_mem_entry *ents;
     size_t esize, s;
-    int i;
+    int e, v;
 
     if (ab->nr_entries > 16384) {
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -633,37 +634,53 @@ int virtio_gpu_create_mapping_iov(VirtIOGPU *g,
         return -1;
     }
 
-    *iov = g_malloc0(sizeof(struct iovec) * ab->nr_entries);
+    *iov = NULL;
     if (addr) {
-        *addr = g_malloc0(sizeof(uint64_t) * ab->nr_entries);
+        *addr = NULL;
     }
-    for (i = 0; i < ab->nr_entries; i++) {
-        uint64_t a = le64_to_cpu(ents[i].addr);
-        uint32_t l = le32_to_cpu(ents[i].length);
-        hwaddr len = l;
-        (*iov)[i].iov_base = dma_memory_map(VIRTIO_DEVICE(g)->dma_as,
-                                            a, &len, DMA_DIRECTION_TO_DEVICE);
-        (*iov)[i].iov_len = len;
-        if (addr) {
-            (*addr)[i] = a;
-        }
-        if (!(*iov)[i].iov_base || len != l) {
-            qemu_log_mask(LOG_GUEST_ERROR, "%s: failed to map MMIO memory for"
-                          " resource %d element %d\n",
-                          __func__, ab->resource_id, i);
-            if ((*iov)[i].iov_base) {
-                i++; /* cleanup the 'i'th map */
+    for (e = 0, v = 0; e < ab->nr_entries; e++) {
+        uint64_t a = le64_to_cpu(ents[e].addr);
+        uint32_t l = le32_to_cpu(ents[e].length);
+        hwaddr len;
+        void *map;
+
+        do {
+            len = l;
+            map = dma_memory_map(VIRTIO_DEVICE(g)->dma_as,
+                                 a, &len, DMA_DIRECTION_TO_DEVICE);
+            if (!map) {
+                qemu_log_mask(LOG_GUEST_ERROR, "%s: failed to map MMIO memory for"
+                              " resource %d element %d\n",
+                              __func__, ab->resource_id, e);
+                virtio_gpu_cleanup_mapping_iov(g, *iov, v);
+                g_free(ents);
+                *iov = NULL;
+                if (addr) {
+                    g_free(*addr);
+                    *addr = NULL;
+                }
+                return -1;
             }
-            virtio_gpu_cleanup_mapping_iov(g, *iov, i);
-            g_free(ents);
-            *iov = NULL;
+
+            if (!(v % 16)) {
+                *iov = g_realloc(*iov, sizeof(struct iovec) * (v + 16));
+                if (addr) {
+                    *addr = g_realloc(*addr, sizeof(uint64_t) * (v + 16));
+                }
+            }
+            (*iov)[v].iov_base = map;
+            (*iov)[v].iov_len = len;
             if (addr) {
-                g_free(*addr);
-                *addr = NULL;
+                (*addr)[v] = a;
             }
-            return -1;
-        }
+
+            a += len;
+            l -= len;
+            v += 1;
+        } while (l > 0);
     }
+    *niov = v;
+
     g_free(ents);
     return 0;
 }
@@ -717,13 +734,12 @@ virtio_gpu_resource_attach_backing(VirtIOGPU *g,
         return;
     }
 
-    ret = virtio_gpu_create_mapping_iov(g, &ab, cmd, &res->addrs, &res->iov);
+    ret = virtio_gpu_create_mapping_iov(g, &ab, cmd, &res->addrs,
+                                        &res->iov, &res->iov_cnt);
     if (ret != 0) {
         cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
         return;
     }
-
-    res->iov_cnt = ab.nr_entries;
 }
 
 static void
-- 
2.31.1


