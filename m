Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB4E548555
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 14:56:10 +0200 (CEST)
Received: from localhost ([::1]:35380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0jc1-00047V-90
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 08:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o0jRh-0003LS-FS
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 08:45:29 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:39853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o0jRe-000645-MJ
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 08:45:29 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 q12-20020a17090a304c00b001e2d4fb0eb4so8698446pjl.4
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 05:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zitz3aw7vmqBdlw7whS7nBw2iJZB5B/SiBi5964udmY=;
 b=3H1T0aEkUUf9tdhR8GCQncqQBcI0ci77EaFqBmHJjLEcLsRcRi+MPuYdfi7DufQMtH
 BYYw3WzW3RsgQDAwams/JXYDkDxZiDDT0deV8PWIb/y2mNUCHoUQ2a0ObL894MXrbDOm
 7FSGReUrkwX62qu03r3sI0PK7xJcn0zYmwWEXGbnAm1K2cd/7ONlQZEqauUbNFkI6DsQ
 9eBcNhhBdEwBX7qwshLdpqG3XZxL5wnNhnvASufZWNT/1s99tdlJspjKzYg/5c+2UJN7
 zpcSUi5KwvMW+KxA+/nuwwtRyjsPZp0S6Vm7be4+e9oZdbNZaDsBhDmP7AjU8BJ3k7Pv
 vCPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zitz3aw7vmqBdlw7whS7nBw2iJZB5B/SiBi5964udmY=;
 b=TbyzVTpqvNB81OtAD4UGkC50mK8SyJ7y1LVrfNW5+NIjY08G2fU2J7TV3fISq8M3gg
 nXh/4jeB3u8ji02OEs5Mz0uH5evIaKrUF33Cv42LOfL8AgCtCV2ezyQt9JCnhXHyjinF
 EXhHqyhhx9k332JQiAkhj6o12tmGMP1uVggD2mJ353lp9FlNwJ7YOuKIxBQLUAPRaIT0
 M/MMJjTlfiiW8paskeV3j+cE3lLl2h7wBVCpmfKw8wUO16A1oTlzb08hAxXwQrmspBVI
 53S89qbq3yNicakhm4E85wFup2ewI6ykP9xE2AosbumfsVthaqzfvNMhMnaR/yZPC72r
 h47A==
X-Gm-Message-State: AOAM533FrjDjAMd+PXU+pP4b2nS+PnmvkBZVyLjQoZTU6+AUJzS1f+Xn
 QNtSKEcAH5GZ4ceZPmnoJKUW
X-Google-Smtp-Source: ABdhPJyx4qH6ms0hPHsp9RmrRi6apuKSLB/D/Qu29v+Taf1ZKX4M5Wq/HHGs7GkqL/5nXvmTi9P9Gg==
X-Received: by 2002:a17:902:dac3:b0:164:13b2:4913 with SMTP id
 q3-20020a170902dac300b0016413b24913mr57716316plx.169.1655124325188; 
 Mon, 13 Jun 2022 05:45:25 -0700 (PDT)
Received: from localhost ([139.177.225.252]) by smtp.gmail.com with ESMTPSA id
 n2-20020a170902d0c200b0015ec71f72d6sm4975538pln.253.2022.06.13.05.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 05:45:24 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: kwolf@redhat.com,
	stefanha@redhat.com
Cc: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 5/5] vduse-blk: Add name option
Date: Mon, 13 Jun 2022 20:45:03 +0800
Message-Id: <20220613124503.156-6-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613124503.156-1-xieyongji@bytedance.com>
References: <20220613124503.156-1-xieyongji@bytedance.com>
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

Currently we use 'id' option as the name of VDUSE device.
It's a bit confusing since we use one value for two different
purposes: the ID to identfy the export within QEMU (must be
distinct from any other exports in the same QEMU process, but
can overlap with names used by other processes), and the VDUSE
name to uniquely identify it on the host (must be distinct from
other VDUSE devices on the same host, but can overlap with other
export types like NBD in the same process). To make it clear,
this patch adds a separate 'name' option to specify the VDUSE
name for the vduse-blk export instead.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 block/export/vduse-blk.c             | 4 ++--
 docs/tools/qemu-storage-daemon.rst   | 5 +++--
 qapi/block-export.json               | 7 ++++---
 storage-daemon/qemu-storage-daemon.c | 8 ++++----
 4 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/block/export/vduse-blk.c b/block/export/vduse-blk.c
