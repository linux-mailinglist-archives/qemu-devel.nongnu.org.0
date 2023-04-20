Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCEB6E8FC2
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:14:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRHc-0000sT-O2; Thu, 20 Apr 2023 06:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppRHY-0000nZ-V2
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:12:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppRHP-000819-Ch
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:12:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681985555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LuPTiH8XQ+uWhBtqq2JgtOSr0Leg0bZWYhJfNobOaCw=;
 b=R81RII7/vdm/XGfkhu5pc1Tfzol2g+Vo6uNK8Zht788N2CjvK5CC/VSQcsRHoonwQHnBHe
 ZF6jWfUphRI4scFhYG8WonXHFdVWNBeenjvYOSKAPH8MDlglD9MaBuTlovP9zWkLzwCmT6
 uS/c9ZRKBbELrZmmNGyiUeGx5BNXtZw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-410-oTWxzm_FObuTf5M6aJiBxw-1; Thu, 20 Apr 2023 06:12:34 -0400
X-MC-Unique: oTWxzm_FObuTf5M6aJiBxw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9BDE3185A790;
 Thu, 20 Apr 2023 10:12:33 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5DA85AB7A;
 Thu, 20 Apr 2023 10:12:32 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 10/23] target/i386: Set family/model/stepping of the "max" CPU
 according to LM bit
Date: Thu, 20 Apr 2023 12:12:03 +0200
Message-Id: <20230420101216.786304-11-thuth@redhat.com>
In-Reply-To: <20230420101216.786304-1-thuth@redhat.com>
References: <20230420101216.786304-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Message-Id: <20230306154311.476458-1-thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/i386/cpu.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6576287e5b..95c0dcd493 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -45,6 +45,8 @@
 #include "disas/capstone.h"
 #include "cpu-internal.h"
 
+static void x86_cpu_realizefn(DeviceState *dev, Error **errp);
+
 /* Helpers for building CPUID[2] descriptors: */
 
 struct CPUID2CacheDescriptorInfo {
@@ -4316,6 +4318,25 @@ static Property max_x86_cpu_properties[] = {
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
@@ -4327,6 +4348,7 @@ static void max_x86_cpu_class_init(ObjectClass *oc, void *data)
         "Enables all features supported by the accelerator in the current host";
 
     device_class_set_props(dc, max_x86_cpu_properties);
+    dc->realize = max_x86_cpu_realize;
 }
 
 static void max_x86_cpu_initfn(Object *obj)
@@ -4345,15 +4367,6 @@ static void max_x86_cpu_initfn(Object *obj)
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


