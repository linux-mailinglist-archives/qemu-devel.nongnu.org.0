Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F4F438ED9
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 07:31:48 +0200 (CEST)
Received: from localhost ([::1]:43260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mesaJ-0005vf-65
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 01:31:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mesVX-0007TG-Tp
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 01:26:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mesVH-0005wM-Qd
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 01:26:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635139595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/m+AypTWJYVTQCgIyqvbrAEciwDG3N/8VGi7fimUx0E=;
 b=ICAZfHlvwvkZSfeDNWP39L3sEp/oMFkkEAV8YO8DLzV95Yy2B4ymVouJ7GC9xm9/nd1KXX
 aLWLKr18I70bwrlOgQQkwWS5VTmqW6KuSYyppfu41XsJkQfzyb747DrJUkbCmftqDcG94N
 vcHZIt8B52nP/5+pqv8OBWqbWlY7w2w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-thNGNkmHPhKeN-yjTfKuYA-1; Mon, 25 Oct 2021 01:26:29 -0400
X-MC-Unique: thNGNkmHPhKeN-yjTfKuYA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C41B01006AA3;
 Mon, 25 Oct 2021 05:26:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7354069CBE;
 Mon, 25 Oct 2021 05:25:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EC99B11380DF; Mon, 25 Oct 2021 07:25:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 9/9] qapi: Extend -compat to set policy for unstable interfaces
Date: Mon, 25 Oct 2021 07:25:32 +0200
Message-Id: <20211025052532.3859634-10-armbru@redhat.com>
In-Reply-To: <20211025052532.3859634-1-armbru@redhat.com>
References: <20211025052532.3859634-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

New option parameters unstable-input and unstable-output set policy
for unstable interfaces just like deprecated-input and
deprecated-output set policy for deprecated interfaces (see commit
6dd75472d5 "qemu-options: New -compat to set policy for deprecated
interfaces").  This is intended for testing users of the management
interfaces.  It is experimental.

For now, this covers only syntactic aspects of QMP, i.e. stuff tagged
with feature 'unstable'.  We may want to extend it to cover semantic
aspects, or the command line.

Note that there is no good way for management application to detect
presence of these new option parameters: they are not visible output
of query-qmp-schema or query-command-line-options.  Tolerable, because
it's meant for testing.  If running with -compat fails, skip the test.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/compat.json              |  6 +++++-
 include/qapi/util.h           |  1 +
 qapi/qmp-dispatch.c           |  6 ++++++
 qapi/qobject-output-visitor.c |  8 ++++++--
 qemu-options.hx               | 20 +++++++++++++++++++-
 scripts/qapi/events.py        | 10 ++++++----
 scripts/qapi/schema.py        | 10 ++++++----
 7 files changed, 49 insertions(+), 12 deletions(-)

diff --git a/qapi/compat.json b/qapi/compat.json
index 74a8493d3d..9bc9804abb 100644
--- a/qapi/compat.json
+++ b/qapi/compat.json
@@ -47,9 +47,13 @@
 #
 # @deprecated-input: how to handle deprecated input (default 'accept')
 # @deprecated-output: how to handle deprecated output (default 'accept')
+# @unstable-input: how to handle unstable input (default 'accept')
+# @unstable-output: how to handle unstable output (default 'accept')
 #
 # Since: 6.0
 ##
 { 'struct': 'CompatPolicy',
   'data': { '*deprecated-input': 'CompatPolicyInput',
-            '*deprecated-output': 'CompatPolicyOutput' } }
+            '*deprecated-output': 'CompatPolicyOutput',
+            '*unstable-input': 'CompatPolicyInput',
+            '*unstable-output': 'CompatPolicyOutput' } }
diff --git a/include/qapi/util.h b/include/qapi/util.h
index 0cc98db9f9..81a2b13a33 100644
--- a/include/qapi/util.h
+++ b/include/qapi/util.h
@@ -13,6 +13,7 @@
 
 typedef enum {
     QAPI_DEPRECATED,
+    QAPI_UNSTABLE,
 } QapiSpecialFeature;
 
 typedef struct QEnumLookup {
diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
index e29ade134c..c5c6e521a2 100644
--- a/qapi/qmp-dispatch.c
+++ b/qapi/qmp-dispatch.c
@@ -59,6 +59,12 @@ bool compat_policy_input_ok(unsigned special_features,
                                     error_class, kind, name, errp)) {
         return false;
     }
