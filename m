Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFF0544729
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 11:17:47 +0200 (CEST)
Received: from localhost ([::1]:57530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzEIU-0005Yh-Jx
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 05:17:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE6t-0001OM-Kr
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:05:48 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:38492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE6q-0005vV-JI
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:05:47 -0400
Received: by mail-wr1-x430.google.com with SMTP id v14so5217169wra.5
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=tSthpF0IBNTJTlo30iWopYy1wniqooBbIAyfiEVSRlg=;
 b=GOPr49eK9pq2k3gRjzuhfdVvDUrv10wE9LDEaYYk3C2Fz9a6ACIxfQLOLak4hv8P1M
 UBy+o6NwOXdG9U5FmGtt98QNsiICeDKCmxUshS2k7p1SbsQQJJqbytlkaVbIrEwNkocu
 UyMMHYpeHgduPlX9pSUMqSLaTO3htVxXEwIIOV8hhVNDhGljlbYq9jpeA9/bEmjw8DJP
 77V8groWW5y1xzudbZfQU2Z4mYCaIjmjzK1MnaJvhmeIrXElGCacIv4RFXOKTQ9vB7XR
 Ia8g/YEbtgosWlYKVQLRxfB858kKf4oUtjzaC5UnGj4n7DSR32lPyqPYFrSCda3qhv4Y
 gM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tSthpF0IBNTJTlo30iWopYy1wniqooBbIAyfiEVSRlg=;
 b=Vpy8ZA65fCG+dSCPJHuWD0qe0zr9iP/RQhKqDNuiDHd8sqwHbNpc9hNl8l/wGWqmgv
 nrIN5swu4qMBYejF+a5r2/ybcOC5xcPUOHweToebLXBCPNAuVNl7ggEGTfYHR6FjgBUh
 oS4RdAR4U8I+HlnQpIjxpu2dwB5LlWYnm7phMgHMHMhX8olyyrvcu4UUQxG1jvIbfwb6
 Be8onCbhjSlzyqZAc+aGXfC2BTl0TM+8PNQ0lekfaGcTJeqVPecZhGF01tNv/p5AGplJ
 yJxiU9SbEz1+5q23/NrMRIc/K2ewVwx3AKRv1sj2183kPVgLCY0NzmczqaAa4gRoWzkK
 EyFw==
X-Gm-Message-State: AOAM533qmS911VKetpDQzMMZaK9b1FhnJ/3vklxUMgDp2TXKHDr5/N2e
 zP35aGm6jqAOAzvP8A0xFrZ/OvapGEJfNw==
X-Google-Smtp-Source: ABdhPJwqju/fOhXt3dwbPsKwxylepNM5xE92NWU0dE7prWtjRaItKVivWtAPgAaBbxEniPINlG5R6w==
X-Received: by 2002:a5d:67c2:0:b0:215:7a0f:71f9 with SMTP id
 n2-20020a5d67c2000000b002157a0f71f9mr30971485wrw.486.1654765542593; 
 Thu, 09 Jun 2022 02:05:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.05.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:05:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/55] target/arm: Implement FEAT_DoubleFault
Date: Thu,  9 Jun 2022 10:04:44 +0100
Message-Id: <20220609090537.1971756-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

The FEAT_DoubleFault extension adds the following:

 * All external aborts on instruction fetches and translation table
   walks for instruction fetches must be synchronous.  For QEMU this
   is already true.

 * SCR_EL3 has a new bit NMEA which disables the masking of SError
   interrupts by PSTATE.A when the SError interrupt is taken to EL3.
   For QEMU we only need to make the bit writable, because we have no
   sources of SError interrupts.

 * SCR_EL3 has a new bit EASE which causes synchronous external
   aborts taken to EL3 to be taken at the same entry point as SError.
   (Note that this does not mean that they are SErrors for purposes
   of PSTATE.A masking or that the syndrome register reports them as
   SErrors: it just means that the vector offset is different.)

 * The existing SCTLR_EL3.IESB has an effective value of 1 when
   SCR_EL3.NMEA is 1.  For QEMU this is a no-op because we don't need
   different behaviour based on IESB (we don't need to do anything to
   ensure that error exceptions are synchronized).

So for QEMU the things we need to change are:
 * Make SCR_EL3.{NMEA,EASE} writable
 * When taking a synchronous external abort at EL3, adjust the
   vector entry point if SCR_EL3.EASE is set
 * Advertise the feature in the ID registers

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220531151431.949322-1-peter.maydell@linaro.org
---
 docs/system/arm/emulation.rst |  1 +
 target/arm/cpu.h              |  5 +++++
 target/arm/cpu64.c            |  4 ++--
 target/arm/helper.c           | 36 +++++++++++++++++++++++++++++++++++
 4 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 81467f02ce9..83b44100659 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -23,6 +23,7 @@ the following architecture extensions:
 - FEAT_Debugv8p2 (Debug changes for v8.2)
 - FEAT_Debugv8p4 (Debug changes for v8.4)
 - FEAT_DotProd (Advanced SIMD dot product instructions)
