Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3871651F68
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 12:05:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7aPH-0000hu-EH; Tue, 20 Dec 2022 06:03:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7aPC-0000eH-52
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:03:30 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7aP9-0002JA-N8
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:03:29 -0500
Received: by mail-wr1-x42f.google.com with SMTP id w15so11347841wrl.9
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 03:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N/h6l6Dt4LtktYJzyaWdIUhcMQmq+IUjXoUtOmfFZYU=;
 b=B1Y6gzfnRX2slGZn1yrWt62YpN3fgoftDdBks09/8a1Bqux/jGxPx722o07OrXZ1KY
 egg+6Byaq9uTn0vnN21lMNx3hm9iaUx1DiSSiTdPc77kqA0y6O6uxOdn6YTBCldLklvz
 +1Ci9Quaz3moHMRPHyYd4heuuwtpoKsdv7zVkjDqKdqrF7X1Xd6mXG/lQN7VEvkLC+x4
 n9lSyV4wNg9w2+cTxncCDxkI90goyDgZ32Lsc/IaMo7sJKioGSr8DVyTdxCgZtkaisKO
 F1aX7qFd3Yb43PkY/fWXuAuKMvOV5OeuGOML1jyV/huDCRIvPmjIaJPA32HMiF2HRLtA
 jgIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N/h6l6Dt4LtktYJzyaWdIUhcMQmq+IUjXoUtOmfFZYU=;
 b=WYHc/oUk7JNxTUUAaVSAVnGMlUhoEVLvs/n0f6oHxfZMJtJHwMDQ7YgEdTp6rGZNZk
 j7AwtpSKvbuk4AaKWB6g85xu1CboDbIEcjM1zq5sJBVQnLgXwz7pZof8MRkQ0NXVmoQ0
 z1XHchMZ80NL1+HxRxGs+L7VV2B6lhObcp1ZlIg/Jcz3Eyvu4lFFBseYuZsrrCMLBtRn
 n7dBATHhIFJD45JEehgkparGvhYbHXc0sZ4z1/1Ib+F8V9sk+foSk1LBS9StcBNXbSUM
 QUwruA2GzH2Z9/JmhcNw7Ul4EX5eXsJ+vrN29G7kpB6JP+TYaXfc11q7gutiK9aQCdpt
 z3lQ==
X-Gm-Message-State: AFqh2kpu/s4r4e6ntjlgxErgDyNRUXKoQ/5toDt5HKY5fkHRjeieBJtL
 xNIa7unEQW3I56ljsX96n481mMHtDCgoDQGu5cE=
X-Google-Smtp-Source: AMrXdXs/ecXwL0htir+FC6YOULi8IyVHTojsLDQjOSxCZcd89vmUdIoSW13cMEW73/m+yhHVh29HNQ==
X-Received: by 2002:a05:6000:1c13:b0:263:56a0:4fde with SMTP id
 ba19-20020a0560001c1300b0026356a04fdemr3719696wrb.14.1671534205962; 
 Tue, 20 Dec 2022 03:03:25 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 az29-20020adfe19d000000b0024246991121sm12402834wrb.116.2022.12.20.03.03.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 03:03:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Song Gao <gaosong@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-arm@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 2/5] target/i386: Restrict 'qapi-commands-machine.h' to
 system emulation
Date: Tue, 20 Dec 2022 12:03:07 +0100
Message-Id: <20221220110310.8656-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220110310.8656-1-philmd@linaro.org>
References: <20221220110310.8656-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


