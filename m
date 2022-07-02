Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D35563FCF
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 13:43:26 +0200 (CEST)
Received: from localhost ([::1]:44262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7bX3-000447-IA
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 07:43:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o7bNz-0003MZ-45
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 07:34:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o7bNs-0007yj-P3
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 07:34:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656761636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J20t4lF9lHmYknS0yWn5MoQszWEEaQKBQdjeVtzgefw=;
 b=AbOaCMzoPpOa7/8eFQ5nZxkN8jgvXCn2ws82Isa5xUskNVUVtoUSNiUbJgwHTZCHu8ZlJQ
 MQrmqpicsKdsMmMGWZ4DMJhc6zeZ+f3LjTqDpFi4NONubUPW8fiHiV43QmlRDeLfwzyJQc
 7f7542+MGIay5UFtyxLunfKDZX9QaBI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-364-7DuygAgEPyKkG5q3iRxabQ-1; Sat, 02 Jul 2022 07:33:55 -0400
X-MC-Unique: 7DuygAgEPyKkG5q3iRxabQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD0FB801231;
 Sat,  2 Jul 2022 11:33:54 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.194.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8AD82492C3B;
 Sat,  2 Jul 2022 11:33:51 +0000 (UTC)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Peter Xu <peterx@redhat.com>,
 Alberto Garcia <berto@igalia.com>, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 Markus Armbruster <armbru@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Lieven <pl@kamp.de>, Alberto Faria <afaria@redhat.com>
Subject: [RFC 5/8] static-analyzer: Enforce coroutine_fn restrictions on
 function pointers
Date: Sat,  2 Jul 2022 12:33:28 +0100
Message-Id: <20220702113331.2003820-6-afaria@redhat.com>
In-Reply-To: <20220702113331.2003820-1-afaria@redhat.com>
References: <20220702113331.2003820-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Extend static-analyzer.py to enforce coroutine_fn restrictions on
function pointer operations.

Invalid operations include assigning a coroutine_fn value to a
non-coroutine_fn function pointer, and invoking a coroutine_fn function
pointer from a non-coroutine_fn function.

Signed-off-by: Alberto Faria <afaria@redhat.com>
---
 static-analyzer.py | 147 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 143 insertions(+), 4 deletions(-)

diff --git a/static-analyzer.py b/static-analyzer.py
index 8abc552b82..485d054052 100755
--- a/static-analyzer.py
+++ b/static-analyzer.py
@@ -36,6 +36,8 @@
     TranslationUnit,
     TranslationUnitLoadError,
     TypeKind,
+    SourceRange,
+    TokenGroup,
 )
 
 Cursor.__hash__ = lambda self: self.hash  # so `Cursor`s can be dict keys
