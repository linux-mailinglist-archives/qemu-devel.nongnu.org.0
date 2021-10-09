Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7700A427A08
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 14:17:52 +0200 (CEST)
Received: from localhost ([::1]:42476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZBIV-0000GM-Ez
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 08:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mZBBF-0007yk-Cm
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 08:10:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mZBBD-00076a-9O
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 08:10:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633781417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uJR8Sv8Xd/WQ5Q0X0Kbg81qzZtluBesx0b9o4FNGtHE=;
 b=P/6308Qu58dTO7cijGw//kae4B2M6yJa3cggDxFDcB3hjRruTInzoiNyYyPVtfQ1os2ZJX
 M5yjDGW7AyDOWuRaJ1jYpjKD+TpzKMUW6YZHZgKcxb5NfZpsjWGiddbv2DN5boXjajNOzX
 KXtZYv6tX5JMhW+Yrbb3nONVUAjYT6A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-Lr9zo2fIMw2jXvRxPT0kJA-1; Sat, 09 Oct 2021 08:10:15 -0400
X-MC-Unique: Lr9zo2fIMw2jXvRxPT0kJA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B871804302;
 Sat,  9 Oct 2021 12:10:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BBE505F4F1;
 Sat,  9 Oct 2021 12:09:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4ED481138526; Sat,  9 Oct 2021 14:09:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/5] qapi: Implement deprecated-input={reject,
 crash} for enum values
Date: Sat,  9 Oct 2021 14:09:43 +0200
Message-Id: <20211009120944.2858887-5-armbru@redhat.com>
In-Reply-To: <20211009120944.2858887-1-armbru@redhat.com>
References: <20211009120944.2858887-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berrange@redhat.com,
 libvir-list@redhat.com, eblake@redhat.com, mdroth@linux.vnet.ibm.com,
 pkrempa@redhat.com, marcandre.lureau@redhat.com, jsnow@redhat.com,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This copies the code implementing the policy from qapi/qmp-dispatch.c
to qapi/qobject-input-visitor.c.  Tolerable, but if we acquire more
copes, we should look into factoring them out.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 docs/devel/qapi-code-gen.rst |  6 ++++--
 qapi/compat.json             |  3 ++-
 include/qapi/util.h          |  6 +++++-
 qapi/qapi-visit-core.c       | 18 +++++++++++++++---
 scripts/qapi/types.py        | 17 ++++++++++++++++-
 5 files changed, 42 insertions(+), 8 deletions(-)

diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
index 00334e9fb8..006a6f4a9a 100644
--- a/docs/devel/qapi-code-gen.rst
+++ b/docs/devel/qapi-code-gen.rst
@@ -708,8 +708,10 @@ QEMU shows a certain behaviour.
 Special features
 ~~~~~~~~~~~~~~~~
 
-Feature "deprecated" marks a command, event, or struct member as
-deprecated.  It is not supported elsewhere so far.
+Feature "deprecated" marks a command, event, struct or enum member as
+deprecated.  It is not supported elsewhere so far.  Interfaces so
+marked may be withdrawn in future releases in accordance with QEMU's
+deprecation policy.
 
 
 Naming rules and reserved names
diff --git a/qapi/compat.json b/qapi/compat.json
index 1d2b76f00c..74a8493d3d 100644
--- a/qapi/compat.json
+++ b/qapi/compat.json
@@ -42,7 +42,8 @@
 # with feature 'deprecated'.  We may want to extend it to cover
 # semantic aspects, CLI, and experimental features.
 #
-# Limitation: not implemented for deprecated enumeration values.
+# Limitation: deprecated-output policy @hide is not implemented for
+# enumeration values.  They behave the same as with policy @accept.
 #
 # @deprecated-input: how to handle deprecated input (default 'accept')
 # @deprecated-output: how to handle deprecated output (default 'accept')
diff --git a/include/qapi/util.h b/include/qapi/util.h
index d7bfb30e25..257c600f99 100644
--- a/include/qapi/util.h
+++ b/include/qapi/util.h
@@ -11,9 +11,13 @@
 #ifndef QAPI_UTIL_H
 #define QAPI_UTIL_H
 
+/* QEnumLookup flags */
+#define QAPI_ENUM_DEPRECATED 1
+
 typedef struct QEnumLookup {
     const char *const *array;
-    int size;
+    const unsigned char *const flags;
+    const int size;
 } QEnumLookup;
 
 const char *qapi_enum_lookup(const QEnumLookup *lookup, int val);
diff --git a/qapi/qapi-visit-core.c b/qapi/qapi-visit-core.c
index 066f77a26d..49136ae88e 100644
--- a/qapi/qapi-visit-core.c
+++ b/qapi/qapi-visit-core.c
@@ -393,7 +393,7 @@ static bool input_type_enum(Visitor *v, const char *name, int *obj,
                             const QEnumLookup *lookup, Error **errp)
 {
     int64_t value;
-    char *enum_str;
+    g_autofree char *enum_str = NULL;
 
     if (!visit_type_str(v, name, &enum_str, errp)) {
         return false;
@@ -402,11 +402,23 @@ static bool input_type_enum(Visitor *v, const char *name, int *obj,
     value = qapi_enum_parse(lookup, enum_str, -1, NULL);
     if (value < 0) {
         error_setg(errp, QERR_INVALID_PARAMETER, enum_str);
-        g_free(enum_str);
         return false;
     }
 
-    g_free(enum_str);
+    if (lookup->flags && (lookup->flags[value] & QAPI_ENUM_DEPRECATED)) {
+        switch (v->compat_policy.deprecated_input) {
+        case COMPAT_POLICY_INPUT_ACCEPT:
+            break;
+        case COMPAT_POLICY_INPUT_REJECT:
+            error_setg(errp, "Deprecated value '%s' disabled by policy",
+                       enum_str);
+            return false;
+        case COMPAT_POLICY_INPUT_CRASH:
+        default:
+            abort();
+        }
+    }
+
     *obj = value;
     return true;
 }
diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
index 831294fe42..ab2441adc9 100644
--- a/scripts/qapi/types.py
+++ b/scripts/qapi/types.py
@@ -38,6 +38,8 @@
 def gen_enum_lookup(name: str,
                     members: List[QAPISchemaEnumMember],
                     prefix: Optional[str] = None) -> str:
+    max_index = c_enum_const(name, '_MAX', prefix)
+    flags = ''
     ret = mcgen('''
 
 const QEnumLookup %(c_name)s_lookup = {
@@ -52,13 +54,26 @@ def gen_enum_lookup(name: str,
 ''',
                      index=index, name=memb.name)
         ret += memb.ifcond.gen_endif()
+        if 'deprecated' in (f.name for f in memb.features):
+            flags += mcgen('''
+        [%(index)s] = QAPI_ENUM_DEPRECATED,
+''',
+                           index=index)
+
+    if flags:
+        ret += mcgen('''
+    },
+    .flags = (const unsigned char[%(max_index)s]) {
+''',
+                     max_index=max_index)
+        ret += flags
 
     ret += mcgen('''
     },
     .size = %(max_index)s
 };
 ''',
-                 max_index=c_enum_const(name, '_MAX', prefix))
+                 max_index=max_index)
     return ret
 
 
-- 
2.31.1


