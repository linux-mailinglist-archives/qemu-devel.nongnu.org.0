Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44749314046
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 21:21:29 +0100 (CET)
Received: from localhost ([::1]:36068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9D2G-0007nt-9Z
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 15:21:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l974Q-0005cU-Nl
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:59:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l9743-0001dJ-P4
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:59:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612792735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h2lG645VUDvw4MeZiKdOV5d8kEiTYqWGbD4d/AaUV/Y=;
 b=IeupjSoitiBbBP/mXEzT5ferEHMW/JYGeyQt7phaGTqrA1D13ulf+qzLoU1ibTDCyAdv7q
 fvJMu+lOQLnFNECS9/KpW9w+tN96eAdvq+VNNlUeT/4aXg6fyzwa4Tg8QYO9OUTdFadwGA
 PoR0nWXv6xr6FOgfQAckGlnN8BwMKcw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-w5nQwg0XN2OssL2q-3wt0w-1; Mon, 08 Feb 2021 08:58:51 -0500
X-MC-Unique: w5nQwg0XN2OssL2q-3wt0w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1AED107ACE3;
 Mon,  8 Feb 2021 13:58:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D62E101E243;
 Mon,  8 Feb 2021 13:58:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 646A41132CB1; Mon,  8 Feb 2021 14:58:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/16] qapi: use './builtin' as the built-in module name
Date: Mon,  8 Feb 2021 14:58:38 +0100
Message-Id: <20210208135846.3707170-9-armbru@redhat.com>
In-Reply-To: <20210208135846.3707170-1-armbru@redhat.com>
References: <20210208135846.3707170-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

Use './builtin' as the built-in module name instead of
None. Clarify the typing that this is now always a string.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210201193747.2169670-9-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/gen.py                      | 18 +++++++++---------
 scripts/qapi/schema.py                   | 20 ++++++++++----------
 tests/qapi-schema/comments.out           |  2 +-
 tests/qapi-schema/doc-good.out           |  2 +-
 tests/qapi-schema/empty.out              |  2 +-
 tests/qapi-schema/event-case.out         |  2 +-
 tests/qapi-schema/include-repetition.out |  2 +-
 tests/qapi-schema/include-simple.out     |  2 +-
 tests/qapi-schema/indented-expr.out      |  2 +-
 tests/qapi-schema/qapi-schema-test.out   |  2 +-
 10 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index da9d4d2d37..9352d79c3a 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -246,16 +246,16 @@ class QAPISchemaModularCVisitor(QAPISchemaVisitor):
         self._pydoc = pydoc
         self._genc: Optional[QAPIGenC] = None
         self._genh: Optional[QAPIGenH] = None
-        self._module: Dict[Optional[str], Tuple[QAPIGenC, QAPIGenH]] = {}
+        self._module: Dict[str, Tuple[QAPIGenC, QAPIGenH]] = {}
         self._main_module: Optional[str] = None
 
     @staticmethod
-    def _module_dirname(name: Optional[str]) -> str:
+    def _module_dirname(name: str) -> str:
         if QAPISchemaModule.is_user_module(name):
             return os.path.dirname(name)
         return ''
 
-    def _module_basename(self, what: str, name: Optional[str]) -> str:
+    def _module_basename(self, what: str, name: str) -> str:
         ret = '' if QAPISchemaModule.is_builtin_module(name) else self._prefix
         if QAPISchemaModule.is_user_module(name):
             basename = os.path.basename(name)
@@ -263,15 +263,15 @@ class QAPISchemaModularCVisitor(QAPISchemaVisitor):
             if name != self._main_module:
                 ret += '-' + os.path.splitext(basename)[0]
         else:
-            name = name[2:] if name else 'builtin'
-            ret += re.sub(r'-', '-' + name + '-', what)
+            assert QAPISchemaModule.is_system_module(name)
+            ret += re.sub(r'-', '-' + name[2:] + '-', what)
         return ret
 
-    def _module_filename(self, what: str, name: Optional[str]) -> str:
+    def _module_filename(self, what: str, name: str) -> str:
         return os.path.join(self._module_dirname(name),
                             self._module_basename(what, name))
 
-    def _add_module(self, name: Optional[str], blurb: str) -> None:
+    def _add_module(self, name: str, blurb: str) -> None:
         basename = self._module_filename(self._what, name)
         genc = QAPIGenC(basename + '.c', blurb, self._pydoc)
         genh = QAPIGenH(basename + '.h', blurb, self._pydoc)
@@ -284,7 +284,7 @@ class QAPISchemaModularCVisitor(QAPISchemaVisitor):
             self._main_module = name
         self._add_module(name, blurb)
 
-    def _add_system_module(self, name: Optional[str], blurb: str) -> None:
+    def _add_system_module(self, name: str, blurb: str) -> None:
         assert QAPISchemaModule.is_system_module(name)
         self._add_module(name, blurb)
 
@@ -302,7 +302,7 @@ class QAPISchemaModularCVisitor(QAPISchemaVisitor):
     def _begin_user_module(self, name: str) -> None:
         pass
 
-    def visit_module(self, name: Optional[str]) -> None:
+    def visit_module(self, name: str) -> None:
         if QAPISchemaModule.is_builtin_module(name):
             if self._builtin_blurb:
                 self._add_system_module(name, self._builtin_blurb)
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index e80d9320ed..14cf9da784 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -68,7 +68,8 @@ class QAPISchemaEntity:
 
     def _set_module(self, schema, info):
         assert self._checked
