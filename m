Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B2C54855D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 15:02:40 +0200 (CEST)
Received: from localhost ([::1]:42108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0jiJ-0000h2-6K
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 09:02:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o0jRf-0003Hy-ID
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 08:45:27 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:46686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o0jRZ-0005zg-Tz
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 08:45:27 -0400
Received: by mail-pg1-x529.google.com with SMTP id l4so4366479pgh.13
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 05:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CZ7G7Gujczw3DW8+iuBOrN7bUoP98YSa5d9uHEJ9yLY=;
 b=TqXP022yl6wNwxai99Ut2DOZR9pMvYNPV/tJ+WQQ0Ul/OqZEWsJJNe7uMjZFuU4RDj
 KVW1SbgI4YgmXM6GCzNGOGYRys+FV5t9KBXnx7/LCGLHmUutGk9/UTNOIZhuysTJ6DUY
 vYWTOZcJWgmdmKePG5qEy/qCx5FR/e8SMPL/iRahvh1NYFZ+KIF7MGU1bF+f9fgapUrS
 84wvkFJvl5ACkaZzIq5MGZ/DW8HFlYffGWELLOjQPxuxY++VgGy5z7hCMZAo0KKn+x5R
 HfkpWtmueFcf/DFoDtg81/bL85C7pf6oLLpjHMDJzGxDcuII7pUQtmY9UO1qHXJxHrAZ
 lzDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CZ7G7Gujczw3DW8+iuBOrN7bUoP98YSa5d9uHEJ9yLY=;
 b=KJxQGe+MKPqb9wjlydrY5ey0+aIgmqnxRCLKDELKm+H4y4Ki6e4WlIufknhQ0yJgZr
 GM/JqW6l734sWIuNrkWRad5hB4uBYNsomTFkg/5nVcQNHwT96bEBlQoWxYTuehaztyVq
 VQ2mNkOGZE9wI59sNu1SE2oFd/PKYiZoNhq6+MMCRPO0Oyql6ltJsRvumunnAw4eOuY6
 CHR8JDopXEZ7sTwXZMUCIdeRmqBsU1j28mh38vOStmrM0bZIpDMEmEa6NzQUH4DZVeV3
 27fxszKdwBwOYhywRmDX8L0WNunSQLtqlaHN74IR/8wrcvW4ijXNZmNNkvVav3RrjHJM
 jQaQ==
X-Gm-Message-State: AOAM531kL/nPFRv7+2KRsbzhpRDIaXrrybnhYUPVf7h3+LFxRjR7zYnG
 IztbAjvnAEbP6dqM9ff75d3K
X-Google-Smtp-Source: ABdhPJxRNgoUDcXjY1UlKX/kM4ml3yvzcyrKcVlKuuAcSXS9+nMB8F5kLyfL2mmQhMj7/eIel0PUTw==
X-Received: by 2002:a63:8443:0:b0:3fc:a29a:49ae with SMTP id
 k64-20020a638443000000b003fca29a49aemr52125733pgd.592.1655124320507; 
 Mon, 13 Jun 2022 05:45:20 -0700 (PDT)
Received: from localhost ([139.177.225.252]) by smtp.gmail.com with ESMTPSA id
 iz4-20020a170902ef8400b00162037fbb68sm4986017plb.215.2022.06.13.05.45.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 05:45:18 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: kwolf@redhat.com,
	stefanha@redhat.com
Cc: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 4/5] vduse-blk: Add serial option
Date: Mon, 13 Jun 2022 20:45:02 +0800
Message-Id: <20220613124503.156-5-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613124503.156-1-xieyongji@bytedance.com>
References: <20220613124503.156-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=xieyongji@bytedance.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Add a 'serial' option to allow user to specify this value
explicitly. And the default value is changed to an empty
string as what we did in "hw/block/virtio-blk.c".

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 block/export/vduse-blk.c             | 20 ++++++++++++++------
 block/export/vhost-user-blk-server.c |  4 +++-
 block/export/virtio-blk-handler.h    |  2 +-
 docs/tools/qemu-storage-daemon.rst   |  2 +-
 qapi/block-export.json               |  4 +++-
 storage-daemon/qemu-storage-daemon.c |  1 +
 6 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/block/export/vduse-blk.c b/block/export/vduse-blk.c
index 251d73c841..066e088b00 100644
--- a/block/export/vduse-blk.c
+++ b/block/export/vduse-blk.c
@@ -235,7 +235,7 @@ static int vduse_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
     Error *local_err = NULL;
     struct virtio_blk_config config = { 0 };
     uint64_t features;
-    int i;
+    int i, ret;
 
     if (vblk_opts->has_num_queues) {
         num_queues = vblk_opts->num_queues;
@@ -265,7 +265,8 @@ static int vduse_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
     }
     vblk_exp->num_queues = num_queues;
     vblk_exp->handler.blk = exp->blk;
-    vblk_exp->handler.serial = exp->id;
+    vblk_exp->handler.serial = g_strdup(vblk_opts->has_serial ?
+                                        vblk_opts->serial : "");
     vblk_exp->handler.logical_block_size = logical_block_size;
     vblk_exp->handler.writable = opts->writable;
 
