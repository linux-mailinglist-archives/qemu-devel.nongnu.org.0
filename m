Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E60559DA3
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 17:51:29 +0200 (CEST)
Received: from localhost ([::1]:33740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4laj-00078z-1c
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 11:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1o4lRE-0006jz-Sg
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:41:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1o4lRB-0000vE-2r
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:41:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656085295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OV0muwGGPGp2i8dCQ8zNxs8IeJ5490DKAHXq8E/p8jA=;
 b=I5bR04dNThK2O5PJBeqOl4bVLvBCdBQOgBLRySkcu0sZtWqKszm1ZXuZb4r8OrasPDXIum
 51jW65YxlP7hwgv9N2cF2iosInvy/H8nbEVGtHaCXow1+BvWgIe5vkZcu18mixEc4dgebg
 yQkFoyCJbBLXhaqccQZB0ymN04Zq8qM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-Qi2WMD42PGW3z5nzyPgYzA-1; Fri, 24 Jun 2022 11:41:32 -0400
X-MC-Unique: Qi2WMD42PGW3z5nzyPgYzA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7BC6F8032F4;
 Fri, 24 Jun 2022 15:41:31 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7BB4D492C3B;
 Fri, 24 Jun 2022 15:41:30 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL v2 19/20] vduse-blk: Add serial option
Date: Fri, 24 Jun 2022 17:41:02 +0200
Message-Id: <20220624154103.185902-20-kwolf@redhat.com>
In-Reply-To: <20220624154103.185902-1-kwolf@redhat.com>
References: <20220624154103.185902-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Add a 'serial' option to allow user to specify this value
explicitly. And the default value is changed to an empty
string as what we did in "hw/block/virtio-blk.c".

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
Message-Id: <20220614051532.92-6-xieyongji@bytedance.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/block-export.json               |  4 +++-
 docs/tools/qemu-storage-daemon.rst   |  2 +-
 block/export/virtio-blk-handler.h    |  2 +-
 block/export/vduse-blk.c             | 20 ++++++++++++++------
 block/export/vhost-user-blk-server.c |  4 +++-
 storage-daemon/qemu-storage-daemon.c |  1 +
 6 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/qapi/block-export.json b/qapi/block-export.json
index 99c34a6965..618a6367c9 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -187,13 +187,15 @@
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
2.35.3


