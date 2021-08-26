Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCCF3F87DA
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 14:45:16 +0200 (CEST)
Received: from localhost ([::1]:41390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJEkt-0001zh-Uk
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 08:45:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJEYq-0004Au-6F
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 08:32:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJEYh-0008Bj-Tx
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 08:32:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629981155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TeXbrMH6GEOkczvD8QINt/Y6SSvMVYn4yrLCzZqfwos=;
 b=QJFRE3ZZJVWAyHNdwBxXM/8PkZM2u12lpcDEUehR/Jp9noGJ38euOyZLLJBHuXPWz+Y2QA
 F3Mrtd7J5WHws7nCzfZacp+18Mpt6lpZTBn0nCNKX3gX5IEEaKvKrnZO4hMQswGqoH52Y7
 ppMXJK3i8l+6g6ahohCg/7s5tLDYr6w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-gYOX21jMOyGsp2unctN_GA-1; Thu, 26 Aug 2021 08:32:33 -0400
X-MC-Unique: gYOX21jMOyGsp2unctN_GA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B08A41966323;
 Thu, 26 Aug 2021 12:32:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BCD76604CC;
 Thu, 26 Aug 2021 12:32:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id ADFAB11380BA; Thu, 26 Aug 2021 14:32:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/11] qapi: replace if condition list with dict {'all': [...]}
Date: Thu, 26 Aug 2021 14:32:21 +0200
Message-Id: <20210826123225.157891-8-armbru@redhat.com>
In-Reply-To: <20210826123225.157891-1-armbru@redhat.com>
References: <20210826123225.157891-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.742, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Replace the simple list sugar form with a recursive structure that will
accept other operators in the following commits (all, any or not).

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210804083105.97531-7-marcandre.lureau@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
[Accidental code motion undone.  Degenerate :forms: comment dropped.
Helper _check_if() moved.  Error messages tweaked.  ui.json updated.
Accidental changes to qapi-schema-test.json dropped.]
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/ui.json                                  |  6 +-
 scripts/qapi/common.py                        | 23 +++++--
 scripts/qapi/expr.py                          | 64 +++++++++++--------
 scripts/qapi/schema.py                        |  2 +-
 tests/qapi-schema/bad-if-all.err              |  2 +
 tests/qapi-schema/bad-if-all.json             |  3 +
 tests/qapi-schema/bad-if-all.out              |  0
 tests/qapi-schema/bad-if-empty-list.json      |  2 +-
 tests/qapi-schema/bad-if-key.err              |  3 +
 tests/qapi-schema/bad-if-key.json             |  3 +
 tests/qapi-schema/bad-if-key.out              |  0
 tests/qapi-schema/bad-if-keys.err             |  2 +
 tests/qapi-schema/bad-if-keys.json            |  3 +
 tests/qapi-schema/bad-if-keys.out             |  0
 tests/qapi-schema/bad-if-list.json            |  2 +-
 tests/qapi-schema/bad-if.err                  |  2 +-
 tests/qapi-schema/bad-if.json                 |  2 +-
 tests/qapi-schema/doc-good.json               |  3 +-
 tests/qapi-schema/doc-good.out                | 13 ++--
 tests/qapi-schema/doc-good.txt                |  6 ++
 tests/qapi-schema/enum-if-invalid.err         |  3 +-
 tests/qapi-schema/features-if-invalid.err     |  2 +-
 tests/qapi-schema/meson.build                 |  3 +
 tests/qapi-schema/qapi-schema-test.json       | 20 +++---
 tests/qapi-schema/qapi-schema-test.out        | 58 ++++++++---------
 .../qapi-schema/struct-member-if-invalid.err  |  2 +-
 .../qapi-schema/union-branch-if-invalid.json  |  2 +-
 27 files changed, 143 insertions(+), 88 deletions(-)
 create mode 100644 tests/qapi-schema/bad-if-all.err
 create mode 100644 tests/qapi-schema/bad-if-all.json
 create mode 100644 tests/qapi-schema/bad-if-all.out
 create mode 100644 tests/qapi-schema/bad-if-key.err
 create mode 100644 tests/qapi-schema/bad-if-key.json
 create mode 100644 tests/qapi-schema/bad-if-key.out
 create mode 100644 tests/qapi-schema/bad-if-keys.err
 create mode 100644 tests/qapi-schema/bad-if-keys.json
 create mode 100644 tests/qapi-schema/bad-if-keys.out

