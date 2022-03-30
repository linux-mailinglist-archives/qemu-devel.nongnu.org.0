Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C12F4ECFFB
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:21:51 +0200 (CEST)
Received: from localhost ([::1]:52754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZhdO-0001wy-0q
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:21:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfss-0007yt-Ny
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:42 -0400
Received: from [2a00:1450:4864:20::235] (port=39439
 helo=mail-lj1-x235.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfsp-0003Bp-UT
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:42 -0400
Received: by mail-lj1-x235.google.com with SMTP id bn33so29474807ljb.6
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wxu0Ad3k2MULhZ+YbYYmL+mmbXbe7FlGdUS31dOR4Ko=;
 b=Elt/axAEbhYpi90aLHeS2c8l2svxOWt9nZ56zxoeS96SSgdzTc1KP0LsJVzH7y+/Wy
 Ytqph+Qj2ENs8K9CSOYyYQzB1nKYRW2OhWSHtOQaknyZhKGGDbAKvhd5PGz4LT15MXXH
 LnG20AEgMaFXqshhy6q8KthjqELf0gEErT9qMjNoe5zCO6De4zy9LveQemQPgPc5WRru
 1RqzYt1nxkfae5iJ4GPDJmJv7weqjd5e5uMDmPdvwTm/zZQp+xHQf5W1M3Xs69VnRUJx
 foY9bB3l97/Om3B/AwsayBghCaRFj3/hYGVczq5RYqloKmI4adDsKPPRRn0N6bL+9nWo
 as2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wxu0Ad3k2MULhZ+YbYYmL+mmbXbe7FlGdUS31dOR4Ko=;
 b=0hBY3rgav0py48hQvcwJLbIu0+bU9XSq6j7MRZVFVkE1z3PhrbVbP0YWtKqwCXJ9A0
 Vj8l+mJdtTUW6MCPrmycIHCBVXPeoMP7tbvjbZv9LlxCeLdmtN4Omu+UK1/Y8fwju9By
 ocLdqhfWV3E1UWjJSr0QhbeGO8vMCAcPC/EndNE0JsWUhZNBu1SX9ZOy+FRtxVXBAZUF
 rqg5ivg8rGxOlg82e/uUEh5u+RLRGjL1wraZnjxu6YEUwHexkjGLcDCaQNBzllYJowkX
 xUOj6ks6iuAcv7APUG+qVB/nWvp9BuEotyZxwSpu+bTbFCCuEhIk3FQzmFG3aZqkv/0B
 YWrA==
X-Gm-Message-State: AOAM531DTrNk7WZ5B9rzL07XteG0Jy33GgBPqFEBGA5v01VIzniyE1x2
 rEt5NL019+6icr5nJzioqiy0iYwu6Gd/7g==
X-Google-Smtp-Source: ABdhPJw5jWbzm52duEyfw1rdjjwY/docPq8X5rrRO4kXO3C6wTjqlZm79TX7R5MJIZY7oKLRVQL3lg==
X-Received: by 2002:a2e:145e:0:b0:249:7feb:58bd with SMTP id
 30-20020a2e145e000000b002497feb58bdmr8452781lju.449.1648675778245; 
 Wed, 30 Mar 2022 14:29:38 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:38 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 11/45] Revert "block: Restructure
 remove_file_or_backing_child()"
Date: Thu, 31 Mar 2022 00:28:28 +0300
Message-Id: <20220330212902.590099-12-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::235
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lj1-x235.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Mar 2022 19:17:17 -0400
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

That's a preparation to previously reverted
"block: Let replace_child_noperm free children". Drop it too, we don't
need it for a new approach.

This reverts commit 562bda8bb41879eeda0bd484dd3d55134579b28e.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 block.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/block.c b/block.c
index 258851576a..34eee40d48 100644
--- a/block.c
+++ b/block.c
@@ -5051,33 +5051,30 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
                                               BdrvChild *child,
                                               Transaction *tran)
 {
-    BdrvChild **childp;
     BdrvRemoveFilterOrCowChild *s;
 
+    assert(child == bs->backing || child == bs->file);
+
     if (!child) {
         return;
     }
 
-    if (child == bs->backing) {
-        childp = &bs->backing;
-    } else if (child == bs->file) {
-        childp = &bs->file;
-    } else {
-        g_assert_not_reached();
-    }
-
     if (child->bs) {
-        bdrv_replace_child_tran(*childp, NULL, tran);
+        bdrv_replace_child_tran(child, NULL, tran);
     }
 
     s = g_new(BdrvRemoveFilterOrCowChild, 1);
     *s = (BdrvRemoveFilterOrCowChild) {
         .child = child,
-        .is_backing = (childp == &bs->backing),
+        .is_backing = (child == bs->backing),
     };
     tran_add(tran, &bdrv_remove_filter_or_cow_child_drv, s);
 
-    *childp = NULL;
+    if (s->is_backing) {
+        bs->backing = NULL;
+    } else {
+        bs->file = NULL;
+    }
 }
 
 /*
-- 
2.35.1


