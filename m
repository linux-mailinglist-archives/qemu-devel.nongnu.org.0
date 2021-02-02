Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D140E30C1B1
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:32:44 +0100 (CET)
Received: from localhost ([::1]:42340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6wjT-0005eS-Tf
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:32:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l6wdu-00079K-U1
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:26:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l6wdt-0002qW-AG
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:26:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612276016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5kVr4+NxZFK0H8CVsMhbXmR7YdDKgqEyyPzMZ0kNsj4=;
 b=g9QqLS8VAL4FOslu4EhGoNcdKPCV9Oi9Joh1LkyCz9yBasF2at+rtZXhBAiLCqHxJaqPRH
 0cFdSJfa8wqyHcjg8hNZ4f96l+weVJJ1i7SvaN4V2jDKxu4yljEY3OdWU84Cb9NphIJPF9
 y4K/z9DlUmk9N9i84Crd3iqwBxNxEbA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-xxNCE92HM62toaFr5X8ZJw-1; Tue, 02 Feb 2021 09:26:55 -0500
X-MC-Unique: xxNCE92HM62toaFr5X8ZJw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4466C9CDA0
 for <qemu-devel@nongnu.org>; Tue,  2 Feb 2021 14:26:54 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DEF2D4D;
 Tue,  2 Feb 2021 14:26:46 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 02/20] vhost-user-gpu: handle vhost-user-gpu features in a
 callback
Date: Tue,  2 Feb 2021 18:26:07 +0400
Message-Id: <20210202142625.609070-3-marcandre.lureau@redhat.com>
In-Reply-To: <20210202142625.609070-1-marcandre.lureau@redhat.com>
References: <20210202142625.609070-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Fixes a deadlock where the backend calls QEMU, while QEMU also calls the
backend simultaneously, both ends waiting for each other.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 contrib/vhost-user-gpu/vugpu.h          |  2 +-
 contrib/vhost-user-gpu/vhost-user-gpu.c | 37 ++++++++++++++++++-------
 2 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/contrib/vhost-user-gpu/vugpu.h b/contrib/vhost-user-gpu/vugpu.h
index ad664c4df8..86f3ac86aa 100644
--- a/contrib/vhost-user-gpu/vugpu.h
+++ b/contrib/vhost-user-gpu/vugpu.h
@@ -118,7 +118,7 @@ typedef struct VuGpu {
     int sock_fd;
     int drm_rnode_fd;
     GSource *renderer_source;
-    guint wait_ok;
+    guint wait_in;
 
     bool virgl;
     bool virgl_inited;
diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user-gpu/vhost-user-gpu.c
index f445ef28ec..85c16404fb 100644
--- a/contrib/vhost-user-gpu/vhost-user-gpu.c
+++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
@@ -124,7 +124,7 @@ source_wait_cb(gint fd, GIOCondition condition, gpointer user_data)
     }
 
     /* resume */
-    g->wait_ok = 0;
+    g->wait_in = 0;
     vg_handle_ctrl(&g->dev.parent, 0);
 
     return G_SOURCE_REMOVE;
@@ -133,8 +133,8 @@ source_wait_cb(gint fd, GIOCondition condition, gpointer user_data)
 void
 vg_wait_ok(VuGpu *g)
 {
-    assert(g->wait_ok == 0);
-    g->wait_ok = g_unix_fd_add(g->sock_fd, G_IO_IN | G_IO_HUP,
+    assert(g->wait_in == 0);
+    g->wait_in = g_unix_fd_add(g->sock_fd, G_IO_IN | G_IO_HUP,
                                source_wait_cb, g);
 }
 
@@ -270,7 +270,7 @@ vg_get_display_info(VuGpu *vg, struct virtio_gpu_ctrl_command *cmd)
         .size = 0,
     };
 
-    assert(vg->wait_ok == 0);
+    assert(vg->wait_in == 0);
 
     vg_send_msg(vg, &msg, -1);
     if (!vg_recv_msg(vg, msg.request, sizeof(dpy_info), &dpy_info)) {
@@ -815,7 +815,7 @@ vg_handle_ctrl(VuDev *dev, int qidx)
     size_t len;
 
     for (;;) {
-        if (vg->wait_ok != 0) {
+        if (vg->wait_in != 0) {
             return;
         }
 
@@ -969,18 +969,17 @@ vg_queue_set_started(VuDev *dev, int qidx, bool started)
     }
 }
 
-static void
-set_gpu_protocol_features(VuGpu *g)
+static gboolean
+protocol_features_cb(gint fd, GIOCondition condition, gpointer user_data)
 {
+    VuGpu *g = user_data;
     uint64_t u64;
     VhostUserGpuMsg msg = {
         .request = VHOST_USER_GPU_GET_PROTOCOL_FEATURES
     };
 
-    assert(g->wait_ok == 0);
-    vg_send_msg(g, &msg, -1);
     if (!vg_recv_msg(g, msg.request, sizeof(u64), &u64)) {
-        return;
+        return G_SOURCE_CONTINUE;
     }
 
     msg = (VhostUserGpuMsg) {
@@ -989,6 +988,24 @@ set_gpu_protocol_features(VuGpu *g)
         .payload.u64 = 0
     };
     vg_send_msg(g, &msg, -1);
+
+    g->wait_in = 0;
+    vg_handle_ctrl(&g->dev.parent, 0);
+
+    return G_SOURCE_REMOVE;
+}
+
+static void
+set_gpu_protocol_features(VuGpu *g)
+{
+    VhostUserGpuMsg msg = {
+        .request = VHOST_USER_GPU_GET_PROTOCOL_FEATURES
+    };
+
+    vg_send_msg(g, &msg, -1);
+    assert(g->wait_in == 0);
+    g->wait_in = g_unix_fd_add(g->sock_fd, G_IO_IN | G_IO_HUP,
+                               protocol_features_cb, g);
 }
 
 static int
-- 
2.29.0