-        self._module = schema.module_by_fname(info and info.fname)
+        fname = info.fname if info else './builtin'
+        self._module = schema.module_by_fname(fname)
         self._module.add_entity(self)
 
     def set_module(self, schema):
@@ -142,16 +143,16 @@ class QAPISchemaModule:
         self._entity_list = []
 
     @staticmethod
-    def is_system_module(name: Optional[str]) -> bool:
+    def is_system_module(name: str) -> bool:
         """
         System modules are internally defined modules.
 
         Their names start with the "./" prefix.
         """
-        return name is None or name.startswith('./')
+        return name.startswith('./')
 
     @classmethod
-    def is_user_module(cls, name: Optional[str]) -> bool:
+    def is_user_module(cls, name: str) -> bool:
         """
         User modules are those defined by the user in qapi JSON files.
 
@@ -160,13 +161,13 @@ class QAPISchemaModule:
         return not cls.is_system_module(name)
 
     @staticmethod
-    def is_builtin_module(name: Optional[str]) -> bool:
+    def is_builtin_module(name: str) -> bool:
         """
         The built-in module is a single System module for the built-in types.
 
-        It is presently always the value 'None'.
+        It is always "./builtin".
         """
-        return name is None
+        return name == './builtin'
 
     def add_entity(self, ent):
         self._entity_list.append(ent)
@@ -852,7 +853,7 @@ class QAPISchema:
         self._entity_dict = {}
         self._module_dict = OrderedDict()
         self._schema_dir = os.path.dirname(fname)
-        self._make_module(None)  # built-ins
+        self._make_module('./builtin')
         self._make_module(fname)
         self._predefining = True
         self._def_predefineds()
@@ -897,7 +898,7 @@ class QAPISchema:
                 info, "%s uses unknown type '%s'" % (what, name))
         return typ
 
-    def _module_name(self, fname):
+    def _module_name(self, fname: str) -> str:
         if QAPISchemaModule.is_system_module(fname):
             return fname
         return os.path.relpath(fname, self._schema_dir)
@@ -910,7 +911,6 @@ class QAPISchema:
 
     def module_by_fname(self, fname):
         name = self._module_name(fname)
-        assert name in self._module_dict
         return self._module_dict[name]
 
     def _def_include(self, expr, info, doc):
diff --git a/tests/qapi-schema/comments.out b/tests/qapi-schema/comments.out
index 273f0f54e1..ce4f6a4f0f 100644
--- a/tests/qapi-schema/comments.out
+++ b/tests/qapi-schema/comments.out
@@ -1,4 +1,4 @@
-module None
+module ./builtin
 object q_empty
 enum QType
     prefix QTYPE
diff --git a/tests/qapi-schema/doc-good.out b/tests/qapi-schema/doc-good.out
index 419284dae2..715b0bbc1a 100644
--- a/tests/qapi-schema/doc-good.out
+++ b/tests/qapi-schema/doc-good.out
@@ -1,4 +1,4 @@
-module None
+module ./builtin
 object q_empty
 enum QType
     prefix QTYPE
diff --git a/tests/qapi-schema/empty.out b/tests/qapi-schema/empty.out
index 69666c39ad..3feb3f69d3 100644
--- a/tests/qapi-schema/empty.out
+++ b/tests/qapi-schema/empty.out
@@ -1,4 +1,4 @@
-module None
+module ./builtin
 object q_empty
 enum QType
     prefix QTYPE
diff --git a/tests/qapi-schema/event-case.out b/tests/qapi-schema/event-case.out
index 42ae519656..9ae44052ac 100644
--- a/tests/qapi-schema/event-case.out
+++ b/tests/qapi-schema/event-case.out
@@ -1,4 +1,4 @@
-module None
+module ./builtin
 object q_empty
 enum QType
     prefix QTYPE
diff --git a/tests/qapi-schema/include-repetition.out b/tests/qapi-schema/include-repetition.out
index 0b654ddebb..16dbd9b819 100644
--- a/tests/qapi-schema/include-repetition.out
+++ b/tests/qapi-schema/include-repetition.out
@@ -1,4 +1,4 @@
-module None
+module ./builtin
 object q_empty
 enum QType
     prefix QTYPE
diff --git a/tests/qapi-schema/include-simple.out b/tests/qapi-schema/include-simple.out
index 061f81e509..48e923bfbc 100644
--- a/tests/qapi-schema/include-simple.out
+++ b/tests/qapi-schema/include-simple.out
@@ -1,4 +1,4 @@
-module None
+module ./builtin
 object q_empty
 enum QType
     prefix QTYPE
diff --git a/tests/qapi-schema/indented-expr.out b/tests/qapi-schema/indented-expr.out
index 04356775cd..6a30ded3fa 100644
--- a/tests/qapi-schema/indented-expr.out
+++ b/tests/qapi-schema/indented-expr.out
@@ -1,4 +1,4 @@
-module None
+module ./builtin
 object q_empty
 enum QType
     prefix QTYPE
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index 8868ca0dca..3b1387d9f1 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -1,4 +1,4 @@
-module None
+module ./builtin
 object q_empty
 enum QType
     prefix QTYPE
-- 
2.26.2