diff --git a/qapi/ui.json b/qapi/ui.json
index fd9677d48e..aed2bec4ab 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1136,7 +1136,8 @@
     { 'name': 'gtk', 'if': 'defined(CONFIG_GTK)' },
     { 'name': 'sdl', 'if': 'defined(CONFIG_SDL)' },
     { 'name': 'egl-headless',
-              'if': 'defined(CONFIG_OPENGL) && defined(CONFIG_GBM)' },
+              'if': { 'all': [ 'defined(CONFIG_OPENGL)',
+                               'defined(CONFIG_GBM)' ] } },
     { 'name': 'curses', 'if': 'defined(CONFIG_CURSES)' },
     { 'name': 'cocoa', 'if': 'defined(CONFIG_COCOA)' },
     { 'name': 'spice-app', 'if': 'defined(CONFIG_SPICE)'} ] }
@@ -1167,7 +1168,8 @@
       'gtk': { 'type': 'DisplayGTK', 'if': 'defined(CONFIG_GTK)' },
       'curses': { 'type': 'DisplayCurses', 'if': 'defined(CONFIG_CURSES)' },
       'egl-headless': { 'type': 'DisplayEGLHeadless',
-                        'if': 'defined(CONFIG_OPENGL) && defined(CONFIG_GBM)' }
+                        'if': { 'all': [ 'defined(CONFIG_OPENGL)',
+                                         'defined(CONFIG_GBM)' ] } }
   }
 }
 
diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index ddc54e4368..3d7272a702 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -13,7 +13,8 @@
 
 import re
 from typing import (
-    List,
+    Any,
+    Dict,
     Match,
     Optional,
     Union,
@@ -199,17 +200,29 @@ def guardend(name: str) -> str:
                  name=c_fname(name).upper())
 
 
-def cgen_ifcond(ifcond: Union[str, List[str]]) -> str:
+def cgen_ifcond(ifcond: Union[str, Dict[str, Any]]) -> str:
     if not ifcond:
         return ''
-    return '(' + ') && ('.join(ifcond) + ')'
+    if isinstance(ifcond, str):
+        return ifcond
+
+    oper, operands = next(iter(ifcond.items()))
+    oper = {'all': '&&'}[oper]
+    operands = [cgen_ifcond(o) for o in operands]
+    return '(' + (') ' + oper + ' (').join(operands) + ')'
 
 
-def docgen_ifcond(ifcond: Union[str, List[str]]) -> str:
+def docgen_ifcond(ifcond: Union[str, Dict[str, Any]]) -> str:
     # TODO Doc generated for conditions needs polish
     if not ifcond:
         return ''
-    return ' and '.join(ifcond)
+    if isinstance(ifcond, str):
+        return ifcond
+
+    oper, operands = next(iter(ifcond.items()))
+    oper = {'all': ' and '}[oper]
+    operands = [docgen_ifcond(o) for o in operands]
+    return '(' + oper.join(operands) + ')'
 
 
 def gen_if(cond: str) -> str:
diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index cf98923fa6..d7a34655a7 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -259,14 +259,9 @@ def check_flags(expr: _JSONObject, info: QAPISourceInfo) -> None:
 
 def check_if(expr: _JSONObject, info: QAPISourceInfo, source: str) -> None:
     """
-    Normalize and validate the ``if`` member of an object.
+    Validate the ``if`` member of an object.
 
-    The ``if`` member may be either a ``str`` or a ``List[str]``.
-    A ``str`` value will be normalized to ``List[str]``.
-
-    :forms:
-      :sugared: ``Union[str, List[str]]``
-      :canonical: ``List[str]``
+    The ``if`` member may be either a ``str`` or a dict.
 
     :param expr: The expression containing the ``if`` member to validate.
     :param info: QAPI schema source file information.
@@ -275,31 +270,46 @@ def check_if(expr: _JSONObject, info: QAPISourceInfo, source: str) -> None:
     :raise QAPISemError:
         When the "if" member fails validation, or when there are no
         non-empty conditions.
-    :return: None, ``expr`` is normalized in-place as needed.
+    :return: None
     """
+
+    def _check_if(cond: Union[str, object]) -> None:
+        if isinstance(cond, str):
+            if not cond.strip():
+                raise QAPISemError(
+                    info,
+                    "'if' condition '%s' of %s makes no sense"
+                    % (cond, source))
+            return
+
+        if not isinstance(cond, dict):
+            raise QAPISemError(
+                info,
+                "'if' condition of %s must be a string or an object" % source)
+        if len(cond) != 1:
+            raise QAPISemError(
+                info,
+                "'if' condition dict of %s must have one key: "
+                "'all'" % source)
+        check_keys(cond, info, "'if' condition", [],
+                   ["all"])
+
+        oper, operands = next(iter(cond.items()))
+        if not operands:
+            raise QAPISemError(
+                info, "'if' condition [] of %s is useless" % source)
+
+        if oper in ("all") and not isinstance(operands, list):
+            raise QAPISemError(
+                info, "'%s' condition of %s must be an array" % (oper, source))
+        for operand in operands:
+            _check_if(operand)
+
     ifcond = expr.get('if')
     if ifcond is None:
         return
 
-    if isinstance(ifcond, list):
-        if not ifcond:
-            raise QAPISemError(
-                info, "'if' condition [] of %s is useless" % source)
-    else:
-        # Normalize to a list
-        ifcond = expr['if'] = [ifcond]
-
-    for elt in ifcond:
-        if not isinstance(elt, str):
-            raise QAPISemError(
-                info,
-                "'if' condition of %s must be a string or a list of strings"
-                % source)
-        if not elt.strip():
-            raise QAPISemError(
-                info,
-                "'if' condition '%s' of %s makes no sense"
-                % (elt, source))
+    _check_if(ifcond)
 
 
 def normalize_members(members: object) -> None:
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index a9345af7b7..229d24fce9 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -32,7 +32,7 @@
 
 class QAPISchemaIfCond:
     def __init__(self, ifcond=None):
-        self.ifcond = ifcond or []
+        self.ifcond = ifcond or {}
 
     def cgen(self):
         return cgen_ifcond(self.ifcond)
