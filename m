Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EAC651F66
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 12:05:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7aQ7-0000zr-7a; Tue, 20 Dec 2022 06:04:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7aPV-0000o2-E7
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:03:52 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7aPS-0002MZ-6A
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:03:49 -0500
Received: by mail-wm1-x32f.google.com with SMTP id ay40so8412308wmb.2
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 03:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tc4icU5uIZDb6KV/spc5EMSSVzOZKwdCLgvhFKNLqtU=;
 b=nXfZ+zjHuCw0iulHIaB9nXsY3wJAN3AaP6ZCsTQpOal3ZcenlArGCoadjO9G5KYbUZ
 E718kX60ONJN0LMV23b/eTrfsXMTPkZ231Dv4O4zaWjd/uTG177zkm4ThNmHkL3wQb3i
 AhTo538LACrCueH5AlMFYfDdAuQ1UF16DAECWUHPHqcoNyJGn+E1bC/5sEhq3MInU8Hh
 mBqjAF8/bPbUpgOFYNsyWy/kglvwbmo+X5/6UejhpcITLeTS4JEjofW5BgG1EnIBNMS3
 7WPDMJsVWiLNqVbNtglGXSRzEzdxaFrUzMHEBUCIwWqxABaWnbg21tjBalqnRDfXHzgz
 GfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tc4icU5uIZDb6KV/spc5EMSSVzOZKwdCLgvhFKNLqtU=;
 b=rxii/FxrN5pZ2PUN1vfFEurhrg6OHp7KsoT+s6ItgTrzOFvShlePg7WWNdwJoXbdW6
 DlrOFWuz6YkNi94B2lVDlipx7Mk1djy2haCPxZShAMszV+iuhyStJiq90ItXyJ1RxM01
 zlSHTidxHQt6tXfjm0wuhsD/Xa9q9Yw1YmA34NDNzOkSGR9ZkeH0UNYE5ZmYzxj00NA4
 ZtbzEPlAJMKBrzrUbQHWh/AfbEbWw+bx9p5/9g8y6Z7p2N/qOfU/TXz9yXphzRdKOsIq
 9guprAeN6dt9XLPEs2Di/n1E/BFvk9fChXF946ezMruykHyMJ61NDvhiOC8yQqviuV2/
 Y7jg==
X-Gm-Message-State: ANoB5plDmw/sXKetYpx2ptL6Ic7/qHUedfSrCLBI2nQ/LE4jQe+oP9sD
 zGOGs3KOAJ9/3FK9chMZmtUZ3CMH6IPinIaKvtc=
X-Google-Smtp-Source: AA0mqf60aEDzRKAIAP2kZWcSRfgufcF+qxQj3zk45sP5pumEKPlsjMt5v+AL8d5NjQDXTY1MfrQWtg==
X-Received: by 2002:a05:600c:3d0d:b0:3cf:e95b:fe71 with SMTP id
 bh13-20020a05600c3d0d00b003cfe95bfe71mr33553980wmb.9.1671534224364; 
 Tue, 20 Dec 2022 03:03:44 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l20-20020a05600c2cd400b003c70191f267sm22535267wmc.39.2022.12.20.03.03.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 03:03:43 -0800 (PST)
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
Subject: [PATCH v2 5/5] target/ppc: Restrict 'qapi-commands-machine.h' to
 system emulation
Date: Tue, 20 Dec 2022 12:03:10 +0100
Message-Id: <20221220110310.8656-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220110310.8656-1-philmd@linaro.org>
References: <20221220110310.8656-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

Move the QMP functions from cpu_init.c (which is always compiled) to
monitor.c (which is only compiled when system-emulation is selected).
Note ppc_cpu_class_by_name() is used by both file units, so we expose
its prototype in "cpu-qom.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu-qom.h  |  2 ++
 target/ppc/cpu_init.c | 48 +----------------------------------------
 target/ppc/monitor.c  | 50 ++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 52 insertions(+), 48 deletions(-)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 89ff88f28c..6431c520c8 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -31,6 +31,8 @@
 
 OBJECT_DECLARE_CPU_TYPE(PowerPCCPU, PowerPCCPUClass, POWERPC_CPU)
 
+ObjectClass *ppc_cpu_class_by_name(const char *name);
+
 typedef struct CPUArchState CPUPPCState;
 typedef struct ppc_tb_t ppc_tb_t;
 typedef struct ppc_dcr_t ppc_dcr_t;
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index cbf0081374..7858cc4c6c 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -40,7 +40,6 @@
 #include "qemu/cutils.h"
 #include "disas/capstone.h"
 #include "fpu/softfloat.h"
-#include "qapi/qapi-commands-machine-target.h"
 
 #include "helper_regs.h"
 #include "internal.h"
