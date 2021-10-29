Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B00B14403A1
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 21:55:57 +0200 (CEST)
Received: from localhost ([::1]:38330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgXym-0007JO-QN
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 15:55:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mgXaE-0000iR-F8
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:30:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mgXaA-0000sZ-I6
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:30:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635535829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=smtDNJMl0eUlnoCoyqHK+zFD6isrNx746B0qgnjcxxY=;
 b=gvHsZgY4KT5Lkk2LU/yVnmwxpbdtoa9EblOKwK+ZtifOwfNgOF88DG0jZLRkbwkFHRBa/u
 pX+8dVzZM8ml71JQQ5QztfP/7b9TrMQfWw28P9nr/+rQfIu8n982d+8aON699tVk66B9Fb
 1ux/eeLBYhL5pv+XnFf0x9E+AyavrP8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-FQJaG7XbPbGd1oZ7tbv2DQ-1; Fri, 29 Oct 2021 15:30:26 -0400
X-MC-Unique: FQJaG7XbPbGd1oZ7tbv2DQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E09D180830C;
 Fri, 29 Oct 2021 19:30:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 022F91B42C;
 Fri, 29 Oct 2021 19:30:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0593711380D7; Fri, 29 Oct 2021 21:30:16 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 8/9] qapi: Factor out compat_policy_input_ok()
Date: Fri, 29 Oct 2021 21:30:14 +0200
Message-Id: <20211029193015.1312198-9-armbru@redhat.com>
In-Reply-To: <20211029193015.1312198-1-armbru@redhat.com>
References: <20211029193015.1312198-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The code to check policy for handling deprecated input is triplicated.
Factor it out into compat_policy_input_ok() before I mess with it in
the next commit.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211028102520.747396-9-armbru@redhat.com>
[Policy code moved from qmp-dispatch.c to qapi-util.c to make visitors
link without qmp-dispatch.o]
---
 include/qapi/compat-policy.h |  7 +++++++
 qapi/qapi-util.c             | 37 ++++++++++++++++++++++++++++++++++++
 qapi/qapi-visit-core.c       | 18 ++++++------------
 qapi/qmp-dispatch.c          | 19 ++++--------------
 qapi/qobject-input-visitor.c | 19 ++++--------------
 5 files changed, 58 insertions(+), 42 deletions(-)

diff --git a/include/qapi/compat-policy.h b/include/qapi/compat-policy.h
index 1083f95122..8b7b25c0b5 100644
--- a/include/qapi/compat-policy.h
+++ b/include/qapi/compat-policy.h
@@ -13,10 +13,17 @@
 #ifndef QAPI_COMPAT_POLICY_H
 #define QAPI_COMPAT_POLICY_H
 
+#include "qapi/error.h"
 #include "qapi/qapi-types-compat.h"
 
 extern CompatPolicy compat_policy;
 
