Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D797651F95
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 12:21:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7aXH-00048J-6J; Tue, 20 Dec 2022 06:11:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7aXD-00047E-B2
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:11:47 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7aXA-0003il-I9
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:11:47 -0500
Received: by mail-wm1-x32c.google.com with SMTP id o15so8406534wmr.4
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 03:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MyQMRgrRRtBuBRaMJJ8Zm89RkSug1TwSfRjxwE6LfEk=;
 b=Cwj0Jl3rq3QyIy/DuYaQV3mPAyRBWU4A+3ZPP6rkWqiwmD9OW3nvtH0Mi+Hb8n1BCe
 jcqEPS0R8MPU2Z2l+qU/he7Cc0GRTwRjzgyE4ZFlpOjkzcAB+ehWBFr+Q205zbx9DVLi
 oKs3V8mbEKu32Y/fq1zwkAl/BorOjKnf5XQAhJQGtHnvPPDAwiMRKh8bhPlLBNZgHF95
 LaiyJwxcpg/SjqWJgk+cOfEFjxdR3B0IhiQDmnZtq+ZBdwILq+bdUlM5BN7TgvPcTXRO
 tkGF24+oIZsju8XUYxDceLiKHXuukC+uvEKJCBIdOuW9luHDlW0ABDo5d9MJE/FT8kfY
 EPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MyQMRgrRRtBuBRaMJJ8Zm89RkSug1TwSfRjxwE6LfEk=;
 b=v4mO1DNf27rV4zSQMOm6RzvBHhhx8B9fLek5zVVCfVZH2UifZ0uzW+Ey5/Vnv/cZTd
 CRyNaL4wVwEVbrerqfOD6HqTh/+LrxErnb7SxGuTFRhzxEP5hxp002Ef27Isg8tkoL24
 zhKqgJa3V1oP7y7TvaG7nDrOGw0ibip5ZIb0wOkJJFRaDxqysexa0opIDtPudYDgnBVa
 7Rjo4lHpxNrig8YH5nZWecADdPxWoslD6hqZBckQ/55M1rBYZmXpmQFNz9t5PDnIlbrx
 ja4rfwq5eTlG3/B5rS4kwzbs/NQiynnVr2S7c3BpRjWP4MRpshCqf1EaeBrJprfTebZj
 GC/A==
X-Gm-Message-State: ANoB5pmdSOgSOH1GmISC+210gWAIl8+bF4jHHXo1DY4AVVL5d0NDywvT
 hWuSEUj9SmMqOOmFvv5R/XPF9TL/WYFFwBWrAQQ=
X-Google-Smtp-Source: AA0mqf65BBFxdxNo7YpqIxO7ZYrHqEq1ptwOI3CEvx2jxH4Dn9d/Xi1mxBRObJMm1esxWuZWpm//bg==
X-Received: by 2002:a05:600c:1c81:b0:3d1:e907:17cb with SMTP id
 k1-20020a05600c1c8100b003d1e90717cbmr34340720wms.1.1671534702873; 
 Tue, 20 Dec 2022 03:11:42 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p189-20020a1c29c6000000b003c701c12a17sm22181405wmp.12.2022.12.20.03.11.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 03:11:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Greg Kurz <groug@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Aurelien Jarno <aurelien@aurel32.net>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Markus Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH RESEND v2 3/5] target/loongarch: Restrict
 'qapi-commands-machine.h' to system emulation
Date: Tue, 20 Dec 2022 12:11:20 +0100
Message-Id: <20221220111122.8966-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220111122.8966-1-philmd@linaro.org>
References: <20221220111122.8966-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

Extract the QMP functions from cpu.c (which is always compiled)
to the new 'monitor.c' unit (which is only compiled when system
emulation is selected).

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/loongarch/cpu.c       | 27 --------------------------
 target/loongarch/meson.build |  1 +
 target/loongarch/monitor.c   | 37 ++++++++++++++++++++++++++++++++++++
 3 files changed, 38 insertions(+), 27 deletions(-)
 create mode 100644 target/loongarch/monitor.c

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
index 6376f9e84b..48a7eb7c40 100644
--- a/target/loongarch/meson.build
+++ b/target/loongarch/meson.build
@@ -18,6 +18,7 @@ loongarch_tcg_ss.add(zlib)
 loongarch_softmmu_ss = ss.source_set()
 loongarch_softmmu_ss.add(files(
   'machine.c',
+  'monitor.c',
   'tlb_helper.c',
   'constant_timer.c',
   'csr_helper.c',
diff --git a/target/loongarch/monitor.c b/target/loongarch/monitor.c
new file mode 100644
index 0000000000..6c25957881
--- /dev/null
+++ b/target/loongarch/monitor.c
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
-- 
2.38.1


