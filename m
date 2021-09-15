Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DA240CD38
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 21:29:59 +0200 (CEST)
Received: from localhost ([::1]:53586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQabW-0002hK-5g
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 15:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mQaWX-00047L-3w
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 15:24:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mQaWT-0000Od-4K
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 15:24:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631733882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v5pOvPPTNrYwkqKbUmjwipdR4+y6DYXj19o2NJkHTtU=;
 b=cJ9gzl8si78k4ThfLEUnYOp+EITfu9IybuPBgpTY9fZUcnmCebkvFIVdrhqWqmASAirszY
 ahKGCfi+FW3L+r3+JeOkEjBWizSJgdaEVePYlfWviIb1iploSCa/LuD9c2SDDSUzS1XBHf
 OqEQYG/5oAOQY8xkAuN82j2lFPR4dpw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-WLzQEkKuOSCn9gEuHdxNEQ-1; Wed, 15 Sep 2021 15:24:39 -0400
X-MC-Unique: WLzQEkKuOSCn9gEuHdxNEQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E40731023F58;
 Wed, 15 Sep 2021 19:24:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 96A3061082;
 Wed, 15 Sep 2021 19:24:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2E0281138526; Wed, 15 Sep 2021 21:24:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 4/5] qapi: Implement deprecated-input={reject,
 crash} for enum values
Date: Wed, 15 Sep 2021 21:24:24 +0200
Message-Id: <20210915192425.4104210-5-armbru@redhat.com>
In-Reply-To: <20210915192425.4104210-1-armbru@redhat.com>
References: <20210915192425.4104210-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
to qapi/qobject-input-visitor.c.  I hope to avoid that in a future
revision.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/compat.json       |  3 ++-
 include/qapi/util.h    |  6 +++++-
 qapi/qapi-visit-core.c | 18 +++++++++++++++---
 scripts/qapi/types.py  | 17 ++++++++++++++++-
 4 files changed, 38 insertions(+), 6 deletions(-)

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