diff --git a/tests/qapi-schema/bad-if-all.err b/tests/qapi-schema/bad-if-all.err
new file mode 100644
index 0000000000..a04f6e7043
--- /dev/null
+++ b/tests/qapi-schema/bad-if-all.err
@@ -0,0 +1,2 @@
+bad-if-all.json: In struct 'TestIfStruct':
+bad-if-all.json:2: 'all' condition of struct must be an array
diff --git a/tests/qapi-schema/bad-if-all.json b/tests/qapi-schema/bad-if-all.json
new file mode 100644
index 0000000000..44837d3981
--- /dev/null
+++ b/tests/qapi-schema/bad-if-all.json
@@ -0,0 +1,3 @@
+# check 'if all' is not a list
+{ 'struct': 'TestIfStruct', 'data': { 'foo': 'int' },
+  'if': { 'all': 'ALL' } }
diff --git a/tests/qapi-schema/bad-if-all.out b/tests/qapi-schema/bad-if-all.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/bad-if-empty-list.json b/tests/qapi-schema/bad-if-empty-list.json
index 94f2eb8670..b62b5671df 100644
--- a/tests/qapi-schema/bad-if-empty-list.json
+++ b/tests/qapi-schema/bad-if-empty-list.json
@@ -1,3 +1,3 @@
 # check empty 'if' list
 { 'struct': 'TestIfStruct', 'data': { 'foo': 'int' },
-  'if': [] }
+  'if': { 'all': [] } }
diff --git a/tests/qapi-schema/bad-if-key.err b/tests/qapi-schema/bad-if-key.err
new file mode 100644
index 0000000000..725d5abae5
--- /dev/null
+++ b/tests/qapi-schema/bad-if-key.err
@@ -0,0 +1,3 @@
+bad-if-key.json: In struct 'TestIfStruct':
+bad-if-key.json:2: 'if' condition has unknown key 'value'
+Valid keys are 'all'.
diff --git a/tests/qapi-schema/bad-if-key.json b/tests/qapi-schema/bad-if-key.json
new file mode 100644
index 0000000000..64c74c13f2
--- /dev/null
+++ b/tests/qapi-schema/bad-if-key.json
@@ -0,0 +1,3 @@
+# check unknown 'if' dict key
+{ 'struct': 'TestIfStruct', 'data': { 'foo': 'int' },
+  'if': { 'value': 'defined(TEST_IF_STRUCT)' } }
diff --git a/tests/qapi-schema/bad-if-key.out b/tests/qapi-schema/bad-if-key.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/bad-if-keys.err b/tests/qapi-schema/bad-if-keys.err
new file mode 100644
index 0000000000..b072db9a6f
--- /dev/null
+++ b/tests/qapi-schema/bad-if-keys.err
@@ -0,0 +1,2 @@
+bad-if-keys.json: In struct 'TestIfStruct':
+bad-if-keys.json:2: 'if' condition dict of struct must have one key: 'all'
diff --git a/tests/qapi-schema/bad-if-keys.json b/tests/qapi-schema/bad-if-keys.json
new file mode 100644
index 0000000000..9e2f39ae21
--- /dev/null
+++ b/tests/qapi-schema/bad-if-keys.json
@@ -0,0 +1,3 @@
+# check multiple 'if' keys
+{ 'struct': 'TestIfStruct', 'data': { 'foo': 'int' },
+  'if': { 'any': ['ANY'], 'all': ['ALL'] } }
diff --git a/tests/qapi-schema/bad-if-keys.out b/tests/qapi-schema/bad-if-keys.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/bad-if-list.json b/tests/qapi-schema/bad-if-list.json
index ea3d95bb6b..1fefef16a7 100644
--- a/tests/qapi-schema/bad-if-list.json
+++ b/tests/qapi-schema/bad-if-list.json
@@ -1,3 +1,3 @@
 # check invalid 'if' content
 { 'struct': 'TestIfStruct', 'data': { 'foo': 'int' },
-  'if': ['foo', ' '] }
+  'if': { 'all': ['foo', ' '] } }
diff --git a/tests/qapi-schema/bad-if.err b/tests/qapi-schema/bad-if.err
index f83dee65da..ec373b213f 100644
--- a/tests/qapi-schema/bad-if.err
+++ b/tests/qapi-schema/bad-if.err
@@ -1,2 +1,2 @@
 bad-if.json: In struct 'TestIfStruct':
-bad-if.json:2: 'if' condition of struct must be a string or a list of strings
+bad-if.json:2: 'if' condition of struct must be a string or an object
diff --git a/tests/qapi-schema/bad-if.json b/tests/qapi-schema/bad-if.json
index 3edd1a0bf2..fdc0c87bb3 100644
--- a/tests/qapi-schema/bad-if.json
+++ b/tests/qapi-schema/bad-if.json
@@ -1,3 +1,3 @@
 # check invalid 'if' type
 { 'struct': 'TestIfStruct', 'data': { 'foo': 'int' },
-  'if': { 'value': 'defined(TEST_IF_STRUCT)' } }
+  'if': ['defined(TEST_IF_STRUCT)'] }
diff --git a/tests/qapi-schema/doc-good.json b/tests/qapi-schema/doc-good.json
index 423ea23e07..25b1053e8a 100644
--- a/tests/qapi-schema/doc-good.json
+++ b/tests/qapi-schema/doc-good.json
@@ -70,7 +70,8 @@
 # @base1:
 # the first member
 ##
