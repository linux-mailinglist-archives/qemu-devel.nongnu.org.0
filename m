Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E40712A6B64
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Nov 2020 18:07:26 +0100 (CET)
Received: from localhost ([::1]:59682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaMFq-0001x9-1a
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 12:07:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kaMCw-0007xO-3T
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 12:04:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kaMCs-0005Bp-E0
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 12:04:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604509458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3HPCJDfpddIrodZ04DA1g5MRbX+/QiNc5S/n0QBIkV0=;
 b=Xe/yPIakvzvKC/My8obbq07L1E8vn7D7NLGMnmLYoJFW7wf7vEjdFAf2C2WVY+hvmv/BlJ
 Twx4NhmBYpsmfTLI/RXV+9eEnP5M3SvbaYYzqRqRallbVxZJ/m1BfcG0TShH1gTNWecWKz
 S4beXCblgwNMI/FLRjyMSkeY4w8tMU4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-XjdvfW7kOyiMujVqnri0yQ-1; Wed, 04 Nov 2020 12:04:16 -0500
X-MC-Unique: XjdvfW7kOyiMujVqnri0yQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B921711CC7EF
 for <qemu-devel@nongnu.org>; Wed,  4 Nov 2020 17:04:15 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 66FCD5C3E1;
 Wed,  4 Nov 2020 17:04:15 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 20/20] qapi,
 qemu-options: make all parsing visitors parse boolean options the same
Date: Wed,  4 Nov 2020 12:04:14 -0500
Message-Id: <20201104170414.546578-2-pbonzini@redhat.com>
In-Reply-To: <20201104170414.546578-1-pbonzini@redhat.com>
References: <20201104170414.546578-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 00:03:41
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

OptsVisitor, StringInputVisitor and the keyval visitor have
three different ideas of how a human could write the value of
a boolean option.  Pay homage to the backwards-compatibility
gods and make the new common helper accept all four sets (on/off,
true/false, y/n and yes/no), but remove case-insensitivity.

Since OptsVisitor is supposed to match qemu-options, adjust
it as well.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20201103161339.447118-1-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qapi/util.h          |  2 ++
 qapi/opts-visitor.c          | 14 +-------------
 qapi/qapi-util.c             | 23 +++++++++++++++++++++++
 qapi/qobject-input-visitor.c |  6 +-----
 qapi/string-input-visitor.c  | 17 +----------------
 util/qemu-option.c           | 20 ++------------------
 6 files changed, 30 insertions(+), 52 deletions(-)

diff --git a/include/qapi/util.h b/include/qapi/util.h
index bc312e90aa..6178e98e97 100644
--- a/include/qapi/util.h
+++ b/include/qapi/util.h
@@ -19,6 +19,8 @@ typedef struct QEnumLookup {
 const char *qapi_enum_lookup(const QEnumLookup *lookup, int val);
 int qapi_enum_parse(const QEnumLookup *lookup, const char *buf,
                     int def, Error **errp);
+bool qapi_bool_parse(const char *name, const char *value, bool *obj,
+                     Error **errp);
 
 int parse_qapi_name(const char *name, bool complete);
 
diff --git a/qapi/opts-visitor.c b/qapi/opts-visitor.c
index 7781c23a42..587f31baf6 100644
--- a/qapi/opts-visitor.c
+++ b/qapi/opts-visitor.c
@@ -368,7 +368,6 @@ opts_type_str(Visitor *v, const char *name, char **obj, Error **errp)
 }
 
 
