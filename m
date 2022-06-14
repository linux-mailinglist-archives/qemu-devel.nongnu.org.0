Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 166AF54A8B3
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 07:25:35 +0200 (CEST)
Received: from localhost ([::1]:44570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0z3W-0004JF-5Z
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 01:25:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o0yva-00019x-AA
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 01:17:22 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:37743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o0yvY-00011a-Gy
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 01:17:22 -0400
Received: by mail-pg1-x52b.google.com with SMTP id h192so7538548pgc.4
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 22:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zitz3aw7vmqBdlw7whS7nBw2iJZB5B/SiBi5964udmY=;
 b=dSIU/kZ/1iHFaJIdReV8vjk47F8CkfdjUJTFYzNYUWrab42ORBObpd9f5DLMEtvpTh
 t/DqrTRWPBdeq98mP/R6Tn7+m7VLEGpSVxXDEqFgo6QYVn9QFii7g0GyKPxzBm5vguDU
 wKVtDu/8IfFl173fM7OT6HnVVprDVLxebtjHVomoxUUgsdZnr4HJu+JtzzZB2Df8GdX2
 l80LOdGpEuyZcLy9Fh4Dn0xsPTuncNdQQ2iz1JiHJlNOU3c0aS28Jbi9ArSDhQKCXtgt
 StWRFmI8INKu3szbkPpM7LiW37fKguZChqjKzFliSxkqfsKfBen/wPX2m6MTFy20CoUJ
 7KUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zitz3aw7vmqBdlw7whS7nBw2iJZB5B/SiBi5964udmY=;
 b=b8GaXgCvYZnGAtWFWC9HXQYK5xSTJIq545vF3A3fB0o5xd1ipiCtAQrTJ/6nAPDJ1S
 ScHhYyHy7LvOAV8CyiWICSJnFYEFR14Kh/VfbQV4ZbdGtUcGsMpbihZVtu81gvP6OZcG
 nYbz3n2Pa99fPjJFDFYwyHyu114c85VJ47vNCmKGWOhJRl9TSDTljrkxLTiolYEY1JU8
 +pssLIndngACc4lLHZDOc38IT4vD++hC2ysLMCY7GGeo2yDR6XzSbu5qS78YoaqHwhK1
 jyH4gfl8kdFMp3a++fbLMrrrFV8EK7VopB/AMZ3NuW1GUycsLvKZtDdSsA4iUqiC+Sd0
 FCTA==
X-Gm-Message-State: AOAM533QpJpfLSDUiHzix5PhxVOrHfWEP3g6Gok+U7Q5wcGHUfOIHHjQ
 L/TSbCv9aIndzY9EssqCgckH
X-Google-Smtp-Source: ABdhPJykDqPxH6wJ14EFtO/7KpPCuIXwdrT1L/YHHnL8S407efxup19vAoRteEs2dKnPrPssBXkzoQ==
X-Received: by 2002:a05:6a00:1253:b0:51c:e1e:9990 with SMTP id
 u19-20020a056a00125300b0051c0e1e9990mr2945584pfi.5.1655183838276; 
 Mon, 13 Jun 2022 22:17:18 -0700 (PDT)
Received: from localhost ([139.177.225.237]) by smtp.gmail.com with ESMTPSA id
 v17-20020a62c311000000b0050dc762816asm6366175pfg.68.2022.06.13.22.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 22:17:17 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: kwolf@redhat.com,
	stefanha@redhat.com
Cc: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 6/6] vduse-blk: Add name option
Date: Tue, 14 Jun 2022 13:15:32 +0800
Message-Id: <20220614051532.92-7-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614051532.92-1-xieyongji@bytedance.com>
References: <20220614051532.92-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=xieyongji@bytedance.com; helo=mail-pg1-x52b.google.com
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


