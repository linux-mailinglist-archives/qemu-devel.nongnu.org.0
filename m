Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B66A39B44F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 09:51:34 +0200 (CEST)
Received: from localhost ([::1]:47160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp4c9-0004m4-5s
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 03:51:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lp4bK-0003co-UL
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 03:50:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lp4bJ-0002az-5f
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 03:50:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622793040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OM+IPuKzyzLq0TVzCQKRL3qzQOx7MvX5PZUOY6EhuOU=;
 b=QCc/TOdUFPtbXJmjueTMYIB6fMZOSCUnQB0ZY/8VKEDolf9H/KGrLPe5W+0E5EqAl5/Dld
 DHNGBorEd0bYrfAHdFv0vjT/ER4ebh4SHghTB7jWn6PshewowjLAQsJ8JZchfOG5GUyY0Z
 Zs5zEqQCTgn0ySoqYZZ85KSJk+9wJQA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-1zBK9nLBNuqVC5Tljw8FZQ-1; Fri, 04 Jun 2021 03:50:38 -0400
X-MC-Unique: 1zBK9nLBNuqVC5Tljw8FZQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAB1F8015F5;
 Fri,  4 Jun 2021 07:50:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-69.ams2.redhat.com
 [10.36.113.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CBE25D743;
 Fri,  4 Jun 2021 07:50:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CB5EC18007A2; Fri,  4 Jun 2021 09:50:29 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] virtio-gpu: move scanout_id sanity check
Date: Fri,  4 Jun 2021 09:50:29 +0200
Message-Id: <20210604075029.1201478-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
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


