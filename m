Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC542DCAE1
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 03:13:38 +0100 (CET)
Received: from localhost ([::1]:45810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpinR-0007Ni-HN
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 21:13:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpiaC-0002GB-B2
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 20:59:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpia2-0007BG-Aa
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 20:59:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608170384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MZg6kl92R9fCmKWRuiJH0usUFG83EOYNQGMwSnpfJSo=;
 b=Tr+59vgCq3SKNWFPoGNqRvXSeL1u7G1ibPjvyeFCkvuOWmg7DY0Q6lFYpgiTlAX2G5XlCV
 IZEAlZndMRdvLBkuBCcQvFkkw1ocGWOl5XvIoliAHX6u2YmK5x1eWcFIjZ137XDJq+Vild
 54VxYz/IYmvH9jlANjeSW+vi3vcQbzg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-wJIOl9EcNpeaeNoQGFAp0w-1; Wed, 16 Dec 2020 20:59:40 -0500
X-MC-Unique: wJIOl9EcNpeaeNoQGFAp0w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72D83E758;
 Thu, 17 Dec 2020 01:59:39 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-131.rdu2.redhat.com [10.10.112.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A9AB1E5;
 Thu, 17 Dec 2020 01:59:38 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/12] qapi/schema: make QAPISourceInfo mandatory
Date: Wed, 16 Dec 2020 20:59:22 -0500
Message-Id: <20201217015927.197287-8-jsnow@redhat.com>
In-Reply-To: <20201217015927.197287-1-jsnow@redhat.com>
References: <20201217015927.197287-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>

---

The event_enum_members change might become irrelevant after a
forthcoming (?) patch by Markus, but didn't have it in-hand at time of
publishing.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/events.py |  2 +-
 scripts/qapi/schema.py | 25 ++++++++++++++-----------
 scripts/qapi/types.py  |  9 +++++----
 scripts/qapi/visit.py  |  6 +++---
 4 files changed, 23 insertions(+), 19 deletions(-)

diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
index 9851653b9d1..9ba4f109028 100644
--- a/scripts/qapi/events.py
+++ b/scripts/qapi/events.py
@@ -225,7 +225,7 @@ def visit_event(self,
                                           self._event_emit_name))
         # Note: we generate the enum member regardless of @ifcond, to
         # keep the enumeration usable in target-independent code.
-        self._event_enum_members.append(QAPISchemaEnumMember(name, None))
+        self._event_enum_members.append(QAPISchemaEnumMember(name, info))
 
 
 def gen_events(schema: QAPISchema,
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 720449feee4..0449771dfe5 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -23,6 +23,7 @@
 from .error import QAPIError, QAPISemError
 from .expr import check_exprs
 from .parser import QAPISchemaParser
+from .source import QAPISourceInfo
 
 
 class QAPISchemaEntity:
@@ -36,10 +37,10 @@ def __init__(self, name, info, doc, ifcond=None, features=None):
         self.name = name
         self._module = None
         # For explicitly defined entities, info points to the (explicit)
-        # definition.  For builtins (and their arrays), info is None.
-        # For implicitly defined entities, info points to a place that
-        # triggered the implicit definition (there may be more than one
-        # such place).
+        # definition. For built-in types (and their arrays), info is a
+        # special object that evaluates to False. For implicitly defined
+        # entities, info points to a place that triggered the implicit
+        # definition (there may be more than one such place).
         self.info = info
         self.doc = doc
         self._ifcond = ifcond or []
@@ -68,7 +69,7 @@ def check_doc(self):
 
     def _set_module(self, schema, info):
         assert self._checked
-        self._module = schema.module_by_fname(info and info.fname)
+        self._module = schema.module_by_fname(info.fname if info else None)
         self._module.add_entity(self)
 
     def set_module(self, schema):
@@ -209,7 +210,7 @@ class QAPISchemaBuiltinType(QAPISchemaType):
     meta = 'built-in'
 
     def __init__(self, name, json_type, c_type):
-        super().__init__(name, None, None)
+        super().__init__(name, QAPISourceInfo.builtin(), None)
         assert not c_type or isinstance(c_type, str)
         assert json_type in ('string', 'number', 'int', 'boolean', 'null',
                              'value')
@@ -897,7 +898,7 @@ def _def_builtin_type(self, name, json_type, c_type):
         # be nice, but we can't as long as their generated code
         # (qapi-builtin-types.[ch]) may be shared by some other
         # schema.
-        self._make_array_type(name, None)
+        self._make_array_type(name, QAPISourceInfo.builtin())
 
     def _def_predefineds(self):
         for t in [('str',    'string',  'char' + POINTER_SUFFIX),
@@ -917,16 +918,18 @@ def _def_predefineds(self):
                   ('null',   'null',    'QNull' + POINTER_SUFFIX)]:
             self._def_builtin_type(*t)
         self.the_empty_object_type = QAPISchemaObjectType(
-            'q_empty', None, None, None, None, None, [], None)
+            'q_empty', QAPISourceInfo.builtin(),
+            None, None, None, None, [], None)
         self._def_entity(self.the_empty_object_type)
 
         qtypes = ['none', 'qnull', 'qnum', 'qstring', 'qdict', 'qlist',
                   'qbool']
         qtype_values = self._make_enum_members(
-            [{'name': n} for n in qtypes], None)
+            [{'name': n} for n in qtypes], QAPISourceInfo.builtin())
 
