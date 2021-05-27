Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BF13930F6
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 16:33:43 +0200 (CEST)
Received: from localhost ([::1]:57556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmH4w-0007sD-Km
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 10:33:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmGwB-0006tR-Fd
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:24:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmGw8-0004ap-Sn
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:24:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622125476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SpLOsHH0UTxbPG+vlTr/yNyU013X8CCW8KPm4t7J9Uo=;
 b=HZxnrLxwq7vcjFMvAFQrJXsaBlbgnIj8XN4J3ijmpt5f2AiEyJBQR83kxRCTy19YbqOIzT
 b+2YpE+tQGF7KajRyMbS64bYqSrLjeHSc2TfTmuQw5HebV6MkAU/fiAWW0l6X/qqW05zEQ
 z7+zK/sZXmhHEvSMAQy3fLd+FdiOedY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-DSO2L9O7Pb6jSGzuH-sIOQ-1; Thu, 27 May 2021 10:24:34 -0400
X-MC-Unique: DSO2L9O7Pb6jSGzuH-sIOQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 514BC8049C5;
 Thu, 27 May 2021 14:24:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6439F59479;
 Thu, 27 May 2021 14:24:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5A0DE1800844; Thu, 27 May 2021 16:23:41 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/23] vhost-user-gpu: abstract vg_cleanup_mapping_iov
Date: Thu, 27 May 2021 16:23:25 +0200
Message-Id: <20210527142340.1352791-9-kraxel@redhat.com>
In-Reply-To: <20210527142340.1352791-1-kraxel@redhat.com>
References: <20210527142340.1352791-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 Li Qiang <liq3ea@163.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Li Qiang <liq3ea@163.com>

Currently in vhost-user-gpu, we free resource directly in
the cleanup case of resource. If we change the cleanup logic
we need to change several places, also abstruct a
'vg_create_mapping_iov' can be symmetry with the
'vg_create_mapping_iov'. This is like what virtio-gpu does,
no function changed.

Signed-off-by: Li Qiang <liq3ea@163.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210516030403.107723-9-liq3ea@163.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 contrib/vhost-user-gpu/vugpu.h          |  2 +-
 contrib/vhost-user-gpu/vhost-user-gpu.c | 24 ++++++++++++++++++++----
 contrib/vhost-user-gpu/virgl.c          |  9 +++++----
 3 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/contrib/vhost-user-gpu/vugpu.h b/contrib/vhost-user-gpu/vugpu.h
index 04d56158123d..e2864bba68e0 100644
--- a/contrib/vhost-user-gpu/vugpu.h
+++ b/contrib/vhost-user-gpu/vugpu.h
@@ -169,7 +169,7 @@ int     vg_create_mapping_iov(VuGpu *g,
                               struct virtio_gpu_resource_attach_backing *ab,
                               struct virtio_gpu_ctrl_command *cmd,
                               struct iovec **iov);
-
+void    vg_cleanup_mapping_iov(VuGpu *g, struct iovec *iov, uint32_t count);
 void    vg_get_display_info(VuGpu *vg, struct virtio_gpu_ctrl_command *cmd);
 
 void    vg_wait_ok(VuGpu *g);
diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user-gpu/vhost-user-gpu.c
index 770dfad52989..6dc6a44f4e26 100644
--- a/contrib/vhost-user-gpu/vhost-user-gpu.c
+++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
@@ -49,6 +49,8 @@ static char *opt_render_node;
 static gboolean opt_virgl;
 
 static void vg_handle_ctrl(VuDev *dev, int qidx);
+static void vg_cleanup_mapping(VuGpu *g,
+                               struct virtio_gpu_simple_resource *res);
 
 static const char *
 vg_cmd_to_string(int cmd)
@@ -400,7 +402,7 @@ vg_resource_destroy(VuGpu *g,
     }
 
     vugbm_buffer_destroy(&res->buffer);
-    g_free(res->iov);
+    vg_cleanup_mapping(g, res);
     pixman_image_unref(res->image);
     QTAILQ_REMOVE(&g->reslist, res, next);
     g_free(res);
@@ -504,6 +506,22 @@ vg_resource_attach_backing(VuGpu *g,
     res->iov_cnt = ab.nr_entries;
 }
 
+/* Though currently only free iov, maybe later will do more work. */
+void vg_cleanup_mapping_iov(VuGpu *g,
+                            struct iovec *iov, uint32_t count)
+{
+    g_free(iov);
+}
+
+static void
+vg_cleanup_mapping(VuGpu *g,
+                   struct virtio_gpu_simple_resource *res)
+{
+    vg_cleanup_mapping_iov(g, res->iov, res->iov_cnt);
+    res->iov = NULL;
+    res->iov_cnt = 0;
+}
+
 static void
 vg_resource_detach_backing(VuGpu *g,
                            struct virtio_gpu_ctrl_command *cmd)
@@ -522,9 +540,7 @@ vg_resource_detach_backing(VuGpu *g,
         return;
     }
 
-    g_free(res->iov);
-    res->iov = NULL;
-    res->iov_cnt = 0;
+    vg_cleanup_mapping(g, res);
 }
 
 static void
diff --git a/contrib/vhost-user-gpu/virgl.c b/contrib/vhost-user-gpu/virgl.c
index 7172104b19d7..3e45e1bd3360 100644
--- a/contrib/vhost-user-gpu/virgl.c
+++ b/contrib/vhost-user-gpu/virgl.c
@@ -116,8 +116,9 @@ virgl_cmd_resource_unref(VuGpu *g,
     virgl_renderer_resource_detach_iov(unref.resource_id,
                                        &res_iovs,
                                        &num_iovs);
-    g_free(res_iovs);
-
+    if (res_iovs != NULL && num_iovs != 0) {
+        vg_cleanup_mapping_iov(g, res_iovs, num_iovs);
+    }
     virgl_renderer_resource_unref(unref.resource_id);
 }
 
@@ -294,7 +295,7 @@ virgl_resource_attach_backing(VuGpu *g,
     ret = virgl_renderer_resource_attach_iov(att_rb.resource_id,
                                        res_iovs, att_rb.nr_entries);
     if (ret != 0) {
-        g_free(res_iovs);
+        vg_cleanup_mapping_iov(g, res_iovs, att_rb.nr_entries);
     }
 }
 
@@ -314,7 +315,7 @@ virgl_resource_detach_backing(VuGpu *g,
     if (res_iovs == NULL || num_iovs == 0) {
         return;
     }
-    g_free(res_iovs);
+    vg_cleanup_mapping_iov(g, res_iovs, num_iovs);
 }
 
 static void
-- 
2.31.1


