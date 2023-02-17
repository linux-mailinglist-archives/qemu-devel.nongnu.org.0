Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2E469AF30
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 16:12:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT2Na-0004uW-Lb; Fri, 17 Feb 2023 10:10:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pT2NU-0004om-F9
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:10:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pT2NR-0007Rz-DE
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:10:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676646620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nHlxdXK4OPtZ5mfpB0Hn0oKO5Hc3PfS7JaJob6Byv9k=;
 b=Yd1xXhYxKdn2WdZZjPiK0sOqkXAFYlzUg9wWJ1Z39K9MqTLNWu/G0/3byFGVFgzs6zzotm
 nw5U2hcU+OY3afRcpplcK+mA1uQ3nFPbnNmdebuesB5mvcD4easwib3FX894c82FH8Oj3W
 o3/wLejZoh8k0XiiFCpq+wIFeByBXB0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-1-85aoHdOwavhJ3eopUIYw-1; Fri, 17 Feb 2023 10:10:11 -0500
X-MC-Unique: 1-85aoHdOwavhJ3eopUIYw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A95CA3C10240;
 Fri, 17 Feb 2023 15:10:05 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BCD0B492C14;
 Fri, 17 Feb 2023 15:10:04 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 05/22] block-coroutine-wrapper: Introduce no_co_wrapper
Date: Fri, 17 Feb 2023 16:09:37 +0100
Message-Id: <20230217150954.283920-5-kwolf@redhat.com>
In-Reply-To: <20230217150954.283920-1-kwolf@redhat.com>
References: <20230217150829.283583-1-kwolf@redhat.com>
 <20230217150954.283920-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

Some functions must not be called from coroutine context. The common
pattern to use them anyway from a coroutine is running them in a BH and
letting the calling coroutine yield to be woken up when the BH is
completed.

Instead of manually writing such wrappers, add support for generating
them to block-coroutine-wrapper.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20230126172432.436111-2-kwolf@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Hanna Czenczek <hreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-common.h       | 14 +++++
 scripts/block-coroutine-wrapper.py | 83 ++++++++++++++++++++++++++----
 2 files changed, 86 insertions(+), 11 deletions(-)

diff --git a/include/block/block-common.h b/include/block/block-common.h
index 469300fe8d..b5122ef8ab 100644
--- a/include/block/block-common.h
+++ b/include/block/block-common.h
@@ -54,6 +54,20 @@
 #define co_wrapper_bdrv_rdlock         no_coroutine_fn
 #define co_wrapper_mixed_bdrv_rdlock   no_coroutine_fn coroutine_mixed_fn
 
+/*
+ * no_co_wrapper: Function specifier used by block-coroutine-wrapper.py
+ *
+ * Function specifier which does nothing but mark functions to be generated by
+ * scripts/block-coroutine-wrapper.py.
+ *
+ * A no_co_wrapper function declaration creates a coroutine_fn wrapper around
+ * functions that must not be called in coroutine context. It achieves this by
+ * scheduling a BH in the bottom half that runs the respective non-coroutine
+ * function. The coroutine yields after scheduling the BH and is reentered when
+ * the wrapped function returns.
+ */
+#define no_co_wrapper
+
 #include "block/blockjob.h"
 
 /* block.c */
diff --git a/scripts/block-coroutine-wrapper.py b/scripts/block-coroutine-wrapper.py
index e82b648127..60e9b3107c 100644
--- a/scripts/block-coroutine-wrapper.py
+++ b/scripts/block-coroutine-wrapper.py
@@ -63,8 +63,8 @@ def __init__(self, param_decl: str) -> None:
 
 
 class FuncDecl:
-    def __init__(self, return_type: str, name: str, args: str,
-                 variant: str) -> None:
+    def __init__(self, wrapper_type: str, return_type: str, name: str,
+                 args: str, variant: str) -> None:
         self.return_type = return_type.strip()
         self.name = name.strip()
         self.struct_name = snake_to_camel(self.name)
