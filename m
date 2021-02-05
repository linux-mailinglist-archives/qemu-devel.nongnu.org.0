Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C97D31057B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 08:10:34 +0100 (CET)
Received: from localhost ([::1]:50090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7vGD-0002Y6-Mm
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 02:10:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7v35-0001KA-MH
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 01:56:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7v32-0001CU-Ao
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 01:56:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612508215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iCC9k4A9Hg5FNLGnO4TwFVx7Xh/2QurpM9k46/rQ+nE=;
 b=LXiazn24m/jtceKVCygecS6losHPUR2m27aqdlLEIztccg2ONhypOymWSAWNwYf/0T2CW5
 EEtuhWXLKq6+2EB2BiXHrr3nYKXv3RLwgXylun+jmWekMOkhFKbSAB5qcAdSjRlPRuZnd1
 mMot/t+ecHxuL2b4bcSrzfZIj/ZLOa8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-0_k5-2xyODyjwglRx7hu6Q-1; Fri, 05 Feb 2021 01:56:53 -0500
X-MC-Unique: 0_k5-2xyODyjwglRx7hu6Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C22C100A8EA
 for <qemu-devel@nongnu.org>; Fri,  5 Feb 2021 06:56:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-108.ams2.redhat.com
 [10.36.113.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DBD3A5C541;
 Fri,  5 Feb 2021 06:56:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BB45118003B3; Fri,  5 Feb 2021 07:56:20 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/24] vhost-user-gpu: use an extandable state enum for commands
Date: Fri,  5 Feb 2021 07:56:03 +0100
Message-Id: <20210205065620.1726554-8-kraxel@redhat.com>
In-Reply-To: <20210205065620.1726554-1-kraxel@redhat.com>
References: <20210205065620.1726554-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

Introduce a pending state for commands which aren't finished yet, but
are being handled. See following patch.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210204105232.834642-4-marcandre.lureau@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 contrib/vhost-user-gpu/vugpu.h          | 8 +++++++-
 contrib/vhost-user-gpu/vhost-user-gpu.c | 8 ++++----
 contrib/vhost-user-gpu/virgl.c          | 2 +-
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/contrib/vhost-user-gpu/vugpu.h b/contrib/vhost-user-gpu/vugpu.h
index 86f3ac86aa33..04d56158123d 100644
--- a/contrib/vhost-user-gpu/vugpu.h
+++ b/contrib/vhost-user-gpu/vugpu.h
@@ -129,12 +129,18 @@ typedef struct VuGpu {
     QTAILQ_HEAD(, virtio_gpu_ctrl_command) fenceq;
 } VuGpu;
 
+enum {
+    VG_CMD_STATE_NEW,
+    VG_CMD_STATE_PENDING,
+    VG_CMD_STATE_FINISHED,
+};
+
 struct virtio_gpu_ctrl_command {
     VuVirtqElement elem;
     VuVirtq *vq;
     struct virtio_gpu_ctrl_hdr cmd_hdr;
     uint32_t error;
-    bool finished;
+    int state;
     QTAILQ_ENTRY(virtio_gpu_ctrl_command) next;
 };
 
diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user-gpu/vhost-user-gpu.c
index 85c16404fb38..7dcc02966ca9 100644
--- a/contrib/vhost-user-gpu/vhost-user-gpu.c
+++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
@@ -246,7 +246,7 @@ vg_ctrl_response(VuGpu *g,
     }
     vu_queue_push(&g->dev.parent, cmd->vq, &cmd->elem, s);
     vu_queue_notify(&g->dev.parent, cmd->vq);
-    cmd->finished = true;
+    cmd->state = VG_CMD_STATE_FINISHED;
 }
 
 void
@@ -800,7 +800,7 @@ vg_process_cmd(VuGpu *vg, struct virtio_gpu_ctrl_command *cmd)
         cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
         break;
     }
-    if (!cmd->finished) {
+    if (cmd->state == VG_CMD_STATE_NEW) {
         vg_ctrl_response_nodata(vg, cmd, cmd->error ? cmd->error :
                                 VIRTIO_GPU_RESP_OK_NODATA);
     }
@@ -825,7 +825,7 @@ vg_handle_ctrl(VuDev *dev, int qidx)
         }
         cmd->vq = vq;
         cmd->error = 0;
-        cmd->finished = false;
+        cmd->state = VG_CMD_STATE_NEW;
 
         len = iov_to_buf(cmd->elem.out_sg, cmd->elem.out_num,
                          0, &cmd->cmd_hdr, sizeof(cmd->cmd_hdr));
@@ -844,7 +844,7 @@ vg_handle_ctrl(VuDev *dev, int qidx)
             vg_process_cmd(vg, cmd);
         }
 
-        if (!cmd->finished) {
+        if (cmd->state != VG_CMD_STATE_FINISHED) {
             QTAILQ_INSERT_TAIL(&vg->fenceq, cmd, next);
             vg->inflight++;
         } else {
diff --git a/contrib/vhost-user-gpu/virgl.c b/contrib/vhost-user-gpu/virgl.c
index e6472780529b..8bb3c563d975 100644
--- a/contrib/vhost-user-gpu/virgl.c
+++ b/contrib/vhost-user-gpu/virgl.c
@@ -482,7 +482,7 @@ void vg_virgl_process_cmd(VuGpu *g, struct virtio_gpu_ctrl_command *cmd)
         break;
     }
 
-    if (cmd->finished) {
+    if (cmd->state != VG_CMD_STATE_NEW) {
         return;
     }
 
-- 
2.29.2


