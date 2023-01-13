Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E18C466A0A6
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 18:25:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMJ1-0003Ut-VG; Fri, 13 Jan 2023 10:49:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMIt-0003L9-07
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:49:15 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMIq-0006gl-Vr
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:49:14 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 m26-20020a05600c3b1a00b003d9811fcaafso17660623wms.5
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WK2+v1deVNG12LxzaxOU+TFwx4PoX87lBGcOg5rv8EM=;
 b=HebdcOnzND6/xQeCB5nGRaOpB8/1Uv5XaVNGuxKGyMnbBZOp/QhbdbgMHUbYoRKwIh
 cMAejBNMwgVwyY1S8u29mLEO+vtpo1kSt3xk6SocL/y3X+v8wNQbMoNyFZ7UcX+AMGFz
 Q4VbGuywG9UjXY0eFYieblhQe1ePAfQqerExXRX/5EIxOVqSwBw/KMnZpz7sQuG5OYL1
 hTy/qpJ9gKRQuJ21qfe7Tw8v6PEPV6pdV9NVZY6LQnRkV6WPHybhjntuugPz9ULhCpuL
 U4LcUuGKnxp1VoqYco8VUHpU/cyOa+FVqs13EfE84kTMToGI1UYsmW18nus9bC6kXIu2
 mpRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WK2+v1deVNG12LxzaxOU+TFwx4PoX87lBGcOg5rv8EM=;
 b=6sTZJ1i/AOlD1D/zV6x8SKZTHBjlrcW7p+xku8205NTxrT/6k9uUMpyAIazzJV2KP/
 9mFDTy1RBTjC5siwlOL1yKXDegpKECpDlM8tARCgqCoZQqbyUS0neaS6oUDYCVrmEeSh
 9cewBToCjzdwKM2U37gihefRT/5XKRgav/bzu9GzXjo7HT5sxIZRY2QI6JPHwjFSsEBV
 8e7RKXnnOh2q8rgZ7D7jHe5lHk0Dpc0GQcNccgIrGgMlpA9PIFczWHz1sNMwtRvG/RBz
 IH3I8XJ5LPLqHiz2git3s78CYDlX/fGCqeWQQOIz8snNB4pgk94EfakZyprGKuGBC2Tc
 Mq8w==
X-Gm-Message-State: AFqh2kq7MF3HL/BoJ96LtyfvLYBaackNTBjOm5d5t2MDbn30i5liVb+c
 pbItpEWvROHGGzQD3otmxCFjomDB+WUdMBUK
X-Google-Smtp-Source: AMrXdXvbhy/Syv7wgiG2JNc0mKVkcO5QED7iQRuJupomBeza381cbBBiVn7QDAXLVaX/YKsJQJnnfQ==
X-Received: by 2002:a05:600c:1e18:b0:3d2:5e4e:701 with SMTP id
 ay24-20020a05600c1e1800b003d25e4e0701mr59017685wmb.31.1673624951978; 
 Fri, 13 Jan 2023 07:49:11 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 j30-20020a05600c1c1e00b003cfa80443a0sm28775741wms.35.2023.01.13.07.49.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:49:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 45/46] target/mips: Restrict 'qapi-commands-machine.h' to
 system emulation
Date: Fri, 13 Jan 2023 16:45:31 +0100
Message-Id: <20230113154532.49979-46-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

Extract the QMP functions from cpu.c (which is always compiled) to
the new 'sysemu/mips-qmp-cmds.c' unit (which is only compiled when
system emulation is selected).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221219211034.70491-4-philmd@linaro.org>
---
 target/mips/cpu.c                  | 29 ----------------------
 target/mips/sysemu/meson.build     |  1 +
 target/mips/sysemu/mips-qmp-cmds.c | 39 ++++++++++++++++++++++++++++++
 3 files changed, 40 insertions(+), 29 deletions(-)
 create mode 100644 target/mips/sysemu/mips-qmp-cmds.c

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index f995e88776..05caf54999 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -32,7 +32,6 @@
 #include "hw/qdev-properties.h"
 #include "hw/qdev-clock.h"
 #include "semihosting/semihost.h"
-#include "qapi/qapi-commands-machine-target.h"
 #include "fpu_helper.h"
 
 const char regnames[32][3] = {
@@ -624,34 +623,6 @@ static void mips_cpu_register_types(void)
 
 type_init(mips_cpu_register_types)
 
-static void mips_cpu_add_definition(gpointer data, gpointer user_data)
-{
-    ObjectClass *oc = data;
-    CpuDefinitionInfoList **cpu_list = user_data;
-    CpuDefinitionInfo *info;
-    const char *typename;
-
-    typename = object_class_get_name(oc);
-    info = g_malloc0(sizeof(*info));
-    info->name = g_strndup(typename,
-                           strlen(typename) - strlen("-" TYPE_MIPS_CPU));
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
-    list = object_class_get_list(TYPE_MIPS_CPU, false);
-    g_slist_foreach(list, mips_cpu_add_definition, &cpu_list);
-    g_slist_free(list);
-
-    return cpu_list;
-}
-
 /* Could be used by generic CPU object */
 MIPSCPU *mips_cpu_create_with_clock(const char *cpu_type, Clock *cpu_refclk)
 {
diff --git a/target/mips/sysemu/meson.build b/target/mips/sysemu/meson.build
index cefc227582..261492de5b 100644
--- a/target/mips/sysemu/meson.build
+++ b/target/mips/sysemu/meson.build
@@ -3,5 +3,6 @@ mips_softmmu_ss.add(files(
   'cp0.c',
   'cp0_timer.c',
   'machine.c',
+  'mips-qmp-cmds.c',
   'physaddr.c',
 ))
diff --git a/target/mips/sysemu/mips-qmp-cmds.c b/target/mips/sysemu/mips-qmp-cmds.c
new file mode 100644
index 0000000000..6db4626412
--- /dev/null
+++ b/target/mips/sysemu/mips-qmp-cmds.c
@@ -0,0 +1,39 @@
+/*
+ * QEMU MIPS CPU (monitor definitions)
+ *
+ * SPDX-FileCopyrightText: 2012 SUSE LINUX Products GmbH
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/qapi-commands-machine-target.h"
+#include "cpu.h"
+
+static void mips_cpu_add_definition(gpointer data, gpointer user_data)
+{
+    ObjectClass *oc = data;
+    CpuDefinitionInfoList **cpu_list = user_data;
+    CpuDefinitionInfo *info;
+    const char *typename;
+
+    typename = object_class_get_name(oc);
+    info = g_malloc0(sizeof(*info));
+    info->name = g_strndup(typename,
+                           strlen(typename) - strlen("-" TYPE_MIPS_CPU));
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
+    list = object_class_get_list(TYPE_MIPS_CPU, false);
+    g_slist_foreach(list, mips_cpu_add_definition, &cpu_list);
+    g_slist_free(list);
+
+    return cpu_list;
+}
-- 
2.38.1


