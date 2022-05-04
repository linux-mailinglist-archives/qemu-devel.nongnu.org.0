Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 490E05198A7
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 09:49:19 +0200 (CEST)
Received: from localhost ([::1]:60368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm9l8-00061w-6X
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 03:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nm9dF-0002d8-C4
 for qemu-devel@nongnu.org; Wed, 04 May 2022 03:41:20 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:53116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nm9dC-00075J-VQ
 for qemu-devel@nongnu.org; Wed, 04 May 2022 03:41:09 -0400
Received: by mail-pj1-x1031.google.com with SMTP id e24so523750pjt.2
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 00:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xk261oHbXKFFnsukENd6oL02N15hbamNQACtPikcMSk=;
 b=MtiB/xPsRn1rHqMJnCx8eSuq4M7QvEwDZVL4E3fmXjduSgjIwgHG+w/Yh4C1YrnbED
 OXUXJOyGaaGLYDdReFm0NZNdyhCxXYBOIDvv8+sbNIHnm/kMY++sWk+Xi0+r86H3wBum
 UMwZiGVXp++ZaJOfgL7Q+O6bUopA0BUBKi1OxD+T/MTq0Rw4b2+F0aEnBxf2PcI8TyB2
 RWNnRN5WdRpDMrb/ylz3NDm1d/xLUZR4BQ31p+6POt53sRzG4UA9t5i0ni7JGmpVUhZz
 7Zjjc3ekLpML76f39Ol/UHLdCU4DJfvvoLIbeEdvr0ZSnKnBTwcL7BsvHiegQGeJtmxt
 CJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xk261oHbXKFFnsukENd6oL02N15hbamNQACtPikcMSk=;
 b=YDJm7UqlQCDGRqUxn+Wj5eI+zzBqRSOQ/W7HYJTMzsjPcUgpEbXKgBXLAioeM4vadE
 m6ZvqM9jLVIgB+4SFXJaSEUM70lusAWAnijPaS01vVFNXiB+2KrR1+jeNIE62ezUUq+P
 lshEjzFnGv3YANVmY5oc+9hSSAf6Cu5vbMqz5GGNSjhwiT6ms01krV1ahDsPGjjurm7q
 PPl83mlk94V5Y2VLwvFiThxKwguwst+hGuuMM3uu+lmBydLqbHwPOQx08VCsuESAFKjC
 qDvVogGF2UtJ1Au5DtmciCReQwr0Lmg47gHDa/KOFoEfHyIb5K1a129vM54907/kaNkw
 rtNQ==
X-Gm-Message-State: AOAM530KsrjpSJ4NTDbkarDHTJtfXf4daWFNPzSr/iM2Ix4joaSZCC6P
 SjN2w2mE7wIRBgLeMcF1boqW
X-Google-Smtp-Source: ABdhPJxTfVtXy8swI6avJk+u6PipbaKq3Xzcl1In4D81Xl6gD1bsU1W5NPdGIUxlIqBn5BfVNf6IXQ==
X-Received: by 2002:a17:90b:1d03:b0:1dc:9589:7c90 with SMTP id
 on3-20020a17090b1d0300b001dc95897c90mr3769593pjb.225.1651650065260; 
 Wed, 04 May 2022 00:41:05 -0700 (PDT)
Received: from localhost ([139.177.225.233]) by smtp.gmail.com with ESMTPSA id
 i3-20020a17090a718300b001d6a79768b6sm2584446pjk.49.2022.05.04.00.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 00:41:04 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 sgarzare@redhat.com, kwolf@redhat.com, mreitz@redhat.com,
 mlureau@redhat.com, jsnow@redhat.com, eblake@redhat.com,
 Coiby.Xu@gmail.com, hreitz@redhat.com
Cc: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v5 7/8] vduse-blk: Add vduse-blk resize support
Date: Wed,  4 May 2022 15:40:50 +0800
Message-Id: <20220504074051.90-8-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504074051.90-1-xieyongji@bytedance.com>
References: <20220504074051.90-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=xieyongji@bytedance.com; helo=mail-pj1-x1031.google.com
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

To support block resize, this uses vduse_dev_update_config()
to update the capacity field in configuration space and inject
config interrupt on the block resize callback.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/export/vduse-blk.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/block/export/vduse-blk.c b/block/export/vduse-blk.c
index 8580ae929f..2b72baf7ab 100644
--- a/block/export/vduse-blk.c
+++ b/block/export/vduse-blk.c
@@ -188,6 +188,23 @@ static void blk_aio_detach(void *opaque)
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
@@ -284,6 +301,8 @@ static int vduse_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
     blk_add_aio_context_notifier(exp->blk, blk_aio_attached, blk_aio_detach,
                                  vblk_exp);
 
+    blk_set_dev_ops(exp->blk, &vduse_block_ops, exp);
+
     return 0;
 }
 
@@ -293,6 +312,7 @@ static void vduse_blk_exp_delete(BlockExport *exp)
 
     blk_remove_aio_context_notifier(exp->blk, blk_aio_attached, blk_aio_detach,
                                     vblk_exp);
+    blk_set_dev_ops(exp->blk, NULL, NULL);
     vduse_dev_destroy(vblk_exp->dev);
 }
 
-- 
2.20.1


