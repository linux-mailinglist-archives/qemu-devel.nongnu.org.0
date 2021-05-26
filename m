Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E82B3923A5
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 02:14:40 +0200 (CEST)
Received: from localhost ([::1]:57566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm3fb-0003p3-5T
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 20:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3Fk-00068r-CW
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:56 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:37767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FU-0004eS-PM
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:54 -0400
Received: by mail-pg1-x52e.google.com with SMTP id t193so2301698pgb.4
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 16:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xIGXFqpV1aqYGlAuOTl1TNlxx1ctCRcyu52r3zRaYUw=;
 b=kTl6T+SdPJud0qQIGvYX5A7K2ilIWzwyflJ5+4k487aFy2swQXhQcLBG1EqG+F9n6N
 qbXXragKq9mO3XbCEcNuSSsRqQbrk7oDab8BP3/Mako5CKTZOUGG7mEn62Uvc5cBB80N
 mCKiI9ibmiQdYy526fRBikjzuMX0V97keqgmP8xc13mzq1Zvjyy1RqcTLA4UTni6MAu9
 8q8ASQ2me9jjbtr6eM6T+FO4ELAGbDQrQcfpEqtGsdnG7SDBUAg9ejHPKUYwpI4DluJZ
 TnLGOcacyxsylGbEEPCAIUDq8HleKki4ZG3gmCRrNjtMuQGjpeIUl8ofNpY9zrV4zt03
 82HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xIGXFqpV1aqYGlAuOTl1TNlxx1ctCRcyu52r3zRaYUw=;
 b=DMuxK4xJUslkbAXEPs/NHpGFc1Ns+XWyE23xtoTq/mWQEczmTd/J1lvgBXkaMg6c1G
 Kdx7ZqKMlTJ5GIH0RWU5ypanJnvlo346A8KBdBRoQB5j3YJTPUX4YKWwM2iMuMsdp4a5
 oSkW7E1xkp4lLZ1pkuPFY6UIg0+8J+ztRVvBWzvP968C6S/vq3F9wKPwUKb4ln1Suqgb
 FGrgYRyjG9d4ORoEgOOoeB3Di8VasK2IPrxD+Gw6EWkke0aZSczrW52uKky/1aQKdYlZ
 iSZL2kDzHy3qkwvGqW7gCXMrUgqysuL6MVj9DTwD6RRCutROJSAWQTISCeK4fxmUWpwm
 Nd4w==
X-Gm-Message-State: AOAM530ML2KCqyb6U2MYF/Fa8AyMNSMmtTlJXfLKjuStPMwQ1X8ge8lJ
 kD0fmbdiUNhI/67ycecJeIy6vsA0aizWbg==
X-Google-Smtp-Source: ABdhPJzdZe6Ge2HwXKWun1ku/W2mQBYjsP1A891cE7NKX5xn4AwsvdDJh0reUgBhJuiwh8PejwXuIA==
X-Received: by 2002:a63:3e8c:: with SMTP id l134mr1017816pga.202.1622072857505; 
 Wed, 26 May 2021 16:47:37 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id g13sm285355pfi.18.2021.05.26.16.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 16:47:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/31] hw/core: Constify TCGCPUOps
