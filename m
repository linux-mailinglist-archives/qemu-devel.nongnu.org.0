Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 325A130E339
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 20:28:24 +0100 (CET)
Received: from localhost ([::1]:49278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Np9-0003ke-8U
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 14:28:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NP3-0007jw-Pv
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:01:25 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:46550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOr-0001p8-Mk
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:01:25 -0500
Received: by mail-pg1-x536.google.com with SMTP id r38so355030pgk.13
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 11:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cVSNFkptvni25O0i4IF//ufp+gAsyF6zqVY9SYIUSCk=;
 b=epfrDw13tCwm6W700sAWJkkIHdxUF6hBbGBCxvApI4OJBAdzk8kQsVDnj5dGBWjeUT
 wRLn1+6aoD/0SHTbgDBPRrRXDq3k8fedhhdHLtXObEdwpvKVU/CYI5KgEx3RMt2uf/U3
 WPqTyJ8uiGmu1Y2Bmcvw6ohLp8GsrXTDKnvD6BzB251mP1/6xJmYR67VRQLdQtZ+ApIk
 2sp8iQjdh/RmThehooVtcKATdimvLZ2VstZHWeY6cXBqlGi43PpyEpfRykVO4UpJlvfi
 VTg2ngRUqbW7IhbR1IaH34GJEhJKjMmfOvy9pdDp5lcyqR0vQuHDA42pMgyXL+0LT9QP
 J9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cVSNFkptvni25O0i4IF//ufp+gAsyF6zqVY9SYIUSCk=;
 b=F7Jdpbm2WLwiLZmSdUvJ8hfrS9leXVYwFDaMlDfZuPhVVoAUCleMw5GmrJ0nGuZcXs
 0NCI+iza6K2qxowQ77LZMRcMurpHRNpjFmq2/A3OE8obCu76apf21PJru9ILBMbS0BEd
 Hd2Vi8394J8BZmdVLT+2R3DSe2cmWcH0FXUCCOLmAEN6WBMOEOSBFNZOOk9bwSG8Bg5c
 JMNh+w8Arr7f2WWfp9CQwnX/ixTh6ujVnDaSvuEA+M4YI7jzScYaY5jP7okXY8X6tOCa
 L1nnbg+L1mN20J35n+2bHwFzKY9rHlpQzfaIi/8yW71WejORVIX2Y3jyVkc7SRDV+8BY
 5RMw==
X-Gm-Message-State: AOAM533isty0+409wOZGe3WNfGvRKlhtxMwZGsjASrNBBJl1ACWcruu0
 0r5IxgFaFjhIIeYsC5nBActdAONU00ZXggY+
X-Google-Smtp-Source: ABdhPJychszAwVzwTaJ6GgQ6V+PnolkX27JRvitMpQwabaiTjhuGnTytYkWZWbAzHkVI4GeKfxA+bw==
X-Received: by 2002:a62:8244:0:b029:1cf:e4ac:6cde with SMTP id
 w65-20020a6282440000b02901cfe4ac6cdemr4176839pfd.27.1612378864727; 
 Wed, 03 Feb 2021 11:01:04 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:01:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 25/31] target/arm: Split out syndrome.h from internals.h
Date: Wed,  3 Feb 2021 09:00:04 -1000
Message-Id: <20210203190010.759771-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move everything related to syndromes to a new file,
which can be shared with linux-user.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 245 +-----------------------------------
 target/arm/syndrome.h  | 273 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 274 insertions(+), 244 deletions(-)
 create mode 100644 target/arm/syndrome.h

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 6efe0c303e..5a4a742eba 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -26,6 +26,7 @@
 #define TARGET_ARM_INTERNALS_H
 
 #include "hw/registerfields.h"
+#include "syndrome.h"
 
 /* register banks for CPU modes */
 #define BANK_USRSYS 0
@@ -256,250 +257,6 @@ static inline bool extended_addresses_enabled(CPUARMState *env)
            (arm_feature(env, ARM_FEATURE_LPAE) && (tcr->raw_tcr & TTBCR_EAE));
 }
 
