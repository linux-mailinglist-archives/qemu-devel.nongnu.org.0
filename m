Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCCD39020A
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 15:21:09 +0200 (CEST)
Received: from localhost ([::1]:53024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llWzc-0004p1-9x
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 09:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kit.westneat@gmail.com>)
 id 1llWv8-00051N-VY
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:16:31 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:40616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kit.westneat@gmail.com>)
 id 1llWv5-0004gb-HL
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:16:30 -0400
Received: by mail-qt1-x834.google.com with SMTP id i12so3508941qtr.7
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 06:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UG6RZt6RGDrh2uQcORhrCvG8uZPHCBViCRDY6QTsAfs=;
 b=Dlb0rk1CmB+Yg10dJBuOH0nLbwx435LArcq6S7349iUvHmmi9Pvee4jPE9jDEo5zKz
 d74WSjOfUKdYJrKCp/u3mApADidFru8RFjYC6+FyxuG6TvxIYVl+cU6FKZgl5CvxyCGg
 oC5l5a0d5aDps1skhqtmNOuvNJFW45IaPIJGETrb6HUWhtSk5LdkQUo1+71+ApZ1J7kg
 stwMMfkFHVlVlJVB+s4qnAqvxlbKuEDhD1bJFwFublErV0VA+E1d3fLTgy1jWkDsM5DN
 mZ7VpbV4T6HzmJXy3H56eEKvqE7hCroFZe90cHND7zxkGCu3XkjZcJ//lR/U8x52PAqN
 T7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UG6RZt6RGDrh2uQcORhrCvG8uZPHCBViCRDY6QTsAfs=;
 b=hsItyaMC+MmlIHhq023jmjTG2o3s4N4+7n88rP4Osmmp+1IecO77a2TT9BgV3rYdnk
 0dtSrsZR3jI2b6cUflr9SqEqU/t/Pw339ScgEWRQalvnBinDx/wTwjw3c0wj1/0J/c9V
 FEOtXIwyp6aR2c+5B7AX9wA2SpUtIupVjP/Dj6EZXTyoRqnhA1ZKTRBgPhHufF01v89+
 osyjSrQq3R9pNMGpmhP5rxoK6vRlh3Ewt1rJSPgAklJ8STr8j83Mq+fwCC9MXJpD9TRb
 xNAqmVp+Anw6XDcTSV2PE52d6958R4AXoGT7uzwA9lMgh6cC/BQXwGTi+ZFqDH4M1eQm
 HAAw==
X-Gm-Message-State: AOAM530y5hKQRJz6sL77Na+k4knCAwgnp/sVhLg1UbxGkRB4FPkDLGzm
 Kl4Kp58AxKxnloEhecz9EtfHmhHqKhw=
X-Google-Smtp-Source: ABdhPJwAkhHZo7RmXYnY6emPfhhGxx0Ly7f6Jrhipo64X9APkuO5iruNxcOyHk2s4AYRhnaM9fcMIg==
X-Received: by 2002:ac8:5f8f:: with SMTP id j15mr31934090qta.116.1621948586280; 
 Tue, 25 May 2021 06:16:26 -0700 (PDT)
Received: from nishikirei.com.com ([104.131.0.80])
 by smtp.gmail.com with ESMTPSA id p14sm13213596qki.27.2021.05.25.06.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 06:16:25 -0700 (PDT)
From: Kit Westneat <kit.westneat@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] block/blkdebug: add log-blocksize and phys-blocksize
 parameters
Date: Tue, 25 May 2021 13:15:45 +0000
Message-Id: <20210525131545.529451-4-kit.westneat@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210525131545.529451-1-kit.westneat@gmail.com>
References: <20210525131545.529451-1-kit.westneat@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=kit.westneat@gmail.com; helo=mail-qt1-x834.google.com
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

Allow users to specify the logical and physical block sizes of the
qdev for testing purposes.

Signed-off-by: Kit Westneat <kit.westneat@gmail.com>
---
 block/blkdebug.c | 39 +++++++++++++++++++++++++++++++++------
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/block/blkdebug.c b/block/blkdebug.c
index d5f589920c..85b3973427 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -48,6 +48,8 @@ typedef struct BDRVBlkdebugState {
     uint64_t opt_discard;
     uint64_t max_discard;
     uint64_t blocksize;
+    uint64_t phys_blocksize;
+    uint64_t log_blocksize;
 
     uint64_t take_child_perms;
     uint64_t unshare_child_perms;
@@ -459,7 +461,17 @@ static QemuOptsList runtime_opts = {
         {
             .name = "blocksize",
             .type = QEMU_OPT_SIZE,
-            .help = "Blocksize of device",
+            .help = "Blocksize of device (512 default)",
+        },
+        {
+            .name = "phys-blocksize",
+            .type = QEMU_OPT_SIZE,
+            .help = "Physical blocksize of device (Defaults to 'blocksize')",
+        },
+        {
+            .name = "log-blocksize",
+            .type = QEMU_OPT_SIZE,
+            .help = "Logical blocksize of device (Defaults to 'blocksize')",
         },
         { /* end of list */ }
     },
@@ -576,6 +588,22 @@ static int blkdebug_open(BlockDriverState *bs, QDict *options, int flags,
         goto out;
     }
 
+    s->phys_blocksize = qemu_opt_get_size(opts, "phys-blocksize", 0);
+    if (s->phys_blocksize && (s->phys_blocksize >= INT_MAX ||
+        !is_power_of_2(s->phys_blocksize))) {
+        error_setg(errp, "Cannot meet constraints with phys-blocksize %" PRIu64,
+                   s->phys_blocksize);
+        goto out;
+    }
+
+    s->log_blocksize = qemu_opt_get_size(opts, "log-blocksize", 0);
+    if (s->log_blocksize && (s->log_blocksize >= INT_MAX ||
+        !is_power_of_2(s->log_blocksize))) {
+        error_setg(errp, "Cannot meet constraints with log-blocksize %" PRIu64,
+                   s->log_blocksize);
+        goto out;
+    }
+
     bdrv_debug_event(bs, BLKDBG_NONE);
 
     ret = 0;
@@ -1002,12 +1030,9 @@ static int blkdebug_probe_blocksizes(BlockDriverState *bs, BlockSizes *bsz)
 {
     BDRVBlkdebugState *s = bs->opaque;
 
-    if (!s->blocksize) {
-        return 0;
-    }
+    bsz->phys = s->phys_blocksize ? s->phys_blocksize : s->blocksize;
+    bsz->log = s->log_blocksize ? s->log_blocksize : s->blocksize;
 
-    bsz->phys = s->blocksize;
-    bsz->log = s->blocksize;
     return 0;
 }
 
@@ -1038,6 +1063,8 @@ static const char *const blkdebug_strong_runtime_opts[] = {
     "set-state.",
     "align",
     "blocksize",
+    "phys-blocksize",
+    "log-blocksize",
     "max-transfer",
     "opt-write-zero",
     "max-write-zero",
-- 
2.26.3


