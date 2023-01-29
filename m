Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 176B667FE35
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 11:31:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pM4wT-0005Nx-MW; Sun, 29 Jan 2023 05:29:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pM4wE-0005Jz-Lx; Sun, 29 Jan 2023 05:29:30 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pM4wD-0007C2-20; Sun, 29 Jan 2023 05:29:30 -0500
Received: by mail-pj1-x1036.google.com with SMTP id o13so8658417pjg.2;
 Sun, 29 Jan 2023 02:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7kn/ee/b4uHSDw62GF6lj1ZLODdyoKPhXIYeoKCX5EM=;
 b=jclzbM+nwHQ15H8xsHycPPwwRdEeWtwk6t9zqEKiOV3cRpRc/1czj4FG/LhZ2W5u6h
 0vuCIKbCsGzdztyy13diqUfm2KaluVTbm4s6iaXfKXo2kX0r5Xx7mPFRz6yVM3uLkjnh
 M0RH7HccSvqPT9sMlCt3K8tSxaVqpiK+Fr1Qk6VbTtJPIvrJWqKUeLsiB7GuUxaP1N5z
 NXtBJ/DQWNTCL9ZisRO1XKaWH+j+dLpfGwLE4kMTQTe2FBtgJUrn06dA+0tqww+GRxZ0
 Di917zBOJg0vKJdeGo1IraeLBUZkQ3FOf6oDxqf3w143+VBGRNfq8se1w2NxEgNmHWE5
 comw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7kn/ee/b4uHSDw62GF6lj1ZLODdyoKPhXIYeoKCX5EM=;
 b=pMT+9tdUWPxy8YiE2HxPt1GbFbYP+z+7o8n9emRycG9Jpemdjrq+fWuaLROhnBfLix
 yQavhOBo5SSjcHuVdyJaidK23qeuj35XBI+sZs/clHKUOdvtGeYHUP6svm0kp8Sp7KZQ
 0kEOC67h5CK22DmMMCuhpPABs5KFtuHIJwMn8sHtpGuQfml9j09YvooHnGYFaEYx9a/H
 zZH2ETHwjZDwy+OPYmuU8pUhy02nZAkFY55MR6mTafvMtlNWgAZIGbwJQvTwcn49SiI/
 PBpV/3djzM6kJvNpf04ch8X1AwYesKydyfqPr91ShPWaye/7J0eGKSE6BGA7n2tC0V3r
 Dj6w==
X-Gm-Message-State: AFqh2kqA+sggsBHtwDhP5ehN1ss7sxlfreLLXRkBVrBcelGb8Mgu+xhi
 V+LPcVVSGy1h1GTn5zK8azKKhSLaeccV8hMm3WM=
X-Google-Smtp-Source: AMrXdXtRMTJyhT/uuOPG1VfRoI8dWUKySrMbXJuJU1eUexhborIWfN2YmuMRlm1X1V+y5ydppsmUrw==
X-Received: by 2002:a17:902:d2cd:b0:195:e457:341a with SMTP id
 n13-20020a170902d2cd00b00195e457341amr44338142plc.4.1674988166795; 
 Sun, 29 Jan 2023 02:29:26 -0800 (PST)
Received: from fedlinux.. ([106.84.129.237]) by smtp.gmail.com with ESMTPSA id
 jl1-20020a170903134100b0019644d4242dsm5439416plb.82.2023.01.29.02.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 02:29:26 -0800 (PST)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, dmitry.fomichev@wdc.com, hare@suse.de,
 damien.lemoal@opensource.wdc.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v15 5/8] config: add check to block layer
Date: Sun, 29 Jan 2023 18:28:47 +0800
Message-Id: <20230129102850.84731-6-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230129102850.84731-1-faithilikerun@gmail.com>
References: <20230129102850.84731-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x1036.google.com
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
index b4a89207ad..5ab0b26510 100644
--- a/block.c
+++ b/block.c
@@ -7913,6 +7913,25 @@ void bdrv_add_child(BlockDriverState *parent_bs, BlockDriverState *child_bs,
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
index b6d88db208..f661f202a1 100644
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
index dbbb8f3859..772ce777ff 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -618,6 +618,7 @@ static void raw_child_perm(BlockDriverState *bs, BdrvChild *c,
 BlockDriver bdrv_raw = {
     .format_name          = "raw",
     .instance_size        = sizeof(BDRVRawState),
+    .supports_zoned_children = true,
     .bdrv_probe           = &raw_probe,
     .bdrv_reopen_prepare  = &raw_reopen_prepare,
     .bdrv_reopen_commit   = &raw_reopen_commit,
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 565228d8dd..cd631f94ed 100644
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
2.38.1