-{ 'struct': 'Base', 'data': { 'base1': 'Enum' } }
+{ 'struct': 'Base', 'data': { 'base1': 'Enum' },
+  'if': { 'all': ['IFALL1', 'IFALL2'] } }
 
 ##
 # @Variant1:
diff --git a/tests/qapi-schema/doc-good.out b/tests/qapi-schema/doc-good.out
index 8f54ceff2e..689d084f3a 100644
--- a/tests/qapi-schema/doc-good.out
+++ b/tests/qapi-schema/doc-good.out
@@ -12,15 +12,16 @@ enum QType
 module doc-good.json
 enum Enum
     member one
-        if ['defined(IFONE)']
+        if defined(IFONE)
     member two
-    if ['defined(IFCOND)']
+    if defined(IFCOND)
     feature enum-feat
 object Base
     member base1: Enum optional=False
+    if OrderedDict([('all', ['IFALL1', 'IFALL2'])])
 object Variant1
     member var1: str optional=False
-        if ['defined(IFSTR)']
+        if defined(IFSTR)
         feature member-feat
     feature variant1-feat
 object Variant2
@@ -29,7 +30,7 @@ object Object
     tag base1
     case one: Variant1
     case two: Variant2
-        if ['IFTWO']
+        if IFTWO
     feature union-feat1
 object q_obj_Variant1-wrapper
     member data: Variant1 optional=False
@@ -38,13 +39,13 @@ object q_obj_Variant2-wrapper
 enum SugaredUnionKind
     member one
     member two
-        if ['IFTWO']
+        if IFTWO
 object SugaredUnion
     member type: SugaredUnionKind optional=False
     tag type
     case one: q_obj_Variant1-wrapper
     case two: q_obj_Variant2-wrapper
-        if ['IFTWO']
+        if IFTWO
     feature union-feat2
 alternate Alternate
     tag type
diff --git a/tests/qapi-schema/doc-good.txt b/tests/qapi-schema/doc-good.txt
index 726727af74..4490108cb7 100644
--- a/tests/qapi-schema/doc-good.txt
+++ b/tests/qapi-schema/doc-good.txt
@@ -76,6 +76,12 @@ Members
    the first member
 
 
+If
+~~
+
+"(IFALL1 and IFALL2)"
+
+
 "Variant1" (Object)
 -------------------
 
diff --git a/tests/qapi-schema/enum-if-invalid.err b/tests/qapi-schema/enum-if-invalid.err
index 0556dc967b..df305cd79f 100644
--- a/tests/qapi-schema/enum-if-invalid.err
+++ b/tests/qapi-schema/enum-if-invalid.err
@@ -1,2 +1,3 @@
 enum-if-invalid.json: In enum 'TestIfEnum':
-enum-if-invalid.json:2: 'if' condition of 'data' member 'bar' must be a string or a list of strings
+enum-if-invalid.json:2: 'if' condition has unknown key 'val'
+Valid keys are 'all'.
diff --git a/tests/qapi-schema/features-if-invalid.err b/tests/qapi-schema/features-if-invalid.err
index f63b89535e..0ce7b6fcdf 100644
--- a/tests/qapi-schema/features-if-invalid.err
+++ b/tests/qapi-schema/features-if-invalid.err
@@ -1,2 +1,2 @@
 features-if-invalid.json: In struct 'Stru':
