Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A24283C22
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Oct 2020 18:11:50 +0200 (CEST)
Received: from localhost ([::1]:55754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPT5Z-0008EU-3R
	for lists+qemu-devel@lfdr.de; Mon, 05 Oct 2020 12:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kPSti-00010j-6p
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 11:59:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kPStf-0002CC-GY
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 11:59:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601913570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YHqMohtz/DQAfB7P3HjESmjVMn5j4pgLYSLslWAxVi8=;
 b=ikoQsw7n2ZFF+wVf0xOQa2v0oFjwWFNrzUqmXuxaRaEmtZQGLEmlWRyzNH5vYBH70BO3C6
 zyV4FUfmJ9peWoqempupLdVk8tAUkaXeSToL9RJ+vw310IFGtuFFMDZDL2kHSvevfKBSmV
 QKPMIfTAeTc4Cerf8LgEhFo2YZ0ummY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-P6L5dw8qNme7dw-9BOOs0w-1; Mon, 05 Oct 2020 11:59:28 -0400
X-MC-Unique: P6L5dw8qNme7dw-9BOOs0w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC35E106B80A;
 Mon,  5 Oct 2020 15:59:26 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-113-145.ams2.redhat.com
 [10.36.113.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9936860C11;
 Mon,  5 Oct 2020 15:59:19 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v8 08/14] qapi: Add a 'coroutine' flag for commands
Date: Mon,  5 Oct 2020 17:58:49 +0200
Message-Id: <20201005155855.256490-9-kwolf@redhat.com>
In-Reply-To: <20201005155855.256490-1-kwolf@redhat.com>
References: <20201005155855.256490-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/05 02:11:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, marcandre.lureau@gmail.com, armbru@redhat.com,
 stefanha@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds a new 'coroutine' flag to QMP command definitions that
tells the QMP dispatcher that the command handler is safe to be run in a
coroutine.

The documentation of the new flag pretends that this flag is already
used as intended, which it isn't yet after this patch. We'll implement
this in another patch in this series.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 docs/devel/qapi-code-gen.txt            | 29 +++++++++++++++++++++++++
 docs/sphinx/qapidoc.py                  |  2 +-
 include/qapi/qmp/dispatch.h             |  1 +
 tests/test-qmp-cmds.c                   |  4 ++++
 scripts/qapi/commands.py                | 10 ++++++---
 scripts/qapi/expr.py                    | 11 ++++++++--
 scripts/qapi/introspect.py              |  2 +-
 scripts/qapi/schema.py                  | 13 +++++++----
 tests/qapi-schema/test-qapi.py          |  7 +++---
 tests/qapi-schema/meson.build           |  1 +
 tests/qapi-schema/oob-coroutine.err     |  2 ++
 tests/qapi-schema/oob-coroutine.json    |  2 ++
 tests/qapi-schema/oob-coroutine.out     |  0
 tests/qapi-schema/qapi-schema-test.json |  1 +
 tests/qapi-schema/qapi-schema-test.out  |  2 ++
 15 files changed, 73 insertions(+), 14 deletions(-)
 create mode 100644 tests/qapi-schema/oob-coroutine.err
 create mode 100644 tests/qapi-schema/oob-coroutine.json
 create mode 100644 tests/qapi-schema/oob-coroutine.out

diff --git a/docs/devel/qapi-code-gen.txt b/docs/devel/qapi-code-gen.txt
index 5fc67c99cd..4a41e36a75 100644
--- a/docs/devel/qapi-code-gen.txt
+++ b/docs/devel/qapi-code-gen.txt
@@ -472,6 +472,7 @@ Syntax:
                 '*gen': false,
                 '*allow-oob': true,
                 '*allow-preconfig': true,
+                '*coroutine': true,
                 '*if': COND,
                 '*features': FEATURES }
 
@@ -596,6 +597,34 @@ before the machine is built.  It defaults to false.  For example:
 QMP is available before the machine is built only when QEMU was
 started with --preconfig.
 
