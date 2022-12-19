Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 214A8650833
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 08:50:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Auh-0008MU-J9; Mon, 19 Dec 2022 02:50:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1p7AuY-0008Js-Kq; Mon, 19 Dec 2022 02:50:10 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1p7AuV-0006eM-92; Mon, 19 Dec 2022 02:50:09 -0500
Received: by mail-pl1-x635.google.com with SMTP id u7so39756plq.11;
 Sun, 18 Dec 2022 23:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5Rxk2jJJt9jMSUMAXSaQOGneB84DuYg9jnKqEKvkqbQ=;
 b=cLGax1ZpyaohAZSzRjEsfIilYsvjkTooba2VS7P+JHdP7vAOnx1CBnWKy94P1mvFAG
 /Dsfwrzt0zA5c7BVmwLlJdamVuEi58vkRh+Hpg9Lk4gA5F7nPkbuf/DhCNIAp4yNE/cU
 2MVfFoLQPvcO/txZU71NTtoYUQnAOis+y8LYc6uwrGOzAh+EVpEIYGNGEY6JwsCfLBcC
 ypBA2BjiSsuMGZhquTYQhtFGu376IpG/H/yIr3g7cPJifdKhXUo54FUX6P/3/as6WVMI
 peqb3qChGvgolt9e5le4N7lJpJTtoHWlUPisrZF+kd8a3/+BP4Ic7/yexDVJCq9guNAC
 PCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5Rxk2jJJt9jMSUMAXSaQOGneB84DuYg9jnKqEKvkqbQ=;
 b=NhO6RZ5ChMdFEaRS5ZruJQIhzpEBqUvRHxEwdsEpB6xwltbzKj+PoWsdMuuA0EVphZ
 6tW0oCJT5fAE/EntSPxYlf5NdRR1f4PV/AJlhUUF3Wv5Ggnxb0cUG1VGODqA/7GRmhpl
 5bZoi58PHtCgPfsqcygGLN4nACqIPKyI4P7oLy9OQnsL1aPuip7HPTJ8VHfISY0X870p
 cmCBjvleKDAvpAGbnLsSaxtGQ2/cYx8QKW7O8N0WqK/Y/SNX8Mj7UYsTw2kh40+j6gdU
 vgmROk3quHAMNit6y7LiB2HFn0ln23pVrcAtfBNaahKDoGJToNbDcHV3lPa5IhFGxORF
 z5cQ==
X-Gm-Message-State: AFqh2kowOcSF9HQdk9QY0YFBqQHP/2adAX1V6rPDmE4/NJMw+54KcBdK
 u0kd/6XvzBjWoOoghApn/Bp7YonPfE1GGbZ5
X-Google-Smtp-Source: AMrXdXtratGxIel7AC/TifbKqXE23Nqz1OpDCwkUVQ24yqv48zUgAn2WDwDjPgtCq4EgGE1s8UGe9Q==
X-Received: by 2002:a17:902:c942:b0:190:f537:3c45 with SMTP id
 i2-20020a170902c94200b00190f5373c45mr27053601pla.30.1671436203573; 
 Sun, 18 Dec 2022 23:50:03 -0800 (PST)
Received: from fedlinux.. ([106.84.132.155]) by smtp.gmail.com with ESMTPSA id
 u17-20020a17090341d100b001754fa42065sm6368617ple.143.2022.12.18.23.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Dec 2022 23:50:03 -0800 (PST)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: hare@suse.de, hreitz@redhat.com, kwolf@redhat.com, dmitry.fomichev@wdc.com,
 pbonzini@redhat.com, damien.lemoal@opensource.wdc.com, fam@euphon.net,
 thuth@redhat.com, marcandre.lureau@redhat.com, philmd@linaro.org,
 berrange@redhat.com, eblake@redhat.com, armbru@redhat.com,
 stefanha@redhat.com, qemu-block@nongnu.org,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v14 5/8] config: add check to block layer
Date: Mon, 19 Dec 2022 15:49:51 +0800
Message-Id: <20221219074951.7881-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Putting zoned/non-zoned BlockDrivers on top of each other is not
allowed.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 block.c                          | 19 +++++++++++++++++++
 block/file-posix.c               | 12 ++++++++++++
 block/raw-format.c               |  1 +
 include/block/block_int-common.h |  5 +++++
 4 files changed, 37 insertions(+)

diff --git a/block.c b/block.c
index 9c2ac757e4..09abea9da7 100644
--- a/block.c
+++ b/block.c
@@ -7912,6 +7912,25 @@ void bdrv_add_child(BlockDriverState *parent_bs, BlockDriverState *child_bs,
         return;
     }
 
+    /*
+     * Non-zoned block drivers do not follow zoned storage constraints
+     * (i.e. sequential writes to zones). Refuse mixing zoned and non-zoned
+     * drivers in a graph.
+     */
+    if (!parent_bs->drv->supports_zoned_children &&
+        child_bs->bl.zoned == BLK_Z_HM) {
+        /*
+         * The host-aware model allows zoned storage constraints and random
+         * write. Allow mixing host-aware and non-zoned drivers. Using
+         * host-aware device as a regular device.
+         */
+        error_setg(errp, "Cannot add a %s child to a %s parent",
+                   child_bs->bl.zoned == BLK_Z_HM ? "zoned" : "non-zoned",
+                   parent_bs->drv->supports_zoned_children ?
+                   "support zoned children" : "not support zoned children");
+        return;
+    }
+
     if (!QLIST_EMPTY(&child_bs->parents)) {
         error_setg(errp, "The node %s already has a parent",
                    child_bs->node_name);
diff --git a/block/file-posix.c b/block/file-posix.c
index 269c5b508a..091a95c1a9 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -775,6 +775,18 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
             goto fail;
         }
     }
+#ifdef CONFIG_BLKZONED
+    /*
+     * The kernel page cache does not reliably work for writes to SWR zones
+     * of zoned block device because it can not guarantee the order of writes.
+     */
+    if ((strcmp(bs->drv->format_name, "zoned_host_device") == 0) &&
+        (!(s->open_flags & O_DIRECT))) {
+        error_setg(errp, "driver=zoned_host_device was specified, but it "
+                   "requires cache.direct=on, which was not specified.");
+        return -EINVAL; /* No host kernel page cache */
+    }
+#endif
 
     if (S_ISBLK(st.st_mode)) {
 #ifdef __linux__
diff --git a/block/raw-format.c b/block/raw-format.c
index 8e42fa83ed..2fcc2ad7f6 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -617,6 +617,7 @@ static void raw_child_perm(BlockDriverState *bs, BdrvChild *c,
 BlockDriver bdrv_raw = {
     .format_name          = "raw",
     .instance_size        = sizeof(BDRVRawState),
+    .supports_zoned_children = true,
     .bdrv_probe           = &raw_probe,
     .bdrv_reopen_prepare  = &raw_reopen_prepare,
     .bdrv_reopen_commit   = &raw_reopen_commit,
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index dc6ee8006c..77eb0a2a8b 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -141,6 +141,11 @@ struct BlockDriver {
      */
     bool is_format;
 
+    /*
+     * Set to true if the BlockDriver supports zoned children.
+     */
+    bool supports_zoned_children;
+
     /*
      * Drivers not implementing bdrv_parse_filename nor bdrv_open should have
      * this field set to true, except ones that are defined only by their
-- 
2.38.1


