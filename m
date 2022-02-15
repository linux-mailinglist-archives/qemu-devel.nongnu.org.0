Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C13AA4B6A60
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 12:11:33 +0100 (CET)
Received: from localhost ([::1]:32906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJvk4-00018M-R8
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 06:11:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nJvZz-0001KW-Kk
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 06:01:07 -0500
Received: from [2607:f8b0:4864:20::435] (port=46829
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nJvZh-0006Xd-8H
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 06:00:58 -0500
Received: by mail-pf1-x435.google.com with SMTP id i21so32779409pfd.13
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 03:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EOfvj55C/TNM6rEOghnoA20gYdAu5z1kQnCsmHRpBHo=;
 b=3FJnV7Xo57WHVopxF4gjeqRzOZANtg05vLcLd3GRw0QJ9SBC8aIsavJ4BjvF+Sxc1h
 acRId0b4URF0EC8FECETQWQR1Fb0YWUULI+yPI0MO+oqOb/2JpN1zdzeaXikWsHOcxXa
 eEtOCYuezsUHTfv+luRiXoWspG1DvpgLZuRpqLmAlPrM7SbFUBdCR3ZhSEa7qVo0Lg38
 yJRSiuE1YUz4wXzyMwYvC+ttmWx6/ZyHiq3dWVyM+Mw3rGQANxOmlETMnqI1PlUUBcGQ
 KY7NxSn56goMCnP6UONy4g0mJLHqk4Q9xZ3fio/b8KTZwLmbVzCNlCLm9IF/HxNuoMxi
 s9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EOfvj55C/TNM6rEOghnoA20gYdAu5z1kQnCsmHRpBHo=;
 b=Nz+K31jhZOzRPOosTjFUbDQdzWwkIdQ1Al4mV4KWnJTc/bb2f8SvJ440iZOx7/rZ7F
 EhGDCSwRmTxTD0IoJSyYn7AuaLaR598+thLtF0Dot/TCyhkM5HLqdxbqyYqIY9aZmRoA
 as8hxDFN81GEppnd+3DqfR8wghnoMJOKAK0W8XcQM8BJ9/MLt+mNgHtG9QcT0FTU1RSi
 6AUC8ZlRlBZ/xF7f5QB1xyg3xAVOpQG0QqveqbbVwiKTSvRJRxdy6sbnJvbWG/GVnTi7
 dxGWIVlED7apiRGLHcGktSLxC29Z+iu2Gt4BLFL4jEgDvAHVBPQYPV8Pr1stmoOo9zJ0
 dQWQ==
X-Gm-Message-State: AOAM533nkAC4woNOfXq3dWrrNPfmPduyMRPktt2PSbuFjztQYMTx+sWs
 6HWWALMVzFZvvYGGH3E2tj8B
X-Google-Smtp-Source: ABdhPJwcP9TKViWaElpj7OYM2EyQ4QeNYfyLmVqc6We1rm9bk6eKeSVHn+9yU3eemVjXnr4bkuN7oQ==
X-Received: by 2002:a63:a4f:: with SMTP id z15mr38111pgk.67.1644922848050;
 Tue, 15 Feb 2022 03:00:48 -0800 (PST)
Received: from localhost ([139.177.225.253])
 by smtp.gmail.com with ESMTPSA id y8sm6089969pfa.132.2022.02.15.03.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 03:00:47 -0800 (PST)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 sgarzare@redhat.com, kwolf@redhat.com, mreitz@redhat.com,
 mlureau@redhat.com
Subject: [PATCH v2 5/6] vduse-blk: Add vduse-blk resize support
Date: Tue, 15 Feb 2022 18:59:42 +0800
Message-Id: <20220215105943.90-6-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220215105943.90-1-xieyongji@bytedance.com>
References: <20220215105943.90-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=xieyongji@bytedance.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To support block resize, this uses vduse_dev_update_config()
to update the capacity field in configuration space and inject
config interrupt on the block resize callback.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 block/export/vduse-blk.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/block/export/vduse-blk.c b/block/export/vduse-blk.c
index 942f985de3..e456dfe2b3 100644
--- a/block/export/vduse-blk.c
+++ b/block/export/vduse-blk.c
@@ -309,6 +309,23 @@ static void blk_aio_detach(void *opaque)
     vblk_exp->export.ctx = NULL;
 }
 
+static void vduse_blk_resize(void *opaque)
+{
+    BlockExport *exp = opaque;
+    VduseBlkExport *vblk_exp = container_of(exp, VduseBlkExport, export);
+    struct virtio_blk_config config;
+
+    config.capacity =
+            cpu_to_le64(blk_getlength(exp->blk) >> VIRTIO_BLK_SECTOR_BITS);
+    vduse_dev_update_config(vblk_exp->dev, sizeof(config.capacity),
+                            offsetof(struct virtio_blk_config, capacity),
+                            (char *)&config.capacity);
+}
+
+static const BlockDevOps vduse_block_ops = {
+    .resize_cb = vduse_blk_resize,
+};
+
 static int vduse_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
                                 Error **errp)
 {
@@ -400,6 +417,8 @@ static int vduse_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
     blk_add_aio_context_notifier(exp->blk, blk_aio_attached, blk_aio_detach,
                                  vblk_exp);
 
+    blk_set_dev_ops(exp->blk, &vduse_block_ops, exp);
+
     return 0;
 }
 
@@ -409,6 +428,7 @@ static void vduse_blk_exp_delete(BlockExport *exp)
 
     blk_remove_aio_context_notifier(exp->blk, blk_aio_attached, blk_aio_detach,
                                     vblk_exp);
+    blk_set_dev_ops(exp->blk, NULL, NULL);
     vduse_dev_destroy(vblk_exp->dev);
 }
 
-- 
2.20.1


