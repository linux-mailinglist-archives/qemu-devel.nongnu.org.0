Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 286093909E2
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 21:48:42 +0200 (CEST)
Received: from localhost ([::1]:56974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lld2e-00089a-Mq
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 15:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kit.westneat@gmail.com>)
 id 1lld0T-0006VP-Cd
 for qemu-devel@nongnu.org; Tue, 25 May 2021 15:46:27 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:43591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kit.westneat@gmail.com>)
 id 1lld0R-00073b-5H
 for qemu-devel@nongnu.org; Tue, 25 May 2021 15:46:25 -0400
Received: by mail-qv1-xf33.google.com with SMTP id v18so16653877qvx.10
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 12:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WcS9fx5EbDCdRXO1Dr/7ha/qn68edJptwQ+TXT9x/lY=;
 b=elltH4ESUwqXlMRwpBOc+qdfCi6W/f0Fb/bSjPkO5iWR7mb9XSVczE7o3KoZ1stpBB
 xYazHEck1wdWHTP+nBk7gmVxv1meW7YLff1aqzFfCLzrH+gmjfzPO9ND7V4mUdbLS6UP
 2fi8stEoai9k2KYqxhuz+dC0KGFOpPjVDzWgFnJdECzgAa/JS1PZRYBETOpcFyXDF29f
 ybp6X3yvvzQGJQgq2c1DkiWECJrRdftF0TaASeXdQpoWf4kONGSx0xdnoSUv4MdmkPjn
 ssJHoqW6EGR3o+HRwiid0QxL+bp+35T5er9bolJHhYG3DVY8BG3qtnFPwHuMP+YJyQi2
 s+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WcS9fx5EbDCdRXO1Dr/7ha/qn68edJptwQ+TXT9x/lY=;
 b=n4Y9KbhXYZax8zX+wj++Q6Fu1VmtYB1c8xp/tkTex0vdRC/GpL5dTqvCH4pn4GKQ23
 jYS35vqjc7H6YpiVe1eANG/JfsuOiH5WE17pTFE3HPFqKceMgHrSuAqWzFugLditOe0z
 W4IajH3WQ5FOoA57hyZIiyvOxCIIcnGJ2Uj04QwjCb2X8TZE+WLfu08+L+PwsoXj8y8e
 ELj9XZjaQ60C8TmSc9hIAnMtk2pdeb8z5BuaSWYSCOmZ4AI2YcIxwFPpU1i3s8kyUxRj
 UVqQcBJbK9ObmCsTAJb7DlKQ6Cwq4wKN2SklRo80cCltl4+fU1APIuph4KDfAXSPTB3M
 ccDQ==
X-Gm-Message-State: AOAM5327F6mZm8u+Pb+8k+pQYxgxLY7fXNWr5O0F5QiQ9Zt2L+V1Fxhk
 m1ybKa4WqGnTbIda1VyuJ7VVoUSiYYo=
X-Google-Smtp-Source: ABdhPJxEUSIIA/RePtkLnhVrBK1Lnk9Jo2SeV4HVxb0yI5E8nRgqbenuB7BDChxwCR5GI8sw7Ea4vQ==
X-Received: by 2002:a05:6214:902:: with SMTP id
 dj2mr39229542qvb.11.1621971980851; 
 Tue, 25 May 2021 12:46:20 -0700 (PDT)
Received: from nishikirei.com.com ([104.131.0.80])
 by smtp.gmail.com with ESMTPSA id o5sm87206qtl.85.2021.05.25.12.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 12:46:20 -0700 (PDT)
From: Kit Westneat <kit.westneat@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] block/blkdebug: add blocksize parameter
Date: Tue, 25 May 2021 19:46:05 +0000
Message-Id: <20210525194607.553291-2-kit.westneat@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210525194607.553291-1-kit.westneat@gmail.com>
References: <20210525194607.553291-1-kit.westneat@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=kit.westneat@gmail.com; helo=mail-qv1-xf33.google.com
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
 block/blkdebug.c     | 29 +++++++++++++++++++++++++++++
 qapi/block-core.json |  4 ++++
 2 files changed, 33 insertions(+)

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
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 2ea294129e..1b1f2692ef 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -3404,6 +3404,9 @@
 #                       on how the blkdebug node is used).  Defaults
 #                       to none.  (since 5.0)
 #
+# @blocksize: blocksize of device in bytes, must be
+#             positive power of 2 (since 6.1)
+#
 # Since: 2.9
 ##
 { 'struct': 'BlockdevOptionsBlkdebug',
@@ -3412,6 +3415,7 @@
             '*align': 'int', '*max-transfer': 'int32',
             '*opt-write-zero': 'int32', '*max-write-zero': 'int32',
             '*opt-discard': 'int32', '*max-discard': 'int32',
+            '*blocksize': 'int',
             '*inject-error': ['BlkdebugInjectErrorOptions'],
             '*set-state': ['BlkdebugSetStateOptions'],
             '*take-child-perms': ['BlockPermission'],
-- 
2.26.3


