Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 556216910B4
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 19:49:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQBxp-0007Va-Oi; Thu, 09 Feb 2023 13:48:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pQBxm-0007Tz-HG
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 13:48:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pQBxi-0005U1-HX
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 13:48:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675968481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YNM0JtiWvyyHUv0eCoqGMWZxLI+xV7+1AS1IwYoUuK8=;
 b=hZPm02mLpprzYWegysw92MGr1ZZbeO3CcAt4Hsqljl155AH3H+joo+FxirtqP5DSDLhnj1
 9zj9pbrtgT+VEd2yi+99iUl/hDOyYYMk1r5Fe0xQ4xvAMYTX+wbb2J9EugcKpGFGgVrk3J
 pEf2pSxhbcG1RSD6WTNS+a0q37jrpFI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-xYc4PRaiNvqW7BMyiaAG0w-1; Thu, 09 Feb 2023 13:48:00 -0500
X-MC-Unique: xYc4PRaiNvqW7BMyiaAG0w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D34987B2A6;
 Thu,  9 Feb 2023 18:48:00 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E15F6492C3E;
 Thu,  9 Feb 2023 18:47:59 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH v3 5/7] qapi/parser: add QAPIExpression type
Date: Thu,  9 Feb 2023 13:47:56 -0500
Message-Id: <20230209184758.1017863-6-jsnow@redhat.com>
In-Reply-To: <20230209184758.1017863-1-jsnow@redhat.com>
References: <20230209184758.1017863-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

This patch creates a new type, QAPIExpression, which represents a parsed
expression complete with QAPIDoc and QAPISourceInfo.

This patch turns parser.exprs into a list of QAPIExpression instead,
and adjusts expr.py to match.

This allows the types we specify in parser.py to be "remembered" all the
way through expr.py and into schema.py. Several assertions around
packing and unpacking this data can be removed as a result.

NB: This necessitates a change of typing for check_if() and
check_keys(), because mypy does not believe UserDict[str, object] ⊆
Dict[str, object]. It will, however, accept Mapping or
MutableMapping. In this case, the immutable form is preferred as an
input parameter because we don't actually mutate the input.

Without this change, we will observe:
qapi/expr.py:631: error: Argument 1 to "check_keys" has incompatible
type "QAPIExpression"; expected "Dict[str, object]"

NB2: Python 3.6 has an oversight for typing UserDict that makes it
impossible to type for both runtime and analysis time. The problem is
described in detail at https://github.com/python/typing/issues/60 - this
workaround can be safely removed when 3.7 is our minimum version.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/expr.py   | 89 +++++++++++++++++-------------------------
 scripts/qapi/parser.py | 54 ++++++++++++++++---------
 scripts/qapi/schema.py | 72 ++++++++++++++++++----------------
 3 files changed, 110 insertions(+), 105 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index af802367eff..01cfc13fc3a 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -34,9 +34,9 @@
 import re
 from typing import (
     Collection,
-    Dict,
     Iterable,
     List,
+    Mapping,
     Optional,
     Union,
     cast,
@@ -44,7 +44,7 @@
 
 from .common import c_name
 from .error import QAPISemError
-from .parser import QAPIDoc
+from .parser import QAPIExpression
 from .source import QAPISourceInfo
 
 
@@ -53,7 +53,7 @@
 # here (and also not practical as long as mypy lacks recursive
 # types), because the purpose of this module is to interrogate that
 # type.
-_JSONObject = Dict[str, object]
+_JSONObject = Mapping[str, object]
 
 
 # See check_name_str(), below.
@@ -229,12 +229,11 @@ def pprint(elems: Iterable[str]) -> str:
                pprint(unknown), pprint(allowed)))
 
 
