Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F179A40FDDE
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 18:28:18 +0200 (CEST)
Received: from localhost ([::1]:33604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRGio-0001Nk-19
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 12:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mRGUe-0007Oj-8t
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:13:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mRGUZ-0005qr-TI
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:13:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631895214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NTznk6WVjB6j4tC5d3KmZYtmFaLYYucUp8s3eIaVkXI=;
 b=LO2jkulaUYrvF58wl2HLHwVpe+YJMhZbGWp0sZbNkYwz8CSwhdxyimfXht63EVAkuXiUMe
 Yiy3nj50faj/7MGZ5yJp0h/mHXsH9zOxnGUzpoiJbxUoBL7SqEOuB1OjAIJnSJqT+19UUD
 z2/5qnNYMYJz6fBUSb4+a7DPUGHI5aQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-vKbky6awOxK0z-EogR3XLQ-1; Fri, 17 Sep 2021 12:13:33 -0400
X-MC-Unique: vKbky6awOxK0z-EogR3XLQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFFFA10168D0
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 16:13:32 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDCB77A5C5;
 Fri, 17 Sep 2021 16:13:31 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/8] qapi: Add interfaces for alias support to Visitor
Date: Fri, 17 Sep 2021 18:13:13 +0200
Message-Id: <20210917161320.201086-2-kwolf@redhat.com>
In-Reply-To: <20210917161320.201086-1-kwolf@redhat.com>
References: <20210917161320.201086-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: kwolf@redhat.com, jsnow@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds functions to the Visitor interface that can be used to define
aliases and alias scopes.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/qapi/visitor-impl.h | 12 ++++++++
 include/qapi/visitor.h      | 59 ++++++++++++++++++++++++++++++++++---
 qapi/qapi-visit-core.c      | 22 ++++++++++++++
 3 files changed, 89 insertions(+), 4 deletions(-)

diff --git a/include/qapi/visitor-impl.h b/include/qapi/visitor-impl.h
index 3b950f6e3d..704c5ad2d9 100644
--- a/include/qapi/visitor-impl.h
+++ b/include/qapi/visitor-impl.h
@@ -119,6 +119,18 @@ struct Visitor
     /* Optional */
     bool (*deprecated)(Visitor *v, const char *name);
 
+    /*
+     * Optional; intended for input visitors. If not given, aliases are
+     * ignored.
+     */
+    void (*define_alias)(Visitor *v, const char *name, const char **source);
+
+    /* Must be set if define_alias is set */
+    void (*start_alias_scope)(Visitor *v);
+
+    /* Must be set if define_alias is set */
+    void (*end_alias_scope)(Visitor *v);
+
     /* Must be set */
     VisitorType type;
 
diff --git a/include/qapi/visitor.h b/include/qapi/visitor.h
index b3c9ef7a81..3bf0f4dad2 100644
--- a/include/qapi/visitor.h
+++ b/include/qapi/visitor.h
@@ -220,10 +220,17 @@
  * </example>
  *
  * This file provides helpers for use by the generated
- * visit_type_FOO(): visit_optional() for the 'has_member' field
- * associated with optional 'member' in the C struct,
- * visit_next_list() for advancing through a FooList linked list, and
- * visit_is_input() for cleaning up on failure.
+ * visit_type_FOO():
+ *
+ * - visit_optional() for the 'has_member' field associated with
+ *   optional 'member' in the C struct,
+ * - visit_next_list() for advancing through a FooList linked list
+ * - visit_is_input() for cleaning up on failure
+ * - visit_define_alias() for defining alternative names for object
+ *   members in input visitors
+ * - visit_start/end_alias_scope() to limit the scope of aliases
+ *   within a single input object (e.g. aliases defined in the base
+ *   struct should not provide values for the parent struct)
  */
 
 /*** Useful types ***/
@@ -477,6 +484,50 @@ bool visit_deprecated_accept(Visitor *v, const char *name, Error **errp);
  */
 bool visit_deprecated(Visitor *v, const char *name);
 
+/*
+ * Defines a new alias rule.
+ *
+ * If @name is non-NULL, the member called @name in the external
+ * representation of the currently visited object is defined as an
+ * alias for the member described by @source.  It is not allowed to
+ * call this function when the currently visited type is not an
+ * object.
+ *
+ * If @name is NULL, all members of the object described by @source
+ * are considered to have alias members with the same key in the
+ * currently visited object.
+ *
+ * @source is a NULL-terminated non-empty array of names that describe
+ * the path to a member, starting from the currently visited object.
+ * All elements in @source except the last one should describe
+ * objects.  If an intermediate element refers to a member with a
+ * non-object type, the alias won't work (this case can legitimately
+ * happen in unions where an alias only makes sense for one branch,
+ * but not for another).
+ *
+ * The alias stays valid until the current alias scope ends.
+ * visit_start/end_struct() implicitly start/end an alias scope.
+ * Additionally, visit_start/end_alias_scope() can be used to explicitly
+ * create a nested alias scope.
+ */
+void visit_define_alias(Visitor *v, const char *name, const char **source);
+
+/*
+ * Begins an explicit alias scope.
+ *
+ * Alias definitions after here will only stay valid until the
+ * corresponding visit_end_alias_scope() is called.
+ */
+void visit_start_alias_scope(Visitor *v);
+
+/*
+ * Ends an explicit alias scope.
+ *
+ * Alias definitions between the correspoding visit_start_alias_scope()
+ * call and here go out of scope and won't apply in later code any more.
+ */
+void visit_end_alias_scope(Visitor *v);
+
 /*
  * Visit an enum value.
  *
diff --git a/qapi/qapi-visit-core.c b/qapi/qapi-visit-core.c
index a641adec51..79df6901ae 100644
--- a/qapi/qapi-visit-core.c
+++ b/qapi/qapi-visit-core.c
@@ -153,6 +153,28 @@ bool visit_deprecated(Visitor *v, const char *name)
     return true;
 }
 
+void visit_define_alias(Visitor *v, const char *name, const char **source)
+{
+    assert(source[0] != NULL);
+    if (v->define_alias) {
+        v->define_alias(v, name, source);
+    }
+}
+
+void visit_start_alias_scope(Visitor *v)
+{
+    if (v->start_alias_scope) {
+        v->start_alias_scope(v);
+    }
+}
+
+void visit_end_alias_scope(Visitor *v)
+{
+    if (v->end_alias_scope) {
+        v->end_alias_scope(v);
+    }
+}
+
 bool visit_is_input(Visitor *v)
 {
     return v->type == VISITOR_INPUT;
-- 
2.31.1


