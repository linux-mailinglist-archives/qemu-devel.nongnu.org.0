Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BBC638B72
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 14:42:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyYrx-0006ZK-D0; Fri, 25 Nov 2022 08:35:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oyYrf-0006So-MK
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 08:35:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oyYrZ-0005Cw-9L
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 08:35:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669383327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fcnVOdUy4/t5jL683B7bA1LjMUE9GwGlOVYHLjlt9aU=;
 b=CmB2+k3BGE1sWNdkJ+mVvnasKy1HLSfHz6CnP3FPRSG85+0N4OpkBmMNW/aTclYMhAnTRA
 0IVEA9SiZ0twhpvChEM/Zbt1R+O1DnolN13LNoEyI6XzEQ6C7slFTgTgJ0clehe3m4ChsW
 22yrO3Vtviw3ap5U93n0azSt6+AfWOA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-refU2q7YPY2q4kqffkZoTg-1; Fri, 25 Nov 2022 08:35:26 -0500
X-MC-Unique: refU2q7YPY2q4kqffkZoTg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CACB93C0E21D;
 Fri, 25 Nov 2022 13:35:25 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 679412166B46;
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
Subject: [PATCH v6 10/14] block-coroutine-wrapper.py: introduce co_wrapper
Date: Fri, 25 Nov 2022 08:35:14 -0500
Message-Id: <20221125133518.418328-11-eesposit@redhat.com>
In-Reply-To: <20221125133518.418328-1-eesposit@redhat.com>
References: <20221125133518.418328-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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

This new annotation creates just a function wrapper that creates
a new coroutine. It assumes the caller is not a coroutine.
It will be the default annotation to be used in the future.

This is much better as c_w_mixed, because it is clear if the caller
is a coroutine or not, and provides the advantage of automating
the code creation. In the future all c_w_mixed functions will be
substituted by co_wrapper.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 docs/devel/block-coroutine-wrapper.rst |   6 +-
 include/block/block-common.h           |   8 +-
 scripts/block-coroutine-wrapper.py     | 109 +++++++++++++++++--------
 3 files changed, 85 insertions(+), 38 deletions(-)

diff --git a/docs/devel/block-coroutine-wrapper.rst b/docs/devel/block-coroutine-wrapper.rst
index 64acc8d65d..6dd2cdcab3 100644
--- a/docs/devel/block-coroutine-wrapper.rst
+++ b/docs/devel/block-coroutine-wrapper.rst
@@ -26,12 +26,12 @@ called ``bdrv_foo(<same args>)``. In this case the script can help. To
 trigger the generation:
 
 1. You need ``bdrv_foo`` declaration somewhere (for example, in
-   ``block/coroutines.h``) with the ``co_wrapper_mixed`` mark,
+   ``block/coroutines.h``) with the ``co_wrapper`` mark,
    like this:
 
 .. code-block:: c
 
-    int co_wrapper_mixed bdrv_foo(<some args>);
+    int co_wrapper bdrv_foo(<some args>);
 
 2. You need to feed this declaration to block-coroutine-wrapper script.
    For this, add the .h (or .c) file with the declaration to the
@@ -46,7 +46,7 @@ Links
 
 1. The script location is ``scripts/block-coroutine-wrapper.py``.
 
-2. Generic place for private ``co_wrapper_mixed`` declarations is
+2. Generic place for private ``co_wrapper`` declarations is
    ``block/coroutines.h``, for public declarations:
    ``include/block/block.h``
 
diff --git a/include/block/block-common.h b/include/block/block-common.h
index ec2309055b..847e4d4626 100644
--- a/include/block/block-common.h
+++ b/include/block/block-common.h
@@ -42,9 +42,13 @@
  *
  * Usage: read docs/devel/block-coroutine-wrapper.rst
  *
- * co_wrapper_mixed functions can be called by both coroutine and
- * non-coroutine context.
+ * There are 2 kind of specifiers:
+ * - co_wrapper functions can be called by only non-coroutine context, because
+ *   they always generate a new coroutine.
+ * - co_wrapper_mixed functions can be called by both coroutine and
+ *   non-coroutine context.
  */
+#define co_wrapper
 #define co_wrapper_mixed
 
 /* block.c */
