Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 926B162BDF2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 13:31:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovHRZ-0000iN-Ge; Wed, 16 Nov 2022 07:23:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovHRO-0000ec-Uw
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 07:22:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovHRL-0000ui-1W
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 07:22:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668601369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OtMeYc3r07Ov/U9gk6yyguEB1DrHpg8GHd8+1KPRhv0=;
 b=dMmN5kPe/r0/IPDKJrsBF3/Yz8/ViVlXIKDK1IXdIxHgIZ6xPw6lpEto4Yf3R3H8otrh0r
 /vSUd9PN+eXa4GQxa2EpyawmMXCKfqS7s6An9QAJsHnakvJ2Z4hJ1VDhCT6E1rqqXUWyxy
 dZEgfVoemsxAluLTP7fG4AmWMjFjn+4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-FAW7tUnQM5Ob_tdiB5HR7A-1; Wed, 16 Nov 2022 07:22:46 -0500
X-MC-Unique: FAW7tUnQM5Ob_tdiB5HR7A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 981848001B8;
 Wed, 16 Nov 2022 12:22:45 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A36B9E70;
 Wed, 16 Nov 2022 12:22:45 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v4 06/11] block-coroutine-wrapper.py: support also basic
 return types
Date: Wed, 16 Nov 2022 07:22:36 -0500
Message-Id: <20221116122241.2856527-7-eesposit@redhat.com>
In-Reply-To: <20221116122241.2856527-1-eesposit@redhat.com>
References: <20221116122241.2856527-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
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

Extend the regex to cover also return type, pointers included.
This implies that the value returned by the function cannot be
a simple "int" anymore, but the custom return type.
Therefore remove poll_state->ret and instead use a per-function
custom "ret" field.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/block-gen.h                  |  5 +----
 scripts/block-coroutine-wrapper.py | 19 +++++++++++--------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/block/block-gen.h b/block/block-gen.h
index f80cf4897d..8ac9d5bd4f 100644
--- a/block/block-gen.h
+++ b/block/block-gen.h
@@ -32,18 +32,15 @@
 typedef struct BdrvPollCo {
     BlockDriverState *bs;
     bool in_progress;
-    int ret;
     Coroutine *co; /* Keep pointer here for debugging */
 } BdrvPollCo;
 
-static inline int bdrv_poll_co(BdrvPollCo *s)
+static inline void bdrv_poll_co(BdrvPollCo *s)
 {
     assert(!qemu_in_coroutine());
 
     bdrv_coroutine_enter(s->bs, s->co);
     BDRV_POLL_WHILE(s->bs, s->in_progress);
-
-    return s->ret;
 }
 
 #endif /* BLOCK_BLOCK_GEN_H */
diff --git a/scripts/block-coroutine-wrapper.py b/scripts/block-coroutine-wrapper.py
index 0f842386d4..21ecb3e896 100644
--- a/scripts/block-coroutine-wrapper.py
+++ b/scripts/block-coroutine-wrapper.py
@@ -80,7 +80,8 @@ def gen_block(self, format: str) -> str:
 
 
 # Match wrappers declared with a generated_co_wrapper mark
-func_decl_re = re.compile(r'^int\s*generated_co_wrapper'
+func_decl_re = re.compile(r'^(?P<return_type>[a-zA-Z][a-zA-Z0-9_]* [*]?)'
+                          r'\s*generated_co_wrapper'
                           r'(?P<variant>(_[a-z][a-z0-9_]*)?)\s*'
                           r'(?P<wrapper_name>[a-z][a-z0-9_]*)'
                           r'\((?P<args>[^)]*)\);$', re.MULTILINE)
@@ -88,7 +89,7 @@ def gen_block(self, format: str) -> str:
 
 def func_decl_iter(text: str) -> Iterator:
     for m in func_decl_re.finditer(text):
-        yield FuncDecl(return_type='int',
+        yield FuncDecl(return_type=m.group('return_type'),
                        name=m.group('wrapper_name'),
                        args=m.group('args'),
                        variant=m.group('variant'))
@@ -109,7 +110,7 @@ def create_g_c_w(func: FuncDecl) -> str:
     name = func.co_name
     struct_name = func.struct_name
     return f"""\
-int {func.name}({ func.gen_list('{decl}') })
+{func.return_type} {func.name}({ func.gen_list('{decl}') })
 {{
     if (qemu_in_coroutine()) {{
         return {name}({ func.gen_list('{name}') });
@@ -123,7 +124,8 @@ def create_g_c_w(func: FuncDecl) -> str:
 
         s.poll_state.co = qemu_coroutine_create({name}_entry, &s);
 
-        return bdrv_poll_co(&s.poll_state);
+        bdrv_poll_co(&s.poll_state);
+        return s.ret;
     }}
 }}"""
 
@@ -133,7 +135,7 @@ def create_coroutine_only(func: FuncDecl) -> str:
     name = func.co_name
     struct_name = func.struct_name
     return f"""\
-int {func.name}({ func.gen_list('{decl}') })
+{func.return_type} {func.name}({ func.gen_list('{decl}') })
 {{
     assert(!qemu_in_coroutine());
     {struct_name} s = {{
@@ -145,13 +147,13 @@ def create_coroutine_only(func: FuncDecl) -> str:
 
     s.poll_state.co = qemu_coroutine_create({name}_entry, &s);
 
-    return bdrv_poll_co(&s.poll_state);
+    bdrv_poll_co(&s.poll_state);
+    return s.ret;
 }}"""
 
 
 def gen_wrapper(func: FuncDecl) -> str:
     assert not '_co_' in func.name
-    assert func.return_type == 'int'
 
     subsystem, subname = func.name.split('_', 1)
 
@@ -182,6 +184,7 @@ def gen_wrapper(func: FuncDecl) -> str:
 
 typedef struct {struct_name} {{
     BdrvPollCo poll_state;
+    {func.return_type} ret;
 { func.gen_block('    {decl};') }
 }} {struct_name};
 
@@ -189,7 +192,7 @@ def gen_wrapper(func: FuncDecl) -> str:
 {{
     {struct_name} *s = opaque;
 
-    s->poll_state.ret = {name}({ func.gen_list('s->{name}') });
+    s->ret = {name}({ func.gen_list('s->{name}') });
     s->poll_state.in_progress = false;
 
     aio_wait_kick();
-- 
2.31.1


