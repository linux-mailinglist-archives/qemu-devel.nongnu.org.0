Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA9D3BBD53
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 15:07:28 +0200 (CEST)
Received: from localhost ([::1]:51052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0OJr-0004nT-L8
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 09:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m0OHw-0002L4-QV; Mon, 05 Jul 2021 09:05:29 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:33711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m0OHr-0008EH-TD; Mon, 05 Jul 2021 09:05:28 -0400
Received: by mail-pf1-x433.google.com with SMTP id 145so2654039pfv.0;
 Mon, 05 Jul 2021 06:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tUUKcDTbbOA4H3zLodQae4frXnLiFjRHJT6h1EAJPOA=;
 b=ofvNc66iU6Lwbtp1FMNdrIzLinqxWVpjvYjShNNouojn7pvayfisO9HUTOKNnOUTRL
 FB6QmirDquxTzxfPGP/WF5f+dtm5azAbOfeYOTdOzfbWQ4ShcHU/SQYZRwdUnvPfP3wn
 tsT0x8UUTdlKW0M6L6eBzczWgIqr6+dWL0OEaL1pb6+55h7xvcit60Zp1qzGRisfthc1
 Z/dZ/Pv9IYITeSJXsDt6wxTF9jwIqHtI0L4a9NyVNpKWauc96peRsQFVrvcFjrA1nIlD
 Dz6ZbUmnPNzXXQyGPyyjAd96hWuj8NFT7gR+zqh6S6p4wbueOLzu5KPFfkw+XjJU0K5M
 9Etg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tUUKcDTbbOA4H3zLodQae4frXnLiFjRHJT6h1EAJPOA=;
 b=DOuoUh/kziDmfYvOI1SY0w6Yz9jg+XO4YmPysHEcrk+m07aqIyyJaO9qjLwN1+Yd17
 8Z2Hcbv7aRC5pFSkAXXo+8TFS6s45B8uXyNaMZX4ECevKkNUTdDsqRPKTzve/hJO/0Fl
 YaKhZp2Ewn8lR1eFWtzmaE0SNCMLeGFniSZiSnDlN52pFxapDG6oVnrtCSnsdfvpbv0q
 FiaT9jsjudz5RJGGZyrskp6oayGB3f124/d2fhRNye/X0bHidy3UzOeHqV+JWQQzF4mC
 dRmkUqBTejIz+ATyybjaMKwaEowWLR/oidPADwPEnJ99jIDZaWWTUSAMAoCPxq8w8Tgf
 Ymfw==
X-Gm-Message-State: AOAM530CM/GB4A9ZQQoZcjIV+op3DLMTegPBhuzQYpsSRUkuv5dMtPEn
 AI23ZjaQioYJqKbbc8h25Qs=
X-Google-Smtp-Source: ABdhPJyXtTSxjYUAsbFU2m2sWzJUPYYTEOg5FyhZE065Lsj2yA5RkPQ+Bmk11IZn6lRsPoG+A1rfOA==
X-Received: by 2002:a05:6a00:1951:b029:319:db4d:5d9a with SMTP id
 s17-20020a056a001951b0290319db4d5d9amr12577190pfk.12.1625490322162; 
 Mon, 05 Jul 2021 06:05:22 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:ad14:b651:2921:88e5])
 by smtp.gmail.com with ESMTPSA id s27sm12727263pfg.169.2021.07.05.06.05.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Jul 2021 06:05:21 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v5 2/3] block: Add backend_defaults property
Date: Mon,  5 Jul 2021 22:04:57 +0900
Message-Id: <20210705130458.97642-2-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210705130458.97642-1-akihiko.odaki@gmail.com>
References: <20210705130458.97642-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x433.google.com
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
 Konstantin Nazarov <mail@knazarov.com>, shajnocz <shajnocz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 dgilbert@redhat.com
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
 hw/block/block.c           | 42 ++++++++++++++++++++++++++++++++++----
 include/hw/block/block.h   |  3 +++
 tests/qemu-iotests/172.out | 38 ++++++++++++++++++++++++++++++++++
 3 files changed, 79 insertions(+), 4 deletions(-)

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
diff --git a/tests/qemu-iotests/172.out b/tests/qemu-iotests/172.out
index d53f61d0dee..4cf4d536b46 100644
--- a/tests/qemu-iotests/172.out
+++ b/tests/qemu-iotests/172.out
@@ -21,6 +21,7 @@ Testing:
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "floppy0"
+                backend_defaults = "auto"
                 logical_block_size = 512 (512 B)
                 physical_block_size = 512 (512 B)
                 min_io_size = 0 (0 B)
@@ -48,6 +49,7 @@ Testing: -fda TEST_DIR/t.qcow2
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "floppy0"
+                backend_defaults = "auto"
                 logical_block_size = 512 (512 B)
                 physical_block_size = 512 (512 B)
                 min_io_size = 0 (0 B)
