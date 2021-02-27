Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA34E326F9A
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 00:29:51 +0100 (CET)
Received: from localhost ([::1]:49014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lG91y-0004dS-UW
	for lists+qemu-devel@lfdr.de; Sat, 27 Feb 2021 18:29:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lG8xj-0001fk-H5
 for qemu-devel@nongnu.org; Sat, 27 Feb 2021 18:25:27 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:41583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lG8xf-00037N-Kd
 for qemu-devel@nongnu.org; Sat, 27 Feb 2021 18:25:27 -0500
Received: by mail-pl1-x62f.google.com with SMTP id d11so7312127plo.8
 for <qemu-devel@nongnu.org>; Sat, 27 Feb 2021 15:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+D2NUcw390W8QaRp4L4LE0gHLhEua6WESpznKzpIu9Y=;
 b=DOr8oEwGYqBfj1/J80DN/U9ESN30zgb4pfEFcEOQrz1/09AqK8N/rq+/ZB4/BYeiww
 0/iCZ9iVBrRAbQRfwluN9XAFO+xGzYsIlAMYfb0HrFqL03mNtt9qwkxkEyrbBcItNenJ
 6mtMBmhzQotSVWL1KU69GFX9ow9m1h5ND3xwqzpGQZfFWSWBvD8yrTBEKbEtYECt85AR
 cR3imjyok7PftJ7HIi7PvvQBihKIY9FgTExjX1oZfTShee1La7f4aGapgPCDYXXfHkI4
 eVN0aZRWq/GEaNXSi4gCMufPzHNrDXnMadHnQy9/TWtspD/aqMNViO8jfT5b+3qGxwym
 qc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+D2NUcw390W8QaRp4L4LE0gHLhEua6WESpznKzpIu9Y=;
 b=o9SnZ5UsSXi42HCD9NZYyZT/sRFDpmYlQLENHDKNV/3w+G0zpF49EsOCE/p2c0VbRK
 FymL+m+Cv3cSgZOqbUB/LDkK2ti887zi03O9VxTU2lxVnt+yxmBjSSp4C3A1n19wjfPF
 NNQmBxKlpapYAwEdxPxhTQziNnXLN4Ds9pe732RMt+5VewblU4fge2AtH1KOe1CmkzBg
 P6fqDUETn1ZdqCxR4b+esunX+7kQga0Meu4tGof/YHwZS7dKwBYnfSTpNHjTNdTKVsKl
 w2Bsj2526mJhw69xDDJYz8CWMtPtp56cP6ZCQKiA1Zb7OT+AXUqiwo/RPwuHBggIckx7
 1kcA==
X-Gm-Message-State: AOAM533v4/vRwvMERURIpg3KxZnYyvMzm7+pYc7K+DU+N2Q/vUpPrayT
 oMWuMd8l8a1rWsNU9UCYGbgTGSJ8Mh7Ogg==
X-Google-Smtp-Source: ABdhPJwe7sGIfhdC7cWmT5vd9DmcQlhSzstG6iaDbJrPiUer1i2XO0aQSrK0UyHsLOJRqzvlyqCo3w==
X-Received: by 2002:a17:90a:cc02:: with SMTP id
 b2mr9591060pju.115.1614468322203; 
 Sat, 27 Feb 2021 15:25:22 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id ha8sm8187516pjb.6.2021.02.27.15.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Feb 2021 15:25:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/core: Constify TCGCPUOps
Date: Sat, 27 Feb 2021 15:25:19 -0800
Message-Id: <20210227232519.222663-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210227232519.222663-1-richard.henderson@linaro.org>
References: <20210227232519.222663-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: f4bug@amsat.org, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We no longer have any runtime modifications to this struct,
so declare them all const.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h           | 2 +-
 target/alpha/cpu.c              | 2 +-
 target/arm/cpu.c                | 2 +-
 target/arm/cpu_tcg.c            | 2 +-
 target/avr/cpu.c                | 2 +-
 target/cris/cpu.c               | 4 ++--
 target/hexagon/cpu.c            | 2 +-
 target/hppa/cpu.c               | 2 +-
 target/i386/tcg/tcg-cpu.c       | 2 +-
 target/lm32/cpu.c               | 2 +-
 target/m68k/cpu.c               | 2 +-
 target/microblaze/cpu.c         | 2 +-
 target/mips/cpu.c               | 2 +-
 target/moxie/cpu.c              | 2 +-
 target/nios2/cpu.c              | 2 +-
 target/openrisc/cpu.c           | 2 +-
 target/riscv/cpu.c              | 2 +-
 target/rx/cpu.c                 | 2 +-
 target/s390x/cpu.c              | 2 +-
 target/sh4/cpu.c                | 2 +-
 target/sparc/cpu.c              | 2 +-
 target/tilegx/cpu.c             | 2 +-
 target/tricore/cpu.c            | 2 +-
 target/unicore32/cpu.c          | 2 +-
 target/xtensa/cpu.c             | 2 +-
 target/ppc/translate_init.c.inc | 2 +-
 26 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index c005d3dc2d..e3648338df 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -191,7 +191,7 @@ struct CPUClass {
     struct AccelCPUClass *accel_cpu;
 
     /* when TCG is not available, this pointer is NULL */
-    struct TCGCPUOps *tcg_ops;
+    const struct TCGCPUOps *tcg_ops;
 };
 
 /*
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 27192b62e2..e50ae7bef0 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -208,7 +208,7 @@ static void alpha_cpu_initfn(Object *obj)
 
 #include "hw/core/tcg-cpu-ops.h"
 
-static struct TCGCPUOps alpha_tcg_ops = {
+static const struct TCGCPUOps alpha_tcg_ops = {
     .initialize = alpha_translate_init,
     .cpu_exec_interrupt = alpha_cpu_exec_interrupt,
     .tlb_fill = alpha_cpu_tlb_fill,
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b8bc89e71f..5e018b2a73 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2261,7 +2261,7 @@ static gchar *arm_gdb_arch_name(CPUState *cs)
 }
 
 #ifdef CONFIG_TCG
-static struct TCGCPUOps arm_tcg_ops = {
+static const struct TCGCPUOps arm_tcg_ops = {
     .initialize = arm_translate_init,
     .synchronize_from_tb = arm_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = arm_cpu_exec_interrupt,
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index c29b434c60..4fc02d06b6 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -664,7 +664,7 @@ static void pxa270c5_initfn(Object *obj)
 }
 
 #ifdef CONFIG_TCG
-static struct TCGCPUOps arm_v7m_tcg_ops = {
+static const struct TCGCPUOps arm_v7m_tcg_ops = {
     .initialize = arm_translate_init,
     .synchronize_from_tb = arm_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt,
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 0f4596932b..7d0ab606ae 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -186,7 +186,7 @@ static void avr_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 
 #include "hw/core/tcg-cpu-ops.h"
 
-static struct TCGCPUOps avr_tcg_ops = {
+static const struct TCGCPUOps avr_tcg_ops = {
     .initialize = avr_cpu_tcg_init,
     .synchronize_from_tb = avr_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = avr_cpu_exec_interrupt,
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index ed983380fc..4586302ba3 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -195,7 +195,7 @@ static void cris_cpu_initfn(Object *obj)
 
 #include "hw/core/tcg-cpu-ops.h"
 
-static struct TCGCPUOps crisv10_tcg_ops = {
+static const struct TCGCPUOps crisv10_tcg_ops = {
     .initialize = cris_initialize_crisv10_tcg,
     .cpu_exec_interrupt = cris_cpu_exec_interrupt,
     .tlb_fill = cris_cpu_tlb_fill,
@@ -205,7 +205,7 @@ static struct TCGCPUOps crisv10_tcg_ops = {
 #endif /* !CONFIG_USER_ONLY */
 };
 
