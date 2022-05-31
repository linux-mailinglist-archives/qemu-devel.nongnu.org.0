Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E0C538E0E
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 11:55:38 +0200 (CEST)
Received: from localhost ([::1]:41350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvybB-0001FM-0q
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 05:55:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nvyXP-00075Q-Pi
 for qemu-devel@nongnu.org; Tue, 31 May 2022 05:51:45 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:42720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nvyXK-0004fk-VL
 for qemu-devel@nongnu.org; Tue, 31 May 2022 05:51:41 -0400
Received: by mail-pl1-x635.google.com with SMTP id d22so12374728plr.9
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 02:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PPeifJ3zkh1kMNRw6sspV7ZaBPrGHdnB2AIXnAKuV64=;
 b=BFZXAZMEDHUHr2JSvcNFhuVWdD0I4DjS9HqMuR5pwkrpXW1dquj1e2o6HKENDO8ovb
 WO68cJb5WtsOECsdnU1/t+uPHTSMLjVO/Q/+PNiMyCv80vk+OVtM30AlReIDBVsXMdLP
 /HXqfa0gIDtO8Fb+hf2ESmTtvhwXcwM2jUrjVqDMes4/095MN8SrnIB0mtMPwfz/85lo
 dfpuVcWrmZxAUP8xWyvnSmsIgCcD4bldyybg086R6dRbX6XWhdsYfQai5oxnqxRqOz46
 tzX4XsbU3kEo8QRXvMKoD8Btyhj6yG909c7HV1OCnitrfrQ/C+KNApJYcCgP7ldvmWtn
 tRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PPeifJ3zkh1kMNRw6sspV7ZaBPrGHdnB2AIXnAKuV64=;
 b=Zq+qK3DpMBt/qpRxkmpyZVK5LByHJqrqCmGAhfTxfbj6xyoqc5ccufa9zA+ZvkWvKD
 TPXhxkOSX41xE+bJz83GQ4WZ16eWdlS+KbeAmVEnDGDtv4/jC9uHs8gsW3oBZVsRmfxX
 xhiGIMbPTGE64SkN9bVZ2YV9MeDdR64qFqeh97w1o24Pqd7Ri4Gf9+xT5bPaIMnFVl+p
 5oH4SydZoHdWab416UM228h1GQazOscrMCkZjD4DkW9k6CfJjgK9oH54TLAIj9OdA6Ft
 E88oUdlVzUftKfI28zbWJO4znWzSBbnnIhLRwzX9lJ5L9cfr+cnxG/BNSafkq131oUgP
 tBhA==
X-Gm-Message-State: AOAM531ab+SjM0ozhpqeFiMJw610uncde7HsUSWVLHktOGnL820hMp1M
 EISgCirwyXhpE4ilHCocsAUK
X-Google-Smtp-Source: ABdhPJyA6quj5g1CJu+8j3DEm1N6EoYbBKXQbWXTTE/KBuji1iy3R+BkemgWmlsvqhxRsLtCcwMFIw==
X-Received: by 2002:a17:90b:3ec3:b0:1e3:42df:12c with SMTP id
 rm3-20020a17090b3ec300b001e342df012cmr1416012pjb.238.1653990696978; 
 Tue, 31 May 2022 02:51:36 -0700 (PDT)
Received: from localhost ([139.177.225.251]) by smtp.gmail.com with ESMTPSA id
 l7-20020a170902f68700b0015e8d4eb1b9sm11056434plg.3.2022.05.31.02.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 02:51:36 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: kwolf@redhat.com,
	stefanha@redhat.com
Cc: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2] vduse-blk: Add name option
Date: Tue, 31 May 2022 17:52:21 +0800
Message-Id: <20220531095221.114-1-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=xieyongji@bytedance.com; helo=mail-pl1-x635.google.com
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

Currently we use 'id' option as the name of VDUSE device.
It's a bit confusing since we use one value for two different
purposes: the ID to identfy the export within QEMU (must be
distinct from any other exports in the same QEMU process, but
can overlap with names used by other processes), and the VDUSE
name to uniquely identify it on the host (must be distinct from
other VDUSE devices on the same host, but can overlap with other
export types like NBD in the same process). To make it clear,
this patch adds a separate 'name ' option to specify the VDUSE
name for the vduse-blk export instead.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 block/export/vduse-blk.c             | 9 ++++++---
 docs/tools/qemu-storage-daemon.rst   | 5 +++--
 qapi/block-export.json               | 7 ++++---
 storage-daemon/qemu-storage-daemon.c | 8 ++++----
 4 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/block/export/vduse-blk.c b/block/export/vduse-blk.c
index 3b10349173..d96993bdf5 100644
--- a/block/export/vduse-blk.c
+++ b/block/export/vduse-blk.c
@@ -245,7 +245,7 @@ static int vduse_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
     }
     vblk_exp->num_queues = num_queues;
     vblk_exp->handler.blk = exp->blk;
-    vblk_exp->handler.serial = exp->id;
+    vblk_exp->handler.serial = g_strdup(vblk_opts->name);
     vblk_exp->handler.logical_block_size = logical_block_size;
     vblk_exp->handler.writable = opts->writable;
 
@@ -279,22 +279,24 @@ static int vduse_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
         features |= 1ULL << VIRTIO_BLK_F_RO;
     }
 
