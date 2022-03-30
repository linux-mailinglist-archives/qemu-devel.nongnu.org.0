Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3CB4ED06D
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:52:48 +0200 (CEST)
Received: from localhost ([::1]:37820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZi7L-0008A4-VN
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:52:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZft9-0008IK-Lk
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:30:00 -0400
Received: from [2a00:1450:4864:20::12c] (port=43745
 helo=mail-lf1-x12c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZft6-0003PS-MO
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:59 -0400
Received: by mail-lf1-x12c.google.com with SMTP id z12so24288655lfu.10
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bq+hFgyIVkP5E/EDUg3vF2NH71m8OlRAUrnTOSSkVBY=;
 b=hCabyCe7geCpUwS9CMoi+QB8KHxgf7oypB7SdHjNL/+VV2MK4dj8SzuWAevWbgdBaj
 qpX4SThWTSnm3kUACn4fegbe1o2olSjUx97NjabbAYIFM8UxyvGvUFsW0UzQ2prUBdNd
 tlEmEGAHciA2pY4wwof7fD+q9GqtX8csYWCdSu7+eF7yFPvrbt/4kjR2bX7zjIiVqKnO
 bwyxstXVIvPE5dvrHnKheuzxcZDIKNTE0ra0emj21c3pUaW3uUIzv72USOQkxrYWS0f+
 /ndKOCp04tvD1ecH4I/riftrjvjAqGxCpnhGjhiGO8oMdjs/gQs2ToY1Eu4jmHpRQREQ
 4sqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bq+hFgyIVkP5E/EDUg3vF2NH71m8OlRAUrnTOSSkVBY=;
 b=lnx6fNvqxU0RYFu4H7+fxunfaiSsV0+oiEq7JFQtXDwf376c/RAGllI8PFWYLxm+M9
 YbNckz6JDbGmstBPSbvuTU0foJzpasovicyaNwB853RwvGaHllJ56MhJdY/7o4syUo0/
 UAXKDF24cCXWswxBCfUfw+xXGZ8dargoclMr4MQQA08xPN5bZCb+1Jrq1trj4Kkryi9B
 /v3sVB0zSkHEvYu6IydxUNN65ocpLVyuiDLHkUwD1sjFtofBcgST2Y/Qx5Mh5Fq83cUN
 OH9kp5XRXcCbWQw1J+GHNokWZfTpBNoHYWVb7pj7e47UN0Os9HnySF9N1nbUNEJxRDMO
 TPUg==
X-Gm-Message-State: AOAM5319AFtWGUhH/JM/rJcF/3yj/7XrJVhyKgWxohGlCPTy8CG/joGq
 Xdn+UOdjNkZGUFyCVg0jATq0nQ==
X-Google-Smtp-Source: ABdhPJxZYaPNl9PRdk4fbRcjK5UaEfQCdh9Q6gcTvN8AhAtdgyEiqQo0y7roYFvF7gk7Ly6uGt0G+Q==
X-Received: by 2002:a05:6512:2214:b0:44a:348a:d6d with SMTP id
 h20-20020a056512221400b0044a348a0d6dmr8410856lfu.506.1648675793278; 
 Wed, 30 Mar 2022 14:29:53 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:53 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 35/45] block: make bdrv_find_child() function public
Date: Thu, 31 Mar 2022 00:28:52 +0300
Message-Id: <20220330212902.590099-36-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x12c.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Mar 2022 19:17:26 -0400
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, hreitz@redhat.com,
 vsementsov@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be reused soon.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 block.c                      | 13 +++++++++++++
 blockdev.c                   | 14 --------------
 include/block/block_int-io.h |  1 +
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/block.c b/block.c
index 17c057a962..9e1be402e2 100644
--- a/block.c
+++ b/block.c
@@ -8039,6 +8039,19 @@ int bdrv_make_empty(BdrvChild *c, Error **errp)
     return 0;
 }
 
+BdrvChild *bdrv_find_child(BlockDriverState *parent_bs, const char *child_name)
+{
+    BdrvChild *child;
+
+    QLIST_FOREACH(child, &parent_bs->children, next) {
+        if (strcmp(child->name, child_name) == 0) {
+            return child;
+        }
+    }
+
+    return NULL;
+}
+
 /*
  * Return the child that @bs acts as an overlay for, and from which data may be
  * copied in COW or COR operations.  Usually this is the backing file.
diff --git a/blockdev.c b/blockdev.c
index 3afd2ceea8..abd0600d15 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3672,20 +3672,6 @@ out:
     tran_finalize(tran, ret);
 }
 
-static BdrvChild *bdrv_find_child(BlockDriverState *parent_bs,
-                                  const char *child_name)
-{
-    BdrvChild *child;
-
-    QLIST_FOREACH(child, &parent_bs->children, next) {
-        if (strcmp(child->name, child_name) == 0) {
-            return child;
-        }
-    }
-
-    return NULL;
-}
-
 void qmp_x_blockdev_change(const char *parent, bool has_child,
                            const char *child, bool has_node,
                            const char *node, Error **errp)
diff --git a/include/block/block_int-io.h b/include/block/block_int-io.h
index bb454200e5..0ce5eaf9a2 100644
--- a/include/block/block_int-io.h
+++ b/include/block/block_int-io.h
@@ -122,6 +122,7 @@ int coroutine_fn bdrv_co_copy_range_to(BdrvChild *src, int64_t src_offset,
 
 int refresh_total_sectors(BlockDriverState *bs, int64_t hint);
 
+BdrvChild *bdrv_find_child(BlockDriverState *parent_bs, const char *child_name);
 BdrvChild *bdrv_cow_child(BlockDriverState *bs);
 BdrvChild *bdrv_filter_child(BlockDriverState *bs);
 BdrvChild *bdrv_filter_or_cow_child(BlockDriverState *bs);
-- 
2.35.1


