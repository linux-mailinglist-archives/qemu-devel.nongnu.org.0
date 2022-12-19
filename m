Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 463D26514AC
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 22:12:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7NPh-00033r-ME; Mon, 19 Dec 2022 16:11:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7NPf-00033R-L8
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 16:11:07 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7NPc-000465-Ai
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 16:11:07 -0500
Received: by mail-ed1-x531.google.com with SMTP id b69so14752510edf.6
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 13:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kbljNJ/3DOB4iD5zOxe+2hDnk7LlNHAUOP/XHBmgK/g=;
 b=NwPtn25NjWoboOcMmng73uvvE9DcBxmFHRb0unSHsjI8gNlg5QFLvNqOA+FwX+hV6i
 BLTGPBLNWC9FbvhNIoUGZqSOjHzRUxzl0yrc4ekkZOhQzfgpIRxDnqv8HfoIamcvU8+9
 4GispSWNDUrt0oDXpLAOr5oC4gzGkyearv9md9X0XoWQXB04W40ff3ZduCDRwHzGwJ9D
 VNSpcJERdghahtNk9ERuznoGYkoXYRMfV9dlRFH2N1fxnpsCNfaz4QQXTaWJ6KRGerH3
 UEV/5ejJc53yK5k6Um87CvoiShOT7PlfYVSgaUcsOAqKeM4sZxfT3/ubsiQeOMxek9Zw
 ixtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kbljNJ/3DOB4iD5zOxe+2hDnk7LlNHAUOP/XHBmgK/g=;
 b=X0LGpU5/iE7Ua4BgTdm9eM74hK2svd7izYRPRdC+HOMLyK3HPkGxjyevRdusUxhgfv
 KRYbZ+Sp6355iEbf4t0VIxIQNOmo+KF3/EwKjr5cTh2KpM+yx2PjrSy7KVQoMa4xdB4c
 ZCzy864vj3Q6joQInE75y/7spVRdy0Fzl9ERfExBpnHYO2Y1093s+ATgkerRPdxZOQqJ
 QmCxfQiur+g3HMVCsVCaksVleIHcshXVo0HgYXR7L52hlm38gAy/k55VEnrwMPcPqDRc
 veDVcb5eYvfZSSXH4SQeiKF/Jm5it+AAjfRkb6XlxnMcXOeuq7PPe8/RSDoVVS9GvTFZ
 CNIQ==
X-Gm-Message-State: ANoB5pn3geTlFEqCWsZCK+1P3UNwmrDG0BaBxFUJy1euhrIyK1Kel8ba
 golCUBavPNDi+z2CQuMCrVGjJk6EzVEuUK42u30=
X-Google-Smtp-Source: AA0mqf4Et/MBJQLdRQE6GAS0J7tPXjhYxJoCxtMogWieYp74lkqL8pGU7J/4xnIMcdPBIGCRi2fRjw==
X-Received: by 2002:a05:6402:299b:b0:468:fd17:aeb9 with SMTP id
 eq27-20020a056402299b00b00468fd17aeb9mr34714874edb.0.1671484262753; 
 Mon, 19 Dec 2022 13:11:02 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n19-20020aa7d053000000b00463c5c32c6esm4793389edo.89.2022.12.19.13.11.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Dec 2022 13:11:02 -0800 (PST)
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
Subject: [PATCH 4/4] target/ppc: Restrict 'qapi-commands-machine.h' to system
 emulation
Date: Mon, 19 Dec 2022 22:10:34 +0100
Message-Id: <20221219211034.70491-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219211034.70491-1-philmd@linaro.org>
References: <20221219211034.70491-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x531.google.com
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


