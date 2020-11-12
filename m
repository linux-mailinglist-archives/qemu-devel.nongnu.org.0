Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 296C02B0B50
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 18:33:00 +0100 (CET)
Received: from localhost ([::1]:48864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdGSx-0005CL-7M
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 12:32:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdGPJ-0001HN-R5
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 12:29:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdGPG-0006sJ-D9
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 12:29:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605202149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T5aXtMe1jfNRMPI4R9wZ1lYUG2xTKyftwmN1cwLLpUU=;
 b=RCjqIMRyDy7ufp0fZfHAK0ZS6m6U4nazZYJ7Fytgojv1D+rPi05IsMcOd6GJG9b2n4M2OQ
 j/bum9J68ZFDh3KrNvJ3hFgeJ1oV7drA8yKAZJk+Qke25eI268hEAGwVIN2UvPBiBpXh+9
 h4LzwkLkxGDYbe+BmFYWglDjVmhrBvg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-rBX2kb0JMW6nBFwpbwn8Mw-1; Thu, 12 Nov 2020 12:29:07 -0500
X-MC-Unique: rBX2kb0JMW6nBFwpbwn8Mw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 610531074643
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 17:29:05 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-57.ams2.redhat.com [10.36.115.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FFFD5D9E4;
 Thu, 12 Nov 2020 17:29:00 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/6] qapi: Simplify full_name_nth() in qobject-input-visitor
Date: Thu, 12 Nov 2020 18:28:47 +0100
Message-Id: <20201112172850.401925-4-kwolf@redhat.com>
In-Reply-To: <20201112172850.401925-1-kwolf@redhat.com>
References: <20201112172850.401925-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 qapi/qobject-input-visitor.c | 38 ++++++++++++++++++------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/qapi/qobject-input-visitor.c b/qapi/qobject-input-visitor.c
index a00ac32682..1415561828 100644
--- a/qapi/qobject-input-visitor.c
+++ b/qapi/qobject-input-visitor.c
@@ -87,20 +87,16 @@ static QObjectInputVisitor *to_qiv(Visitor *v)
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
+ * Find the full name of something named @name in @so which @qiv is
+ * currently visiting.  If @name is NULL, find the full name of @so
+ * itself.
+ *
+ * The returned string is valid until the next full_name_so(@qiv) or
+ * destruction of @qiv.
  */
-static const char *full_name_nth(QObjectInputVisitor *qiv, const char *name,
-                                 int n)
+static const char *full_name_so(QObjectInputVisitor *qiv, const char *name,
+                                StackObject *so)
 {
-    StackObject *so;
     char buf[32];
 
     if (qiv->errname) {
@@ -109,10 +105,13 @@ static const char *full_name_nth(QObjectInputVisitor *qiv, const char *name,
         qiv->errname = g_string_new("");
     }
 
-    QSLIST_FOREACH(so , &qiv->stack, node) {
-        if (n) {
-            n--;
-        } else if (qobject_type(so->obj) == QTYPE_QDICT) {
+    if (!name && so) {
+        name = so->name;
+        so = QSLIST_NEXT(so, node);
+    }
+
+    for (; so; so = QSLIST_NEXT(so, node)) {
+        if (qobject_type(so->obj) == QTYPE_QDICT) {
             g_string_prepend(qiv->errname, name ?: "<anonymous>");
             g_string_prepend_c(qiv->errname, '.');
         } else {
@@ -123,7 +122,6 @@ static const char *full_name_nth(QObjectInputVisitor *qiv, const char *name,
         }
         name = so->name;
     }
-    assert(!n);
 
     if (name) {
         g_string_prepend(qiv->errname, name);
@@ -138,7 +136,9 @@ static const char *full_name_nth(QObjectInputVisitor *qiv, const char *name,
 
 static const char *full_name(QObjectInputVisitor *qiv, const char *name)
 {
-    return full_name_nth(qiv, name, 0);
+    StackObject *tos = QSLIST_FIRST(&qiv->stack);
+
+    return full_name_so(qiv, name, tos);
 }
 
 static QObject *qobject_input_try_get_object(QObjectInputVisitor *qiv,
@@ -473,7 +473,7 @@ static bool qobject_input_check_list(Visitor *v, Error **errp)
 
     if (tos->entry) {
         error_setg(errp, "Only %u list elements expected in %s",
-                   tos->index + 1, full_name_nth(qiv, NULL, 1));
+                   tos->index + 1, full_name_so(qiv, NULL, tos));
         return false;
     }
     return true;
-- 
2.28.0


