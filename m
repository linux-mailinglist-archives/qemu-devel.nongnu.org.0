Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFDE318C48
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:43:28 +0100 (CET)
Received: from localhost ([::1]:45608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lACFj-0002GP-MU
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:43:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZL-0008Ot-Vu
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:41 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:37274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZC-00005r-7M
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:38 -0500
Received: by mail-wm1-x32c.google.com with SMTP id m1so5643594wml.2
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ijaQagooHuIH5z5NGwZXJPms0B2RYsBAzhVKOPfgUV4=;
 b=kqDojDyWUBWCkGSMErBDRKwRgqsTEFBUVmFn2TN9d1eG/bVwILmj6zKbg+o8Gxz67T
 Vsx984iGlbSikidylYcsG3q9gWAUoSzVNDHxcDmQphXHVVwqtAysauORkfvv4GEwuQ4p
 9mzD2q7tKBHHMG01q77luG79WNDHf9CY/Kzoy4AEBRW084NR/QU62pQXyMX/ZmVrvY0V
 VUpFaL5Wm7ewRv250rPGU4i07HpDWYLALxuwluMxegOJOvIMc85Cu4zIxSAYVrrAMVm4
 0YhuikCzV7yGmFgXgY9/KfW51H60F39WdrWuroZ2S0J89rIJNVJHN7Zcd1HDDnv2E5C6
 n2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ijaQagooHuIH5z5NGwZXJPms0B2RYsBAzhVKOPfgUV4=;
 b=cV6K2NxtR9U60gzMpWn6Es/el/xX7RO9rDvno7gdAfLT4FfJXLDuMQvjNnh7URxs1C
 AdwXWXDYWUYgsykeL8dof1ZeGAFWSndBE8ovPJFBK2vd1a1NGAJLVQzLTDBOWV1aqu9V
 8CW5xkFCo8gtbJ22rZC4e8QSfzwK6Ci8hnpHnQE3c+aySfgMstB88+Wvf79jtocj/nQp
 goMdLZvGyyW2BIr+Nrtr311a6QWyhW/Cmf7s5xHfjPSbmeI51N62pjnzZgE1yTFaoIFB
 OlYPhyMKvXWxdAu+zfqavvD7RYoKhsAEAvGa6bMiYrAelNnSfj44GNb3TbPUWyDNVC8O
 7jjQ==
X-Gm-Message-State: AOAM531W1ZoNC7fxukRWeydkEDSjzsPquwabaIiOBj/Pf627KnZT1Fld
 qGLGV4zu3JpQVgrtppKBHyGv7yORMDybBA==
X-Google-Smtp-Source: ABdhPJy89TfT6Jk2UDLvfynpSn91Wn82UBcnQntYm5wIeSDAMJYizjvrDd2LlshAtyNqdZ9ucm2f9A==
X-Received: by 2002:a05:600c:204e:: with SMTP id
 p14mr5064633wmg.157.1613048368423; 
 Thu, 11 Feb 2021 04:59:28 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g15sm4955716wrx.1.2021.02.11.04.59.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:59:28 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 34/45] target/arm: Split out syndrome.h from internals.h
Date: Thu, 11 Feb 2021 12:58:49 +0000
Message-Id: <20210211125900.22777-35-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211125900.22777-1-peter.maydell@linaro.org>
References: <20210211125900.22777-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Move everything related to syndromes to a new file,
which can be shared with linux-user.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210210000223.884088-26-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 245 +-----------------------------------
 target/arm/syndrome.h  | 273 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 274 insertions(+), 244 deletions(-)
 create mode 100644 target/arm/syndrome.h

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 112bbb14f07..c38d5410175 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -26,6 +26,7 @@
 #define TARGET_ARM_INTERNALS_H
 
 #include "hw/registerfields.h"
+#include "syndrome.h"
 
 /* register banks for CPU modes */
 #define BANK_USRSYS 0
@@ -262,250 +263,6 @@ static inline bool extended_addresses_enabled(CPUARMState *env)
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
index 00000000000..39a31260f2d
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
2.20.1


