Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EFA3341C1
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 16:42:26 +0100 (CET)
Received: from localhost ([::1]:40220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK0ye-0003AL-H6
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 10:42:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lK0vv-0001f6-0O; Wed, 10 Mar 2021 10:39:35 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:50737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lK0vt-0000xF-6w; Wed, 10 Mar 2021 10:39:34 -0500
Received: by mail-pj1-x1036.google.com with SMTP id gb6so1828266pjb.0;
 Wed, 10 Mar 2021 07:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a4qd/bBN/3ZRggdH+NcenLbXsMn80TQHVruC1T64rwQ=;
 b=Cy/daR+EjzCVZfzr9D98/p8D4xJOFQ45aXoKPsEvXAiRnQMkmqNAW1xcwM6APQ+7qs
 642fnYovjog1pYkzcmg+k4Rs1MDeD23gG48D/vPDO7MzX/tL7l6ZqgLaGMcoIhbkfsYJ
 rHxUALRJVBcrboajBYwFggJ5T0ZeateQgESHfsGJbyQzemuCLZbA0gAnH8GnvTyb7heT
 ESfNGO/MRblfvZtqF0abqm+knXKBJEqklj4S/6wFGZCRG5Xdw6ZheebSlUtGE4yTe14X
 /jjKwCXF4tzCWbHYzT2oM2JX9wAOFYDwkFgSGY61vyupcRE6suiSstrwfkGzyS8GNH78
 kSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a4qd/bBN/3ZRggdH+NcenLbXsMn80TQHVruC1T64rwQ=;
 b=O5/1f3H8iNOpo018qTETD3MRklgJDqRXvKS0uPFMhB+5aqFnu/Lsw8PwmpsZloszj2
 9iZ5LErBxn6yXNMKJRo7QEF0no8ZEcG/ORViEb3gaigL7BnDocEv0/WFRCTTxRUpnELA
 NCEsLoU7M3U+ypXGKzqjQ0L12yCVKMLXaUBnILoMptjT4AFBX2fBp90m+RTKe5Sr2YdH
 Y1PjpX11Seh/W3nO4BjKhx+ILPTVOsKQPYzuCAo1xpYSeayWO2T3N/3cM62L0kMo7qzB
 JQ6nW7kIh45qtZbGfkfMWsyQbvzMFtFYsid2acYG8Ddpt8y7zHdFIJP9MEd2pcBCyBYc
 q25A==
X-Gm-Message-State: AOAM533PPBPjWwXUJMJyp4n6OhD740EZWIkY8odtUyMvoQQpwpN2P/Mg
 YgGuTU9QdMcDWaIBs8gl8norjlvAC1SOvQ==
X-Google-Smtp-Source: ABdhPJxRjyfP1nbJLCDgITZGtQ+hSQkBhs/VuG/e5/8vZszaqX/PMl6FCHpEQdx2g5m6qFNBUvCKZA==
X-Received: by 2002:a17:90a:6385:: with SMTP id
 f5mr4217115pjj.91.1615390771036; 
 Wed, 10 Mar 2021 07:39:31 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:681d:e6e5:d1b0:3153])
 by smtp.gmail.com with ESMTPSA id s12sm16324388pgj.70.2021.03.10.07.39.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Mar 2021 07:39:30 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v3 2/2] block: Add backend_defaults property
Date: Thu, 11 Mar 2021 00:39:16 +0900
Message-Id: <20210310153916.64256-2-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210310153916.64256-1-akihiko.odaki@gmail.com>
References: <20210310153916.64256-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 pkrempa@redhat.com, Akihiko Odaki <akihiko.odaki@gmail.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Konstantin Nazarov <mail@knazarov.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

backend_defaults property allow users to control if default block
properties should be decided with backend information.

If it is off, any backend information will be discarded, which is
suitable if you plan to perform live migration to a different disk backend.

If it is on, a block device may utilize backend information more
aggressively.

By default, it is auto, which uses backend information from physical
devices and ignores one from file. It is consistent with the older
versions, and should be aligned with the user expectation that a file
backend is more independent of host than a physical device backend.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 block/file-posix.c       |  2 ++
 block/nvme.c             |  1 +
 hw/block/block.c         | 27 ++++++++++++++++++++++-----
 include/block/block.h    |  1 +
 include/hw/block/block.h |  3 +++
 5 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 21bdaf969c5..2631bd972a5 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1293,6 +1293,7 @@ static int hdev_probe_blocksizes(BlockDriverState *bs, BlockSizes *bsz)
     if (check_for_dasd(s->fd) < 0) {
         return -ENOTSUP;
     }
