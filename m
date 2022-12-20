Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D95651F6C
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 12:08:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7aPK-0000ik-45; Tue, 20 Dec 2022 06:03:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7aPG-0000hx-VG
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:03:34 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7aPF-0002HH-1k
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:03:34 -0500
Received: by mail-wr1-x42b.google.com with SMTP id i7so11353792wrv.8
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 03:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MyQMRgrRRtBuBRaMJJ8Zm89RkSug1TwSfRjxwE6LfEk=;
 b=Q0Cut2wmR9oBCCzWT5DAOFNRC8FUk6WgBGMlJZpOPD34TpOoUo3oDx0Xwtm2I6dC+s
 wt51Ptf/FIWQJ8XqLie/exdfPbwkquYWB9tELzDCKeF/a+Q+FwZ0OjGPkIP4UmR+Va4p
 HfAvUsCF18YsJ6aH+jLLk/0BXsZR0xNN7kkz2fXosSaBIeNCcTX2nLTmmmGih5ikAJ15
 Pyo53I8+DJXi45a6Vd82mtowG+5GxRNUsDTaL0+7R1gtOk24t3xdILVT5t5LIXivX6UY
 77agTD4GEFosHtK+twOpJ9O8K9tfONhRh8sNdaiq4J5Pe9J++z62vCYiD0o8RHFdQXfM
 nQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MyQMRgrRRtBuBRaMJJ8Zm89RkSug1TwSfRjxwE6LfEk=;
 b=ShiPrxpgU5c1OVaRn5+UPJzUWiJ95H1jRBFCjT6aP47JCBWhL/1WnusWdN7R2EVGVr
 93sv2f6XUbBwlOWWocp3E1L0pxl9W/iq+6JH9v2jH5fdvuK9BBhlxcT7MdS46jYs+0lb
 QMkwKrYakopJnDRBFq2FV79z81yqtz5gGiH72YjiJ7Hcfo+NcmfINTMxEvJE2bjIfYaA
 ngIU6AfC6no/y61/xtIKvjtNGUxjWfm/NZxo/9I9gVu4BDx0vjwKU7qeRtsEkjn4NNGU
 TNDopZl5PH0tj6cdYTUmHEhQ+p3KNP24B9IFeQXZa5npIEav238ktuxTMZbRqkNV8qKV
 J+bQ==
X-Gm-Message-State: AFqh2ko2hfNT1kryAKKGoyLSXdBixmJpEiDaz/ZrhnJXJKlw6A4rlDSg
 +3iFbjlsF3HAEryoJ5g+jtf2TmuLbC+qE2kt/fU=
X-Google-Smtp-Source: AMrXdXvsIhoUma49cZq7muOIIMm65vp3bYkDTn7Khbi5HueqbqUb9KWooWXeu9H1J83kRJAgqnm0Nw==
X-Received: by 2002:adf:e78d:0:b0:268:2971:465f with SMTP id
 n13-20020adfe78d000000b002682971465fmr679925wrm.50.1671534211968; 
 Tue, 20 Dec 2022 03:03:31 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a5d4606000000b0022cc0a2cbecsm12248203wrq.15.2022.12.20.03.03.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 03:03:31 -0800 (PST)
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
Subject: [PATCH v2 3/5] target/loongarch: Restrict 'qapi-commands-machine.h'
 to system emulation
Date: Tue, 20 Dec 2022 12:03:08 +0100
Message-Id: <20221220110310.8656-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220110310.8656-1-philmd@linaro.org>
References: <20221220110310.8656-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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


