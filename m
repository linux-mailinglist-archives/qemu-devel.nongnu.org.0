Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AAB438EDA
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 07:32:01 +0200 (CEST)
Received: from localhost ([::1]:43902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mesaW-0006MB-In
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 01:32:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mesUn-0005X4-Uz
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 01:26:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mesUj-0005PF-P1
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 01:26:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635139561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Io7pCakK7oxbs6TfwoCw9fOsoLesVQPLShOHgc7y95c=;
 b=CXlTXrN8NxOqReLdjM12G2VKzvWYHfrWrGKREiTBr8/w00Te49uMpn19NCHVdAoAzu2vEf
 CDZJkqU1kqvzBHJMFfcxwRHik4/eRB8S9iyg0pK9VvsMIrqZGwcMal9iuKI4LmQaYDs0Nw
 4NsX46CqekCSULKF/9VtaNznM9viJrk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-JYe27edQO1u0cTJsD_xdWA-1; Mon, 25 Oct 2021 01:25:57 -0400
X-MC-Unique: JYe27edQO1u0cTJsD_xdWA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 838BC802B52;
 Mon, 25 Oct 2021 05:25:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 511155DD68;
 Mon, 25 Oct 2021 05:25:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E5C3411380CF; Mon, 25 Oct 2021 07:25:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/9] qapi: Generalize enum member policy checking
Date: Mon, 25 Oct 2021 07:25:30 +0200
Message-Id: <20211025052532.3859634-8-armbru@redhat.com>
In-Reply-To: <20211025052532.3859634-1-armbru@redhat.com>
References: <20211025052532.3859634-1-armbru@redhat.com>
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, quintela@redhat.com,
 libvir-list@redhat.com, eblake@redhat.com, mdroth@linux.vnet.ibm.com,
 dgilbert@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 jsnow@redhat.com, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The code to check enumeration value policy can see special feature
flag 'deprecated' in QEnumLookup member flags[value].  I want to make
feature flag 'unstable' visible there as well, so I can add policy for
it.

Instead of extending flags[], replace it by @special_features (a
bitset of QapiSpecialFeature), because that's how special features get
passed around elsewhere.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/qapi/util.h    |  5 +----
 qapi/qapi-visit-core.c |  3 ++-
 scripts/qapi/types.py  | 22 ++++++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/include/qapi/util.h b/include/qapi/util.h
index 7a8d5c7d72..0cc98db9f9 100644
--- a/include/qapi/util.h
+++ b/include/qapi/util.h
@@ -15,12 +15,9 @@ typedef enum {
     QAPI_DEPRECATED,
 } QapiSpecialFeature;
 
-/* QEnumLookup flags */
-#define QAPI_ENUM_DEPRECATED 1
-
 typedef struct QEnumLookup {
     const char *const *array;
-    const unsigned char *const flags;
+    const unsigned char *const special_features;
     const int size;
 } QEnumLookup;
 
diff --git a/qapi/qapi-visit-core.c b/qapi/qapi-visit-core.c
index b4a81f1757..5572d90efb 100644
--- a/qapi/qapi-visit-core.c
+++ b/qapi/qapi-visit-core.c
@@ -407,7 +407,8 @@ static bool input_type_enum(Visitor *v, const char *name, int *obj,
         return false;
     }
 
-    if (lookup->flags && (lookup->flags[value] & QAPI_ENUM_DEPRECATED)) {
+    if (lookup->special_features
+        && (lookup->special_features[value] & QAPI_DEPRECATED)) {
         switch (v->compat_policy.deprecated_input) {
         case COMPAT_POLICY_INPUT_ACCEPT:
             break;
diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
index ab2441adc9..3013329c24 100644
--- a/scripts/qapi/types.py
+++ b/scripts/qapi/types.py
@@ -16,7 +16,7 @@
 from typing import List, Optional
 
 from .common import c_enum_const, c_name, mcgen
-from .gen import QAPISchemaModularCVisitor, ifcontext
+from .gen import QAPISchemaModularCVisitor, gen_special_features, ifcontext
 from .schema import (
     QAPISchema,
     QAPISchemaEnumMember,
@@ -39,7 +39,7 @@ def gen_enum_lookup(name: str,
                     members: List[QAPISchemaEnumMember],
                     prefix: Optional[str] = None) -> str:
     max_index = c_enum_const(name, '_MAX', prefix)
-    flags = ''
+    feats = ''
     ret = mcgen('''
 
 const QEnumLookup %(c_name)s_lookup = {
@@ -54,19 +54,21 @@ def gen_enum_lookup(name: str,
 ''',
                      index=index, name=memb.name)
         ret += memb.ifcond.gen_endif()
-        if 'deprecated' in (f.name for f in memb.features):
-            flags += mcgen('''
-        [%(index)s] = QAPI_ENUM_DEPRECATED,
-''',
-                           index=index)
 
-    if flags:
+        special_features = gen_special_features(memb.features)
+        if special_features != '0':
+            feats += mcgen('''
+        [%(index)s] = %(special_features)s,
+''',
+                           index=index, special_features=special_features)
+
+    if feats:
         ret += mcgen('''
     },
-    .flags = (const unsigned char[%(max_index)s]) {
+    .special_features = (const unsigned char[%(max_index)s]) {
 ''',
                      max_index=max_index)
-        ret += flags
+        ret += feats
 
     ret += mcgen('''
     },
-- 
2.31.1


