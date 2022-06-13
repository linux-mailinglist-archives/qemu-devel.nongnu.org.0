Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC21854855E
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 15:05:47 +0200 (CEST)
Received: from localhost ([::1]:45356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0jlK-0002zm-6F
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 09:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o0jRg-0003J0-3G
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 08:45:28 -0400
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:35442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o0jRe-00064R-F3
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 08:45:27 -0400
Received: by mail-qv1-xf31.google.com with SMTP id u8so4240423qvj.2
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 05:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tpwj4iCawFu7SFnzkW//trv7YNVTZc0mprYQAMb2zUk=;
 b=YOUgvN/9fxKGg0XUditFHOEJ+eQiZBS8Rphwab8WRfB6B4QjqDuM4TU2IkhYokmU3h
 RMLjNAyPq10zR8RTMece7q+imVH5jdu+ewjOxWt5jTmLokyHVXDxa2fBGVoWa+6usTRi
 Xr9c/eOC5ZiP6BJ1BPZGzzxM5rZdlLLTMNVaHbv6OePiRKEWAFQbg3EksMxxFXQVbaQm
 Arm/k6FFaETVy2gIR4CKSTra+aZ93Q3Cm9zZXKlLIAyYkwOlwUPEWR20ObqCHAf+3KK1
 0cBDlJqS9wrSiL5cjr97L8W3ODqQu6XqkQFXSgu60NC4WNO8bOtRxStTaenvtUq9ATnM
 pwAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tpwj4iCawFu7SFnzkW//trv7YNVTZc0mprYQAMb2zUk=;
 b=iurNrjRyZY2tKMMix+lQvxt8YJqk5CaZPDc0oTfvk2rx8KPVRpzUPwsBmXOPOuSFP7
 8SPRtsuShSg5nzSFKFieQ3f+ZBmNgzO+v1SJHxJkmLqvz27bFeORkemQimsTp2RjuFqo
 cdvEBhSCZXvBOock/NpKvR7Y9jEhKQco2trR3avKHIMzjI35rIoBikWIpQlhWZFdWuyw
 i5nR+guc5Y5Prxyp+1+pORIBWkRQ1lEBgQln1liIwD0l6s+4YXxfqT18c4BbGdyENHTP
 eldQrwVALaS0+t7JAc1jXmCCZ+i4f1xyliAJZboiHJOtHyJ/grvEZeSftK4Fvw4zLwEY
 QB3g==
X-Gm-Message-State: AOAM530f/l7/HrTqjvfLBzkbt/Lf2a3a+gF9KuZg2jiO7+Cj9hqtQnb1
 xet+JTVy2pycXcgXkv5dM6uYHo/AkXn/EgE=
X-Google-Smtp-Source: ABdhPJxje0I+Uw6FfvHWPZMCgGaiH+9RKF51u7zEdjcoscAlKOdvYcQUM+De9/7N76ByloZp3rrdww==
X-Received: by 2002:a05:6a00:170b:b0:51b:cf4b:9187 with SMTP id
 h11-20020a056a00170b00b0051bcf4b9187mr57176893pfc.15.1655124314732; 
 Mon, 13 Jun 2022 05:45:14 -0700 (PDT)
Received: from localhost ([139.177.225.252]) by smtp.gmail.com with ESMTPSA id
 pg8-20020a17090b1e0800b001e28e80a8d6sm5112097pjb.38.2022.06.13.05.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 05:45:13 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: kwolf@redhat.com,
	stefanha@redhat.com
Cc: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/5] vduse-blk: Don't delete the export until all inflight
 I/Os completed
Date: Mon, 13 Jun 2022 20:45:01 +0800
Message-Id: <20220613124503.156-4-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613124503.156-1-xieyongji@bytedance.com>
References: <20220613124503.156-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=xieyongji@bytedance.com; helo=mail-qv1-xf31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