-        self._def_entity(QAPISchemaEnumType('QType', None, None, None, None,
-                                            qtype_values, 'QTYPE'))
+        self._def_entity(QAPISchemaEnumType(
+            'QType', QAPISourceInfo.builtin(), None,
+            None, None, qtype_values, 'QTYPE'))
 
     def _make_features(self, features, info):
         if features is None:
diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
index 2b4916cdaa1..a3a16284006 100644
--- a/scripts/qapi/types.py
+++ b/scripts/qapi/types.py
@@ -71,7 +71,8 @@ def gen_enum(name: str,
              members: List[QAPISchemaEnumMember],
              prefix: Optional[str] = None) -> str:
     # append automatically generated _MAX value
-    enum_members = members + [QAPISchemaEnumMember('_MAX', None)]
+    enum_members = members + [
+        QAPISchemaEnumMember('_MAX', QAPISourceInfo.builtin())]
 
     ret = mcgen('''
 
@@ -306,7 +307,7 @@ def _gen_type_cleanup(self, name: str) -> None:
 
     def visit_enum_type(self,
                         name: str,
-                        info: Optional[QAPISourceInfo],
+                        info: QAPISourceInfo,
                         ifcond: List[str],
                         features: List[QAPISchemaFeature],
                         members: List[QAPISchemaEnumMember],
@@ -317,7 +318,7 @@ def visit_enum_type(self,
 
     def visit_array_type(self,
                          name: str,
-                         info: Optional[QAPISourceInfo],
+                         info: QAPISourceInfo,
                          ifcond: List[str],
                          element_type: QAPISchemaType) -> None:
         with ifcontext(ifcond, self._genh, self._genc):
@@ -327,7 +328,7 @@ def visit_array_type(self,
 
     def visit_object_type(self,
                           name: str,
-                          info: Optional[QAPISourceInfo],
+                          info: QAPISourceInfo,
                           ifcond: List[str],
                           features: List[QAPISchemaFeature],
                           base: Optional[QAPISchemaObjectType],
diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
index 339f1521524..3f49c307c56 100644
--- a/scripts/qapi/visit.py
+++ b/scripts/qapi/visit.py
@@ -336,7 +336,7 @@ def _begin_user_module(self, name: str) -> None:
 
     def visit_enum_type(self,
                         name: str,
-                        info: QAPISourceInfo,
+                        info: Optional[QAPISourceInfo],
                         ifcond: List[str],
                         features: List[QAPISchemaFeature],
                         members: List[QAPISchemaEnumMember],
@@ -347,7 +347,7 @@ def visit_enum_type(self,
 
     def visit_array_type(self,
                          name: str,
-                         info: Optional[QAPISourceInfo],
+                         info: QAPISourceInfo,
                          ifcond: List[str],
                          element_type: QAPISchemaType) -> None:
         with ifcontext(ifcond, self._genh, self._genc):
@@ -356,7 +356,7 @@ def visit_array_type(self,
 
     def visit_object_type(self,
                           name: str,
-                          info: Optional[QAPISourceInfo],
+                          info: QAPISourceInfo,
                           ifcond: List[str],
                           features: List[QAPISchemaFeature],
                           base: Optional[QAPISchemaObjectType],
-- 
2.26.2