-def check_flags(expr: _JSONObject, info: QAPISourceInfo) -> None:
+def check_flags(expr: QAPIExpression) -> None:
     """
     Ensure flag members (if present) have valid values.
 
     :param expr: The expression to validate.
-    :param info: QAPI schema source file information.
 
     :raise QAPISemError:
         When certain flags have an invalid value, or when
@@ -243,18 +242,18 @@ def check_flags(expr: _JSONObject, info: QAPISourceInfo) -> None:
     for key in ('gen', 'success-response'):
         if key in expr and expr[key] is not False:
             raise QAPISemError(
-                info, "flag '%s' may only use false value" % key)
+                expr.info, "flag '%s' may only use false value" % key)
     for key in ('boxed', 'allow-oob', 'allow-preconfig', 'coroutine'):
         if key in expr and expr[key] is not True:
             raise QAPISemError(
-                info, "flag '%s' may only use true value" % key)
+                expr.info, "flag '%s' may only use true value" % key)
     if 'allow-oob' in expr and 'coroutine' in expr:
         # This is not necessarily a fundamental incompatibility, but
         # we don't have a use case and the desired semantics isn't
         # obvious.  The simplest solution is to forbid it until we get
         # a use case for it.
-        raise QAPISemError(info, "flags 'allow-oob' and 'coroutine' "
-                                 "are incompatible")
+        raise QAPISemError(
+            expr.info, "flags 'allow-oob' and 'coroutine' are incompatible")
 
 
 def check_if(expr: _JSONObject, info: QAPISourceInfo, source: str) -> None:
@@ -447,12 +446,11 @@ def check_features(features: Optional[object],
         check_if(feat, info, source)
 
 
-def check_enum(expr: _JSONObject, info: QAPISourceInfo) -> None:
+def check_enum(expr: QAPIExpression) -> None:
     """
     Normalize and validate this expression as an ``enum`` definition.
 
     :param expr: The expression to validate.
-    :param info: QAPI schema source file information.
 
     :raise QAPISemError: When ``expr`` is not a valid ``enum``.
     :return: None, ``expr`` is normalized in-place as needed.
@@ -460,6 +458,7 @@ def check_enum(expr: _JSONObject, info: QAPISourceInfo) -> None:
     name = expr['enum']
     members = expr['data']
     prefix = expr.get('prefix')
+    info = expr.info
 
     if not isinstance(members, list):
         raise QAPISemError(info, "'data' must be an array")
@@ -486,12 +485,11 @@ def check_enum(expr: _JSONObject, info: QAPISourceInfo) -> None:
         check_features(member.get('features'), info)
 
 
-def check_struct(expr: _JSONObject, info: QAPISourceInfo) -> None:
+def check_struct(expr: QAPIExpression) -> None:
     """
     Normalize and validate this expression as a ``struct`` definition.
 
     :param expr: The expression to validate.
-    :param info: QAPI schema source file information.
 
     :raise QAPISemError: When ``expr`` is not a valid ``struct``.
     :return: None, ``expr`` is normalized in-place as needed.
@@ -499,16 +497,15 @@ def check_struct(expr: _JSONObject, info: QAPISourceInfo) -> None:
     name = cast(str, expr['struct'])  # Checked in check_exprs
     members = expr['data']
 
-    check_type(members, info, "'data'", allow_dict=name)
-    check_type(expr.get('base'), info, "'base'")
+    check_type(members, expr.info, "'data'", allow_dict=name)
+    check_type(expr.get('base'), expr.info, "'base'")
 
 
-def check_union(expr: _JSONObject, info: QAPISourceInfo) -> None:
+def check_union(expr: QAPIExpression) -> None:
     """
     Normalize and validate this expression as a ``union`` definition.
 
     :param expr: The expression to validate.
-    :param info: QAPI schema source file information.
 
     :raise QAPISemError: when ``expr`` is not a valid ``union``.
     :return: None, ``expr`` is normalized in-place as needed.
@@ -517,6 +514,7 @@ def check_union(expr: _JSONObject, info: QAPISourceInfo) -> None:
     base = expr['base']
     discriminator = expr['discriminator']
     members = expr['data']
+    info = expr.info
 
     check_type(base, info, "'base'", allow_dict=name)
     check_name_is_str(discriminator, info, "'discriminator'")
@@ -531,17 +529,17 @@ def check_union(expr: _JSONObject, info: QAPISourceInfo) -> None:
         check_type(value['type'], info, source, allow_array=not base)
 
 
-def check_alternate(expr: _JSONObject, info: QAPISourceInfo) -> None:
+def check_alternate(expr: QAPIExpression) -> None:
     """
     Normalize and validate this expression as an ``alternate`` definition.
 
     :param expr: The expression to validate.
-    :param info: QAPI schema source file information.
 
     :raise QAPISemError: When ``expr`` is not a valid ``alternate``.
     :return: None, ``expr`` is normalized in-place as needed.
     """
     members = expr['data']
+    info = expr.info
 
     if not members:
         raise QAPISemError(info, "'data' must not be empty")
