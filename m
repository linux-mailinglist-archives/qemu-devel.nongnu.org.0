Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D10D26AC5C1
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 16:43:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCzi-0007tv-Of; Mon, 06 Mar 2023 10:43:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZCzg-0007td-Cx
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:43:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZCze-0003lF-RV
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:43:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678117398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=/sVTpxLjMbVG79ZO01fDupC01lyU0SDOavPHu/iysxY=;
 b=b2zsOio6NtSerRsgdlzC6nCrsMAkw1YoZ+GumEx+cjC+kQwhOkjT6kimHKyHF5AOTqBvi2
 meKpXMP8vP268m7bc3RLEPfqf87q8BcmycJJQAKhX3uvcQX4o/n64K1pQeUmgl0nRTrxGP
 TV1628SdDewhCyumPDQQ3ASDws5QYQ4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-323-3SDrFTq5NDWcAT4o_w1XVA-1; Mon, 06 Mar 2023 10:43:14 -0500
X-MC-Unique: 3SDrFTq5NDWcAT4o_w1XVA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98560185A7A4;
 Mon,  6 Mar 2023 15:43:14 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A683A1121314;
 Mon,  6 Mar 2023 15:43:13 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC PATCH] target/i386: Set family/model/stepping of the "max" CPU
 according to LM bit
Date: Mon,  6 Mar 2023 16:43:11 +0100
Message-Id: <20230306154311.476458-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We want to get rid of the "#ifdef TARGET_X86_64" compile-time switch
in the long run, so we can drop the separate compilation of the
"qemu-system-i386" binary one day - but we then still need a way to
run a guest with max. CPU settings in 32-bit mode. So the "max" CPU
should determine its family/model/stepping settings according to the
"large mode" (LM) CPU feature bit during runtime, so that it is
possible to run "qemu-system-x86_64 -cpu max,lm=off" and still get
a sane family/model/stepping setting for the guest CPU.

To be able to check the LM bit, we have to move the code that sets
up these properties to a "realize" function, since the LM setting is
not available yet when the "instance_init" function is being called.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/i386/cpu.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index cab1e2a957..fe3b78fc95 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -44,6 +44,8 @@
 #include "disas/capstone.h"
 #include "cpu-internal.h"
 
+static void x86_cpu_realizefn(DeviceState *dev, Error **errp);
+
 /* Helpers for building CPUID[2] descriptors: */
 
 struct CPUID2CacheDescriptorInfo {
@@ -4315,6 +4317,25 @@ static Property max_x86_cpu_properties[] = {
     DEFINE_PROP_END_OF_LIST()
 };
 
+static void max_x86_cpu_realize(DeviceState *dev, Error **errp)
+{
+    Object *obj = OBJECT(dev);
+
+    if (!object_property_get_int(obj, "family", &error_abort)) {
+        if (X86_CPU(obj)->env.features[FEAT_8000_0001_EDX] & CPUID_EXT2_LM) {
+            object_property_set_int(obj, "family", 15, &error_abort);
+            object_property_set_int(obj, "model", 107, &error_abort);
+            object_property_set_int(obj, "stepping", 1, &error_abort);
+        } else {
+            object_property_set_int(obj, "family", 6, &error_abort);
+            object_property_set_int(obj, "model", 6, &error_abort);
+            object_property_set_int(obj, "stepping", 3, &error_abort);
+        }
+    }
+
+    x86_cpu_realizefn(dev, errp);
+}
+
 static void max_x86_cpu_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -4326,6 +4347,7 @@ static void max_x86_cpu_class_init(ObjectClass *oc, void *data)
         "Enables all features supported by the accelerator in the current host";
 
     device_class_set_props(dc, max_x86_cpu_properties);
+    dc->realize = max_x86_cpu_realize;
 }
 
 static void max_x86_cpu_initfn(Object *obj)
@@ -4344,15 +4366,6 @@ static void max_x86_cpu_initfn(Object *obj)
      */
     object_property_set_str(OBJECT(cpu), "vendor", CPUID_VENDOR_AMD,
                             &error_abort);
-#ifdef TARGET_X86_64
-    object_property_set_int(OBJECT(cpu), "family", 15, &error_abort);
-    object_property_set_int(OBJECT(cpu), "model", 107, &error_abort);
-    object_property_set_int(OBJECT(cpu), "stepping", 1, &error_abort);
-#else
-    object_property_set_int(OBJECT(cpu), "family", 6, &error_abort);
-    object_property_set_int(OBJECT(cpu), "model", 6, &error_abort);
-    object_property_set_int(OBJECT(cpu), "stepping", 3, &error_abort);
-#endif
     object_property_set_str(OBJECT(cpu), "model-id",
                             "QEMU TCG CPU version " QEMU_HW_VERSION,
                             &error_abort);
-- 
2.31.1


