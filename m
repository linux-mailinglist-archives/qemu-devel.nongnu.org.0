Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD3A2AF857
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 19:41:53 +0100 (CET)
Received: from localhost ([::1]:33876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcv44-0001zg-FR
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 13:41:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcv0v-0000Bj-FD
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 13:38:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcv0t-0007x9-Hk
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 13:38:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605119914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6wipV9DyT8v9GxPLDtRf53NrVtpF9utbNGmD7d2mTqo=;
 b=cwx9bUT7gDc9GNByR05IsU7e2RwGLknPx2zibxlxE1Y02who3PUe8NIwiRdGl6QuG32TpX
 Dg7msX04QPx5Cm+78kvXicm2iBdvjm3dINPwGHZckDTDIWoCf7wCaX2JvOnHIzyh09qrD2
 zIM5MTm2NKi0t9t9ISqMztI0phd91ew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-4I9-urgrMJ2FalpSwpxkQw-1; Wed, 11 Nov 2020 13:38:33 -0500
X-MC-Unique: 4I9-urgrMJ2FalpSwpxkQw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37DBC802B56;
 Wed, 11 Nov 2020 18:38:32 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B2A385B4D2;
 Wed, 11 Nov 2020 18:38:31 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/12] i386: Register feature bit properties as class
 properties
Date: Wed, 11 Nov 2020 13:38:15 -0500
Message-Id: <20201111183823.283752-5-ehabkost@redhat.com>
In-Reply-To: <20201111183823.283752-1-ehabkost@redhat.com>
References: <20201111183823.283752-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Class properties make QOM introspection simpler and easier, as
they don't require an object to be instantiated.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v1 -> v2:
* Remove x86_cpu_release_bit_prop() function, as we will allocate
  BitProperty only once and never free the class property list

---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org
---
 target/i386/cpu.c | 40 ++++++++++++++++------------------------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 0d8606958e..dbba1151f2 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6823,29 +6823,23 @@ static void x86_cpu_set_bit_prop(Object *obj, Visitor *v, const char *name,
     cpu->env.user_features[fp->w] |= fp->mask;
 }
 
-static void x86_cpu_release_bit_prop(Object *obj, const char *name,
-                                     void *opaque)
-{
-    BitProperty *prop = opaque;
-    g_free(prop);
-}
-
 /* Register a boolean property to get/set a single bit in a uint32_t field.
  *
  * The same property name can be registered multiple times to make it affect
  * multiple bits in the same FeatureWord. In that case, the getter will return
  * true only if all bits are set.
  */
-static void x86_cpu_register_bit_prop(X86CPU *cpu,
+static void x86_cpu_register_bit_prop(X86CPUClass *xcc,
                                       const char *prop_name,
                                       FeatureWord w,
                                       int bitnr)
 {
+    ObjectClass *oc = OBJECT_CLASS(xcc);
     BitProperty *fp;
     ObjectProperty *op;
     uint64_t mask = (1ULL << bitnr);
 
-    op = object_property_find(OBJECT(cpu), prop_name);
+    op = object_class_property_find(oc, prop_name);
     if (op) {
         fp = op->opaque;
         assert(fp->w == w);
@@ -6854,14 +6848,14 @@ static void x86_cpu_register_bit_prop(X86CPU *cpu,
         fp = g_new0(BitProperty, 1);
         fp->w = w;
         fp->mask = mask;
-        object_property_add(OBJECT(cpu), prop_name, "bool",
-                            x86_cpu_get_bit_prop,
-                            x86_cpu_set_bit_prop,
-                            x86_cpu_release_bit_prop, fp);
+        object_class_property_add(oc, prop_name, "bool",
+                                  x86_cpu_get_bit_prop,
+                                  x86_cpu_set_bit_prop,
+                                  NULL, fp);
     }
 }
 
-static void x86_cpu_register_feature_bit_props(X86CPU *cpu,
+static void x86_cpu_register_feature_bit_props(X86CPUClass *xcc,
                                                FeatureWord w,
                                                int bitnr)
 {
@@ -6880,7 +6874,7 @@ static void x86_cpu_register_feature_bit_props(X86CPU *cpu,
     /* aliases don't use "|" delimiters anymore, they are registered
      * manually using object_property_add_alias() */
     assert(!strchr(name, '|'));
-    x86_cpu_register_bit_prop(cpu, name, w, bitnr);
+    x86_cpu_register_bit_prop(xcc, name, w, bitnr);
 }
 
 #if !defined(CONFIG_USER_ONLY)
@@ -6934,7 +6928,6 @@ static void x86_cpu_initfn(Object *obj)
     X86CPU *cpu = X86_CPU(obj);
     X86CPUClass *xcc = X86_CPU_GET_CLASS(obj);
     CPUX86State *env = &cpu->env;
-    FeatureWord w;
 
     env->nr_dies = 1;
     cpu_set_cpustate_pointers(cpu);
@@ -6946,14 +6939,6 @@ static void x86_cpu_initfn(Object *obj)
                         x86_cpu_get_feature_words,
                         NULL, NULL, (void *)cpu->filtered_features);
 
-    for (w = 0; w < FEATURE_WORDS; w++) {
-        int bitnr;
-
-        for (bitnr = 0; bitnr < 64; bitnr++) {
-            x86_cpu_register_feature_bit_props(cpu, w, bitnr);
-        }
-    }
-
     object_property_add_alias(obj, "sse3", obj, "pni");
     object_property_add_alias(obj, "pclmuldq", obj, "pclmulqdq");
     object_property_add_alias(obj, "sse4-1", obj, "sse4.1");
@@ -7239,6 +7224,7 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     X86CPUClass *xcc = X86_CPU_CLASS(oc);
     CPUClass *cc = CPU_CLASS(oc);
     DeviceClass *dc = DEVICE_CLASS(oc);
+    FeatureWord w;
 
     device_class_set_parent_realize(dc, x86_cpu_realizefn,
                                     &xcc->parent_realize);
@@ -7328,6 +7314,12 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
                               x86_cpu_get_crash_info_qom, NULL, NULL, NULL);
 #endif
 
+    for (w = 0; w < FEATURE_WORDS; w++) {
+        int bitnr;
+        for (bitnr = 0; bitnr < 64; bitnr++) {
+            x86_cpu_register_feature_bit_props(xcc, w, bitnr);
+        }
+    }
 }
 
 static const TypeInfo x86_cpu_type_info = {
-- 
2.28.0