@@ -85,6 +87,7 @@ Testing: -fdb TEST_DIR/t.qcow2
               dev: floppy, id ""
                 unit = 1 (0x1)
                 drive = "floppy1"
+                backend_defaults = "auto"
                 logical_block_size = 512 (512 B)
                 physical_block_size = 512 (512 B)
                 min_io_size = 0 (0 B)
@@ -96,6 +99,7 @@ Testing: -fdb TEST_DIR/t.qcow2
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "floppy0"
+                backend_defaults = "auto"
                 logical_block_size = 512 (512 B)
                 physical_block_size = 512 (512 B)
                 min_io_size = 0 (0 B)
@@ -137,6 +141,7 @@ Testing: -fda TEST_DIR/t.qcow2 -fdb TEST_DIR/t.qcow2.2
               dev: floppy, id ""
                 unit = 1 (0x1)
                 drive = "floppy1"
+                backend_defaults = "auto"
                 logical_block_size = 512 (512 B)
                 physical_block_size = 512 (512 B)
                 min_io_size = 0 (0 B)
@@ -148,6 +153,7 @@ Testing: -fda TEST_DIR/t.qcow2 -fdb TEST_DIR/t.qcow2.2
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "floppy0"
+                backend_defaults = "auto"
                 logical_block_size = 512 (512 B)
                 physical_block_size = 512 (512 B)
                 min_io_size = 0 (0 B)
@@ -190,6 +196,7 @@ Testing: -fdb
               dev: floppy, id ""
                 unit = 1 (0x1)
                 drive = "floppy1"
+                backend_defaults = "auto"
                 logical_block_size = 512 (512 B)
                 physical_block_size = 512 (512 B)
                 min_io_size = 0 (0 B)
@@ -201,6 +208,7 @@ Testing: -fdb
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "floppy0"
+                backend_defaults = "auto"
                 logical_block_size = 512 (512 B)
                 physical_block_size = 512 (512 B)
                 min_io_size = 0 (0 B)
@@ -228,6 +236,7 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "floppy0"
+                backend_defaults = "auto"
                 logical_block_size = 512 (512 B)
                 physical_block_size = 512 (512 B)
                 min_io_size = 0 (0 B)
@@ -265,6 +274,7 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2,index=1
               dev: floppy, id ""
                 unit = 1 (0x1)
                 drive = "floppy1"
+                backend_defaults = "auto"
                 logical_block_size = 512 (512 B)
                 physical_block_size = 512 (512 B)
                 min_io_size = 0 (0 B)
@@ -276,6 +286,7 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2,index=1
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "floppy0"
+                backend_defaults = "auto"
                 logical_block_size = 512 (512 B)
                 physical_block_size = 512 (512 B)
                 min_io_size = 0 (0 B)
@@ -317,6 +328,7 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=floppy,file=TEST_DIR/t
               dev: floppy, id ""
                 unit = 1 (0x1)
                 drive = "floppy1"
+                backend_defaults = "auto"
                 logical_block_size = 512 (512 B)
                 physical_block_size = 512 (512 B)
                 min_io_size = 0 (0 B)
@@ -328,6 +340,7 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=floppy,file=TEST_DIR/t
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "floppy0"
+                backend_defaults = "auto"
                 logical_block_size = 512 (512 B)
                 physical_block_size = 512 (512 B)
                 min_io_size = 0 (0 B)
@@ -373,6 +386,7 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "none0"
+                backend_defaults = "auto"
                 logical_block_size = 512 (512 B)
                 physical_block_size = 512 (512 B)
                 min_io_size = 0 (0 B)
@@ -410,6 +424,7 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,unit=1
               dev: floppy, id ""
                 unit = 1 (0x1)
                 drive = "none0"
+                backend_defaults = "auto"
                 logical_block_size = 512 (512 B)
                 physical_block_size = 512 (512 B)
                 min_io_size = 0 (0 B)
@@ -447,6 +462,7 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qco
               dev: floppy, id ""
                 unit = 1 (0x1)
                 drive = "none1"
+                backend_defaults = "auto"
                 logical_block_size = 512 (512 B)
                 physical_block_size = 512 (512 B)
                 min_io_size = 0 (0 B)
@@ -458,6 +474,7 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qco
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "none0"
+                backend_defaults = "auto"
                 logical_block_size = 512 (512 B)
                 physical_block_size = 512 (512 B)
                 min_io_size = 0 (0 B)
@@ -509,6 +526,7 @@ Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
               dev: floppy, id ""
                 unit = 1 (0x1)
                 drive = "none0"
+                backend_defaults = "auto"
                 logical_block_size = 512 (512 B)
                 physical_block_size = 512 (512 B)
                 min_io_size = 0 (0 B)
@@ -520,6 +538,7 @@ Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "floppy0"
+                backend_defaults = "auto"
                 logical_block_size = 512 (512 B)
                 physical_block_size = 512 (512 B)
                 min_io_size = 0 (0 B)
@@ -562,6 +581,7 @@ Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
               dev: floppy, id ""
                 unit = 1 (0x1)
                 drive = "none0"
