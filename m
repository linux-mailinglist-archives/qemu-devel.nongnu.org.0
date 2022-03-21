Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5359B4E2168
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 08:32:20 +0100 (CET)
Received: from localhost ([::1]:55514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWCWZ-00009L-Am
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 03:32:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nWCGk-0006GZ-9v
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 03:15:58 -0400
Received: from [2607:f8b0:4864:20::42f] (port=40587
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nWCGi-00029e-74
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 03:15:57 -0400
Received: by mail-pf1-x42f.google.com with SMTP id d19so14675796pfv.7
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 00:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NYfafDfSkNBK2aczPt0Kqmqq/2IPh1zbw3QPotKvIic=;
 b=ydZyJweGjjS052mr5KqVpwXd7+mIJlrURtlQQ1jXQMadvzbBtFK0V9gQJGyLrQN6CB
 X6y9TOUOEVkBHmSqz7M1AC7Qx4ZmJRSkxambdlb+C5Be7DRmqt7eUmM5kaJLQPvtL1jk
 NpusIp26oVopd+RrMoIOR+gw3Eiv5RN5NpWGIlBNOed+/1oO1qvBt1Djdj01rmmu5kf2
 A2fE5Jm3QfyJkkGBH66X6MPAnKPGSFhYsBULIb1KtMszbJnP8yZchnM3olm+xL7teWFR
 IjcBcFYn1o/dBakx+Fu/szt6FVhCBYAsLXbjvDHDZ2I+L3rtaTQ0Q75MZkfOF82bkaQK
 q+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NYfafDfSkNBK2aczPt0Kqmqq/2IPh1zbw3QPotKvIic=;
 b=nvDySf+s+4vFbPZ6uzyd9sqv2pzPGIDifHN0M+IQUEmw4vp9C9mAiEDLKNeU0wN6gf
 xTVqzw5k0D/2FVOCADdWqTvJxMLCaQLrbQ6HOrM5WNHSdIZVYhdXLjO/fIPOkCqRnH/c
 QOi5nKhZ8ZZdVmj0KeuvlGDExAwRg95tuJ/0gCApbTZa1+8uvfPzdoSx5fOkE93E1F/j
 iUe+Kww5GbekeUxUBo3q18iHjq1KoyluTXq8yRN0hGoyUzvekZGv9I9pcHHsKuOKN9Mh
 /USHCY2WlX6UsQN6qdrp/AW6B/y1hCcBqgKCwCaRt6q4DLrOKcZS2CLaSNL3nxITkZhB
 SCwA==
X-Gm-Message-State: AOAM533QRl+7mJulTpwtWAt/1IGAL2WB3zYdyVBn9Ij+f0mdzM8EJ1G4
 +urGSohFAFBWXe68cmh8B6TI
X-Google-Smtp-Source: ABdhPJxG+XKjTDYy4FMu1KIrntCUKlUyYDaEvSy2vn/+mhtsSMIgmeBvPy4jGp6ET8VATT8Imp8SWg==
X-Received: by 2002:a05:6a00:724:b0:4fa:a35f:8e0f with SMTP id
 4-20020a056a00072400b004faa35f8e0fmr3256485pfm.25.1647846954998; 
 Mon, 21 Mar 2022 00:15:54 -0700 (PDT)
Received: from localhost ([139.177.225.230]) by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm13524179pgj.85.2022.03.21.00.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 00:15:54 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 sgarzare@redhat.com, kwolf@redhat.com, mreitz@redhat.com,
 mlureau@redhat.com, jsnow@redhat.com
Subject: [PATCH v3 5/6] vduse-blk: Add vduse-blk resize support
Date: Mon, 21 Mar 2022 15:14:38 +0800
Message-Id: <20220321071439.151-6-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220321071439.151-1-xieyongji@bytedance.com>
References: <20220321071439.151-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=xieyongji@bytedance.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
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
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/export/vduse-blk.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/block/export/vduse-blk.c b/block/export/vduse-blk.c
index 3f4e0df34b..e027b2e5ff 100644
--- a/block/export/vduse-blk.c
+++ b/block/export/vduse-blk.c
@@ -310,6 +310,23 @@ static void blk_aio_detach(void *opaque)
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
@@ -397,6 +414,8 @@ static int vduse_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
     blk_add_aio_context_notifier(exp->blk, blk_aio_attached, blk_aio_detach,
                                  vblk_exp);
 
+    blk_set_dev_ops(exp->blk, &vduse_block_ops, exp);
+
     return 0;
 }
 
@@ -406,6 +425,7 @@ static void vduse_blk_exp_delete(BlockExport *exp)
 
     blk_remove_aio_context_notifier(exp->blk, blk_aio_attached, blk_aio_detach,
                                     vblk_exp);
+    blk_set_dev_ops(exp->blk, NULL, NULL);
     vduse_dev_destroy(vblk_exp->dev);
 }
 
-- 
2.20.1


