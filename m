Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B93FB39310F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 16:38:59 +0200 (CEST)
Received: from localhost ([::1]:46538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmHA2-0002Z5-Ra
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 10:38:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmGxK-0001IY-Hs
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:25:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmGxF-0005K8-GY
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:25:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622125545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ro75jNMlpK4jgTIlUDKuFgrt7o+OFpGGsHJGBKp/VzM=;
 b=PxlmDo1xnd7hW6Qw0lfyWq3EWLnj1a5zKJWHFnx0X8YrA95Jq47unJN7ahNdIG/WIQTqL+
 23lnrJVLpm5zbmW6aAzQzkqw1Rw7ybSbQoiFwMlRq0RaqoGKNuDXt/2bNIyTf6WdLWEUn5
 ajsdSHrauIsK5LiS4eLtDl43USQxiok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-l-5UEbeJMYGkQrkn0z79oQ-1; Thu, 27 May 2021 10:25:43 -0400
X-MC-Unique: l-5UEbeJMYGkQrkn0z79oQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F412080ED91;
 Thu, 27 May 2021 14:25:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A00E810016FF;
 Thu, 27 May 2021 14:25:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1EE65180086F; Thu, 27 May 2021 16:23:42 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/23] virtio-gpu: Factor out update scanout
Date: Thu, 27 May 2021 16:23:38 +0200
Message-Id: <20210527142340.1352791-22-kraxel@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
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

Creating a small helper function for updating the scanout
will be useful in the next patch where this needs to be
done early in do_set_scanout before returning.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Message-Id: <20210526231429.1045476-13-vivek.kasireddy@intel.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/virtio-gpu.c | 35 +++++++++++++++++++++++------------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 788b4540d5ea..0af08edde85b 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -556,6 +556,28 @@ static void virtio_unref_resource(pixman_image_t *image, void *data)
     pixman_image_unref(data);
 }
 
+static void virtio_gpu_update_scanout(VirtIOGPU *g,
+                                      uint32_t scanout_id,
+                                      struct virtio_gpu_simple_resource *res,
+                                      struct virtio_gpu_rect *r)
+{
+    struct virtio_gpu_simple_resource *ores;
+    struct virtio_gpu_scanout *scanout;
+
+    scanout = &g->parent_obj.scanout[scanout_id];
+    ores = virtio_gpu_find_resource(g, scanout->resource_id);
+    if (ores) {
+        ores->scanout_bitmask &= ~(1 << scanout_id);
+    }
+
+    res->scanout_bitmask |= (1 << scanout_id);
+    scanout->resource_id = res->resource_id;
+    scanout->x = r->x;
+    scanout->y = r->y;
+    scanout->width = r->width;
+    scanout->height = r->height;
+}
+
 static void virtio_gpu_do_set_scanout(VirtIOGPU *g,
                                       uint32_t scanout_id,
                                       struct virtio_gpu_framebuffer *fb,
@@ -563,7 +585,6 @@ static void virtio_gpu_do_set_scanout(VirtIOGPU *g,
                                       struct virtio_gpu_rect *r,
                                       uint32_t *error)
 {
-    struct virtio_gpu_simple_resource *ores;
     struct virtio_gpu_scanout *scanout;
     uint8_t *data;
 
@@ -623,17 +644,7 @@ static void virtio_gpu_do_set_scanout(VirtIOGPU *g,
                                 scanout->ds);
     }
 
-    ores = virtio_gpu_find_resource(g, scanout->resource_id);
-    if (ores) {
-        ores->scanout_bitmask &= ~(1 << scanout_id);
-    }
-
-    res->scanout_bitmask |= (1 << scanout_id);
-    scanout->resource_id = res->resource_id;
-    scanout->x = r->x;
-    scanout->y = r->y;
-    scanout->width = r->width;
-    scanout->height = r->height;
+    virtio_gpu_update_scanout(g, scanout_id, res, r);
 }
 
 static void virtio_gpu_set_scanout(VirtIOGPU *g,
-- 
2.31.1


