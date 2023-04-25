Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBCB6EE6D9
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 19:35:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prMWq-0006u2-QP; Tue, 25 Apr 2023 13:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prMWS-0006YJ-FD
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 13:32:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prMWP-0004BR-N9
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 13:32:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682443928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S/Vel28DfK+RmigOU99DCQcyfij0nT8/YzNJnd1fy7I=;
 b=Rtnvk2HT1WqeXUywVeQ0i27t+bJirvxrqzghD9FaN+BUw5rY/u/vvdxR9bYE2m8XmOEz3a
 0MYLhhWebupLIHDMwlINkaizM8eNrLwJ3D07HqjyjNGin+a0qN7heOhycy0zEz5vs900og
 rodb+gH26n1BY7Sgeo6SQqVZykoe360=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-9xN82MV8M9WuHAkBIjVVLA-1; Tue, 25 Apr 2023 13:32:07 -0400
X-MC-Unique: 9xN82MV8M9WuHAkBIjVVLA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E63D828082A3;
 Tue, 25 Apr 2023 17:32:06 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF1B8492B03;
 Tue, 25 Apr 2023 17:32:05 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 eesposit@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 02/20] block: Consistently call bdrv_activate() outside
 coroutine
Date: Tue, 25 Apr 2023 19:31:40 +0200
Message-Id: <20230425173158.574203-3-kwolf@redhat.com>
In-Reply-To: <20230425173158.574203-1-kwolf@redhat.com>
References: <20230425173158.574203-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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
2.40.0


