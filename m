Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAB86C802D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 15:45:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pffJo-000511-FS; Fri, 24 Mar 2023 07:10:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pffJe-00050D-Rr; Fri, 24 Mar 2023 07:10:39 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pffJN-0003gs-Q9; Fri, 24 Mar 2023 07:10:37 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-5456249756bso26719977b3.5; 
 Fri, 24 Mar 2023 04:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679656212;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Irg5VcYPciLrLKchNpKf+KEbGg91jjyzvvTNI795p4I=;
 b=nvs9KVt4FZYn1k7SfSWNT7/4FZM6oOpArb/ncu4Zhux56B2K1hh/Ofo8Q6Cezq67zo
 c+GfC+7/q8oJKh2awBgl+YHkdZqQK6ni9MxkvVxTHfLqGdZWKJCcBe4jrqSY72iGWZK4
 GA741D+ijJzwdbc8odIIpk93Xg5eWwcFxKtr8CHxFADBjV1J9VfMd9FCGbbpoRErjQaT
 tjVb/Hd/5tPxc5O58dRTbfP51q8UXKEGFk5tH2RfBpH0HPEMsyLKqH9HfA3laXiDIavJ
 T6liCSq1bLeF/wk+AoxrEoVZ/QEZPAvkSqgU1aO7grzz/9NvzAVCjC3SABeQMyx1PPuf
 TElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679656212;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Irg5VcYPciLrLKchNpKf+KEbGg91jjyzvvTNI795p4I=;
 b=3xbqlpkVfwvZLJ9+abBIX/U3viPOFcQKgC1tRl8DcSoy7TJRuNEnpdD3BHfFMc048f
 vFL1TqaxXnaJJbLmZnhw5xOeglZhjVbzNJ+PYjJvj4NeoncUkcvnKScreDFGo9G0zS93
 RecYooq57ZRXwJKNPQwA/VgdKYuajjBzRLSETNZdjCHxLVhyg8K8BeHmzZkwvgm0EzeV
 1y91by7xbFIx4iIXXbWePEVi0UzkNT+ZO68PkUoOTcNfZkG2LT4LiqwSkadkKdhN4qrO
 QYehUjuK4e9YeZTphVBnfvBAKDkAPFxRCXYBqiaSbFurREmSOivUxdFMLXeGSmy5M6gn
 UrrQ==
X-Gm-Message-State: AAQBX9dtCDOY6hGo3dbeypfzeLkT5GPhgpjV+oNl85puzqJGM27otVM8
 Mt4ZLy3DlPluQe7ml9lpxWFjncKGqtCOGyjq
X-Google-Smtp-Source: AKy350ZNm4A1FsS3wscT/NFBAGZD6a0uJan8x3T7ZymUyecD1z+avmrMW1+qjxAhOl0imGVjRvLUlg==
X-Received: by 2002:a17:902:780e:b0:19b:da8:1ce6 with SMTP id
 p14-20020a170902780e00b0019b0da81ce6mr1718616pll.55.1679655701164; 
 Fri, 24 Mar 2023 04:01:41 -0700 (PDT)
Received: from fedlinux.. ([106.84.130.185]) by smtp.gmail.com with ESMTPSA id
 j1-20020a17090276c100b00195f0fb0c18sm13931437plt.31.2023.03.24.04.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 04:01:40 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, damien.lemoal@opensource.wdc.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, hare@suse.de, dmitry.fomichev@wdc.com,
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v18 5/8] config: add check to block layer
Date: Fri, 24 Mar 2023 19:01:20 +0800
Message-Id: <20230324110120.4131-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=faithilikerun@gmail.com; helo=mail-yw1-x1131.google.com
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
index 0dd604d0f6..4ebf7bbc90 100644
--- a/block.c
+++ b/block.c
@@ -7953,6 +7953,25 @@ void bdrv_add_child(BlockDriverState *parent_bs, BlockDriverState *child_bs,
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
index 0c19cfb5cc..5fa80933c9 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -776,6 +776,18 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
             goto fail;
         }
     }
+#ifdef CONFIG_BLKZONED
+    /*
+     * The kernel page cache does not reliably work for writes to SWR zones
+     * of zoned block device because it can not guarantee the order of writes.
+     */
+    if ((bs->bl.zoned != BLK_Z_NONE) &&
+        (!(s->open_flags & O_DIRECT))) {
+        error_setg(errp, "The driver supports zoned devices, and it requires "
+                         "cache.direct=on, which was not specified.");
+        return -EINVAL; /* No host kernel page cache */
+    }
+#endif
 
     if (S_ISBLK(st.st_mode)) {
 #ifdef __linux__
diff --git a/block/raw-format.c b/block/raw-format.c
index 6e1b9394c8..72e23e7b55 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -621,6 +621,7 @@ static void raw_child_perm(BlockDriverState *bs, BdrvChild *c,
 BlockDriver bdrv_raw = {
     .format_name          = "raw",
     .instance_size        = sizeof(BDRVRawState),
+    .supports_zoned_children = true,
     .bdrv_probe           = &raw_probe,
     .bdrv_reopen_prepare  = &raw_reopen_prepare,
     .bdrv_reopen_commit   = &raw_reopen_commit,
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index a3efb385e0..1bd2aef4d5 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -137,6 +137,11 @@ struct BlockDriver {
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
2.39.2