-features-if-invalid.json:2: 'if' condition of 'features' member 'f' must be a string or a list of strings
+features-if-invalid.json:2: 'if' condition of 'features' member 'f' must be a string or an object
diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index b8de58116a..4697c070bc 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -37,8 +37,11 @@ schemas = [
   'bad-data.json',
   'bad-ident.json',
   'bad-if.json',
+  'bad-if-all.json',
   'bad-if-empty.json',
   'bad-if-empty-list.json',
+  'bad-if-key.json',
+  'bad-if-keys.json',
   'bad-if-list.json',
   'bad-type-bool.json',
   'bad-type-dict.json',
diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
index 84b9d41f15..e85a71c0f7 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -232,7 +232,7 @@
 { 'union': 'TestIfUnion', 'data':
   { 'foo': 'TestStruct',
     'bar': { 'type': 'str', 'if': 'defined(TEST_IF_UNION_BAR)'} },
-  'if': 'defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT)' }
+  'if': { 'all': ['defined(TEST_IF_UNION)', 'defined(TEST_IF_STRUCT)'] } }
 
 { 'command': 'test-if-union-cmd',
   'data': { 'union-cmd-arg': 'TestIfUnion' },
@@ -241,25 +241,25 @@
 { 'alternate': 'TestIfAlternate', 'data':
   { 'foo': 'int',
     'bar': { 'type': 'TestStruct', 'if': 'defined(TEST_IF_ALT_BAR)'} },
-  'if': 'defined(TEST_IF_ALT) && defined(TEST_IF_STRUCT)' }
+  'if': { 'all': ['defined(TEST_IF_ALT)', 'defined(TEST_IF_STRUCT)'] } }
 
 { 'command': 'test-if-alternate-cmd',
   'data': { 'alt-cmd-arg': 'TestIfAlternate' },
-  'if': 'defined(TEST_IF_ALT)' }
+  'if': { 'all': ['defined(TEST_IF_ALT)'] } }
 
 { 'command': 'test-if-cmd',
   'data': {
     'foo': 'TestIfStruct',
     'bar': { 'type': 'TestIfEnum', 'if': 'defined(TEST_IF_CMD_BAR)' } },
   'returns': 'UserDefThree',
-  'if': ['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)'] }
+  'if': { 'all': ['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)'] } }
 
 { 'command': 'test-cmd-return-def-three', 'returns': 'UserDefThree' }
 
 { 'event': 'TEST_IF_EVENT', 'data':
   { 'foo': 'TestIfStruct',
     'bar': { 'type': ['TestIfEnum'], 'if': 'defined(TEST_IF_EVT_BAR)' } },
-  'if': 'defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)' }
+  'if': { 'all': ['defined(TEST_IF_EVT)', 'defined(TEST_IF_STRUCT)'] } }
 
 # test 'features'
 
@@ -288,8 +288,9 @@
                 { 'name': 'feature2', 'if': 'defined(TEST_IF_FEATURE_2)'} ] }
 { 'struct': 'CondFeatureStruct3',
   'data': { 'foo': 'int' },
-  'features': [ { 'name': 'feature1', 'if': [ 'defined(TEST_IF_COND_1)',
-                                              'defined(TEST_IF_COND_2)'] } ] }
+  'features': [ { 'name': 'feature1',
+                  'if': { 'all': [ 'defined(TEST_IF_COND_1)',
+                                   'defined(TEST_IF_COND_2)'] } } ] }
 
 { 'enum': 'FeatureEnum1',
   'data': [ 'eins', 'zwei', 'drei' ],
@@ -328,8 +329,9 @@
   'features': [ { 'name': 'feature1', 'if': 'defined(TEST_IF_FEATURE_1)'},
                 { 'name': 'feature2', 'if': 'defined(TEST_IF_FEATURE_2)'} ] }
 { 'command': 'test-command-cond-features3',
-  'features': [ { 'name': 'feature1', 'if': [ 'defined(TEST_IF_COND_1)',
-                                              'defined(TEST_IF_COND_2)'] } ] }
+  'features': [ { 'name': 'feature1',
+                  'if': { 'all': [ 'defined(TEST_IF_COND_1)',
+                                   'defined(TEST_IF_COND_2)'] } } ] }
 
 { 'event': 'TEST_EVENT_FEATURES0',
   'data': 'FeatureStruct1' }
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index e0b8a5f0b6..e74756cfd8 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -298,65 +298,65 @@ command __org.qemu_x-command q_obj___org.qemu_x-command-arg -> __org.qemu_x-Unio
 object TestIfStruct
     member foo: int optional=False
     member bar: int optional=False