@@ -515,6 +517,90 @@ def check_coroutine_calls(
                 log(call, "non-coroutine_fn function calls coroutine_fn")
 
 
+@check("coroutine-pointers")
+def check_coroutine_pointers(
+    translation_unit: TranslationUnit,
+    translation_unit_path: str,
+    log: Callable[[Cursor, str], None],
+) -> None:
+
+    # What we would really like is to associate annotation attributes with types
+    # directly, but that doesn't seem possible. Instead, we have to look at the
+    # relevant variable/field/parameter declarations, and follow typedefs.
+
+    # This doesn't check all possible ways of assigning to a coroutine_fn
+    # field/variable/parameter. That would probably be too much work.
+
+    # TODO: Check struct/union/array initialization.
+    # TODO: Check assignment to struct/union/array fields.
+
+    for [*_, node] in all_paths(translation_unit.cursor):
+
+        # check initialization of variables using coroutine_fn values
+
+        if node.kind == CursorKind.VAR_DECL:
+
+            children = [
+                c
+                for c in node.get_children()
+                if c.kind
+                not in [
+                    CursorKind.ANNOTATE_ATTR,
+                    CursorKind.INIT_LIST_EXPR,
+                    CursorKind.TYPE_REF,
+                    CursorKind.UNEXPOSED_ATTR,
+                ]
+            ]
+
+            if (
+                len(children) == 1
+                and not is_coroutine_fn(node)
+                and is_coroutine_fn(children[0])
+            ):
+                log(node, "assigning coroutine_fn to non-coroutine_fn")
+
+        # check initialization of fields using coroutine_fn values
+
+        # TODO: This only checks designator initializers.
+
+        if node.kind == CursorKind.INIT_LIST_EXPR:
+
+            for initializer in filter(
+                lambda n: n.kind == CursorKind.UNEXPOSED_EXPR,
+                node.get_children(),
+            ):
+
+                children = list(initializer.get_children())
+
+                if (
+                    len(children) == 2
+                    and children[0].kind == CursorKind.MEMBER_REF
+                    and not is_coroutine_fn(children[0].referenced)
+                    and is_coroutine_fn(children[1])
+                ):
+                    log(
+                        initializer,
+                        "assigning coroutine_fn to non-coroutine_fn",
+                    )
+
+        # check assignments of coroutine_fn values to variables or fields
+
+        if is_binary_operator(node, "="):
+
+            [left, right] = node.get_children()
+
+            if (
+                left.kind
+                in [
+                    CursorKind.DECL_REF_EXPR,
+                    CursorKind.MEMBER_REF_EXPR,
+                ]
+                and not is_coroutine_fn(left.referenced)
+                and is_coroutine_fn(right)
+            ):
+                log(node, "assigning coroutine_fn to non-coroutine_fn")
+
+
 # ---------------------------------------------------------------------------- #
 # Traversal
 
@@ -555,6 +641,31 @@ def subtrees_matching(
 # Node predicates
 
 
+def is_binary_operator(node: Cursor, operator: str) -> bool:
+    return (
+        node.kind == CursorKind.BINARY_OPERATOR
+        and get_binary_operator_spelling(node) == operator
+    )
+
+
+def get_binary_operator_spelling(node: Cursor) -> Optional[str]:
+
+    assert node.kind == CursorKind.BINARY_OPERATOR
+
+    [left, right] = node.get_children()
+
+    op_range = SourceRange.from_locations(left.extent.end, right.extent.start)
+
+    tokens = list(TokenGroup.get_tokens(node.translation_unit, op_range))
+    if not tokens:
+        # Can occur when left and right children extents overlap due to
+        # misparsing.
+        return None
+
+    [op_token, *_] = tokens
+    return op_token.spelling
+
+
 def is_valid_coroutine_fn_usage(parent: Cursor) -> bool:
     """
     Check if an occurrence of `coroutine_fn` represented by a node with parent
@@ -599,7 +710,13 @@ def is_valid_allow_coroutine_fn_call_usage(node: Cursor) -> bool:
     `node` appears at a valid point in the AST. This is the case if its right
     operand is a call to:
 
-      - A function declared with the `coroutine_fn` annotation.
+      - A function declared with the `coroutine_fn` annotation, OR
+      - A field/variable/parameter whose declaration has the `coroutine_fn`
+        annotation, and of function pointer type, OR
+      - [TODO] A field/variable/parameter of a typedef function pointer type,
+        and the typedef has the `coroutine_fn` annotation, OR
+      - [TODO] A field/variable/parameter of a pointer to typedef function type,
+        and the typedef has the `coroutine_fn` annotation.
 
     TODO: Ensure that `__allow_coroutine_fn_call()` is in the body of a
     non-`coroutine_fn` function.
@@ -627,9 +744,31 @@ def is_coroutine_fn(node: Cursor) -> bool:
         else:
             break
 
-    return node.kind == CursorKind.FUNCTION_DECL and is_annotated_with(
-        node, "coroutine_fn"
-    )
+    if node.kind in [CursorKind.DECL_REF_EXPR, CursorKind.MEMBER_REF_EXPR]:
+        node = node.referenced
+
+    # ---
+
+    if node.kind == CursorKind.FUNCTION_DECL:
+        return is_annotated_with(node, "coroutine_fn")
+
+    if node.kind in [
+        CursorKind.FIELD_DECL,
+        CursorKind.VAR_DECL,
+        CursorKind.PARM_DECL,
+    ]:
+
+        if is_annotated_with(node, "coroutine_fn"):
+            return True
+
+        # TODO: If type is typedef or pointer to typedef, follow typedef.
+
+        return False
+
+    if node.kind == CursorKind.TYPEDEF_DECL:
+        return is_annotated_with(node, "coroutine_fn")
+
+    return False
 
 
 def is_annotated_with(node: Cursor, annotation: str) -> bool:
-- 
2.36.1


