Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DA8638B6B
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 14:40:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyYry-0006eE-VY; Fri, 25 Nov 2022 08:35:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oyYrj-0006Vo-CL
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 08:35:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oyYrb-0005Fv-GR
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 08:35:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669383330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t+hQkeuLxQUOF8Q06z5BuHlnGeJ/4tW/v4aWPQuK2i0=;
 b=Pm0IaIDqponUH23hlsb8o35bA5MkwSweCHovDNRrMJ4MlyJgik36TjFXhfxj6eP5XuzQrw
 81/YvuGdGEyQb/aozjbqwTiXkHCbpcxYFHX71O64arLQtjhUYwUKd7mnE73PD2AQ7Tn0Wm
 P0H9QsLVeyFAI9Lx0RNfzb1iaNsqsnk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-gZtQnU7KPFmZX8rLMLAaYw-1; Fri, 25 Nov 2022 08:35:27 -0500
X-MC-Unique: gZtQnU7KPFmZX8rLMLAaYw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43FC51C0690A;
 Fri, 25 Nov 2022 13:35:26 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D48772166B46;
 Fri, 25 Nov 2022 13:35:25 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Stefan Weil <sw@weilnetz.de>, Jeff Cody <codyprime@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v6 11/14] block-coroutine-wrapper.py: default to main loop
 aiocontext if function does not have a BlockDriverState parameter
Date: Fri, 25 Nov 2022 08:35:15 -0500
Message-Id: <20221125133518.418328-12-eesposit@redhat.com>
In-Reply-To: <20221125133518.418328-1-eesposit@redhat.com>
References: <20221125133518.418328-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Right now, we take the first parameter of the function to get the
BlockDriverState to pass to bdrv_poll_co(), that internally calls
functions that figure in which aiocontext the coroutine should run.

However, it is useless to pass a bs just to get its own AioContext,
so instead pass it directly, and default to the main loop if no
BlockDriverState is passed as parameter.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
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
index 7972d3fe01..61a718ea2f 100644
--- a/scripts/block-coroutine-wrapper.py
+++ b/scripts/block-coroutine-wrapper.py
@@ -78,12 +78,14 @@ def __init__(self, return_type: str, name: str, args: str,
 
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
@@ -128,7 +130,7 @@ def create_g_c_w(func: FuncDecl) -> str:
         return {name}({ func.gen_list('{name}') });
     }} else {{
         {struct_name} s = {{
-            .poll_state.bs = {func.bs},
+            .poll_state.ctx = {func.ctx},
             .poll_state.in_progress = true,
 
 { func.gen_block('            .{name} = {name},') }
@@ -149,7 +151,7 @@ def create_coroutine_only(func: FuncDecl) -> str:
 int {func.name}({ func.gen_list('{decl}') })
 {{
     {struct_name} s = {{
-        .poll_state.bs = {func.bs},
+        .poll_state.ctx = {func.ctx},
         .poll_state.in_progress = true,
 
 { func.gen_block('        .{name} = {name},') }
@@ -165,8 +167,6 @@ def create_coroutine_only(func: FuncDecl) -> str:
 def gen_wrapper(func: FuncDecl) -> str:
     assert not '_co_' in func.name
     assert func.return_type == 'int'
-    assert func.args[0].type in ['BlockDriverState *', 'BdrvChild *',
-                                 'BlockBackend *']
 
     name = func.co_name
     struct_name = func.struct_name
-- 
2.31.1


