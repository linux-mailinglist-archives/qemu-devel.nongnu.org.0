Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC77635C0A
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 12:45:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxo9P-0002k5-8f; Wed, 23 Nov 2022 06:42:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oxo9K-0002fD-32
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 06:42:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oxo9H-00062j-7V
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 06:42:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669203758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qg1AfiVQHMLY+W1I1RCph7j0ry0ub4rDQI+Zj7Ee75U=;
 b=d8iB4prF3LBtQIHAkk0fuYsWQaFrtw+otc7tQqGcyYKiOrptjjgnbv0DHT5Jvn4O/7rETj
 hP7YQvJ2Gi1w3qDmb9m2BvYId+HaMMmsly7bT0GYdNwNf+7I6j4Vb3d959x7rUcR5whJnS
 7jdLtt1pcF+rAMwIKZ6JW82r7/xBcqA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-Yac0smRmO0eZnB8xuZNsIQ-1; Wed, 23 Nov 2022 06:42:35 -0500
X-MC-Unique: Yac0smRmO0eZnB8xuZNsIQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4D391C05EA6;
 Wed, 23 Nov 2022 11:42:34 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6DF92C2C8C5;
 Wed, 23 Nov 2022 11:42:34 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Stefan Weil <sw@weilnetz.de>, Jeff Cody <codyprime@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v5 12/15] block-coroutine-wrapper.py: default to main loop
 aiocontext if function does not have a BlockDriverState parameter
Date: Wed, 23 Nov 2022 06:42:24 -0500
Message-Id: <20221123114227.85757-13-eesposit@redhat.com>
In-Reply-To: <20221123114227.85757-1-eesposit@redhat.com>
References: <20221123114227.85757-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
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

Right now, we take the first parameter of the function to get the
BlockDriverState to pass to bdrv_poll_co(), that internally calls
functions that figure in which aiocontext the coroutine should run.

However, it is useless to pass a bs just to get its own AioContext,
so instead pass it directly, and default to the main loop if no
BlockDriverState is passed as parameter.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/block-gen.h                  |  6 +++---
 scripts/block-coroutine-wrapper.py | 14 +++++++-------
 2 files changed, 10 insertions(+), 10 deletions(-)

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
index 7e8f2da84b..1d552cb734 100644
--- a/scripts/block-coroutine-wrapper.py
+++ b/scripts/block-coroutine-wrapper.py
@@ -78,14 +78,14 @@ def __init__(self, return_type: str, name: str, args: str,
 
         t = self.args[0].type
         if t == 'BlockDriverState *':
-            bs = 'bs'
+            ctx = 'bdrv_get_aio_context(bs)'
         elif t == 'BdrvChild *':
-            bs = 'child->bs'
+            ctx = 'bdrv_get_aio_context(child->bs)'
         elif t == 'BlockBackend *':
-            bs = 'blk_bs(blk)'
+            ctx = 'bdrv_get_aio_context(blk_bs(blk))'
         else:
-            bs = 'NULL'
-        self.bs = bs
+            ctx = 'qemu_get_aio_context()'
+        self.ctx = ctx
 
     def gen_list(self, format: str) -> str:
         return ', '.join(format.format_map(arg.__dict__) for arg in self.args)
@@ -130,7 +130,7 @@ def create_g_c_w(func: FuncDecl) -> str:
         return {name}({ func.gen_list('{name}') });
     }} else {{
         {struct_name} s = {{
-            .poll_state.bs = {func.bs},
+            .poll_state.ctx = {func.ctx},
             .poll_state.in_progress = true,
 
 { func.gen_block('            .{name} = {name},') }
@@ -151,7 +151,7 @@ def create_coroutine_only(func: FuncDecl) -> str:
 int {func.name}({ func.gen_list('{decl}') })
 {{
     {struct_name} s = {{
-        .poll_state.bs = {func.bs},
+        .poll_state.ctx = {func.ctx},
         .poll_state.in_progress = true,
 
 { func.gen_block('        .{name} = {name},') }
-- 
2.31.1


