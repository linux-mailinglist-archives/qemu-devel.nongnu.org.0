Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E878938B33B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 17:27:26 +0200 (CEST)
Received: from localhost ([::1]:35622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljka6-00043s-0G
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 11:27:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljkR5-00054q-Qn
 for qemu-devel@nongnu.org; Thu, 20 May 2021 11:18:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljkR2-0003uC-K8
 for qemu-devel@nongnu.org; Thu, 20 May 2021 11:18:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621523883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z85wLyi/Bh1rXl9DWz5K+raZ30zdPxU2no06+piLtVQ=;
 b=CJHaDAN3gHHqGtbXlb4g5W3PDCNYf1P6oqQYNX3grtamA3ZfhYbYNuXCGjeKyHwa2TA2Sf
 pGwvXYLvN895nQFDDJvID7w0/2BiLBBxY6UXzaGt0fGuUKeME9UcAt01Q/KtFjtQj0RQbP
 sSFYpKROpFqENZKGP/P0EloHTAagC0Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-KbtpVRi4MeGCWDuEkri3gA-1; Thu, 20 May 2021 11:18:02 -0400
X-MC-Unique: KbtpVRi4MeGCWDuEkri3gA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23D501013722;
 Thu, 20 May 2021 15:18:01 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7707A19CBE;
 Thu, 20 May 2021 15:18:00 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] qapi/expr: Split check_expr out from check_exprs
Date: Thu, 20 May 2021 11:17:57 -0400
Message-Id: <20210520151759.91929-2-jsnow@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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

Primarily, this reduces a nesting level of a particularly long
block. Mostly code movement, a new docstring is created.

(It also has the effect of creating a fairly convenient choke point in
check_exprs for try/catch wrappers without making the nesting level even
worse.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/expr.py | 189 +++++++++++++++++++++++--------------------
 1 file changed, 100 insertions(+), 89 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 496f7e0333e..9dff0cd9080 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -586,6 +586,104 @@ def check_event(expr: _JSONObject, info: QAPISourceInfo) -> None:
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
+    if 'enum' in expr:
+        meta = 'enum'
+    elif 'union' in expr:
+        meta = 'union'
+    elif 'alternate' in expr:
+        meta = 'alternate'
+    elif 'struct' in expr:
+        meta = 'struct'
+    elif 'command' in expr:
+        meta = 'command'
+    elif 'event' in expr:
+        meta = 'event'
+    else:
+        raise QAPISemError(info, "expression is missing metatype")
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
+                   ['union', 'data'],
+                   ['base', 'discriminator', 'if', 'features'])
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
@@ -598,93 +696,6 @@ def check_exprs(exprs: List[_JSONObject]) -> List[_JSONObject]:
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
-        if 'enum' in expr:
-            meta = 'enum'
-        elif 'union' in expr:
-            meta = 'union'
-        elif 'alternate' in expr:
-            meta = 'alternate'
-        elif 'struct' in expr:
-            meta = 'struct'
-        elif 'command' in expr:
-            meta = 'command'
-        elif 'event' in expr:
-            meta = 'event'
-        else:
-            raise QAPISemError(info, "expression is missing metatype")
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
-                       ['union', 'data'],
-                       ['base', 'discriminator', 'if', 'features'])
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
2.30.2