+Member 'coroutine' tells the QMP dispatcher whether the command handler
+is safe to be run in a coroutine.  It defaults to false.  If it is true,
+the command handler is called from coroutine context and may yield while
+waiting for an external event (such as I/O completion) in order to avoid
+blocking the guest and other background operations.
+
+Coroutine safety can be hard to prove, similar to thread safety.  Common
+pitfalls are:
+
+- The global mutex isn't held across qemu_coroutine_yield(), so
+  operations that used to assume that they execute atomically may have
+  to be more careful to protect against changes in the global state.
+
+- Nested event loops (AIO_WAIT_WHILE() etc.) are problematic in
+  coroutine context and can easily lead to deadlocks.  They should be
+  replaced by yielding and reentering the coroutine when the condition
+  becomes false.
+
+Since the command handler may assume coroutine context, any callers
+other than the QMP dispatcher must also call it in coroutine context.
+In particular, HMP commands calling such a QMP command handler must
+enter coroutine context before calling the handler.
+
+It is an error to specify both 'coroutine': true and 'allow-oob': true
+for a command.  We don't currently have a use case for both together and
+without a use case, it's not entirely clear what the semantics should
+be.
+
 The optional 'if' member specifies a conditional.  See "Configuring
 the schema" below for more on this.
 
diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
index 6944ffa6aa..e03abcbb95 100644
--- a/docs/sphinx/qapidoc.py
+++ b/docs/sphinx/qapidoc.py
@@ -330,7 +330,7 @@ class QAPISchemaGenRSTVisitor(QAPISchemaVisitor):
 
     def visit_command(self, name, info, ifcond, features, arg_type,
                       ret_type, gen, success_response, boxed, allow_oob,
-                      allow_preconfig):
+                      allow_preconfig, coroutine):
         doc = self._cur_doc
         self._add_doc('Command',
                       self._nodes_for_arguments(doc,
diff --git a/include/qapi/qmp/dispatch.h b/include/qapi/qmp/dispatch.h
index 0c2f467028..9fd2b720a7 100644
--- a/include/qapi/qmp/dispatch.h
+++ b/include/qapi/qmp/dispatch.h
@@ -25,6 +25,7 @@ typedef enum QmpCommandOptions
     QCO_NO_SUCCESS_RESP       =  (1U << 0),
     QCO_ALLOW_OOB             =  (1U << 1),
     QCO_ALLOW_PRECONFIG       =  (1U << 2),
+    QCO_COROUTINE             =  (1U << 3),
 } QmpCommandOptions;
 
 typedef struct QmpCommand
diff --git a/tests/test-qmp-cmds.c b/tests/test-qmp-cmds.c
index 5f1b245e19..d3413bfef0 100644
--- a/tests/test-qmp-cmds.c
+++ b/tests/test-qmp-cmds.c
@@ -36,6 +36,10 @@ void qmp_cmd_success_response(Error **errp)
 {
 }
 
+void qmp_coroutine_cmd(Error **errp)
+{
+}
+
 Empty2 *qmp_user_def_cmd0(Error **errp)
 {
     return g_new0(Empty2, 1);
diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 3cf9e1110b..6e6fc94a14 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -176,7 +176,8 @@ out:
     return ret
 
 
-def gen_register_command(name, success_response, allow_oob, allow_preconfig):
+def gen_register_command(name, success_response, allow_oob, allow_preconfig,
+                         coroutine):
     options = []
 
     if not success_response:
@@ -185,6 +186,8 @@ def gen_register_command(name, success_response, allow_oob, allow_preconfig):
         options += ['QCO_ALLOW_OOB']
     if allow_preconfig:
         options += ['QCO_ALLOW_PRECONFIG']
+    if coroutine:
+        options += ['QCO_COROUTINE']
 
     if not options:
         options = ['QCO_NO_OPTIONS']
@@ -267,7 +270,7 @@ void %(c_prefix)sqmp_init_marshal(QmpCommandList *cmds);
 
     def visit_command(self, name, info, ifcond, features,
                       arg_type, ret_type, gen, success_response, boxed,
-                      allow_oob, allow_preconfig):
+                      allow_oob, allow_preconfig, coroutine):
         if not gen:
             return
         # FIXME: If T is a user-defined type, the user is responsible
@@ -285,7 +288,8 @@ void %(c_prefix)sqmp_init_marshal(QmpCommandList *cmds);
             self._genh.add(gen_marshal_decl(name))
             self._genc.add(gen_marshal(name, arg_type, boxed, ret_type))
             self._regy.add(gen_register_command(name, success_response,
-                                                allow_oob, allow_preconfig))
+                                                allow_oob, allow_preconfig,
+                                                coroutine))
 
 
 def gen_commands(schema, output_dir, prefix):
diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 2942520399..a15c1fb474 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -88,10 +88,17 @@ def check_flags(expr, info):
         if key in expr and expr[key] is not False:
             raise QAPISemError(
                 info, "flag '%s' may only use false value" % key)
-    for key in ['boxed', 'allow-oob', 'allow-preconfig']:
+    for key in ['boxed', 'allow-oob', 'allow-preconfig', 'coroutine']:
         if key in expr and expr[key] is not True:
             raise QAPISemError(
                 info, "flag '%s' may only use true value" % key)
+    if 'allow-oob' in expr and 'coroutine' in expr:
+        # This is not necessarily a fundamental incompatibility, but
+        # we don't have a use case and the desired semantics isn't
+        # obvious.  The simplest solution is to forbid it until we get
+        # a use case for it.
+        raise QAPISemError(info, "flags 'allow-oob' and 'coroutine' "
+                                 "are incompatible")
 
 
 def check_if(expr, info, source):
@@ -342,7 +349,7 @@ def check_exprs(exprs):
                        ['command'],
                        ['data', 'returns', 'boxed', 'if', 'features',
                         'gen', 'success-response', 'allow-oob',
-                        'allow-preconfig'])
+                        'allow-preconfig', 'coroutine'])
             normalize_members(expr.get('data'))
             check_command(expr, info)
         elif meta == 'event':
diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index 23652be810..5907b09cd5 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -216,7 +216,7 @@ const QLitObject %(c_name)s = %(c_string)s;
 
     def visit_command(self, name, info, ifcond, features,
                       arg_type, ret_type, gen, success_response, boxed,
-                      allow_oob, allow_preconfig):
+                      allow_oob, allow_preconfig, coroutine):
         arg_type = arg_type or self._schema.the_empty_object_type
         ret_type = ret_type or self._schema.the_empty_object_type
         obj = {'arg-type': self._use_type(arg_type),
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 78309a00f0..d1307ec661 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -128,7 +128,7 @@ class QAPISchemaVisitor:
 
     def visit_command(self, name, info, ifcond, features,
                       arg_type, ret_type, gen, success_response, boxed,
-                      allow_oob, allow_preconfig):
+                      allow_oob, allow_preconfig, coroutine):
         pass
 
     def visit_event(self, name, info, ifcond, features, arg_type, boxed):
@@ -713,7 +713,8 @@ class QAPISchemaCommand(QAPISchemaEntity):
 
     def __init__(self, name, info, doc, ifcond, features,
                  arg_type, ret_type,
-                 gen, success_response, boxed, allow_oob, allow_preconfig):
+                 gen, success_response, boxed, allow_oob, allow_preconfig,
+                 coroutine):
         super().__init__(name, info, doc, ifcond, features)
         assert not arg_type or isinstance(arg_type, str)
         assert not ret_type or isinstance(ret_type, str)
@@ -726,6 +727,7 @@ class QAPISchemaCommand(QAPISchemaEntity):
         self.boxed = boxed
         self.allow_oob = allow_oob
         self.allow_preconfig = allow_preconfig
+        self.coroutine = coroutine
 
     def check(self, schema):
         super().check(schema)
@@ -768,7 +770,8 @@ class QAPISchemaCommand(QAPISchemaEntity):
         visitor.visit_command(
             self.name, self.info, self.ifcond, self.features,
             self.arg_type, self.ret_type, self.gen, self.success_response,
-            self.boxed, self.allow_oob, self.allow_preconfig)
+            self.boxed, self.allow_oob, self.allow_preconfig,
+            self.coroutine)
 
 
 class QAPISchemaEvent(QAPISchemaEntity):
@@ -1074,6 +1077,7 @@ class QAPISchema:
         boxed = expr.get('boxed', False)
         allow_oob = expr.get('allow-oob', False)
         allow_preconfig = expr.get('allow-preconfig', False)
