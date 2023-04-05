Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 839E06D79C3
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 12:34:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk0RI-0000zk-S8; Wed, 05 Apr 2023 06:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pk0RG-0000zO-OB
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:32:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pk0RF-0007US-44
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:32:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680690744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C3/yLuMDLEQfKKDnIdznpsuaR1dlmr0vVoCd8UJaffQ=;
 b=R9YfwDi0NzO9uo7e1NL/zU67qpYFUXr/UEflcctPbAb28QAaRkh9Ak6NKWEYcZ0L3x+O+9
 v6/eh2QLtlQDby+dQGSblCBC1R151chppsWWd7NDgl5KdPtBq3G7iWxpMjsDgohcVchbx4
 sWeIYu/ime3sfYh3+XFXiAScvNwC8bQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-303-O_V_mvuFNh2Z9udNI8t2cw-1; Wed, 05 Apr 2023 06:32:22 -0400
X-MC-Unique: O_V_mvuFNh2Z9udNI8t2cw-1
Received: by mail-ed1-f69.google.com with SMTP id
 v1-20020a50d581000000b0050291cda08aso16012577edi.15
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 03:32:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680690741; x=1683282741;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C3/yLuMDLEQfKKDnIdznpsuaR1dlmr0vVoCd8UJaffQ=;
 b=7uPMnBB8dd4ltu8OIyJxZDVC2qhfELSg6HgtT/o7g6w499GP9yoYtI8AOChvrrhFFK
 eE7WG1YTXXKZVpYU8UZanjm+96DGQlkJM2TX2lHPnYS32sipUChkP1n7STxpssTr5HRE
 D7QyzuEJBQfSSa/n6jgnCo/04VdF87l4oO5hvEInXq/DlhiI6X0nsqjxhW2bXzGULYmH
 43IiXGYUkDTDlDfqJcJFlHCFaYEUqkvCcWQ/ojkjPjjutwvkSZU81rTFiIui3YopJeOp
 PcZRUKpQl5ECzG8fyswxVZJUff6B4WKGaqfk3o78Q6oW6SEYWzdVbLU7wEJcmzc8Qoyi
 x68A==
X-Gm-Message-State: AAQBX9fTvCMy7tBDtzQ2rRjnS/YurUB3c50/xZ2xvWbQwC+yyYHw1SsV
 enQVSIr0LHel4/pBnVW8Ncrd6yr125i84bDxxQzOLQXy+LenRaNN5/tulHnnW+lqDy8dlzm6Rsa
 j+MKPDX4nNBeMtf+N43eYkBKlX6WASR/+mEvAOkviheMgEveJyIyEUMgA5+dxl7LoojlZEjfJlW
 w=
X-Received: by 2002:a17:906:9441:b0:92b:7e6a:bca0 with SMTP id
 z1-20020a170906944100b0092b7e6abca0mr2545662ejx.14.1680690741314; 
 Wed, 05 Apr 2023 03:32:21 -0700 (PDT)
X-Google-Smtp-Source: AKy350bjUEdH5DRouKJ+lA/UPftTwxyAFDa/4a6cLs7lbzWkKsb7MojtR0RgeLyfmr26Ig4jf+yJ9g==
X-Received: by 2002:a17:906:9441:b0:92b:7e6a:bca0 with SMTP id
 z1-20020a170906944100b0092b7e6abca0mr2545647ejx.14.1680690740994; 
 Wed, 05 Apr 2023 03:32:20 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a17090665c900b0093fa8c2e877sm7108168ejn.80.2023.04.05.03.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 03:32:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org
Subject: [PATCH 2/4] block: complete public block status API
Date: Wed,  5 Apr 2023 12:32:14 +0200
Message-Id: <20230405103216.128103-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405103216.128103-1-pbonzini@redhat.com>
References: <20230405103216.128103-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Include both coroutine and non-coroutine versions, the latter being
co_wrapper_mixed_bdrv_rdlock of the former.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/io.c               | 18 +++++-------------
 include/block/block-io.h | 18 ++++++++++++------
 2 files changed, 17 insertions(+), 19 deletions(-)

diff --git a/block/io.c b/block/io.c
index e86090b7692b..0aad0f57d8c7 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2570,21 +2570,13 @@ int coroutine_fn bdrv_co_block_status_above(BlockDriverState *bs,
                                              bytes, pnum, map, file, NULL);
 }
 
-int bdrv_block_status_above(BlockDriverState *bs, BlockDriverState *base,
-                            int64_t offset, int64_t bytes, int64_t *pnum,
-                            int64_t *map, BlockDriverState **file)
+int coroutine_fn bdrv_co_block_status(BlockDriverState *bs, int64_t offset,
+                                      int64_t bytes, int64_t *pnum,
+                                      int64_t *map, BlockDriverState **file)
 {
     IO_CODE();
-    return bdrv_common_block_status_above(bs, base, false, true, offset, bytes,
-                                          pnum, map, file, NULL);
-}
-
-int bdrv_block_status(BlockDriverState *bs, int64_t offset, int64_t bytes,
-                      int64_t *pnum, int64_t *map, BlockDriverState **file)
-{
-    IO_CODE();
-    return bdrv_block_status_above(bs, bdrv_filter_or_cow_bs(bs),
-                                   offset, bytes, pnum, map, file);
+    return bdrv_co_block_status_above(bs, bdrv_filter_or_cow_bs(bs),
+                                      offset, bytes, pnum, map, file);
 }
 
 /*
diff --git a/include/block/block-io.h b/include/block/block-io.h
index 5da99d4d60ff..0947f83d9ac7 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -113,17 +113,23 @@ int coroutine_fn GRAPH_RDLOCK bdrv_co_pdiscard(BdrvChild *child, int64_t offset,
                                                int64_t bytes);
 
 bool bdrv_can_write_zeroes_with_unmap(BlockDriverState *bs);
-int bdrv_block_status(BlockDriverState *bs, int64_t offset,
-                      int64_t bytes, int64_t *pnum, int64_t *map,
-                      BlockDriverState **file);
+
+int coroutine_fn GRAPH_RDLOCK
+bdrv_co_block_status(BlockDriverState *bs, int64_t offset,
+                     int64_t bytes, int64_t *pnum,
+                     int64_t *map, BlockDriverState **file);
+int co_wrapper_mixed_bdrv_rdlock bdrv_block_status(BlockDriverState *bs, int64_t offset,
+                                                   int64_t bytes, int64_t *pnum,
+                                                   int64_t *map, BlockDriverState **file);
 
 int coroutine_fn GRAPH_RDLOCK
 bdrv_co_block_status_above(BlockDriverState *bs, BlockDriverState *base,
                            int64_t offset, int64_t bytes, int64_t *pnum,
                            int64_t *map, BlockDriverState **file);
-int bdrv_block_status_above(BlockDriverState *bs, BlockDriverState *base,
-                            int64_t offset, int64_t bytes, int64_t *pnum,
-                            int64_t *map, BlockDriverState **file);
+int co_wrapper_mixed_bdrv_rdlock
+bdrv_block_status_above(BlockDriverState *bs, BlockDriverState *base,
+                        int64_t offset, int64_t bytes, int64_t *pnum,
+                        int64_t *map, BlockDriverState **file);
 
 int coroutine_fn GRAPH_RDLOCK
 bdrv_co_is_allocated(BlockDriverState *bs, int64_t offset, int64_t bytes,
-- 
2.39.2


