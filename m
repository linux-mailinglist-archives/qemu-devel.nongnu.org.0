Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EC5563FDB
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 13:48:02 +0200 (CEST)
Received: from localhost ([::1]:51896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7bbV-00015G-IF
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 07:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o7bO3-0003RD-OI
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 07:34:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o7bO1-0007zm-Ut
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 07:34:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656761645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qgAvujYqizfhFzEg/64loORf7tkDYZhXuaubHSCsHLM=;
 b=FH2x2UesCPQfh1wY/XuraaxZiJQ/A2G7MR3Za0gg49c0cbVcpAS0PmQRrJTTvQzjOrLuKh
 6Ot5Wq26T+KVZ9YIgIbI0LJPQBk5gLu3w6m9bemey9uiCf/5p0ZVF/aBJv7ZHTmA0qvYQn
 iXLJe5yzKG5nQtleTZj1i7KMwCUkoWc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-53-I_GKM4V1NfeADn2PeqoCzQ-1; Sat, 02 Jul 2022 07:34:02 -0400
X-MC-Unique: I_GKM4V1NfeADn2PeqoCzQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BDE991C068E2;
 Sat,  2 Jul 2022 11:34:01 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.194.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 853A1492C3B;
 Sat,  2 Jul 2022 11:33:58 +0000 (UTC)
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
Subject: [RFC 7/8] block: Add no_coroutine_fn marker
Date: Sat,  2 Jul 2022 12:33:30 +0100
Message-Id: <20220702113331.2003820-8-afaria@redhat.com>
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

When applied to a function, it advertises that it should not be called
from coroutine_fn functions.

Make generated_co_wrapper evaluate to no_coroutine_fn, as coroutine_fn
functions should instead directly call the coroutine_fn that backs the
generated_co_wrapper.

Extend static-analyzer.py's "coroutine-annotation-validity" and
"coroutine-calls" checks to enforce no_coroutine_fn rules.

Signed-off-by: Alberto Faria <afaria@redhat.com>
---
 include/block/block-common.h |  2 +-
 include/qemu/coroutine.h     | 12 ++++++++++++
 static-analyzer.py           | 35 +++++++++++++++++++++++++++++++++++
 3 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/include/block/block-common.h b/include/block/block-common.h
index fdb7306e78..4b60c8c6f2 100644
--- a/include/block/block-common.h
+++ b/include/block/block-common.h
@@ -42,7 +42,7 @@
  *
  * Read more in docs/devel/block-coroutine-wrapper.rst
  */
-#define generated_co_wrapper
+#define generated_co_wrapper no_coroutine_fn
 
 /* block.c */
 typedef struct BlockDriver BlockDriver;
diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index 40a4037525..11eea8cc79 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -48,6 +48,18 @@
 #define coroutine_fn
 #endif
 
+/**
+ * Mark a function that should never be called from a coroutine context
+ *
+ * This typically means that there is an analogous, coroutine_fn function that
+ * should be used instead.
+ */
+#ifdef __clang__
+#define no_coroutine_fn __attribute__((__annotate__("no_coroutine_fn")))
+#else
+#define no_coroutine_fn
+#endif
+
 /**
  * This can wrap a call to a coroutine_fn from a non-coroutine_fn function and
  * suppress the static analyzer's complaints.
diff --git a/static-analyzer.py b/static-analyzer.py
index 485d054052..ad7ee1ccf5 100755
--- a/static-analyzer.py
+++ b/static-analyzer.py
@@ -459,6 +459,12 @@ def check_coroutine_annotation_validity(
         ):
             log(node, "invalid coroutine_fn usage")
 
+        if is_annotation(node, "no_coroutine_fn") and (
+            ancestors[-1] is None
+            or not is_valid_no_coroutine_fn_usage(ancestors[-1])
+        ):
+            log(node, "invalid no_coroutine_fn usage")
+
         if is_comma_wrapper(
             node, "__allow_coroutine_fn_call"
         ) and not is_valid_allow_coroutine_fn_call_usage(node):
@@ -478,6 +484,9 @@ def log_annotation_disagreement(annotation: str) -> None:
             if is_coroutine_fn(node) != is_coroutine_fn(node.canonical):
                 log_annotation_disagreement("coroutine_fn")
 
+            if is_no_coroutine_fn(node) != is_no_coroutine_fn(node.canonical):
+                log_annotation_disagreement("no_coroutine_fn")
+
 
 @check("coroutine-calls")
 def check_coroutine_calls(
@@ -516,6 +525,11 @@ def check_coroutine_calls(
             ):
                 log(call, "non-coroutine_fn function calls coroutine_fn")
 
+            # reject calls from coroutine_fn to no_coroutine_fn
+
+            if caller_is_coroutine and is_no_coroutine_fn(callee):
+                log(call, f"coroutine_fn calls no_coroutine_fn function")
+
 
 @check("coroutine-pointers")
 def check_coroutine_pointers(
@@ -704,6 +718,16 @@ def parent_type_is_function_pointer() -> bool:
     return False
 
 
+def is_valid_no_coroutine_fn_usage(parent: Cursor) -> bool:
+    """
+    Checks if an occurrence of `no_coroutine_fn` represented by a node with
+    parent `parent` appears at a valid point in the AST. This is the case if the
+    parent is a function declaration/definition.
+    """
+
+    return parent.kind == CursorKind.FUNCTION_DECL
+
+
 def is_valid_allow_coroutine_fn_call_usage(node: Cursor) -> bool:
     """
     Check if an occurrence of `__allow_coroutine_fn_call()` represented by node
@@ -771,6 +795,17 @@ def is_coroutine_fn(node: Cursor) -> bool:
     return False
 
 
+def is_no_coroutine_fn(node: Cursor) -> bool:
+    """
+    Checks whether the given `node` should be considered to be
+    `no_coroutine_fn`.
+
+    This assumes valid usage of `no_coroutine_fn`.
+    """
+
+    return is_annotated_with(node, "no_coroutine_fn")
+
+
 def is_annotated_with(node: Cursor, annotation: str) -> bool:
     return any(is_annotation(c, annotation) for c in node.get_children())
 
-- 
2.36.1