+bool compat_policy_input_ok(unsigned special_features,
+                            const CompatPolicy *policy,
+                            ErrorClass error_class,
+                            const char *kind, const char *name,
+                            Error **errp);
+
 /*
  * Create a QObject input visitor for @obj for use with QMP
  *
diff --git a/qapi/qapi-util.c b/qapi/qapi-util.c
index 3c24bb3d45..53b493cb7e 100644
--- a/qapi/qapi-util.c
+++ b/qapi/qapi-util.c
@@ -11,10 +11,47 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/compat-policy.h"
 #include "qapi/error.h"
 #include "qemu/ctype.h"
 #include "qapi/qmp/qerror.h"
 
+CompatPolicy compat_policy;
+
+static bool compat_policy_input_ok1(const char *adjective,
+                                    CompatPolicyInput policy,
+                                    ErrorClass error_class,
+                                    const char *kind, const char *name,
+                                    Error **errp)
+{
+    switch (policy) {
+    case COMPAT_POLICY_INPUT_ACCEPT:
+        return true;
+    case COMPAT_POLICY_INPUT_REJECT:
+        error_set(errp, error_class, "%s %s %s disabled by policy",
+                  adjective, kind, name);
+        return false;
+    case COMPAT_POLICY_INPUT_CRASH:
+    default:
+        abort();
+    }
+}
+
+bool compat_policy_input_ok(unsigned special_features,
+                            const CompatPolicy *policy,
+                            ErrorClass error_class,
+                            const char *kind, const char *name,
+                            Error **errp)
+{
+    if ((special_features & 1u << QAPI_DEPRECATED)
+        && !compat_policy_input_ok1("Deprecated",
+                                    policy->deprecated_input,
+                                    error_class, kind, name, errp)) {
+        return false;
+    }
+    return true;
+}
+
 const char *qapi_enum_lookup(const QEnumLookup *lookup, int val)
 {
     assert(val >= 0 && val < lookup->size);
diff --git a/qapi/qapi-visit-core.c b/qapi/qapi-visit-core.c
index 34c59286b2..6c13510a2b 100644
--- a/qapi/qapi-visit-core.c
+++ b/qapi/qapi-visit-core.c
@@ -13,6 +13,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/compat-policy.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qerror.h"
 #include "qapi/visitor.h"
@@ -409,18 +410,11 @@ static bool input_type_enum(Visitor *v, const char *name, int *obj,
     }
 
     if (lookup->special_features
-        && (lookup->special_features[value] & QAPI_DEPRECATED)) {
-        switch (v->compat_policy.deprecated_input) {
-        case COMPAT_POLICY_INPUT_ACCEPT:
-            break;
-        case COMPAT_POLICY_INPUT_REJECT:
-            error_setg(errp, "Deprecated value '%s' disabled by policy",
-                       enum_str);
-            return false;
-        case COMPAT_POLICY_INPUT_CRASH:
-        default:
-            abort();
-        }
+        && !compat_policy_input_ok(lookup->special_features[value],
+                                   &v->compat_policy,
+                                   ERROR_CLASS_GENERIC_ERROR,
+                                   "value", enum_str, errp)) {
+        return false;
     }
 
     *obj = value;
diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
index 8cca18c891..d378bccac7 100644
--- a/qapi/qmp-dispatch.c
+++ b/qapi/qmp-dispatch.c
@@ -26,8 +26,6 @@
 #include "qemu/coroutine.h"
 #include "qemu/main-loop.h"
 
-CompatPolicy compat_policy;
-
 Visitor *qobject_input_visitor_new_qmp(QObject *obj)
 {
     Visitor *v = qobject_input_visitor_new(obj);
@@ -176,19 +174,10 @@ QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request,
                   "The command %s has not been found", command);
         goto out;
     }
-    if (cmd->special_features & 1u << QAPI_DEPRECATED) {
-        switch (compat_policy.deprecated_input) {
-        case COMPAT_POLICY_INPUT_ACCEPT:
-            break;
-        case COMPAT_POLICY_INPUT_REJECT:
-            error_set(&err, ERROR_CLASS_COMMAND_NOT_FOUND,
-                      "Deprecated command %s disabled by policy",
-                      command);
-            goto out;
-        case COMPAT_POLICY_INPUT_CRASH:
-        default:
-            abort();
-        }
+    if (!compat_policy_input_ok(cmd->special_features, &compat_policy,
+                                ERROR_CLASS_COMMAND_NOT_FOUND,
+                                "command", command, &err)) {
+        goto out;
     }
     if (!cmd->enabled) {
         error_set(&err, ERROR_CLASS_COMMAND_NOT_FOUND,
diff --git a/qapi/qobject-input-visitor.c b/qapi/qobject-input-visitor.c
index c120dbdd92..f0b4c7ca9d 100644
--- a/qapi/qobject-input-visitor.c
+++ b/qapi/qobject-input-visitor.c
@@ -14,6 +14,7 @@
 
 #include "qemu/osdep.h"
 #include <math.h>
+#include "qapi/compat-policy.h"
 #include "qapi/error.h"
 #include "qapi/qobject-input-visitor.h"
 #include "qapi/visitor-impl.h"
@@ -666,21 +667,9 @@ static bool qobject_input_policy_reject(Visitor *v, const char *name,
                                         unsigned special_features,
                                         Error **errp)
 {
-    if (!(special_features & 1u << QAPI_DEPRECATED)) {
-        return false;
-    }
-
-    switch (v->compat_policy.deprecated_input) {
-    case COMPAT_POLICY_INPUT_ACCEPT:
-        return false;
-    case COMPAT_POLICY_INPUT_REJECT:
-        error_setg(errp, "Deprecated parameter '%s' disabled by policy",
-                   name);
-        return true;
-    case COMPAT_POLICY_INPUT_CRASH:
-    default:
-        abort();
-    }
+    return !compat_policy_input_ok(special_features, &v->compat_policy,
+                                   ERROR_CLASS_GENERIC_ERROR,
+                                   "parameter", name, errp);
 }
 
 static void qobject_input_free(Visitor *v)
-- 
2.31.1


