Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF0654A8A9
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 07:23:00 +0200 (CEST)
Received: from localhost ([::1]:39618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0z11-0000zr-V5
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 01:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o0yvR-0000zC-Lq
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 01:17:14 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:35677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o0yvQ-00010l-5j
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 01:17:13 -0400
Received: by mail-pg1-x535.google.com with SMTP id 129so7545130pgc.2
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 22:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tpwj4iCawFu7SFnzkW//trv7YNVTZc0mprYQAMb2zUk=;
 b=ZlLwPVUVQpjqTqGXsqkJho8Mxf2tcmCHSOsx2hwofRapJbbKIjGYv6k/jfoFG8xFQm
 Usr9+gTLPuewc5mGastk6rHxB7tWmI9mqJGRqLIPLdrgvHpYdIcRgU0VjmZe1GKdTMrz
 a2alJpILxjPeZAKnwCdRr3ydWoQRX6W2CuEhm3+JVgggQ0nmh/VEyXcd0ZODD4MzC9Rc
 7A2BEDKO2Hfv5n6VBrWnUxuixxRN2ZEb5hsQUXzWoedBsqEk7L16PZNPijR0Qlts5Y1C
 eEb6+kyTXHiAs8F0Tk5cHdxcltG3ivRgJL7HAHfZxh+DG1Kw8QbI4gFgvwDrAyB/GC01
 lCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tpwj4iCawFu7SFnzkW//trv7YNVTZc0mprYQAMb2zUk=;
 b=yPhSKnWsQdh2j2iLG3HGQJ6cjjPxp/Ry0je8LuZI0jEAgm/+7p7W1yoLnQB/cHk4d5
 5LbGu5uoWTPxt4G4Yw75tOUOKx3Iu3LLPCRE/HUXAxnahky+p+u5LXe7oNZQ8Ql+B238
 hiGEf4vHjjX6LLehOgauZ91sx2vsWaiVhTUUf4mE3gSCTTAkehPSHRp5Err3+HX+SsJB
 fyegsVapfB/aOPcE/WwvAzI9kiYBMmpXzrGKD7dYLjlk+Om0vIBtIUaAWxIpRaoON+zc
 qN0r9L1amBlTp+PGsFjBD5ql5eReedpClPO2ek2QqKjiLlw98LXFb2G6Q+ZnLTvd1ZEU
 YrWA==
X-Gm-Message-State: AOAM532EtQpiugXHrJ3C49aWsrQPlj8og9MyZTBaBy+NkG0XcmKpflfZ
 2acGWpIjrV/Y6yNZKO0XX2CO
X-Google-Smtp-Source: ABdhPJzq7Y6ZHXH/e5c72FwHfmq5QH72mJWroTJvj1KNg9WBWk03Rihp01VRM9ddHWIBs/7SqJQISg==
X-Received: by 2002:a63:81c3:0:b0:3fc:c510:1a3 with SMTP id
 t186-20020a6381c3000000b003fcc51001a3mr2892423pgd.581.1655183830870; 
 Mon, 13 Jun 2022 22:17:10 -0700 (PDT)
Received: from localhost ([139.177.225.237]) by smtp.gmail.com with ESMTPSA id
 e2-20020a170902b78200b00161fab018dfsm6071772pls.256.2022.06.13.22.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 22:17:10 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: kwolf@redhat.com,
	stefanha@redhat.com
Cc: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 4/6] vduse-blk: Don't delete the export until all inflight
 I/Os completed
Date: Tue, 14 Jun 2022 13:15:30 +0800
Message-Id: <20220614051532.92-5-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614051532.92-1-xieyongji@bytedance.com>
References: <20220614051532.92-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=xieyongji@bytedance.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Don't delete the export until all inflight I/Os completed.
Otherwise, it might lead to a use-after-free.

Fixes: cc241b5505b2 ("vduse-blk: Implement vduse-blk export")
Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 block/export/vduse-blk.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/block/export/vduse-blk.c b/block/export/vduse-blk.c
index c3a89894ae..251d73c841 100644
--- a/block/export/vduse-blk.c
+++ b/block/export/vduse-blk.c
@@ -31,6 +31,7 @@ typedef struct VduseBlkExport {
     VduseDev *dev;
     uint16_t num_queues;
     char *recon_file;
+    unsigned int inflight;
 } VduseBlkExport;
 
 typedef struct VduseBlkReq {
@@ -38,6 +39,18 @@ typedef struct VduseBlkReq {
     VduseVirtq *vq;
 } VduseBlkReq;
 
+static void vduse_blk_inflight_inc(VduseBlkExport *vblk_exp)
+{
+    vblk_exp->inflight++;
+}
+
+static void vduse_blk_inflight_dec(VduseBlkExport *vblk_exp)
+{
+    if (--vblk_exp->inflight == 0) {
+        aio_wait_kick();
+    }
+}
+
 static void vduse_blk_req_complete(VduseBlkReq *req, size_t in_len)
 {
     vduse_queue_push(req->vq, &req->elem, in_len);
@@ -68,10 +81,13 @@ static void coroutine_fn vduse_blk_virtio_process_req(void *opaque)
     }
 
     vduse_blk_req_complete(req, in_len);
+    vduse_blk_inflight_dec(vblk_exp);
 }
 
 static void vduse_blk_vq_handler(VduseDev *dev, VduseVirtq *vq)
 {
+    VduseBlkExport *vblk_exp = vduse_dev_get_priv(dev);
+
     while (1) {
         VduseBlkReq *req;
 
@@ -83,6 +99,8 @@ static void vduse_blk_vq_handler(VduseDev *dev, VduseVirtq *vq)
 
         Coroutine *co =
             qemu_coroutine_create(vduse_blk_virtio_process_req, req);
+
+        vduse_blk_inflight_inc(vblk_exp);
         qemu_coroutine_enter(co);
     }
 }
@@ -168,6 +186,8 @@ static void vduse_blk_detach_ctx(VduseBlkExport *vblk_exp)
     }
     aio_set_fd_handler(vblk_exp->export.ctx, vduse_dev_get_fd(vblk_exp->dev),
                        true, NULL, NULL, NULL, NULL, NULL);
+
+    AIO_WAIT_WHILE(vblk_exp->export.ctx, vblk_exp->inflight > 0);
 }
 
 
@@ -332,7 +352,9 @@ static void vduse_blk_exp_request_shutdown(BlockExport *exp)
 {
     VduseBlkExport *vblk_exp = container_of(exp, VduseBlkExport, export);
 
+    aio_context_acquire(vblk_exp->export.ctx);
     vduse_blk_detach_ctx(vblk_exp);
+    aio_context_acquire(vblk_exp->export.ctx);
 }
 
 const BlockExportDriver blk_exp_vduse_blk = {
-- 
2.20.1


