Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 473A3430D41
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 03:08:31 +0200 (CEST)
Received: from localhost ([::1]:47914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcH8g-0006Tl-Bc
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 21:08:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mcH2K-0006S9-Sr; Sun, 17 Oct 2021 21:01:56 -0400
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929]:38554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mcH2G-0000GP-Fq; Sun, 17 Oct 2021 21:01:55 -0400
Received: by mail-ua1-x929.google.com with SMTP id h19so3759559uax.5;
 Sun, 17 Oct 2021 18:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VLeaPtsf9SonR74eEhtsqiftN2+G2XqsE+fpRDQJqMo=;
 b=Ni3ErA0l2HO90bzXzR4ngqFT5KzGxJV6KAmHZADWxx9JfRdrnAei6f1GJFNiTkKew9
 eYhJ2G5XvVnIJrtBC9D1NOJJ3rX7an1/nUTf4n7sFURc6VSon2inmPP/iLzWU5rpM6Vg
 X2/8PHsYlfPH89jyTQrEWeaG2EV1f+HILPyuWQJYVXtkYW8PGZG2t4L9tBEzLg2L7cmb
 1LmLN52hfuECeMEyWqWHBpO0jXh8Jb8ZFurNmDsKOLOpIIY0WTdQBPJLfbOnf21l3SKz
 6/PJgfh3LZWautCd0s/Nk1sHc6R/gb8hS4kFvs+P+U4E7UHAqq+qJk08bXn71BK+HjOp
 Hd6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VLeaPtsf9SonR74eEhtsqiftN2+G2XqsE+fpRDQJqMo=;
 b=GuNZVk0c4wOR4uE7AS4/36lad7qQEh25ip69dtI4Rkxis05SrFdDsKQuxdizABDb4G
 hNUoqmuF03DlC0+LCRh7OGFvilll46bxuf5z9cLJXJn+nlgiYEbLtSx074KTxhWQsp+a
 87q/51nur3fVHGtZDFBTMQcQB+w2IBU9ojMMMRqpoOAWjYboEPB+897k/I5Y17Mv/EYT
 /ZzEB4QLVj9WyF1gFRgSYUopSh4Ky5OZUdzIyfOdue4y6wBOYnPATiOnG1rMqKJ5mj27
 8T9XnEg4JEbuccKwYxDBDEwaR03tJRLd3coOCz5jfYe5U4+uKE9yuEZdoJF060PNZA8z
 uuHg==
X-Gm-Message-State: AOAM531MDg5koi5ivzwyZdPYKhvhmEtYqH1pSKG/kWVNM7J4pKVJW93k
 SSd/zjImo6k+g4YXUNqgPsbZ0VT9JFk=
X-Google-Smtp-Source: ABdhPJxh1HSux2116KFDQ5oTLyELawD9WDmpq8YV7S7fMsDFBpZzuEkwKthOyakNg97rrrVBsCRoEQ==
X-Received: by 2002:a67:d393:: with SMTP id b19mr24642416vsj.33.1634518909300; 
 Sun, 17 Oct 2021 18:01:49 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.137.170])
 by smtp.gmail.com with ESMTPSA id m15sm8271607vsh.31.2021.10.17.18.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 18:01:49 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/15] target/ppc: add user read/write functions for MMCR0
Date: Sun, 17 Oct 2021 22:01:20 -0300
Message-Id: <20211018010133.315842-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211018010133.315842-1-danielhb413@gmail.com>
References: <20211018010133.315842-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x929.google.com
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
Cc: Gustavo Romero <gustavo.romero@linaro.org>,
 Gustavo Romero <gromero@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, richard.henderson@linaro.org,
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gustavo Romero <gromero@linux.ibm.com>

Userspace need access to PMU SPRs to be able to operate the PMU. One of
such SPRs is MMCR0.

MMCR0, as defined by PowerISA v3.1, is classified as a 'group A' PMU
register. This class of registers has common read/write rules that are
governed by MMCR0 PMCC bits. MMCR0 is also not fully exposed to problem
state: only MMCR0_FC, MMCR0_PMAO and MMCR0_PMAE bits are
readable/writable in this case.

This patch exposes MMCR0 to userspace by doing the following:

- two new callbacks, spr_read_MMCR0_ureg() and spr_write_MMCR0_ureg(),
are added to be used as problem state read/write callbacks of UMMCR0.
Both callbacks filters the amount of bits userspace is able to
read/write by using a MMCR0_UREG_MASK;

- problem state access control is done by the spr_groupA_read_allowed()
and spr_groupA_write_allowed() helpers. These helpers will read the
current PMCC bits from DisasContext and check whether the read/write
MMCR0 operation is valid or noti;

- to avoid putting exclusive PMU logic into the already loaded
translate.c file, let's create a new 'power8-pmu-regs.c.inc' file that
will hold all the spr_read/spr_write functions of PMU registers.

The 'power8' name of this new file intends to hint about the proven
support of the PMU logic to be added. The code has been tested with the
IBM POWER chip family, POWER8 being the oldest version tested. This
doesn't mean that the PMU logic will break with any other PPC64 chip
that implements Book3s, but rather that we can't assert that it works
properly with any Book3s compliant chip.

CC: Gustavo Romero <gustavo.romero@linaro.org>
Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h                 |   7 ++
 target/ppc/cpu_init.c            |   2 +-
 target/ppc/power8-pmu-regs.c.inc | 116 +++++++++++++++++++++++++++++++
 target/ppc/spr_tcg.h             |   2 +
 target/ppc/translate.c           |   2 +
 5 files changed, 128 insertions(+), 1 deletion(-)
 create mode 100644 target/ppc/power8-pmu-regs.c.inc

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 0df1a5a970..7f80c0bb19 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -343,8 +343,15 @@ typedef struct ppc_v3_pate_t {
 #define MSR_LE   0  /* Little-endian mode                           1 hflags */
 
 /* PMU bits */
+#define MMCR0_FC     PPC_BIT(32)         /* Freeze Counters  */
+#define MMCR0_PMAO   PPC_BIT(56)         /* Perf Monitor Alert Ocurred */
+#define MMCR0_PMAE   PPC_BIT(37)         /* Perf Monitor Alert Enable */
+#define MMCR0_EBE    PPC_BIT(43)         /* Perf Monitor EBB Enable */
+#define MMCR0_FCECE  PPC_BIT(38)         /* FC on Enabled Cond or Event */
 #define MMCR0_PMCC0  PPC_BIT(44)         /* PMC Control bit 0 */
 #define MMCR0_PMCC1  PPC_BIT(45)         /* PMC Control bit 1 */
+/* MMCR0 userspace r/w mask */
+#define MMCR0_UREG_MASK (MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE)
 
 /* LPCR bits */
 #define LPCR_VPM0         PPC_BIT(0)
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 6aad01d1d3..375bdca1e1 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6867,7 +6867,7 @@ static void register_book3s_pmu_sup_sprs(CPUPPCState *env)
 static void register_book3s_pmu_user_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_POWER_UMMCR0, "UMMCR0",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_MMCR0_ureg, &spr_write_MMCR0_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UMMCR1, "UMMCR1",
diff --git a/target/ppc/power8-pmu-regs.c.inc b/target/ppc/power8-pmu-regs.c.inc
new file mode 100644
index 0000000000..37c812dd4d
--- /dev/null
+++ b/target/ppc/power8-pmu-regs.c.inc
@@ -0,0 +1,116 @@
+/*
+ * PMU register read/write functions for TCG IBM POWER chips
+ *
+ * Copyright IBM Corp. 2021
+ *
+ * Authors:
+ *  Daniel Henrique Barboza      <danielhb413@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
+
+/*
+ * Checks whether the Group A SPR (MMCR0, MMCR2, MMCRA, and the
+ * PMCs) has problem state read access.
+ *
+ * Read acccess is granted for all PMCC values but 0b01, where a
+ * Facility Unavailable Interrupt will occur.
+ */
+static bool spr_groupA_read_allowed(DisasContext *ctx)
+{
+    if (!ctx->mmcr0_pmcc0 && ctx->mmcr0_pmcc1) {
+        gen_hvpriv_exception(ctx, POWERPC_EXCP_FU);
+        return false;
+    }
+
+    return true;
+}
+
+/*
+ * Checks whether the Group A SPR (MMCR0, MMCR2, MMCRA, and the
+ * PMCs) has problem state write access.
+ *
+ * Write acccess is granted for PMCC values 0b10 and 0b11. Userspace
+ * writing with PMCC 0b00 will generate a Hypervisor Emulation
+ * Assistance Interrupt. Userspace writing with PMCC 0b01 will
+ * generate a Facility Unavailable Interrupt.
+ */
+static bool spr_groupA_write_allowed(DisasContext *ctx)
+{
+    if (ctx->mmcr0_pmcc0) {
+        return true;
+    }
+
+    if (ctx->mmcr0_pmcc1) {
+        /* PMCC = 0b01 */
+        gen_hvpriv_exception(ctx, POWERPC_EXCP_FU);
+    } else {
+        /* PMCC = 0b00 */
+        gen_hvpriv_exception(ctx, POWERPC_EXCP_INVAL_SPR);
+    }
+
+    return false;
+}
+
+void spr_read_MMCR0_ureg(DisasContext *ctx, int gprn, int sprn)
+{
+    TCGv t0;
+
+    if (!spr_groupA_read_allowed(ctx)) {
+        return;
+    }
+
+    t0 = tcg_temp_new();
+
+    /*
+     * Filter out all bits but FC, PMAO, and PMAE, according
+     * to ISA v3.1, in 10.4.4 Monitor Mode Control Register 0,
+     * fourth paragraph.
+     */
+    gen_load_spr(t0, SPR_POWER_MMCR0);
+    tcg_gen_andi_tl(t0, t0, MMCR0_UREG_MASK);
+    tcg_gen_mov_tl(cpu_gpr[gprn], t0);
+
+    tcg_temp_free(t0);
+}
+
+void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv t0, t1;
+
+    if (!spr_groupA_write_allowed(ctx)) {
+        return;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+
+    /*
+     * Filter out all bits but FC, PMAO, and PMAE, according
+     * to ISA v3.1, in 10.4.4 Monitor Mode Control Register 0,
+     * fourth paragraph.
+     */
+    tcg_gen_andi_tl(t0, cpu_gpr[gprn], MMCR0_UREG_MASK);
+    gen_load_spr(t1, SPR_POWER_MMCR0);
+    tcg_gen_andi_tl(t1, t1, ~(MMCR0_UREG_MASK));
+    /* Keep all other bits intact */
+    tcg_gen_or_tl(t1, t1, t0);
+    gen_store_spr(SPR_POWER_MMCR0, t1);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+}
+#else
+void spr_read_MMCR0_ureg(DisasContext *ctx, int gprn, int sprn)
+{
+    spr_read_ureg(ctx, gprn, sprn);
+}
+
+void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn)
+{
+    spr_noaccess(ctx, gprn, sprn);
+}
+#endif /* defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
index 0be5f347d5..b28b095097 100644
--- a/target/ppc/spr_tcg.h
+++ b/target/ppc/spr_tcg.h
@@ -32,6 +32,7 @@ void spr_write_lr(DisasContext *ctx, int sprn, int gprn);
 void spr_read_ctr(DisasContext *ctx, int gprn, int sprn);
 void spr_write_ctr(DisasContext *ctx, int sprn, int gprn);
 void spr_read_ureg(DisasContext *ctx, int gprn, int sprn);
+void spr_read_MMCR0_ureg(DisasContext *ctx, int gprn, int sprn);
 void spr_read_tbl(DisasContext *ctx, int gprn, int sprn);
 void spr_read_tbu(DisasContext *ctx, int gprn, int sprn);
 void spr_read_atbl(DisasContext *ctx, int gprn, int sprn);
@@ -40,6 +41,7 @@ void spr_read_601_rtcl(DisasContext *ctx, int gprn, int sprn);
 void spr_read_601_rtcu(DisasContext *ctx, int gprn, int sprn);
 void spr_read_spefscr(DisasContext *ctx, int gprn, int sprn);
 void spr_write_spefscr(DisasContext *ctx, int sprn, int gprn);
+void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn);
 
 #ifndef CONFIG_USER_ONLY
 void spr_write_generic32(DisasContext *ctx, int sprn, int gprn);
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 70ae4bda92..96e8703dd1 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7491,6 +7491,8 @@ static int times_4(DisasContext *ctx, int x)
 
 #include "decode-insn32.c.inc"
 #include "decode-insn64.c.inc"
+#include "power8-pmu-regs.c.inc"
+
 #include "translate/fixedpoint-impl.c.inc"
 
 #include "translate/fp-impl.c.inc"
-- 
2.31.1