-static struct TCGCPUOps crisv32_tcg_ops = {
+static const struct TCGCPUOps crisv32_tcg_ops = {
     .initialize = cris_initialize_tcg,
     .cpu_exec_interrupt = cris_cpu_exec_interrupt,
     .tlb_fill = cris_cpu_tlb_fill,
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index b0b3040dd1..a13a941ed5 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -266,7 +266,7 @@ static bool hexagon_tlb_fill(CPUState *cs, vaddr address, int size,
 
 #include "hw/core/tcg-cpu-ops.h"
 
-static struct TCGCPUOps hexagon_tcg_ops = {
+static const struct TCGCPUOps hexagon_tcg_ops = {
     .initialize = hexagon_translate_init,
     .synchronize_from_tb = hexagon_cpu_synchronize_from_tb,
     .tlb_fill = hexagon_tlb_fill,
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index d8fad52d1f..5f1822b5fe 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -133,7 +133,7 @@ static ObjectClass *hppa_cpu_class_by_name(const char *cpu_model)
 
 #include "hw/core/tcg-cpu-ops.h"
 
-static struct TCGCPUOps hppa_tcg_ops = {
+static const struct TCGCPUOps hppa_tcg_ops = {
     .initialize = hppa_translate_init,
     .synchronize_from_tb = hppa_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = hppa_cpu_exec_interrupt,
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 1e125d2175..6a35aa664d 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -59,7 +59,7 @@ static void x86_cpu_synchronize_from_tb(CPUState *cs,
 
 #include "hw/core/tcg-cpu-ops.h"
 
-static struct TCGCPUOps x86_tcg_ops = {
+static const struct TCGCPUOps x86_tcg_ops = {
     .initialize = tcg_x86_init,
     .synchronize_from_tb = x86_cpu_synchronize_from_tb,
     .cpu_exec_enter = x86_cpu_exec_enter,
diff --git a/target/lm32/cpu.c b/target/lm32/cpu.c
index c23d72874c..4ad253a50e 100644
--- a/target/lm32/cpu.c
+++ b/target/lm32/cpu.c
@@ -212,7 +212,7 @@ static ObjectClass *lm32_cpu_class_by_name(const char *cpu_model)
 
 #include "hw/core/tcg-cpu-ops.h"
 
-static struct TCGCPUOps lm32_tcg_ops = {
+static const struct TCGCPUOps lm32_tcg_ops = {
     .initialize = lm32_translate_init,
     .cpu_exec_interrupt = lm32_cpu_exec_interrupt,
     .tlb_fill = lm32_cpu_tlb_fill,
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 37d2ed9dc7..9b2f651213 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -504,7 +504,7 @@ static const VMStateDescription vmstate_m68k_cpu = {
 
 #include "hw/core/tcg-cpu-ops.h"
 
-static struct TCGCPUOps m68k_tcg_ops = {
+static const struct TCGCPUOps m68k_tcg_ops = {
     .initialize = m68k_tcg_init,
     .cpu_exec_interrupt = m68k_cpu_exec_interrupt,
     .tlb_fill = m68k_cpu_tlb_fill,
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 433ba20203..4e086ab546 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -354,7 +354,7 @@ static ObjectClass *mb_cpu_class_by_name(const char *cpu_model)
 
 #include "hw/core/tcg-cpu-ops.h"
 
-static struct TCGCPUOps mb_tcg_ops = {
+static const struct TCGCPUOps mb_tcg_ops = {
     .initialize = mb_tcg_init,
     .synchronize_from_tb = mb_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = mb_cpu_exec_interrupt,
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index bf70c77295..81030c5c40 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -686,7 +686,7 @@ static Property mips_cpu_properties[] = {
  * NB: cannot be const, as some elements are changed for specific
  * mips hardware (see hw/mips/jazz.c).
  */
-static struct TCGCPUOps mips_tcg_ops = {
+static const struct TCGCPUOps mips_tcg_ops = {
     .initialize = mips_tcg_init,
     .synchronize_from_tb = mips_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = mips_cpu_exec_interrupt,
diff --git a/target/moxie/cpu.c b/target/moxie/cpu.c
index 83bec34d36..c3de71b82f 100644
--- a/target/moxie/cpu.c
+++ b/target/moxie/cpu.c
@@ -96,7 +96,7 @@ static ObjectClass *moxie_cpu_class_by_name(const char *cpu_model)
 
 #include "hw/core/tcg-cpu-ops.h"
 
-static struct TCGCPUOps moxie_tcg_ops = {
+static const struct TCGCPUOps moxie_tcg_ops = {
     .initialize = moxie_translate_init,
     .tlb_fill = moxie_cpu_tlb_fill,
 
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index e9c9fc3a38..0de93cdd98 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -209,7 +209,7 @@ static Property nios2_properties[] = {
 
 #include "hw/core/tcg-cpu-ops.h"
 
-static struct TCGCPUOps nios2_tcg_ops = {
+static const struct TCGCPUOps nios2_tcg_ops = {
     .initialize = nios2_tcg_init,
     .cpu_exec_interrupt = nios2_cpu_exec_interrupt,
     .tlb_fill = nios2_cpu_tlb_fill,
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 2c64842f46..52aef27723 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -176,7 +176,7 @@ static void openrisc_any_initfn(Object *obj)
 
 #include "hw/core/tcg-cpu-ops.h"
 
-static struct TCGCPUOps openrisc_tcg_ops = {
+static const struct TCGCPUOps openrisc_tcg_ops = {
     .initialize = openrisc_translate_init,
     .cpu_exec_interrupt = openrisc_cpu_exec_interrupt,
     .tlb_fill = openrisc_cpu_tlb_fill,
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 16f1a34238..6f9822bc0a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -582,7 +582,7 @@ static const char *riscv_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
 
 #include "hw/core/tcg-cpu-ops.h"
 
-static struct TCGCPUOps riscv_tcg_ops = {
+static const struct TCGCPUOps riscv_tcg_ops = {
     .initialize = riscv_translate_init,
     .synchronize_from_tb = riscv_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = riscv_cpu_exec_interrupt,
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 7ac6618b26..28d2becc32 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -175,7 +175,7 @@ static void rx_cpu_init(Object *obj)
 
 #include "hw/core/tcg-cpu-ops.h"
 
-static struct TCGCPUOps rx_tcg_ops = {
+static const struct TCGCPUOps rx_tcg_ops = {
     .initialize = rx_translate_init,
     .synchronize_from_tb = rx_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = rx_cpu_exec_interrupt,
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index d35eb39a1b..feaf2a6d08 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -480,7 +480,7 @@ static void s390_cpu_reset_full(DeviceState *dev)
 #ifdef CONFIG_TCG
 #include "hw/core/tcg-cpu-ops.h"
 
-static struct TCGCPUOps s390_tcg_ops = {
+static const struct TCGCPUOps s390_tcg_ops = {
     .initialize = s390x_translate_init,
     .tlb_fill = s390_cpu_tlb_fill,
 
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index ac65c88f1f..9d77f9cfda 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -225,7 +225,7 @@ static const VMStateDescription vmstate_sh_cpu = {
 
 #include "hw/core/tcg-cpu-ops.h"
 
-static struct TCGCPUOps superh_tcg_ops = {
+static const struct TCGCPUOps superh_tcg_ops = {
     .initialize = sh4_translate_init,
     .synchronize_from_tb = superh_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = superh_cpu_exec_interrupt,
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index aece2c7dc8..ccabe189c4 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -851,7 +851,7 @@ static Property sparc_cpu_properties[] = {
 #ifdef CONFIG_TCG
 #include "hw/core/tcg-cpu-ops.h"
 
-static struct TCGCPUOps sparc_tcg_ops = {
+static const struct TCGCPUOps sparc_tcg_ops = {
     .initialize = sparc_tcg_init,
     .synchronize_from_tb = sparc_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = sparc_cpu_exec_interrupt,
diff --git a/target/tilegx/cpu.c b/target/tilegx/cpu.c
index d969c2f133..c7f8a898ca 100644
--- a/target/tilegx/cpu.c
+++ b/target/tilegx/cpu.c
@@ -136,7 +136,7 @@ static bool tilegx_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 
 #include "hw/core/tcg-cpu-ops.h"
 
-static struct TCGCPUOps tilegx_tcg_ops = {
+static const struct TCGCPUOps tilegx_tcg_ops = {
     .initialize = tilegx_tcg_init,
     .cpu_exec_interrupt = tilegx_cpu_exec_interrupt,
     .tlb_fill = tilegx_cpu_tlb_fill,
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 0b1e139bcb..5b500b575b 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -144,7 +144,7 @@ static void tc27x_initfn(Object *obj)
 
 #include "hw/core/tcg-cpu-ops.h"
 
-static struct TCGCPUOps tricore_tcg_ops = {
+static const struct TCGCPUOps tricore_tcg_ops = {
     .initialize = tricore_tcg_init,
     .synchronize_from_tb = tricore_cpu_synchronize_from_tb,
     .tlb_fill = tricore_cpu_tlb_fill,
diff --git a/target/unicore32/cpu.c b/target/unicore32/cpu.c
index 0258884f84..a732b08748 100644
--- a/target/unicore32/cpu.c
+++ b/target/unicore32/cpu.c
@@ -122,7 +122,7 @@ static const VMStateDescription vmstate_uc32_cpu = {
 
 #include "hw/core/tcg-cpu-ops.h"
 
-static struct TCGCPUOps uc32_tcg_ops = {
+static const struct TCGCPUOps uc32_tcg_ops = {
     .initialize = uc32_translate_init,
     .cpu_exec_interrupt = uc32_cpu_exec_interrupt,
     .tlb_fill = uc32_cpu_tlb_fill,
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index e2b2c7a71c..badc3a26aa 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -183,7 +183,7 @@ static const VMStateDescription vmstate_xtensa_cpu = {
 
 #include "hw/core/tcg-cpu-ops.h"
 
-static struct TCGCPUOps xtensa_tcg_ops = {
+static const struct TCGCPUOps xtensa_tcg_ops = {
     .initialize = xtensa_translate_init,
     .cpu_exec_interrupt = xtensa_cpu_exec_interrupt,
     .tlb_fill = xtensa_cpu_tlb_fill,
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index e7324e85cd..80239077e0 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10846,7 +10846,7 @@ static Property ppc_cpu_properties[] = {
 #ifdef CONFIG_TCG
 #include "hw/core/tcg-cpu-ops.h"
 
-static struct TCGCPUOps ppc_tcg_ops = {
+static const struct TCGCPUOps ppc_tcg_ops = {
   .initialize = ppc_translate_init,
   .cpu_exec_interrupt = ppc_cpu_exec_interrupt,
   .tlb_fill = ppc_cpu_tlb_fill,
-- 
2.25.1


