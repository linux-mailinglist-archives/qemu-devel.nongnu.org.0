Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A508C64CBFA
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 15:18:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5S5g-0005U7-Vs; Wed, 14 Dec 2022 08:46:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S4u-0004Sj-Ar
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S4s-0003cw-9l
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671025541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GRpePPcBM6UELvi6Bq6TVlUUb9qZ2XivivylGU6tlCQ=;
 b=YlYS3Wj7eiIpAcNX5A9l6wRh/3YJf8wjlJ4AYngMRiEMd4ENfLARXZVbhnY3NxNk2AiWaj
 CvGHpymEIQ5eqUSX8ijGc+XNw3DtvrgEm6dhMkYGYgG2jF6V6FwjQcQSElsgrtsV+BEbxK
 /R29fwj9Pw5GytRXpUG8P11zrJciQIM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-J9r25WnHNbe05wIS8TclyA-1; Wed, 14 Dec 2022 08:45:38 -0500
X-MC-Unique: J9r25WnHNbe05wIS8TclyA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 60D18811E6E;
 Wed, 14 Dec 2022 13:45:38 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9ED4D14171BE;
 Wed, 14 Dec 2022 13:45:37 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 30/51] block-coroutine-wrapper.py: support functions without bs
 arg
Date: Wed, 14 Dec 2022 14:44:32 +0100
Message-Id: <20221214134453.31665-31-kwolf@redhat.com>
In-Reply-To: <20221214134453.31665-1-kwolf@redhat.com>
References: <20221214134453.31665-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Right now, we take the first parameter of the function to get the
BlockDriverState to pass to bdrv_poll_co(), that internally calls
functions that figure in which aiocontext the coroutine should run.

However, it is useless to pass a bs just to get its own AioContext,
so instead pass it directly, and default to the main loop if no
BlockDriverState is passed as parameter.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Message-Id: <20221128142337.657646-12-eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/block-gen.h                  |  6 +++---
 scripts/block-coroutine-wrapper.py | 16 ++++++++--------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/block/block-gen.h b/block/block-gen.h
index f80cf4897d..08d977f493 100644
--- a/block/block-gen.h
+++ b/block/block-gen.h
@@ -30,7 +30,7 @@
 
 /* Base structure for argument packing structures */
 typedef struct BdrvPollCo {
-    BlockDriverState *bs;
+    AioContext *ctx;
     bool in_progress;
     int ret;
     Coroutine *co; /* Keep pointer here for debugging */
@@ -40,8 +40,8 @@ static inline int bdrv_poll_co(BdrvPollCo *s)
 {
     assert(!qemu_in_coroutine());
 
-    bdrv_coroutine_enter(s->bs, s->co);
-    BDRV_POLL_WHILE(s->bs, s->in_progress);
+    aio_co_enter(s->ctx, s->co);
+    AIO_WAIT_WHILE(s->ctx, s->in_progress);
 
     return s->ret;
 }
diff --git a/scripts/block-coroutine-wrapper.py b/scripts/block-coroutine-wrapper.py
index 2090c3bf73..f540003af1 100644
--- a/scripts/block-coroutine-wrapper.py
+++ b/scripts/block-coroutine-wrapper.py
@@ -75,12 +75,14 @@ def __init__(self, return_type: str, name: str, args: str,
 
         t = self.args[0].type
         if t == 'BlockDriverState *':
-            bs = 'bs'
+            ctx = 'bdrv_get_aio_context(bs)'
         elif t == 'BdrvChild *':
-            bs = 'child->bs'
+            ctx = 'bdrv_get_aio_context(child->bs)'
+        elif t == 'BlockBackend *':
+            ctx = 'blk_get_aio_context(blk)'
         else:
-            bs = 'blk_bs(blk)'
-        self.bs = bs
+            ctx = 'qemu_get_aio_context()'
+        self.ctx = ctx
 
     def gen_list(self, format: str) -> str:
         return ', '.join(format.format_map(arg.__dict__) for arg in self.args)
@@ -127,7 +129,7 @@ def create_mixed_wrapper(func: FuncDecl) -> str:
         return {name}({ func.gen_list('{name}') });
     }} else {{
         {struct_name} s = {{
-            .poll_state.bs = {func.bs},
+            .poll_state.ctx = {func.ctx},
             .poll_state.in_progress = true,
 
 { func.gen_block('            .{name} = {name},') }
@@ -150,7 +152,7 @@ def create_co_wrapper(func: FuncDecl) -> str:
 int {func.name}({ func.gen_list('{decl}') })
 {{
     {struct_name} s = {{
-        .poll_state.bs = {func.bs},
+        .poll_state.ctx = {func.ctx},
         .poll_state.in_progress = true,
 
 { func.gen_block('        .{name} = {name},') }
@@ -166,8 +168,6 @@ def create_co_wrapper(func: FuncDecl) -> str:
 def gen_wrapper(func: FuncDecl) -> str:
     assert not '_co_' in func.name
     assert func.return_type == 'int'
-    assert func.args[0].type in ['BlockDriverState *', 'BdrvChild *',
-                                 'BlockBackend *']
 
     name = func.co_name
     struct_name = func.struct_name
-- 
2.38.1


