Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 585A068E5EC
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 03:13:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPZxT-0002jY-3x; Tue, 07 Feb 2023 21:13:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pPZxR-0002il-Aj
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 21:13:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pPZxP-00040k-FJ
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 21:13:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675822390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=evJyZ+aBqC9dhQfTQisovrdTrGIIdt7LOPFQO9w8I+c=;
 b=LGqxVvMjiWfZdmFAzdzVmLEmdZDjYJQz8Nvyn7qvKFkCTtISVTcte4Cfj0kDmuXoWbo7Ul
 eM0LI2Nd45YtYFu+TKd6YsFVtSA8Wvbq/nuOAY50k5dxUo2IDltHWQI0gTdGXKUJQQ0NsC
 x9nZcboY4Q65ZqUPeGn7FAXGX1NCtDA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-aGWUegSVNI2r1tzrtQs99A-1; Tue, 07 Feb 2023 21:13:07 -0500
X-MC-Unique: aGWUegSVNI2r1tzrtQs99A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBDFB80D0E2;
 Wed,  8 Feb 2023 02:13:06 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 848981121314;
 Wed,  8 Feb 2023 02:13:06 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH v2 1/7] qapi/expr: Split check_expr out from check_exprs
Date: Tue,  7 Feb 2023 21:13:00 -0500
Message-Id: <20230208021306.870657-2-jsnow@redhat.com>
In-Reply-To: <20230208021306.870657-1-jsnow@redhat.com>
References: <20230208021306.870657-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

Primarily, this reduces a nesting level of a particularly long
block. It's mostly code movement, but a new docstring is created.

It also has the effect of creating a fairly convenient "catch point" in
check_exprs for exception handling without making the nesting level even
worse.

Signed-off-by: John Snow <jsnow@redhat.com>

---

This patch was originally written as part of my effort to factor out
QAPISourceInfo from this file by having expr.py raise a simple
exception, then catch and wrap it at the higher level.

This series doesn't do that anymore, but reducing the nesting level
still seemed subjectively nice. It's not crucial.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/expr.py | 179 +++++++++++++++++++++++--------------------
 1 file changed, 95 insertions(+), 84 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 5a1782b57ea..d01543006d8 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -595,6 +595,99 @@ def check_event(expr: _JSONObject, info: QAPISourceInfo) -> None:
     check_type(args, info, "'data'", allow_dict=not boxed)
 
 
+def check_expr(expr_elem: _JSONObject) -> None:
+    """
+    Validate and normalize a parsed QAPI schema expression.
+
+    :param expr_elem: The parsed expression to normalize and validate.
+
+    :raise QAPISemError: When this expression fails validation.
+    :return: None, ``expr`` is normalized in-place as needed.
+    """
+    # Expression
+    assert isinstance(expr_elem['expr'], dict)
+    for key in expr_elem['expr'].keys():
+        assert isinstance(key, str)
+    expr: _JSONObject = expr_elem['expr']
+
+    # QAPISourceInfo
+    assert isinstance(expr_elem['info'], QAPISourceInfo)
+    info: QAPISourceInfo = expr_elem['info']
+
+    # Optional[QAPIDoc]
+    tmp = expr_elem.get('doc')
+    assert tmp is None or isinstance(tmp, QAPIDoc)
+    doc: Optional[QAPIDoc] = tmp
+
+    if 'include' in expr:
+        return
+
+    metas = expr.keys() & {'enum', 'struct', 'union', 'alternate',
+                           'command', 'event'}
+    if len(metas) != 1:
+        raise QAPISemError(
+            info,
+            "expression must have exactly one key"
+            " 'enum', 'struct', 'union', 'alternate',"
+            " 'command', 'event'")
+    meta = metas.pop()
+
+    check_name_is_str(expr[meta], info, "'%s'" % meta)
+    name = cast(str, expr[meta])
+    info.set_defn(meta, name)
+    check_defn_name_str(name, info, meta)
+
+    if doc:
+        if doc.symbol != name:
+            raise QAPISemError(
+                info, "documentation comment is for '%s'" % doc.symbol)
+        doc.check_expr(expr)
+    elif info.pragma.doc_required:
+        raise QAPISemError(info,
+                           "documentation comment required")
+
+    if meta == 'enum':
+        check_keys(expr, info, meta,
+                   ['enum', 'data'], ['if', 'features', 'prefix'])
+        check_enum(expr, info)
+    elif meta == 'union':
+        check_keys(expr, info, meta,
+                   ['union', 'base', 'discriminator', 'data'],
+                   ['if', 'features'])
+        normalize_members(expr.get('base'))
+        normalize_members(expr['data'])
+        check_union(expr, info)
+    elif meta == 'alternate':
+        check_keys(expr, info, meta,
+                   ['alternate', 'data'], ['if', 'features'])
+        normalize_members(expr['data'])
+        check_alternate(expr, info)
+    elif meta == 'struct':
+        check_keys(expr, info, meta,
+                   ['struct', 'data'], ['base', 'if', 'features'])
+        normalize_members(expr['data'])
+        check_struct(expr, info)
+    elif meta == 'command':
+        check_keys(expr, info, meta,
+                   ['command'],
+                   ['data', 'returns', 'boxed', 'if', 'features',
+                    'gen', 'success-response', 'allow-oob',
+                    'allow-preconfig', 'coroutine'])
+        normalize_members(expr.get('data'))
+        check_command(expr, info)
+    elif meta == 'event':
+        check_keys(expr, info, meta,
+                   ['event'], ['data', 'boxed', 'if', 'features'])
+        normalize_members(expr.get('data'))
+        check_event(expr, info)
+    else:
+        assert False, 'unexpected meta type'
+
+    check_if(expr, info, meta)
+    check_features(expr.get('features'), info)
+    check_flags(expr, info)
+
+
 def check_exprs(exprs: List[_JSONObject]) -> List[_JSONObject]:
     """
     Validate and normalize a list of parsed QAPI schema expressions.
@@ -607,88 +700,6 @@ def check_exprs(exprs: List[_JSONObject]) -> List[_JSONObject]:
     :raise QAPISemError: When any expression fails validation.
     :return: The same list of expressions (now modified).
     """
