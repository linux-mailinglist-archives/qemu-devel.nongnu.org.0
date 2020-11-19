Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6855D2B9D8B
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 23:21:39 +0100 (CET)
Received: from localhost ([::1]:55204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfsJ8-0004gl-EE
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 17:21:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrvJ-00016h-Th
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:57:01 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:47073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrv4-0004FJ-Tm
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:57:01 -0500
Received: by mail-wr1-x443.google.com with SMTP id d12so7934300wrr.13
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 13:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=FpA8YdBjlu14/nCrS6Lp83etaqEBGx7TEBIGVpu3Jpk=;
 b=qXqI9wb6HJ6sXwzyb+WpiQCPa7hLU3IDz9099pavJn/uvGGybNrgLTFQrP0QoDkLDW
 /h+6Ofkh5P/Z06RliBmuw5Ef4cMZNULDRfeoDjza8nSuOBUA5XKURpAZB3mGBOWcdYVz
 rPuEmJNCKQm9Bo6w6t8Tzwa+7e4fspOJ7Kk1q01kHXPr+R5nAD4KM5MYto44xZsVk7zT
 E75lGDqV06qSWezP80tCU++BaQZ9KhrJadBI6xI0fF8xV/xGokc07IMz97bIKmrKPr0P
 hoo3mrQdtPSWq2OuDzvt71ISfBzw25fNr+JMaP7Pggfy5bFHAfbpRjPzz5ZlyYfQ5ra1
 WdNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FpA8YdBjlu14/nCrS6Lp83etaqEBGx7TEBIGVpu3Jpk=;
 b=TL9XMwPZi+BpRWhy7FVQsneSUCPiH/11KWlL53HC1VHZGbA57AeFJwcY6FrCsZ45XT
 jHR+1Iv0BybO9uon8+Wz2ZRs4DIF001S9rzqeaz2mKJtVM4cYB2RBuocp6MIKL+Zoc6y
 MySmuFHs7rJDJvpV2eKoF/MRYiWV4hW+2zsSn9cIrv5bCfXt1e1aYMu6NhOwpHJz9KFW
 ns8taS5dG4G6AzE2BlQh3Ag5+udJGTfJ9Oyj7IdCKQUH2JBvLCzkm+jaJpoxzN+oezY7
 hcH8QyzcF4dE3B0KpmscT86Wye/iXrrH5IpzNPBMe+j3TprBy844WP55wqbtFgdXRR3w
 fu7g==
X-Gm-Message-State: AOAM530PNqwJNTjBoo9L78GqgyAjMt7qL+TjLa63XFUWB4LY/hrxaemu
 UCLzP7ilRki1uLz6YEZ+/Y2DKJzvEOZTRw==
X-Google-Smtp-Source: ABdhPJy5FNOkj9U1o22EC4Hc53bBKhqbfOvsuTBwDhx4IAHg+P6PIfZd750odasuQNCUl8+CQwoObw==
X-Received: by 2002:a05:6000:c7:: with SMTP id
 q7mr12007763wrx.137.1605823005223; 
 Thu, 19 Nov 2020 13:56:45 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm1934851wrm.62.2020.11.19.13.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 13:56:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 22/28] hw/intc/armv7m_nvic: Support v8.1M CCR.TRD bit
Date: Thu, 19 Nov 2020 21:56:11 +0000
Message-Id: <20201119215617.29887-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119215617.29887-1-peter.maydell@linaro.org>
References: <20201119215617.29887-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x443.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v8.1M introduces a new TRD flag in the CCR register, which enables
checking for stack frame integrity signatures on SG instructions.
This bit is not banked, and is always RAZ/WI to Non-secure code.
Adjust the code for handling CCR reads and writes to handle this.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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
index deb4bd56c95..c901d20ae00 100644
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
@@ -1645,17 +1646,25 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
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
@@ -1677,6 +1686,7 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
 
         cpu->env.v7m.ccr[attrs.secure] = value;
         break;
+    }
     case 0xd24: /* System Handler Control and State (SHCSR) */
         if (!arm_feature(&cpu->env, ARM_FEATURE_V7)) {
             goto bad_offset;
-- 
2.20.1


