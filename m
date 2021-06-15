Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D13AA3A8806
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 19:49:20 +0200 (CEST)
Received: from localhost ([::1]:51648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltDBf-0004BA-U0
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 13:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltD3h-0000Ch-6s
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:41:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltD3e-0003ZG-Ln
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:41:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623778860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iV4BAQ+klh6qramPeT9npbbKerAjx5rq2qDIbQIR4U8=;
 b=bWRE+SLDatnzpg2pXq6qRricV2BMWndqk4q8TWyqzQWF/MSOqs1sM2KJRSTcKozY1mNNfO
 nYfx/mX+OGXx+U3cRY1WJHVZsQmJsg+q8o2gKKIFNd+4B+10MO/Ah860AWvIJJG+2YjTjz
 0e1k6h+lsZIvkEYnIy9Fyv5etGBjEMo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-i5h_1kiuNCq9YkfOZ_O_TQ-1; Tue, 15 Jun 2021 13:40:59 -0400
X-MC-Unique: i5h_1kiuNCq9YkfOZ_O_TQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77B70100B3AB;
 Tue, 15 Jun 2021 17:40:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 99C4B5C22A;
 Tue, 15 Jun 2021 17:40:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F1361180060E; Tue, 15 Jun 2021 19:40:25 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/3] virtio-gpu: move scanout_id sanity check
Date: Tue, 15 Jun 2021 19:40:25 +0200
Message-Id: <20210615174025.3409518-4-kraxel@redhat.com>
In-Reply-To: <20210615174025.3409518-1-kraxel@redhat.com>
References: <20210615174025.3409518-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Alexander Bulekov <alxndr@bu.edu>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Checking scanout_id in virtio_gpu_do_set_scanout() is too late, for the
"resource_id == 0" case (aka disable scanout) the scanout_id is used
unchecked.  Move the check into the callers to fix that.

Fixes: e64d4b6a9bc3 ("virtio-gpu: Refactor virtio_gpu_set_scanout")
Fixes: 32db3c63ae11 ("virtio-gpu: Add virtio_gpu_set_scanout_blob")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/383
Reported-by: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Message-Id: <20210604075029.1201478-1-kraxel@redhat.com>
---
 hw/display/virtio-gpu.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 4d549377cbc1..e183f4ecdaa5 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -610,12 +610,6 @@ static void virtio_gpu_do_set_scanout(VirtIOGPU *g,
     struct virtio_gpu_scanout *scanout;
     uint8_t *data;
 
-    if (scanout_id >= g->parent_obj.conf.max_outputs) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: illegal scanout id specified %d",
-                      __func__, scanout_id);
-        *error = VIRTIO_GPU_RESP_ERR_INVALID_SCANOUT_ID;
-        return;
-    }
     scanout = &g->parent_obj.scanout[scanout_id];
 
     if (r->x > fb->width ||
@@ -694,6 +688,13 @@ static void virtio_gpu_set_scanout(VirtIOGPU *g,
     trace_virtio_gpu_cmd_set_scanout(ss.scanout_id, ss.resource_id,
                                      ss.r.width, ss.r.height, ss.r.x, ss.r.y);
 
+    if (ss.scanout_id >= g->parent_obj.conf.max_outputs) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: illegal scanout id specified %d",
+                      __func__, ss.scanout_id);
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_SCANOUT_ID;
+        return;
+    }
+
     if (ss.resource_id == 0) {
         virtio_gpu_disable_scanout(g, ss.scanout_id);
         return;
@@ -730,6 +731,13 @@ static void virtio_gpu_set_scanout_blob(VirtIOGPU *g,
                                           ss.r.width, ss.r.height, ss.r.x,
                                           ss.r.y);
 
+    if (ss.scanout_id >= g->parent_obj.conf.max_outputs) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: illegal scanout id specified %d",
+                      __func__, ss.scanout_id);
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_SCANOUT_ID;
+        return;
+    }
+
     if (ss.resource_id == 0) {
         virtio_gpu_disable_scanout(g, ss.scanout_id);
         return;
-- 
2.31.1