+- FEAT_DoubleFault (Double Fault Extension)
 - FEAT_FCMA (Floating-point complex number instructions)
 - FEAT_FHM (Floating-point half-precision multiplication instructions)
 - FEAT_FP16 (Half-precision floating-point data processing)
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c1865ad5dad..0ee1705a4fa 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3952,6 +3952,11 @@ static inline bool isar_feature_aa64_ras(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, RAS) != 0;
 }
 
+static inline bool isar_feature_aa64_doublefault(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, RAS) >= 2;
+}
+
 static inline bool isar_feature_aa64_sve(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, SVE) != 0;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index bd1c62a3428..cce68dd82a2 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -899,7 +899,7 @@ static void aarch64_max_initfn(Object *obj)
     t = cpu->isar.id_aa64pfr0;
     t = FIELD_DP64(t, ID_AA64PFR0, FP, 1);        /* FEAT_FP16 */
     t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);   /* FEAT_FP16 */
-    t = FIELD_DP64(t, ID_AA64PFR0, RAS, 1);       /* FEAT_RAS */
+    t = FIELD_DP64(t, ID_AA64PFR0, RAS, 2);       /* FEAT_RASv1p1 + FEAT_DoubleFault */
     t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
     t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
     t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
@@ -916,7 +916,7 @@ static void aarch64_max_initfn(Object *obj)
      * we do for EL2 with the virtualization=on property.
      */
     t = FIELD_DP64(t, ID_AA64PFR1, MTE, 3);       /* FEAT_MTE3 */
-    t = FIELD_DP64(t, ID_AA64PFR1, RAS_FRAC, 1);  /* FEAT_RASv1p1 */
+    t = FIELD_DP64(t, ID_AA64PFR1, RAS_FRAC, 0);  /* FEAT_RASv1p1 + FEAT_DoubleFault */
     t = FIELD_DP64(t, ID_AA64PFR1, CSV2_FRAC, 0); /* FEAT_CSV2_2 */
     cpu->isar.id_aa64pfr1 = t;
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 40da63913c9..7f2c14bea94 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1776,6 +1776,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         if (cpu_isar_feature(aa64_scxtnum, cpu)) {
             valid_mask |= SCR_ENSCXT;
         }
+        if (cpu_isar_feature(aa64_doublefault, cpu)) {
+            valid_mask |= SCR_EASE | SCR_NMEA;
+        }
     } else {
         valid_mask &= ~(SCR_RW | SCR_ST);
         if (cpu_isar_feature(aa32_ras, cpu)) {
@@ -10113,6 +10116,31 @@ static uint32_t cpsr_read_for_spsr_elx(CPUARMState *env)
     return ret;
 }
 
+static bool syndrome_is_sync_extabt(uint32_t syndrome)
+{
+    /* Return true if this syndrome value is a synchronous external abort */
+    switch (syn_get_ec(syndrome)) {
+    case EC_INSNABORT:
+    case EC_INSNABORT_SAME_EL:
+    case EC_DATAABORT:
+    case EC_DATAABORT_SAME_EL:
+        /* Look at fault status code for all the synchronous ext abort cases */
+        switch (syndrome & 0x3f) {
+        case 0x10:
+        case 0x13:
+        case 0x14:
+        case 0x15:
+        case 0x16:
+        case 0x17:
+            return true;
+        default:
+            return false;
+        }
+    default:
+        return false;
+    }
+}
+
 /* Handle exception entry to a target EL which is using AArch64 */
 static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
 {
@@ -10168,6 +10196,14 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     switch (cs->exception_index) {
     case EXCP_PREFETCH_ABORT:
     case EXCP_DATA_ABORT:
+        /*
+         * FEAT_DoubleFault allows synchronous external aborts taken to EL3
+         * to be taken to the SError vector entrypoint.
+         */
+        if (new_el == 3 && (env->cp15.scr_el3 & SCR_EASE) &&
+            syndrome_is_sync_extabt(env->exception.syndrome)) {
+            addr += 0x180;
+        }
         env->cp15.far_el[new_el] = env->exception.vaddress;
         qemu_log_mask(CPU_LOG_INT, "...with FAR 0x%" PRIx64 "\n",
                       env->cp15.far_el[new_el]);
-- 
2.25.1


