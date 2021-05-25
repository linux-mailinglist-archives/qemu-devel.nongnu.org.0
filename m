Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF7A390158
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 14:50:18 +0200 (CEST)
Received: from localhost ([::1]:43270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llWVl-0003Cd-VV
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 08:50:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kit.westneat@gmail.com>)
 id 1llWU4-0001IY-Vg
 for qemu-devel@nongnu.org; Tue, 25 May 2021 08:48:33 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:44732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kit.westneat@gmail.com>)
 id 1llWU3-00045x-Co
 for qemu-devel@nongnu.org; Tue, 25 May 2021 08:48:32 -0400
Received: by mail-qv1-xf34.google.com with SMTP id a7so11574811qvf.11
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 05:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o2yGfcWr7aHdFQyGe4z+DLXUhszXdOaTt4aicOQsph8=;
 b=tgq+YLCBp+Ln5L25I0D1MPZmU5cpINdiQJNcpf0CpOh+qNAz3yX8BDSCwnn3f/amMF
 Y/0A8bfGRy6CtYK6G2Twgc8C+DWnSFAYhb590n22HVfXYXR5GNa/gT+n+DnchZZhdhOZ
 RWVBcT3ath1uAIg8INsBeAO+Joq2aIEdZBbeWWQX3PIXdKzZGs7ECQC9+FHEdQ+ftUag
 Jw8yGHFL2H3g10kImKc59iocTSv6f7/xfnCULkrHDXY9vL4nlz35bvhrd42AOSvu9FIW
 ipvd1uAZyMQ+kkdhNlkJHubRJWLd5nx9E9pCBJM8rnkLxGEEEm98zvASaDx9bgCPVk9S
 MAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o2yGfcWr7aHdFQyGe4z+DLXUhszXdOaTt4aicOQsph8=;
 b=JJHygGrqrDzNOsc2DbeQCg0j/At+hKX6ryL7p+TdYHXeBkuHjg38L/HIqpKX4YASgG
 uZCVnuDABjOtWiB4yQ/PJMJKkHE57kbM7jUDS5iPYgWzV3LVQwmc8GXime7IR/twvqiF
 PLMcH1kjqqnxJRihmv73WaZOFUdp/H3DGPQNK6dVRV5++572dkoegpkDVUy8pNNf1QBu
 oMAJ0nHlNsBXleHBwaJpuPNAZOdo6o0lsYDTkGuYmbyPyomTh/VL1NiWiBFgpANmQVEu
 0xER9ZBOdHgHS27jo+YSC9RuiNonN9SG1nroIfuw5PD+0ETMDGBJ67uMLtAWl48vD/wN
 tprw==
X-Gm-Message-State: AOAM531dOWroJL5kCltpYjMwFPB/F4SURHg2XARl6wXJsngvFuFDz7Jx
 XGge1EFkpwIReQceGiZGybs3GfycrGo=
X-Google-Smtp-Source: ABdhPJz7k1sBl5MJcQ0xQRL3l7NYMtJ5Bbw25qahs9N/0XlqBPOa3sod1uKcbgpMa+2EX5q1PdmdDQ==
X-Received: by 2002:a0c:f48c:: with SMTP id i12mr35210809qvm.7.1621946910171; 
 Tue, 25 May 2021 05:48:30 -0700 (PDT)
Received: from nishikirei.com.com ([104.131.0.80])
 by smtp.gmail.com with ESMTPSA id a68sm13036749qkd.51.2021.05.25.05.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 05:48:29 -0700 (PDT)
From: Kit Westneat <kit.westneat@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] block/blkdebug: add blocksize parameter
Date: Tue, 25 May 2021 12:47:51 +0000
Message-Id: <20210525124753.528516-2-kit.westneat@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210525124753.528516-1-kit.westneat@gmail.com>
References: <20210525124753.528516-1-kit.westneat@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=kit.westneat@gmail.com; helo=mail-qv1-xf34.google.com
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
 block/blkdebug.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/block/blkdebug.c b/block/blkdebug.c
index 2c0b9b0ee8..c7500746a8 100644
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
@@ -562,6 +568,13 @@ static int blkdebug_open(BlockDriverState *bs, QDict *options, int flags,
         goto out;
     }
 
+    s->blocksize = qemu_opt_get_size(opts, "blocksize", 512);
+    if (s->blocksize && (s->blocksize >= INT_MAX || !is_power_of_2(s->blocksize))) {
+        error_setg(errp, "Cannot meet constraints with blocksize %" PRIu64,
+                   s->blocksize);
+        goto out;
+    }
+
     bdrv_debug_event(bs, BLKDBG_NONE);
 
     ret = 0;
@@ -984,6 +997,18 @@ static void blkdebug_refresh_limits(BlockDriverState *bs, Error **errp)
     }
 }
 
+static int blkdebug_probe_blocksizes(BlockDriverState *bs, BlockSizes *bsz)
+{
+    BDRVBlkdebugState *s = bs->opaque;
+
+    if (!s->blocksize)
+        return 0;
+
+    bsz->phys = s->blocksize;
+    bsz->log = s->blocksize;
+    return 0;
+}
+
 static int blkdebug_reopen_prepare(BDRVReopenState *reopen_state,
                                    BlockReopenQueue *queue, Error **errp)
 {
@@ -1010,6 +1035,7 @@ static const char *const blkdebug_strong_runtime_opts[] = {
     "inject-error.",
     "set-state.",
     "align",
+    "blocksize",
     "max-transfer",
     "opt-write-zero",
     "max-write-zero",
@@ -1034,6 +1060,7 @@ static BlockDriver bdrv_blkdebug = {
     .bdrv_getlength         = blkdebug_getlength,
     .bdrv_refresh_filename  = blkdebug_refresh_filename,
     .bdrv_refresh_limits    = blkdebug_refresh_limits,
+    .bdrv_probe_blocksizes  = blkdebug_probe_blocksizes,
 
     .bdrv_co_preadv         = blkdebug_co_preadv,
     .bdrv_co_pwritev        = blkdebug_co_pwritev,
-- 
2.26.3


