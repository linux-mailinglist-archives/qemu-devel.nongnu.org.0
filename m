Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8311B5850C6
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 15:22:11 +0200 (CEST)
Received: from localhost ([::1]:47196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHPwQ-0006qs-FD
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 09:22:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1oHPdD-0007tn-4p
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 09:02:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1oHPdA-0000Hn-S9
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 09:02:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659099736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5aq34TDaSxwi9e349XzPmgkZI0FYYnHKISwQlOSnwFY=;
 b=JeFwebZO937IqYdgi25vOtvHFWOYE5pm4j04Xb9lsswisnJeOmd7yQVz0nq2Zf47VCpNCM
 uhxyQSUJPfCEguqlJAXd7CqPWA4567q01YNGfnhOhxtiFylvm0JnZfFCWYA11UuVyuuwfj
 9RqLoyAYChZfSbBjDzJGzU6s+jLhbD0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-pTpng5WZMaWrS0heup9pHg-1; Fri, 29 Jul 2022 09:02:14 -0400
X-MC-Unique: pTpng5WZMaWrS0heup9pHg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C62678039A1;
 Fri, 29 Jul 2022 13:02:13 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20E5D2026D64;
 Fri, 29 Jul 2022 13:02:03 +0000 (UTC)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Hannes Reinecke <hare@suse.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Peter Lieven <pl@kamp.de>, kvm@vger.kernel.org,
 Xie Yongji <xieyongji@bytedance.com>, Eric Auger <eric.auger@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Eric Blake <eblake@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Stefan Weil <sw@weilnetz.de>, Klaus Jensen <its@irrelevant.dk>,
 Laurent Vivier <lvivier@redhat.com>, Alberto Garcia <berto@igalia.com>,
 Michael Roth <michael.roth@amd.com>, Juan Quintela <quintela@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-block@nongnu.org,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Greg Kurz <groug@kaod.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Amit Shah <amit@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Richard W.M. Jones" <rjones@redhat.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Alberto Faria <afaria@redhat.com>
Subject: [RFC v2 07/10] static-analyzer: Enforce coroutine_fn restrictions on
 function pointers
Date: Fri, 29 Jul 2022 14:00:36 +0100
Message-Id: <20220729130040.1428779-8-afaria@redhat.com>
In-Reply-To: <20220729130040.1428779-1-afaria@redhat.com>
References: <20220729130040.1428779-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Extend static-analyzer.py's "coroutine_fn" check to enforce coroutine_fn
restrictions on function pointer operations.

Invalid operations include assigning a coroutine_fn value to a
non-coroutine_fn function pointer, and invoking a coroutine_fn function
pointer from a non-coroutine_fn function.

Signed-off-by: Alberto Faria <afaria@redhat.com>
---
 static_analyzer/__init__.py     |  27 ++++++++
 static_analyzer/coroutine_fn.py | 115 ++++++++++++++++++++++++++++++--
 2 files changed, 138 insertions(+), 4 deletions(-)

diff --git a/static_analyzer/__init__.py b/static_analyzer/__init__.py
index 5abdbd21a3..90992d3500 100644
--- a/static_analyzer/__init__.py
+++ b/static_analyzer/__init__.py
@@ -24,6 +24,8 @@
     Cursor,
     CursorKind,
     SourceLocation,
+    SourceRange,
+    TokenGroup,
     TranslationUnit,
     TypeKind,
     conf,
@@ -117,6 +119,31 @@ def actual_visitor(node: Cursor, parent: Cursor, client_data: None) -> int:
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
 def might_have_attribute(node: Cursor, attr: Union[CursorKind, str]) -> bool:
     """
     Check whether any of `node`'s children are an attribute of the given kind,
diff --git a/static_analyzer/coroutine_fn.py b/static_analyzer/coroutine_fn.py
index f70a3167eb..a16dcbeb52 100644
--- a/static_analyzer/coroutine_fn.py
+++ b/static_analyzer/coroutine_fn.py
@@ -8,6 +8,7 @@
     check,
     is_annotated_with,
     is_annotation,
+    is_binary_operator,
     is_comma_wrapper,
     visit,
 )
@@ -22,6 +23,7 @@ def check_coroutine_fn(context: CheckContext) -> None:
     def visitor(node: Cursor) -> VisitorResult:
 
         validate_annotations(context, node)
+        check_function_pointers(context, node)
 
         if node.kind == CursorKind.FUNCTION_DECL and node.is_definition():
             check_direct_calls(context, node)
@@ -91,6 +93,83 @@ def visitor(node: Cursor) -> VisitorResult:
         visit(caller, visitor)
 
 
+def check_function_pointers(context: CheckContext, node: Cursor) -> None:
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
+    # check initialization of variables using coroutine_fn values
+
+    if node.kind == CursorKind.VAR_DECL:
+
+        children = [
+            c
+            for c in node.get_children()
+            if c.kind
+            not in [
+                CursorKind.ANNOTATE_ATTR,
+                CursorKind.INIT_LIST_EXPR,
+                CursorKind.TYPE_REF,
+                CursorKind.UNEXPOSED_ATTR,
+            ]
+        ]
+
+        if (
+            len(children) == 1
+            and not is_coroutine_fn(node)
+            and is_coroutine_fn(children[0])
+        ):
+            context.report(node, "assigning coroutine_fn to non-coroutine_fn")
+
+    # check initialization of fields using coroutine_fn values
+
+    # TODO: This only checks designator initializers.
+
+    if node.kind == CursorKind.INIT_LIST_EXPR:
+
+        for initializer in filter(
+            lambda n: n.kind == CursorKind.UNEXPOSED_EXPR,
+            node.get_children(),
+        ):
+
+            children = list(initializer.get_children())
+
+            if (
+                len(children) == 2
+                and children[0].kind == CursorKind.MEMBER_REF
+                and not is_coroutine_fn(children[0].referenced)
+                and is_coroutine_fn(children[1])
+            ):
+                context.report(
+                    initializer,
+                    "assigning coroutine_fn to non-coroutine_fn",
+                )
+
+    # check assignments of coroutine_fn values to variables or fields
+
+    if is_binary_operator(node, "="):
+
+        [left, right] = node.get_children()
+
+        if (
+            left.kind
+            in [
+                CursorKind.DECL_REF_EXPR,
+                CursorKind.MEMBER_REF_EXPR,
+            ]
+            and not is_coroutine_fn(left.referenced)
+            and is_coroutine_fn(right)
+        ):
+            context.report(node, "assigning coroutine_fn to non-coroutine_fn")
+
+
 # ---------------------------------------------------------------------------- #
 
 
@@ -138,7 +217,13 @@ def is_valid_allow_coroutine_fn_call_usage(node: Cursor) -> bool:
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
@@ -165,9 +250,31 @@ def is_coroutine_fn(node: Cursor) -> bool:
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
 
 
 # ---------------------------------------------------------------------------- #
-- 
2.37.1