-/* Valid Syndrome Register EC field values */
-enum arm_exception_class {
-    EC_UNCATEGORIZED          = 0x00,
-    EC_WFX_TRAP               = 0x01,
-    EC_CP15RTTRAP             = 0x03,
-    EC_CP15RRTTRAP            = 0x04,
-    EC_CP14RTTRAP             = 0x05,
-    EC_CP14DTTRAP             = 0x06,
-    EC_ADVSIMDFPACCESSTRAP    = 0x07,
-    EC_FPIDTRAP               = 0x08,
-    EC_PACTRAP                = 0x09,
-    EC_CP14RRTTRAP            = 0x0c,
-    EC_BTITRAP                = 0x0d,
-    EC_ILLEGALSTATE           = 0x0e,
-    EC_AA32_SVC               = 0x11,
-    EC_AA32_HVC               = 0x12,
-    EC_AA32_SMC               = 0x13,
-    EC_AA64_SVC               = 0x15,
-    EC_AA64_HVC               = 0x16,
-    EC_AA64_SMC               = 0x17,
-    EC_SYSTEMREGISTERTRAP     = 0x18,
-    EC_SVEACCESSTRAP          = 0x19,
-    EC_INSNABORT              = 0x20,
-    EC_INSNABORT_SAME_EL      = 0x21,
-    EC_PCALIGNMENT            = 0x22,
-    EC_DATAABORT              = 0x24,
-    EC_DATAABORT_SAME_EL      = 0x25,
-    EC_SPALIGNMENT            = 0x26,
-    EC_AA32_FPTRAP            = 0x28,
-    EC_AA64_FPTRAP            = 0x2c,
-    EC_SERROR                 = 0x2f,
-    EC_BREAKPOINT             = 0x30,
-    EC_BREAKPOINT_SAME_EL     = 0x31,
-    EC_SOFTWARESTEP           = 0x32,
-    EC_SOFTWARESTEP_SAME_EL   = 0x33,
-    EC_WATCHPOINT             = 0x34,
-    EC_WATCHPOINT_SAME_EL     = 0x35,
-    EC_AA32_BKPT              = 0x38,
-    EC_VECTORCATCH            = 0x3a,
-    EC_AA64_BKPT              = 0x3c,
-};
-
-#define ARM_EL_EC_SHIFT 26
-#define ARM_EL_IL_SHIFT 25
-#define ARM_EL_ISV_SHIFT 24
-#define ARM_EL_IL (1 << ARM_EL_IL_SHIFT)
-#define ARM_EL_ISV (1 << ARM_EL_ISV_SHIFT)
-
-static inline uint32_t syn_get_ec(uint32_t syn)
-{
-    return syn >> ARM_EL_EC_SHIFT;
-}
-
-/* Utility functions for constructing various kinds of syndrome value.
- * Note that in general we follow the AArch64 syndrome values; in a
- * few cases the value in HSR for exceptions taken to AArch32 Hyp
- * mode differs slightly, and we fix this up when populating HSR in
- * arm_cpu_do_interrupt_aarch32_hyp().
- * The exception is FP/SIMD access traps -- these report extra information
- * when taking an exception to AArch32. For those we include the extra coproc
- * and TA fields, and mask them out when taking the exception to AArch64.
- */
-static inline uint32_t syn_uncategorized(void)
-{
-    return (EC_UNCATEGORIZED << ARM_EL_EC_SHIFT) | ARM_EL_IL;
-}
-
-static inline uint32_t syn_aa64_svc(uint32_t imm16)
-{
-    return (EC_AA64_SVC << ARM_EL_EC_SHIFT) | ARM_EL_IL | (imm16 & 0xffff);
-}
-
-static inline uint32_t syn_aa64_hvc(uint32_t imm16)
-{
-    return (EC_AA64_HVC << ARM_EL_EC_SHIFT) | ARM_EL_IL | (imm16 & 0xffff);
-}
-
-static inline uint32_t syn_aa64_smc(uint32_t imm16)
-{
-    return (EC_AA64_SMC << ARM_EL_EC_SHIFT) | ARM_EL_IL | (imm16 & 0xffff);
-}
-
-static inline uint32_t syn_aa32_svc(uint32_t imm16, bool is_16bit)
-{
-    return (EC_AA32_SVC << ARM_EL_EC_SHIFT) | (imm16 & 0xffff)
-        | (is_16bit ? 0 : ARM_EL_IL);
-}
-
-static inline uint32_t syn_aa32_hvc(uint32_t imm16)
-{
-    return (EC_AA32_HVC << ARM_EL_EC_SHIFT) | ARM_EL_IL | (imm16 & 0xffff);
-}
-
-static inline uint32_t syn_aa32_smc(void)
-{
-    return (EC_AA32_SMC << ARM_EL_EC_SHIFT) | ARM_EL_IL;
-}
-
-static inline uint32_t syn_aa64_bkpt(uint32_t imm16)
-{
-    return (EC_AA64_BKPT << ARM_EL_EC_SHIFT) | ARM_EL_IL | (imm16 & 0xffff);
-}
-
-static inline uint32_t syn_aa32_bkpt(uint32_t imm16, bool is_16bit)
-{
-    return (EC_AA32_BKPT << ARM_EL_EC_SHIFT) | (imm16 & 0xffff)
-        | (is_16bit ? 0 : ARM_EL_IL);
-}
-
-static inline uint32_t syn_aa64_sysregtrap(int op0, int op1, int op2,
-                                           int crn, int crm, int rt,
-                                           int isread)
-{
-    return (EC_SYSTEMREGISTERTRAP << ARM_EL_EC_SHIFT) | ARM_EL_IL
-        | (op0 << 20) | (op2 << 17) | (op1 << 14) | (crn << 10) | (rt << 5)
-        | (crm << 1) | isread;
-}
-
-static inline uint32_t syn_cp14_rt_trap(int cv, int cond, int opc1, int opc2,
-                                        int crn, int crm, int rt, int isread,
-                                        bool is_16bit)
-{
-    return (EC_CP14RTTRAP << ARM_EL_EC_SHIFT)
-        | (is_16bit ? 0 : ARM_EL_IL)
-        | (cv << 24) | (cond << 20) | (opc2 << 17) | (opc1 << 14)
-        | (crn << 10) | (rt << 5) | (crm << 1) | isread;
-}
-
-static inline uint32_t syn_cp15_rt_trap(int cv, int cond, int opc1, int opc2,
-                                        int crn, int crm, int rt, int isread,
-                                        bool is_16bit)
-{
-    return (EC_CP15RTTRAP << ARM_EL_EC_SHIFT)
-        | (is_16bit ? 0 : ARM_EL_IL)
-        | (cv << 24) | (cond << 20) | (opc2 << 17) | (opc1 << 14)
-        | (crn << 10) | (rt << 5) | (crm << 1) | isread;
-}
-
-static inline uint32_t syn_cp14_rrt_trap(int cv, int cond, int opc1, int crm,
-                                         int rt, int rt2, int isread,
-                                         bool is_16bit)
-{
-    return (EC_CP14RRTTRAP << ARM_EL_EC_SHIFT)
-        | (is_16bit ? 0 : ARM_EL_IL)
-        | (cv << 24) | (cond << 20) | (opc1 << 16)
-        | (rt2 << 10) | (rt << 5) | (crm << 1) | isread;
-}
-
-static inline uint32_t syn_cp15_rrt_trap(int cv, int cond, int opc1, int crm,
-                                         int rt, int rt2, int isread,
-                                         bool is_16bit)
-{
-    return (EC_CP15RRTTRAP << ARM_EL_EC_SHIFT)
-        | (is_16bit ? 0 : ARM_EL_IL)
-        | (cv << 24) | (cond << 20) | (opc1 << 16)
-        | (rt2 << 10) | (rt << 5) | (crm << 1) | isread;
-}
-
-static inline uint32_t syn_fp_access_trap(int cv, int cond, bool is_16bit)
-{
-    /* AArch32 FP trap or any AArch64 FP/SIMD trap: TA == 0 coproc == 0xa */
-    return (EC_ADVSIMDFPACCESSTRAP << ARM_EL_EC_SHIFT)
-        | (is_16bit ? 0 : ARM_EL_IL)
-        | (cv << 24) | (cond << 20) | 0xa;
-}
-
-static inline uint32_t syn_simd_access_trap(int cv, int cond, bool is_16bit)
-{
-    /* AArch32 SIMD trap: TA == 1 coproc == 0 */
-    return (EC_ADVSIMDFPACCESSTRAP << ARM_EL_EC_SHIFT)
-        | (is_16bit ? 0 : ARM_EL_IL)
-        | (cv << 24) | (cond << 20) | (1 << 5);
-}
-
-static inline uint32_t syn_sve_access_trap(void)
-{
-    return EC_SVEACCESSTRAP << ARM_EL_EC_SHIFT;
-}
-
-static inline uint32_t syn_pactrap(void)
-{
-    return EC_PACTRAP << ARM_EL_EC_SHIFT;
-}
-
-static inline uint32_t syn_btitrap(int btype)
-{
-    return (EC_BTITRAP << ARM_EL_EC_SHIFT) | btype;
-}
-
-static inline uint32_t syn_insn_abort(int same_el, int ea, int s1ptw, int fsc)
-{
-    return (EC_INSNABORT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
-        | ARM_EL_IL | (ea << 9) | (s1ptw << 7) | fsc;
-}
-
-static inline uint32_t syn_data_abort_no_iss(int same_el, int fnv,
-                                             int ea, int cm, int s1ptw,
-                                             int wnr, int fsc)
-{
-    return (EC_DATAABORT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
-           | ARM_EL_IL
-           | (fnv << 10) | (ea << 9) | (cm << 8) | (s1ptw << 7)
-           | (wnr << 6) | fsc;
-}
-
-static inline uint32_t syn_data_abort_with_iss(int same_el,
-                                               int sas, int sse, int srt,
-                                               int sf, int ar,
-                                               int ea, int cm, int s1ptw,
-                                               int wnr, int fsc,
-                                               bool is_16bit)
-{
-    return (EC_DATAABORT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
-           | (is_16bit ? 0 : ARM_EL_IL)
-           | ARM_EL_ISV | (sas << 22) | (sse << 21) | (srt << 16)
-           | (sf << 15) | (ar << 14)
-           | (ea << 9) | (cm << 8) | (s1ptw << 7) | (wnr << 6) | fsc;
-}
-
-static inline uint32_t syn_swstep(int same_el, int isv, int ex)
-{
-    return (EC_SOFTWARESTEP << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
-        | ARM_EL_IL | (isv << 24) | (ex << 6) | 0x22;
-}
-
-static inline uint32_t syn_watchpoint(int same_el, int cm, int wnr)
-{
-    return (EC_WATCHPOINT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
-        | ARM_EL_IL | (cm << 8) | (wnr << 6) | 0x22;
-}
-
-static inline uint32_t syn_breakpoint(int same_el)
-{
-    return (EC_BREAKPOINT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
-        | ARM_EL_IL | 0x22;
-}
-
-static inline uint32_t syn_wfx(int cv, int cond, int ti, bool is_16bit)
-{
-    return (EC_WFX_TRAP << ARM_EL_EC_SHIFT) |
-           (is_16bit ? 0 : (1 << ARM_EL_IL_SHIFT)) |
-           (cv << 24) | (cond << 20) | ti;
-}
-
 /* Update a QEMU watchpoint based on the information the guest has set in the
  * DBGWCR<n>_EL1 and DBGWVR<n>_EL1 registers.
  */
diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
new file mode 100644
index 0000000000..39a31260f2
--- /dev/null
+++ b/target/arm/syndrome.h
@@ -0,0 +1,273 @@
+/*
+ * QEMU ARM CPU -- syndrome functions and types
+ *
+ * Copyright (c) 2014 Linaro Ltd
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see
+ * <http://www.gnu.org/licenses/gpl-2.0.html>
+ *
+ * This header defines functions, types, etc which need to be shared
+ * between different source files within target/arm/ but which are
+ * private to it and not required by the rest of QEMU.
+ */
+
+#ifndef TARGET_ARM_SYNDROME_H
+#define TARGET_ARM_SYNDROME_H
+
+/* Valid Syndrome Register EC field values */
+enum arm_exception_class {
+    EC_UNCATEGORIZED          = 0x00,
+    EC_WFX_TRAP               = 0x01,
+    EC_CP15RTTRAP             = 0x03,
+    EC_CP15RRTTRAP            = 0x04,
+    EC_CP14RTTRAP             = 0x05,
+    EC_CP14DTTRAP             = 0x06,
+    EC_ADVSIMDFPACCESSTRAP    = 0x07,
+    EC_FPIDTRAP               = 0x08,
+    EC_PACTRAP                = 0x09,
+    EC_CP14RRTTRAP            = 0x0c,
+    EC_BTITRAP                = 0x0d,
+    EC_ILLEGALSTATE           = 0x0e,
+    EC_AA32_SVC               = 0x11,
+    EC_AA32_HVC               = 0x12,
+    EC_AA32_SMC               = 0x13,
+    EC_AA64_SVC               = 0x15,
+    EC_AA64_HVC               = 0x16,
+    EC_AA64_SMC               = 0x17,
+    EC_SYSTEMREGISTERTRAP     = 0x18,
+    EC_SVEACCESSTRAP          = 0x19,
+    EC_INSNABORT              = 0x20,
+    EC_INSNABORT_SAME_EL      = 0x21,
+    EC_PCALIGNMENT            = 0x22,
+    EC_DATAABORT              = 0x24,
+    EC_DATAABORT_SAME_EL      = 0x25,
+    EC_SPALIGNMENT            = 0x26,
+    EC_AA32_FPTRAP            = 0x28,
+    EC_AA64_FPTRAP            = 0x2c,
+    EC_SERROR                 = 0x2f,
+    EC_BREAKPOINT             = 0x30,
+    EC_BREAKPOINT_SAME_EL     = 0x31,
+    EC_SOFTWARESTEP           = 0x32,
+    EC_SOFTWARESTEP_SAME_EL   = 0x33,
+    EC_WATCHPOINT             = 0x34,
+    EC_WATCHPOINT_SAME_EL     = 0x35,
+    EC_AA32_BKPT              = 0x38,
+    EC_VECTORCATCH            = 0x3a,
+    EC_AA64_BKPT              = 0x3c,
+};
+
+#define ARM_EL_EC_SHIFT 26
+#define ARM_EL_IL_SHIFT 25
+#define ARM_EL_ISV_SHIFT 24
+#define ARM_EL_IL (1 << ARM_EL_IL_SHIFT)
+#define ARM_EL_ISV (1 << ARM_EL_ISV_SHIFT)
+
+static inline uint32_t syn_get_ec(uint32_t syn)
+{
+    return syn >> ARM_EL_EC_SHIFT;
+}
+
+/*
+ * Utility functions for constructing various kinds of syndrome value.
+ * Note that in general we follow the AArch64 syndrome values; in a
+ * few cases the value in HSR for exceptions taken to AArch32 Hyp
+ * mode differs slightly, and we fix this up when populating HSR in
+ * arm_cpu_do_interrupt_aarch32_hyp().
+ * The exception is FP/SIMD access traps -- these report extra information
+ * when taking an exception to AArch32. For those we include the extra coproc
+ * and TA fields, and mask them out when taking the exception to AArch64.
+ */
+static inline uint32_t syn_uncategorized(void)
+{
+    return (EC_UNCATEGORIZED << ARM_EL_EC_SHIFT) | ARM_EL_IL;
+}
+
+static inline uint32_t syn_aa64_svc(uint32_t imm16)
+{
+    return (EC_AA64_SVC << ARM_EL_EC_SHIFT) | ARM_EL_IL | (imm16 & 0xffff);
+}
+
+static inline uint32_t syn_aa64_hvc(uint32_t imm16)
+{
+    return (EC_AA64_HVC << ARM_EL_EC_SHIFT) | ARM_EL_IL | (imm16 & 0xffff);
+}
+
+static inline uint32_t syn_aa64_smc(uint32_t imm16)
+{
+    return (EC_AA64_SMC << ARM_EL_EC_SHIFT) | ARM_EL_IL | (imm16 & 0xffff);
+}
+
+static inline uint32_t syn_aa32_svc(uint32_t imm16, bool is_16bit)
+{
+    return (EC_AA32_SVC << ARM_EL_EC_SHIFT) | (imm16 & 0xffff)
+        | (is_16bit ? 0 : ARM_EL_IL);
+}
+
+static inline uint32_t syn_aa32_hvc(uint32_t imm16)
+{
+    return (EC_AA32_HVC << ARM_EL_EC_SHIFT) | ARM_EL_IL | (imm16 & 0xffff);
+}
+
+static inline uint32_t syn_aa32_smc(void)
+{
+    return (EC_AA32_SMC << ARM_EL_EC_SHIFT) | ARM_EL_IL;
+}
+
+static inline uint32_t syn_aa64_bkpt(uint32_t imm16)
+{
+    return (EC_AA64_BKPT << ARM_EL_EC_SHIFT) | ARM_EL_IL | (imm16 & 0xffff);
+}
+
+static inline uint32_t syn_aa32_bkpt(uint32_t imm16, bool is_16bit)
+{
+    return (EC_AA32_BKPT << ARM_EL_EC_SHIFT) | (imm16 & 0xffff)
+        | (is_16bit ? 0 : ARM_EL_IL);
+}
+
+static inline uint32_t syn_aa64_sysregtrap(int op0, int op1, int op2,
+                                           int crn, int crm, int rt,
+                                           int isread)
+{
+    return (EC_SYSTEMREGISTERTRAP << ARM_EL_EC_SHIFT) | ARM_EL_IL
+        | (op0 << 20) | (op2 << 17) | (op1 << 14) | (crn << 10) | (rt << 5)
+        | (crm << 1) | isread;
+}
+
+static inline uint32_t syn_cp14_rt_trap(int cv, int cond, int opc1, int opc2,
+                                        int crn, int crm, int rt, int isread,
+                                        bool is_16bit)
+{
+    return (EC_CP14RTTRAP << ARM_EL_EC_SHIFT)
+        | (is_16bit ? 0 : ARM_EL_IL)
+        | (cv << 24) | (cond << 20) | (opc2 << 17) | (opc1 << 14)
+        | (crn << 10) | (rt << 5) | (crm << 1) | isread;
+}
+
+static inline uint32_t syn_cp15_rt_trap(int cv, int cond, int opc1, int opc2,
+                                        int crn, int crm, int rt, int isread,
+                                        bool is_16bit)
+{
+    return (EC_CP15RTTRAP << ARM_EL_EC_SHIFT)
+        | (is_16bit ? 0 : ARM_EL_IL)
+        | (cv << 24) | (cond << 20) | (opc2 << 17) | (opc1 << 14)
+        | (crn << 10) | (rt << 5) | (crm << 1) | isread;
+}
+
+static inline uint32_t syn_cp14_rrt_trap(int cv, int cond, int opc1, int crm,
+                                         int rt, int rt2, int isread,
+                                         bool is_16bit)
+{
+    return (EC_CP14RRTTRAP << ARM_EL_EC_SHIFT)
+        | (is_16bit ? 0 : ARM_EL_IL)
+        | (cv << 24) | (cond << 20) | (opc1 << 16)
+        | (rt2 << 10) | (rt << 5) | (crm << 1) | isread;
+}
+
+static inline uint32_t syn_cp15_rrt_trap(int cv, int cond, int opc1, int crm,
+                                         int rt, int rt2, int isread,
+                                         bool is_16bit)
+{
+    return (EC_CP15RRTTRAP << ARM_EL_EC_SHIFT)
+        | (is_16bit ? 0 : ARM_EL_IL)
+        | (cv << 24) | (cond << 20) | (opc1 << 16)
+        | (rt2 << 10) | (rt << 5) | (crm << 1) | isread;
+}
+
+static inline uint32_t syn_fp_access_trap(int cv, int cond, bool is_16bit)
+{
+    /* AArch32 FP trap or any AArch64 FP/SIMD trap: TA == 0 coproc == 0xa */
+    return (EC_ADVSIMDFPACCESSTRAP << ARM_EL_EC_SHIFT)
+        | (is_16bit ? 0 : ARM_EL_IL)
+        | (cv << 24) | (cond << 20) | 0xa;
+}
+
+static inline uint32_t syn_simd_access_trap(int cv, int cond, bool is_16bit)
+{
+    /* AArch32 SIMD trap: TA == 1 coproc == 0 */
+    return (EC_ADVSIMDFPACCESSTRAP << ARM_EL_EC_SHIFT)
+        | (is_16bit ? 0 : ARM_EL_IL)
+        | (cv << 24) | (cond << 20) | (1 << 5);
+}
+
+static inline uint32_t syn_sve_access_trap(void)
+{
+    return EC_SVEACCESSTRAP << ARM_EL_EC_SHIFT;
+}
+
+static inline uint32_t syn_pactrap(void)
+{
+    return EC_PACTRAP << ARM_EL_EC_SHIFT;
+}
+
+static inline uint32_t syn_btitrap(int btype)
+{
+    return (EC_BTITRAP << ARM_EL_EC_SHIFT) | btype;
+}
+
+static inline uint32_t syn_insn_abort(int same_el, int ea, int s1ptw, int fsc)
+{
+    return (EC_INSNABORT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
+        | ARM_EL_IL | (ea << 9) | (s1ptw << 7) | fsc;
+}
+
+static inline uint32_t syn_data_abort_no_iss(int same_el, int fnv,
+                                             int ea, int cm, int s1ptw,
+                                             int wnr, int fsc)
+{
+    return (EC_DATAABORT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
+           | ARM_EL_IL
+           | (fnv << 10) | (ea << 9) | (cm << 8) | (s1ptw << 7)
+           | (wnr << 6) | fsc;
+}
+
+static inline uint32_t syn_data_abort_with_iss(int same_el,
+                                               int sas, int sse, int srt,
+                                               int sf, int ar,
+                                               int ea, int cm, int s1ptw,
+                                               int wnr, int fsc,
+                                               bool is_16bit)
+{
+    return (EC_DATAABORT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
+           | (is_16bit ? 0 : ARM_EL_IL)
+           | ARM_EL_ISV | (sas << 22) | (sse << 21) | (srt << 16)
+           | (sf << 15) | (ar << 14)
+           | (ea << 9) | (cm << 8) | (s1ptw << 7) | (wnr << 6) | fsc;
+}
+
+static inline uint32_t syn_swstep(int same_el, int isv, int ex)
+{
+    return (EC_SOFTWARESTEP << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
+        | ARM_EL_IL | (isv << 24) | (ex << 6) | 0x22;
+}
+
+static inline uint32_t syn_watchpoint(int same_el, int cm, int wnr)
+{
+    return (EC_WATCHPOINT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
+        | ARM_EL_IL | (cm << 8) | (wnr << 6) | 0x22;
+}
+
+static inline uint32_t syn_breakpoint(int same_el)
+{
+    return (EC_BREAKPOINT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
+        | ARM_EL_IL | 0x22;
+}
+
+static inline uint32_t syn_wfx(int cv, int cond, int ti, bool is_16bit)
+{
+    return (EC_WFX_TRAP << ARM_EL_EC_SHIFT) |
+           (is_16bit ? 0 : (1 << ARM_EL_IL_SHIFT)) |
+           (cv << 24) | (cond << 20) | ti;
+}
+
+#endif /* TARGET_ARM_SYNDROME_H */
-- 
2.25.1


