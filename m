Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 540475A2C52
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 18:32:33 +0200 (CEST)
Received: from localhost ([::1]:47460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRcG0-0000SD-6n
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 12:32:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oRc5d-0002M1-9I; Fri, 26 Aug 2022 12:21:49 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:40899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oRc5b-0000Ce-7s; Fri, 26 Aug 2022 12:21:48 -0400
Received: by mail-pf1-x42e.google.com with SMTP id y141so1999859pfb.7;
 Fri, 26 Aug 2022 09:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=FsaE+f5nrXOlpnlLcCe9659ufc9d3HLDaje6m9c0cck=;
 b=WXak7efIMiyjW4TkLbN59gDYvZiWJDt7Aj+oGfBODvAd2uu2qZKx8kvOmg2+FgKTvR
 aWrEA6PZ2Okg6Skjouf2qy3XrwKuJJDd+/wfUWW8yXRrNOLAy6W6AOydK5eJWLGw+Je1
 srohs046YfBQsMr4fJxYwHMbQDGn2I76Y7QkHOIQb19jtHYdDr654NFXvcZG0vMKALSw
 uz59t6IE8Af232PY3q5Ca1zHbnrtNT9pGuPzSUaP11IYBdtE2FyLsS0tfhpN534bQQlK
 jTpd775BVsKHAWYDce3qO8UeYhIx8Wh5lrjmngdiVwhvcu/oFJjXHITR7xaahjbnZ1kn
 1V4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=FsaE+f5nrXOlpnlLcCe9659ufc9d3HLDaje6m9c0cck=;
 b=wXkCGmcUL5sDYTlCABOlyIA/JMI7Eol5dJGiiYJoPBIHYaGgPOp7IUsKzXHwsjM8dB
 glCOGwvFyyHPw908k98yA1+JM/3iL8pQY2LpT/aYGMxdHvJ/f9Mr+7tOFBnMcXQvjMjJ
 ztbUNPd/JJnwHkw3UiNzdDT/F72uXb7VR86k+/anK4ivCfy10R1GY+vydyPOgigz8S6e
 wbZf6cgOE7TrDjAtvp/T+9GbsxzxiuaA8+/BXjaP7epA/Sgt45PDHTlpxB0TUHxElQFE
 crSboF03c6BWxjR3TKZvA6dUtHQDvDavf/ADtJL6s3XVHmmqLp3dHaxpzydQK8kXhyy7
 CT+g==
X-Gm-Message-State: ACgBeo0lzBdQ08RouO5U1lRb/np1Cz/drKx+hd5F3pTdpRvrrr9P3epY
 LD+4d5nUuFO2+MD0ju70zpu04sekCX7Y8Q==
X-Google-Smtp-Source: AA6agR6tn/piWGsX5FEYpVlracQoLzGjkDWJ6zj9PD2QM42sJWuIRStWsW4fPKUmaNYQHWr+qyWseA==
X-Received: by 2002:a05:6a00:ac6:b0:530:3197:48b6 with SMTP id
 c6-20020a056a000ac600b00530319748b6mr4642577pfl.80.1661530904175; 
 Fri, 26 Aug 2022 09:21:44 -0700 (PDT)
Received: from roots.. ([106.84.135.2]) by smtp.gmail.com with ESMTPSA id
 t4-20020a17090ae50400b001fb350026f1sm1860374pjy.4.2022.08.26.09.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 09:21:43 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, damien.lemoal@opensource.wdc.com,
 Dmitry.Fomichev@wdc.com, hare@suse.de, qemu-block@nongnu.org,
 hreitz@redhat.com, eblake@redhat.com, armbru@redhat.com, fam@euphon.net,
 kwolf@redhat.com, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v8 5/7] config: add check to block layer
Date: Sat, 27 Aug 2022 00:21:31 +0800
Message-Id: <20220826162131.8352-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=faithilikerun@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Putting zoned/non-zoned BlockDrivers on top of each other is not
allowed.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block.c                          | 14 ++++++++++++++
 block/file-posix.c               | 13 +++++++++++++
 block/raw-format.c               |  1 +
 include/block/block_int-common.h |  5 +++++
 4 files changed, 33 insertions(+)

diff --git a/block.c b/block.c
index bc85f46eed..dad2ed3959 100644
--- a/block.c
+++ b/block.c
@@ -7947,6 +7947,20 @@ void bdrv_add_child(BlockDriverState *parent_bs, BlockDriverState *child_bs,
         return;
     }
 
+    /*
+     * Non-zoned block drivers do not follow zoned storage constraints
+     * (i.e. sequential writes to zones). Refuse mixing zoned and non-zoned
+     * drivers in a graph.
+     */
+    if (!parent_bs->drv->supports_zoned_children &&
+        child_bs->bl.zoned == BLK_Z_HM) {
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
index e3efba6db7..ec8672d33c 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -777,6 +777,19 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
             goto fail;
         }
     }
+#ifdef CONFIG_BLKZONED
+    /*
+     * The kernel page chache does not reliably work for writes to SWR zones
+     * of zoned block device because it can not guarantee the order of writes.
+     */
+
+    if (!(s->open_flags & O_DIRECT)) {
+        error_setg(errp, "driver=zoned_host_device was specified, but it "
+                         "requires cache.direct=on, which was not specified.");
+        ret = -EINVAL;
+        return ret; /* No host kernel page cache */
+    }
+#endif
 
     if (S_ISBLK(st.st_mode)) {
 #ifdef BLKDISCARDZEROES
diff --git a/block/raw-format.c b/block/raw-format.c
index 6b20bd22ef..9441536819 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -614,6 +614,7 @@ static void raw_child_perm(BlockDriverState *bs, BdrvChild *c,
 BlockDriver bdrv_raw = {
     .format_name          = "raw",
     .instance_size        = sizeof(BDRVRawState),
+    .supports_zoned_children = true,
     .bdrv_probe           = &raw_probe,
     .bdrv_reopen_prepare  = &raw_reopen_prepare,
     .bdrv_reopen_commit   = &raw_reopen_commit,
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 8541f36123..1bb5caa3be 100644
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
2.37.2


