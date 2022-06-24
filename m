Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE0D559E67
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 18:18:35 +0200 (CEST)
Received: from localhost ([::1]:34196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4m0v-000611-UL
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 12:18:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1o4lRF-0006lA-58
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:41:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1o4lRB-0000vb-8T
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:41:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656085296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MTd0ioJvujytHd/FaAzP6kzHRiCLScIWBWT+1tOzdK4=;
 b=UXww5Nz4MLNEzbnhBDpoP0Zck52251NXFGDPpdDdMK9GMxf22WWS28zY6icEtVQQEEQVAR
 FhapCkWzUOl5Kt6r3DT7UDRhrTK0AVQVcalFkVh0KTqQLpeE2i0RzKvnW3gIHrE4hBKIHC
 m0WsqrkZyTrmVR6mR+8vDmd6BONTKm8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-290-TVKUddNWPoWkcxBUrlAX-g-1; Fri, 24 Jun 2022 11:41:32 -0400
X-MC-Unique: TVKUddNWPoWkcxBUrlAX-g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54226801E67;
 Fri, 24 Jun 2022 15:41:32 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4B7C492C3B;
 Fri, 24 Jun 2022 15:41:31 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL v2 20/20] vduse-blk: Add name option
Date: Fri, 24 Jun 2022 17:41:03 +0200
Message-Id: <20220624154103.185902-21-kwolf@redhat.com>
In-Reply-To: <20220624154103.185902-1-kwolf@redhat.com>
References: <20220624154103.185902-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Xie Yongji <xieyongji@bytedance.com>

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
Message-Id: <20220614051532.92-7-xieyongji@bytedance.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/block-export.json               | 7 ++++---
 docs/tools/qemu-storage-daemon.rst   | 5 +++--
 block/export/vduse-blk.c             | 4 ++--
 storage-daemon/qemu-storage-daemon.c | 8 ++++----
 4 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/qapi/block-export.json b/qapi/block-export.json
index 618a6367c9..4627bbc4e6 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -183,6 +183,7 @@
 #
 # A vduse-blk block export.
 #
+# @name: the name of VDUSE device (must be unique across the host).
 # @num-queues: the number of virtqueues. Defaults to 1.
 # @queue-size: the size of virtqueue. Defaults to 256.
 # @logical-block-size: Logical block size in bytes. Range [512, PAGE_SIZE]
@@ -192,7 +193,8 @@
 # Since: 7.1
 ##
 { 'struct': 'BlockExportOptionsVduseBlk',
-  'data': { '*num-queues': 'uint16',
+  'data': { 'name': 'str',
+            '*num-queues': 'uint16',
             '*queue-size': 'uint16',
             '*logical-block-size': 'size',
             '*serial': 'str' } }
@@ -320,8 +322,7 @@
 # Describes a block export, i.e. how single node should be exported on an
 # external interface.
 #
-# @id: A unique identifier for the block export (across the host for vduse-blk
-#      export type or across all export types for other types)
+# @id: A unique identifier for the block export (across all export types)
 #
 # @node-name: The node name of the block node to be exported (since: 5.2)
 #
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
2.35.3