-        if ['defined(TEST_IF_STRUCT_BAR)']
-    if ['defined(TEST_IF_STRUCT)']
+        if defined(TEST_IF_STRUCT_BAR)
+    if defined(TEST_IF_STRUCT)
 enum TestIfEnum
     member foo
     member bar
-        if ['defined(TEST_IF_ENUM_BAR)']
-    if ['defined(TEST_IF_ENUM)']
+        if defined(TEST_IF_ENUM_BAR)
+    if defined(TEST_IF_ENUM)
 object q_obj_TestStruct-wrapper
     member data: TestStruct optional=False
 enum TestIfUnionKind
     member foo
     member bar
-        if ['defined(TEST_IF_UNION_BAR)']
-    if ['defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT)']
+        if defined(TEST_IF_UNION_BAR)
+    if OrderedDict([('all', ['defined(TEST_IF_UNION)', 'defined(TEST_IF_STRUCT)'])])
 object TestIfUnion
     member type: TestIfUnionKind optional=False
     tag type
     case foo: q_obj_TestStruct-wrapper
     case bar: q_obj_str-wrapper
-        if ['defined(TEST_IF_UNION_BAR)']
-    if ['defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT)']
+        if defined(TEST_IF_UNION_BAR)
+    if OrderedDict([('all', ['defined(TEST_IF_UNION)', 'defined(TEST_IF_STRUCT)'])])
 object q_obj_test-if-union-cmd-arg
     member union-cmd-arg: TestIfUnion optional=False
-    if ['defined(TEST_IF_UNION)']
+    if defined(TEST_IF_UNION)
 command test-if-union-cmd q_obj_test-if-union-cmd-arg -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
-    if ['defined(TEST_IF_UNION)']
+    if defined(TEST_IF_UNION)
 alternate TestIfAlternate
     tag type
     case foo: int
     case bar: TestStruct
-        if ['defined(TEST_IF_ALT_BAR)']
-    if ['defined(TEST_IF_ALT) && defined(TEST_IF_STRUCT)']
+        if defined(TEST_IF_ALT_BAR)
+    if OrderedDict([('all', ['defined(TEST_IF_ALT)', 'defined(TEST_IF_STRUCT)'])])
 object q_obj_test-if-alternate-cmd-arg
     member alt-cmd-arg: TestIfAlternate optional=False
-    if ['defined(TEST_IF_ALT)']
+    if OrderedDict([('all', ['defined(TEST_IF_ALT)'])])
 command test-if-alternate-cmd q_obj_test-if-alternate-cmd-arg -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
-    if ['defined(TEST_IF_ALT)']
+    if OrderedDict([('all', ['defined(TEST_IF_ALT)'])])
 object q_obj_test-if-cmd-arg
     member foo: TestIfStruct optional=False
     member bar: TestIfEnum optional=False
-        if ['defined(TEST_IF_CMD_BAR)']
-    if ['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)']
+        if defined(TEST_IF_CMD_BAR)
+    if OrderedDict([('all', ['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)'])])
 command test-if-cmd q_obj_test-if-cmd-arg -> UserDefThree
     gen=True success_response=True boxed=False oob=False preconfig=False
-    if ['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)']
+    if OrderedDict([('all', ['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)'])])
 command test-cmd-return-def-three None -> UserDefThree
     gen=True success_response=True boxed=False oob=False preconfig=False
 array TestIfEnumList TestIfEnum
-    if ['defined(TEST_IF_ENUM)']
+    if defined(TEST_IF_ENUM)
 object q_obj_TEST_IF_EVENT-arg
     member foo: TestIfStruct optional=False
     member bar: TestIfEnumList optional=False
