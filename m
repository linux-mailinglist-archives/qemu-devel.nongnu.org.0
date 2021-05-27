Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C04603930FC
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 16:36:27 +0200 (CEST)
Received: from localhost ([::1]:36038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmH7a-0003tS-Mh
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 10:36:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmGwu-0000vn-Ml
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:25:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmGwq-000543-RR
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:25:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622125520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ECytsFV/tTiY9uCkTge5/fNfz1TkXLsqSjG7TP9obEM=;
 b=TNVcmLr5v0JqVzxSQIb8TEvUxyxYTQ/hAzJH2IxCYxjUIW3m+IcnAUKr1ofhMTbVsWR1/N
 gVMWVY5Rl5P1uyZBOBAX7hMhkOB0AxIC2tWLSqrloxwrlt9QZjAP2J7QxyKeidA3Njuzqy
 L2BGAdrlYTfwjhqFO/4ivdW73FSqamo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-zJ-rxU5INRi3UEATxSE2xw-1; Thu, 27 May 2021 10:25:17 -0400
X-MC-Unique: zJ-rxU5INRi3UEATxSE2xw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94F11180FD65;
 Thu, 27 May 2021 14:25:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E73F1007606;
 Thu, 27 May 2021 14:25:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CBC881800854; Thu, 27 May 2021 16:23:41 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/23] virtio-gpu: Refactor virtio_gpu_create_mapping_iov
Date: Thu, 27 May 2021 16:23:33 +0200
Message-Id: <20210527142340.1352791-17-kraxel@redhat.com>
In-Reply-To: <20210527142340.1352791-1-kraxel@redhat.com>
References: <20210527142340.1352791-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vivek Kasireddy <vivek.kasireddy@intel.com>

Instead of passing the attach_backing object to extract nr_entries
and offset, explicitly pass these as arguments to this function.
This will be helpful when adding create_blob API.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Message-Id: <20210526231429.1045476-8-vivek.kasireddy@intel.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/virtio/virtio-gpu.h |  2 +-
 hw/display/virtio-gpu-virgl.c  |  3 ++-
 hw/display/virtio-gpu.c        | 19 +++++++++----------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index b83a91a67f3a..dad9a1d221f9 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -238,7 +238,7 @@ void virtio_gpu_get_display_info(VirtIOGPU *g,
 void virtio_gpu_get_edid(VirtIOGPU *g,
                          struct virtio_gpu_ctrl_command *cmd);
 int virtio_gpu_create_mapping_iov(VirtIOGPU *g,
-                                  struct virtio_gpu_resource_attach_backing *ab,
+                                  uint32_t nr_entries, uint32_t offset,
                                   struct virtio_gpu_ctrl_command *cmd,
                                   uint64_t **addr, struct iovec **iov,
                                   uint32_t *niov);
diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 72c14d91324b..092c6dc380d9 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -289,7 +289,8 @@ static void virgl_resource_attach_backing(VirtIOGPU *g,
     VIRTIO_GPU_FILL_CMD(att_rb);
     trace_virtio_gpu_cmd_res_back_attach(att_rb.resource_id);
 
-    ret = virtio_gpu_create_mapping_iov(g, &att_rb, cmd, NULL, &res_iovs, &res_niov);
+    ret = virtio_gpu_create_mapping_iov(g, att_rb.nr_entries, sizeof(att_rb),
+                                        cmd, NULL, &res_iovs, &res_niov);
     if (ret != 0) {
         cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
         return;
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index fdcedfc61e54..7a0db3a8602e 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -615,7 +615,7 @@ static void virtio_gpu_set_scanout(VirtIOGPU *g,
 }
 
 int virtio_gpu_create_mapping_iov(VirtIOGPU *g,
-                                  struct virtio_gpu_resource_attach_backing *ab,
+                                  uint32_t nr_entries, uint32_t offset,
                                   struct virtio_gpu_ctrl_command *cmd,
                                   uint64_t **addr, struct iovec **iov,
                                   uint32_t *niov)
@@ -624,17 +624,17 @@ int virtio_gpu_create_mapping_iov(VirtIOGPU *g,
     size_t esize, s;
     int e, v;
 
-    if (ab->nr_entries > 16384) {
+    if (nr_entries > 16384) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: nr_entries is too big (%d > 16384)\n",
-                      __func__, ab->nr_entries);
+                      __func__, nr_entries);
         return -1;
     }
 
-    esize = sizeof(*ents) * ab->nr_entries;
+    esize = sizeof(*ents) * nr_entries;
     ents = g_malloc(esize);
     s = iov_to_buf(cmd->elem.out_sg, cmd->elem.out_num,
-                   sizeof(*ab), ents, esize);
+                   offset, ents, esize);
     if (s != esize) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: command data size incorrect %zu vs %zu\n",
@@ -647,7 +647,7 @@ int virtio_gpu_create_mapping_iov(VirtIOGPU *g,
     if (addr) {
         *addr = NULL;
     }
-    for (e = 0, v = 0; e < ab->nr_entries; e++) {
+    for (e = 0, v = 0; e < nr_entries; e++) {
         uint64_t a = le64_to_cpu(ents[e].addr);
         uint32_t l = le32_to_cpu(ents[e].length);
         hwaddr len;
@@ -659,8 +659,7 @@ int virtio_gpu_create_mapping_iov(VirtIOGPU *g,
                                  a, &len, DMA_DIRECTION_TO_DEVICE);
             if (!map) {
                 qemu_log_mask(LOG_GUEST_ERROR, "%s: failed to map MMIO memory for"
-                              " resource %d element %d\n",
-                              __func__, ab->resource_id, e);
+                              " element %d\n", __func__, e);
                 virtio_gpu_cleanup_mapping_iov(g, *iov, v);
                 g_free(ents);
                 *iov = NULL;
@@ -743,8 +742,8 @@ virtio_gpu_resource_attach_backing(VirtIOGPU *g,
         return;
     }
 
-    ret = virtio_gpu_create_mapping_iov(g, &ab, cmd, &res->addrs,
-                                        &res->iov, &res->iov_cnt);
+    ret = virtio_gpu_create_mapping_iov(g, ab.nr_entries, sizeof(ab), cmd,
+                                        &res->addrs, &res->iov, &res->iov_cnt);
     if (ret != 0) {
         cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
         return;
-- 
2.31.1


