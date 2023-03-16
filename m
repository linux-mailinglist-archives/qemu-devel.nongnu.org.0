Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 235966BC6C5
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 08:14:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pchoB-0003pW-Tt; Thu, 16 Mar 2023 03:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pchnv-0003lp-9v
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 03:13:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pchnp-0004Z3-Ce
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 03:13:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678950812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dZ2fStG5njIzMXbN8tsZ7HYsDWx0m0FLBdQ7wL65gv8=;
 b=iALCx4k+JjznMo8lbkoPdOnrfGt7dpR/M9/IJuKIpn6leq5ni8l2y4M31Oey9S6hTYc9/a
 JtkhzibofGpsxZhZ0Hsp/lux6lmv8FBsSWXtctMbaZc8X8jA5g1MMKqBMGoP/VJhXyAhIy
 YBgIcicrTmRdyhdKXff8eftJXk0HAg8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-475-Es6lMMNqOy-1DMAjVkUS7g-1; Thu, 16 Mar 2023 03:13:28 -0400
X-MC-Unique: Es6lMMNqOy-1DMAjVkUS7g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83A753813F3C;
 Thu, 16 Mar 2023 07:13:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C891492B00;
 Thu, 16 Mar 2023 07:13:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1243E21D2080; Thu, 16 Mar 2023 08:13:26 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 eblake@redhat.com, jsnow@redhat.com
Subject: [PATCH 14/14] qapi: Require boxed for conditional command and event
 arguments
Date: Thu, 16 Mar 2023 08:13:25 +0100
Message-Id: <20230316071325.492471-15-armbru@redhat.com>
In-Reply-To: <20230316071325.492471-1-armbru@redhat.com>
References: <20230316071325.492471-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

The C code generator fails to honor 'if' conditions of command and
event arguments.

For instance, tests/qapi-schema/qapi-schema-test.json has

    { 'event': 'TEST_IF_EVENT',
      'data': { 'foo': 'TestIfStruct',
		'bar': { 'type': ['str'], 'if': 'TEST_IF_EVT_ARG' } },
      'if': { 'all': ['TEST_IF_EVT', 'TEST_IF_STRUCT'] } }

Generated tests/test-qapi-events.h fails to honor the TEST_IF_EVT_ARG
condition:

    #if defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)
    void qapi_event_send_test_if_event(TestIfStruct *foo, strList *bar);
    #endif /* defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT) */

Only uses so far are in tests/.

We could fix the generator to emit something like

    #if defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)
    void qapi_event_send_test_if_event(TestIfStruct *foo
    #if defined(TEST_IF_EVT_ARG)
                    , strList *bar
    #endif
                    );
    #endif /* defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT) */

Ugly.  Calls become similarly ugly.  Not worth fixing.

Conditional arguments work fine with 'boxed': true, simply because
complex types with conditional members work fine.  Not worth breaking.

Reject conditional arguments unless boxed.

Move the tests cases covering unboxed conditional arguments out of
tests/qapi-schema/qapi-schema-test.json.  Cover boxed conditional
arguments there instead.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 docs/devel/qapi-code-gen.rst                 |  5 ++---
 scripts/qapi/commands.py                     |  1 +
 scripts/qapi/gen.py                          |  1 +
 scripts/qapi/schema.py                       | 14 ++++++++++++++
 tests/qapi-schema/args-if-implicit.err       |  2 ++
 tests/qapi-schema/args-if-implicit.json      |  4 ++++
 tests/qapi-schema/args-if-implicit.out       |  0
 tests/qapi-schema/args-if-unboxed.err        |  2 ++
 tests/qapi-schema/args-if-unboxed.json       |  6 ++++++
 tests/qapi-schema/args-if-unboxed.out        |  0
 tests/qapi-schema/event-args-if-unboxed.err  |  2 ++
 tests/qapi-schema/event-args-if-unboxed.json |  4 ++++
 tests/qapi-schema/event-args-if-unboxed.out  |  0
 tests/qapi-schema/meson.build                |  2 ++
 tests/qapi-schema/qapi-schema-test.json      |  9 ++++-----
 tests/qapi-schema/qapi-schema-test.out       | 18 ++++--------------
 16 files changed, 48 insertions(+), 22 deletions(-)
 create mode 100644 tests/qapi-schema/args-if-implicit.err
 create mode 100644 tests/qapi-schema/args-if-implicit.json
 create mode 100644 tests/qapi-schema/args-if-implicit.out
 create mode 100644 tests/qapi-schema/args-if-unboxed.err
 create mode 100644 tests/qapi-schema/args-if-unboxed.json
 create mode 100644 tests/qapi-schema/args-if-unboxed.out
 create mode 100644 tests/qapi-schema/event-args-if-unboxed.err
 create mode 100644 tests/qapi-schema/event-args-if-unboxed.json
 create mode 100644 tests/qapi-schema/event-args-if-unboxed.out

diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
index 23e7f2fb1c..879a649e8c 100644
--- a/docs/devel/qapi-code-gen.rst
+++ b/docs/devel/qapi-code-gen.rst
@@ -805,9 +805,8 @@ gets its generated code guarded like this::
  ... generated code ...
  #endif /* defined(HAVE_BAR) && defined(CONFIG_FOO) */
 
-Individual members of complex types, commands arguments, and
-event-specific data can also be made conditional.  This requires the
-longhand form of MEMBER.
+Individual members of complex types can also be made conditional.
+This requires the longhand form of MEMBER.
 
 Example: a struct type with unconditional member 'foo' and conditional
 member 'bar' ::
diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 79c5e5c3a9..bda6896076 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -64,6 +64,7 @@ def gen_call(name: str,
     elif arg_type:
         assert not arg_type.variants
         for memb in arg_type.members:
+            assert not memb.ifcond.is_present()
             if memb.need_has():
                 argstr += 'arg.has_%s, ' % c_name(memb.name)
             argstr += 'arg.%s, ' % c_name(memb.name)
diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index b5a8d03e8e..8f8f784f4a 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -119,6 +119,7 @@ def build_params(arg_type: Optional[QAPISchemaObjectType],
     elif arg_type:
         assert not arg_type.variants
         for memb in arg_type.members:
+            assert not memb.ifcond.is_present()
             ret += sep
             sep = ', '
             if memb.need_has():
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 719152fe49..8f31f8832f 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -486,6 +486,10 @@ def is_empty(self):
         assert self.members is not None
         return not self.members and not self.variants
 
+    def has_conditional_members(self):
+        assert self.members is not None
+        return any(m.ifcond.is_present() for m in self.members)
+
     def c_name(self):
         assert self.name != 'q_empty'
         return super().c_name()
@@ -817,6 +821,11 @@ def check(self, schema):
                     self.info,
                     "command's 'data' can take %s only with 'boxed': true"
                     % self.arg_type.describe())
+            self.arg_type.check(schema)
+            if self.arg_type.has_conditional_members() and not self.boxed:
+                raise QAPISemError(
+                    self.info,
+                    "conditional command arguments require 'boxed': true")
         if self._ret_type_name:
             self.ret_type = schema.resolve_type(
                 self._ret_type_name, self.info, "command's 'returns'")
@@ -872,6 +881,11 @@ def check(self, schema):
                     self.info,
                     "event's 'data' can take %s only with 'boxed': true"
                     % self.arg_type.describe())
+            self.arg_type.check(schema)
+            if self.arg_type.has_conditional_members() and not self.boxed:
+                raise QAPISemError(
+                    self.info,
+                    "conditional event arguments require 'boxed': true")
 
     def connect_doc(self, doc=None):
         super().connect_doc(doc)
