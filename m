Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3301C6514C9
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 22:24:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Nao-0000jq-Qi; Mon, 19 Dec 2022 16:22:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7Nam-0000jc-Rm
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 16:22:36 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7Nal-0007nu-45
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 16:22:36 -0500
Received: by mail-ed1-x52d.google.com with SMTP id c66so14810986edf.5
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 13:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0uIKK9n031FmXLwSkaw/d2xgek2T5GaFmmJOvQiTkDo=;
 b=qNjElSm2lGWVH0Nlna7yVvNiVHUznq8iRBVetgBPyMaw/jzqCmPN8GojwqM0Kiuit3
 aAmWzfy2T9uJWjx17Y3oTTptxkQxd+g/DYkuC4eX+XTTB6DH9raTOmXh7N+RRZ80Zyfa
 c8Xt5ozDcwCjUfxHj5dZvEWgGGT79QXcTzijZx+mLMW3leyRA5JWTfl+WMZE8kD051Yg
 S+xHUKcBK4rpqcL81zPv7kj2NVGmTgs0JXqHpwO5z1b7lwsehalRqWrnqTnPwOU4EPoD
 vN0RxMAUlJIQbR1M9ARpEG8vQhqKyUvyCTiKl6vAooggAN1ewYZswUbU0qc/hBv0EhW+
 46iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0uIKK9n031FmXLwSkaw/d2xgek2T5GaFmmJOvQiTkDo=;
 b=zSy4BfWrkOAEPr/ZUg6+U4lN5+/fibGo+oZGUSrwdImW5sqithKcBdicW64Dbqp4i1
 TYCnpW0ldjVP/+Lps6Q6EHNIg1fiTdU8AIWqkEW2kw0Yyz5RVKxkDKw/M85+/QrSlx0A
 JJ4RX28JOg9Ni1wwu8UL5/2kFl+KgAe4HzWFxxrUI2x2n8bc28RuxY/mJCXxXJg1cNY5
 H/jmes1X+SjYbUC2IMz6HUVYAGwQyMjVX+HAFjxC3rDvcb/cm0/1cXNr8QcZDnwA/u/7
 iIqvO2/A+nsGXYtElnLHisONfqmPtsj4mjk0+qVOhSnMDbi2VPJyq9ZrZd+jC7SSL01p
 qt2g==
X-Gm-Message-State: ANoB5pnTEuTf+cVkMbk+4pbSP9hBR0nEQEJJ1wuOVcGA8DhQV01vfBpb
 hdyzwnMIPx4XqLnKib4jv8EX1XQewSMc7jP3Fqo=
X-Google-Smtp-Source: AA0mqf4bFf1LXkrGYlpnIi2FruTR+z930D1vRtPmE2mt3RBNbXLFhJoxH2KCo1v8zTGKQlOqwt266g==
X-Received: by 2002:a05:6402:1f85:b0:467:b851:6066 with SMTP id
 c5-20020a0564021f8500b00467b8516066mr57880728edc.6.1671484952711; 
 Mon, 19 Dec 2022 13:22:32 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u9-20020aa7d549000000b004642b35f89esm4842015edr.9.2022.12.19.13.22.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Dec 2022 13:22:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 Philippe Mathieu-Daude <philmd@linaro.org>
Subject: [PATCH 5/4] target/i386: Restrict 'qapi-commands-machine.h' to system
 emulation
Date: Mon, 19 Dec 2022 22:22:29 +0100
Message-Id: <20221219212229.72052-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219211034.70491-1-philmd@linaro.org>
References: <20221219211034.70491-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Philippe Mathieu-Daude <philmd@linaro.org>

