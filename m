Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB7A3F8CCC
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:16:45 +0200 (CEST)
Received: from localhost ([::1]:52968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJIzc-0008F9-ID
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:16:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJIn5-0006HU-5X
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:47 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:43978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJIn3-0000Cj-HY
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:46 -0400
Received: by mail-wr1-x432.google.com with SMTP id b6so6126081wrh.10
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Fr5/qTsyPceG+UnhtkA8Hp2jMgS+2xvalZAPZZRCG0c=;
 b=D4mhoU5p9enHjPx1ch/ZniNUveffVtm+Hry6JYOG02TcrA61BhMdj/76uEunjbKkVy
 BqGICjIgf7m5rauJapthRhD26JmTsxG1PCm+qU5Qz6fDC7N1usK1K3ZJGhrkuJv0M+Og
 4XVXBX0OSgp+U4p0BAS2p5Abs6Ql4ePttjv6ZOnTWlCYfNRvB9diSZL1iR+6AKqsZk8l
 TuZ4bhi3kg/fVBld12fduj5kcvnrteb5eluKATQTwUswopUBuPrmZ3vpsUUcPVWUdfOy
 6bfy8QNHEu4PhVqsf1e6Zaiuien3Z5+N/i0nw7a9/z+Zn8ujhZVnnAl3rl9nhMq+2jJl
 9lVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fr5/qTsyPceG+UnhtkA8Hp2jMgS+2xvalZAPZZRCG0c=;
 b=dssd7vKC05YtsXX/hNzO7Zt8iw3LFwvgnrO+/jnk6J5ogex3VKZ74RZRpGIosbL+mp
 mnC1m2zeRWs8rEncOnadz2G31GIW1d80oLAA6zVMIKyL4xCzwL9yY+8up/FouzsYUs29
 eb3QL8ZescsPb5Mb5HrdhaGBASxPmUUqvCE10PFUwnWyPn97SAukPLAcxNNPnHxLfnrw
 rhClbmNwU+x5TIJlrMIZlyTmkKU0JYwyGdALfVb4GIW8loGFzS74IPvoMDCyyKIs24SS
 2ENO1q+vlE8svtGLmeo4in29sqlTnSfycb8JYJyUhchECqVeBdNAmyTvuJ4lTI2j4AJF
 turg==
X-Gm-Message-State: AOAM530aZ06sccNZWjIUKlSOcGLiAKu8Ytmy1F0GPFYOMK2AMXFZRLks
 UwKoQfCAUkW9b2M9jO8brCgzm7J1CwEi0w==
X-Google-Smtp-Source: ABdhPJzdGDsqm9DUFhara8xM2gY2TR5PCs50Q62b/d5dDs6sdLS0uP7dvR3+/aNpHz13LNQvH2iDWg==
X-Received: by 2002:adf:c40f:: with SMTP id v15mr2060792wrf.316.1629997423445; 
 Thu, 26 Aug 2021 10:03:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i21sm3632470wrb.62.2021.08.26.10.03.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:03:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/37] target/arm: Implement HSTR.TTEE
Date: Thu, 26 Aug 2021 18:03:03 +0100
Message-Id: <20210826170307.27733-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826170307.27733-1-peter.maydell@linaro.org>
References: <20210826170307.27733-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

In v7, the HSTR register has a TTEE bit which allows EL0/EL1 accesses
to the Thumb2EE TEECR and TEEHBR registers to be trapped to the
hypervisor. Implement these traps.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210816180305.20137-2-peter.maydell@linaro.org
---
 target/arm/cpu.h    |  2 ++
 target/arm/helper.c | 18 ++++++++++++++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 1060825c746..0cd3206041e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1541,6 +1541,8 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define SCR_ENSCXT            (1U << 25)
 #define SCR_ATA               (1U << 26)
 
+#define HSTR_TTEE (1 << 16)
+
 /* Return the current FPSCR value.  */
 uint32_t vfp_get_fpscr(CPUARMState *env);
 void vfp_set_fpscr(CPUARMState *env, uint32_t val);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 56c520cf8e9..54ac8c54b1f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2446,20 +2446,34 @@ static void teecr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     env->teecr = value;
 }
 
+static CPAccessResult teecr_access(CPUARMState *env, const ARMCPRegInfo *ri,
+                                   bool isread)
+{
+    /*
+     * HSTR.TTEE only exists in v7A, not v8A, but v8A doesn't have T2EE
+     * at all, so we don't need to check whether we're v8A.
+     */
+    if (arm_current_el(env) < 2 && !arm_is_secure_below_el3(env) &&
+        (env->cp15.hstr_el2 & HSTR_TTEE)) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+    return CP_ACCESS_OK;
+}
+
 static CPAccessResult teehbr_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                     bool isread)
 {
     if (arm_current_el(env) == 0 && (env->teecr & 1)) {
         return CP_ACCESS_TRAP;
     }
-    return CP_ACCESS_OK;
+    return teecr_access(env, ri, isread);
 }
 
 static const ARMCPRegInfo t2ee_cp_reginfo[] = {
     { .name = "TEECR", .cp = 14, .crn = 0, .crm = 0, .opc1 = 6, .opc2 = 0,
       .access = PL1_RW, .fieldoffset = offsetof(CPUARMState, teecr),
       .resetvalue = 0,
-      .writefn = teecr_write },
+      .writefn = teecr_write, .accessfn = teecr_access },
     { .name = "TEEHBR", .cp = 14, .crn = 1, .crm = 0, .opc1 = 6, .opc2 = 0,
       .access = PL0_RW, .fieldoffset = offsetof(CPUARMState, teehbr),
       .accessfn = teehbr_access, .resetvalue = 0 },
-- 
2.20.1