diff --git a/tests/qapi-schema/args-if-implicit.err b/tests/qapi-schema/args-if-implicit.err
new file mode 100644
index 0000000000..da2447d397
--- /dev/null
+++ b/tests/qapi-schema/args-if-implicit.err
@@ -0,0 +1,2 @@
+args-if-implicit.json: In command 'test-if-cmd':
+args-if-implicit.json:1: conditional command arguments require 'boxed': true
diff --git a/tests/qapi-schema/args-if-implicit.json b/tests/qapi-schema/args-if-implicit.json
new file mode 100644
index 0000000000..1eda39cb1e
--- /dev/null
+++ b/tests/qapi-schema/args-if-implicit.json
@@ -0,0 +1,4 @@
+{ 'command': 'test-if-cmd',
+  'data': {
+    'foo': 'int',
+    'bar': { 'type': 'str', 'if': 'TEST_IF_CMD_ARG' } } }
diff --git a/tests/qapi-schema/args-if-implicit.out b/tests/qapi-schema/args-if-implicit.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/args-if-unboxed.err b/tests/qapi-schema/args-if-unboxed.err
new file mode 100644
index 0000000000..3d2fc836ef
--- /dev/null
+++ b/tests/qapi-schema/args-if-unboxed.err
@@ -0,0 +1,2 @@
+args-if-unboxed.json: In command 'test-if-cmd':
+args-if-unboxed.json:5: conditional command arguments require 'boxed': true
diff --git a/tests/qapi-schema/args-if-unboxed.json b/tests/qapi-schema/args-if-unboxed.json
new file mode 100644
index 0000000000..6e04c13e72
--- /dev/null
+++ b/tests/qapi-schema/args-if-unboxed.json
@@ -0,0 +1,6 @@
+{ 'struct': 'TestIfCmdArgs',
+  'data': {
+    'foo': 'int',
+    'bar': { 'type': 'str', 'if': 'TEST_IF_CMD_ARG' } } }
+{ 'command': 'test-if-cmd',
+  'data': 'TestIfCmdArgs' }
diff --git a/tests/qapi-schema/args-if-unboxed.out b/tests/qapi-schema/args-if-unboxed.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/event-args-if-unboxed.err b/tests/qapi-schema/event-args-if-unboxed.err
new file mode 100644
index 0000000000..41ac64c6f3
--- /dev/null
+++ b/tests/qapi-schema/event-args-if-unboxed.err
@@ -0,0 +1,2 @@
+tests/qapi-schema/event-args-if-unboxed.json: In event 'TEST_IF_EVENT':
+tests/qapi-schema/event-args-if-unboxed.json:1: event's 'data' members may have 'if' conditions only with 'boxed': true
diff --git a/tests/qapi-schema/event-args-if-unboxed.json b/tests/qapi-schema/event-args-if-unboxed.json
new file mode 100644
index 0000000000..ca42a74e3a
--- /dev/null
+++ b/tests/qapi-schema/event-args-if-unboxed.json
@@ -0,0 +1,4 @@
+ { 'event': 'TEST_IF_EVENT',
+  'data': {
+    'foo': 'int',
+    'bar': { 'type': 'str', 'if': 'TEST_IF_CMD_ARG' } } }
diff --git a/tests/qapi-schema/event-args-if-unboxed.out b/tests/qapi-schema/event-args-if-unboxed.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index f88110bddf..a06515ca17 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -27,6 +27,8 @@ schemas = [
   'args-bad-boxed.json',
   'args-boxed-anon.json',
   'args-boxed-string.json',
+  'args-if-implicit.json',
+  'args-if-unboxed.json',
   'args-int.json',
   'args-invalid.json',
   'args-member-array-bad.json',
diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
index f1f742d38c..8bbf94834a 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -249,17 +249,16 @@
   'if': { 'all': ['TEST_IF_ALT', 'TEST_IF_STRUCT'] } }
 
 { 'command': 'test-if-cmd',
-  'data': {
-    'foo': 'TestIfStruct',
-    'bar': { 'type': 'str', 'if': 'TEST_IF_CMD_ARG' } },
+  'boxed': true,
+  'data': 'TestIfStruct',
   'returns': 'UserDefThree',
   'if': { 'all': ['TEST_IF_CMD', 'TEST_IF_STRUCT'] } }
 
 { 'command': 'test-cmd-return-def-three', 'returns': 'UserDefThree' }
 
 { 'event': 'TEST_IF_EVENT',
-  'data': { 'foo': 'TestIfStruct',
-            'bar': { 'type': ['str'], 'if': 'TEST_IF_EVT_ARG' } },
+  'boxed': true,
+  'data': 'TestIfStruct',
   'if': { 'all': ['TEST_IF_EVT', 'TEST_IF_STRUCT'] } }
 
 { 'event': 'TEST_IF_EVENT2', 'data': {},
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index cee92c0d2e..cc34b422e6 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -283,23 +283,13 @@ object q_obj_test-if-alternate-cmd-arg
 command test-if-alternate-cmd q_obj_test-if-alternate-cmd-arg -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
     if {'all': ['TEST_IF_ALT', 'TEST_IF_STRUCT']}
-object q_obj_test-if-cmd-arg
-    member foo: TestIfStruct optional=False
-    member bar: str optional=False
-        if TEST_IF_CMD_ARG
-    if {'all': ['TEST_IF_CMD', 'TEST_IF_STRUCT']}
-command test-if-cmd q_obj_test-if-cmd-arg -> UserDefThree
-    gen=True success_response=True boxed=False oob=False preconfig=False
+command test-if-cmd TestIfStruct -> UserDefThree
+    gen=True success_response=True boxed=True oob=False preconfig=False
     if {'all': ['TEST_IF_CMD', 'TEST_IF_STRUCT']}
 command test-cmd-return-def-three None -> UserDefThree
     gen=True success_response=True boxed=False oob=False preconfig=False
-object q_obj_TEST_IF_EVENT-arg
-    member foo: TestIfStruct optional=False
-    member bar: strList optional=False
-        if TEST_IF_EVT_ARG
-    if {'all': ['TEST_IF_EVT', 'TEST_IF_STRUCT']}
-event TEST_IF_EVENT q_obj_TEST_IF_EVENT-arg
-    boxed=False
+event TEST_IF_EVENT TestIfStruct
+    boxed=True
     if {'all': ['TEST_IF_EVT', 'TEST_IF_STRUCT']}
 event TEST_IF_EVENT2 None
     boxed=False
-- 
2.39.2


