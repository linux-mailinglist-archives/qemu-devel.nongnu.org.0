Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E6260FC43
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 17:48:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo559-0002M7-69; Thu, 27 Oct 2022 11:46:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oo553-0001zO-FC; Thu, 27 Oct 2022 11:46:06 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oo54z-00018g-H4; Thu, 27 Oct 2022 11:46:04 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 m14-20020a17090a3f8e00b00212dab39bcdso6902734pjc.0; 
 Thu, 27 Oct 2022 08:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f+iLtgJkxPaaEAC5I4tM8ivVOwvQH6OVtQJbShZ1HII=;
 b=TF8xwy0Gp4AQf6TeGoYEqB5ICrlbBOrRLfqVPxxKFk/xv9qCg6ZSPM9j3FLXxkupMx
 l53chX9r73OVmrH8OWjThC/iu/YvxD202PIj8pnbUK++hXRv9aFJBwqRdlh1cr70RuNc
 qnFXBUC2kwK6vxy9Z4PtD96YP5gVdgJFF53EDlRX/T5ZKBnkVSWVBSlroVvSbezgSi7I
 Y7n2AK5SIbuxkNEaNCqNyGE8tfUkpVCs42T/zdk8XSl4KTz2b4s4UqtUWeoFa2iLo6v2
 U48S77ZWPzYDlk6zpoK5FR1zCD+4Bs6aJSa78oRJO71lGL26FDKP9RK1IbLO0SrNzEbA
 Ud6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f+iLtgJkxPaaEAC5I4tM8ivVOwvQH6OVtQJbShZ1HII=;
 b=S/ltm0Gu7ABNId+eAim6xYdNmrBMZfbYw4T/OApkQGDkGBSlLpYoFn9SoadZaXkWbn
 R25YDzlkDPGMnOycZ1dDkhaSC9GrHQceDDQLj57i/Wg8GfiN5qhk+vjRFw2Xo/JEAxSs
 EncdFCJmbIRxaAJLoGcy6WFBY8NDD5NFCqekJUHa2zfoxWoBCE6BK3XEjxFCpd8nT7mX
 TRnHMxLD3z4IZGc2/5uXrv07Pc0BNJqtKnnPVdhSKlIZ6kXC+h/mrkF7umCfd5qkxNeE
 e2oIYkSCaTjI9FeryZF/MsNP1ayBH45x8FPzHdSpNmclsiniYmnOwPNm3svw3O7y9EsK
 bMAA==
X-Gm-Message-State: ACrzQf1whCrOs/1qSTf5Xp6/G46zDfYvQxK3rgAULjsHMGHtaBsa2ppS
 qu4DXSqvELvAthJGeuZPH1desPbnk8D5V6L8
X-Google-Smtp-Source: AMsMyM67PvWgFajKbDYcvQqjwy8/sDA8czUV1ExGvIziVJVpKD8Ngfl/hD3gazaaQ1KCYTBLbkl+qQ==
X-Received: by 2002:a17:903:50e:b0:182:631b:df6f with SMTP id
 jn14-20020a170903050e00b00182631bdf6fmr50075316plb.66.1666885559329; 
 Thu, 27 Oct 2022 08:45:59 -0700 (PDT)
Received: from roots.. ([112.44.202.248]) by smtp.gmail.com with ESMTPSA id
 q9-20020a63d609000000b004405c6eb962sm1232801pgg.4.2022.10.27.08.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 08:45:59 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>,
 damien.lemoal@opensource.wdc.com, qemu-block@nongnu.org,
 stefanha@redhat.com, Markus Armbruster <armbru@redhat.com>, hare@suse.de,
 Kevin Wolf <kwolf@redhat.com>, dmitry.fomichev@wdc.com,
 Eric Blake <eblake@redhat.com>, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v13 5/8] config: add check to block layer
Date: Thu, 27 Oct 2022 23:45:01 +0800
Message-Id: <20221027154504.20684-6-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221027154504.20684-1-faithilikerun@gmail.com>
References: <20221027154504.20684-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x1031.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
index 1fbf6b9e69..5d6fa4a25a 100644
--- a/block.c
+++ b/block.c
@@ -7951,6 +7951,25 @@ void bdrv_add_child(BlockDriverState *parent_bs, BlockDriverState *child_bs,
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
index 5f56526348..02476c011e 100644
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
index bac43f1d25..18dc52a150 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -615,6 +615,7 @@ static void raw_child_perm(BlockDriverState *bs, BdrvChild *c,
 BlockDriver bdrv_raw = {
     .format_name          = "raw",
     .instance_size        = sizeof(BDRVRawState),
+    .supports_zoned_children = true,
     .bdrv_probe           = &raw_probe,
     .bdrv_reopen_prepare  = &raw_reopen_prepare,
     .bdrv_reopen_commit   = &raw_reopen_commit,
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index c844ec3cf7..2c057a9980 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -127,6 +127,11 @@ struct BlockDriver {
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


