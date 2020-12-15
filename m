Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A15B2DB009
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 16:28:22 +0100 (CET)
Received: from localhost ([::1]:49690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpCFR-0000Ai-Hc
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 10:28:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpC90-0008MV-BA
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:21:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpC8r-0002Qc-Ef
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:21:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608045692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2bDdyke6HK/TDnDsuh3vQJ3sI1frIxxG5GELsbQcGsc=;
 b=EUS2yQmzmx6IktCCIheqpn1lhNBav8NCyhF6SiNL/rM/hcrUkNvzXI2opWkOBba/Eyl1kq
 lMBsHK22X4ipxiW1V9IPV/fryVaUfXwJzSi7HgZ67Qb68iwpsi1CdK2k9gX1I07x7OeeYz
 Tfqr5AmkEwjmCkG10vLg06xwZ2ovUuU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-BYFLY7btMvqD1MU2T6j_dQ-1; Tue, 15 Dec 2020 10:21:29 -0500
X-MC-Unique: BYFLY7btMvqD1MU2T6j_dQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B91D481DAA;
 Tue, 15 Dec 2020 15:19:49 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57FD610013C1;
 Tue, 15 Dec 2020 15:19:49 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 04/25] i386: Register feature bit properties as class properties
Date: Tue, 15 Dec 2020 10:19:21 -0500
Message-Id: <20201215151942.3125089-5-ehabkost@redhat.com>
In-Reply-To: <20201215151942.3125089-1-ehabkost@redhat.com>
References: <20201215151942.3125089-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Class properties make QOM introspection simpler and easier, as
they don't require an object to be instantiated.

Also, the hundreds of instance properties were having an impact
on QMP commands that create temporary CPU objects.  On my
machine, run time of qmp_query_cpu_definitions() changed
from ~200ms to ~16ms after applying this patch.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20201111183823.283752-5-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.c | 40 ++++++++++++++++------------------------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6c11feeb92..ca997a68cd 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6858,29 +6858,23 @@ static void x86_cpu_set_bit_prop(Object *obj, Visitor *v, const char *name,
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
@@ -6889,14 +6883,14 @@ static void x86_cpu_register_bit_prop(X86CPU *cpu,
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
@@ -6915,7 +6909,7 @@ static void x86_cpu_register_feature_bit_props(X86CPU *cpu,
     /* aliases don't use "|" delimiters anymore, they are registered
      * manually using object_property_add_alias() */
     assert(!strchr(name, '|'));
-    x86_cpu_register_bit_prop(cpu, name, w, bitnr);
+    x86_cpu_register_bit_prop(xcc, name, w, bitnr);
 }
 
 #if !defined(CONFIG_USER_ONLY)
@@ -6969,7 +6963,6 @@ static void x86_cpu_initfn(Object *obj)
     X86CPU *cpu = X86_CPU(obj);
     X86CPUClass *xcc = X86_CPU_GET_CLASS(obj);
     CPUX86State *env = &cpu->env;
-    FeatureWord w;
 
     env->nr_dies = 1;
     cpu_set_cpustate_pointers(cpu);
@@ -6981,14 +6974,6 @@ static void x86_cpu_initfn(Object *obj)
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
@@ -7274,6 +7259,7 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     X86CPUClass *xcc = X86_CPU_CLASS(oc);
     CPUClass *cc = CPU_CLASS(oc);
     DeviceClass *dc = DEVICE_CLASS(oc);
+    FeatureWord w;
 
     device_class_set_parent_realize(dc, x86_cpu_realizefn,
                                     &xcc->parent_realize);
@@ -7363,6 +7349,12 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
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