@@ -557,12 +555,11 @@ def check_alternate(expr: _JSONObject, info: QAPISourceInfo) -> None:
         check_type(value['type'], info, source, allow_array=True)
 
 
-def check_command(expr: _JSONObject, info: QAPISourceInfo) -> None:
+def check_command(expr: QAPIExpression) -> None:
     """
     Normalize and validate this expression as a ``command`` definition.
 
     :param expr: The expression to validate.
-    :param info: QAPI schema source file information.
 
     :raise QAPISemError: When ``expr`` is not a valid ``command``.
     :return: None, ``expr`` is normalized in-place as needed.
@@ -572,17 +569,16 @@ def check_command(expr: _JSONObject, info: QAPISourceInfo) -> None:
     boxed = expr.get('boxed', False)
 
     if boxed and args is None:
-        raise QAPISemError(info, "'boxed': true requires 'data'")
-    check_type(args, info, "'data'", allow_dict=not boxed)
-    check_type(rets, info, "'returns'", allow_array=True)
+        raise QAPISemError(expr.info, "'boxed': true requires 'data'")
+    check_type(args, expr.info, "'data'", allow_dict=not boxed)
+    check_type(rets, expr.info, "'returns'", allow_array=True)
 
 
-def check_event(expr: _JSONObject, info: QAPISourceInfo) -> None:
+def check_event(expr: QAPIExpression) -> None:
     """
     Normalize and validate this expression as an ``event`` definition.
 
     :param expr: The expression to validate.
-    :param info: QAPI schema source file information.
 
     :raise QAPISemError: When ``expr`` is not a valid ``event``.
     :return: None, ``expr`` is normalized in-place as needed.
@@ -591,37 +587,23 @@ def check_event(expr: _JSONObject, info: QAPISourceInfo) -> None:
     boxed = expr.get('boxed', False)
 
     if boxed and args is None:
-        raise QAPISemError(info, "'boxed': true requires 'data'")
-    check_type(args, info, "'data'", allow_dict=not boxed)
+        raise QAPISemError(expr.info, "'boxed': true requires 'data'")
+    check_type(args, expr.info, "'data'", allow_dict=not boxed)
 
 
-def check_expr(expr_elem: _JSONObject) -> None:
+def check_expr(expr: QAPIExpression) -> None:
     """
     Validate and normalize a parsed QAPI schema expression.
 
-    :param expr_elem: The parsed expression to normalize and validate.
+    :param expr: The parsed expression to normalize and validate.
 
     :raise QAPISemError: When this expression fails validation.
     :return: None, The expression is normalized in-place as needed.
     """
-    # Expression
-    assert isinstance(expr_elem['expr'], dict)
-    for key in expr_elem['expr'].keys():
-        assert isinstance(key, str)
-    expr: _JSONObject = expr_elem['expr']
-
-    # QAPISourceInfo
-    assert isinstance(expr_elem['info'], QAPISourceInfo)
-    info: QAPISourceInfo = expr_elem['info']
-
-    # Optional[QAPIDoc]
-    tmp = expr_elem.get('doc')
-    assert tmp is None or isinstance(tmp, QAPIDoc)
-    doc: Optional[QAPIDoc] = tmp
-
     if 'include' in expr:
         return
 
+    info = expr.info
     metas = set(expr.keys() & {
         'enum', 'struct', 'union', 'alternate', 'command', 'event'})
     if len(metas) != 1:
@@ -637,6 +619,7 @@ def check_expr(expr_elem: _JSONObject) -> None:
     info.set_defn(meta, name)
     check_defn_name_str(name, info, meta)
 
+    doc = expr.doc
     if doc:
         if doc.symbol != name:
             raise QAPISemError(
@@ -649,24 +632,24 @@ def check_expr(expr_elem: _JSONObject) -> None:
     if meta == 'enum':
         check_keys(expr, info, meta,
                    ['enum', 'data'], ['if', 'features', 'prefix'])
-        check_enum(expr, info)
+        check_enum(expr)
     elif meta == 'union':
         check_keys(expr, info, meta,
                    ['union', 'base', 'discriminator', 'data'],
                    ['if', 'features'])
         normalize_members(expr.get('base'))
         normalize_members(expr['data'])
-        check_union(expr, info)
+        check_union(expr)
     elif meta == 'alternate':
         check_keys(expr, info, meta,
                    ['alternate', 'data'], ['if', 'features'])
         normalize_members(expr['data'])
-        check_alternate(expr, info)
+        check_alternate(expr)
     elif meta == 'struct':
         check_keys(expr, info, meta,
                    ['struct', 'data'], ['base', 'if', 'features'])
         normalize_members(expr['data'])
-        check_struct(expr, info)
+        check_struct(expr)
     elif meta == 'command':
         check_keys(expr, info, meta,
                    ['command'],
@@ -674,21 +657,21 @@ def check_expr(expr_elem: _JSONObject) -> None:
                     'gen', 'success-response', 'allow-oob',
                     'allow-preconfig', 'coroutine'])
         normalize_members(expr.get('data'))