Date: Wed, 26 May 2021 16:47:10 -0700
Message-Id: <20210526234710.125396-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526234710.125396-1-richard.henderson@linaro.org>
References: <20210526234710.125396-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We no longer have any runtime modifications to this struct,
so declare them all const.

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20210227232519.222663-3-richard.henderson@linaro.org>
---
 include/hw/core/cpu.h     | 2 +-
 target/alpha/cpu.c        | 2 +-
 target/arm/cpu.c          | 2 +-
 target/arm/cpu_tcg.c      | 2 +-
 target/avr/cpu.c          | 2 +-
 target/cris/cpu.c         | 4 ++--
 target/hexagon/cpu.c      | 2 +-
 target/hppa/cpu.c         | 2 +-
 target/i386/tcg/tcg-cpu.c | 2 +-
 target/m68k/cpu.c         | 2 +-
 target/microblaze/cpu.c   | 2 +-
 target/mips/cpu.c         | 2 +-
 target/nios2/cpu.c        | 2 +-
 target/openrisc/cpu.c     | 2 +-
 target/ppc/cpu_init.c     | 2 +-
 target/riscv/cpu.c        | 2 +-
 target/rx/cpu.c           | 2 +-
 target/s390x/cpu.c        | 2 +-
 target/sh4/cpu.c          | 2 +-
 target/sparc/cpu.c        | 2 +-
 target/tricore/cpu.c      | 2 +-
 target/xtensa/cpu.c       | 2 +-
 22 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index e4328de8d4..9f09a60fbd 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -156,7 +156,7 @@ struct CPUClass {
     const struct SysemuCPUOps *sysemu_ops;
 
     /* when TCG is not available, this pointer is NULL */
-    struct TCGCPUOps *tcg_ops;
+    const struct TCGCPUOps *tcg_ops;
 
     /*
      * if not NULL, this is called in order for the CPUClass to initialize
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 7687d5a09a..4871ad0c0a 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -216,7 +216,7 @@ static const struct SysemuCPUOps alpha_sysemu_ops = {
 
 #include "hw/core/tcg-cpu-ops.h"
 
-static struct TCGCPUOps alpha_tcg_ops = {
+static const struct TCGCPUOps alpha_tcg_ops = {
     .initialize = alpha_translate_init,
     .cpu_exec_interrupt = alpha_cpu_exec_interrupt,
     .tlb_fill = alpha_cpu_tlb_fill,
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 2d9b32ec92..ad65b60b04 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1958,7 +1958,7 @@ static const struct SysemuCPUOps arm_sysemu_ops = {
 #endif
 
 #ifdef CONFIG_TCG
-static struct TCGCPUOps arm_tcg_ops = {
+static const struct TCGCPUOps arm_tcg_ops = {
     .initialize = arm_translate_init,
     .synchronize_from_tb = arm_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = arm_cpu_exec_interrupt,
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index d3458335ed..2e0e508f0e 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -898,7 +898,7 @@ static void pxa270c5_initfn(Object *obj)
 }
 
 #ifdef CONFIG_TCG
-static struct TCGCPUOps arm_v7m_tcg_ops = {
+static const struct TCGCPUOps arm_v7m_tcg_ops = {
     .initialize = arm_translate_init,
     .synchronize_from_tb = arm_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt,
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 7551bca3a6..57e3fab4a0 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -192,7 +192,7 @@ static const struct SysemuCPUOps avr_sysemu_ops = {
 
 #include "hw/core/tcg-cpu-ops.h"
 
-static struct TCGCPUOps avr_tcg_ops = {
+static const struct TCGCPUOps avr_tcg_ops = {
     .initialize = avr_cpu_tcg_init,
     .synchronize_from_tb = avr_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = avr_cpu_exec_interrupt,
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index 9cb4f817b4..70932b1f8c 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -203,7 +203,7 @@ static const struct SysemuCPUOps cris_sysemu_ops = {
 
 #include "hw/core/tcg-cpu-ops.h"
 
-static struct TCGCPUOps crisv10_tcg_ops = {
+static const struct TCGCPUOps crisv10_tcg_ops = {
     .initialize = cris_initialize_crisv10_tcg,
     .cpu_exec_interrupt = cris_cpu_exec_interrupt,
     .tlb_fill = cris_cpu_tlb_fill,
@@ -213,7 +213,7 @@ static struct TCGCPUOps crisv10_tcg_ops = {
 #endif /* !CONFIG_USER_ONLY */
 };
 
