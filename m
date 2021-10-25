Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 179A2438E51
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 06:29:02 +0200 (CEST)
Received: from localhost ([::1]:36396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1merbZ-0004FA-3j
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 00:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1merXK-0006An-HJ
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 00:24:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1merXH-0006KF-Jx
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 00:24:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635135875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qlNzPqw6ia8B6tlqqTBvPygeeTCyKs53LLdUY+T5TdI=;
 b=M+o/H1uhoUirrHwYu/OrEU6lRQGTf7blnZmCqmB4198Pshz7HVSixhxziRtWJQEJkMARcG
 x6fB5npM5stxKPhqYpjW22uhZ7kPoBkIlTTuvYEieS9q4j6aN2Q2jbZWT2z0KUvGZryUZP
 qqGHPSVTDNdQ2BFZJkbRnflW1PZ2u2A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-GO6ruU_ROR2cA-sV4uffHQ-1; Mon, 25 Oct 2021 00:24:29 -0400
X-MC-Unique: GO6ruU_ROR2cA-sV4uffHQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FF511808308;
 Mon, 25 Oct 2021 04:24:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA9591816A;
 Mon, 25 Oct 2021 04:24:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0BF7A11380C3; Mon, 25 Oct 2021 06:24:06 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/5] qapi: Implement deprecated-input={reject,
 crash} for enum values
Date: Mon, 25 Oct 2021 06:24:04 +0200
Message-Id: <20211025042405.3762351-5-armbru@redhat.com>
In-Reply-To: <20211025042405.3762351-1-armbru@redhat.com>
References: <20211025042405.3762351-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berrange@redhat.com,
 libvir-list@redhat.com, eblake@redhat.com, mdroth@linux.vnet.ibm.com,
 pkrempa@redhat.com, marcandre.lureau@redhat.com, jsnow@redhat.com,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This copies the code implementing the policy from qapi/qmp-dispatch.c
to qapi/qobject-input-visitor.c.  Tolerable, but if we acquire more
copies, we should look into factoring them out.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Tested-by: Peter Krempa <pkrempa@redhat.com>
Acked-by: Peter Krempa <pkrempa@redhat.com>
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


