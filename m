Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2484E6514A9
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 22:12:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7NPT-0002yn-UM; Mon, 19 Dec 2022 16:10:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7NPS-0002y7-D3
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 16:10:54 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7NPP-0003y0-II
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 16:10:54 -0500
Received: by mail-ej1-x62c.google.com with SMTP id t17so24691002eju.1
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 13:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NPkoqq4yf4wnku5ZZhretEonRdVE00oWaMYivRhv1Lc=;
 b=cl1IRxf2aZNF6cSKl6kq2ornlqku0N+On0HaoV6gdYdhBG4WCgbbSx1FQj6i8vXIr0
 Fx23Mu+0qCXaaoHP9Xto80h523UKT+UJToSeqtqoCzH+fHdIvh5OWBSvB02z9cQSiRo4
 OhS9ESIgDVVWGmq10qzuRRzWvX3VCJYY5dFrMO+yyWIKdQzZHrx0pFJj6cPUxfKg5SgR
 fJa+CsSlqprRs2QLfnLLuWBzVwxWl7D3zaipfE199FA8BKTXu56d+eLGn7fslWh/VkDb
 kyboVZxijyCbgAoD0cCTBZcsJflgUBntGEP56fe5YHY+BjLT0sCmCBGoGMR+ZtgoRXIp
 bq4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NPkoqq4yf4wnku5ZZhretEonRdVE00oWaMYivRhv1Lc=;
 b=5Sbqn91CJUpp9RKemhW1AuM+7ZnzRcdw12Yiirj6hra2EhS2N0K/sJ0sQkro8zINJp
 Wy8zDCHOgW1TwZIUUvnpxJKLYukKvFIRtjbMZ0HW/WneKYIYV/yzh69j11SV3jRQ4Tus
 42sV8zwXAyVPKt+zR/+7JiP6MoHbKTHF++8TgVto5Yp4pnGWtYcNkwPJN18i3/nsoY3M
 7HptgU32nja+yF7X98f1V5GXFeM0Ya/emTZ6i9qtd/3/aJrPdzr03B21zKSqBhJGOMeY
 WYiq3NWJGlBCZBcTwmgVxtZmV4PD8SkV8v8QaFdp2gUvi5xCtw4IY3/sRxN/2CoaTxtj
 DLEQ==
X-Gm-Message-State: AFqh2kqAaTz+AiHDY3YVfD4WVdNe17DiXQhFMJQnZihTjmxrwdtV094R
 9v7XwBEpi/p4dTyJ8SrM+GiTbHr21wXzFGa7Kp8=
X-Google-Smtp-Source: AMrXdXsaTEMaBkBDodxQsG1rta+d/D+sv4l1le1jFcIdXuyvIRRLrF03QvAKje7J149DJO68YItc/Q==
X-Received: by 2002:a17:906:49d2:b0:7b9:f9d8:9554 with SMTP id
 w18-20020a17090649d200b007b9f9d89554mr13333669ejv.40.1671484249785; 
 Mon, 19 Dec 2022 13:10:49 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 3-20020a170906318300b00782ee6b34f2sm4816535ejy.183.2022.12.19.13.10.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Dec 2022 13:10:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Greg Kurz <groug@kaod.org>,
 Song Gao <gaosong@loongson.cn>
Subject: [PATCH 2/4] target/loongarch: Restrict 'qapi-commands-machine.h' to
 system emulation
Date: Mon, 19 Dec 2022 22:10:32 +0100
Message-Id: <20221219211034.70491-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219211034.70491-1-philmd@linaro.org>
References: <20221219211034.70491-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62c.google.com
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

Since commit a0e61807a3 ("qapi: Remove QMP events and commands from
user-mode builds") we don't generate the "qapi-commands-machine.h"
header in a user-emulation-only build.

Extract the QMP functions from cpu.c (which is always compiled) to
the new 'cpu-monitor.c' unit (which is only compiled when system
emulation is selected).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/loongarch/cpu-monitor.c | 37 ++++++++++++++++++++++++++++++++++
 target/loongarch/cpu.c         | 27 -------------------------
 target/loongarch/meson.build   |  1 +
 3 files changed, 38 insertions(+), 27 deletions(-)
 create mode 100644 target/loongarch/cpu-monitor.c

diff --git a/target/loongarch/cpu-monitor.c b/target/loongarch/cpu-monitor.c
new file mode 100644
index 0000000000..6c25957881
--- /dev/null
+++ b/target/loongarch/cpu-monitor.c
@@ -0,0 +1,37 @@
+/*
+ * QEMU LoongArch CPU (monitor definitions)
+ *
+ * SPDX-FileCopyrightText: 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/qapi-commands-machine-target.h"
+#include "cpu.h"
+
+static void loongarch_cpu_add_definition(gpointer data, gpointer user_data)
+{
+    ObjectClass *oc = data;
+    CpuDefinitionInfoList **cpu_list = user_data;
+    CpuDefinitionInfo *info = g_new0(CpuDefinitionInfo, 1);
+    const char *typename = object_class_get_name(oc);
+
+    info->name = g_strndup(typename,
+                           strlen(typename) - strlen("-" TYPE_LOONGARCH_CPU));
+    info->q_typename = g_strdup(typename);
+
+    QAPI_LIST_PREPEND(*cpu_list, info);
+}
+
+CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
+{
+    CpuDefinitionInfoList *cpu_list = NULL;
+    GSList *list;
+
+    list = object_class_get_list(TYPE_LOONGARCH_CPU, false);
+    g_slist_foreach(list, loongarch_cpu_add_definition, &cpu_list);
+    g_slist_free(list);
+
+    return cpu_list;
+}
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index e7b0e12be6..0fb853d915 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -12,7 +12,6 @@
 #include "qemu/module.h"
 #include "sysemu/qtest.h"
 #include "exec/exec-all.h"
-#include "qapi/qapi-commands-machine-target.h"
 #include "cpu.h"
 #include "internals.h"
 #include "fpu/softfloat-helpers.h"
@@ -744,29 +743,3 @@ static const TypeInfo loongarch_cpu_type_infos[] = {
 };
 
 DEFINE_TYPES(loongarch_cpu_type_infos)
-
-static void loongarch_cpu_add_definition(gpointer data, gpointer user_data)
-{
-    ObjectClass *oc = data;
-    CpuDefinitionInfoList **cpu_list = user_data;
-    CpuDefinitionInfo *info = g_new0(CpuDefinitionInfo, 1);
-    const char *typename = object_class_get_name(oc);
-
-    info->name = g_strndup(typename,
-                           strlen(typename) - strlen("-" TYPE_LOONGARCH_CPU));
-    info->q_typename = g_strdup(typename);
-
-    QAPI_LIST_PREPEND(*cpu_list, info);
-}
-
-CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
-{
-    CpuDefinitionInfoList *cpu_list = NULL;
-    GSList *list;
-
-    list = object_class_get_list(TYPE_LOONGARCH_CPU, false);
-    g_slist_foreach(list, loongarch_cpu_add_definition, &cpu_list);
-    g_slist_free(list);
-
-    return cpu_list;
-}
diff --git a/target/loongarch/meson.build b/target/loongarch/meson.build
index 6376f9e84b..dfd65ae742 100644
--- a/target/loongarch/meson.build
+++ b/target/loongarch/meson.build
@@ -17,6 +17,7 @@ loongarch_tcg_ss.add(zlib)
 
 loongarch_softmmu_ss = ss.source_set()
 loongarch_softmmu_ss.add(files(
+  'cpu-monitor.c',
   'machine.c',
   'tlb_helper.c',
   'constant_timer.c',
-- 
2.38.1


