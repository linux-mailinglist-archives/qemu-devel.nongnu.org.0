Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C729E651F9D
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 12:25:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7aXN-0004DA-8Z; Tue, 20 Dec 2022 06:11:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7aXH-00049p-T7
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:11:52 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7aXF-0003gq-OH
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:11:51 -0500
Received: by mail-wr1-x42a.google.com with SMTP id y16so11411597wrm.2
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 03:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e1KLjwcpkRpHkyHTd4A9nwCZS64HWEF8CTuzylI9ZoM=;
 b=OU5BSyF04QdnicIifhGADL+Gj7OWykvfKE3UcoqFvYYSFMjqR2IUM/yRNKMXN6sxpn
 r78EBMvrw0gUCLrT/3KVyldKeU5wfGwL+qhlW6c+7rJnE/EcCn4fruHOWbgpse9w8niN
 rXr9pCw5R2Ekc4+277RsUUrVNrUw43ll5R4jIgdK7ATHawPwmhlvjckpatAY3pnRZedy
 Uh+shMiYgZbFHD/PQnmWV7DXfqr5p5jZSDftAj6UXkWJx4D2ZSIykbVbJXlHcmRdWQ7j
 7SdKIkhKs5+98gCj8sOqIoaiqz++0URWTwYgCF0ys0ySZk25sY/fij4lKZYUAEXm95VM
 HUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e1KLjwcpkRpHkyHTd4A9nwCZS64HWEF8CTuzylI9ZoM=;
 b=hRFMyovl6jwAOxpF74OZBoNq2E/Aja4/CD8DWmI4ugTvv89riyvaZZ8jIIli9OisVp
 Jb+MkisSOkXO3u/tyTI6kFJyoTsXZa/6fYWqL5qk5b9l9LPtoZiemMjQ5VbjOwfK5V7B
 hbLDcTf/kLGymoNn1DsAgSVcJqn9QWj0e5ef/7NzyWfwKkkwSdT591wnoZ5BBPwNMo5g
 al+spjiDbkMaOFXN2BZJnt+QeIcYkOy/NBZuvo0VukPbDaKSgJtA3P0mhT6S1xLSO2RT
 +uMqViu4xvn9lCrrtFFn7kX9MZEePLQ0INRzI4F1U4jR9MPd/tBz2plNX3Qx2CtebE6V
 5Oqw==
X-Gm-Message-State: AFqh2kpIwT5+kdJZs/Kk3jStVp2EBtXga7ahLO3+gBNvHRg59/hM2AwJ
 FwxcnKY4yUd5fBRRTPdEaF6LSmfztv7WuXAJU6c=
X-Google-Smtp-Source: AMrXdXteL+UfxSviWjQBIaYK793Ul9Q1bRLk9jOII6yzOadiDThclvPUla4St0N46nDHLV52uN2hJQ==
X-Received: by 2002:adf:f6c2:0:b0:242:144:90c4 with SMTP id
 y2-20020adff6c2000000b00242014490c4mr1053505wrp.28.1671534708756; 
 Tue, 20 Dec 2022 03:11:48 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 az29-20020adfe19d000000b0024246991121sm12422027wrb.116.2022.12.20.03.11.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 03:11:48 -0800 (PST)
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
Subject: [PATCH RESEND v2 4/5] target/mips: Restrict 'qapi-commands-machine.h'
 to system emulation
Date: Tue, 20 Dec 2022 12:11:21 +0100
Message-Id: <20221220111122.8966-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220111122.8966-1-philmd@linaro.org>
References: <20221220111122.8966-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
the new 'sysemu/monitor.c' unit (which is only compiled when system
emulation is selected).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/cpu.c              | 29 -------------------------
 target/mips/sysemu/meson.build |  1 +
 target/mips/sysemu/monitor.c   | 39 ++++++++++++++++++++++++++++++++++
 3 files changed, 40 insertions(+), 29 deletions(-)
 create mode 100644 target/mips/sysemu/monitor.c

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 7a565466cb..7a37123419 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -32,7 +32,6 @@
 #include "hw/qdev-properties.h"
 #include "hw/qdev-clock.h"
 #include "semihosting/semihost.h"
-#include "qapi/qapi-commands-machine-target.h"
 #include "fpu_helper.h"
 
 const char regnames[32][3] = {
@@ -627,34 +626,6 @@ static void mips_cpu_register_types(void)
 
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
index cefc227582..0e424c9cc6 100644
--- a/target/mips/sysemu/meson.build
+++ b/target/mips/sysemu/meson.build
@@ -3,5 +3,6 @@ mips_softmmu_ss.add(files(
   'cp0.c',
   'cp0_timer.c',
   'machine.c',
+  'monitor.c',
   'physaddr.c',
 ))
diff --git a/target/mips/sysemu/monitor.c b/target/mips/sysemu/monitor.c
new file mode 100644
index 0000000000..6db4626412
--- /dev/null
+++ b/target/mips/sysemu/monitor.c
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


