Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C875693E9
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 23:09:35 +0200 (CEST)
Received: from localhost ([::1]:52048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9CH8-0001Tg-6k
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 17:09:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BMP-0000jL-Qe; Wed, 06 Jul 2022 16:11:01 -0400
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33]:46963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BMO-0003jL-62; Wed, 06 Jul 2022 16:10:57 -0400
Received: by mail-vs1-xe33.google.com with SMTP id 126so16195348vsq.13;
 Wed, 06 Jul 2022 13:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F7skUdLM3nYIUL9ViyNBwEsmbt8UvAw4fPBEIdIUczY=;
 b=EU8NnAbTQ9Z8NxY/t22ZoOnt8RvUq2wW35wNGL4eesEXqZtQWlVBl+eSd336dtMUnL
 OGa4sKLctPIjkSGyZ5XICAUGBCIk7PpSqTPiez7FqHyxwtiPOa0Cu6SteIlOJjTBG5xt
 J3kS6gB0+xszRQu+ixZwCpFUv5fa/dLORwbIPLejz9sVcWbK/uWHU3nZI7mzgeabdRxS
 b+pgTP2Viuw0FCG6urgMBHsBhjzen1UZ++VpC2vESTMPMFl98y36+r0o0YFL7vMnX4Ga
 xr7O+gH/3sk7hFSRV4ZtzJydF7U1W3kPCm4mPr0NCp55ARN8jGnjMnVI69o2BraodZ54
 TveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F7skUdLM3nYIUL9ViyNBwEsmbt8UvAw4fPBEIdIUczY=;
 b=mn650qkyn+aiGgdQxuToNMFiS1FiZPGaPnJZFKwgnLWACvUnJpaBhg9vsutYrgPRyK
 B7RbDJvC4lu9KZhUEI472KyMVmU8ANr7lkNJ5Bfjga5fGBmXB3nlDVvSIAHpgF+aznSM
 w+nEsXwumUYUk/dBOq68Wu5TG7KGLaWqlIh/HdKYnKopbKx/GnQFSX54Qn3NeTHMVPud
 1AH0GAr4FwDSPS8A7MVzU5bSejovK5TZ4U62df3R+Cg73/ryVLLxCku8Itzdy4hfBmWb
 CP8dtnAzb7rZsV1rKk+W/9gG2+w5U1N9RxhSfLnKeHCVBcUqBdKlF4LBA/fT9ead3Vdb
 SMxw==
X-Gm-Message-State: AJIora9iseP+8UWdwF6E2JG2QOgPaodxamGBXvYoZxsHkiEyu5ght9UB
 fvj4nVH4Y6WM1cCLYNhdicowtxeaq68=
X-Google-Smtp-Source: AGRyM1sbOLPvUrSI44PeEqp4h/NAvcsHi8KpeG88wpuamLqiGsOEhtLo4hbsHDVKOfNUTRCc0qEzzg==
X-Received: by 2002:a05:6102:159f:b0:357:147b:bb55 with SMTP id
 g31-20020a056102159f00b00357147bbb55mr2865865vsv.34.1657138254747; 
 Wed, 06 Jul 2022 13:10:54 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 r22-20020a056122015600b003744975035asm788662vko.19.2022.07.06.13.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 13:10:54 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Greg Kurz <groug@kaod.org>,
 "Matheus K . Ferst" <matheus.ferst@eldorado.org.br>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
Subject: [PULL 32/34] target/ppc: Return default CPU for max CPU
Date: Wed,  6 Jul 2022 17:09:44 -0300
Message-Id: <20220706200946.471114-33-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706200946.471114-1-danielhb413@gmail.com>
References: <20220706200946.471114-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>

All ppc CPUs represent hardware that exists in the real world, i.e.: we
do not have a "max" CPU with all possible emulated features enabled.
Return the default CPU type for the machine because that has greater
chance of being useful as the "max" CPU.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1038
Cc: Cédric Le Goater <clg@kaod.org>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Greg Kurz <groug@kaod.org>
Cc: Matheus K. Ferst <matheus.ferst@eldorado.org.br>
Cc: Thomas Huth <thuth@redhat.com>
Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Message-Id: <20220628205513.81917-1-muriloo@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu-models.c |  1 -
 target/ppc/cpu_init.c   | 19 +++++++++++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/target/ppc/cpu-models.c b/target/ppc/cpu-models.c
index 976be5e0d1..05589eb21d 100644
--- a/target/ppc/cpu-models.c
+++ b/target/ppc/cpu-models.c
@@ -879,7 +879,6 @@ PowerPCCPUAlias ppc_cpu_aliases[] = {
     { "755", "755_v2.8" },
     { "goldfinger", "755_v2.8" },
     { "7400", "7400_v2.9" },
-    { "max", "7400_v2.9" },
     { "g4",  "7400_v2.9" },
     { "7410", "7410_v1.4" },
     { "nitro", "7410_v1.4" },
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index bdfb1a5c6f..86ad28466a 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -47,6 +47,10 @@
 #include "spr_common.h"
 #include "power8-pmu.h"
 
+#ifndef CONFIG_USER_ONLY
+#include "hw/boards.h"
+#endif
+
 /* #define PPC_DEBUG_SPR */
 /* #define USE_APPLE_GDB */
 
@@ -6965,6 +6969,21 @@ static ObjectClass *ppc_cpu_class_by_name(const char *name)
         }
     }
 
+    /*
+     * All ppc CPUs represent hardware that exists in the real world, i.e.: we
+     * do not have a "max" CPU with all possible emulated features enabled.
+     * Return the default CPU type for the machine because that has greater
+     * chance of being useful as the "max" CPU.
+     */
+#if !defined(CONFIG_USER_ONLY)
+    if (strcmp(name, "max") == 0) {
+        MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
+        if (mc) {
+            return object_class_by_name(mc->default_cpu_type);
+        }
+    }
+#endif
+
     cpu_model = g_ascii_strdown(name, -1);
     p = ppc_cpu_lookup_alias(cpu_model);
     if (p) {
-- 
2.36.1


