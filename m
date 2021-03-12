Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B50C338A10
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:27:24 +0100 (CET)
Received: from localhost ([::1]:45828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKf0t-0001r8-Gl
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:27:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKef6-0002Gv-DT
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:04:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKef3-0003wQ-3c
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:04:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615543487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=58c+YZnAcY8nmu25pTsnfz7IsqwKksSTHctTkETWfcU=;
 b=DN7zF1kjkO5m2g7d9leLbmLKqTM9OCu5AaNXxxUglCbmGWeyk8OintH787k1KiasI8Gh+N
 IcH+MLjIFEM/+4JyS1bWBRwMfapupu5y3fzkV1a/skpRsd0pPvcHtfbiWO+wNT6uxRuqZP
 a7LP3KZTjY/GMIhd49/XUME1vigzGX8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-6EkO0w7TM2WFxblO2U4vqQ-1; Fri, 12 Mar 2021 05:04:46 -0500
X-MC-Unique: 6EkO0w7TM2WFxblO2U4vqQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10AC881744F
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 10:04:45 +0000 (UTC)
Received: from localhost (unknown [10.36.110.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 06B7410016FD;
 Fri, 12 Mar 2021 10:04:37 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 19/27] vhost-user-gpu: add vg_send_scanout()
Date: Fri, 12 Mar 2021 14:01:00 +0400
Message-Id: <20210312100108.2706195-20-marcandre.lureau@redhat.com>
In-Reply-To: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
References: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 contrib/vhost-user-gpu/vugpu.h          |  1 +
 contrib/vhost-user-gpu/vhost-user-gpu.c | 27 ++++++++++++++++---------
 2 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/contrib/vhost-user-gpu/vugpu.h b/contrib/vhost-user-gpu/vugpu.h
index f2e80d255d..bf513e9295 100644
--- a/contrib/vhost-user-gpu/vugpu.h
+++ b/contrib/vhost-user-gpu/vugpu.h
@@ -194,5 +194,6 @@ void    vg_send_dmabuf_update(VuGpu *g,
                               uint32_t y,
                               uint32_t width,
                               uint32_t height);
+void    vg_send_scanout(VuGpu *g, uint32_t scanout_id);
 
 #endif
diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user-gpu/vhost-user-gpu.c
index fc8e62f20e..a11f406350 100644
--- a/contrib/vhost-user-gpu/vhost-user-gpu.c
+++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
@@ -638,6 +638,22 @@ vg_send_dmabuf_update(VuGpu *g,
     vg_send_msg(g, &msg, -1);
 }
 
+void
+vg_send_scanout(VuGpu *g, uint32_t scanout_id)
+{
+    struct virtio_gpu_scanout *scanout = &g->scanout[scanout_id];
+    VhostUserGpuMsg msg = {
+        .request = VHOST_USER_GPU_SCANOUT,
+        .size = sizeof(VhostUserGpuScanout),
+        .payload.scanout = (VhostUserGpuScanout) {
+            .scanout_id = scanout_id,
+            .width = scanout->width,
+            .height = scanout->height
+        }
+    };
+    vg_send_msg(g, &msg, -1);
+}
+
 static void
 vg_set_scanout(VuGpu *g,
                struct virtio_gpu_ctrl_command *cmd)
@@ -714,16 +730,7 @@ vg_set_scanout(VuGpu *g,
             close(fd);
         }
     } else {
-        VhostUserGpuMsg msg = {
-            .request = VHOST_USER_GPU_SCANOUT,
-            .size = sizeof(VhostUserGpuScanout),
-            .payload.scanout = (VhostUserGpuScanout) {
-                .scanout_id = ss.scanout_id,
-                .width = scanout->width,
-                .height = scanout->height
-            }
-        };
-        vg_send_msg(g, &msg, -1);
+        vg_send_scanout(g, ss.scanout_id);
     }
 }
 
-- 
2.29.0


