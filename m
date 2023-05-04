Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA23F6F6A90
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 13:58:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puXb7-00035d-79; Thu, 04 May 2023 07:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1puXb3-000350-Py
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:58:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1puXb1-0004AQ-L5
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:58:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683201482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DZ40R9KYF+tmfGUBQSPEbZGpA9hUo09OFYdPhnW4g0g=;
 b=W839XwxZT2aa9WEbJcQyWHD7mwK3hOpXGnsQQvQ+MOh9q8OtdQVk4mjhTbdgrgYY/zB4MP
 roBhKVqoAPJXYxsHLim8O/m4rTF8Yi0/nk+OF2+yOYhcDfBYnwceQ1+AavXkzRu9np4GSP
 VLthmR15/p9WtGHMy71+vw52Kk/Mcns=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-ACuR8iYTOsOqlCxEOOHdjw-1; Thu, 04 May 2023 07:58:01 -0400
X-MC-Unique: ACuR8iYTOsOqlCxEOOHdjw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C5F1109DCEC;
 Thu,  4 May 2023 11:58:01 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 495F4C15BAD;
 Thu,  4 May 2023 11:58:00 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, stefanha@redhat.com, eblake@redhat.com,
 eesposit@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v2 02/20] block: Consistently call bdrv_activate() outside
 coroutine
Date: Thu,  4 May 2023 13:57:32 +0200
Message-Id: <20230504115750.54437-3-kwolf@redhat.com>
In-Reply-To: <20230504115750.54437-1-kwolf@redhat.com>
References: <20230504115750.54437-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Migration code can call bdrv_activate() in coroutine context, whereas
other callers call it outside of coroutines. As it calls other code that
is not supposed to run in coroutines, standardise on running outside of
coroutines.

This adds a no_co_wrapper to switch to the main loop before calling
bdrv_activate().

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/block/block-global-state.h |  6 +++++-
 block/block-backend.c              | 10 +++++++++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
index 399200a9a3..2c312cc774 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -166,7 +166,11 @@ int bdrv_amend_options(BlockDriverState *bs_new, QemuOpts *opts,
 BlockDriverState *check_to_replace_node(BlockDriverState *parent_bs,
                                         const char *node_name, Error **errp);
 
-int bdrv_activate(BlockDriverState *bs, Error **errp);
+int no_coroutine_fn bdrv_activate(BlockDriverState *bs, Error **errp);
+
+int coroutine_fn no_co_wrapper
+bdrv_co_activate(BlockDriverState *bs, Error **errp);
+
 void bdrv_activate_all(Error **errp);
 int bdrv_inactivate_all(void);
 
diff --git a/block/block-backend.c b/block/block-backend.c
index fc530ded6a..e37d55d3e9 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2024,7 +2024,15 @@ void blk_activate(BlockBackend *blk, Error **errp)
         return;
     }
 
-    bdrv_activate(bs, errp);
+    /*
+     * Migration code can call this function in coroutine context, so leave
+     * coroutine context if necessary.
+     */
+    if (qemu_in_coroutine()) {
+        bdrv_co_activate(bs, errp);
+    } else {
+        bdrv_activate(bs, errp);
+    }
 }
 
 bool coroutine_fn blk_co_is_inserted(BlockBackend *blk)
-- 
2.40.1