-        if ['defined(TEST_IF_EVT_BAR)']
-    if ['defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)']
+        if defined(TEST_IF_EVT_BAR)
+    if OrderedDict([('all', ['defined(TEST_IF_EVT)', 'defined(TEST_IF_STRUCT)'])])
 event TEST_IF_EVENT q_obj_TEST_IF_EVENT-arg
     boxed=False
-    if ['defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)']
+    if OrderedDict([('all', ['defined(TEST_IF_EVT)', 'defined(TEST_IF_STRUCT)'])])
 object FeatureStruct0
     member foo: int optional=False
 object FeatureStruct1
@@ -379,17 +379,17 @@ object FeatureStruct4
 object CondFeatureStruct1
     member foo: int optional=False
     feature feature1
-        if ['defined(TEST_IF_FEATURE_1)']
+        if defined(TEST_IF_FEATURE_1)
 object CondFeatureStruct2
     member foo: int optional=False
     feature feature1
-        if ['defined(TEST_IF_FEATURE_1)']
+        if defined(TEST_IF_FEATURE_1)
     feature feature2
-        if ['defined(TEST_IF_FEATURE_2)']
+        if defined(TEST_IF_FEATURE_2)
 object CondFeatureStruct3
     member foo: int optional=False
     feature feature1
-        if ['defined(TEST_IF_COND_1)', 'defined(TEST_IF_COND_2)']
+        if OrderedDict([('all', ['defined(TEST_IF_COND_1)', 'defined(TEST_IF_COND_2)'])])
 enum FeatureEnum1
     member eins
     member zwei
@@ -429,17 +429,17 @@ command test-command-features3 None -> None
 command test-command-cond-features1 None -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
     feature feature1
-        if ['defined(TEST_IF_FEATURE_1)']
+        if defined(TEST_IF_FEATURE_1)
 command test-command-cond-features2 None -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
     feature feature1
-        if ['defined(TEST_IF_FEATURE_1)']
+        if defined(TEST_IF_FEATURE_1)
     feature feature2
-        if ['defined(TEST_IF_FEATURE_2)']
+        if defined(TEST_IF_FEATURE_2)
 command test-command-cond-features3 None -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
     feature feature1
-        if ['defined(TEST_IF_COND_1)', 'defined(TEST_IF_COND_2)']
+        if OrderedDict([('all', ['defined(TEST_IF_COND_1)', 'defined(TEST_IF_COND_2)'])])
 event TEST_EVENT_FEATURES0 FeatureStruct1
     boxed=False
 event TEST_EVENT_FEATURES1 None
diff --git a/tests/qapi-schema/struct-member-if-invalid.err b/tests/qapi-schema/struct-member-if-invalid.err
index 42e7fdae3c..5ee08afa41 100644
--- a/tests/qapi-schema/struct-member-if-invalid.err
+++ b/tests/qapi-schema/struct-member-if-invalid.err
@@ -1,2 +1,2 @@
 struct-member-if-invalid.json: In struct 'Stru':
-struct-member-if-invalid.json:2: 'if' condition of 'data' member 'member' must be a string or a list of strings
+struct-member-if-invalid.json:2: 'if' condition of 'data' member 'member' must be a string or an object
diff --git a/tests/qapi-schema/union-branch-if-invalid.json b/tests/qapi-schema/union-branch-if-invalid.json
index 46d4239af6..c41633856f 100644
--- a/tests/qapi-schema/union-branch-if-invalid.json
+++ b/tests/qapi-schema/union-branch-if-invalid.json
@@ -3,4 +3,4 @@
 { 'struct': 'Stru', 'data': { 'member': 'str' } }
 { 'union': 'Uni',
   'base': { 'tag': 'Branches' }, 'discriminator': 'tag',
-  'data': { 'branch1': { 'type': 'Stru', 'if': [''] } } }
+  'data': { 'branch1': { 'type': 'Stru', 'if': { 'all': [''] } } } }
-- 
2.31.1