+    if ((special_features & (1u << QAPI_UNSTABLE))
+        && !compat_policy_input_ok1("Unstable",
+                                    policy->unstable_input,
+                                    error_class, kind, name, errp)) {
+        return false;
+    }
     return true;
 }
 
diff --git a/qapi/qobject-output-visitor.c b/qapi/qobject-output-visitor.c
index b5c6564cbb..74770edd73 100644
--- a/qapi/qobject-output-visitor.c
+++ b/qapi/qobject-output-visitor.c
@@ -212,8 +212,12 @@ static bool qobject_output_type_null(Visitor *v, const char *name,
 static bool qobject_output_policy_skip(Visitor *v, const char *name,
                                        unsigned special_features)
 {
-    return !(special_features && 1u << QAPI_DEPRECATED)
-        || v->compat_policy.deprecated_output == COMPAT_POLICY_OUTPUT_HIDE;
+    CompatPolicy *pol = &v->compat_policy;
+
+    return ((special_features & 1u << QAPI_DEPRECATED)
+            && pol->deprecated_output == COMPAT_POLICY_OUTPUT_HIDE)
+        || ((special_features & 1u << QAPI_UNSTABLE)
+            && pol->unstable_output == COMPAT_POLICY_OUTPUT_HIDE);
 }
 
 /* Finish building, and return the root object.
diff --git a/qemu-options.hx b/qemu-options.hx
index 5f375bbfa6..f051536b63 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3641,7 +3641,9 @@ DEFHEADING(Debug/Expert options:)
 
 DEF("compat", HAS_ARG, QEMU_OPTION_compat,
     "-compat [deprecated-input=accept|reject|crash][,deprecated-output=accept|hide]\n"
-    "                Policy for handling deprecated management interfaces\n",
+    "                Policy for handling deprecated management interfaces\n"
+    "-compat [unstable-input=accept|reject|crash][,unstable-output=accept|hide]\n"
+    "                Policy for handling unstable management interfaces\n",
     QEMU_ARCH_ALL)
 SRST
 ``-compat [deprecated-input=@var{input-policy}][,deprecated-output=@var{output-policy}]``
@@ -3659,6 +3661,22 @@ SRST
         Suppress deprecated command results and events
 
     Limitation: covers only syntactic aspects of QMP.
+
+``-compat [unstable-input=@var{input-policy}][,unstable-output=@var{output-policy}]``
+    Set policy for handling unstable management interfaces (experimental):
+
+    ``unstable-input=accept`` (default)
+        Accept unstable commands and arguments
+    ``unstable-input=reject``
+        Reject unstable commands and arguments
+    ``unstable-input=crash``
+        Crash on unstable commands and arguments
+    ``unstable-output=accept`` (default)
+        Emit unstable command results and events
+    ``unstable-output=hide``
+        Suppress unstable command results and events
+
+    Limitation: covers only syntactic aspects of QMP.
 ERST
 
 DEF("fw_cfg", HAS_ARG, QEMU_OPTION_fwcfg,
diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
index 82475e84ec..27b44c49f5 100644
--- a/scripts/qapi/events.py
+++ b/scripts/qapi/events.py
@@ -109,13 +109,15 @@ def gen_event_send(name: str,
         if not boxed:
             ret += gen_param_var(arg_type)
 
-    if 'deprecated' in [f.name for f in features]:
-        ret += mcgen('''
+    for f in features:
+        if f.is_special():
+            ret += mcgen('''
 
-    if (compat_policy.deprecated_output == COMPAT_POLICY_OUTPUT_HIDE) {
+    if (compat_policy.%(feat)s_output == COMPAT_POLICY_OUTPUT_HIDE) {
         return;
     }
-''')
+''',
+                         feat=f.name)
 
     ret += mcgen('''
 
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 55f82d7389..b7b3fc0ce4 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -254,9 +254,11 @@ def doc_type(self):
 
     def check(self, schema):
         QAPISchemaEntity.check(self, schema)
-        if 'deprecated' in [f.name for f in self.features]:
-            raise QAPISemError(
-                self.info, "feature 'deprecated' is not supported for types")
+        for feat in self.features:
+            if feat.is_special():
+                raise QAPISemError(
+                    self.info,
+                    f"feature '{feat.name}' is not supported for types")
 
     def describe(self):
         assert self.meta
@@ -726,7 +728,7 @@ class QAPISchemaFeature(QAPISchemaMember):
     role = 'feature'
 
     def is_special(self):
-        return self.name in ('deprecated')
+        return self.name in ('deprecated', 'unstable')
 
 
 class QAPISchemaObjectTypeMember(QAPISchemaMember):
-- 
2.31.1


