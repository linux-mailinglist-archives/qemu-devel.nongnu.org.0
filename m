Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F915807D5
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Aug 2019 20:51:44 +0200 (CEST)
Received: from localhost ([::1]:41386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htz83-0003wu-Ie
	for lists+qemu-devel@lfdr.de; Sat, 03 Aug 2019 14:51:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60533)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1htz4b-0005yU-9m
 for qemu-devel@nongnu.org; Sat, 03 Aug 2019 14:48:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1htz4Z-000763-P5
 for qemu-devel@nongnu.org; Sat, 03 Aug 2019 14:48:09 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:36212)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1htz4Z-00075j-JG
 for qemu-devel@nongnu.org; Sat, 03 Aug 2019 14:48:07 -0400
Received: by mail-pl1-x643.google.com with SMTP id k8so34907917plt.3
 for <qemu-devel@nongnu.org>; Sat, 03 Aug 2019 11:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZRDl/Ha+kclTizhs/nHDa+7096PsBT003cOS/ic3LTY=;
 b=gO1RyuEd4amyO2ZioV4wbCAXOswiL3HZaFPh3uZiBfDdBs1Hxj4qjpDVT1qE0w/Y/2
 TCd2HoUEIsZPPem9Sz4MGxM/lb1njDYhPyBetZ/OwHnPIEzVBjbKvUEgzkOgoR7OROsX
 6ZpH958pzmLMtWIKbj5Y4qSTIb//ClcMqUwrWF171EWHWOApxSfxo3aGH5/NWGz9Mkcf
 7tGdzP7xNMG3EGKmDxY9z/BV/WmykaIb3Ly0LCXkcQ69cDzoIi3wfnUrz/9eFRauToxG
 4zQ6QIJUBVIpNf21r0pUdtcFJya++VW7hA8RaVngSFKC9duw8Agsy07xLAL5UiIw99KD
 xv1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZRDl/Ha+kclTizhs/nHDa+7096PsBT003cOS/ic3LTY=;
 b=JPhRNJPyK7BD2gA73Y8EYBCvOnTVVbW3P7OxudxFbDibcK+cGTAOI1psqxuGrVC56h
 YGpqC+EsJak9sn6OuF/ekeEdQZ0J8f/wJN/6IqOznfkFJMUstcH6EXbbSv4PKpejI9ZF
 QuWdUe/zB54GDWnSFVgXOVpa9xYbUCNn9n/RbnKT5em/vYw4Rou/XOyf5deWaO0L5oFD
 ua8B+iMKnVRASbdVWLhT+hAov9CSxDOCmqGu1nBNcLJ+tlQeEwqb8K2rj4zbBgIprj8G
 JegF+bdjH4MW+/Ieahbhlk11KIGdSmLqZTj7PiGTWaLJZadk9zOK7yGns+zxsk7YVB6U
 IhWg==
X-Gm-Message-State: APjAAAVPoUEUkLFREKb8LxArpqz8KYHjuGfEcsQeSYy1OGQ5XTdlyWVv
 wkxWc1hkjYIYUadbV3N6Un8CXOjsQao=
X-Google-Smtp-Source: APXvYqyQADm81TOq7pTG3uu8C1tSxFfVRBTYH3eUA/V0wxpc15KUvnS2t3SKs/oEQ28Fzd7eP77Ppw==
X-Received: by 2002:a17:902:8a8a:: with SMTP id
 p10mr139797676plo.88.1564858086446; 
 Sat, 03 Aug 2019 11:48:06 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id q69sm15405454pjb.0.2019.08.03.11.48.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 03 Aug 2019 11:48:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat,  3 Aug 2019 11:47:29 -0700
Message-Id: <20190803184800.8221-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803184800.8221-1-richard.henderson@linaro.org>
References: <20190803184800.8221-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-devel] [PATCH v3 03/34] target/arm: Install ASIDs for
 long-form from EL1
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In addition to providing the core with the current ASID, this minimizes
both the number of flushes due to non-changing ASID as well as the set
of mmu_idx that are affected by each flush.

In particular, updates to the secure mode registers flushes only the
relevant secure mode mmu_idx's, and similarly non-secure updates only
affect non-secure mmu_idx's.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 73 +++++++++++++++++++++++++++++----------------
 1 file changed, 48 insertions(+), 25 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b74c23a9bc..2a65f4127e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3327,6 +3327,36 @@ static const ARMCPRegInfo pmsav5_cp_reginfo[] = {
     REGINFO_SENTINEL
 };
 
