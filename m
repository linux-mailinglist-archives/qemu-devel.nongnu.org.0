Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6229B64CC10
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 15:22:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5S5i-0005XM-L1; Wed, 14 Dec 2022 08:46:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S4z-0004ZT-La
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S4t-0003dg-FE
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671025542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E4R4Pii63G9lZQkIUnaIRX0M/a/vJGfjpFW35CkUJ+8=;
 b=F02q3AofaG7FfQ1YnmboVyurSVuIbPHlqNNS6Yfp2G4zYhoHU2AyMAu9wHTijFx+qq4Cet
 W/4xTMcop4zDXc/ddQyAHjJr1xQrqTQ0DgbpYh+RORR/8ovYgdt/XuyqO/aApkVwzDaa3A
 9V0iLFe4zCgDKRv4Sy9QBNC+NUCLdGo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-599-XZqF_1VWOqiB9TGGzN6mnw-1; Wed, 14 Dec 2022 08:45:39 -0500
X-MC-Unique: XZqF_1VWOqiB9TGGzN6mnw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5BA952A59575;
 Wed, 14 Dec 2022 13:45:39 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9AC0214171BE;
 Wed, 14 Dec 2022 13:45:38 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 31/51] block-coroutine-wrapper.py: support also basic return
 types
Date: Wed, 14 Dec 2022 14:44:33 +0100
Message-Id: <20221214134453.31665-32-kwolf@redhat.com>
In-Reply-To: <20221214134453.31665-1-kwolf@redhat.com>
References: <20221214134453.31665-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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

Extend the regex to cover also return type, pointers included.
This implies that the value returned by the function cannot be
a simple "int" anymore, but the custom return type.
Therefore remove poll_state->ret and instead use a per-function
custom "ret" field.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Message-Id: <20221128142337.657646-13-eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/block-gen.h                  |  5 +----
 scripts/block-coroutine-wrapper.py | 19 +++++++++++--------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/block/block-gen.h b/block/block-gen.h
index 08d977f493..89b7daaa1f 100644
--- a/block/block-gen.h
+++ b/block/block-gen.h
@@ -32,18 +32,15 @@
 typedef struct BdrvPollCo {
     AioContext *ctx;
     bool in_progress;
-    int ret;
     Coroutine *co; /* Keep pointer here for debugging */
 } BdrvPollCo;
 
-static inline int bdrv_poll_co(BdrvPollCo *s)
+static inline void bdrv_poll_co(BdrvPollCo *s)
 {
     assert(!qemu_in_coroutine());
 
     aio_co_enter(s->ctx, s->co);
     AIO_WAIT_WHILE(s->ctx, s->in_progress);
-
-    return s->ret;
 }
 
 #endif /* BLOCK_BLOCK_GEN_H */
diff --git a/scripts/block-coroutine-wrapper.py b/scripts/block-coroutine-wrapper.py
index f540003af1..71a06e917a 100644
--- a/scripts/block-coroutine-wrapper.py
+++ b/scripts/block-coroutine-wrapper.py
@@ -92,7 +92,8 @@ def gen_block(self, format: str) -> str:
 
 
 # Match wrappers declared with a co_wrapper mark
-func_decl_re = re.compile(r'^int\s*co_wrapper'
+func_decl_re = re.compile(r'^(?P<return_type>[a-zA-Z][a-zA-Z0-9_]* [\*]?)'
+                          r'\s*co_wrapper'
                           r'(?P<variant>(_[a-z][a-z0-9_]*)?)\s*'
                           r'(?P<wrapper_name>[a-z][a-z0-9_]*)'
                           r'\((?P<args>[^)]*)\);$', re.MULTILINE)
@@ -100,7 +101,7 @@ def gen_block(self, format: str) -> str:
 
 def func_decl_iter(text: str) -> Iterator:
     for m in func_decl_re.finditer(text):
-        yield FuncDecl(return_type='int',
+        yield FuncDecl(return_type=m.group('return_type'),
                        name=m.group('wrapper_name'),
                        args=m.group('args'),
                        variant=m.group('variant'))
@@ -123,7 +124,7 @@ def create_mixed_wrapper(func: FuncDecl) -> str:
     name = func.co_name
     struct_name = func.struct_name
     return f"""\
-int {func.name}({ func.gen_list('{decl}') })
+{func.return_type} {func.name}({ func.gen_list('{decl}') })
 {{
     if (qemu_in_coroutine()) {{
         return {name}({ func.gen_list('{name}') });
@@ -137,7 +138,8 @@ def create_mixed_wrapper(func: FuncDecl) -> str:
 
         s.poll_state.co = qemu_coroutine_create({name}_entry, &s);
 
-        return bdrv_poll_co(&s.poll_state);
+        bdrv_poll_co(&s.poll_state);
+        return s.ret;
     }}
 }}"""
 
@@ -149,7 +151,7 @@ def create_co_wrapper(func: FuncDecl) -> str:
     name = func.co_name
     struct_name = func.struct_name
     return f"""\
-int {func.name}({ func.gen_list('{decl}') })
+{func.return_type} {func.name}({ func.gen_list('{decl}') })
 {{
     {struct_name} s = {{
         .poll_state.ctx = {func.ctx},
@@ -161,13 +163,13 @@ def create_co_wrapper(func: FuncDecl) -> str:
 
     s.poll_state.co = qemu_coroutine_create({name}_entry, &s);
 
-    return bdrv_poll_co(&s.poll_state);
+    bdrv_poll_co(&s.poll_state);
+    return s.ret;
 }}"""
 
 
 def gen_wrapper(func: FuncDecl) -> str:
     assert not '_co_' in func.name
-    assert func.return_type == 'int'
 
     name = func.co_name
     struct_name = func.struct_name
@@ -183,6 +185,7 @@ def gen_wrapper(func: FuncDecl) -> str:
 
 typedef struct {struct_name} {{
     BdrvPollCo poll_state;
+    {func.return_type} ret;
 { func.gen_block('    {decl};') }
 }} {struct_name};
 
@@ -190,7 +193,7 @@ def gen_wrapper(func: FuncDecl) -> str:
 {{
     {struct_name} *s = opaque;
 
-    s->poll_state.ret = {name}({ func.gen_list('s->{name}') });
+    s->ret = {name}({ func.gen_list('s->{name}') });
     s->poll_state.in_progress = false;
 
     aio_wait_kick();
-- 
2.38.1