+        coroutine = expr.get('coroutine', False)
         ifcond = expr.get('if')
         features = self._make_features(expr.get('features'), info)
         if isinstance(data, OrderedDict):
@@ -1086,7 +1090,8 @@ class QAPISchema:
         self._def_entity(QAPISchemaCommand(name, info, doc, ifcond, features,
                                            data, rets,
                                            gen, success_response,
-                                           boxed, allow_oob, allow_preconfig))
+                                           boxed, allow_oob, allow_preconfig,
+                                           coroutine))
 
     def _def_event(self, expr, info, doc):
         name = expr['event']
diff --git a/tests/qapi-schema/test-qapi.py b/tests/qapi-schema/test-qapi.py
index f396b471eb..e8db9d09d9 100755
--- a/tests/qapi-schema/test-qapi.py
+++ b/tests/qapi-schema/test-qapi.py
@@ -68,12 +68,13 @@ class QAPISchemaTestVisitor(QAPISchemaVisitor):
 
     def visit_command(self, name, info, ifcond, features,
                       arg_type, ret_type, gen, success_response, boxed,
-                      allow_oob, allow_preconfig):
+                      allow_oob, allow_preconfig, coroutine):
         print('command %s %s -> %s'
               % (name, arg_type and arg_type.name,
                  ret_type and ret_type.name))
-        print('    gen=%s success_response=%s boxed=%s oob=%s preconfig=%s'
-              % (gen, success_response, boxed, allow_oob, allow_preconfig))
+        print('    gen=%s success_response=%s boxed=%s oob=%s preconfig=%s%s'
+              % (gen, success_response, boxed, allow_oob, allow_preconfig,
+                 " coroutine=True" if coroutine else ""))
         self._print_if(ifcond)
         self._print_features(features)
 
diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index f08c902911..1f222a7a13 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -142,6 +142,7 @@ schemas = [
   'nested-struct-data.json',
   'nested-struct-data-invalid-dict.json',
   'non-objects.json',
+  'oob-coroutine.json',
   'oob-test.json',
   'allow-preconfig-test.json',
   'pragma-doc-required-crap.json',
diff --git a/tests/qapi-schema/oob-coroutine.err b/tests/qapi-schema/oob-coroutine.err
new file mode 100644
index 0000000000..c01a4992bd
--- /dev/null
+++ b/tests/qapi-schema/oob-coroutine.err
@@ -0,0 +1,2 @@
+oob-coroutine.json: In command 'oob-command-1':
+oob-coroutine.json:2: flags 'allow-oob' and 'coroutine' are incompatible
diff --git a/tests/qapi-schema/oob-coroutine.json b/tests/qapi-schema/oob-coroutine.json
new file mode 100644
index 0000000000..0f67663bcd
--- /dev/null
+++ b/tests/qapi-schema/oob-coroutine.json
@@ -0,0 +1,2 @@
+# Check that incompatible flags allow-oob and coroutine are rejected
+{ 'command': 'oob-command-1', 'allow-oob': true, 'coroutine': true }
diff --git a/tests/qapi-schema/oob-coroutine.out b/tests/qapi-schema/oob-coroutine.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
index 3a9f2cbb33..63f92adf68 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -148,6 +148,7 @@
   'returns': 'UserDefTwo' }
 
 { 'command': 'cmd-success-response', 'data': {}, 'success-response': false }
+{ 'command': 'coroutine-cmd', 'data': {}, 'coroutine': true }
 
 # Returning a non-dictionary requires a name from the whitelist
 { 'command': 'guest-get-time', 'data': {'a': 'int', '*b': 'int' },
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index 891b4101e0..8868ca0dca 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -203,6 +203,8 @@ command user_def_cmd2 q_obj_user_def_cmd2-arg -> UserDefTwo
     gen=True success_response=True boxed=False oob=False preconfig=False
 command cmd-success-response None -> None
     gen=True success_response=False boxed=False oob=False preconfig=False
+command coroutine-cmd None -> None
+    gen=True success_response=True boxed=False oob=False preconfig=False coroutine=True
 object q_obj_guest-get-time-arg
     member a: int optional=False
     member b: int optional=True
-- 
2.25.4