@@ -72,8 +72,21 @@ def __init__(self, return_type: str, name: str, args: str,
         self.create_only_co = 'mixed' not in variant
         self.graph_rdlock = 'bdrv_rdlock' in variant
 
-        subsystem, subname = self.name.split('_', 1)
-        self.co_name = f'{subsystem}_co_{subname}'
+        self.wrapper_type = wrapper_type
+
+        if wrapper_type == 'co':
+            subsystem, subname = self.name.split('_', 1)
+            self.target_name = f'{subsystem}_co_{subname}'
+        else:
+            assert wrapper_type == 'no_co'
+            subsystem, co_infix, subname = self.name.split('_', 2)
+            if co_infix != 'co':
+                raise ValueError(f"Invalid no_co function name: {self.name}")
+            if not self.create_only_co:
+                raise ValueError(f"no_co function can't be mixed: {self.name}")
+            if self.graph_rdlock:
+                raise ValueError(f"no_co function can't be rdlock: {self.name}")
+            self.target_name = f'{subsystem}_{subname}'
 
         t = self.args[0].type
         if t == 'BlockDriverState *':
@@ -105,7 +118,8 @@ def gen_block(self, format: str) -> str:
 
 # Match wrappers declared with a co_wrapper mark
 func_decl_re = re.compile(r'^(?P<return_type>[a-zA-Z][a-zA-Z0-9_]* [\*]?)'
-                          r'\s*co_wrapper'
+                          r'(\s*coroutine_fn)?'
+                          r'\s*(?P<wrapper_type>(no_)?co)_wrapper'
                           r'(?P<variant>(_[a-z][a-z0-9_]*)?)\s*'
                           r'(?P<wrapper_name>[a-z][a-z0-9_]*)'
                           r'\((?P<args>[^)]*)\);$', re.MULTILINE)
@@ -113,7 +127,8 @@ def gen_block(self, format: str) -> str:
 
 def func_decl_iter(text: str) -> Iterator:
     for m in func_decl_re.finditer(text):
-        yield FuncDecl(return_type=m.group('return_type'),
+        yield FuncDecl(wrapper_type=m.group('wrapper_type'),
+                       return_type=m.group('return_type'),
                        name=m.group('wrapper_name'),
                        args=m.group('args'),
                        variant=m.group('variant'))
@@ -133,7 +148,7 @@ def create_mixed_wrapper(func: FuncDecl) -> str:
     """
     Checks if we are already in coroutine
     """
-    name = func.co_name
+    name = func.target_name
     struct_name = func.struct_name
     graph_assume_lock = 'assume_graph_lock();' if func.graph_rdlock else ''
 
@@ -163,7 +178,7 @@ def create_co_wrapper(func: FuncDecl) -> str:
     """
     Assumes we are not in coroutine, and creates one
     """
-    name = func.co_name
+    name = func.target_name
     struct_name = func.struct_name
     return f"""\
 {func.return_type} {func.name}({ func.gen_list('{decl}') })
@@ -183,10 +198,11 @@ def create_co_wrapper(func: FuncDecl) -> str:
 }}"""
 
 
-def gen_wrapper(func: FuncDecl) -> str:
+def gen_co_wrapper(func: FuncDecl) -> str:
     assert not '_co_' in func.name
+    assert func.wrapper_type == 'co'
 
-    name = func.co_name
+    name = func.target_name
     struct_name = func.struct_name
 
     graph_lock=''
@@ -225,11 +241,56 @@ def gen_wrapper(func: FuncDecl) -> str:
 {creation_function(func)}"""
 
 
+def gen_no_co_wrapper(func: FuncDecl) -> str:
+    assert '_co_' in func.name
+    assert func.wrapper_type == 'no_co'
+
+    name = func.target_name
+    struct_name = func.struct_name
+
+    return f"""\
+/*
+ * Wrappers for {name}
+ */
+
+typedef struct {struct_name} {{
+    Coroutine *co;
+    {func.return_field}
+{ func.gen_block('    {decl};') }
+}} {struct_name};
+
+static void {name}_bh(void *opaque)
+{{
+    {struct_name} *s = opaque;
+
+    {func.get_result}{name}({ func.gen_list('s->{name}') });
+
+    aio_co_wake(s->co);
+}}
+
+{func.return_type} coroutine_fn {func.name}({ func.gen_list('{decl}') })
+{{
+    {struct_name} s = {{
+        .co = qemu_coroutine_self(),
+{ func.gen_block('        .{name} = {name},') }
+    }};
+    assert(qemu_in_coroutine());
+
+    aio_bh_schedule_oneshot(qemu_get_aio_context(), {name}_bh, &s);
+    qemu_coroutine_yield();
+
+    {func.ret}
+}}"""
+
+
 def gen_wrappers(input_code: str) -> str:
     res = ''
     for func in func_decl_iter(input_code):
         res += '\n\n\n'
-        res += gen_wrapper(func)
+        if func.wrapper_type == 'co':
+            res += gen_co_wrapper(func)
+        else:
+            res += gen_no_co_wrapper(func)
 
     return res
 
-- 
2.39.2