+    bsz->file = false;
     bsz->opt_io = 0;
     bsz->discard_granularity = -1;
     ret = probe_logical_blocksize(s->fd, &bsz->log);
@@ -2135,6 +2136,7 @@ static int raw_probe_blocksizes(BlockDriverState *bs, BlockSizes *bsz)
     struct statfs buf;
 
     if (!fstatfs(s->fd, &buf)) {
+        bsz->file = true;
         bsz->phys = 0;
         bsz->log = 0;
         bsz->opt_io = buf.f_iosize;
diff --git a/block/nvme.c b/block/nvme.c
index 1845d07577b..8438c8a2b90 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -987,6 +987,7 @@ static uint32_t nvme_get_blocksize(BlockDriverState *bs)
 static int nvme_probe_blocksizes(BlockDriverState *bs, BlockSizes *bsz)
 {
     uint32_t blocksize = nvme_get_blocksize(bs);
+    bsz->file = false;
     bsz->phys = blocksize;
     bsz->log = blocksize;
     bsz->opt_io = 0;
diff --git a/hw/block/block.c b/hw/block/block.c
index c907e5a7722..d42cc40a1c8 100644
--- a/hw/block/block.c
+++ b/hw/block/block.c
@@ -65,25 +65,42 @@ bool blkconf_blocksizes(BlockConf *conf, Error **errp)
 {
     BlockBackend *blk = conf->blk;
     BlockSizes blocksizes;
-    int backend_ret;
+    bool use_blocksizes;
+
+    switch (conf->backend_defaults) {
+    case ON_OFF_AUTO_AUTO:
+        use_blocksizes = !blk_probe_blocksizes(blk, &blocksizes) &&
+                         !blocksizes.file;
+        break;
+
+    case ON_OFF_AUTO_ON:
+        use_blocksizes = !blk_probe_blocksizes(blk, &blocksizes);
+        break;
+
+    case ON_OFF_AUTO_OFF:
+        use_blocksizes = false;
+        break;
+
+    default:
+        abort();
+    }
 
-    backend_ret = blk_probe_blocksizes(blk, &blocksizes);
     /* fill in detected values if they are not defined via qemu command line */
     if (!conf->physical_block_size) {
-        if (!backend_ret && blocksizes.phys) {
+        if (use_blocksizes && blocksizes.phys) {
            conf->physical_block_size = blocksizes.phys;
         } else {
             conf->physical_block_size = BDRV_SECTOR_SIZE;
         }
     }
     if (!conf->logical_block_size) {
-        if (!backend_ret && blocksizes.log) {
+        if (use_blocksizes && blocksizes.log) {
             conf->logical_block_size = blocksizes.log;
         } else {
             conf->logical_block_size = BDRV_SECTOR_SIZE;
         }
     }
-    if (!backend_ret) {
+    if (use_blocksizes) {
         if (!conf->opt_io_size) {
             conf->opt_io_size = blocksizes.opt_io;
         }
diff --git a/include/block/block.h b/include/block/block.h
index d12471a6cc4..ccc3ec5c847 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -91,6 +91,7 @@ typedef enum {
 } BdrvRequestFlags;
 
 typedef struct BlockSizes {
+    bool file;
     uint32_t phys;
     uint32_t log;
     uint32_t discard_granularity;
diff --git a/include/hw/block/block.h b/include/hw/block/block.h
index c172cbe65f1..5902c0440a5 100644
--- a/include/hw/block/block.h
+++ b/include/hw/block/block.h
@@ -19,6 +19,7 @@
 
 typedef struct BlockConf {
     BlockBackend *blk;
+    OnOffAuto backend_defaults;
     uint32_t physical_block_size;
     uint32_t logical_block_size;
     uint32_t min_io_size;
@@ -48,6 +49,8 @@ static inline unsigned int get_physical_block_exp(BlockConf *conf)
 }
 
 #define DEFINE_BLOCK_PROPERTIES_BASE(_state, _conf)                     \
+    DEFINE_PROP_ON_OFF_AUTO("backend_defaults", _state,                 \
+                            _conf.backend_defaults, ON_OFF_AUTO_AUTO),  \
     DEFINE_PROP_BLOCKSIZE("logical_block_size", _state,                 \
                           _conf.logical_block_size),                    \
     DEFINE_PROP_BLOCKSIZE("physical_block_size", _state,                \
-- 
2.24.3 (Apple Git-128)


