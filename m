Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A435F68E5EF
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 03:14:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPZxR-0002iO-Bp; Tue, 07 Feb 2023 21:13:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pPZxP-0002hp-Lh
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 21:13:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pPZxN-00040F-CU
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 21:13:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675822388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IaGt8FOIU5ACxtWhwo5F9XWVv9j/MS6Ra5YEusjn62U=;
 b=hoGmlhU17e0tiLbWX6gKIpd/HgLTNr4QuEVE5Q1Hn0lUHqk7QTmpcwSvFsS4HWYot1GHas
 aPYSIsYqpmAh+cU3QvLbJVHGQ4i0uRMHZabRPF7H/44SdyZg/yfTQbldMs7RHszWhXzWAq
 kAsZz119Q1bYT8nRt7bk9y/zYdnE7DE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-ziG7_NpZNN2cmf7pjYFWWA-1; Tue, 07 Feb 2023 21:13:07 -0500
X-MC-Unique: ziG7_NpZNN2cmf7pjYFWWA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05854884341;
 Wed,  8 Feb 2023 02:13:07 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA7931121314;
 Wed,  8 Feb 2023 02:13:06 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH v2 2/7] qapi/parser.py: add ParsedExpression type
Date: Tue,  7 Feb 2023 21:13:01 -0500
Message-Id: <20230208021306.870657-3-jsnow@redhat.com>
In-Reply-To: <20230208021306.870657-1-jsnow@redhat.com>
References: <20230208021306.870657-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

This is an immutable, named, typed tuple. It's arguably nicer than
arbitrary dicts for passing data around when using strict typing.

This patch turns parser.exprs into a list of ParsedExpressions instead,
and adjusts expr.py to match.

This allows the types we specify in parser.py to be "remembered" all the
way through expr.py and into schema.py. Several assertions around
packing and unpacking this data can be removed as a result.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/expr.py   | 29 +++++++++--------------------
 scripts/qapi/parser.py | 29 ++++++++++++++++++-----------
 scripts/qapi/schema.py |  6 +++---
 3 files changed, 30 insertions(+), 34 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index d01543006d8..293f830fe9d 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -44,7 +44,7 @@
 
 from .common import c_name
 from .error import QAPISemError
-from .parser import QAPIDoc
+from .parser import ParsedExpression
 from .source import QAPISourceInfo
 
 
@@ -595,29 +595,17 @@ def check_event(expr: _JSONObject, info: QAPISourceInfo) -> None:
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
@@ -637,6 +625,7 @@ def check_expr(expr_elem: _JSONObject) -> None:
     info.set_defn(meta, name)
     check_defn_name_str(name, info, meta)
 
+    doc = pexpr.doc
     if doc:
         if doc.symbol != name:
             raise QAPISemError(
@@ -688,7 +677,7 @@ def check_expr(expr_elem: _JSONObject) -> None:
     check_flags(expr, info)
 
 
-def check_exprs(exprs: List[_JSONObject]) -> List[_JSONObject]:
+def check_exprs(exprs: List[ParsedExpression]) -> List[ParsedExpression]:
     """
     Validate and normalize a list of parsed QAPI schema expressions.
 
diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 1b006cdc133..f897dffbfd4 100644
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
@@ -48,6 +49,12 @@
 # several modules.
 
 
+class ParsedExpression(NamedTuple):
+    expr: TopLevelExpr
+    info: QAPISourceInfo
+    doc: Optional['QAPIDoc']
+
+
 class QAPIParseError(QAPISourceError):
     """Error class for all QAPI schema parsing errors."""
     def __init__(self, parser: 'QAPISchemaParser', msg: str):
@@ -100,7 +107,7 @@ def __init__(self,
         self.line_pos = 0
 
         # Parser output:
-        self.exprs: List[Dict[str, object]] = []
+        self.exprs: List[ParsedExpression] = []
         self.docs: List[QAPIDoc] = []
 
         # Showtime!
@@ -147,8 +154,7 @@ def _parse(self) -> None:
                                        "value of 'include' must be a string")
                 incl_fname = os.path.join(os.path.dirname(self._fname),
                                           include)
-                self.exprs.append({'expr': {'include': incl_fname},
-                                   'info': info})
+                self._add_expr(OrderedDict({'include': incl_fname}), info)
                 exprs_include = self._include(include, info, incl_fname,
                                               self._included)
                 if exprs_include:
@@ -165,17 +171,18 @@ def _parse(self) -> None:
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
index cd8661125cd..89f8e60db36 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -1168,9 +1168,9 @@ def _def_event(self, expr, info, doc):
 
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
2.39.0