-/* mimics qemu-option.c::parse_option_bool() */
 static bool
 opts_type_bool(Visitor *v, const char *name, bool *obj, Error **errp)
 {
@@ -379,19 +378,8 @@ opts_type_bool(Visitor *v, const char *name, bool *obj, Error **errp)
     if (!opt) {
         return false;
     }
-
     if (opt->str) {
-        if (strcmp(opt->str, "on") == 0 ||
-            strcmp(opt->str, "yes") == 0 ||
-            strcmp(opt->str, "y") == 0) {
-            *obj = true;
-        } else if (strcmp(opt->str, "off") == 0 ||
-            strcmp(opt->str, "no") == 0 ||
-            strcmp(opt->str, "n") == 0) {
-            *obj = false;
-        } else {
-            error_setg(errp, QERR_INVALID_PARAMETER_VALUE, opt->name,
-                       "on|yes|y|off|no|n");
+        if (!qapi_bool_parse(opt->name, opt->str, obj, errp)) {
             return false;
         }
     } else {
diff --git a/qapi/qapi-util.c b/qapi/qapi-util.c
index 29a6c98b53..3c24bb3d45 100644
--- a/qapi/qapi-util.c
+++ b/qapi/qapi-util.c
@@ -13,6 +13,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/ctype.h"
+#include "qapi/qmp/qerror.h"
 
 const char *qapi_enum_lookup(const QEnumLookup *lookup, int val)
 {
@@ -40,6 +41,28 @@ int qapi_enum_parse(const QEnumLookup *lookup, const char *buf,
     return def;
 }
 
+bool qapi_bool_parse(const char *name, const char *value, bool *obj, Error **errp)
+{
+    if (g_str_equal(value, "on") ||
+        g_str_equal(value, "yes") ||
+        g_str_equal(value, "true") ||
+        g_str_equal(value, "y")) {
+        *obj = true;
+        return true;
+    }
+    if (g_str_equal(value, "off") ||
+        g_str_equal(value, "no") ||
+        g_str_equal(value, "false") ||
+        g_str_equal(value, "n")) {
+        *obj = false;
+        return true;
+    }
+
+    error_setg(errp, QERR_INVALID_PARAMETER_VALUE, name,
+               "'on' or 'off'");
+    return false;
+}
+
 /*
  * Parse a valid QAPI name from @str.
  * A valid name consists of letters, digits, hyphen and underscore.
diff --git a/qapi/qobject-input-visitor.c b/qapi/qobject-input-visitor.c
index 7b184b50a7..23843b242e 100644
--- a/qapi/qobject-input-visitor.c
+++ b/qapi/qobject-input-visitor.c
@@ -512,11 +512,7 @@ static bool qobject_input_type_bool_keyval(Visitor *v, const char *name,
         return false;
     }
 
-    if (!strcmp(str, "on")) {
-        *obj = true;
-    } else if (!strcmp(str, "off")) {
-        *obj = false;
-    } else {
+    if (!qapi_bool_parse(name, str, obj, NULL)) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
                    full_name(qiv, name), "'on' or 'off'");
         return false;
diff --git a/qapi/string-input-visitor.c b/qapi/string-input-visitor.c
index 6e53396ea3..197139c1c0 100644
--- a/qapi/string-input-visitor.c
+++ b/qapi/string-input-visitor.c
@@ -332,22 +332,7 @@ static bool parse_type_bool(Visitor *v, const char *name, bool *obj,
     StringInputVisitor *siv = to_siv(v);
 
     assert(siv->lm == LM_NONE);
-    if (!strcasecmp(siv->string, "on") ||
-        !strcasecmp(siv->string, "yes") ||
-        !strcasecmp(siv->string, "true")) {
-        *obj = true;
-        return true;
-    }
-    if (!strcasecmp(siv->string, "off") ||
-        !strcasecmp(siv->string, "no") ||
-        !strcasecmp(siv->string, "false")) {
-        *obj = false;
-        return true;
-    }
-
-    error_setg(errp, QERR_INVALID_PARAMETER_TYPE, name ? name : "null",
-               "boolean");
-    return false;
+    return qapi_bool_parse(name ? name : "null", siv->string, obj, errp);
 }
 
 static bool parse_type_str(Visitor *v, const char *name, char **obj,
diff --git a/util/qemu-option.c b/util/qemu-option.c
index b9f93a7f8b..acefbc23fa 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -96,21 +96,6 @@ const char *get_opt_value(const char *p, char **value)
     return offset;
 }
 
-static bool parse_option_bool(const char *name, const char *value, bool *ret,
-                              Error **errp)
-{
-    if (!strcmp(value, "on")) {
-        *ret = 1;
-    } else if (!strcmp(value, "off")) {
-        *ret = 0;
-    } else {
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
-                   name, "'on' or 'off'");
-        return false;
-    }
-    return true;
-}
-
 static bool parse_option_number(const char *name, const char *value,
                                 uint64_t *ret, Error **errp)
 {
@@ -363,7 +348,7 @@ static bool qemu_opt_get_bool_helper(QemuOpts *opts, const char *name,
     if (opt == NULL) {
         def_val = find_default_by_name(opts, name);
         if (def_val) {
-            parse_option_bool(name, def_val, &ret, &error_abort);
+            qapi_bool_parse(name, def_val, &ret, &error_abort);
         }
         return ret;
     }
@@ -471,8 +456,7 @@ static bool qemu_opt_parse(QemuOpt *opt, Error **errp)
         /* nothing */
         return true;
     case QEMU_OPT_BOOL:
-        return parse_option_bool(opt->name, opt->str, &opt->value.boolean,
-                                 errp);
+        return qapi_bool_parse(opt->name, opt->str, &opt->value.boolean, errp);
     case QEMU_OPT_NUMBER:
         return parse_option_number(opt->name, opt->str, &opt->value.uint,
                                    errp);
-- 
2.26.2