-static struct TCGCPUOps crisv32_tcg_ops = {
+static const struct TCGCPUOps crisv32_tcg_ops = {
     .initialize = cris_initialize_tcg,
     .cpu_exec_interrupt = cris_cpu_exec_interrupt,
     .tlb_fill = cris_cpu_tlb_fill,
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index ebe60a6e15..3338365c16 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -269,7 +269,7 @@ static bool hexagon_tlb_fill(CPUState *cs, vaddr address, int size,
 
 #include "hw/core/tcg-cpu-ops.h"
 
-static struct TCGCPUOps hexagon_tcg_ops = {
+static const struct TCGCPUOps hexagon_tcg_ops = {
     .initialize = hexagon_translate_init,
     .synchronize_from_tb = hexagon_cpu_synchronize_from_tb,
     .tlb_fill = hexagon_tlb_fill,
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 4018e3ad90..2eace4ee12 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -141,7 +141,7 @@ static const struct SysemuCPUOps hppa_sysemu_ops = {
 
 #include "hw/core/tcg-cpu-ops.h"
 
-static struct TCGCPUOps hppa_tcg_ops = {
+static const struct TCGCPUOps hppa_tcg_ops = {
     .initialize = hppa_translate_init,
     .synchronize_from_tb = hppa_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = hppa_cpu_exec_interrupt,
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index ba39531aa5..014ebea2f6 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -56,7 +56,7 @@ static void x86_cpu_synchronize_from_tb(CPUState *cs,
 
 #include "hw/core/tcg-cpu-ops.h"
 
-static struct TCGCPUOps x86_tcg_ops = {
+static const struct TCGCPUOps x86_tcg_ops = {
     .initialize = tcg_x86_init,
     .synchronize_from_tb = x86_cpu_synchronize_from_tb,
     .cpu_exec_enter = x86_cpu_exec_enter,
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 4238775d5e..72de6e9726 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -513,7 +513,7 @@ static const struct SysemuCPUOps m68k_sysemu_ops = {
 
 #include "hw/core/tcg-cpu-ops.h"
 
-static struct TCGCPUOps m68k_tcg_ops = {
+static const struct TCGCPUOps m68k_tcg_ops = {
     .initialize = m68k_tcg_init,
     .cpu_exec_interrupt = m68k_cpu_exec_interrupt,
     .tlb_fill = m68k_cpu_tlb_fill,
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 8f88f2afb9..72d8f2a0da 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -362,7 +362,7 @@ static const struct SysemuCPUOps mb_sysemu_ops = {
 
 #include "hw/core/tcg-cpu-ops.h"
 
-static struct TCGCPUOps mb_tcg_ops = {
+static const struct TCGCPUOps mb_tcg_ops = {
     .initialize = mb_tcg_init,
     .synchronize_from_tb = mb_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = mb_cpu_exec_interrupt,
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 7275f64eab..96236abc00 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -536,7 +536,7 @@ static const struct SysemuCPUOps mips_sysemu_ops = {
  * NB: cannot be const, as some elements are changed for specific
  * mips hardware (see hw/mips/jazz.c).
  */
-static struct TCGCPUOps mips_tcg_ops = {
+static const struct TCGCPUOps mips_tcg_ops = {
     .initialize = mips_tcg_init,
     .synchronize_from_tb = mips_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = mips_cpu_exec_interrupt,
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index afcd776746..5e37defef8 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -217,7 +217,7 @@ static const struct SysemuCPUOps nios2_sysemu_ops = {
 
 #include "hw/core/tcg-cpu-ops.h"
 
-static struct TCGCPUOps nios2_tcg_ops = {
+static const struct TCGCPUOps nios2_tcg_ops = {
     .initialize = nios2_tcg_init,
     .cpu_exec_interrupt = nios2_cpu_exec_interrupt,
     .tlb_fill = nios2_cpu_tlb_fill,
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index d8e80b81a2..bd34e429ec 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -184,7 +184,7 @@ static const struct SysemuCPUOps openrisc_sysemu_ops = {
 
 #include "hw/core/tcg-cpu-ops.h"
 
-static struct TCGCPUOps openrisc_tcg_ops = {
+static const struct TCGCPUOps openrisc_tcg_ops = {
     .initialize = openrisc_translate_init,
     .cpu_exec_interrupt = openrisc_cpu_exec_interrupt,
     .tlb_fill = openrisc_cpu_tlb_fill,
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 1afa29e338..7bdb443114 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -9278,7 +9278,7 @@ static const struct SysemuCPUOps ppc_sysemu_ops = {
 #ifdef CONFIG_TCG
 #include "hw/core/tcg-cpu-ops.h"
 
-static struct TCGCPUOps ppc_tcg_ops = {
+static const struct TCGCPUOps ppc_tcg_ops = {
   .initialize = ppc_translate_init,
   .cpu_exec_interrupt = ppc_cpu_exec_interrupt,
   .tlb_fill = ppc_cpu_tlb_fill,
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9775d8ca5c..1f1cef1d6a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -609,7 +609,7 @@ static const struct SysemuCPUOps riscv_sysemu_ops = {
 
 #include "hw/core/tcg-cpu-ops.h"
 
-static struct TCGCPUOps riscv_tcg_ops = {
+static const struct TCGCPUOps riscv_tcg_ops = {
     .initialize = riscv_translate_init,
     .synchronize_from_tb = riscv_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = riscv_cpu_exec_interrupt,
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index e575669ad1..96cc96e514 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -183,7 +183,7 @@ static const struct SysemuCPUOps rx_sysemu_ops = {
 
 #include "hw/core/tcg-cpu-ops.h"
 
-static struct TCGCPUOps rx_tcg_ops = {
+static const struct TCGCPUOps rx_tcg_ops = {
     .initialize = rx_translate_init,
     .synchronize_from_tb = rx_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = rx_cpu_exec_interrupt,
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index bd5070c783..890f382a36 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -490,7 +490,7 @@ static const struct SysemuCPUOps s390_sysemu_ops = {
 #ifdef CONFIG_TCG
 #include "hw/core/tcg-cpu-ops.h"
 
-static struct TCGCPUOps s390_tcg_ops = {
+static const struct TCGCPUOps s390_tcg_ops = {
     .initialize = s390x_translate_init,
     .tlb_fill = s390_cpu_tlb_fill,
 
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 1d5a715631..8326922942 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -233,7 +233,7 @@ static const struct SysemuCPUOps sh4_sysemu_ops = {
 
 #include "hw/core/tcg-cpu-ops.h"
 
-static struct TCGCPUOps superh_tcg_ops = {
+static const struct TCGCPUOps superh_tcg_ops = {
     .initialize = sh4_translate_init,
     .synchronize_from_tb = superh_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = superh_cpu_exec_interrupt,
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index ff950fb307..da6b30ec74 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -860,7 +860,7 @@ static const struct SysemuCPUOps sparc_sysemu_ops = {
 #ifdef CONFIG_TCG
 #include "hw/core/tcg-cpu-ops.h"
 
-static struct TCGCPUOps sparc_tcg_ops = {
+static const struct TCGCPUOps sparc_tcg_ops = {
     .initialize = sparc_tcg_init,
     .synchronize_from_tb = sparc_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = sparc_cpu_exec_interrupt,
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index ff17d1cecd..b95682b7f0 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -150,7 +150,7 @@ static const struct SysemuCPUOps tricore_sysemu_ops = {
 
 #include "hw/core/tcg-cpu-ops.h"
 
-static struct TCGCPUOps tricore_tcg_ops = {
+static const struct TCGCPUOps tricore_tcg_ops = {
     .initialize = tricore_tcg_init,
     .synchronize_from_tb = tricore_cpu_synchronize_from_tb,
     .tlb_fill = tricore_cpu_tlb_fill,
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index da4dbecdf1..58ec3a0862 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -190,7 +190,7 @@ static const struct SysemuCPUOps xtensa_sysemu_ops = {
 
 #include "hw/core/tcg-cpu-ops.h"
 
-static struct TCGCPUOps xtensa_tcg_ops = {
+static const struct TCGCPUOps xtensa_tcg_ops = {
     .initialize = xtensa_translate_init,
     .cpu_exec_interrupt = xtensa_cpu_exec_interrupt,
     .tlb_fill = xtensa_cpu_tlb_fill,
-- 
2.25.1


