Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DDE5BA1FD
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 22:50:42 +0200 (CEST)
Received: from localhost ([::1]:33792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYvom-0001my-QP
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 16:50:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oYvho-0001qn-Lp
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 16:43:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oYvhk-0000Hb-DR
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 16:43:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663274603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yNeHaLD2guXGo5GvFMsUl1i8y6CyvHjsyWy5EkWuK0w=;
 b=OADr0WNTSUti2vxjKg3iYpmvoQcDkGl4WEOV9IybKjMK8bxYtC8OmPbLYZsGzxPHPHTNXg
 IwVg01l/bSfk03c60gxm4G/opa4TywkX0Y/wIbNnLSK55aWUBD+N5iX/nHLXjRa0vxx54B
 pVU0YXe+UWrPmYAjo3OK8VCm75AE+gE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-KQf8duw8OAau43eCS7q2rQ-1; Thu, 15 Sep 2022 16:43:21 -0400
X-MC-Unique: KQf8duw8OAau43eCS7q2rQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 727CA862EE0;
 Thu, 15 Sep 2022 20:43:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F3C340C6EC2;
 Thu, 15 Sep 2022 20:43:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DC70921E6928; Thu, 15 Sep 2022 22:43:17 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com,
	jsnow@redhat.com,
	eblake@redhat.com
Subject: [PATCH 04/27] qapi: Start to elide redundant has_FOO in generated C
Date: Thu, 15 Sep 2022 22:42:54 +0200
Message-Id: <20220915204317.3766007-5-armbru@redhat.com>
In-Reply-To: <20220915204317.3766007-1-armbru@redhat.com>
References: <20220915204317.3766007-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In QAPI, absent optional members are distinct from any present value.
We thus represent an optional schema member FOO as two C members: a
FOO with the member's type, and a bool has_FOO.  Likewise for function
arguments.

However, has_FOO is actually redundant for a pointer-valued FOO, which
can be null only when has_FOO is false, i.e. has_FOO == !!FOO.  Except
for arrays, where we a null FOO can also be a present empty array.

The redundant has_FOO are a nuisance to work with.  Improve the
generator to elide them.  Uses of has_FOO need to be replaced as
follows.

Tests of has_FOO become the equivalent comparison of FOO with null.
For brevity, this is commonly done by implicit conversion to bool.

Assignments to has_FOO get dropped.

Likewise for arguments to has_FOO parameters.

Beware: code may violate the invariant has_FOO == !!FOO before the
transformation, and get away with it.  The above transformation can
then break things.  Two cases:

* Absent: if code ignores FOO entirely when !has_FOO (except for
  freeing it if necessary), even non-null / uninitialized FOO works.
  Such code is known to exist.

* Present: if code ignores FOO entirely when has_FOO, even null FOO
  works.  Such code should not exist.

In both cases, replacing tests of has_FOO by FOO reverts their sense.
We have to fix the value of FOO then.

To facilitate review of the necessary updates to handwritten code, add
means to opt out of this change, and opt out for all QAPI schema
modules where the change requires updates to handwritten code.  The
next few commits will remove these opt-outs in reviewable chunks, then
drop the means to opt out.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 docs/devel/qapi-code-gen.rst            |  5 +--
 docs/devel/writing-monitor-commands.rst | 14 ++++----
 scripts/qapi/commands.py                |  2 +-
 scripts/qapi/events.py                  |  2 +-
 scripts/qapi/gen.py                     |  2 +-
 scripts/qapi/schema.py                  | 47 +++++++++++++++++++++++++
 scripts/qapi/types.py                   |  2 +-
 scripts/qapi/visit.py                   | 17 +++++++--
 8 files changed, 76 insertions(+), 15 deletions(-)

diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
index 3a817ba498..5edc49aa74 100644
--- a/docs/devel/qapi-code-gen.rst
+++ b/docs/devel/qapi-code-gen.rst
@@ -1410,7 +1410,6 @@ Example::
 
     struct UserDefOne {
         int64_t integer;
-        bool has_string;
         char *string;
         bool has_flag;
         bool flag;
@@ -1525,10 +1524,12 @@ Example::
 
     bool visit_type_UserDefOne_members(Visitor *v, UserDefOne *obj, Error **errp)
     {
+        bool has_string = !!obj->string;
+
         if (!visit_type_int(v, "integer", &obj->integer, errp)) {
             return false;
         }
-        if (visit_optional(v, "string", &obj->has_string)) {
+        if (visit_optional(v, "string", &has_string)) {
             if (!visit_type_str(v, "string", &obj->string, errp)) {
                 return false;
             }
diff --git a/docs/devel/writing-monitor-commands.rst b/docs/devel/writing-monitor-commands.rst
index 4aa2bb904d..bdd4094cab 100644
--- a/docs/devel/writing-monitor-commands.rst
+++ b/docs/devel/writing-monitor-commands.rst
@@ -166,9 +166,9 @@ and user defined types.
 
 Now, let's update our C implementation in monitor/qmp-cmds.c::
 
- void qmp_hello_world(bool has_message, const char *message, Error **errp)
+ void qmp_hello_world(const char *message, Error **errp)
  {
-     if (has_message) {
+     if (message) {
          printf("%s\n", message);
      } else {
          printf("Hello, world\n");
@@ -210,9 +210,9 @@ file. Basically, most errors are set by calling the error_setg() function.
 Let's say we don't accept the string "message" to contain the word "love". If
 it does contain it, we want the "hello-world" command to return an error::
 
- void qmp_hello_world(bool has_message, const char *message, Error **errp)
+ void qmp_hello_world(const char *message, Error **errp)
  {
-     if (has_message) {
+     if (message) {
          if (strstr(message, "love")) {
              error_setg(errp, "the word 'love' is not allowed");
              return;
@@ -467,9 +467,9 @@ There are a number of things to be noticed:
    allocated by the regular g_malloc0() function. Note that we chose to
    initialize the memory to zero. This is recommended for all QAPI types, as
    it helps avoiding bad surprises (specially with booleans)
-4. Remember that "next_deadline" is optional? All optional members have a
-   'has_TYPE_NAME' member that should be properly set by the implementation,
-   as shown above
+4. Remember that "next_deadline" is optional? Non-pointer optional
+   members have a 'has_TYPE_NAME' member that should be properly set
+   by the implementation, as shown above
 5. Even static strings, such as "alarm_timer->name", should be dynamically
    allocated by the implementation. This is so because the QAPI also generates
    a function to free its types and it cannot distinguish between dynamically
diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index cf68aaf0bf..79c5e5c3a9 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -64,7 +64,7 @@ def gen_call(name: str,
     elif arg_type:
         assert not arg_type.variants
         for memb in arg_type.members:
-            if memb.optional:
+            if memb.need_has():
                 argstr += 'arg.has_%s, ' % c_name(memb.name)
             argstr += 'arg.%s, ' % c_name(memb.name)
 
diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
index e762d53d19..3cf01e96b6 100644
--- a/scripts/qapi/events.py
+++ b/scripts/qapi/events.py
@@ -60,7 +60,7 @@ def gen_param_var(typ: QAPISchemaObjectType) -> str:
     for memb in typ.members:
         ret += sep
         sep = ', '
-        if memb.optional:
+        if memb.need_has():
             ret += 'has_' + c_name(memb.name) + sep
         if memb.type.name == 'str':
             # Cast away const added in build_params()
diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index 113b49134d..b5a8d03e8e 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -121,7 +121,7 @@ def build_params(arg_type: Optional[QAPISchemaObjectType],
         for memb in arg_type.members:
             ret += sep
             sep = ', '
-            if memb.optional:
+            if memb.need_has():
                 ret += 'bool has_%s, ' % c_name(memb.name)
             ret += '%s %s' % (memb.type.c_param_type(),
                               c_name(memb.name))
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 3728340c37..01e783001c 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -253,6 +253,11 @@ def doc_type(self):
             return None
         return self.name
 
+    def need_has_if_optional(self):
+        # When FOO is a pointer, has_FOO == !!FOO, i.e. has_FOO is redundant.
+        # Except for arrays; see QAPISchemaArrayType.need_has_if_optional().
+        return not self.c_type().endswith(POINTER_SUFFIX)
+
     def check(self, schema):
         QAPISchemaEntity.check(self, schema)
         for feat in self.features:
@@ -352,6 +357,11 @@ def __init__(self, name, info, element_type):
         self._element_type_name = element_type
         self.element_type = None
 
+    def need_has_if_optional(self):
+        # When FOO is an array, we still need has_FOO to distinguish
+        # absent (!has_FOO) from present and empty (has_FOO && !FOO).
+        return True
+
     def check(self, schema):
         super().check(schema)
         self.element_type = schema.resolve_type(
@@ -745,6 +755,43 @@ def __init__(self, name, info, typ, optional, ifcond=None, features=None):
         self.optional = optional
         self.features = features or []
 
+    def need_has(self):
+        assert self.type
+        # Temporary hack to support dropping the has_FOO in reviewable chunks
+        opt_out = [
+            'qapi/acpi.json',
+            'qapi/audio.json',
+            'qapi/block-core.json',
+            'qapi/block-export.json',
+            'qapi/block.json',
+            'qapi/char.json',
+            'qapi/crypto.json',
+            'qapi/dump.json',
+            'qapi/introspect.json',
+            'qapi/job.json',
+            'qapi/machine.json',
+            'qapi/machine-target.json',
+            'qapi/migration.json',
+            'qapi/misc.json',
+            'qapi/net.json',
+            'qapi/pci.json',
+            'qapi/qdev.json',
+            'qapi/qom.json',
+            'qapi/replay.json',
+            'qapi/rocker.json',
+            'qapi/run-state.json',
+            'qapi/stats.json',
+            'qapi/tpm.json',
+            'qapi/transaction.json',
+            'qapi/ui.json',
+            'qga/qapi-schema.json',
+            'tests/qapi-schema/qapi-schema-test.json']
+        if self.info and any(self.info.fname.endswith(mod)
+                             for mod in opt_out):
+            return self.optional
+        # End of temporary hack
+        return self.optional and self.type.need_has_if_optional()
+
     def check(self, schema):
         assert self.defined_in
         self.type = schema.resolve_type(self._type_name, self.info,
diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
index 477d027001..c39d054d2c 100644
--- a/scripts/qapi/types.py
+++ b/scripts/qapi/types.py
@@ -142,7 +142,7 @@ def gen_struct_members(members: List[QAPISchemaObjectTypeMember]) -> str:
     ret = ''
     for memb in members:
         ret += memb.ifcond.gen_if()
-        if memb.optional:
+        if memb.need_has():
             ret += mcgen('''
     bool has_%(c_name)s;
 ''',
diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
index 380fa197f5..26a584ee4c 100644
--- a/scripts/qapi/visit.py
+++ b/scripts/qapi/visit.py
@@ -71,6 +71,16 @@ def gen_visit_object_members(name: str,
 ''',
                 c_name=c_name(name))
 
+    sep = ''
+    for memb in members:
+        if memb.optional and not memb.need_has():
+            ret += mcgen('''
+    bool has_%(c_name)s = !!obj->%(c_name)s;
+''',
+                         c_name=c_name(memb.name))
+            sep = '\n'
+    ret += sep
+
     if base:
         ret += mcgen('''
     if (!visit_type_%(c_type)s_members(v, (%(c_type)s *)obj, errp)) {
@@ -82,10 +92,13 @@ def gen_visit_object_members(name: str,
     for memb in members:
         ret += memb.ifcond.gen_if()
         if memb.optional:
+            has = 'has_' + c_name(memb.name)
+            if memb.need_has():
+                has = 'obj->' + has
             ret += mcgen('''
-    if (visit_optional(v, "%(name)s", &obj->has_%(c_name)s)) {
+    if (visit_optional(v, "%(name)s", &%(has)s)) {
 ''',
-                         name=memb.name, c_name=c_name(memb.name))
+                         name=memb.name, has=has)
             indent.increase()
         special_features = gen_special_features(memb.features)
         if special_features != '0':
-- 
2.37.2


