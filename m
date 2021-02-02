Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E67B30C1B6
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:33:42 +0100 (CET)
Received: from localhost ([::1]:47038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6wkN-0007do-0s
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:33:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l6we5-0007Vo-5u
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:27:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l6we3-0002uY-Bp
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:27:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612276026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eX0974lm+9I+ehw+Y4NHbyrd2U9aeN7RgR9DP8fzj7k=;
 b=XdwJqE6oZfe7aYKKwmcL1gcMYtYozOAoYDCNQhLg3qqmp+7xxdG0jb7HD7dF6NfIpcz+TP
 iEtZK3V4OAz4q0cZAOkhP0xSaaZLc91e/L7FzjCLfGgaV9NFkPYs4GjkojyAc07EpG8AVt
 L0Do09XG717QE1INVGryjLhw+kXBEDI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-paeftFUUNL2sEUZ2sZQJjg-1; Tue, 02 Feb 2021 09:27:03 -0500
X-MC-Unique: paeftFUUNL2sEUZ2sZQJjg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 015D09CDB2
 for <qemu-devel@nongnu.org>; Tue,  2 Feb 2021 14:27:03 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24BFF5B4A6;
 Tue,  2 Feb 2021 14:26:58 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 03/20] vhost-user-gpu: use an extandable state enum for
 commands
Date: Tue,  2 Feb 2021 18:26:08 +0400
Message-Id: <20210202142625.609070-4-marcandre.lureau@redhat.com>
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

Introduce a pending state for commands which aren't finished yet, but
are being handled. See following patch.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 contrib/vhost-user-gpu/vugpu.h          | 8 +++++++-
 contrib/vhost-user-gpu/vhost-user-gpu.c | 8 ++++----
 contrib/vhost-user-gpu/virgl.c          | 2 +-
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/contrib/vhost-user-gpu/vugpu.h b/contrib/vhost-user-gpu/vugpu.h
index 86f3ac86aa..04d5615812 100644
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
index 85c16404fb..7dcc02966c 100644
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
index e647278052..8bb3c563d9 100644
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
2.29.0


