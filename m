Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 367FF6514AB
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 22:12:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7NPZ-000305-IX; Mon, 19 Dec 2022 16:11:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7NPX-0002zO-3l
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 16:10:59 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7NPV-0003sZ-CF
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 16:10:58 -0500
Received: by mail-ed1-x533.google.com with SMTP id d20so14836810edn.0
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 13:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fo8+Ahgs2QuUhudL1bZYU1hHDGowGkitN9gc7X0zF9w=;
 b=bwWRwVNh2H7W4miRdmLssxNZTL/y1dZLH6m5SYn9FpC44e28GsvLhRY1ssiC3mHCB+
 ZPZI/qTcfD6joEfptKsF6ndj1LtzAfH5a2hg6sgk6YBU/f5OPfWFdDvRe5GE0+BhmiOz
 qhjI/mOnAKCiT8duygu4gtutG47OAoWhXqx+KzT3HYLsJk5VMn+iZ+oGYLEUJl9XkpVI
 +hU9oOEUNm2/4HvBv1R4VVpOLShNj//9LEoVUXx1sq6cYwoALaJXlHGd7/5KyVQJY8zt
 qBj9HPvoAyKNf61cnvy9bkqqjdSmtsOyu7TuxqpmKWcxZ6AGBOGNyxcd8qIEMFAqTnxl
 AFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fo8+Ahgs2QuUhudL1bZYU1hHDGowGkitN9gc7X0zF9w=;
 b=x8WyRl451OvtZVHEPjIvkhb9f+j7BZsjpx/x/Tcrcg2d4TEyaUah9gNRzBK0Bv1UHn
 HH4DypcV6N/wFFB0YVvc7OjJd4c9169oTVNjn7L4B4TmD4Bk0IbB/F11wKXEeysU+1fY
 Pva5hCPD+fl2XQ4dXu49LLSTEXRYXZn3qk0cQa2+YQNKixBOJ7803Kj3FjWKdE5KiW+4
 aWocuvCNh1NoGyY8pGaMYSQoAHsFDXrD8pcDfIwHjU5N4IKENHysGnYIBlYA0NnuxXyU
 p5VXnBwh9AOHbl2TkGvr5LVfmsT0Ee0O+kzBNOQo4ZSxwOG1iUALzlqOuWlpQ5l/6XU3
 u1/A==
X-Gm-Message-State: ANoB5pll8NLH2FcHWNEam9qNfMnNtBLuHQtlotXY65e8T29smqPIgkG5
 vcloE5SzG87BdEO4yq0n74Zfd/sa3Lt/YXhRuCM=
X-Google-Smtp-Source: AA0mqf7S3PbrPUlXJxfzupuqt6GuE4oBPr+brvtuDYH2GnwOjAF2mPvmgdTXfPUS+QDTRotkhP2siA==
X-Received: by 2002:a05:6402:3895:b0:468:354a:4d6 with SMTP id
 fd21-20020a056402389500b00468354a04d6mr20912433edb.20.1671484256379; 
 Mon, 19 Dec 2022 13:10:56 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a056402500600b0046ac017b007sm4769122eda.18.2022.12.19.13.10.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Dec 2022 13:10:55 -0800 (PST)
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
Subject: [PATCH 3/4] target/mips: Restrict 'qapi-commands-machine.h' to system
 emulation
Date: Mon, 19 Dec 2022 22:10:33 +0100
Message-Id: <20221219211034.70491-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219211034.70491-1-philmd@linaro.org>
References: <20221219211034.70491-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x533.google.com
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
the new 'sysemu/monitor.c' unit (which is only compiled when system
emulation is selected).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