-        check_command(expr, info)
+        check_command(expr)
     elif meta == 'event':
         check_keys(expr, info, meta,
                    ['event'], ['data', 'boxed', 'if', 'features'])
         normalize_members(expr.get('data'))
-        check_event(expr, info)
+        check_event(expr)
     else:
         assert False, 'unexpected meta type'
 
     check_if(expr, info, meta)
     check_features(expr.get('features'), info)
-    check_flags(expr, info)
+    check_flags(expr)
 
 
-def check_exprs(exprs: List[_JSONObject]) -> List[_JSONObject]:
+def check_exprs(exprs: List[QAPIExpression]) -> List[QAPIExpression]:
     """
     Validate and normalize a list of parsed QAPI schema expressions.
 
diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 1b006cdc133..87b46db7fba 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -14,13 +14,14 @@
 # This work is licensed under the terms of the GNU GPL, version 2.
 # See the COPYING file in the top-level directory.
 
-from collections import OrderedDict
+from collections import OrderedDict, UserDict
 import os
 import re
 from typing import (
     TYPE_CHECKING,
     Dict,
     List,
+    Mapping,
     Optional,
     Set,
     Union,
@@ -37,15 +38,30 @@
     from .schema import QAPISchemaFeature, QAPISchemaMember
 
 
-#: Represents a single Top Level QAPI schema expression.
-TopLevelExpr = Dict[str, object]
-
 # Return value alias for get_expr().
 _ExprValue = Union[List[object], Dict[str, object], str, bool]
 
-# FIXME: Consolidate and centralize definitions for TopLevelExpr,
-# _ExprValue, _JSONValue, and _JSONObject; currently scattered across
-# several modules.
+
+# FIXME: Consolidate and centralize definitions for _ExprValue,
+# JSONValue, and _JSONObject; currently scattered across several
+# modules.
+
+
+# 3.6 workaround: can be removed when Python 3.7+ is our required version.
+if TYPE_CHECKING:
+    _UserDict = UserDict[str, object]
+else:
+    _UserDict = UserDict
+
+
+class QAPIExpression(_UserDict):
+    def __init__(self,
+                 initialdata: Mapping[str, object],
+                 info: QAPISourceInfo,
+                 doc: Optional['QAPIDoc'] = None):
+        super().__init__(initialdata)
+        self.info = info
+        self.doc: Optional['QAPIDoc'] = doc
 
 
 class QAPIParseError(QAPISourceError):
@@ -100,7 +116,7 @@ def __init__(self,
         self.line_pos = 0
 
         # Parser output:
-        self.exprs: List[Dict[str, object]] = []
+        self.exprs: List[QAPIExpression] = []
         self.docs: List[QAPIDoc] = []
 
         # Showtime!
@@ -147,8 +163,7 @@ def _parse(self) -> None:
                                        "value of 'include' must be a string")
                 incl_fname = os.path.join(os.path.dirname(self._fname),
                                           include)
-                self.exprs.append({'expr': {'include': incl_fname},
-                                   'info': info})
+                self._add_expr(OrderedDict({'include': incl_fname}), info)
                 exprs_include = self._include(include, info, incl_fname,
                                               self._included)
                 if exprs_include:
@@ -165,17 +180,18 @@ def _parse(self) -> None:
                 for name, value in pragma.items():
                     self._pragma(name, value, info)
             else:
-                expr_elem = {'expr': expr,
-                             'info': info}
-                if cur_doc:
-                    if not cur_doc.symbol:
-                        raise QAPISemError(
-                            cur_doc.info, "definition documentation required")
-                    expr_elem['doc'] = cur_doc
-                self.exprs.append(expr_elem)
+                if cur_doc and not cur_doc.symbol:
+                    raise QAPISemError(
+                        cur_doc.info, "definition documentation required")
+                self._add_expr(expr, info, cur_doc)
             cur_doc = None
         self.reject_expr_doc(cur_doc)
 
+    def _add_expr(self, expr: Mapping[str, object],
+                  info: QAPISourceInfo,
+                  doc: Optional['QAPIDoc'] = None) -> None:
+        self.exprs.append(QAPIExpression(expr, info, doc))
+
     @staticmethod
     def reject_expr_doc(doc: Optional['QAPIDoc']) -> None:
         if doc and doc.symbol:
@@ -784,7 +800,7 @@ def connect_feature(self, feature: 'QAPISchemaFeature') -> None:
                                % feature.name)
         self.features[feature.name].connect(feature)
 
-    def check_expr(self, expr: TopLevelExpr) -> None:
+    def check_expr(self, expr: QAPIExpression) -> None:
         if self.has_section('Returns') and 'command' not in expr:
             raise QAPISemError(self.info,
                                "'Returns:' is only valid for commands")
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index cd8661125cd..207e4d71f39 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -17,7 +17,7 @@
 from collections import OrderedDict
 import os
 import re
-from typing import Optional
+from typing import List, Optional
 
 from .common import (
     POINTER_SUFFIX,
@@ -29,7 +29,7 @@
 )
 from .error import QAPIError, QAPISemError, QAPISourceError
 from .expr import check_exprs
-from .parser import QAPISchemaParser
+from .parser import QAPIExpression, QAPISchemaParser
 
 
 class QAPISchemaIfCond:
@@ -964,10 +964,11 @@ def module_by_fname(self, fname):
         name = self._module_name(fname)
         return self._module_dict[name]
 
-    def _def_include(self, expr, info, doc):
+    def _def_include(self, expr: QAPIExpression):
         include = expr['include']
-        assert doc is None
-        self._def_entity(QAPISchemaInclude(self._make_module(include), info))
+        assert expr.doc is None
+        self._def_entity(
+            QAPISchemaInclude(self._make_module(include), expr.info))
 
     def _def_builtin_type(self, name, json_type, c_type):
         self._def_entity(QAPISchemaBuiltinType(name, json_type, c_type))
@@ -1045,14 +1046,15 @@ def _make_implicit_object_type(self, name, info, ifcond, role, members):
                 name, info, None, ifcond, None, None, members, None))
         return name
 
-    def _def_enum_type(self, expr, info, doc):
+    def _def_enum_type(self, expr: QAPIExpression):
         name = expr['enum']
         data = expr['data']
         prefix = expr.get('prefix')
         ifcond = QAPISchemaIfCond(expr.get('if'))
+        info = expr.info
         features = self._make_features(expr.get('features'), info)
         self._def_entity(QAPISchemaEnumType(
-            name, info, doc, ifcond, features,
+            name, info, expr.doc, ifcond, features,
             self._make_enum_members(data, info), prefix))
 
     def _make_member(self, name, typ, ifcond, features, info):
@@ -1072,14 +1074,15 @@ def _make_members(self, data, info):
                                   value.get('features'), info)
                 for (key, value) in data.items()]
 
-    def _def_struct_type(self, expr, info, doc):
+    def _def_struct_type(self, expr: QAPIExpression):
         name = expr['struct']
         base = expr.get('base')
         data = expr['data']
+        info = expr.info
         ifcond = QAPISchemaIfCond(expr.get('if'))
         features = self._make_features(expr.get('features'), info)
         self._def_entity(QAPISchemaObjectType(
-            name, info, doc, ifcond, features, base,
+            name, info, expr.doc, ifcond, features, base,
             self._make_members(data, info),
             None))
 
@@ -1089,11 +1092,13 @@ def _make_variant(self, case, typ, ifcond, info):
             typ = self._make_array_type(typ[0], info)
         return QAPISchemaVariant(case, info, typ, ifcond)
 
-    def _def_union_type(self, expr, info, doc):
+    def _def_union_type(self, expr: QAPIExpression):
         name = expr['union']
         base = expr['base']
         tag_name = expr['discriminator']
         data = expr['data']
+        assert isinstance(data, dict)
+        info = expr.info
         ifcond = QAPISchemaIfCond(expr.get('if'))
         features = self._make_features(expr.get('features'), info)
         if isinstance(base, dict):
@@ -1105,17 +1110,19 @@ def _def_union_type(self, expr, info, doc):
                                QAPISchemaIfCond(value.get('if')),
                                info)
             for (key, value) in data.items()]
-        members = []
+        members: List[QAPISchemaObjectTypeMember] = []
         self._def_entity(
-            QAPISchemaObjectType(name, info, doc, ifcond, features,
+            QAPISchemaObjectType(name, info, expr.doc, ifcond, features,
                                  base, members,
                                  QAPISchemaVariants(
                                      tag_name, info, None, variants)))
 
-    def _def_alternate_type(self, expr, info, doc):
+    def _def_alternate_type(self, expr: QAPIExpression):
         name = expr['alternate']
         data = expr['data']
+        assert isinstance(data, dict)
         ifcond = QAPISchemaIfCond(expr.get('if'))
+        info = expr.info
         features = self._make_features(expr.get('features'), info)
         variants = [
             self._make_variant(key, value['type'],
@@ -1124,11 +1131,11 @@ def _def_alternate_type(self, expr, info, doc):
             for (key, value) in data.items()]
         tag_member = QAPISchemaObjectTypeMember('type', info, 'QType', False)
         self._def_entity(
-            QAPISchemaAlternateType(name, info, doc, ifcond, features,
-                                    QAPISchemaVariants(
-                                        None, info, tag_member, variants)))
+            QAPISchemaAlternateType(
+                name, info, expr.doc, ifcond, features,
+                QAPISchemaVariants(None, info, tag_member, variants)))
 
-    def _def_command(self, expr, info, doc):
+    def _def_command(self, expr: QAPIExpression):
         name = expr['command']
         data = expr.get('data')
         rets = expr.get('returns')
@@ -1139,6 +1146,7 @@ def _def_command(self, expr, info, doc):
         allow_preconfig = expr.get('allow-preconfig', False)
         coroutine = expr.get('coroutine', False)
         ifcond = QAPISchemaIfCond(expr.get('if'))
+        info = expr.info
         features = self._make_features(expr.get('features'), info)
         if isinstance(data, OrderedDict):
             data = self._make_implicit_object_type(
@@ -1147,44 +1155,42 @@ def _def_command(self, expr, info, doc):
         if isinstance(rets, list):
             assert len(rets) == 1
             rets = self._make_array_type(rets[0], info)
-        self._def_entity(QAPISchemaCommand(name, info, doc, ifcond, features,
-                                           data, rets,
+        self._def_entity(QAPISchemaCommand(name, info, expr.doc, ifcond,
+                                           features, data, rets,
                                            gen, success_response,
                                            boxed, allow_oob, allow_preconfig,
                                            coroutine))
 
-    def _def_event(self, expr, info, doc):
+    def _def_event(self, expr: QAPIExpression):
         name = expr['event']
         data = expr.get('data')
         boxed = expr.get('boxed', False)
         ifcond = QAPISchemaIfCond(expr.get('if'))
+        info = expr.info
         features = self._make_features(expr.get('features'), info)
         if isinstance(data, OrderedDict):
             data = self._make_implicit_object_type(
                 name, info, ifcond,
                 'arg', self._make_members(data, info))
-        self._def_entity(QAPISchemaEvent(name, info, doc, ifcond, features,
-                                         data, boxed))
+        self._def_entity(QAPISchemaEvent(name, info, expr.doc, ifcond,
+                                         features, data, boxed))
 
     def _def_exprs(self, exprs):
-        for expr_elem in exprs:
-            expr = expr_elem['expr']
-            info = expr_elem['info']
-            doc = expr_elem.get('doc')
+        for expr in exprs:
             if 'enum' in expr:
-                self._def_enum_type(expr, info, doc)
+                self._def_enum_type(expr)
             elif 'struct' in expr:
-                self._def_struct_type(expr, info, doc)
+                self._def_struct_type(expr)
             elif 'union' in expr:
-                self._def_union_type(expr, info, doc)
+                self._def_union_type(expr)
             elif 'alternate' in expr:
-                self._def_alternate_type(expr, info, doc)
+                self._def_alternate_type(expr)
             elif 'command' in expr:
-                self._def_command(expr, info, doc)
+                self._def_command(expr)
             elif 'event' in expr:
-                self._def_event(expr, info, doc)
+                self._def_event(expr)
             elif 'include' in expr:
-                self._def_include(expr, info, doc)
+                self._def_include(expr)
             else:
                 assert False
 
-- 
2.39.0


