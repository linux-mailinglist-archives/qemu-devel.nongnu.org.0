Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 020256B3BF7
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 11:25:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paZvj-00008b-8r; Fri, 10 Mar 2023 05:24:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1paZvX-0008Ba-KX; Fri, 10 Mar 2023 05:24:43 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1paZvR-0002Tz-45; Fri, 10 Mar 2023 05:24:39 -0500
Received: by mail-pl1-x62f.google.com with SMTP id a9so5041062plh.11;
 Fri, 10 Mar 2023 02:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678443875;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sd6ljlicDsYI4fnvkG+5cr+IU4uKMWOEEDAKptPOLME=;
 b=gpX8rIWc+pZ83fShsxF0CeacSBCO988+JUZYz7hsGYJScvFyDZkvrTetwDvcVD4RBi
 4hC92tRTdqOplW1yr7FrYvnLUHksCVaKg3dGS7qjE5WhFaa9sRh+f2rtK11jLnKScTcJ
 0XfaxaX71qD6dWlK/FFCLo/nx12rAk3hLoqQ16kABPFEvJDugcsDhis3zyXd6QX3U6yW
 XY1K/vC6UNPgDQUwJyMuZnrJ2i+nLtSMbnDsDLxSVMr103p/sNy9M5KSnJGnekpQfn52
 ONO8wiEKrri/40LtvH6H2eS9FI/RRm2Y0yOAfGbWbvwuj5ip0/8CwQHIVqpA25Ywo6p/
 WtlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678443875;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sd6ljlicDsYI4fnvkG+5cr+IU4uKMWOEEDAKptPOLME=;
 b=g4Hv+j+3lb3kpRcM3+4pbDlSaXwuII7r6/iJg8QgHwcag+vd2vruR5zUALnmmAYunt
 nVtvOyTvcpkNDI1gt2I8kBR2pd2HLlMlZtPA5v9z1wr1YiwYSH4PCaW/JAKXqUDHfrWd
 kduENpryAg40pBlOTTfMKQoCGjTAp2+5pO4N+HRSm4hl7cFToeKRNcWYBvafs1dAxgpM
 Q/1ImFgwcrdw5Imq3bwIVqyX6C7PfiHHl+IVOO8KZ7tCn0XHDcVfZXipq8EeBKuLhG5o
 WrkRp4ZlLiwcZzvJeshhCjhQmHIicY8mJuOkf9Mb3OT7txfowIcmv5YRPr4RtbaspG3u
 /ERA==
X-Gm-Message-State: AO0yUKWKLBs3ClY3ewZx8Puq/ORpD/m814h/B9nczjYz2a4A5qpz+m0A
 fWWrEG4TWvNy3UOYgRngQA/qun0VJZqpVaSfQn0=
X-Google-Smtp-Source: AK7set/Wq+K1Nhk6VLnoRMeCj5FHZvh3YOmGfS6lsgMUqKdv/N2Oi4CwQkpCQTm4sBi45qi3ugbuZg==
X-Received: by 2002:a05:6a21:6d9a:b0:be:a9c7:5d12 with SMTP id
 wl26-20020a056a216d9a00b000bea9c75d12mr27825293pzb.18.1678443874162; 
 Fri, 10 Mar 2023 02:24:34 -0800 (PST)
Received: from fedlinux.. ([106.84.129.9]) by smtp.gmail.com with ESMTPSA id
 f8-20020a63f748000000b005030113f46dsm1008719pgk.37.2023.03.10.02.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 02:24:33 -0800 (PST)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, damien.lemoal@opensource.wdc.com, hare@suse.de,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 dmitry.fomichev@wdc.com, Thomas Huth <thuth@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v16 5/8] config: add check to block layer
Date: Fri, 10 Mar 2023 18:24:00 +0800
Message-Id: <20230310102403.61347-6-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310102403.61347-1-faithilikerun@gmail.com>
References: <20230310102403.61347-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x62f.google.com
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
index df9b9f1e30..2eceb250f1 100644
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


