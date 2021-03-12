Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BC23389D0
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:15:17 +0100 (CET)
Received: from localhost ([::1]:33774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKepA-0008DU-N1
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:15:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKeeT-0001dQ-Mm
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:04:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKeeR-0003bJ-W3
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:04:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615543451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cKRfBZkSvtMBQ2Oho3jsinCzQg5se417u2EKUQvW77M=;
 b=am9UNmqImte3aMRP6UK5XU9ORBSCSgBOtd2ByDPd3+R/rPAZ1iedpBcYUWJJ/9RsQQzk2y
 PPmNAt0QAhOYSG0PX5CDED8sxi5mg3TFxY3pU29erBJIedGQokM0q/MCdfmnpJP1mMmIlv
 awfGeYFfbz01PW3k9hoSCSCbbyi8/8Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-1Yk0i7P9MtaNC2rAMJlldA-1; Fri, 12 Mar 2021 05:04:09 -0500
X-MC-Unique: 1Yk0i7P9MtaNC2rAMJlldA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 800BB107ACCD
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 10:04:08 +0000 (UTC)
Received: from localhost (unknown [10.36.110.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6CCA5DAA5;
 Fri, 12 Mar 2021 10:04:01 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 16/27] vhost-user-gpu: add vg_send_disable_scanout()
Date: Fri, 12 Mar 2021 14:00:57 +0400
Message-Id: <20210312100108.2706195-17-marcandre.lureau@redhat.com>
In-Reply-To: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
References: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 contrib/vhost-user-gpu/vhost-user-gpu.c | 24 ++++++++++++++++--------
 contrib/vhost-user-gpu/virgl.c          |  8 +-------
 3 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/contrib/vhost-user-gpu/vugpu.h b/contrib/vhost-user-gpu/vugpu.h
index 04d5615812..e19abb670d 100644
--- a/contrib/vhost-user-gpu/vugpu.h
+++ b/contrib/vhost-user-gpu/vugpu.h
@@ -179,5 +179,6 @@ void    vg_send_msg(VuGpu *g, const VhostUserGpuMsg *msg, int fd);
 bool    vg_recv_msg(VuGpu *g, uint32_t expect_req, uint32_t expect_size,
                     gpointer payload);
 
+void    vg_send_disable_scanout(VuGpu *g, int scanout_id);
 
 #endif
diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user-gpu/vhost-user-gpu.c
index f73f292c9f..69fedd376b 100644
--- a/contrib/vhost-user-gpu/vhost-user-gpu.c
+++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
@@ -356,6 +356,21 @@ vg_resource_create_2d(VuGpu *g,
     QTAILQ_INSERT_HEAD(&g->reslist, res, next);
 }
 
+void
+vg_send_disable_scanout(VuGpu *g, int scanout_id)
+{
+    g_debug("send disable scanout %d", scanout_id);
+
+    if (g->sock_fd >= 0) {
+        VhostUserGpuMsg msg = {
+            .request = VHOST_USER_GPU_SCANOUT,
+            .size = sizeof(VhostUserGpuScanout),
+            .payload.scanout.scanout_id = scanout_id,
+        };
+        vg_send_msg(g, &msg, -1);
+    }
+}
+
 static void
 vg_disable_scanout(VuGpu *g, int scanout_id)
 {
@@ -374,14 +389,7 @@ vg_disable_scanout(VuGpu *g, int scanout_id)
     scanout->width = 0;
     scanout->height = 0;
 
-    if (g->sock_fd >= 0) {
-        VhostUserGpuMsg msg = {
-            .request = VHOST_USER_GPU_SCANOUT,
-            .size = sizeof(VhostUserGpuScanout),
-            .payload.scanout.scanout_id = scanout_id,
-        };
-        vg_send_msg(g, &msg, -1);
-    }
+    vg_send_disable_scanout(g, scanout_id);
 }
 
 static void
diff --git a/contrib/vhost-user-gpu/virgl.c b/contrib/vhost-user-gpu/virgl.c
index 9e6660c7ab..fe153425f5 100644
--- a/contrib/vhost-user-gpu/virgl.c
+++ b/contrib/vhost-user-gpu/virgl.c
@@ -354,13 +354,7 @@ virgl_cmd_set_scanout(VuGpu *g,
         vg_send_msg(g, &msg, fd);
         close(fd);
     } else {
-        VhostUserGpuMsg msg = {
-            .request = VHOST_USER_GPU_DMABUF_SCANOUT,
-            .size = sizeof(VhostUserGpuDMABUFScanout),
-            .payload.dmabuf_scanout.scanout_id = ss.scanout_id,
-        };
-        g_debug("disable scanout");
-        vg_send_msg(g, &msg, -1);
+        vg_send_disable_scanout(g, ss.scanout_id);
     }
     g->scanout[ss.scanout_id].resource_id = ss.resource_id;
 }
-- 
2.29.0