-    for expr_elem in exprs:
-        # Expression
-        assert isinstance(expr_elem['expr'], dict)
-        for key in expr_elem['expr'].keys():
-            assert isinstance(key, str)
-        expr: _JSONObject = expr_elem['expr']
-
-        # QAPISourceInfo
-        assert isinstance(expr_elem['info'], QAPISourceInfo)
-        info: QAPISourceInfo = expr_elem['info']
-
-        # Optional[QAPIDoc]
-        tmp = expr_elem.get('doc')
-        assert tmp is None or isinstance(tmp, QAPIDoc)
-        doc: Optional[QAPIDoc] = tmp
-
-        if 'include' in expr:
-            continue
-
-        metas = expr.keys() & {'enum', 'struct', 'union', 'alternate',
-                               'command', 'event'}
-        if len(metas) != 1:
-            raise QAPISemError(
-                info,
-                "expression must have exactly one key"
-                " 'enum', 'struct', 'union', 'alternate',"
-                " 'command', 'event'")
-        meta = metas.pop()
-
-        check_name_is_str(expr[meta], info, "'%s'" % meta)
-        name = cast(str, expr[meta])
-        info.set_defn(meta, name)
-        check_defn_name_str(name, info, meta)
-
-        if doc:
-            if doc.symbol != name:
-                raise QAPISemError(
-                    info, "documentation comment is for '%s'" % doc.symbol)
-            doc.check_expr(expr)
-        elif info.pragma.doc_required:
-            raise QAPISemError(info,
-                               "documentation comment required")
-
-        if meta == 'enum':
-            check_keys(expr, info, meta,
-                       ['enum', 'data'], ['if', 'features', 'prefix'])
-            check_enum(expr, info)
-        elif meta == 'union':
-            check_keys(expr, info, meta,
-                       ['union', 'base', 'discriminator', 'data'],
-                       ['if', 'features'])
-            normalize_members(expr.get('base'))
-            normalize_members(expr['data'])
-            check_union(expr, info)
-        elif meta == 'alternate':
-            check_keys(expr, info, meta,
-                       ['alternate', 'data'], ['if', 'features'])
-            normalize_members(expr['data'])
-            check_alternate(expr, info)
-        elif meta == 'struct':
-            check_keys(expr, info, meta,
-                       ['struct', 'data'], ['base', 'if', 'features'])
-            normalize_members(expr['data'])
-            check_struct(expr, info)
-        elif meta == 'command':
-            check_keys(expr, info, meta,
-                       ['command'],
-                       ['data', 'returns', 'boxed', 'if', 'features',
-                        'gen', 'success-response', 'allow-oob',
-                        'allow-preconfig', 'coroutine'])
-            normalize_members(expr.get('data'))
-            check_command(expr, info)
-        elif meta == 'event':
-            check_keys(expr, info, meta,
-                       ['event'], ['data', 'boxed', 'if', 'features'])
-            normalize_members(expr.get('data'))
-            check_event(expr, info)
-        else:
-            assert False, 'unexpected meta type'
-
-        check_if(expr, info, meta)
-        check_features(expr.get('features'), info)
-        check_flags(expr, info)
-
+    for expr in exprs:
+        check_expr(expr)
     return exprs
-- 
2.39.0