+/* Called after a change to any of TTBR*_EL1 or TTBCR_EL1.  */
+static void update_lpae_el1_asid(CPUARMState *env, int secure)
+{
+    CPUState *cs = env_cpu(env);
+    uint64_t ttbr0, ttbr1, ttcr;
+    int asid, idxmask;
+
+    switch (secure) {
+    case ARM_CP_SECSTATE_S:
+        ttbr0 = env->cp15.ttbr0_s;
+        ttbr1 = env->cp15.ttbr1_s;
+        ttcr = env->cp15.tcr_el[3].raw_tcr;
+        /* Note that cp15.ttbr0_s == cp15.ttbr0_el[3], so S1E3 is affected.  */
+        /* ??? Secure EL3 really using the ASID field?  Doesn't make sense.  */
+        idxmask = ARMMMUIdxBit_S1SE1 | ARMMMUIdxBit_S1SE0 | ARMMMUIdxBit_S1E3;
+        break;
+    case ARM_CP_SECSTATE_NS:
+        ttbr0 = env->cp15.ttbr0_ns;
+        ttbr1 = env->cp15.ttbr1_ns;
+        ttcr = env->cp15.tcr_el[1].raw_tcr;
+        idxmask = ARMMMUIdxBit_S12NSE1 | ARMMMUIdxBit_S12NSE0;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    asid = extract64(ttcr & TTBCR_A1 ? ttbr1 : ttbr0, 48, 16);
+
+    tlb_set_asid_for_mmuidx(cs, asid, idxmask, 0);
+}
+
 static void vmsa_ttbcr_raw_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                  uint64_t value)
 {
@@ -3363,18 +3393,16 @@ static void vmsa_ttbcr_raw_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void vmsa_ttbcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t value)
 {
-    ARMCPU *cpu = env_archcpu(env);
     TCR *tcr = raw_ptr(env, ri);
 
-    if (arm_feature(env, ARM_FEATURE_LPAE)) {
-        /* With LPAE the TTBCR could result in a change of ASID
-         * via the TTBCR.A1 bit, so do a TLB flush.
-         */
-        tlb_flush(CPU(cpu));
-    }
     /* Preserve the high half of TCR_EL1, set via TTBCR2.  */
     value = deposit64(tcr->raw_tcr, 0, 32, value);
     vmsa_ttbcr_raw_write(env, ri, value);
+
+    if (arm_feature(env, ARM_FEATURE_LPAE)) {
+        /* The A1 bit controls which ASID is active.  */
+        update_lpae_el1_asid(env, ri->secure);
+    }
 }
 
 static void vmsa_ttbcr_reset(CPUARMState *env, const ARMCPRegInfo *ri)
@@ -3392,24 +3420,19 @@ static void vmsa_ttbcr_reset(CPUARMState *env, const ARMCPRegInfo *ri)
 static void vmsa_tcr_el1_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                uint64_t value)
 {
-    ARMCPU *cpu = env_archcpu(env);
-    TCR *tcr = raw_ptr(env, ri);
-
-    /* For AArch64 the A1 bit could result in a change of ASID, so TLB flush. */
-    tlb_flush(CPU(cpu));
-    tcr->raw_tcr = value;
+    raw_write(env, ri, value);
+    /* The A1 bit controls which ASID is active.  */
+    update_lpae_el1_asid(env, ri->secure);
 }
 
-static void vmsa_ttbr_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                            uint64_t value)
+static void vmsa_ttbr_el1_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                uint64_t value)
 {
-    /* If the ASID changes (with a 64-bit write), we must flush the TLB.  */
-    if (cpreg_field_is_64bit(ri) &&
-        extract64(raw_read(env, ri) ^ value, 48, 16) != 0) {
-        ARMCPU *cpu = env_archcpu(env);
-        tlb_flush(CPU(cpu));
-    }
     raw_write(env, ri, value);
+    if (cpreg_field_is_64bit(ri)) {
+        /* The LPAE format (64-bit write) contains an ASID field.  */
+        update_lpae_el1_asid(env, ri->secure);
+    }
 }
 
 static void vttbr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -3455,12 +3478,12 @@ static const ARMCPRegInfo vmsa_cp_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.esr_el[1]), .resetvalue = 0, },
     { .name = "TTBR0_EL1", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 0, .opc2 = 0,
-      .access = PL1_RW, .writefn = vmsa_ttbr_write, .resetvalue = 0,
+      .access = PL1_RW, .writefn = vmsa_ttbr_el1_write, .resetvalue = 0,
       .bank_fieldoffsets = { offsetof(CPUARMState, cp15.ttbr0_s),
                              offsetof(CPUARMState, cp15.ttbr0_ns) } },
     { .name = "TTBR1_EL1", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 0, .opc2 = 1,
-      .access = PL1_RW, .writefn = vmsa_ttbr_write, .resetvalue = 0,
+      .access = PL1_RW, .writefn = vmsa_ttbr_el1_write, .resetvalue = 0,
       .bank_fieldoffsets = { offsetof(CPUARMState, cp15.ttbr1_s),
                              offsetof(CPUARMState, cp15.ttbr1_ns) } },
     { .name = "TCR_EL1", .state = ARM_CP_STATE_AA64,
@@ -3715,12 +3738,12 @@ static const ARMCPRegInfo lpae_cp_reginfo[] = {
       .access = PL1_RW, .type = ARM_CP_64BIT | ARM_CP_ALIAS,
       .bank_fieldoffsets = { offsetof(CPUARMState, cp15.ttbr0_s),
                              offsetof(CPUARMState, cp15.ttbr0_ns) },
-      .writefn = vmsa_ttbr_write, },
+      .writefn = vmsa_ttbr_el1_write, },
     { .name = "TTBR1", .cp = 15, .crm = 2, .opc1 = 1,
       .access = PL1_RW, .type = ARM_CP_64BIT | ARM_CP_ALIAS,
       .bank_fieldoffsets = { offsetof(CPUARMState, cp15.ttbr1_s),
                              offsetof(CPUARMState, cp15.ttbr1_ns) },
-      .writefn = vmsa_ttbr_write, },
+      .writefn = vmsa_ttbr_el1_write, },
     REGINFO_SENTINEL
 };
 
-- 
2.17.1


