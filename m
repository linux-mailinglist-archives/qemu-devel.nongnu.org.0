Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB18390159
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 14:50:39 +0200 (CEST)
Received: from localhost ([::1]:43970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llWW6-0003gs-9F
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 08:50:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kit.westneat@gmail.com>)
 id 1llWUC-0001aO-IZ
 for qemu-devel@nongnu.org; Tue, 25 May 2021 08:48:40 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:39571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kit.westneat@gmail.com>)
 id 1llWUA-0004Am-8G
 for qemu-devel@nongnu.org; Tue, 25 May 2021 08:48:40 -0400
Received: by mail-qt1-x834.google.com with SMTP id c15so1128114qte.6
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 05:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1HqbblJpGSscK6SzMXTtB/qUs5tLjwyqus/aCL6LCrw=;
 b=dNq30uZzqUaqCOc0fAkH0D7KK93R4YVl/XaxXA6vew+7LW7Y1dzwfVphuWw9ue9kHX
 kdq8xvzywZr7v5WdmUH8q1Z4fU9Sm8HTliu1wx0NMaklyg6KaF1kGmBxyOSUYsw2dPZt
 6objEDUcyfMzEtdrPY/JBhXOLE5taQDFrsypgHRtsRYRBCnbU9YNshViWC4Y2Kq+0RON
 ZbocrkN8PugwerVqsn3Hq9ckB4/tRXSbp8Yd8r2TvGMJOkz6j5hUNTJim6mmv3SpaOh5
 fH243vpqUV8Hwg9gANZpxss74Lsw6Y+eMdBpYSL0rt4YnT+Z1cFz1/w5igPj9MR4ynQ9
 i3mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1HqbblJpGSscK6SzMXTtB/qUs5tLjwyqus/aCL6LCrw=;
 b=GlpW4wpSbG7FK46WuYdJWQqJJajjNxua0xHruWEVy6Wdc/4xpH+gMzNxrkt3o4CbWU
 Em68dpf+WKndZn/XH+DuBXOrEBR6PWNL0681LKWAEBW1HHiWyOKQKg5s7uPq2g4hNxKd
 d9e25iQYPEA/8pMWfnAvu5YW/gAniCgDLJffB0j1HrAYaFTnsHumroA5O7JzEtcoVYWF
 DkuswPw1UlXhzqGD8BoGYBqroXZX2K3rhQXEQE3A4JICVqmktILl16zHxCeafoc3/hYJ
 fpNGjKMJCneVyn7rKD5lq5h46SH9UPb7dKBjiSz+GL7N6eA8IAK82MmpOWsWRXti8ev9
 sLVg==
X-Gm-Message-State: AOAM530UZcYjWSjo/gq/L/ZxkJMZRZk0YFvphvvCQWTxJTLACSThGf+q
 c0RIfu57nZw83OZHkrCzPMURKlqhGZE=
X-Google-Smtp-Source: ABdhPJyE3I911PrYG72YKmJIRTox1TvWnQu5nxgiVVVWgx9xYRQ1rzDqGI4e6YUmeA7bfK8Gu61ChA==
X-Received: by 2002:ac8:6911:: with SMTP id e17mr31784317qtr.135.1621946917008; 
 Tue, 25 May 2021 05:48:37 -0700 (PDT)
Received: from nishikirei.com.com ([104.131.0.80])
 by smtp.gmail.com with ESMTPSA id a68sm13036749qkd.51.2021.05.25.05.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 05:48:36 -0700 (PDT)
From: Kit Westneat <kit.westneat@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] block/blkdebug: add log-blocksize and phys-blocksize
 parameters
Date: Tue, 25 May 2021 12:47:53 +0000
Message-Id: <20210525124753.528516-4-kit.westneat@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210525124753.528516-1-kit.westneat@gmail.com>
References: <20210525124753.528516-1-kit.westneat@gmail.com>
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
 block/blkdebug.c | 36 +++++++++++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/block/blkdebug.c b/block/blkdebug.c
index c7500746a8..e5cfdab32b 100644
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
@@ -575,6 +587,20 @@ static int blkdebug_open(BlockDriverState *bs, QDict *options, int flags,
         goto out;
     }
 
+    s->phys_blocksize = qemu_opt_get_size(opts, "phys-blocksize", 0);
+    if (s->phys_blocksize && (s->phys_blocksize >= INT_MAX || !is_power_of_2(s->phys_blocksize))) {
+        error_setg(errp, "Cannot meet constraints with phys-blocksize %" PRIu64,
+                   s->phys_blocksize);
+        goto out;
+    }
+
+    s->log_blocksize = qemu_opt_get_size(opts, "log-blocksize", 0);
+    if (s->log_blocksize && (s->log_blocksize >= INT_MAX || !is_power_of_2(s->log_blocksize))) {
+        error_setg(errp, "Cannot meet constraints with log-blocksize %" PRIu64,
+                   s->log_blocksize);
+        goto out;
+    }
+
     bdrv_debug_event(bs, BLKDBG_NONE);
 
     ret = 0;
@@ -1001,11 +1027,9 @@ static int blkdebug_probe_blocksizes(BlockDriverState *bs, BlockSizes *bsz)
 {
     BDRVBlkdebugState *s = bs->opaque;
 
-    if (!s->blocksize)
-        return 0;
+    bsz->phys = s->phys_blocksize ? s->phys_blocksize : s->blocksize;
+    bsz->log = s->log_blocksize ? s->log_blocksize : s->blocksize;
 
-    bsz->phys = s->blocksize;
-    bsz->log = s->blocksize;
     return 0;
 }
 
@@ -1036,6 +1060,8 @@ static const char *const blkdebug_strong_runtime_opts[] = {
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


