Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC33E49B74F
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 16:13:15 +0100 (CET)
Received: from localhost ([::1]:43026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCNVS-0000BA-3X
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 10:13:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nCLig-0007UM-6M
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 08:18:46 -0500
Received: from [2607:f8b0:4864:20::42c] (port=43007
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nCLic-0004yq-4I
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 08:18:44 -0500
Received: by mail-pf1-x42c.google.com with SMTP id i65so19761598pfc.9
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 05:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZhUP6tzgIUuEFUocSB3GImvp6pcvsV2mbRYLaepuFtU=;
 b=5FLH3dQfWEv+Z2mVjVhk9QXmMM6PSKT7Mt1A3FI2nYOFobv9NmqfYbKaxvn/2hrvl8
 gt5gqcYpo/J2Hxi38xgUKPEx7dYHANClK7WMSe3GdpB1Rp55tRCwZsupje8STF8YDFCT
 YoKuAAkZRNORPSPQaufBpnwpvg82CU8FRLX0oiFvF7Av7JPf0qivjALQQqGZtKjDhExb
 rKO11O5xlUZrr4KxVTz3LNp6rvL6ebGhnXi8SbjQhkvnfM3CiCUwV1TuIW25o4Kz6XRW
 OKSmeEjcXkJJbnS7L0dsb5IwGAvNAk2asw8qyr/kgskl5V9u6dJ3TBE6Pfype/ioTdeF
 Q1Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZhUP6tzgIUuEFUocSB3GImvp6pcvsV2mbRYLaepuFtU=;
 b=FF3ecOBcSwdfF9xFJd0TZ61P5jpKcURV0osOIxv2J1OLgaYnbBDTfhKz8xN0NS0y/f
 /l8XsuudsZv0LUuKAL7rcMRrhxVfJvIFSOqIYZpDB5R2lb3ceN1liFfhMW3HZ/9oE8tP
 GexbhK8EG3tCk7Xd4qA+bWnT88AB+WXxFPiMPzXrFc8e+wBIgfFStPgaMVKJ4FwkOMXl
 O9xePmYQmRyycRqzsZC7OH4P1eUvlMkWEfmb7EyBstuAyw5fylLVTJrTXUhVSdQ9B63U
 EOBBp1p3nPLhJtxgsCjegWvGM+Lntyne5+R/3bqnD4dPkTol7E6v0gIo37E0oRUD59s7
 Cl1Q==
X-Gm-Message-State: AOAM533oTfWH692YPd8zOjN4PnOAvT9slz1fpjv1Xw2xBmNE7wFlxfkM
 +ROEXyXbZ9xHl0cbhYa3Wx5y
X-Google-Smtp-Source: ABdhPJwf3ZYtkgkd3CbCtSFOeyJcfnJ2T25Y50mTqai2wSv51thQxW1x8SbsEyDaPg+Sm1vCai9ZXA==
X-Received: by 2002:a05:6a00:1a0c:b0:4cb:231:1981 with SMTP id
 g12-20020a056a001a0c00b004cb02311981mr1459472pfv.55.1643116720885; 
 Tue, 25 Jan 2022 05:18:40 -0800 (PST)
Received: from localhost ([139.177.225.253])
 by smtp.gmail.com with ESMTPSA id t15sm449631pjy.17.2022.01.25.05.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 05:18:40 -0800 (PST)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 sgarzare@redhat.com, kwolf@redhat.com, mreitz@redhat.com,
 mlureau@redhat.com
Subject: [PATCH 4/5] vduse-blk: Add vduse-blk resize support
Date: Tue, 25 Jan 2022 21:17:59 +0800
Message-Id: <20220125131800.91-5-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125131800.91-1-xieyongji@bytedance.com>
References: <20220125131800.91-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=xieyongji@bytedance.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 block/export/vduse-blk.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/block/export/vduse-blk.c b/block/export/vduse-blk.c
index 5a8d289685..83845e9a9a 100644
--- a/block/export/vduse-blk.c
+++ b/block/export/vduse-blk.c
@@ -297,6 +297,23 @@ static void blk_aio_detach(void *opaque)
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
@@ -387,6 +404,8 @@ static int vduse_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
     blk_add_aio_context_notifier(exp->blk, blk_aio_attached, blk_aio_detach,
                                  vblk_exp);
 
+    blk_set_dev_ops(exp->blk, &vduse_block_ops, exp);
+
     return 0;
 }
 
-- 
2.20.1


