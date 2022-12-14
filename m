Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A532364CCC8
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 15:59:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5S5g-0005R6-4M; Wed, 14 Dec 2022 08:46:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S4r-0004QR-W2
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S4p-0003aW-Gm
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671025538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xz+/KZyx0hi2CwasYfD5o5cq6Lmlrwm1r1BVh6PLq+s=;
 b=jLMT5/w3iV+l0YVXGqa7aV/5XyUXsG1/r6vie7MV9UjqzYEDBdP3ucR3Jtu01MXT/GkXQM
 YTAZovXMsKuoeu3Uj9eKRo/GZFs6ROhzoeW776izcUnOsXf4xW93Wokx+RFa/dmbTRvzHr
 4SjGZSOmBQ7GMIlNexquNu4lt0UO+z4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-uAsNNvioM16RLqcU4p1kwg-1; Wed, 14 Dec 2022 08:45:37 -0500
X-MC-Unique: uAsNNvioM16RLqcU4p1kwg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64C2C101A521;
 Wed, 14 Dec 2022 13:45:37 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A50CB14171BE;
 Wed, 14 Dec 2022 13:45:36 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 29/51] block-coroutine-wrapper.py: introduce co_wrapper
Date: Wed, 14 Dec 2022 14:44:31 +0100
Message-Id: <20221214134453.31665-30-kwolf@redhat.com>
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

This new annotation starts just a function wrapper that creates
a new coroutine. It assumes the caller is not a coroutine.
It will be the default annotation to be used in the future.

This is much better as c_w_mixed, because it is clear if the caller
is a coroutine or not, and provides the advantage of automating
the code creation. In the future all c_w_mixed functions will be
substituted by co_wrapper.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Message-Id: <20221128142337.657646-11-eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 docs/devel/block-coroutine-wrapper.rst |   6 +-
 include/block/block-common.h           |   8 +-
 scripts/block-coroutine-wrapper.py     | 110 +++++++++++++++++--------
 3 files changed, 86 insertions(+), 38 deletions(-)

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
index 56e6425356..2090c3bf73 100644
--- a/scripts/block-coroutine-wrapper.py
+++ b/scripts/block-coroutine-wrapper.py
@@ -2,7 +2,7 @@
 """Generate coroutine wrappers for block subsystem.
 
 The program parses one or several concatenated c files from stdin,
-searches for functions with the 'co_wrapper_mixed' specifier
+searches for functions with the 'co_wrapper' specifier
 and generates corresponding wrappers on stdout.
 
 Usage: block-coroutine-wrapper.py generated-file.c FILE.[ch]...
@@ -62,10 +62,25 @@ def __init__(self, param_decl: str) -> None:
 
 
 class FuncDecl:
-    def __init__(self, return_type: str, name: str, args: str) -> None:
+    def __init__(self, return_type: str, name: str, args: str,
+                 variant: str) -> None:
         self.return_type = return_type.strip()
         self.name = name.strip()
+        self.struct_name = snake_to_camel(self.name)
         self.args = [ParamDecl(arg.strip()) for arg in args.split(',')]
+        self.create_only_co = 'mixed' not in variant
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
@@ -74,8 +89,9 @@ def gen_block(self, format: str) -> str:
         return '\n'.join(format.format_map(arg.__dict__) for arg in self.args)
 
 
-# Match wrappers declared with a co_wrapper_mixed mark
-func_decl_re = re.compile(r'^int\s*co_wrapper_mixed\s*'
+# Match wrappers declared with a co_wrapper mark
+func_decl_re = re.compile(r'^int\s*co_wrapper'
+                          r'(?P<variant>(_[a-z][a-z0-9_]*)?)\s*'
                           r'(?P<wrapper_name>[a-z][a-z0-9_]*)'
                           r'\((?P<args>[^)]*)\);$', re.MULTILINE)
 
@@ -84,7 +100,8 @@ def func_decl_iter(text: str) -> Iterator:
     for m in func_decl_re.finditer(text):
         yield FuncDecl(return_type='int',
                        name=m.group('wrapper_name'),
-                       args=m.group('args'))
+                       args=m.group('args'),
+                       variant=m.group('variant'))
 
 
 def snake_to_camel(func_name: str) -> str:
@@ -97,24 +114,67 @@ def snake_to_camel(func_name: str) -> str:
     return ''.join(words)
 
 
+def create_mixed_wrapper(func: FuncDecl) -> str:
+    """
+    Checks if we are already in coroutine
+    """
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
+def create_co_wrapper(func: FuncDecl) -> str:
+    """
+    Assumes we are not in coroutine, and creates one
+    """
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
+    creation_function = create_mixed_wrapper
+    if func.create_only_co:
+        creation_function = create_co_wrapper
 
     return f"""\
 /*
@@ -136,23 +196,7 @@ def gen_wrapper(func: FuncDecl) -> str:
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
2.38.1