diff --git a/scripts/block-coroutine-wrapper.py b/scripts/block-coroutine-wrapper.py
index 56e6425356..7972d3fe01 100644
--- a/scripts/block-coroutine-wrapper.py
+++ b/scripts/block-coroutine-wrapper.py
@@ -2,7 +2,7 @@
 """Generate coroutine wrappers for block subsystem.
 
 The program parses one or several concatenated c files from stdin,
-searches for functions with the 'co_wrapper_mixed' specifier
+searches for functions with the 'co_wrapper' specifier
 and generates corresponding wrappers on stdout.
 
 Usage: block-coroutine-wrapper.py generated-file.c FILE.[ch]...
@@ -62,10 +62,28 @@ def __init__(self, param_decl: str) -> None:
 
 
 class FuncDecl:
-    def __init__(self, return_type: str, name: str, args: str) -> None:
+    def __init__(self, return_type: str, name: str, args: str,
+                 variant: str) -> None:
         self.return_type = return_type.strip()
         self.name = name.strip()
+        self.struct_name = snake_to_camel(self.name)
         self.args = [ParamDecl(arg.strip()) for arg in args.split(',')]
+        self.create_only_co = True
+
+        if 'mixed' in variant:
+            self.create_only_co = False
+
+        subsystem, subname = self.name.split('_', 1)
+        self.co_name = f'{subsystem}_co_{subname}'
+
+        t = self.args[0].type
+        if t == 'BlockDriverState *':
+            bs = 'bs'
+        elif t == 'BdrvChild *':
+            bs = 'child->bs'
+        else:
+            bs = 'blk_bs(blk)'
+        self.bs = bs
 
     def gen_list(self, format: str) -> str:
         return ', '.join(format.format_map(arg.__dict__) for arg in self.args)
@@ -74,8 +92,9 @@ def gen_block(self, format: str) -> str:
         return '\n'.join(format.format_map(arg.__dict__) for arg in self.args)
 
 
-# Match wrappers declared with a co_wrapper_mixed mark
-func_decl_re = re.compile(r'^int\s*co_wrapper_mixed\s*'
+# Match wrappers declared with a co_wrapper mark
+func_decl_re = re.compile(r'^int\s*co_wrapper'
+                          r'(?P<variant>(_[a-z][a-z0-9_]*)?)\s*'
                           r'(?P<wrapper_name>[a-z][a-z0-9_]*)'
                           r'\((?P<args>[^)]*)\);$', re.MULTILINE)
 
@@ -84,7 +103,8 @@ def func_decl_iter(text: str) -> Iterator:
     for m in func_decl_re.finditer(text):
         yield FuncDecl(return_type='int',
                        name=m.group('wrapper_name'),
-                       args=m.group('args'))
+                       args=m.group('args'),
+                       variant=m.group('variant'))
 
 
 def snake_to_camel(func_name: str) -> str:
@@ -97,24 +117,63 @@ def snake_to_camel(func_name: str) -> str:
     return ''.join(words)
 
 
+# Checks if we are already in coroutine
+def create_g_c_w(func: FuncDecl) -> str:
+    name = func.co_name
+    struct_name = func.struct_name
+    return f"""\
+int {func.name}({ func.gen_list('{decl}') })
+{{
+    if (qemu_in_coroutine()) {{
+        return {name}({ func.gen_list('{name}') });
+    }} else {{
+        {struct_name} s = {{
+            .poll_state.bs = {func.bs},
+            .poll_state.in_progress = true,
+
+{ func.gen_block('            .{name} = {name},') }
+        }};
+
+        s.poll_state.co = qemu_coroutine_create({name}_entry, &s);
+
+        return bdrv_poll_co(&s.poll_state);
+    }}
+}}"""
+
+
+# Assumes we are not in coroutine, and creates one
+def create_coroutine_only(func: FuncDecl) -> str:
+    name = func.co_name
+    struct_name = func.struct_name
+    return f"""\
+int {func.name}({ func.gen_list('{decl}') })
+{{
+    {struct_name} s = {{
+        .poll_state.bs = {func.bs},
+        .poll_state.in_progress = true,
+
+{ func.gen_block('        .{name} = {name},') }
+    }};
+    assert(!qemu_in_coroutine());
+
+    s.poll_state.co = qemu_coroutine_create({name}_entry, &s);
+
+    return bdrv_poll_co(&s.poll_state);
+}}"""
+
+
 def gen_wrapper(func: FuncDecl) -> str:
     assert not '_co_' in func.name
     assert func.return_type == 'int'
     assert func.args[0].type in ['BlockDriverState *', 'BdrvChild *',
                                  'BlockBackend *']
 
-    subsystem, subname = func.name.split('_', 1)
-
-    name = f'{subsystem}_co_{subname}'
+    name = func.co_name
+    struct_name = func.struct_name
 
-    t = func.args[0].type
-    if t == 'BlockDriverState *':
-        bs = 'bs'
-    elif t == 'BdrvChild *':
-        bs = 'child->bs'
-    else:
-        bs = 'blk_bs(blk)'
-    struct_name = snake_to_camel(name)
+    creation_function = create_g_c_w
+    if func.create_only_co:
+        creation_function = create_coroutine_only
 
     return f"""\
 /*
@@ -136,23 +195,7 @@ def gen_wrapper(func: FuncDecl) -> str:
     aio_wait_kick();
 }}
 
-int {func.name}({ func.gen_list('{decl}') })
-{{
-    if (qemu_in_coroutine()) {{
-        return {name}({ func.gen_list('{name}') });
-    }} else {{
-        {struct_name} s = {{
-            .poll_state.bs = {bs},
-            .poll_state.in_progress = true,
-
-{ func.gen_block('            .{name} = {name},') }
-        }};
-
-        s.poll_state.co = qemu_coroutine_create({name}_entry, &s);
-
-        return bdrv_poll_co(&s.poll_state);
-    }}
-}}"""
+{creation_function(func)}"""
 
 
 def gen_wrappers(input_code: str) -> str:
-- 
2.31.1


