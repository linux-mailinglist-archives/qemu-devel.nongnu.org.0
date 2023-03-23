Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C0A6C5E80
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 06:10:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfDCZ-0005yS-BF; Thu, 23 Mar 2023 01:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pfDCX-0005xi-Gz; Thu, 23 Mar 2023 01:09:25 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pfDCV-00030m-Qe; Thu, 23 Mar 2023 01:09:25 -0400
Received: by mail-pg1-x535.google.com with SMTP id d22so11889968pgw.2;
 Wed, 22 Mar 2023 22:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679548161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Irg5VcYPciLrLKchNpKf+KEbGg91jjyzvvTNI795p4I=;
 b=c089fasMXE41QjftA82R3FEUbq+GA4hRY8GBnWAMTJOoRMqsQpX74KW8IRmgWRTdCz
 UQJyAhBKv5h4+iEISEOcBb7kqx7vZMpUFQX81mjFCf47pTKmjotqyDKrqvIEcKvFxLjG
 LqYbSJed+5zhshEOGpWmEKVBBr0WdX1qTzyqgAuv3fZr8XEUEfcMuopjq1OytqcxbFE+
 3zypr0voVOkC+kjm1VU/cINJkkSWDCfAtBzNVh2pxdUyO3LHFW3Wkh5CbUcpE5iSRJoe
 rehBAaA8hBOLnLeyU6YHxIoaA3tQZGTBKDgqeQGnF9xPHJxyan/dLQy28YKyZGG+G6wU
 CibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679548161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Irg5VcYPciLrLKchNpKf+KEbGg91jjyzvvTNI795p4I=;
 b=Q1sES+FoIGq6wemVnXLPy6wpVkghz9+ugllHN1nNytehEpxfdewBc4qjgFYdMW/LTu
 jd0nB5XHMAmeEdivHjPfyKtGasHWMK/6ZiSuOKxHuNUZ3tZKEORkzYJ3kjlytHBc9bAJ
 gzKQMT2uY0hhMO9QDzPVGVu3eU/WprJurNH/5UCp3+5pW3PNiI7AVo71wsR6xpOtZxCE
 s00SRotaotyeQIfuuRrYZj7zEb1FpQ8wmYOwksFEJVMZnZexxZiwdDRKzhAidf/yvnuC
 cvafyc3qcaBxcm4EUdqGJSleL5CQ8+zx8UlOAAjQi0hFBczjESQCsBOCdquqLvgMxJl4
 QEKA==
X-Gm-Message-State: AO0yUKXwRHxOiG7iBhiXXbu37R+scGZ7Rr5+SptXaBWkUGOemVGmDakn
 U8hsQ4BTYbF4IAXwQovfPYlSBAimL1pejoayUQ8=
X-Google-Smtp-Source: AK7set9+eYSLBA17eQ8eWcLmDnjKbiReAtNu+Ya+TxYmAq1gMoFrZbYlbYx2gjIxRd8yI3gDJ48G8A==
X-Received: by 2002:a62:4e47:0:b0:626:166f:6db1 with SMTP id
 c68-20020a624e47000000b00626166f6db1mr5442445pfb.13.1679548160920; 
 Wed, 22 Mar 2023 22:09:20 -0700 (PDT)
Received: from fedlinux.. ([106.84.129.82]) by smtp.gmail.com with ESMTPSA id
 y22-20020aa78556000000b00627eac32b11sm8157888pfn.192.2023.03.22.22.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 22:09:20 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, damien.lemoal@opensource.wdc.com,
 Fam Zheng <fam@euphon.net>, hare@suse.de, dmitry.fomichev@wdc.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v17 5/8] config: add check to block layer
Date: Thu, 23 Mar 2023 13:08:31 +0800
Message-Id: <20230323050834.5199-6-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230323050834.5199-1-faithilikerun@gmail.com>
References: <20230323050834.5199-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=faithilikerun@gmail.com; helo=mail-pg1-x535.google.com
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


