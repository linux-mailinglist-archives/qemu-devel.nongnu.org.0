Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DC8635C2E
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 12:53:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxo9P-0002kg-QQ; Wed, 23 Nov 2022 06:42:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oxo9I-0002eO-Q3
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 06:42:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oxo9G-000620-BV
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 06:42:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669203757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PcTwWBMjg4w4P6lxlZz9ZldmXaYa6AY+1XzFhM0vsu8=;
 b=DIqYwVuPVTSsW0uphlC1BekZKeT+GtSZb/rIIKuF1gsr3LtLva2meTdwM+/3D5RsuXn7fo
 OCDeVr7nmR+u18mGREPV+G+wzKGtUP8wmDm0+epQ8+6/D2k7JkpBq2w2gGV/+druj/+m9j
 /VB4y6LakSclC5yIYBI2/MzaQmTM7BI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-tdH_CFeqNk2peblAUipVzw-1; Wed, 23 Nov 2022 06:42:34 -0500
X-MC-Unique: tdH_CFeqNk2peblAUipVzw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05F2529DD9A8;
 Wed, 23 Nov 2022 11:42:34 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2E4CC1908E;
 Wed, 23 Nov 2022 11:42:33 +0000 (UTC)
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
Subject: [PATCH v5 10/15] block-coroutine-wrapper.py: introduce
 generated_co_wrapper_simple
Date: Wed, 23 Nov 2022 06:42:22 -0500
Message-Id: <20221123114227.85757-11-eesposit@redhat.com>
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

This new annotation creates just a function wrapper that creates
a new coroutine. It assumes the caller is not a coroutine.

This is much better as g_c_w, because it is clear if the caller
is a coroutine or not, and provides the advantage of automating
the code creation. In the future all g_c_w functions will be
substituted on g_c_w_simple.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/block/block-common.h       |   1 +
 scripts/block-coroutine-wrapper.py | 105 ++++++++++++++++++++---------
 2 files changed, 75 insertions(+), 31 deletions(-)

diff --git a/include/block/block-common.h b/include/block/block-common.h
index 24de1d63fd..46b57501d8 100644
--- a/include/block/block-common.h
+++ b/include/block/block-common.h
@@ -54,6 +54,7 @@
  * Read more in docs/devel/block-coroutine-wrapper.rst
  */
 #define generated_co_wrapper
+#define generated_co_wrapper_simple
 
 /* block.c */
 typedef struct BlockDriver BlockDriver;
diff --git a/scripts/block-coroutine-wrapper.py b/scripts/block-coroutine-wrapper.py
index 08be813407..2fa3d01898 100644
--- a/scripts/block-coroutine-wrapper.py
+++ b/scripts/block-coroutine-wrapper.py
@@ -62,10 +62,28 @@ def __init__(self, param_decl: str) -> None:
 
 
 class FuncDecl:
-    def __init__(self, return_type: str, name: str, args: str) -> None:
+    def __init__(self, return_type: str, name: str, args: str,
+                 variant: str) -> None:
         self.return_type = return_type.strip()
         self.name = name.strip()
+        self.struct_name = snake_to_camel(self.name)
         self.args = [ParamDecl(arg.strip()) for arg in args.split(',')]
+        self.create_only_co = False
+
+        if variant == '_simple':
+            self.create_only_co = True
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
@@ -75,7 +93,8 @@ def gen_block(self, format: str) -> str:
 
 
 # Match wrappers declared with a generated_co_wrapper mark
-func_decl_re = re.compile(r'^int\s*generated_co_wrapper\s*'
+func_decl_re = re.compile(r'^int\s*generated_co_wrapper'
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


