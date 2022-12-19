Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 349C56514AA
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 22:12:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7NPN-0002tC-0p; Mon, 19 Dec 2022 16:10:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7NPL-0002sZ-0Q
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 16:10:47 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7NPJ-0003uQ-EC
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 16:10:46 -0500
Received: by mail-ej1-x634.google.com with SMTP id ud5so24650447ejc.4
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 13:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JEs3SkvAJGEbyxdlsDJ5PBeYdVgPsoeB7mLoefSjUU0=;
 b=jVxdFmHRr7sYE4xUWv6hYW+u+Mgnp8ZK9nIV0/Jtiyxi95mkPPZPO+oraA5zW0EMO9
 iy6cEqaAKs+EuL9p9U9A6nKTu0CJJbgcQNqq3GY++nmroiikBM4MUYd76He43EkFAxHm
 b5yY1urKu9alCUQv5mqCTR/WCIzwcHNnOhDOn20UkM9O1BA8Hy8mVWyM/GW0uQARcz0V
 YC6kekt+8BWZMbGy0pSLL3+bJQtOZF1Pf1BAcNZKT5eoRAWBz5E/EFuHHqzBnLgjpTUa
 LFyq+C/wUIy0ObQFWy5RNQ0G1R8AwZ25oUFHEfQSetlDS4X0f3X/qHOBblAUS6crhHF+
 saSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JEs3SkvAJGEbyxdlsDJ5PBeYdVgPsoeB7mLoefSjUU0=;
 b=jnLLMQBInU8RzmB/fcicvJBka8ATkwSibYANPjGCoahGo2cRS/NvgpK4ycs5WpGPKK
 76QxOR4aEleR5oO6s6Usbg2/ya18WgnOaj5246mRnVkcSOoNUBxu7e1gVqiKDhnV5xIn
 g31ANpeq5lhdImGIIiVYBFgr3kMeFSZJyYvV8p21k2OsKBNdBjeJQIqBi9VhixnSdDz2
 VwJ7gxMnt93SIhr/AJRmGNq0kIRqD+2KzF4asJ9E7Ji5MeAz3YISbrTwm4r7ZvSNRBof
 edCORlvV3jD7FxHvvZf0T9liVodNgZRQKsyV+qtp7DM+dm744znpE87X1QMDnGSi2zUo
 3NTg==
X-Gm-Message-State: ANoB5pktKG0svGUAwJtnpK3XfPHHAjYa/rgikAWoXQkKkHgRsBhdoqvz
 FQBMmIeVU1svOYMWTNzjAhEQKvRayS3a8o/XhVg=
X-Google-Smtp-Source: AA0mqf6Y4rASdquQHYQNpKlFZgrQeWVpseesHdA1qg4y1lrfSodyrOHdGsGeqOB1SmhcWmJ4JcIhlQ==
X-Received: by 2002:a17:907:2a04:b0:7c4:f752:e95c with SMTP id
 fd4-20020a1709072a0400b007c4f752e95cmr17699393ejc.1.1671484243566; 
 Mon, 19 Dec 2022 13:10:43 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r18-20020a17090609d200b007be301a1d51sm4780469eje.211.2022.12.19.13.10.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Dec 2022 13:10:43 -0800 (PST)
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
Subject: [PATCH 1/4] target/arm: Restrict 'qapi-commands-machine.h' to system
 emulation
Date: Mon, 19 Dec 2022 22:10:31 +0100
Message-Id: <20221219211034.70491-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219211034.70491-1-philmd@linaro.org>
References: <20221219211034.70491-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
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

Move the QMP functions from helper.c (which is always compiled) to
monitor.c (which is only compiled when system-emulation is selected).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/helper.c   | 29 -----------------------------
 target/arm/m_helper.c |  1 -
 target/arm/monitor.c  | 28 ++++++++++++++++++++++++++++
 3 files changed, 28 insertions(+), 30 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index bac2ea62c4..399603b680 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -27,7 +27,6 @@
 #include "sysemu/cpu-timers.h"
 #include "sysemu/kvm.h"
 #include "qemu/range.h"
-#include "qapi/qapi-commands-machine-target.h"
 #include "qapi/error.h"
 #include "qemu/guest-random.h"
 #ifdef CONFIG_TCG
@@ -8514,34 +8513,6 @@ void arm_cpu_list(void)
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
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 355cd4d60a..11008528b5 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -26,7 +26,6 @@
 #include "sysemu/cpus.h"
 #include "sysemu/kvm.h"
 #include "qemu/range.h"
-#include "qapi/qapi-commands-machine-target.h"
 #include "qapi/error.h"
 #include "qemu/guest-random.h"
 #ifdef CONFIG_TCG
diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index ecdd5ee817..c8fa524002 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
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
-- 
2.38.1


