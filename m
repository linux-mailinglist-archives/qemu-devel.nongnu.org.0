Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 896803E4653
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:16:09 +0200 (CEST)
Received: from localhost ([::1]:56956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD58S-0002VQ-Hy
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:16:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mD53i-0002CQ-W4; Mon, 09 Aug 2021 09:11:15 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:36460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mD53g-0001Bp-Tv; Mon, 09 Aug 2021 09:11:14 -0400
Received: by mail-qk1-x72c.google.com with SMTP id e14so18237333qkg.3;
 Mon, 09 Aug 2021 06:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8n0+nLnybu0Kyb51goI45d2LB7MSxSyiR/dty5Qm2Xs=;
 b=k+WDN+NIG7oB4naI/EBY/Dvk8tsVQ2G0GRAOkVYBW3dVykb0MmSwEjmh7DqFxFL8h4
 jHl5r4HcOrliDZlWJVM23yECrigoAv/Z9Liz165Y8NNxnn63L7tgyhIxJnWcpxiao9SO
 2NSNSjA+EA4MifkPMqDm1u4UJGnmNFhNjpW8v7UiTxjAhfIpuY/AkTixsbocfcIaC/xI
 /63hI5WQ34NcaSCeuLcjRLsa09HPZIVrf+iGXNmZSAw8FEeugYIfQSlibjEPeO/BowFX
 WbKblKQUZRawc2XUcpTYU1m05y9xmeNa2HxaWpbpI7wl9QN0A0q3A9ATC8D84gWBoNwb
 Z37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8n0+nLnybu0Kyb51goI45d2LB7MSxSyiR/dty5Qm2Xs=;
 b=kmDfekw6i3evMbI9miJLuN5SdWH30c5fd4pBrkg+FWvNcnpqC5AxLyqAgJ9HewSwMu
 XvQPZbcjYYVMgPn5jz/FNZ2jYtRxwZKXXCK2kW+c6sAnQHo1p2Ja9M1D/Jsq2TG3eGZF
 TQQ30GQXs2q1I1xIBu5FBJxLGnW3plA0c+jc/Wp2chetz/s8Gc1OH3TxfDcSRbq1d7NM
 QRhTvpF1jZM0/rjMKyMeHAiq76fQEaMMZ6KDtrMq0JEUn91cs8ET7iW94hZeIfsGLxe3
 8cMrnS3ZhKX0Qwk6JnV1IS52aZpjWM4M7CLJ7fA3y5JFltqz5tpje0f2UymLXv8iYmCP
 /W8Q==
X-Gm-Message-State: AOAM530S8GW6kHHguTEFjLPsdjTebv36s0/AD9A7xpsi/HNrMjrnBo+X
 OdlCpcuEp18ejxy80TPnEOIqdYd2PxRtOA==
X-Google-Smtp-Source: ABdhPJwq315FhOBTdG4W0slEA/ml8+LTYh3S769DcLgcEFEE5crBh2Ot4yz8dBR66N1o0DgtbLTbpw==
X-Received: by 2002:a37:84c1:: with SMTP id
 g184mr23286629qkd.102.1628514671434; 
 Mon, 09 Aug 2021 06:11:11 -0700 (PDT)
Received: from rekt.ibmuc.com ([191.19.172.190])
 by smtp.gmail.com with ESMTPSA id f3sm6757435qti.65.2021.08.09.06.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 06:11:11 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/19] target/ppc: add exclusive user read function for PMU
 regs
Date: Mon,  9 Aug 2021 10:10:40 -0300
Message-Id: <20210809131057.1694145-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809131057.1694145-1-danielhb413@gmail.com>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: gustavo.romero@linaro.org, Gustavo Romero <gromero@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gustavo Romero <gromero@linux.ibm.com>

User read on PowerPC PMU regs requires extra handling in some
instances. Instead of changing the existing read ureg function
(spr_read_ureg) this patch adds a specific read function for
user PMU SPRs, spr_read_pmu_ureg().

This function does extra handling of UMMCR0 and UMMCR2 and falls
back to the default behavior for the not yet handled regs. Aside
for UMMCR0 and UMMCR2 reads, no functional change is made.

