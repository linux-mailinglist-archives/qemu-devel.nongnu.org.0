Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4910563FD1
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 13:44:36 +0200 (CEST)
Received: from localhost ([::1]:46074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7bYB-0005NE-Ty
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 07:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o7bNp-0003BG-UE
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 07:33:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o7bNn-0007wo-Ut
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 07:33:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656761631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4RJMvRmvaUErr26isQn4HMpApGBcAGf31Hfvrw0Nv1E=;
 b=TdN4w6bmtjOVbG2hFhzcd2Js0+9E4NHw9sX8pIBs3wQmm/NPWmlt5TDYZ6LdN89SWN+Aim
 zwBGd8kLuRSMDsfQzsJW9OTHR0WvvoIfHx/6WulEpsu5tsw3AdWXrOqHO0fVWszifOdHzL
 qtV1dYT9EKtPndn6OcNVrlxIvLVmkkU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-Irk5VbeEMAeXnJXriob9vg-1; Sat, 02 Jul 2022 07:33:48 -0400
X-MC-Unique: Irk5VbeEMAeXnJXriob9vg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4797380407C;
 Sat,  2 Jul 2022 11:33:47 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.194.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84583492C3B;
 Sat,  2 Jul 2022 11:33:44 +0000 (UTC)
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
Subject: [RFC 3/8] static-analyzer: Enforce coroutine_fn restrictions for
 direct calls
Date: Sat,  2 Jul 2022 12:33:26 +0100
Message-Id: <20220702113331.2003820-4-afaria@redhat.com>
In-Reply-To: <20220702113331.2003820-1-afaria@redhat.com>
References: <20220702113331.2003820-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Add a static-analyzer.py check ensuring that non-coroutine_fn functions
don't perform direct calls to coroutine_fn functions.

For the few cases where this must happen, introduce an
__allow_coroutine_fn_call() macro that wraps offending calls and
overrides the static analyzer.

Signed-off-by: Alberto Faria <afaria@redhat.com>
---
 include/qemu/coroutine.h |  13 +++
 static-analyzer.py       | 207 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 220 insertions(+)

diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index 08c5bb3c76..40a4037525 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -42,7 +42,20 @@
  *       ....
  *   }
  */
+#ifdef __clang__
+#define coroutine_fn __attribute__((__annotate__("coroutine_fn")))
+#else
 #define coroutine_fn
+#endif
+
+/**
+ * This can wrap a call to a coroutine_fn from a non-coroutine_fn function and
+ * suppress the static analyzer's complaints.
+ *
+ * You don't want to use this.
+ */
+#define __allow_coroutine_fn_call(call) \
+    ((void)"__allow_coroutine_fn_call", call)
 
 typedef struct Coroutine Coroutine;
 