Since commit a0e61807a3 ("qapi: Remove QMP events and commands from
user-mode builds") we don't generate the "qapi-commands-machine.h"
header in a user-emulation-only build.

Guard qmp_query_cpu_definitions() within CONFIG_USER_ONLY; move
x86_cpu_class_check_missing_features() closer since it is only used
by this QMP command handler.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/cpu.c | 74 +++++++++++++++++++++++++----------------------
 1 file changed, 39 insertions(+), 35 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ae502f0bfe..435980dd3a 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -31,11 +31,11 @@
 #include "qapi/error.h"
 #include "qapi/qapi-visit-machine.h"
 #include "qapi/qmp/qerror.h"
-#include "qapi/qapi-commands-machine-target.h"
 #include "standard-headers/asm-x86/kvm_para.h"
 #include "hw/qdev-properties.h"
 #include "hw/i386/topology.h"
 #ifndef CONFIG_USER_ONLY
+#include "qapi/qapi-commands-machine-target.h"
 #include "exec/address-spaces.h"
 #include "hw/boards.h"
 #include "hw/i386/sgx-epc.h"
@@ -4713,40 +4713,6 @@ static void x86_cpu_get_unavailable_features(Object *obj, Visitor *v,
     visit_type_strList(v, "unavailable-features", &result, errp);
 }
 
-/* Check for missing features that may prevent the CPU class from
- * running using the current machine and accelerator.
- */
-static void x86_cpu_class_check_missing_features(X86CPUClass *xcc,
-                                                 strList **list)
-{
-    strList **tail = list;
-    X86CPU *xc;
-    Error *err = NULL;
-
-    if (xcc->host_cpuid_required && !accel_uses_host_cpuid()) {
-        QAPI_LIST_APPEND(tail, g_strdup("kvm"));
-        return;
-    }
-
-    xc = X86_CPU(object_new_with_class(OBJECT_CLASS(xcc)));
-
-    x86_cpu_expand_features(xc, &err);
-    if (err) {
-        /* Errors at x86_cpu_expand_features should never happen,
-         * but in case it does, just report the model as not
-         * runnable at all using the "type" property.
-         */
-        QAPI_LIST_APPEND(tail, g_strdup("type"));
-        error_free(err);
-    }
-
-    x86_cpu_filter_features(xc, false);
-
-    x86_cpu_list_feature_names(xc->filtered_features, tail);
-
-    object_unref(OBJECT(xc));
-}
-
 /* Print all cpuid feature names in featureset
  */
 static void listflags(GList *features)
@@ -4875,6 +4841,42 @@ void x86_cpu_list(void)
     g_list_free(names);
 }
 
+#ifndef CONFIG_USER_ONLY
+
+/* Check for missing features that may prevent the CPU class from
+ * running using the current machine and accelerator.
+ */
+static void x86_cpu_class_check_missing_features(X86CPUClass *xcc,
+                                                 strList **list)
+{
+    strList **tail = list;
+    X86CPU *xc;
+    Error *err = NULL;
+
+    if (xcc->host_cpuid_required && !accel_uses_host_cpuid()) {
+        QAPI_LIST_APPEND(tail, g_strdup("kvm"));
+        return;
+    }
+
+    xc = X86_CPU(object_new_with_class(OBJECT_CLASS(xcc)));
+
+    x86_cpu_expand_features(xc, &err);
+    if (err) {
+        /* Errors at x86_cpu_expand_features should never happen,
+         * but in case it does, just report the model as not
+         * runnable at all using the "type" property.
+         */
+        QAPI_LIST_APPEND(tail, g_strdup("type"));
+        error_free(err);
+    }
+
+    x86_cpu_filter_features(xc, false);
+
+    x86_cpu_list_feature_names(xc->filtered_features, tail);
+
+    object_unref(OBJECT(xc));
+}
+
 static void x86_cpu_definition_entry(gpointer data, gpointer user_data)
 {
     ObjectClass *oc = data;
@@ -4915,6 +4917,8 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
     return cpu_list;
 }
 
+#endif /* !CONFIG_USER_ONLY */
+
 uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
                                             bool migratable_only)
 {
-- 
2.38.1