@@ -306,16 +307,16 @@ static int vduse_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
                                      vblk_exp);
     if (!vblk_exp->dev) {
         error_setg(errp, "failed to create vduse device");
-        return -ENOMEM;
+        ret = -ENOMEM;
+        goto err_dev;
     }
 
     vblk_exp->recon_file = g_strdup_printf("%s/vduse-blk-%s",
                                            g_get_tmp_dir(), exp->id);
     if (vduse_set_reconnect_log_file(vblk_exp->dev, vblk_exp->recon_file)) {
         error_setg(errp, "failed to set reconnect log file");
-        vduse_dev_destroy(vblk_exp->dev);
-        g_free(vblk_exp->recon_file);
-        return -EINVAL;
+        ret = -EINVAL;
+        goto err;
     }
 
     for (i = 0; i < num_queues; i++) {
@@ -331,6 +332,12 @@ static int vduse_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
     blk_set_dev_ops(exp->blk, &vduse_block_ops, exp);
 
     return 0;
+err:
+    vduse_dev_destroy(vblk_exp->dev);
+    g_free(vblk_exp->recon_file);
+err_dev:
+    g_free(vblk_exp->handler.serial);
+    return ret;
 }
 
 static void vduse_blk_exp_delete(BlockExport *exp)
@@ -346,6 +353,7 @@ static void vduse_blk_exp_delete(BlockExport *exp)
         unlink(vblk_exp->recon_file);
     }
     g_free(vblk_exp->recon_file);
+    g_free(vblk_exp->handler.serial);
 }
 
 static void vduse_blk_exp_request_shutdown(BlockExport *exp)
diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
index c9c290cc4c..3409d9e02e 100644
--- a/block/export/vhost-user-blk-server.c
+++ b/block/export/vhost-user-blk-server.c
@@ -282,7 +282,7 @@ static int vu_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
         return -EINVAL;
     }
     vexp->handler.blk = exp->blk;
-    vexp->handler.serial = "vhost_user_blk";
+    vexp->handler.serial = g_strdup("vhost_user_blk");
     vexp->handler.logical_block_size = logical_block_size;
     vexp->handler.writable = opts->writable;
 
@@ -296,6 +296,7 @@ static int vu_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
                                  num_queues, &vu_blk_iface, errp)) {
         blk_remove_aio_context_notifier(exp->blk, blk_aio_attached,
                                         blk_aio_detach, vexp);
+        g_free(vexp->handler.serial);
         return -EADDRNOTAVAIL;
     }
 
@@ -308,6 +309,7 @@ static void vu_blk_exp_delete(BlockExport *exp)
 
     blk_remove_aio_context_notifier(exp->blk, blk_aio_attached, blk_aio_detach,
                                     vexp);
+    g_free(vexp->handler.serial);
 }
 
 const BlockExportDriver blk_exp_vhost_user_blk = {
diff --git a/block/export/virtio-blk-handler.h b/block/export/virtio-blk-handler.h
index 1c7a5e32ad..150d44cff2 100644
--- a/block/export/virtio-blk-handler.h
+++ b/block/export/virtio-blk-handler.h
@@ -23,7 +23,7 @@
 
 typedef struct {
     BlockBackend *blk;
-    const char *serial;
+    char *serial;
     uint32_t logical_block_size;
     bool writable;
 } VirtioBlkHandler;
diff --git a/docs/tools/qemu-storage-daemon.rst b/docs/tools/qemu-storage-daemon.rst
index fbeaf76954..034f2809a6 100644
--- a/docs/tools/qemu-storage-daemon.rst
+++ b/docs/tools/qemu-storage-daemon.rst
@@ -77,7 +77,7 @@ Standard options:
   --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,addr.type=unix,addr.path=<socket-path>[,writable=on|off][,logical-block-size=<block-size>][,num-queues=<num-queues>]
   --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,addr.type=fd,addr.str=<fd>[,writable=on|off][,logical-block-size=<block-size>][,num-queues=<num-queues>]
   --export [type=]fuse,id=<id>,node-name=<node-name>,mountpoint=<file>[,growable=on|off][,writable=on|off][,allow-other=on|off|auto]
-  --export [type=]vduse-blk,id=<id>,node-name=<node-name>[,writable=on|off][,num-queues=<num-queues>][,queue-size=<queue-size>][,logical-block-size=<block-size>]
+  --export [type=]vduse-blk,id=<id>,node-name=<node-name>[,writable=on|off][,num-queues=<num-queues>][,queue-size=<queue-size>][,logical-block-size=<block-size>][,serial=<serial-number>]
 
   is a block export definition. ``node-name`` is the block node that should be
   exported. ``writable`` determines whether or not the export allows write
diff --git a/qapi/block-export.json b/qapi/block-export.json
index e4bd4de363..d7aeb1fbf7 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -186,13 +186,15 @@
 # @queue-size: the size of virtqueue. Defaults to 256.
 # @logical-block-size: Logical block size in bytes. Range [512, PAGE_SIZE]
 #                      and must be power of 2. Defaults to 512 bytes.
+# @serial: the serial number of virtio block device. Defaults to empty string.
 #
 # Since: 7.1
 ##
 { 'struct': 'BlockExportOptionsVduseBlk',
   'data': { '*num-queues': 'uint16',
             '*queue-size': 'uint16',
-            '*logical-block-size': 'size'} }
+            '*logical-block-size': 'size',
+            '*serial': 'str' } }
 
 ##
 # @NbdServerAddOptions:
diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index 17fd3f2f5f..4e18d3fc85 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -126,6 +126,7 @@ static void help(void)
 "           [,writable=on|off][,num-queues=<num-queues>]\n"
 "           [,queue-size=<queue-size>]\n"
 "           [,logical-block-size=<logical-block-size>]\n"
+"           [,serial=<serial-number>]\n"
 "                         export the specified block node as a vduse-blk\n"
 "                         device using the id as the VDUSE device name\n"
 "\n"
-- 
2.20.1