CC: Gustavo Romero <gustavo.romero@linaro.org>
Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h       |  8 ++++++++
 target/ppc/cpu_init.c  | 26 +++++++++++++-------------
 target/ppc/spr_tcg.h   |  1 +
 target/ppc/translate.c | 41 +++++++++++++++++++++++++++++++++++++++--
 4 files changed, 61 insertions(+), 15 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 500205229c..4d96015f81 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -342,6 +342,14 @@ typedef struct ppc_v3_pate_t {
 #define MSR_RI   1  /* Recoverable interrupt                        1        */
 #define MSR_LE   0  /* Little-endian mode                           1 hflags */
 
+/* PMU bits */
+#define MMCR0_FC    PPC_BIT(32)         /* Freeze Counters  */
+#define MMCR0_PMAO  PPC_BIT(56)         /* Perf Monitor Alert Ocurred */
+#define MMCR0_PMAE  PPC_BIT(37)         /* Perf Monitor Alert Enable */
+#define MMCR0_EBE   PPC_BIT(43)         /* Perf Monitor EBB Enable */
+#define MMCR0_FCECE PPC_BIT(38)         /* FC on Enabled Cond or Event */
+#define MMCR0_PMCC  PPC_BITMASK(44, 45) /* PMC Control */
+
 /* LPCR bits */
 #define LPCR_VPM0         PPC_BIT(0)
 #define LPCR_VPM1         PPC_BIT(1)
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 021c1bc750..d30aa0fe1e 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6868,47 +6868,47 @@ static void register_book3s_pmu_sup_sprs(CPUPPCState *env)
 static void register_book3s_pmu_user_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_POWER_UMMCR0, "UMMCR0",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_pmu_ureg, SPR_NOACCESS,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UMMCR1, "UMMCR1",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_pmu_ureg, SPR_NOACCESS,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UMMCRA, "UMMCRA",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_pmu_ureg, SPR_NOACCESS,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC1, "UPMC1",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_pmu_ureg, SPR_NOACCESS,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC2, "UPMC2",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_pmu_ureg, SPR_NOACCESS,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC3, "UPMC3",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_pmu_ureg, SPR_NOACCESS,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC4, "UPMC4",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_pmu_ureg, SPR_NOACCESS,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC5, "UPMC5",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_pmu_ureg, SPR_NOACCESS,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC6, "UPMC6",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_pmu_ureg, SPR_NOACCESS,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_USIAR, "USIAR",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_pmu_ureg, SPR_NOACCESS,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_USDAR, "USDAR",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_pmu_ureg, SPR_NOACCESS,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
 }
@@ -6976,8 +6976,8 @@ static void register_power8_pmu_sup_sprs(CPUPPCState *env)
 static void register_power8_pmu_user_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_POWER_UMMCR2, "UMMCR2",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, &spr_write_ureg,
+                 &spr_read_pmu_ureg, SPR_NOACCESS,
+                 &spr_read_pmu_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_USIER, "USIER",
                  &spr_read_generic, SPR_NOACCESS,
diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
index 2aab5878a0..84ecba220f 100644
--- a/target/ppc/spr_tcg.h
+++ b/target/ppc/spr_tcg.h
@@ -27,6 +27,7 @@ void spr_read_generic(DisasContext *ctx, int gprn, int sprn);
 void spr_write_generic(DisasContext *ctx, int sprn, int gprn);
 void spr_read_pmu_generic(DisasContext *ctx, int gprn, int sprn);
 void spr_write_pmu_generic(DisasContext *ctx, int sprn, int gprn);
+void spr_read_pmu_ureg(DisasContext *ctx, int gprn, int sprn);
 void spr_read_xer(DisasContext *ctx, int gprn, int sprn);
 void spr_write_xer(DisasContext *ctx, int sprn, int gprn);
 void spr_read_lr(DisasContext *ctx, int gprn, int sprn);
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index c8f3878002..d3a4d42ff8 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -522,8 +522,6 @@ void spr_write_ctr(DisasContext *ctx, int sprn, int gprn)
 
 /* User read access to SPR */
 /* USPRx */
-/* UMMCRx */
-/* UPMCx */
 /* USIA */
 /* UDECR */
 void spr_read_ureg(DisasContext *ctx, int gprn, int sprn)
@@ -531,6 +529,45 @@ void spr_read_ureg(DisasContext *ctx, int gprn, int sprn)
     gen_load_spr(cpu_gpr[gprn], sprn + 0x10);
 }
 
+/* User special read access to PMU SPRs */
+void spr_read_pmu_ureg(DisasContext *ctx, int gprn, int sprn)
+{
+    TCGv t0 = tcg_temp_new();
+    int effective_sprn = sprn + 0x10;
+
+    switch (effective_sprn) {
+    case SPR_POWER_MMCR0:
+        /*
+         * Filter out all bits but FC, PMAO, and PMAE, according
+         * to ISA v3.1, in 10.4.4 Monitor Mode Control Register 0,
+         * fourth paragraph.
+         */
+        gen_load_spr(t0, effective_sprn);
+        tcg_gen_andi_tl(t0, t0, MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE);
+        tcg_gen_mov_tl(cpu_gpr[gprn], t0);
+        break;
+    case SPR_POWER_MMCR2:
+        /*
+         * On read, filter out all bits that are not FCnP0 bits.
+         * When MMCR0[PMCC] is set to 0b10 or 0b11, providing
+         * problem state programs read/write access to MMCR2,
+         * only the FCnP0 bits can be accessed. All other bits are
+         * not changed when mtspr is executed in problem state, and
+         * all other bits return 0s when mfspr is executed in problem
+         * state, according to ISA v3.1, section 10.4.6 Monitor Mode
+         * Control Register 2, p. 1316, third paragraph.
+         */
+        gen_load_spr(t0, effective_sprn);
+        tcg_gen_andi_tl(t0, t0, 0x4020100804020000UL);
+        tcg_gen_mov_tl(cpu_gpr[gprn], t0);
+        break;
+    default:
+        gen_load_spr(cpu_gpr[gprn], effective_sprn);
+    }
+
+    tcg_temp_free(t0);
+}
+
 #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
 void spr_write_ureg(DisasContext *ctx, int sprn, int gprn)
 {
-- 
2.31.1


