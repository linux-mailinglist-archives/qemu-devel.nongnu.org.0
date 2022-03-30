Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D434ED050
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:45:36 +0200 (CEST)
Received: from localhost ([::1]:53030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZi0M-0007fW-8f
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:45:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfsw-00084C-2c
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:46 -0400
Received: from [2a00:1450:4864:20::22f] (port=43581
 helo=mail-lj1-x22f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfst-0003FB-Gb
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:45 -0400
Received: by mail-lj1-x22f.google.com with SMTP id b43so24945746ljr.10
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l1vUszsfJpNXCu+Eia0kDoKwU3BaZtSMgLTxnae9d9A=;
 b=x9eWotIkqrpzRREkJUoMC9ACdIxPl5HEBxr4/0E3lRAqETgJtsKwfiysNIoQoaYwUJ
 5Nr1rwWvXioqxzMOCJ1SxigkQGHcaaWKf+uOKaJoTuYNA5G/ieZgY0l4sKwlmc2cFAtY
 67bpzaanO8TQk6Vk+SpLyR5PSrnmrjydx3ha2Eh6GsIrMmKOXzPFS9NTGZBMKpOeFjeK
 77XK8ehAOYrwiyJks+7Xke3tCTGz6j51A28n7iWibmqItDIMxbGTosWpYG5+LJalE/Z/
 NkmDvt02RUPxKeIxGgzOjQdFMMIqaPUO7cnSg1FRvXeCljVo8h9H8IrWKSF1YjU+fgsF
 kKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l1vUszsfJpNXCu+Eia0kDoKwU3BaZtSMgLTxnae9d9A=;
 b=CvS5hHaXnwpNZ9sQQlxhFNKtOVbIEYJwGXCIs18KAL06cO+mOTmRt49YInS3txqh4U
 OKvI4OtWl/RZ6eFcFeYTgCKAWzrGJCg65yM4KzuFMJKzP41w7o94ZB7JqTpuGbVbcmLI
 IwZswUjkcXgUyj04qZhAnc4QIcgDFH//hvNMu7PwboF6HCNliPIJFvm1JheClXZefmWT
 qiXpEVUlbRWUt5ILeBuW8jir3Q3AxY4PaxwU91nuVG9Ir+xrZqeEPdKpTP47yAcV442d
 wfKswlQHhOgHaTNjBQAgBnlKozv8mNlPcQOzxcrJImG6Pdm9XkfD+YETrSm2ZtEIdO2P
 JIbg==
X-Gm-Message-State: AOAM532K5npSv5WGj1jMF/peY4XACve6yEnd/uI4eqHNWhr3KHlNvdxp
 PZToOIPa1aZUJQUvuezmZIyEGw==
X-Google-Smtp-Source: ABdhPJxwpUGL6nV/KCkziemA/hcDVU4qNsHEdRjJemZDgp/BZX5cEzeMtnlnNK5ASnJ47H9QKgTzAw==
X-Received: by 2002:a2e:7c17:0:b0:249:8221:4c2a with SMTP id
 x23-20020a2e7c17000000b0024982214c2amr8399691ljc.293.1648675781946; 
 Wed, 30 Mar 2022 14:29:41 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:41 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 17/45] block: drop bdrv_remove_filter_or_cow_child
Date: Thu, 31 Mar 2022 00:28:34 +0300
Message-Id: <20220330212902.590099-18-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lj1-x22f.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Mar 2022 19:17:24 -0400
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

Drop this simple wrapper used only in one place. We have too many graph
modifying functions even without it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 block.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/block.c b/block.c
index 34e89b277f..656e596e0c 100644
--- a/block.c
+++ b/block.c
@@ -93,8 +93,6 @@ static bool bdrv_recurse_has_child(BlockDriverState *bs,
 static void bdrv_replace_child_noperm(BdrvChild *child,
                                       BlockDriverState *new_bs);
 static void bdrv_remove_child(BdrvChild *child, Transaction *tran);
-static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
-                                            Transaction *tran);
 
 static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
                                BlockReopenQueue *queue,
@@ -5047,17 +5045,6 @@ static void bdrv_remove_child(BdrvChild *child, Transaction *tran)
     tran_add(tran, &bdrv_remove_child_drv, child);
 }
 
-/*
- * A function to remove backing-chain child of @bs if exists: cow child for
- * format nodes (always .backing) and filter child for filters (may be .file or
- * .backing)
- */
-static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
-                                            Transaction *tran)
-{
-    bdrv_remove_child(bdrv_filter_or_cow_child(bs), tran);
-}
-
 static int bdrv_replace_node_noperm(BlockDriverState *from,
                                     BlockDriverState *to,
                                     bool auto_skip, Transaction *tran,
@@ -5142,7 +5129,7 @@ static int bdrv_replace_node_common(BlockDriverState *from,
     }
 
     if (detach_subchain) {
-        bdrv_remove_filter_or_cow_child(to_cow_parent, tran);
+        bdrv_remove_child(bdrv_filter_or_cow_child(to_cow_parent), tran);
     }
 
     found = g_hash_table_new(NULL, NULL);
-- 
2.35.1


