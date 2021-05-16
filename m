Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F031381C30
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 05:08:16 +0200 (CEST)
Received: from localhost ([::1]:35550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1li78Z-0000VW-8o
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 23:08:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1li74p-0000pR-Th
 for qemu-devel@nongnu.org; Sat, 15 May 2021 23:04:23 -0400
Received: from m12-13.163.com ([220.181.12.13]:52352)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1li74n-0002gO-Bn
 for qemu-devel@nongnu.org; Sat, 15 May 2021 23:04:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=DcDXR
 blPPvnfD/xYLg4aHe8aReG2NSYKLxSU3hh7qxU=; b=Y5Bgc8mH5zeTUX/Vx9YDV
 AZMXoLjBFtsWlEDlLjx1Yf9bIu2EURiBVX0qWqd/Ny41gBy0Wmnv4uhlfC/oOzUI
 h3bECCSy4qIaAtrkXdu6GvDcsZjEAuHmtEfWQEvrbgC5+2OB4ymabr3gYZYkIB4m
 /ZtfIek8cumCquCKAveJ5g=
Received: from ubuntu.localdomain (unknown [115.200.200.157])
 by smtp9 (Coremail) with SMTP id DcCowAC3evili6Bg85SBAw--.61303S12;
 Sun, 16 May 2021 11:04:16 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: marcandre.lureau@redhat.com, kraxel@redhat.com, philmd@redhat.com,
 ppandit@redhat.com, mcascell@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v2 8/8] vhost-user-gpu: abstract vg_cleanup_mapping_iov
Date: Sat, 15 May 2021 20:04:03 -0700
Message-Id: <20210516030403.107723-9-liq3ea@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516030403.107723-1-liq3ea@163.com>
References: <20210516030403.107723-1-liq3ea@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcCowAC3evili6Bg85SBAw--.61303S12
X-Coremail-Antispam: 1Uf129KBjvJXoWxWrW7Gr4DJr47XFWUGw4UJwb_yoWrJFyUpF
 yxW3W2kF48Zr4fKa97Aw1UZFnav3WrZFWYkr1akan8ursIg3yqq3Z8u3Z8Kr15JFyktF47
 tFn8Gw18GrWUAFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UD5rcUUUUU=
X-Originating-IP: [115.200.200.157]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/1tbiKRCUbVXl0i9ZPQAAsp
Received-SPF: pass client-ip=220.181.12.13; envelope-from=liq3ea@163.com;
 helo=m12-13.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Li Qiang <liq3ea@163.com>, liq3ea@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently in vhost-user-gpu, we free resource directly in
the cleanup case of resource. If we change the cleanup logic
we need to change several places, also abstruct a
'vg_create_mapping_iov' can be symmetry with the
'vg_create_mapping_iov'. This is like what virtio-gpu does,
no function changed.

Signed-off-by: Li Qiang <liq3ea@163.com>
---
 contrib/vhost-user-gpu/vhost-user-gpu.c | 24 ++++++++++++++++++++----
 contrib/vhost-user-gpu/virgl.c          |  9 +++++----
 contrib/vhost-user-gpu/vugpu.h          |  2 +-
 3 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user-gpu/vhost-user-gpu.c
index 770dfad529..6dc6a44f4e 100644
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
index 7172104b19..3e45e1bd33 100644
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
diff --git a/contrib/vhost-user-gpu/vugpu.h b/contrib/vhost-user-gpu/vugpu.h
index 04d5615812..e2864bba68 100644
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
-- 
2.25.1



