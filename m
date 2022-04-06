Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70ACB4F5738
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 10:12:06 +0200 (CEST)
Received: from localhost ([::1]:59294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc0lp-00027P-6p
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 04:12:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nc0Zk-0003Wu-4N
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 03:59:36 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:43886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nc0Zi-0002kk-M3
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 03:59:35 -0400
Received: by mail-pf1-x42f.google.com with SMTP id x16so1758633pfa.10
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 00:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NYfafDfSkNBK2aczPt0Kqmqq/2IPh1zbw3QPotKvIic=;
 b=lmVRfJ6WvU/t52PH+OR3kUP/ZRnNMMpSsz6Ujo2GL4EniMy80xpcnnG0gitS4bGkpa
 UabSr7n8sX7rnMhCgpe+KPExkWSvdWyTwxsGuIsjYKIGBPqpC/Dxn11cm5qMYFcwxHV1
 q1bH8AEBasMSm9YBfgUDNnyFe9LWjAr0EhSIQZYJHF6XuZE9gkxBRQ3GYsLpFG/w1CxY
 7YoYOKVIeSPnxvNt2nrT+5jsfa0zFb3qkg+eSZEnFFrpd4XlfN2HVXVekAZtVOURgbKP
 onv6UiB5n9ByJQu5lZro6OthVYgYht/oc13ntLMxnyQDWHl1eRi1qszfOHNkAotDLa6e
 7t9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NYfafDfSkNBK2aczPt0Kqmqq/2IPh1zbw3QPotKvIic=;
 b=I+lW6yWfl1GdIr7VT3pgeZyYf96Kuqd1GEbT8aOk+qcZ3+dFDG94I7L510FU3hUlCV
 SlNdXFzIWRzv+Bdxj+KOX1vyOnbf9PZOlBRSqUQKB4FtTeKQtmFddE9ZpYpchEIEPhK3
 5/YYIxCfjxwQZ4VCWoR+G5CsvLk66EU3KsYBHP+ofefLjZFI3d0rSAwVMeHh9bS8sG3h
 3rzb5vp8WPIg/rQqyTjflSAtiLu5MwPF7CS65Z/98OEy9Z0WlMmSQkE0CO6HoB4h16P8
 kokEIrkEGQiSAgbSz9XazONebjBcc+o/8UyI+7TpK/ArZnhDSoub799ZELZ/TACC1eRF
 hXag==
X-Gm-Message-State: AOAM532Co8cbVk73ohTKB8KKe8f6GrafOnR5R/T+gKphIuxh6ee7xwt4
 +O0qgv0L4goA8s4C5TfQZp+7
X-Google-Smtp-Source: ABdhPJwEsahzJhY3/QhD3hGUSjKKFUU2wl/QdKpcUOFTcak8HgSV96qqVjAJ5/IaF/BOf7bTM0Wkkw==
X-Received: by 2002:a63:5d04:0:b0:399:2df0:f667 with SMTP id
 r4-20020a635d04000000b003992df0f667mr6266604pgb.517.1649231973339; 
 Wed, 06 Apr 2022 00:59:33 -0700 (PDT)
Received: from localhost ([139.177.225.247]) by smtp.gmail.com with ESMTPSA id
 y41-20020a056a001ca900b004fb000ccd92sm17064407pfw.96.2022.04.06.00.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 00:59:32 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 sgarzare@redhat.com, kwolf@redhat.com, mreitz@redhat.com,
 mlureau@redhat.com, jsnow@redhat.com, eblake@redhat.com
Subject: [PATCH v4 5/6] vduse-blk: Add vduse-blk resize support
Date: Wed,  6 Apr 2022 15:59:20 +0800
Message-Id: <20220406075921.105-6-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220406075921.105-1-xieyongji@bytedance.com>
References: <20220406075921.105-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=xieyongji@bytedance.com; helo=mail-pf1-x42f.google.com
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


