Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2356B30C198
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:30:04 +0100 (CET)
Received: from localhost ([::1]:34932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6wgt-0002C0-1k
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:30:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l6weK-0007wm-V8
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:27:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l6weJ-00030O-3q
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:27:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612276042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hZxn5/y1LDkwsOmG5P9eoyp02iUGT6dW8d6reQHc3bg=;
 b=b9Khj8oNzwRMqvySlqiaOZuPMfjekilUyPukUcSCKStrUAQo4lh/FmsOWOqHX3wKVGtcxK
 2Cu5Lobt3dhAVxpdi5ftgA1Cj0YoybAfG0NCZTTuUqz//hb9LWvpM+H+DH5R6RqWj1IyKz
 /RTquMRHNlWTPz6snMWU1Ai7bJ3PCbo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-gHR6MU5zP6ycklNvhwSHfg-1; Tue, 02 Feb 2021 09:27:18 -0500
X-MC-Unique: gHR6MU5zP6ycklNvhwSHfg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9405985B677
 for <qemu-devel@nongnu.org>; Tue,  2 Feb 2021 14:27:17 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9EA2E60C72;
 Tue,  2 Feb 2021 14:27:06 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 04/20] vhost-user-gpu: handle display-info in a callback
Date: Tue,  2 Feb 2021 18:26:09 +0400
Message-Id: <20210202142625.609070-5-marcandre.lureau@redhat.com>
In-Reply-To: <20210202142625.609070-1-marcandre.lureau@redhat.com>
References: <20210202142625.609070-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 contrib/vhost-user-gpu/vhost-user-gpu.c | 32 ++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user-gpu/vhost-user-gpu.c
index 7dcc02966c..810e227382 100644
--- a/contrib/vhost-user-gpu/vhost-user-gpu.c
+++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
@@ -261,10 +261,32 @@ vg_ctrl_response_nodata(VuGpu *g,
     vg_ctrl_response(g, cmd, &resp, sizeof(resp));
 }
 
+
+static gboolean
+get_display_info_cb(gint fd, GIOCondition condition, gpointer user_data)
+{
+    struct virtio_gpu_resp_display_info dpy_info = { {} };
+    VuGpu *vg = user_data;
+    struct virtio_gpu_ctrl_command *cmd = QTAILQ_LAST(&vg->fenceq);
+
+    g_debug("disp info cb");
+    assert(cmd->cmd_hdr.type == VIRTIO_GPU_CMD_GET_DISPLAY_INFO);
+    if (!vg_recv_msg(vg, VHOST_USER_GPU_GET_DISPLAY_INFO, sizeof(dpy_info), &dpy_info)) {
+        return G_SOURCE_CONTINUE;
+    }
+
+    QTAILQ_REMOVE(&vg->fenceq, cmd, next);
+    vg_ctrl_response(vg, cmd, &dpy_info.hdr, sizeof(dpy_info));
+
+    vg->wait_in = 0;
+    vg_handle_ctrl(&vg->dev.parent, 0);
+
+    return G_SOURCE_REMOVE;
+}
+
 void
 vg_get_display_info(VuGpu *vg, struct virtio_gpu_ctrl_command *cmd)
 {
-    struct virtio_gpu_resp_display_info dpy_info = { {} };
     VhostUserGpuMsg msg = {
         .request = VHOST_USER_GPU_GET_DISPLAY_INFO,
         .size = 0,
@@ -273,11 +295,9 @@ vg_get_display_info(VuGpu *vg, struct virtio_gpu_ctrl_command *cmd)
     assert(vg->wait_in == 0);
 
     vg_send_msg(vg, &msg, -1);
-    if (!vg_recv_msg(vg, msg.request, sizeof(dpy_info), &dpy_info)) {
-        return;
-    }
-
-    vg_ctrl_response(vg, cmd, &dpy_info.hdr, sizeof(dpy_info));
+    vg->wait_in = g_unix_fd_add(vg->sock_fd, G_IO_IN | G_IO_HUP,
+                               get_display_info_cb, vg);
+    cmd->state = VG_CMD_STATE_PENDING;
 }
 
 static void
-- 
2.29.0


