Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1678352BE7
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 18:07:18 +0200 (CEST)
Received: from localhost ([::1]:57100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSMKL-0001wt-SD
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 12:07:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lSMGN-00006p-Ol; Fri, 02 Apr 2021 12:03:11 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:51816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lSMGM-00029X-3w; Fri, 02 Apr 2021 12:03:11 -0400
Received: by mail-pj1-x1036.google.com with SMTP id s21so2900254pjq.1;
 Fri, 02 Apr 2021 09:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9+cB+4RWNjTMO5skPwNv/dthVhDglokW5cciULwl+L8=;
 b=QoLilbh4Za8qgoSVvLmMq7Pww9Vbp/1+ioFjUNR74TEwnbr3v/jiKHn5NN/tDQQuB6
 fTWlIXmTgYpUwlr6jyoJ4G61nGh9/T2agOMvYdwhheGZQsBRE1RI43TxhqBnVhbFcZ4u
 GBJV5CLkVz+v2bxghrfTPAQzmQmPR8RhlsjRFcVIfX+Eec2lh9dLFTsquldJIAySdjrk
 PNx4AeyF+kvWZ97CfdliUky/5uOk1DESd7rfzdiJCyZwVNeDJlfEmuBZYx4zG5fR5vqG
 ASz5DrEExRyGd9YBHHTWV6/ZM4JAICmrLHxaY7ZAQRIBsKLmvrZ+qfFbQsaIKNv/wPRo
 +kGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9+cB+4RWNjTMO5skPwNv/dthVhDglokW5cciULwl+L8=;
 b=mGSafGp6X6FGLXTi0IWV80EXqXn/LCfqtcKPMftQAivLPa/l686klfJMrMlvsmCZaP
 jEWPIgQKdCDYbi+POUetcgGQPr74fDZBjFfQl3K9ytjndY0r3TzTrza6NjWobMw339SW
 JnrELPI8CsIYmh7w4ry2DeRS2UCWY9J5sHIkMHllHejK+UtKdmnmaEH3vqiA1xVXtRW1
 NoiCOVhJ7dgz34Z7uO55EzMyg62izXqeUxG/PTNKtd6PCAZMQi98fDCpotCw1vzCgTIA
 GN+TniSenDibPHnyCrOhw35qqgdXaVGsBKMIhmKpr5CGhgsy8+rrrKIektLbFqxS3kbY
 rpJQ==
X-Gm-Message-State: AOAM530XMZK28qIsG5mhC4IyKF0wpEhYTXeZATo36dcdsgCbyggVt4Ie
 kMA7PDnKSicu1Xw7KftOX+LCcP392JO9Qw==
X-Google-Smtp-Source: ABdhPJztGuxtlcrHFZ4jN/n2FbFEkvX3UUSMZu0sH0sy0aMhKXdXbIqRkqzB4NASX5A4HnS40N7l5g==
X-Received: by 2002:a17:90a:3b0e:: with SMTP id
 d14mr14596227pjc.198.1617379388366; 
 Fri, 02 Apr 2021 09:03:08 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:3c79:94d8:55ff:9601])
 by smtp.gmail.com with ESMTPSA id w84sm8708723pfc.142.2021.04.02.09.03.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 02 Apr 2021 09:03:08 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [v5 2/3] block: Add backend_defaults property
Date: Sat,  3 Apr 2021 01:02:55 +0900
Message-Id: <20210402160256.39647-2-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210402160256.39647-1-akihiko.odaki@gmail.com>
References: <20210402160256.39647-1-akihiko.odaki@gmail.com>
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

By default, it is auto, which uses backend information for block
sizes and ignores the others, which is consistent with the older
versions.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 hw/block/block.c         | 42 ++++++++++++++++++++++++++++++++++++----
 include/hw/block/block.h |  3 +++
 2 files changed, 41 insertions(+), 4 deletions(-)

diff --git a/hw/block/block.c b/hw/block/block.c
index 1e34573da71..d47ebf005ad 100644
--- a/hw/block/block.c
+++ b/hw/block/block.c
@@ -65,24 +65,58 @@ bool blkconf_blocksizes(BlockConf *conf, Error **errp)
 {
     BlockBackend *blk = conf->blk;
     BlockSizes blocksizes;
-    int backend_ret;
+    BlockDriverState *bs;
+    bool use_blocksizes;
+    bool use_bs;
+
+    switch (conf->backend_defaults) {
+    case ON_OFF_AUTO_AUTO:
+        use_blocksizes = !blk_probe_blocksizes(blk, &blocksizes);
+        use_bs = false;
+        break;
+
+    case ON_OFF_AUTO_ON:
+        use_blocksizes = !blk_probe_blocksizes(blk, &blocksizes);
+        bs = blk_bs(blk);
+        use_bs = bs;
+        break;
+
+    case ON_OFF_AUTO_OFF:
+        use_blocksizes = false;
+        use_bs = false;
+        break;
+
+    default:
+        abort();
+    }
 
-    backend_ret = blk_probe_blocksizes(blk, &blocksizes);
     /* fill in detected values if they are not defined via qemu command line */
     if (!conf->physical_block_size) {
-        if (!backend_ret) {
+        if (use_blocksizes) {
            conf->physical_block_size = blocksizes.phys;
         } else {
             conf->physical_block_size = BDRV_SECTOR_SIZE;
         }
     }
     if (!conf->logical_block_size) {
-        if (!backend_ret) {
+        if (use_blocksizes) {
             conf->logical_block_size = blocksizes.log;
         } else {
             conf->logical_block_size = BDRV_SECTOR_SIZE;
         }
     }
+    if (use_bs) {
+        if (!conf->opt_io_size) {
+            conf->opt_io_size = bs->bl.opt_transfer;
+        }
+        if (conf->discard_granularity == -1) {
+            if (bs->bl.pdiscard_alignment) {
+                conf->discard_granularity = bs->bl.pdiscard_alignment;
+            } else if (bs->bl.request_alignment != 1) {
+                conf->discard_granularity = bs->bl.request_alignment;
+            }
+        }
+    }
 
     if (conf->logical_block_size > conf->physical_block_size) {
         error_setg(errp,
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


