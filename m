Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEB92D5A06
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 13:08:22 +0100 (CET)
Received: from localhost ([::1]:50764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knKk9-0003z9-II
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 07:08:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKR9-0001gu-4s
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:43 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:35975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKR1-00079A-8n
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:42 -0500
Received: by mail-wm1-x342.google.com with SMTP id y23so5006930wmi.1
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 03:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JLPn2HKUKMTiq62Z0j1xU/zunH06nHY3wxhczZYbRZk=;
 b=HvI/aA4ysiXIbSouVC8CmPvDjIdu/e1AoLFdkw0XJEz4qqy6LqmOJBbYWdd1oQUoWE
 CPazyktdS8qjSumAKCgqXnY9vOdwjD/xc6wxjIhjW5krvXyOsNAIjY4TUcqqlPEU+/Ax
 IifvLkRwPrGaMFN3gueLPSWxlHKtkMul0kDrLFf/uTJB9Hl0xCoABL/wHcohdVlan0UA
 Ul5OWg2K6o0rFwaIh9TU7x5+L3t6HWK+5AYkhiFdi0uqAqllgdYs34drvJ1fNwd1OCbI
 kR/Uz4MzsTzMkBRJosvzisxJOjnZHuM3f+NZTksHE2bNev7ehfhDN95pO6Nvo79XQItL
 P7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JLPn2HKUKMTiq62Z0j1xU/zunH06nHY3wxhczZYbRZk=;
 b=of3vH/Abtksmp8Nd6g/JIaler7eIntSi0uKdnzvH6OFENgINgaQ38CjThwdU4N4EyA
 qg2a3M+j7fL85gQaDOYxY/S+S+/Y6AztCGsyL0CVxAm8XUV59b9L8qar9eeqAgxoYv+q
 yNzfl/CKPp1XQ6uk7TVIssgD3d+pVEkYM9mvqOnd5rZd5I2AXXSDoBgrm2WqoMS6fI4Z
 dowhgnbAoqKD6kn5Az4aumkw21csJt4ic+HhVpFsNmWW5e0716XW7sfXqoDRTNA2FDWF
 btPrEVZ/rMzJzadp3GvOu7Vy1obokU28z6myKSLj7iQ+2vRpxVeHAKmDzfqlDW4xlJfJ
 DJ2Q==
X-Gm-Message-State: AOAM533rV29O8GcDYSm6p4CLBzyDyAstJ8MISn0rb8y2+o/no4VGZPl0
 rUJWBpR9kRFXf4QDxPrfkbg3xYSv1toqtg==
X-Google-Smtp-Source: ABdhPJzgb+1Gd1vT1VCvirXXt5t+yc9d/dYT43nKEasyzeAEPO28YufawQEhVFYtaLMMMOfb9Yc/Qw==
X-Received: by 2002:a1c:f60b:: with SMTP id w11mr7884732wmc.180.1607600913730; 
 Thu, 10 Dec 2020 03:48:33 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g192sm9304725wme.48.2020.12.10.03.48.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 03:48:33 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/36] hw/intc/armv7m_nvic: Support v8.1M CCR.TRD bit
Date: Thu, 10 Dec 2020 11:47:51 +0000
Message-Id: <20201210114756.16501-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210114756.16501-1-peter.maydell@linaro.org>
References: <20201210114756.16501-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
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

v8.1M introduces a new TRD flag in the CCR register, which enables
checking for stack frame integrity signatures on SG instructions.
This bit is not banked, and is always RAZ/WI to Non-secure code.
Adjust the code for handling CCR reads and writes to handle this.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201119215617.29887-23-peter.maydell@linaro.org
---
 target/arm/cpu.h      |  2 ++
 hw/intc/armv7m_nvic.c | 26 ++++++++++++++++++--------
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 47cb5032ce9..22c55c81933 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1611,6 +1611,8 @@ FIELD(V7M_CCR, STKOFHFNMIGN, 10, 1)
 FIELD(V7M_CCR, DC, 16, 1)
 FIELD(V7M_CCR, IC, 17, 1)
 FIELD(V7M_CCR, BP, 18, 1)
+FIELD(V7M_CCR, LOB, 19, 1)
+FIELD(V7M_CCR, TRD, 20, 1)
 
 /* V7M SCR bits */
 FIELD(V7M_SCR, SLEEPONEXIT, 1, 1)
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index effc4a784ca..6f94f88a795 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -1095,8 +1095,9 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
         }
         return cpu->env.v7m.scr[attrs.secure];
     case 0xd14: /* Configuration Control.  */
-        /* The BFHFNMIGN bit is the only non-banked bit; we
-         * keep it in the non-secure copy of the register.
+        /*
+         * Non-banked bits: BFHFNMIGN (stored in the NS copy of the register)
+         * and TRD (stored in the S copy of the register)
          */
         val = cpu->env.v7m.ccr[attrs.secure];
         val |= cpu->env.v7m.ccr[M_REG_NS] & R_V7M_CCR_BFHFNMIGN_MASK;
@@ -1639,17 +1640,25 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
         cpu->env.v7m.scr[attrs.secure] = value;
         break;
     case 0xd14: /* Configuration Control.  */
+    {
+        uint32_t mask;
+
         if (!arm_feature(&cpu->env, ARM_FEATURE_M_MAIN)) {
             goto bad_offset;
         }
 
         /* Enforce RAZ/WI on reserved and must-RAZ/WI bits */
-        value &= (R_V7M_CCR_STKALIGN_MASK |
-                  R_V7M_CCR_BFHFNMIGN_MASK |
-                  R_V7M_CCR_DIV_0_TRP_MASK |
-                  R_V7M_CCR_UNALIGN_TRP_MASK |
-                  R_V7M_CCR_USERSETMPEND_MASK |
-                  R_V7M_CCR_NONBASETHRDENA_MASK);
+        mask = R_V7M_CCR_STKALIGN_MASK |
+            R_V7M_CCR_BFHFNMIGN_MASK |
+            R_V7M_CCR_DIV_0_TRP_MASK |
+            R_V7M_CCR_UNALIGN_TRP_MASK |
+            R_V7M_CCR_USERSETMPEND_MASK |
+            R_V7M_CCR_NONBASETHRDENA_MASK;
+        if (arm_feature(&cpu->env, ARM_FEATURE_V8_1M) && attrs.secure) {
+            /* TRD is always RAZ/WI from NS */
+            mask |= R_V7M_CCR_TRD_MASK;
+        }
+        value &= mask;
 
         if (arm_feature(&cpu->env, ARM_FEATURE_V8)) {
             /* v8M makes NONBASETHRDENA and STKALIGN be RES1 */
@@ -1666,6 +1675,7 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
 
         cpu->env.v7m.ccr[attrs.secure] = value;
         break;
+    }
     case 0xd24: /* System Handler Control and State (SHCSR) */
         if (!arm_feature(&cpu->env, ARM_FEATURE_V7)) {
             goto bad_offset;
-- 
2.20.1


