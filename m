Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F61D6A08CD
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 13:45:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVAx1-0007ZD-W7; Thu, 23 Feb 2023 07:43:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVAwz-0007Ym-Gk
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:43:53 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVAwv-00031o-Ua
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:43:53 -0500
Received: by mail-wr1-x431.google.com with SMTP id q16so234165wrw.2
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 04:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kk8+WybWrT+4XbLQ/Ff9Tr3FqtmYJrKEElH7cekw4R0=;
 b=a2qMwwkoCD5+cQfHxOYFVbIYvYsjXNsQEhoN1F/q7QPnU9kK2nycXp+NxlCAHhAQxL
 t9it53jvpJrdaPk8+azlsvTXGn9cvLfQPqOLeOCPaQrH2656p1VnGLcGxKTft0nAKELp
 EsNQb88k71slbvwGKck5p9rsAS+U0mdLn4EOIdHUMdKn8i5LtJpyp+WW5303MvD7D85n
 nYqTzX5Cew03VdMvW7M6eST136jy8PK5SGel8JtKErWOsaD1HJXizSoUrmeqpburzuwD
 NMT52TdM5UdAlNhnuMHcr6TAxzinV2RWWhsH6PZErtwtRrpo8oGRVz0jrlcwCxMvx9Bx
 B4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kk8+WybWrT+4XbLQ/Ff9Tr3FqtmYJrKEElH7cekw4R0=;
 b=JBZosXhwm3EZ6IfbO/b5qtEHIj7gOeBQST9lncqkUP9uMTe0PRirmBXv0B0/cwrMY+
 +mPTkfDy/jJds7a6fcsdtNQMu/+EsQkGA0Pr+HZSuDYYT5NnauQm2H3QRrG1iBl/Af+W
 cMm5N1+/D1TTJCqlAn8xMDwg7ufzLCzu7ZZgvvajAZD77GWkw32IbK5o9TARk2e6RL1l
 2D8Y5Cr0oZMOvBIS5wGK8HoXU9m62opzeLvGy+t9EzdYjSTCgrBuMT5CVZfTEFhaBCF0
 xszHMzqffdqY7/Kb/OJV7oAS7mtuXcTjgHON5kt7k8J0LtFv5Vp1dnOblnqUjaS9Mt/b
 osQQ==
X-Gm-Message-State: AO0yUKXFoQUP9rwYhAtLVWdW629QqJUioIHTyfoHq1kAzzJ5GDbrE+2O
 MUa/fc3jL97d4VazQ6pJTWF74Q==
X-Google-Smtp-Source: AK7set9ALSoDj3EQFUetL/JIlrjCGn+oKg/79uWTNix/3vG/Th9iYlPzbuE/TK/4Ag6blwJsGMtwgQ==
X-Received: by 2002:adf:e941:0:b0:2c7:be8:4873 with SMTP id
 m1-20020adfe941000000b002c70be84873mr4810717wrn.58.1677156228444; 
 Thu, 23 Feb 2023 04:43:48 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bl1-20020adfe241000000b002c54d8b89efsm10883913wrb.26.2023.02.23.04.43.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Feb 2023 04:43:47 -0800 (PST)
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
Subject: [PATCH v3 1/4] target/arm: Restrict 'qapi-commands-machine.h' to
 system emulation
Date: Thu, 23 Feb 2023 13:43:37 +0100
Message-Id: <20230223124340.95367-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230223124340.95367-1-philmd@linaro.org>
References: <20230223124340.95367-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

Since commit a0e61807a3 ("qapi: Remove QMP events and commands from
user-mode builds") we don't generate the "qapi-commands-machine.h"
header in a user-emulation-only build.

Move the QMP functions from helper.c (which is always compiled)
to arm-qmp-cmds.c (which is only compiled when system-emulation
is selected).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/{monitor.c => arm-qmp-cmds.c} | 28 +++++++++++++++++++++++
 target/arm/helper.c                      | 29 ------------------------
 target/arm/meson.build                   |  2 +-
 3 files changed, 29 insertions(+), 30 deletions(-)
 rename target/arm/{monitor.c => arm-qmp-cmds.c} (90%)

diff --git a/target/arm/monitor.c b/target/arm/arm-qmp-cmds.c
similarity index 90%
rename from target/arm/monitor.c
rename to target/arm/arm-qmp-cmds.c
index ecdd5ee817..c8fa524002 100644
--- a/target/arm/monitor.c
+++ b/target/arm/arm-qmp-cmds.c
@@ -227,3 +227,31 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
 
     return expansion_info;
 }
+
+static void arm_cpu_add_definition(gpointer data, gpointer user_data)
+{
+    ObjectClass *oc = data;
+    CpuDefinitionInfoList **cpu_list = user_data;
+    CpuDefinitionInfo *info;
+    const char *typename;
+
+    typename = object_class_get_name(oc);
+    info = g_malloc0(sizeof(*info));
+    info->name = g_strndup(typename,
+                           strlen(typename) - strlen("-" TYPE_ARM_CPU));
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
+    list = object_class_get_list(TYPE_ARM_CPU, false);
+    g_slist_foreach(list, arm_cpu_add_definition, &cpu_list);
+    g_slist_free(list);
+
+    return cpu_list;
+}
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 07d4100365..77eed96761 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -23,7 +23,6 @@
 #include "sysemu/cpu-timers.h"
 #include "sysemu/kvm.h"
 #include "sysemu/tcg.h"
-#include "qapi/qapi-commands-machine-target.h"
 #include "qapi/error.h"
 #include "qemu/guest-random.h"
 #ifdef CONFIG_TCG
@@ -9212,34 +9211,6 @@ void arm_cpu_list(void)
     g_slist_free(list);
 }
 
-static void arm_cpu_add_definition(gpointer data, gpointer user_data)
-{
-    ObjectClass *oc = data;
-    CpuDefinitionInfoList **cpu_list = user_data;
-    CpuDefinitionInfo *info;
-    const char *typename;
-
-    typename = object_class_get_name(oc);
-    info = g_malloc0(sizeof(*info));
-    info->name = g_strndup(typename,
-                           strlen(typename) - strlen("-" TYPE_ARM_CPU));
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
-    list = object_class_get_list(TYPE_ARM_CPU, false);
-    g_slist_foreach(list, arm_cpu_add_definition, &cpu_list);
-    g_slist_free(list);
-
-    return cpu_list;
-}
-
 /*
  * Private utility function for define_one_arm_cp_reg_with_opaque():
  * add a single reginfo struct to the hash table.
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 87e911b27f..6d1ac4c471 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -59,8 +59,8 @@ arm_softmmu_ss = ss.source_set()
 arm_softmmu_ss.add(files(
   'arch_dump.c',
   'arm-powerctl.c',
+  'arm-qmp-cmds.c',
   'machine.c',
-  'monitor.c',
   'psci.c',
   'ptw.c',
 ))
-- 
2.38.1