diff --git a/static-analyzer.py b/static-analyzer.py
index 010cc92212..8abc552b82 100755
--- a/static-analyzer.py
+++ b/static-analyzer.py
@@ -440,6 +440,81 @@ def function_occurrence_might_use_return_value(
             log(cursor, f"{cursor.spelling}() return value is never used")
 
 
+@check("coroutine-annotation-validity")
+def check_coroutine_annotation_validity(
+    translation_unit: TranslationUnit,
+    translation_unit_path: str,
+    log: Callable[[Cursor, str], None],
+) -> None:
+
+    for [*ancestors, node] in all_paths(translation_unit.cursor):
+
+        # validate annotation usage
+
+        if is_annotation(node, "coroutine_fn") and (
+            ancestors[-1] is None
+            or not is_valid_coroutine_fn_usage(ancestors[-1])
+        ):
+            log(node, "invalid coroutine_fn usage")
+
+        if is_comma_wrapper(
+            node, "__allow_coroutine_fn_call"
+        ) and not is_valid_allow_coroutine_fn_call_usage(node):
+            log(node, "invalid __allow_coroutine_fn_call usage")
+
+        # reject re-declarations with inconsistent annotations
+
+        if node.kind == CursorKind.FUNCTION_DECL:
+
+            def log_annotation_disagreement(annotation: str) -> None:
+                log(
+                    node,
+                    f"{annotation} annotation disagreement with"
+                    f" {format_location(node.canonical)}",
+                )
+
+            if is_coroutine_fn(node) != is_coroutine_fn(node.canonical):
+                log_annotation_disagreement("coroutine_fn")
+
+
+@check("coroutine-calls")
+def check_coroutine_calls(
+    translation_unit: TranslationUnit,
+    translation_unit_path: str,
+    log: Callable[[Cursor, str], None],
+) -> None:
+
+    for caller in subtrees_matching(
+        translation_unit.cursor,
+        lambda n: n.kind == CursorKind.FUNCTION_DECL and n.is_definition(),
+    ):
+
+        caller_is_coroutine = is_coroutine_fn(caller)
+
+        for [*_, call_parent, call] in filter(
+            lambda path: path[-1].kind == CursorKind.CALL_EXPR,
+            all_paths(caller),
+        ):
+
+            # We can get some "calls" that are actually things like top-level
+            # macro invocations.
+            if call.referenced is None:
+                continue
+
+            callee = call.referenced.canonical
+
+            # reject calls from non-coroutine_fn to coroutine_fn
+
+            if (
+                not caller_is_coroutine
+                and is_coroutine_fn(callee)
+                and not is_comma_wrapper(
+                    call_parent, "__allow_coroutine_fn_call"
+                )
+            ):
+                log(call, "non-coroutine_fn function calls coroutine_fn")
+
+
 # ---------------------------------------------------------------------------- #
 # Traversal
 
@@ -464,6 +539,138 @@ def aux(node: Cursor) -> Iterable[Sequence[Cursor]]:
     return aux(root)
 
 
+# Doesn't traverse yielded subtrees.
+def subtrees_matching(
+    root: Cursor, predicate: Callable[[Cursor], bool]
+) -> Iterable[Cursor]:
+
+    if predicate(root):
+        yield root
+    else:
+        for child in root.get_children():
+            yield from subtrees_matching(child, predicate)
+
+
+# ---------------------------------------------------------------------------- #
+# Node predicates
+
+
+def is_valid_coroutine_fn_usage(parent: Cursor) -> bool:
+    """
+    Check if an occurrence of `coroutine_fn` represented by a node with parent
+    `parent` appears at a valid point in the AST. This is the case if `parent`
+    is:
+
+      - A function declaration/definition, OR
+      - A field/variable/parameter declaration with a function pointer type, OR
+      - A typedef of a function type or function pointer type.
+    """
+
+    if parent.kind == CursorKind.FUNCTION_DECL:
+        return True
+
+    canonical_type = parent.type.get_canonical()
+
+    def parent_type_is_function() -> bool:
+        return canonical_type.kind == TypeKind.FUNCTIONPROTO
+
+    def parent_type_is_function_pointer() -> bool:
+        return (
+            canonical_type.kind == TypeKind.POINTER
+            and canonical_type.get_pointee().kind == TypeKind.FUNCTIONPROTO
+        )
+
+    if parent.kind in [
+        CursorKind.FIELD_DECL,
+        CursorKind.VAR_DECL,
+        CursorKind.PARM_DECL,
+    ]:
+        return parent_type_is_function_pointer()
+
+    if parent.kind == CursorKind.TYPEDEF_DECL:
+        return parent_type_is_function() or parent_type_is_function_pointer()
+
+    return False
+
+
+def is_valid_allow_coroutine_fn_call_usage(node: Cursor) -> bool:
+    """
+    Check if an occurrence of `__allow_coroutine_fn_call()` represented by node
+    `node` appears at a valid point in the AST. This is the case if its right
+    operand is a call to:
+
+      - A function declared with the `coroutine_fn` annotation.
+
+    TODO: Ensure that `__allow_coroutine_fn_call()` is in the body of a
+    non-`coroutine_fn` function.
+    """
+
+    [_, call] = node.get_children()
+
+    if call.kind != CursorKind.CALL_EXPR:
+        return False
+
+    return is_coroutine_fn(call.referenced)
+
+
+def is_coroutine_fn(node: Cursor) -> bool:
+    """
+    Check whether the given `node` should be considered to be `coroutine_fn`.
+
+    This assumes valid usage of `coroutine_fn`.
+    """
+
+    while node.kind in [CursorKind.PAREN_EXPR, CursorKind.UNEXPOSED_EXPR]:
+        children = list(node.get_children())
+        if len(children) == 1:
+            node = children[0]
+        else:
+            break
+
+    return node.kind == CursorKind.FUNCTION_DECL and is_annotated_with(
+        node, "coroutine_fn"
+    )
+
+
+def is_annotated_with(node: Cursor, annotation: str) -> bool:
+    return any(is_annotation(c, annotation) for c in node.get_children())
+
+
+def is_annotation(node: Cursor, annotation: str) -> bool:
+    return node.kind == CursorKind.ANNOTATE_ATTR and node.spelling == annotation
+
+
+# A "comma wrapper" is the pattern `((void)string_literal, expr)`. The `expr` is
+# said to be "comma wrapped".
+def is_comma_wrapper(node: Cursor, literal: str) -> bool:
+
+    # TODO: Do we need to check that the operator is `,`? Is there another
+    # operator that can combine void and an expr?
+
+    if node.kind != CursorKind.BINARY_OPERATOR:
+        return False
+
+    [left, _right] = node.get_children()
+
+    if (
+        left.kind != CursorKind.CSTYLE_CAST_EXPR
+        or left.type.kind != TypeKind.VOID
+    ):
+        return False
+
+    [unexposed_expr] = left.get_children()
+
+    if unexposed_expr.kind != CursorKind.UNEXPOSED_EXPR:
+        return False
+
+    [string_literal] = unexposed_expr.get_children()
+
+    return (
+        string_literal.kind == CursorKind.STRING_LITERAL
+        and string_literal.spelling == f'"{literal}"'
+    )
+
+
 # ---------------------------------------------------------------------------- #
 # Utilities handy for development
 
-- 
2.36.1


