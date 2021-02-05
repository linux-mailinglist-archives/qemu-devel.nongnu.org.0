Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 896AC31054F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 08:01:08 +0100 (CET)
Received: from localhost ([::1]:47320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7v71-0006PB-KP
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 02:01:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7v33-0001FP-V0
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 01:56:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7v32-0001C1-AY
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 01:56:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612508215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ODlFtiXcFydMtAFzB9dcs2SavlkPLgXXmjRw2Rscpxw=;
 b=XmhEc4pb3ahGl7S7c5Rwdlp0aIuYsQcpZ0t/6ALFfXqmdQMPE9s0txt2m1g0ZOYjgdF0p+
 YrlBzhe/FeGRf03IbLJAoFIq6gIYSkNw2LcZ0ix4rmcXuxPc0I3/OejgtZLzoTndb5j8Fe
 burPAPHZ5mvbx1p3r3jaZ91efLGJNmk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-XF8cF6hlMGm9aVRRGN-bLg-1; Fri, 05 Feb 2021 01:56:54 -0500
X-MC-Unique: XF8cF6hlMGm9aVRRGN-bLg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10A7E192CC44
 for <qemu-devel@nongnu.org>; Fri,  5 Feb 2021 06:56:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-108.ams2.redhat.com
 [10.36.113.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DDC97722C6;
 Fri,  5 Feb 2021 06:56:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C685B18003B4; Fri,  5 Feb 2021 07:56:20 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/24] vhost-user-gpu: handle display-info in a callback
Date: Fri,  5 Feb 2021 07:56:04 +0100
Message-Id: <20210205065620.1726554-9-kraxel@redhat.com>
In-Reply-To: <20210205065620.1726554-1-kraxel@redhat.com>
References: <20210205065620.1726554-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Fixes a deadlock where the backend calls QEMU, while QEMU also calls the
backend simultaneously, both ends waiting for each other.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210204105232.834642-5-marcandre.lureau@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 contrib/vhost-user-gpu/vhost-user-gpu.c | 35 ++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user-gpu/vhost-user-gpu.c
index 7dcc02966ca9..b27990ffdbc0 100644
--- a/contrib/vhost-user-gpu/vhost-user-gpu.c
+++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
@@ -261,10 +261,33 @@ vg_ctrl_response_nodata(VuGpu *g,
     vg_ctrl_response(g, cmd, &resp, sizeof(resp));
 }
 
-void
-vg_get_display_info(VuGpu *vg, struct virtio_gpu_ctrl_command *cmd)
+
+static gboolean
+get_display_info_cb(gint fd, GIOCondition condition, gpointer user_data)
 {
     struct virtio_gpu_resp_display_info dpy_info = { {} };
+    VuGpu *vg = user_data;
+    struct virtio_gpu_ctrl_command *cmd = QTAILQ_LAST(&vg->fenceq);
+
+    g_debug("disp info cb");
+    assert(cmd->cmd_hdr.type == VIRTIO_GPU_CMD_GET_DISPLAY_INFO);
+    if (!vg_recv_msg(vg, VHOST_USER_GPU_GET_DISPLAY_INFO,
+                     sizeof(dpy_info), &dpy_info)) {
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
+void
+vg_get_display_info(VuGpu *vg, struct virtio_gpu_ctrl_command *cmd)
+{
     VhostUserGpuMsg msg = {
         .request = VHOST_USER_GPU_GET_DISPLAY_INFO,
         .size = 0,
@@ -273,11 +296,9 @@ vg_get_display_info(VuGpu *vg, struct virtio_gpu_ctrl_command *cmd)
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
2.29.2


