Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 987FA4ED032
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:33:24 +0200 (CEST)
Received: from localhost ([::1]:59498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZhoZ-0001AT-LC
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:33:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfsy-000885-Oa
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:48 -0400
Received: from [2a00:1450:4864:20::234] (port=33416
 helo=mail-lj1-x234.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfsw-0003HA-3J
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:48 -0400
Received: by mail-lj1-x234.google.com with SMTP id u3so29518337ljd.0
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3XIynKxv/8mf0mXqZqalwzWUhAmUjNLdugZbjT63J/0=;
 b=ZAYs33CEL/VzW4iNyekiSF6oISFYdvEwKiZI1YCFifAIsO7xTv6+0qhxJY/TZqti3n
 S4z+CMzM/E9Y1BVzebwa2WuxHqkydoGHWWwzMl7qp/CavM3U5Yv7Eka+fWVWjxIANP+C
 +oW1stRazK+6KDQsN64gczjJWcguP1lEf30HeV0fVm9xa3qvw68RTgYLnLY8B8vOSH1u
 0fJWAE8rvQvccvbbBi4P6EcPDXo3Y83mRjAIY9UpuQ4gOUngHxbDcvi64A8HYFTtKX+p
 k+dfv6Jhs3yxZrJAQshRn7fbVUDgbMh8ZPmRu244u/rQQ/e6zozzW8Et0fwziTXtS7XF
 XH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3XIynKxv/8mf0mXqZqalwzWUhAmUjNLdugZbjT63J/0=;
 b=VFbth0c3YJdAlXNduCYKHyhemc+Lc7VC93+mFEXMjj43UjZercmF3svTGWLsOmLNvQ
 7fGdxAm0+N4BAEUpb4NXYd2I5ud4acifHQR/ryRwFLL7r0yEAQdfqGCsRJYU5c5SpEkN
 8Kp0v3k2h4/iqbT1gqODqh6vP+FynVHgaCGqDOffT5dwW8tlAJke7/+5Gjk2oXLy8Ppx
 rkF6aJiCQ6yF4XhG8A/aRG4GlzfvBUNjLSlYv9QBmBXQuyGu7tHgE+xMibUjQqiEh71b
 /oWQEobZz4+pBIzae/NaLAvlY2lodHy8AiCfy0d4P+8idOW6M95b6URDXgOvdubUUzA2
 gPSw==
X-Gm-Message-State: AOAM532lmpH6Ub10h7DKUurA+JtoAUQhUeaAQkE/C909+41AuQpG78Ot
 b9MboR8xE872Uyw3icxsTl4X3w==
X-Google-Smtp-Source: ABdhPJyO8r5HGBB2LFr7Zu19Qa+Yl5xvWY5NNTxasx6M5Nia7QV7ms1U8nIeqzXunnlTR1ME/YoqUw==
X-Received: by 2002:a2e:7f13:0:b0:247:ef72:9e8b with SMTP id
 a19-20020a2e7f13000000b00247ef729e8bmr8375799ljd.205.1648675784369; 
 Wed, 30 Mar 2022 14:29:44 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:44 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 21/45] block: add bdrv_try_set_aio_context_tran transaction
 action
Date: Thu, 31 Mar 2022 00:28:38 +0300
Message-Id: <20220330212902.590099-22-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::234
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lj1-x234.google.com
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

To be used in further commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 block.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/block.c b/block.c
index be19964f89..1900cdf277 100644
--- a/block.c
+++ b/block.c
@@ -2907,6 +2907,54 @@ static void bdrv_child_free(BdrvChild *child)
     g_free(child);
 }
 
+typedef struct BdrvTrySetAioContextState {
+    BlockDriverState *bs;
+    AioContext *old_ctx;
+} BdrvTrySetAioContextState;
+
+static void bdrv_try_set_aio_context_abort(void *opaque)
+{
+    BdrvTrySetAioContextState *s = opaque;
+
+    if (bdrv_get_aio_context(s->bs) != s->old_ctx) {
+        bdrv_try_set_aio_context(s->bs, s->old_ctx, &error_abort);
+    }
+}
+
+static TransactionActionDrv bdrv_try_set_aio_context_drv = {
+    .abort = bdrv_try_set_aio_context_abort,
+    .clean = g_free,
+};
+
+__attribute__((unused))
+static int bdrv_try_set_aio_context_tran(BlockDriverState *bs,
+                                         AioContext *new_ctx,
+                                         Transaction *tran,
+                                         Error **errp)
+{
+    AioContext *old_ctx = bdrv_get_aio_context(bs);
+    BdrvTrySetAioContextState *s;
+    int ret;
+
+    if (old_ctx == new_ctx) {
+        return 0;
+    }
+
+    ret = bdrv_try_set_aio_context(bs, new_ctx, errp);
+    if (ret < 0) {
+        return ret;
+    }
+
+    s = g_new(BdrvTrySetAioContextState, 1);
+    *s = (BdrvTrySetAioContextState) {
+        .bs = bs,
+        .old_ctx = old_ctx,
+    };
+    tran_add(tran, &bdrv_try_set_aio_context_drv, s);
+
+    return 0;
+}
+
 typedef struct BdrvAttachChildCommonState {
     BdrvChild *child;
     AioContext *old_parent_ctx;
-- 
2.35.1


