Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD12C4ED021
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:30:05 +0200 (CEST)
Received: from localhost ([::1]:51142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZhlM-0003tY-N2
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:30:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfsy-000872-An
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:48 -0400
Received: from [2a00:1450:4864:20::232] (port=35571
 helo=mail-lj1-x232.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfsv-0003Fo-PK
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:48 -0400
Received: by mail-lj1-x232.google.com with SMTP id h11so29454291ljb.2
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=49dpx2taTirHVyHk8EEtBtzEgW09J1iz4kQavl5fPn4=;
 b=PHkjwTWSYMVC6kt2GeLqSRNbsYcWc3l7j7/o7b1MT7VVixGquyFE5DqphqiG7PjcGm
 CMGKZp4zk0WdDv0itY+erjxv6hu8ycJ3UvEvcagB+e2beM+Emf2KTPsP3JY7UxpTxJqy
 Wv6jmXj18IQAx18T4egInk2laslR87jo/f2qN5VBtFgogAKCDIN3SUZiufGk2CMXK3H/
 RmTvdeAFM/HJPv73cuPhVnNrkWkqHuzZKPzFZucCf3pmNH6AHSTuBS7qctcybVsBOCGr
 vB0EMBN2hYKhBrYcGsCGrFdf1G9rWDB2HHyYvwqpOJpEWP/tkymBqyaP7qUp0kDiRHIe
 MMfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=49dpx2taTirHVyHk8EEtBtzEgW09J1iz4kQavl5fPn4=;
 b=ysmuU8foK/zXtN7m5rT453k5NFV1ue4To2a0nNcIsC7697XyOZiD8cE/cevilgYmBp
 eN2rn085X27s4EX8VM5WDvoZMqbHr2MGFW9VTZtOxbILkmPo/h/VsT+ZnYL7N/8cRTQK
 NlvBwgpSbc9tj9dfuxWOUKHb2tbfKxXM3tIFXdGSZ/LZLUbczUMW5pbA2lOavZV3u5UN
 y9YF7o5KTM4aQ8PJRzzJeZ70Ay8nWIKk7kMXfYK45Qn6oy4qGJ4gjbKgrHTEW+A/6jsK
 1DX9sn61NH4zlVVbkOLgV+edQj/XHfJO5RpfstV2Ax27xbDN7YGH2YKqyk7ViGEklQ6n
 DFpg==
X-Gm-Message-State: AOAM531OB/1/pQS++QCND6YCN59W10agjU0AT+1Vyeq/MyZlg5xU0GOS
 Khf6j2dQVK6dM8jk6EYTME4yKg==
X-Google-Smtp-Source: ABdhPJyi43JGWaSk9b3LpqEH7zUFuyumO9qd/iKUhsDuvFIMAXqzQn69UI2CMCsqu8w89DRdIxvIjA==
X-Received: by 2002:a05:651c:10b4:b0:249:6026:d11c with SMTP id
 k20-20020a05651c10b400b002496026d11cmr8622327ljn.292.1648675782539; 
 Wed, 30 Mar 2022 14:29:42 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:42 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 18/45] block: bdrv_refresh_perms(): allow external tran
Date: Thu, 31 Mar 2022 00:28:35 +0300
Message-Id: <20220330212902.590099-19-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::232
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lj1-x232.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Mar 2022 19:17:25 -0400
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
Cc: kwolf@redhat.com, hreitz@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow passing external Transaction pointer, stop creating extra
Transaction objects.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 block.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/block.c b/block.c
index 656e596e0c..f3ed351360 100644
--- a/block.c
+++ b/block.c
@@ -2557,15 +2557,24 @@ char *bdrv_perm_names(uint64_t perm)
 }
 
 
-static int bdrv_refresh_perms(BlockDriverState *bs, Error **errp)
+/* @tran is allowed to be NULL. In this case no rollback is possible */
+static int bdrv_refresh_perms(BlockDriverState *bs, Transaction *tran,
+                              Error **errp)
 {
     int ret;
-    Transaction *tran = tran_new();
+    Transaction *local_tran = NULL;
     g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
     GLOBAL_STATE_CODE();
 
+    if (!tran) {
+        tran = local_tran = tran_new();
+    }
+
     ret = bdrv_list_refresh_perms(list, NULL, tran, errp);
-    tran_finalize(tran, ret);
+
+    if (local_tran) {
+        tran_finalize(local_tran, ret);
+    }
 
     return ret;
 }
@@ -2581,7 +2590,7 @@ int bdrv_child_try_set_perm(BdrvChild *c, uint64_t perm, uint64_t shared,
 
     bdrv_child_set_perm(c, perm, shared, tran);
 
-    ret = bdrv_refresh_perms(c->bs, &local_err);
+    ret = bdrv_refresh_perms(c->bs, tran, &local_err);
 
     tran_finalize(tran, ret);
 
@@ -3076,7 +3085,7 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
         goto out;
     }
 
-    ret = bdrv_refresh_perms(child_bs, errp);
+    ret = bdrv_refresh_perms(child_bs, tran, errp);
 
 out:
     tran_finalize(tran, ret);
@@ -3116,7 +3125,7 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
         goto out;
     }
 
-    ret = bdrv_refresh_perms(parent_bs, errp);
+    ret = bdrv_refresh_perms(parent_bs, tran, errp);
     if (ret < 0) {
         goto out;
     }
@@ -3144,7 +3153,7 @@ void bdrv_root_unref_child(BdrvChild *child)
          * we're loosening restrictions. Errors of permission update are not
          * fatal in this case, ignore them.
          */
-        bdrv_refresh_perms(child_bs, NULL);
+        bdrv_refresh_perms(child_bs, NULL, NULL);
 
         /*
          * When the parent requiring a non-default AioContext is removed, the
@@ -3386,7 +3395,7 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
         goto out;
     }
 
-    ret = bdrv_refresh_perms(bs, errp);
+    ret = bdrv_refresh_perms(bs, tran, errp);
 out:
     tran_finalize(tran, ret);
 
@@ -5203,7 +5212,7 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
         goto out;
     }
 
-    ret = bdrv_refresh_perms(bs_new, errp);
+    ret = bdrv_refresh_perms(bs_new, tran, errp);
 out:
     tran_finalize(tran, ret);
 
@@ -6500,7 +6509,7 @@ int bdrv_activate(BlockDriverState *bs, Error **errp)
      */
     if (bs->open_flags & BDRV_O_INACTIVE) {
         bs->open_flags &= ~BDRV_O_INACTIVE;
-        ret = bdrv_refresh_perms(bs, errp);
+        ret = bdrv_refresh_perms(bs, NULL, errp);
         if (ret < 0) {
             bs->open_flags |= BDRV_O_INACTIVE;
             return ret;
@@ -6645,7 +6654,7 @@ static int bdrv_inactivate_recurse(BlockDriverState *bs)
      * We only tried to loosen restrictions, so errors are not fatal, ignore
      * them.
      */
-    bdrv_refresh_perms(bs, NULL);
+    bdrv_refresh_perms(bs, NULL, NULL);
 
     /* Recursively inactivate children */
     QLIST_FOREACH(child, &bs->children, next) {
-- 
2.35.1