index 066e088b00..f101c24c3f 100644
--- a/block/export/vduse-blk.c
+++ b/block/export/vduse-blk.c
@@ -300,7 +300,7 @@ static int vduse_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
         features |= 1ULL << VIRTIO_BLK_F_RO;
     }
 
-    vblk_exp->dev = vduse_dev_create(exp->id, VIRTIO_ID_BLOCK, 0,
+    vblk_exp->dev = vduse_dev_create(vblk_opts->name, VIRTIO_ID_BLOCK, 0,
                                      features, num_queues,
                                      sizeof(struct virtio_blk_config),
                                      (char *)&config, &vduse_blk_ops,
@@ -312,7 +312,7 @@ static int vduse_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
     }
 
     vblk_exp->recon_file = g_strdup_printf("%s/vduse-blk-%s",
-                                           g_get_tmp_dir(), exp->id);
+                                           g_get_tmp_dir(), vblk_opts->name);
     if (vduse_set_reconnect_log_file(vblk_exp->dev, vblk_exp->recon_file)) {
         error_setg(errp, "failed to set reconnect log file");
         ret = -EINVAL;
diff --git a/docs/tools/qemu-storage-daemon.rst b/docs/tools/qemu-storage-daemon.rst
index 034f2809a6..ea00149a63 100644
--- a/docs/tools/qemu-storage-daemon.rst
+++ b/docs/tools/qemu-storage-daemon.rst
@@ -77,7 +77,7 @@ Standard options:
   --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,addr.type=unix,addr.path=<socket-path>[,writable=on|off][,logical-block-size=<block-size>][,num-queues=<num-queues>]
   --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,addr.type=fd,addr.str=<fd>[,writable=on|off][,logical-block-size=<block-size>][,num-queues=<num-queues>]
   --export [type=]fuse,id=<id>,node-name=<node-name>,mountpoint=<file>[,growable=on|off][,writable=on|off][,allow-other=on|off|auto]
-  --export [type=]vduse-blk,id=<id>,node-name=<node-name>[,writable=on|off][,num-queues=<num-queues>][,queue-size=<queue-size>][,logical-block-size=<block-size>][,serial=<serial-number>]
+  --export [type=]vduse-blk,id=<id>,node-name=<node-name>,name=<vduse-name>[,writable=on|off][,num-queues=<num-queues>][,queue-size=<queue-size>][,logical-block-size=<block-size>][,serial=<serial-number>]
 
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
index d7aeb1fbf7..81ef1e3dcd 100644
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
@@ -191,7 +192,8 @@
 # Since: 7.1
 ##
 { 'struct': 'BlockExportOptionsVduseBlk',
-  'data': { '*num-queues': 'uint16',
+  'data': { 'name': 'str',
+            '*num-queues': 'uint16',
             '*queue-size': 'uint16',
             '*logical-block-size': 'size',
             '*serial': 'str' } }
@@ -316,8 +318,7 @@
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
index 4e18d3fc85..b8e910f220 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -123,12 +123,12 @@ static void help(void)
 #endif /* CONFIG_VHOST_USER_BLK_SERVER */
 #ifdef CONFIG_VDUSE_BLK_EXPORT
 "  --export [type=]vduse-blk,id=<id>,node-name=<node-name>\n"
-"           [,writable=on|off][,num-queues=<num-queues>]\n"
-"           [,queue-size=<queue-size>]\n"
+"           ,name=<vduse-name>[,writable=on|off]\n"
+"           [,num-queues=<num-queues>][,queue-size=<queue-size>]\n"
 "           [,logical-block-size=<logical-block-size>]\n"
 "           [,serial=<serial-number>]\n"
-"                         export the specified block node as a vduse-blk\n"
-"                         device using the id as the VDUSE device name\n"
+"                         export the specified block node as a\n"
+"                         vduse-blk device\n"
 "\n"
 #endif /* CONFIG_VDUSE_BLK_EXPORT */
 "  --monitor [chardev=]name[,mode=control][,pretty[=on|off]]\n"
-- 
2.20.1


