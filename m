Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB4B6FE535
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 22:38:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwqY5-0005DB-3V; Wed, 10 May 2023 16:36:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwqY2-0005AL-7I
 for qemu-devel@nongnu.org; Wed, 10 May 2023 16:36:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwqY0-0003K1-NI
 for qemu-devel@nongnu.org; Wed, 10 May 2023 16:36:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683750988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yD72QprueAbSuOWgAgRWxGGjAq16e84Rapg38+Z4Z9g=;
 b=bETM0KMpmzVo6VU7kKFbKFFv8SB0tp0wUTr0d7TFej0UxY7c3L7z+u1PqnfM5pCtOpTzPm
 s1DcidBlPX6IWygTAonCwAHRjPem7oxoTcw+0CTXuRvr5G5JCHu1AxCRnm9tu66CH48q5i
 xh2Xqjab127ibE+K5AW9vtDBWENhZiU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-1rq3FXV4NSSEq79QdghG2A-1; Wed, 10 May 2023 16:36:24 -0400
X-MC-Unique: 1rq3FXV4NSSEq79QdghG2A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E90880067D;
 Wed, 10 May 2023 20:36:24 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E13431121314;
 Wed, 10 May 2023 20:36:22 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, stefanha@redhat.com,
 f.ebner@proxmox.com, qemu-devel@nongnu.org
Subject: [PATCH 2/8] block/export: Fix null pointer dereference in error path
Date: Wed, 10 May 2023 22:35:55 +0200
Message-Id: <20230510203601.418015-3-kwolf@redhat.com>
In-Reply-To: <20230510203601.418015-1-kwolf@redhat.com>
References: <20230510203601.418015-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

There are some error paths in blk_exp_add() that jump to 'fail:' before
'exp' is even created. So we can't just unconditionally access exp->blk.

Add a NULL check, and switch from exp->blk to blk, which is available
earlier, just to be extra sure that we really cover all cases where
BlockDevOps could have been set for it (in practice, this only happens
in drv->create() today, so this part of the change isn't strictly
necessary).

Fixes: de79b52604e43fdeba6cee4f5af600b62169f2d2
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/export/export.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/block/export/export.c b/block/export/export.c
index 62c7c22d45..a5c8f42f53 100644
--- a/block/export/export.c
+++ b/block/export/export.c
@@ -192,8 +192,10 @@ BlockExport *blk_exp_add(BlockExportOptions *export, Error **errp)
     return exp;
 
 fail:
-    blk_set_dev_ops(exp->blk, NULL, NULL);
-    blk_unref(blk);
+    if (blk) {
+        blk_set_dev_ops(blk, NULL, NULL);
+        blk_unref(blk);
+    }
     aio_context_release(ctx);
     if (exp) {
         g_free(exp->id);
-- 
2.40.1


