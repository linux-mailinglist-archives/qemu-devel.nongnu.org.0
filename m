Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E862530C5A
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 11:38:00 +0200 (CEST)
Received: from localhost ([::1]:54458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt4Vj-0000YK-D6
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 05:37:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nt3n1-0002AN-3a
 for qemu-devel@nongnu.org; Mon, 23 May 2022 04:51:48 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:45958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nt3mt-0000cV-D1
 for qemu-devel@nongnu.org; Mon, 23 May 2022 04:51:42 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 w2-20020a17090ac98200b001e0519fe5a8so1518392pjt.4
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 01:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g7yHpkgF/dQwMATiZoIMH/6ax09zRT4xrq1qJ60gB8Y=;
 b=kPYEyHBuXH9aQLnNJpcgn4RmMqSMAYSr0Ij4gRavWtjVrrnT8roxlXeUeiNcvC0vHW
 sfx/NhuTyJ6eYZ1Pa6sxOhCwe3MatnOppE+NoTkCQUq6Rb4eYOc1KomFzPKeYEsdU64W
 V/D+Cbqu4Y5+cIPq9keIbeJLHkaEKBgNL2DzKrlQHyTDCXQkY5fjzM6ZYi+tm/o58rFY
 2meVnJzVuh4jdKw1jl3hKR6Jt162pddAeYfTA0n77cPawzkshjLfLDP//3xBFujEtF4b
 7BfuAz4ce01utL8FQAn+AZjns95CoX/w/UIgTKmlBqAI+Hy7E/4raWaLyeRrqOL+LuwQ
 tTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g7yHpkgF/dQwMATiZoIMH/6ax09zRT4xrq1qJ60gB8Y=;
 b=r0Y2pB/jqZvELD+nBsU9LQWHPkQtHNNppIwfLDaMK3BRvP3gwNEmzlVgiGPhr+dCXL
 AfZNrf+1WAm4Ig86Z8ZAACTQkfiCBndZK3nxiQ9q29WjEsi4UH4OV3TOPrwKruujShdw
 cut8KstxNcFxMzqcE54ZZ9i5yZ1v9OLFLm2JjtZXdrzVW89vronhPmBYw7ISzMuA0FDq
 7KU5dpNfUbaQF1/p2gPhLns+WeSrRANi2Uj9OXLXOo7OU/n/XSzxKMeQBD8AZT9QA3CW
 4H9E2yPPsp92T7tw9zVaxEGkldPQN4N8qRZDWXkyCXHxrN/plUW/KGPiYoxmvlN+A0qg
 Lblg==
X-Gm-Message-State: AOAM533O3nD7wi7Eue5RkK5Koeqt7KwMexuWIx14b4F/G53lrMyXozUg
 /tuE9t8aVrhTqleG4s67KWDW
X-Google-Smtp-Source: ABdhPJyS2feWnbVWlY+pi/lTYsKy7Oj3PLOkr5qdarfdyFf9u7dvH8ENkh49XJmb7lOy89QnH5ni8A==
X-Received: by 2002:a17:903:1013:b0:162:1ddd:b4d6 with SMTP id
 a19-20020a170903101300b001621dddb4d6mr5607201plb.162.1653295891010; 
 Mon, 23 May 2022 01:51:31 -0700 (PDT)
Received: from localhost ([139.177.225.248]) by smtp.gmail.com with ESMTPSA id
 mg18-20020a17090b371200b001d93118827asm6549491pjb.57.2022.05.23.01.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 01:51:30 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 sgarzare@redhat.com, kwolf@redhat.com, mreitz@redhat.com,
 mlureau@redhat.com, jsnow@redhat.com, eblake@redhat.com,
 Coiby.Xu@gmail.com, hreitz@redhat.com
Cc: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v6 7/8] vduse-blk: Add vduse-blk resize support
Date: Mon, 23 May 2022 16:46:10 +0800
Message-Id: <20220523084611.91-8-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220523084611.91-1-xieyongji@bytedance.com>
References: <20220523084611.91-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=xieyongji@bytedance.com; helo=mail-pj1-x102b.google.com
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

To support block resize, this uses vduse_dev_update_config()
to update the capacity field in configuration space and inject
config interrupt on the block resize callback.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/export/vduse-blk.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/block/export/vduse-blk.c b/block/export/vduse-blk.c
index 143d58a3f2..1040130f52 100644
--- a/block/export/vduse-blk.c
+++ b/block/export/vduse-blk.c
@@ -184,6 +184,23 @@ static void blk_aio_detach(void *opaque)
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
@@ -279,6 +296,8 @@ static int vduse_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
     blk_add_aio_context_notifier(exp->blk, blk_aio_attached, blk_aio_detach,
                                  vblk_exp);
 
+    blk_set_dev_ops(exp->blk, &vduse_block_ops, exp);
+
     return 0;
 }
 
@@ -288,6 +307,7 @@ static void vduse_blk_exp_delete(BlockExport *exp)
 
     blk_remove_aio_context_notifier(exp->blk, blk_aio_attached, blk_aio_detach,
                                     vblk_exp);
+    blk_set_dev_ops(exp->blk, NULL, NULL);
     vduse_dev_destroy(vblk_exp->dev);
 }
 
-- 
2.20.1