+                backend_defaults = "auto"
                 logical_block_size = 512 (512 B)
                 physical_block_size = 512 (512 B)
                 min_io_size = 0 (0 B)
@@ -573,6 +593,7 @@ Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "floppy0"
+                backend_defaults = "auto"
                 logical_block_size = 512 (512 B)
                 physical_block_size = 512 (512 B)
                 min_io_size = 0 (0 B)
@@ -615,6 +636,7 @@ Testing: -fdb TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "none0"
+                backend_defaults = "auto"
                 logical_block_size = 512 (512 B)
                 physical_block_size = 512 (512 B)
                 min_io_size = 0 (0 B)
@@ -626,6 +648,7 @@ Testing: -fdb TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
               dev: floppy, id ""
                 unit = 1 (0x1)
                 drive = "floppy1"
+                backend_defaults = "auto"
                 logical_block_size = 512 (512 B)
                 physical_block_size = 512 (512 B)
                 min_io_size = 0 (0 B)
@@ -668,6 +691,7 @@ Testing: -fdb TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "none0"
+                backend_defaults = "auto"
                 logical_block_size = 512 (512 B)
                 physical_block_size = 512 (512 B)
                 min_io_size = 0 (0 B)
@@ -679,6 +703,7 @@ Testing: -fdb TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
               dev: floppy, id ""
                 unit = 1 (0x1)
                 drive = "floppy1"
+                backend_defaults = "auto"
                 logical_block_size = 512 (512 B)
                 physical_block_size = 512 (512 B)
                 min_io_size = 0 (0 B)
@@ -730,6 +755,7 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.q
               dev: floppy, id ""
                 unit = 1 (0x1)
                 drive = "none0"
+                backend_defaults = "auto"
                 logical_block_size = 512 (512 B)
                 physical_block_size = 512 (512 B)
                 min_io_size = 0 (0 B)
@@ -741,6 +767,7 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.q
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "floppy0"
+                backend_defaults = "auto"
                 logical_block_size = 512 (512 B)
                 physical_block_size = 512 (512 B)
                 min_io_size = 0 (0 B)
@@ -783,6 +810,7 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.q
               dev: floppy, id ""
                 unit = 1 (0x1)
                 drive = "none0"
+                backend_defaults = "auto"
                 logical_block_size = 512 (512 B)
                 physical_block_size = 512 (512 B)
                 min_io_size = 0 (0 B)
@@ -794,6 +822,7 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.q
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "floppy0"
+                backend_defaults = "auto"
                 logical_block_size = 512 (512 B)
                 physical_block_size = 512 (512 B)
                 min_io_size = 0 (0 B)
@@ -842,6 +871,7 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -global floppy.drive=none0 -device
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "none0"
+                backend_defaults = "auto"
                 logical_block_size = 512 (512 B)
                 physical_block_size = 512 (512 B)
                 min_io_size = 0 (0 B)
@@ -909,6 +939,7 @@ Testing: -device floppy
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = ""
+                backend_defaults = "auto"
                 logical_block_size = 512 (512 B)
                 physical_block_size = 512 (512 B)
                 min_io_size = 0 (0 B)
@@ -933,6 +964,7 @@ Testing: -device floppy,drive-type=120
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = ""
+                backend_defaults = "auto"
                 logical_block_size = 512 (512 B)
                 physical_block_size = 512 (512 B)
                 min_io_size = 0 (0 B)
@@ -957,6 +989,7 @@ Testing: -device floppy,drive-type=144
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = ""
+                backend_defaults = "auto"
                 logical_block_size = 512 (512 B)
                 physical_block_size = 512 (512 B)
                 min_io_size = 0 (0 B)
@@ -981,6 +1014,7 @@ Testing: -device floppy,drive-type=288
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = ""
+                backend_defaults = "auto"
                 logical_block_size = 512 (512 B)
                 physical_block_size = 512 (512 B)
                 min_io_size = 0 (0 B)
@@ -1008,6 +1042,7 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,drive-t
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "none0"
+                backend_defaults = "auto"
                 logical_block_size = 512 (512 B)
                 physical_block_size = 512 (512 B)
                 min_io_size = 0 (0 B)
@@ -1045,6 +1080,7 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,drive-t
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "none0"
+                backend_defaults = "auto"
                 logical_block_size = 512 (512 B)
                 physical_block_size = 512 (512 B)
                 min_io_size = 0 (0 B)
@@ -1085,6 +1121,7 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,logical
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "none0"
+                backend_defaults = "auto"
                 logical_block_size = 512 (512 B)
                 physical_block_size = 512 (512 B)
                 min_io_size = 0 (0 B)
@@ -1122,6 +1159,7 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,physica
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "none0"
+                backend_defaults = "auto"
                 logical_block_size = 512 (512 B)
                 physical_block_size = 512 (512 B)
                 min_io_size = 0 (0 B)
-- 
2.30.1 (Apple Git-130)


