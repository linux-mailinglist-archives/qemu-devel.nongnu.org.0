Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2BA320E45
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 23:28:53 +0100 (CET)
Received: from localhost ([::1]:34682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDxDf-0007sy-OV
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 17:28:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDxBN-0006Kd-I6; Sun, 21 Feb 2021 17:26:31 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:36679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDxBK-0004K2-JA; Sun, 21 Feb 2021 17:26:27 -0500
Received: by mail-wm1-x335.google.com with SMTP id a207so12708763wmd.1;
 Sun, 21 Feb 2021 14:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wqm+61I+iUlDlEUVidXloBrgjcCcgJbWQO+9DBAAkf4=;
 b=RAIjvf6wj+GQMkzFFydJunuuKoF1dUACoCW0rsZ2oiknkKsAmavP66SHxIHHmddtUN
 HtIcA45ZH9tNX4EwVIgypQeT/ysHExVB0pli3izJ/SwU2/NPLp+YDwg5G7Ah5FGTI7e1
 biqHdvNnzzOTUoqusvZANBRmzVolA/XKcz8Ur3u0kovyKrKK57mQ2TJvm6GZUJlcU49f
 3QDBznyHim5sJeheg5C0ptatUTLOwNYQJqVfZOT8FdV+fnhfTHrjPcI+nptETstjmKNZ
 EMhODDPmbuBLvIDwqc8raEkdk8kNwXLhBnl+An8KY6KG+9zeZLKFYfy4kp2UH1M0jsJk
 5MKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wqm+61I+iUlDlEUVidXloBrgjcCcgJbWQO+9DBAAkf4=;
 b=CwmK0HqaY3dGvv25QR3aGJTLGvda8rIwN/5Wg4Fm9jvdU7YRdtUQC8rN4sYieLhGM+
 9ksjIsDSj7UXaD59fx7ZqY0+TuiVoOcEr4yN5IpQh9v0O472z/3qsVeUBfTRP5Z8zLYl
 zKePqHCfeQVD4huZ8gz4l4QO6B9zkQnQ+9MK63AA3i0P+ueODcDfA4T69wnS2MdIGVBl
 HLmCIXRrObzYEoa3GKVX/EQyQIRa5PaNYuCVaqT2ueIispUd+hbvG+FjbSqypGCXDegS
 Jx/eaWbi02A0H/R0Dwqrq4n1Al9Q+WNBf108NsWLza0sMF2zqYYkoxk6UFdcpIk4d1GC
 QZ4Q==
X-Gm-Message-State: AOAM533rmKbpxcvHgp2l6SJyQ5FhKKi6bfxUpjeA+NzSi7OF4hGcMVrS
 gtJTKHG0QHyO6CQfZ1kPdLmnuzffYOI=
X-Google-Smtp-Source: ABdhPJx8ABak7m6CJYMGXiqTDglaJuJsY6W/huvmHyDqakXDQy8CQA80xfe8hYZAOTEopynQRfVYKA==
X-Received: by 2002:a1c:7204:: with SMTP id n4mr471586wmc.87.1613946384636;
 Sun, 21 Feb 2021 14:26:24 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id w11sm3812320wru.3.2021.02.21.14.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 14:26:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] target/arm: Restrict v8M IDAU to TCG
Date: Sun, 21 Feb 2021 23:26:15 +0100
Message-Id: <20210221222617.2579610-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221222617.2579610-1-f4bug@amsat.org>
References: <20210221222617.2579610-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

IDAU is specific to M-profile. KVM only supports A-profile.
Restrict this interface to TCG, as it is pointless (and
confusing) on a KVM-only build.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/cpu.c     | 7 -------
 target/arm/cpu_tcg.c | 8 ++++++++
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b8bc89e71fc..a772fd4926f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2380,12 +2380,6 @@ static const TypeInfo arm_cpu_type_info = {
     .class_init = arm_cpu_class_init,
 };
 
-static const TypeInfo idau_interface_type_info = {
-    .name = TYPE_IDAU_INTERFACE,
-    .parent = TYPE_INTERFACE,
-    .class_size = sizeof(IDAUInterfaceClass),
-};
-
 static void arm_cpu_register_types(void)
 {
     const size_t cpu_count = ARRAY_SIZE(arm_cpus);
@@ -2399,7 +2393,6 @@ static void arm_cpu_register_types(void)
     if (cpu_count) {
         size_t i;
 
-        type_register_static(&idau_interface_type_info);
         for (i = 0; i < cpu_count; ++i) {
             arm_cpu_register(&arm_cpus[i]);
         }
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index c29b434c60d..fb07a336939 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -14,6 +14,7 @@
 #include "hw/core/tcg-cpu-ops.h"
 #endif /* CONFIG_TCG */
 #include "internals.h"
+#include "target/arm/idau.h"
 
 /* CPU models. These are not needed for the AArch64 linux-user build. */
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
@@ -739,10 +740,17 @@ static const ARMCPUInfo arm_tcg_cpus[] = {
     { .name = "pxa270-c5",   .initfn = pxa270c5_initfn },
 };
 
+static const TypeInfo idau_interface_type_info = {
+    .name = TYPE_IDAU_INTERFACE,
+    .parent = TYPE_INTERFACE,
+    .class_size = sizeof(IDAUInterfaceClass),
+};
+
 static void arm_tcg_cpu_register_types(void)
 {
     size_t i;
 
+    type_register_static(&idau_interface_type_info);
     for (i = 0; i < ARRAY_SIZE(arm_tcg_cpus); ++i) {
         arm_cpu_register(&arm_tcg_cpus[i]);
     }
-- 
2.26.2


