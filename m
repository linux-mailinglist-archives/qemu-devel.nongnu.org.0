Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7328A3EA84A
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 18:13:32 +0200 (CEST)
Received: from localhost ([::1]:43432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEDKk-0007BM-TF
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 12:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mEDJ7-0005BB-8b
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 12:11:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mEDJ3-0001NN-CO
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 12:11:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628784704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H76Y1c/QXnY6CPybEgO8I6XEVH5Nn00/hcbCGywgZA8=;
 b=fAXIjnkSak7F2/l0Cud9i785YrL8uk4kSm6+EKODub84CfqU/PFA5oF5KPJWm5v9k18IPi
 KsGDQvmN54lypDrR3D4vNyIgNoTyPF1lKfTqiikazZf+ammSHllmfA/XQFurOrwLWDKJNS
 5p0cs6Z6wUBV8pBq7tEG/rYfSMBM9o0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-pNNSTi2BPN-M36nD4GDT3g-1; Thu, 12 Aug 2021 12:11:43 -0400
X-MC-Unique: pNNSTi2BPN-M36nD4GDT3g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A4B01012D9E
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 16:11:42 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 991045C25A;
 Thu, 12 Aug 2021 16:11:41 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/6] qapi: Simplify full_name_nth() in qobject-input-visitor
Date: Thu, 12 Aug 2021 18:11:28 +0200
Message-Id: <20210812161131.92017-4-kwolf@redhat.com>
In-Reply-To: <20210812161131.92017-1-kwolf@redhat.com>
References: <20210812161131.92017-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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

Instead of counting how many elements from the top of the stack we need
to ignore until we find the thing we're interested in, we can just
directly pass the StackObject pointer because all callers already know
it.

We only need a different way now to tell if we want to know the name of
something contained in the given StackObject or of the StackObject
itself. Make this explicit with a new boolean parameter.

This makes the function easier to use in cases where we have the
StackObject, but don't know how many steps down the stack it is. The
following patches will introduce such a caller.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/qobject-input-visitor.c | 43 ++++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/qapi/qobject-input-visitor.c b/qapi/qobject-input-visitor.c
index d0061d33d6..16a75442ff 100644
--- a/qapi/qobject-input-visitor.c
+++ b/qapi/qobject-input-visitor.c
@@ -110,20 +110,20 @@ static QObjectInputVisitor *to_qiv(Visitor *v)
 }
 
 /*
- * Find the full name of something @qiv is currently visiting.
- * @qiv is visiting something named @name in the stack of containers
- * @qiv->stack.
- * If @n is zero, return its full name.
- * If @n is positive, return the full name of the @n-th container
- * counting from the top.  The stack of containers must have at least
- * @n elements.
- * The returned string is valid until the next full_name_nth(@v) or
- * destruction of @v.
+ * Find the full name of a member in @so which @qiv is currently
+ * visiting.  If the currently visited thing is an object, @name is
+ * the (local) name of the member to describe.  If it is a list, @name
+ * is ignored and the current index (so->index) is included.
+ *
+ * If @skip_member is true, find the full name of @so itself instead.
+ * @name must be NULL then.
+ *
+ * The returned string is valid until the next full_name_so(@qiv) or
+ * destruction of @qiv.
  */
-static const char *full_name_nth(QObjectInputVisitor *qiv, const char *name,
-                                 int n)
+static const char *full_name_so(QObjectInputVisitor *qiv, const char *name,
+                                bool skip_member, StackObject *so)
 {
-    StackObject *so;
     char buf[32];
 
     if (qiv->errname) {
@@ -132,10 +132,14 @@ static const char *full_name_nth(QObjectInputVisitor *qiv, const char *name,
         qiv->errname = g_string_new("");
     }
 
-    QSLIST_FOREACH(so , &qiv->stack, node) {
-        if (n) {
-            n--;
-        } else if (qobject_type(so->obj) == QTYPE_QDICT) {
+    if (skip_member && so) {
+        assert(name == NULL);
+        name = so->name;
+        so = QSLIST_NEXT(so, node);
+    }
+
+    for (; so; so = QSLIST_NEXT(so, node)) {
+        if (qobject_type(so->obj) == QTYPE_QDICT) {
             g_string_prepend(qiv->errname, name ?: "<anonymous>");
             g_string_prepend_c(qiv->errname, '.');
         } else {
@@ -146,7 +150,6 @@ static const char *full_name_nth(QObjectInputVisitor *qiv, const char *name,
         }
         name = so->name;
     }
-    assert(!n);
 
     if (name) {
         g_string_prepend(qiv->errname, name);
@@ -161,7 +164,9 @@ static const char *full_name_nth(QObjectInputVisitor *qiv, const char *name,
 
 static const char *full_name(QObjectInputVisitor *qiv, const char *name)
 {
-    return full_name_nth(qiv, name, 0);
+    StackObject *tos = QSLIST_FIRST(&qiv->stack);
+
+    return full_name_so(qiv, name, false, tos);
 }
 
 static QObject *qobject_input_try_get_object(QObjectInputVisitor *qiv,
@@ -507,7 +512,7 @@ static bool qobject_input_check_list(Visitor *v, Error **errp)
 
     if (tos->entry) {
         error_setg(errp, "Only %u list elements expected in %s",
-                   tos->index + 1, full_name_nth(qiv, NULL, 1));
+                   tos->index + 1, full_name_so(qiv, NULL, true, tos));
         return false;
     }
     return true;
-- 
2.31.1


