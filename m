Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0786A08CB
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 13:45:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVAxB-0007cz-At; Thu, 23 Feb 2023 07:44:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVAx8-0007cJ-Rt
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:44:02 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVAx7-00033d-5i
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:44:02 -0500
Received: by mail-wm1-x32d.google.com with SMTP id j3so6794312wms.2
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 04:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k0k3YaD196s7IoVbwQsB4O8AuR6esyLbrwlewHL7j90=;
 b=sRoy4p+fHrQvJXNyKOSy93/cUpgZ/obx9agK+QvDmloGvU6kBNDM98yuJDk3+A0cq2
 J3ctaK6Leg5E4dWPNUxSwU9Ibxp9sZHJcxw/i171wZxGNg1xxvQpt9KInSiJgtVecjQJ
 dZv75yIBH35s1YYI9bvKI1RXOfApVZp2oWUAHigN+aLYUm72dxesjyfSv0GxPir2HC+2
 +JPT4GdH0eJ2vSGV03geqhZ1MYi3oAUhMCzVTEKNYtVPvHd26xjy+2rWGv4jmowG0BfB
 zXZeex51uiQFaZ+qBkQn6Op1nqPtDffswmqLB+GsuPbRNiHnm8XY8hKTavDVZpJIyI7v
 iqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k0k3YaD196s7IoVbwQsB4O8AuR6esyLbrwlewHL7j90=;
 b=rj7zwGknSUIZ+Qq8pqoriNFj3R9c5outTl3c+xUCdTzd6zYHfS9ZZC6hNVbMoN5a0M
 x/AarXefM0uxpYfZMTtcGQCweXxAI0qLm82Rfe1Rr96nhpqsdPb0QUWluJBQN7iogxBN
 veySfoCDtwo9N0TwXz7Jd4HZHqs6/rswdbanSd5lBTZUBzA9euOO2SxwL6E6UHYaVFRd
 2WdoCdSl3pUBoeBA5+RUOUn0jXdKQIJNRL183HV/XLBhwSfJNR/gJihTS4lG6jqt4zXK
 eMyiv4wW6K/vpEs+fqp86NR8M+j3eyXDCloCH7oi/tpTvtaG2662xjcEnqk0U5XT/GrR
 JsrA==
X-Gm-Message-State: AO0yUKUyqP9ViLVUuCaj/yV9wEmmBX5v38YVYgJqLwG0TxFTXhsfPN2D
 LrEAI7Q11rp/uZ0Lmjj8Xnbvkw==
X-Google-Smtp-Source: AK7set+3a1n+y3oRE/0Iyw4dlcpeARVPKgsiqSYXA8b4Yzz8bPhlwv3OMdJU1ZPtvFpF7gDjMT9Fmw==
X-Received: by 2002:a05:600c:1818:b0:3e8:96d9:579f with SMTP id
 n24-20020a05600c181800b003e896d9579fmr5312579wmp.40.1677156239870; 
 Thu, 23 Feb 2023 04:43:59 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r1-20020adfdc81000000b002c5503a8d21sm7954749wrj.70.2023.02.23.04.43.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Feb 2023 04:43:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 3/4] target/loongarch: Restrict 'qapi-commands-machine.h'
 to system emulation
Date: Thu, 23 Feb 2023 13:43:39 +0100
Message-Id: <20230223124340.95367-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230223124340.95367-1-philmd@linaro.org>
References: <20230223124340.95367-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
 target/loongarch/cpu.c                | 27 -------------------
 target/loongarch/loongarch-qmp-cmds.c | 37 +++++++++++++++++++++++++++
 target/loongarch/meson.build          |  1 +
 3 files changed, 38 insertions(+), 27 deletions(-)
 create mode 100644 target/loongarch/loongarch-qmp-cmds.c

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 290ab4d526..4e845ba29b 100644
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
@@ -748,29 +747,3 @@ static const TypeInfo loongarch_cpu_type_infos[] = {
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
diff --git a/target/loongarch/loongarch-qmp-cmds.c b/target/loongarch/loongarch-qmp-cmds.c
new file mode 100644
index 0000000000..6c25957881
--- /dev/null
+++ b/target/loongarch/loongarch-qmp-cmds.c
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
diff --git a/target/loongarch/meson.build b/target/loongarch/meson.build
index 690633969f..9293a8ab78 100644
--- a/target/loongarch/meson.build
+++ b/target/loongarch/meson.build
@@ -16,6 +16,7 @@ loongarch_tcg_ss.add(zlib)
 
 loongarch_softmmu_ss = ss.source_set()
 loongarch_softmmu_ss.add(files(
+  'loongarch-qmp-cmds.c',
   'machine.c',
   'tlb_helper.c',
   'constant_timer.c',
-- 
2.38.1