@@ -6816,7 +6815,7 @@ static const char *ppc_cpu_lookup_alias(const char *alias)
     return NULL;
 }
 
-static ObjectClass *ppc_cpu_class_by_name(const char *name)
+ObjectClass *ppc_cpu_class_by_name(const char *name)
 {
     char *cpu_model, *typename;
     ObjectClass *oc;
@@ -6956,51 +6955,6 @@ void ppc_cpu_list(void)
 #endif
 }
 
-static void ppc_cpu_defs_entry(gpointer data, gpointer user_data)
-{
-    ObjectClass *oc = data;
-    CpuDefinitionInfoList **first = user_data;
-    const char *typename;
-    CpuDefinitionInfo *info;
-
-    typename = object_class_get_name(oc);
-    info = g_malloc0(sizeof(*info));
-    info->name = g_strndup(typename,
-                           strlen(typename) - strlen(POWERPC_CPU_TYPE_SUFFIX));
-
-    QAPI_LIST_PREPEND(*first, info);
-}
-
-CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
-{
-    CpuDefinitionInfoList *cpu_list = NULL;
-    GSList *list;
-    int i;
-
-    list = object_class_get_list(TYPE_POWERPC_CPU, false);
-    g_slist_foreach(list, ppc_cpu_defs_entry, &cpu_list);
-    g_slist_free(list);
-
-    for (i = 0; ppc_cpu_aliases[i].alias != NULL; i++) {
-        PowerPCCPUAlias *alias = &ppc_cpu_aliases[i];
-        ObjectClass *oc;
-        CpuDefinitionInfo *info;
-
-        oc = ppc_cpu_class_by_name(alias->model);
-        if (oc == NULL) {
-            continue;
-        }
-
-        info = g_malloc0(sizeof(*info));
-        info->name = g_strdup(alias->alias);
-        info->q_typename = g_strdup(object_class_get_name(oc));
-
-        QAPI_LIST_PREPEND(cpu_list, info);
-    }
-
-    return cpu_list;
-}
-
 static void ppc_cpu_set_pc(CPUState *cs, vaddr value)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
diff --git a/target/ppc/monitor.c b/target/ppc/monitor.c
index 8250b1304e..36e5b5eff8 100644
--- a/target/ppc/monitor.c
+++ b/target/ppc/monitor.c
@@ -1,5 +1,5 @@
 /*
- * QEMU monitor
+ * QEMU PPC (monitor definitions)
  *
  * Copyright (c) 2003-2004 Fabrice Bellard
  *
@@ -28,6 +28,9 @@
 #include "qemu/ctype.h"
 #include "monitor/hmp-target.h"
 #include "monitor/hmp.h"
+#include "qapi/qapi-commands-machine-target.h"
+#include "cpu-models.h"
+#include "cpu-qom.h"
 
 static target_long monitor_get_ccr(Monitor *mon, const struct MonitorDef *md,
                                    int val)
@@ -172,3 +175,48 @@ int target_get_monitor_def(CPUState *cs, const char *name, uint64_t *pval)
 
     return -EINVAL;
 }
+
+static void ppc_cpu_defs_entry(gpointer data, gpointer user_data)
+{
+    ObjectClass *oc = data;
+    CpuDefinitionInfoList **first = user_data;
+    const char *typename;
+    CpuDefinitionInfo *info;
+
+    typename = object_class_get_name(oc);
+    info = g_malloc0(sizeof(*info));
+    info->name = g_strndup(typename,
+                           strlen(typename) - strlen(POWERPC_CPU_TYPE_SUFFIX));
+
+    QAPI_LIST_PREPEND(*first, info);
+}
+
+CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
+{
+    CpuDefinitionInfoList *cpu_list = NULL;
+    GSList *list;
+    int i;
+
+    list = object_class_get_list(TYPE_POWERPC_CPU, false);
+    g_slist_foreach(list, ppc_cpu_defs_entry, &cpu_list);
+    g_slist_free(list);
+
+    for (i = 0; ppc_cpu_aliases[i].alias != NULL; i++) {
+        PowerPCCPUAlias *alias = &ppc_cpu_aliases[i];
+        ObjectClass *oc;
+        CpuDefinitionInfo *info;
+
+        oc = ppc_cpu_class_by_name(alias->model);
+        if (oc == NULL) {
+            continue;
+        }
+
+        info = g_malloc0(sizeof(*info));
+        info->name = g_strdup(alias->alias);
+        info->q_typename = g_strdup(object_class_get_name(oc));
+
+        QAPI_LIST_PREPEND(cpu_list, info);
+    }
+
+    return cpu_list;
+}
-- 
2.38.1


