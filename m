Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E579390200
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 15:19:21 +0200 (CEST)
Received: from localhost ([::1]:44400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llWxs-0007SE-Et
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 09:19:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kit.westneat@gmail.com>)
 id 1llWv6-0004ws-AJ
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:16:28 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:42664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kit.westneat@gmail.com>)
 id 1llWv3-0004ec-P9
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:16:28 -0400
Received: by mail-qk1-x72c.google.com with SMTP id o27so30281517qkj.9
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 06:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sdr5QeVVXUzVRxHybwL8+Vtn8VAM6fR6pGxyRGaL+0Q=;
 b=LmQUSJLCcP87mBUcK0GgDJiDSfr6K/rhnMt4GoNsnzdy72ox9quTzN/LK3uqAj1YH0
 M7vGaq6mRFnaEdyTW8OK1DlH2ECjR56jhZSYvEp0lk2KC42lv40Bc/rQ/9wFx+jqakdU
 1H9IZw3l640XJ+UHIqqqfS3aTQjGNVDCldT/1GFJkdrsPqbejtzqreBJxAhDEvHCKzpH
 +kVGZI+91Bd/wfmHAPbZw9V+15dQ6lFyAWsf74lTILwsJB/u7ATqhZBwNJsFTpun51Bd
 +SASMG4soq2Q4lhCMxsruFFXaExS/FDcjWo1JXOCsrQr/ydTobDxXFcxO1JP5LQtZaRM
 jm0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sdr5QeVVXUzVRxHybwL8+Vtn8VAM6fR6pGxyRGaL+0Q=;
 b=NmcEsm01+Z7dXb/9yNLk+tJZgs6SwwM9G6ocgN2OaNMRv18KAS8klKFXpLOiUuPHIF
 XYKT5r0DdKCxnk2HTYaLI+2EoQ2SwQk6VkgOGTHhH2ZZQU4Q/hsM3RhqkVqQ5AmYjyQc
 KPJ+ZJKjgro8YVTdDDab6OfIZJhVqDscAjuEY7dvrHOJ5dYMQDPEE1cTW6TuLXIrsbBp
 h80XpaHi4CVyAAfIB5tTPD1EsmrF8ovsWoe1VcV5QJMsvCHZhBtQ0TZgmsFeqXXBohf2
 3pRjPg+9D7aI/Z9g3RWGHNjRtP21GVRlYnaMf0Ozjulub/UKjlvGEr7OFnNLOB+D5vur
 1o9g==
X-Gm-Message-State: AOAM533mgrkK0xpWyKSZ82RBE4w1QD+omKxmDthoSUHM9IMQJDbxVA37
 /6fseOz7eXNoBxiVgyxNefjOT5SrnxM=
X-Google-Smtp-Source: ABdhPJzH/VFpbKN/wETKhLlsQSeY/AGnfmZzjaKMNDv20KSIxjhPf7ep7Bni6FsgTQEMu6NYDrYZlA==
X-Received: by 2002:a05:620a:30d:: with SMTP id
 s13mr34891455qkm.58.1621948584721; 
 Tue, 25 May 2021 06:16:24 -0700 (PDT)
Received: from nishikirei.com.com ([104.131.0.80])
 by smtp.gmail.com with ESMTPSA id p14sm13213596qki.27.2021.05.25.06.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 06:16:24 -0700 (PDT)
From: Kit Westneat <kit.westneat@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] block/blkdebug: add blocksize parameter
Date: Tue, 25 May 2021 13:15:43 +0000
Message-Id: <20210525131545.529451-2-kit.westneat@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210525131545.529451-1-kit.westneat@gmail.com>
References: <20210525131545.529451-1-kit.westneat@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=kit.westneat@gmail.com; helo=mail-qk1-x72c.google.com
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
Cc: pbonzini@redhat.com, Kit Westneat <kit.westneat@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow users to specify the block size of the qdev for testing purposes.

Signed-off-by: Kit Westneat <kit.westneat@gmail.com>
---
 block/blkdebug.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/block/blkdebug.c b/block/blkdebug.c
index 2c0b9b0ee8..d5f589920c 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -47,6 +47,7 @@ typedef struct BDRVBlkdebugState {
     uint64_t max_write_zero;
     uint64_t opt_discard;
     uint64_t max_discard;
+    uint64_t blocksize;
 
     uint64_t take_child_perms;
     uint64_t unshare_child_perms;
@@ -455,6 +456,11 @@ static QemuOptsList runtime_opts = {
             .type = QEMU_OPT_SIZE,
             .help = "Maximum discard size in bytes",
         },
+        {
+            .name = "blocksize",
+            .type = QEMU_OPT_SIZE,
+            .help = "Blocksize of device",
+        },
         { /* end of list */ }
     },
 };
@@ -562,6 +568,14 @@ static int blkdebug_open(BlockDriverState *bs, QDict *options, int flags,
         goto out;
     }
 
+    s->blocksize = qemu_opt_get_size(opts, "blocksize", 512);
+    if (s->blocksize && (s->blocksize >= INT_MAX ||
+        !is_power_of_2(s->blocksize))) {
+        error_setg(errp, "Cannot meet constraints with blocksize %" PRIu64,
+                   s->blocksize);
+        goto out;
+    }
+
     bdrv_debug_event(bs, BLKDBG_NONE);
 
     ret = 0;
@@ -984,6 +998,19 @@ static void blkdebug_refresh_limits(BlockDriverState *bs, Error **errp)
     }
 }
 
+static int blkdebug_probe_blocksizes(BlockDriverState *bs, BlockSizes *bsz)
+{
+    BDRVBlkdebugState *s = bs->opaque;
+
+    if (!s->blocksize) {
+        return 0;
+    }
+
+    bsz->phys = s->blocksize;
+    bsz->log = s->blocksize;
+    return 0;
+}
+
 static int blkdebug_reopen_prepare(BDRVReopenState *reopen_state,
                                    BlockReopenQueue *queue, Error **errp)
 {
@@ -1010,6 +1037,7 @@ static const char *const blkdebug_strong_runtime_opts[] = {
     "inject-error.",
     "set-state.",
     "align",
+    "blocksize",
     "max-transfer",
     "opt-write-zero",
     "max-write-zero",
@@ -1034,6 +1062,7 @@ static BlockDriver bdrv_blkdebug = {
     .bdrv_getlength         = blkdebug_getlength,
     .bdrv_refresh_filename  = blkdebug_refresh_filename,
     .bdrv_refresh_limits    = blkdebug_refresh_limits,
+    .bdrv_probe_blocksizes  = blkdebug_probe_blocksizes,
 
     .bdrv_co_preadv         = blkdebug_co_preadv,
     .bdrv_co_pwritev        = blkdebug_co_pwritev,
-- 
2.26.3


