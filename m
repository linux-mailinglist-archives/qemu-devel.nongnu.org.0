Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC6B319270
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 19:42:45 +0100 (CET)
Received: from localhost ([::1]:60710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAGvN-0002WW-0K
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 13:42:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lAGlV-0003uB-NS
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 13:32:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lAGlM-0002aK-7m
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 13:32:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613068341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YtWnpxgSynxYNfkEmIFF9qrS7ajvKamh+DoUKn1xrko=;
 b=Wp6qffEQB+MGShBy5D7f+4THF8mmOF7pg5F/fBGNI5ZOYgt+dG3ctZo4Fe291/24yjx9dO
 KSruS0PvxSdiO92SsTjNFNO/ARxfBH94yxXjjLA5oSfmvyhPgIYfJVIKf+adf+72KC2WlG
 GWal7IgMFGFoOaJ2xfHlNdgUIZq/8XU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-4EkLj1axPumMRC3tV1yYrA-1; Thu, 11 Feb 2021 13:32:20 -0500
X-MC-Unique: 4EkLj1axPumMRC3tV1yYrA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1D5C1851B14
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 18:31:34 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-82.ams2.redhat.com [10.36.113.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB04C5C260;
 Thu, 11 Feb 2021 18:31:33 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/6] qapi: Simplify full_name_nth() in qobject-input-visitor
Date: Thu, 11 Feb 2021 19:31:15 +0100
Message-Id: <20210211183118.422036-4-kwolf@redhat.com>
In-Reply-To: <20210211183118.422036-1-kwolf@redhat.com>
References: <20210211183118.422036-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
itself. Passing name = NULL is the obvious way to request the latter.

This simplifies the interface and makes it easier to use in cases where
we have the StackObject, but don't know how many steps down the stack it
is.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/qobject-input-visitor.c | 43 ++++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/qapi/qobject-input-visitor.c b/qapi/qobject-input-visitor.c
index aa95cd49bd..dd04ef0027 100644
--- a/qapi/qobject-input-visitor.c
+++ b/qapi/qobject-input-visitor.c
@@ -108,20 +108,20 @@ static QObjectInputVisitor *to_qiv(Visitor *v)
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
@@ -130,10 +130,14 @@ static const char *full_name_nth(QObjectInputVisitor *qiv, const char *name,
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
@@ -144,7 +148,6 @@ static const char *full_name_nth(QObjectInputVisitor *qiv, const char *name,
         }
         name = so->name;
     }
-    assert(!n);
 
     if (name) {
         g_string_prepend(qiv->errname, name);
@@ -159,7 +162,9 @@ static const char *full_name_nth(QObjectInputVisitor *qiv, const char *name,
 
 static const char *full_name(QObjectInputVisitor *qiv, const char *name)
 {
-    return full_name_nth(qiv, name, 0);
+    StackObject *tos = QSLIST_FIRST(&qiv->stack);
+
+    return full_name_so(qiv, name, false, tos);
 }
 
 static QObject *qobject_input_try_get_object(QObjectInputVisitor *qiv,
@@ -503,7 +508,7 @@ static bool qobject_input_check_list(Visitor *v, Error **errp)
 
     if (tos->entry) {
         error_setg(errp, "Only %u list elements expected in %s",
-                   tos->index + 1, full_name_nth(qiv, NULL, 1));
+                   tos->index + 1, full_name_so(qiv, NULL, true, tos));
         return false;
     }
     return true;
-- 
2.29.2


