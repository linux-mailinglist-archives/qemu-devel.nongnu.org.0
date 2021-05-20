Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFB138B303
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 17:22:16 +0200 (CEST)
Received: from localhost ([::1]:47648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljkV5-0001bE-Up
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 11:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljkR6-00058J-Vo
 for qemu-devel@nongnu.org; Thu, 20 May 2021 11:18:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljkR4-0003wQ-SD
 for qemu-devel@nongnu.org; Thu, 20 May 2021 11:18:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621523885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d+gK0iWz83spFrtFnLD87oxCq0K8Ibm8tVN5l43FphQ=;
 b=HhuUGYcuQ6AmIWF8zKhZmxCBdFfGIwdgbjVYQ2hDJwTo9j6DzzMKy7OikFJabPtuWblh90
 isKsQgowu3Qkh1ff5axI3a4cxE4xAnHXcQrzF66N8vNr7pPGI3XmQHoLBFuj9/4VhPnhTD
 ehzm7G6Ku4tpkviSkoC+Pel9Vcq7kw0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-OY74SVZSOKyhISv5G6ECHg-1; Thu, 20 May 2021 11:18:03 -0400
X-MC-Unique: OY74SVZSOKyhISv5G6ECHg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 289D8180FD65;
 Thu, 20 May 2021 15:18:02 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 48E096062F;
 Thu, 20 May 2021 15:18:01 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] qapi/parser.py: add ParsedExpression type
Date: Thu, 20 May 2021 11:17:58 -0400
Message-Id: <20210520151759.91929-3-jsnow@redhat.com>
In-Reply-To: <20210520151759.91929-1-jsnow@redhat.com>
References: <20210520151759.91929-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an immutable, named, typed tuple. It's nicer than arbitrary
dicts for passing data around when using strict typing. We may upgrade
this to a @dataclass style class in the future if we want to support
mutability at a later time. (And after 3.7+ is available for use.)

Turn parser.exprs into a list of ParsedExpressions instead, and adjust
expr.py to match.

This allows the types we specify in parser.py to be remembered all the
way through expr.py and into schema.py. Several assertions around
packing and unpacking this data can be removed as a result.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/expr.py   | 29 +++++++++--------------------
 scripts/qapi/parser.py | 29 ++++++++++++++++++-----------
 scripts/qapi/schema.py |  6 +++---
 3 files changed, 30 insertions(+), 34 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 9dff0cd9080..6d89343897c 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -44,7 +44,7 @@
 
 from .common import c_name
 from .error import QAPISemError
-from .parser import QAPIDoc
+from .parser import ParsedExpression
 from .source import QAPISourceInfo
 
 
@@ -586,29 +586,17 @@ def check_event(expr: _JSONObject, info: QAPISourceInfo) -> None:
     check_type(args, info, "'data'", allow_dict=not boxed)
 
 
-def check_expr(expr_elem: _JSONObject) -> None:
+def check_expr(pexpr: ParsedExpression) -> None:
     """
-    Validate and normalize a parsed QAPI schema expression.
+    Validate and normalize a `ParsedExpression`.
 
-    :param expr_elem: The parsed expression to normalize and validate.
+    :param pexpr: The parsed expression to normalize and validate.
 
     :raise QAPISemError: When this expression fails validation.
-    :return: None, ``expr`` is normalized in-place as needed.
+    :return: None, ``pexpr`` is normalized in-place as needed.
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
+    expr = pexpr.expr
+    info = pexpr.info
 
     if 'include' in expr:
         return
@@ -633,6 +621,7 @@ def check_expr(expr_elem: _JSONObject) -> None:
     info.set_defn(meta, name)
     check_defn_name_str(name, info, meta)
 
+    doc = pexpr.doc
     if doc:
         if doc.symbol != name:
             raise QAPISemError(
@@ -684,7 +673,7 @@ def check_expr(expr_elem: _JSONObject) -> None:
     check_flags(expr, info)
 
 
-def check_exprs(exprs: List[_JSONObject]) -> List[_JSONObject]:
+def check_exprs(exprs: List[ParsedExpression]) -> List[ParsedExpression]:
     """
     Validate and normalize a list of parsed QAPI schema expressions.
 
diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 36d4bd175a0..5ea9b643837 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -21,6 +21,7 @@
     TYPE_CHECKING,
     Dict,
     List,
+    NamedTuple,
     Optional,
     Set,
     Union,
@@ -43,6 +44,12 @@
 _ExprValue = Union[List[object], Dict[str, object], str, bool]
 
 
+class ParsedExpression(NamedTuple):
+    expr: TopLevelExpr
+    info: QAPISourceInfo
+    doc: Optional['QAPIDoc']
+
+
 class QAPIParseError(QAPISourceError):
     """Error class for all QAPI schema parsing errors."""
     def __init__(self, parser: 'QAPISchemaParser', msg: str):
@@ -95,7 +102,7 @@ def __init__(self,
         self.line_pos = 0
 
         # Parser output:
-        self.exprs: List[Dict[str, object]] = []
+        self.exprs: List[ParsedExpression] = []
         self.docs: List[QAPIDoc] = []
 
         # Showtime!
@@ -142,8 +149,7 @@ def _parse(self) -> None:
                                        "value of 'include' must be a string")
                 incl_fname = os.path.join(os.path.dirname(self._fname),
                                           include)
-                self.exprs.append({'expr': {'include': incl_fname},
-                                   'info': info})
+                self._add_expr(OrderedDict({'include': incl_fname}), info)
                 exprs_include = self._include(include, info, incl_fname,
                                               self._included)
                 if exprs_include:
@@ -160,17 +166,18 @@ def _parse(self) -> None:
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
 
+    def _add_expr(self, expr: TopLevelExpr,
+                  info: QAPISourceInfo,
+                  doc: Optional['QAPIDoc'] = None) -> None:
+        self.exprs.append(ParsedExpression(expr, info, doc))
+
     @staticmethod
     def reject_expr_doc(doc: Optional['QAPIDoc']) -> None:
         if doc and doc.symbol:
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index d1d27ff7ee8..025b22cd3df 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -1148,9 +1148,9 @@ def _def_event(self, expr, info, doc):
 
     def _def_exprs(self, exprs):
         for expr_elem in exprs:
-            expr = expr_elem['expr']
-            info = expr_elem['info']
-            doc = expr_elem.get('doc')
+            expr = expr_elem.expr
+            info = expr_elem.info
+            doc = expr_elem.doc
             if 'enum' in expr:
                 self._def_enum_type(expr, info, doc)
             elif 'struct' in expr:
-- 
2.30.2


