Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF80C390A08
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 21:54:16 +0200 (CEST)
Received: from localhost ([::1]:39340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lld83-0007CM-P5
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 15:54:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kit.westneat@gmail.com>)
 id 1lld0X-0006Yg-Ig
 for qemu-devel@nongnu.org; Tue, 25 May 2021 15:46:30 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:41591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kit.westneat@gmail.com>)
 id 1lld0S-000745-DK
 for qemu-devel@nongnu.org; Tue, 25 May 2021 15:46:29 -0400
Received: by mail-qt1-x829.google.com with SMTP id t20so23978884qtx.8
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 12:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=utywv+fX2W3LjdvJtR62FVzS/O+FDyOews8kabNhQkQ=;
 b=e6Ww9NC1Ftujk3l3trXjLn50Q5ClSbgG6E92+weA6FQsa0l6temJGxyXqKYmyKrjqg
 pfyvidoJitCG0usckzV3TemrK+FP7p+5FoBQ1Bu20xdSacBFAL/Uxn0U1kADFUKcxyYs
 Y+q/04HGqX7VydXKpAQp6o/zpGYH186iV8vEqR//9a8yrP1L1GZnX/jUN9+/njjnPsUz
 nyfx6Goc939G9kNmMZNfdXD8+lx93RWq+uGCgxm7re3lsIrnY73HBrmhcx/DtICgGdVB
 vEFOT31I6JbAifJxRNVLRt/NJQrdhenOOPkNKmOwXIbgIc+dn43u2fRcHlzyO14BMfnt
 m7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=utywv+fX2W3LjdvJtR62FVzS/O+FDyOews8kabNhQkQ=;
 b=iRCd1HkSRssJOw7aRxvwViDaqrhAhB9tyxCuJdd2KZc9leljP8qG0eyGoiNfjD/UmP
 gHIE8F+R9HCw4tW2tjbt9FVEK8zaQBqPgX4S6+RCqheRpPAjvBEaPLX4CKJu+C9aJSbs
 iZtFDh+wJUCChGH1OrW08pPkm5hh3thIs8mKqxhKDyejmds63EjwkFds3PqyEnr5Omwk
 OIFGBZS8YE6JrzVJz2RCVtwIEudhFU09TV/Q6RZDBIGb/Q3SUMiSJIV9sWOvymYCKbon
 x3r5Tz4ReYaWVjMOlgi00UbENnFNL8OUwszh0yYUGU9URptElrCkEUPCoiiV3p5ObaUT
 HSuw==
X-Gm-Message-State: AOAM530eTksJyGG4pEAeaRfUyZTRVi9Dfh0Jr5wFUifpMOHxVFcsRIOp
 Wau+qWXsLOBHVmwhMLlD1fMSXnel3N4=
X-Google-Smtp-Source: ABdhPJw9jb4zjf1Va3NDVCEPHzZS/D2rn5IMmlg4RQp4rwfG51O/I3CcOaP3Ha3HGoyUy7wV+AGDSQ==
X-Received: by 2002:a05:622a:15cb:: with SMTP id
 d11mr16283071qty.11.1621971982286; 
 Tue, 25 May 2021 12:46:22 -0700 (PDT)
Received: from nishikirei.com.com ([104.131.0.80])
 by smtp.gmail.com with ESMTPSA id o5sm87206qtl.85.2021.05.25.12.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 12:46:21 -0700 (PDT)
From: Kit Westneat <kit.westneat@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/3] block/blkdebug: add log-blocksize and phys-blocksize
 parameters
Date: Tue, 25 May 2021 19:46:07 +0000
Message-Id: <20210525194607.553291-4-kit.westneat@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210525194607.553291-1-kit.westneat@gmail.com>
References: <20210525194607.553291-1-kit.westneat@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=kit.westneat@gmail.com; helo=mail-qt1-x829.google.com
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
 block/blkdebug.c     | 39 +++++++++++++++++++++++++++++++++------
 qapi/block-core.json |  7 +++++++
 2 files changed, 40 insertions(+), 6 deletions(-)

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
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 1b1f2692ef..4638026dbf 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -3407,6 +3407,12 @@
 # @blocksize: blocksize of device in bytes, must be
 #             positive power of 2 (since 6.1)
 #
+# @log-blocksize: logical blocksize of device in bytes, must be positive power
+#                 of 2, or 0 for default (@blocksize) (since 6.1)
+#
+# @phys-blocksize: physical blocksize of device in bytes, must be positive
+#                  power of 2, or 0 for default (@blocksize) (since 6.1)
+#
 # Since: 2.9
 ##
 { 'struct': 'BlockdevOptionsBlkdebug',
@@ -3416,6 +3422,7 @@
             '*opt-write-zero': 'int32', '*max-write-zero': 'int32',
             '*opt-discard': 'int32', '*max-discard': 'int32',
             '*blocksize': 'int',
+            '*log-blocksize': 'int', '*phys-blocksize': 'int',
             '*inject-error': ['BlkdebugInjectErrorOptions'],
             '*set-state': ['BlkdebugSetStateOptions'],
             '*take-child-perms': ['BlockPermission'],
-- 
2.26.3