-    vblk_exp->dev = vduse_dev_create(exp->id, VIRTIO_ID_BLOCK, 0,
+    vblk_exp->dev = vduse_dev_create(vblk_opts->name, VIRTIO_ID_BLOCK, 0,
                                      features, num_queues,
                                      sizeof(struct virtio_blk_config),
                                      (char *)&config, &vduse_blk_ops,
                                      vblk_exp);
     if (!vblk_exp->dev) {
         error_setg(errp, "failed to create vduse device");
+        g_free((void *)vblk_exp->handler.serial);
         return -ENOMEM;
     }
 
     vblk_exp->recon_file = g_strdup_printf("%s/vduse-blk-%s",
-                                           g_get_tmp_dir(), exp->id);
+                                           g_get_tmp_dir(), vblk_opts->name);
     if (vduse_set_reconnect_log_file(vblk_exp->dev, vblk_exp->recon_file)) {
         error_setg(errp, "failed to set reconnect log file");
         vduse_dev_destroy(vblk_exp->dev);
         g_free(vblk_exp->recon_file);
+        g_free((void *)vblk_exp->handler.serial);
         return -EINVAL;
     }
 
@@ -323,6 +325,7 @@ static void vduse_blk_exp_delete(BlockExport *exp)
     vduse_dev_destroy(vblk_exp->dev);
     unlink(vblk_exp->recon_file);
     g_free(vblk_exp->recon_file);
+    g_free((void *)vblk_exp->handler.serial);
 }
 
 static void vduse_blk_exp_request_shutdown(BlockExport *exp)
diff --git a/docs/tools/qemu-storage-daemon.rst b/docs/tools/qemu-storage-daemon.rst
index fbeaf76954..8a20ebd304 100644
--- a/docs/tools/qemu-storage-daemon.rst
+++ b/docs/tools/qemu-storage-daemon.rst
@@ -77,7 +77,7 @@ Standard options:
   --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,addr.type=unix,addr.path=<socket-path>[,writable=on|off][,logical-block-size=<block-size>][,num-queues=<num-queues>]
   --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,addr.type=fd,addr.str=<fd>[,writable=on|off][,logical-block-size=<block-size>][,num-queues=<num-queues>]
   --export [type=]fuse,id=<id>,node-name=<node-name>,mountpoint=<file>[,growable=on|off][,writable=on|off][,allow-other=on|off|auto]
-  --export [type=]vduse-blk,id=<id>,node-name=<node-name>[,writable=on|off][,num-queues=<num-queues>][,queue-size=<queue-size>][,logical-block-size=<block-size>]
+  --export [type=]vduse-blk,id=<id>,node-name=<node-name>,name=<vduse-name>[,writable=on|off][,num-queues=<num-queues>][,queue-size=<queue-size>][,logical-block-size=<block-size>]
 
   is a block export definition. ``node-name`` is the block node that should be
   exported. ``writable`` determines whether or not the export allows write
@@ -111,7 +111,8 @@ Standard options:
   ``allow-other`` to auto (the default) will try enabling this option, and on
   error fall back to disabling it.
 
-  The ``vduse-blk`` export type uses the ``id`` as the VDUSE device name.
+  The ``vduse-blk`` export type takes a ``name`` (must be unique across the host)
+  to create the VDUSE device.
   ``num-queues`` sets the number of virtqueues (the default is 1).
   ``queue-size`` sets the virtqueue descriptor table size (the default is 256).
 
diff --git a/qapi/block-export.json b/qapi/block-export.json
index e4bd4de363..f5a2713e59 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -182,6 +182,7 @@
 #
 # A vduse-blk block export.
 #
+# @name: the name of VDUSE device (must be unique across the host).
 # @num-queues: the number of virtqueues. Defaults to 1.
 # @queue-size: the size of virtqueue. Defaults to 256.
 # @logical-block-size: Logical block size in bytes. Range [512, PAGE_SIZE]
@@ -190,7 +191,8 @@
 # Since: 7.1
 ##
 { 'struct': 'BlockExportOptionsVduseBlk',
-  'data': { '*num-queues': 'uint16',
+  'data': { 'name': 'str',
+            '*num-queues': 'uint16',
             '*queue-size': 'uint16',
             '*logical-block-size': 'size'} }
 
@@ -314,8 +316,7 @@
 # Describes a block export, i.e. how single node should be exported on an
 # external interface.
 #
-# @id: A unique identifier for the block export (across the host for vduse-blk
-#      export type or across all export types for other types)
+# @id: A unique identifier for the block export (across all export types)
 #
 # @node-name: The node name of the block node to be exported (since: 5.2)
 #
diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index d47fb2d468..4375282b2e 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -122,11 +122,11 @@ static void help(void)
 #endif /* CONFIG_VHOST_USER_BLK_SERVER */
 #ifdef CONFIG_VDUSE_BLK_EXPORT
 "  --export [type=]vduse-blk,id=<id>,node-name=<node-name>\n"
-"           [,writable=on|off][,num-queues=<num-queues>]\n"
-"           [,queue-size=<queue-size>]\n"
+"           ,name=<vduse-name>[,writable=on|off]\n"
+"           [,num-queues=<num-queues>][,queue-size=<queue-size>]\n"
 "           [,logical-block-size=<logical-block-size>]\n"
-"                         export the specified block node as a vduse-blk\n"
-"                         device using the id as the VDUSE device name\n"
+"                         export the specified block node as a\n"
+"                         vduse-blk device\n"
 "\n"
 #endif /* CONFIG_VDUSE_BLK_EXPORT */
 "  --monitor [chardev=]name[,mode=control][,pretty[=on|off]]\n"
-- 
2.20.1


