Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBD72D5A0E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 13:11:41 +0100 (CET)
Received: from localhost ([::1]:59438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knKnM-0007cC-Tq
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 07:11:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKRB-0001lZ-Pl
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:45 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:34866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKR4-0007AS-FT
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:45 -0500
Received: by mail-wm1-x336.google.com with SMTP id e25so5001287wme.0
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 03:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lBGDqnODeEZ+VOfjvpLLt/8NFwLRd1+uKDIUVSoKz+4=;
 b=rMTYk0reR0kbgS23JU29zvjV4J2IX78kAehZ0Oq0N47NjKf9IhLGF5LSVDI7V8UK3V
 DJxEH5ja4TCzm1v3oSqHMX3HuuNEiCc1Z28UsPz/es2jSMMl69bFwsm6+Hs8uERJ2thv
 u+8BFXNyQobVPlgpvNq4qwodRiUU8iNJX8bXpkZLQoPAh2WfxYIqrpOcVLQmE5A2hbF6
 ORRJjtyYkcOPExiY+I849hfRvOxjw/6G2peljYymTy40IVRNhIlhtDvlc/VIQoMDwY6s
 L12GcFmdc3IkBUoBuHDwhFqAsJiJNEjdyQE9u84hCRsE7EnXBA8AHxmuZ+PEROIv1U5H
 Uc7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lBGDqnODeEZ+VOfjvpLLt/8NFwLRd1+uKDIUVSoKz+4=;
 b=sjhhx4XCJgJkcFiMUY+rGmnzG8swBS0pTv+Cq+6WmH3qjpf5y5v83ewmMBsh/UvC3a
 vqQPxrKLfTZrToW3ef6Vk6awKcYX6uHspGFlHhq12u4TMUxKimavZwbfdcNyQi16x3y9
 wlV63WpfGelMngHtrF/iowXujZITsade4bReT8kFSIxkYIECWNlrA4cI80KGd9kmMjrE
 7S3HQQZdW34ep65GJ5u2aTBmAhLR6l9ghL6s8gBOZDmQ3PyGKT2BjSC3rrGhuG4zErKO
 XObyjbWX7uoPdBi/TZTaF5t8vvexoMNIdB0LxWui/8854BwhLKihqbk/XtZaw6McTY9D
 OXgA==
X-Gm-Message-State: AOAM532BhBOsCPannC6QmdFnLXfYywmev6LU3P9b8kwJJ5Irv4YZ42oK
 bWsf874eRqMQe2UiEA3yPNKZHjMyxygjZg==
X-Google-Smtp-Source: ABdhPJyV+gsSRufd/pHicFiV27GE/lNvZZUDwzinPt/4d6PHXREo4EjeicB9kg6uMhK0uAC1quYvtQ==
X-Received: by 2002:a05:600c:cc:: with SMTP id
 u12mr7952993wmm.42.1607600916913; 
 Thu, 10 Dec 2020 03:48:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g192sm9304725wme.48.2020.12.10.03.48.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 03:48:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 34/36] target/arm: Implement M-profile "minimal RAS
 implementation"
Date: Thu, 10 Dec 2020 11:47:54 +0000
Message-Id: <20201210114756.16501-35-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210114756.16501-1-peter.maydell@linaro.org>
References: <20201210114756.16501-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

For v8.1M the architecture mandates that CPUs must provide at
least the "minimal RAS implementation" from the Reliability,
Availability and Serviceability extension. This consists of:
 * an ESB instruction which is a NOP
   -- since it is in the HINT space we need only add a comment
 * an RFSR register which will RAZ/WI
 * a RAZ/WI AIRCR.IESB bit
   -- the code which handles writes to AIRCR does not allow setting
      of RES0 bits, so we already treat this as RAZ/WI; add a comment
      noting that this is deliberate
 * minimal implementation of the RAS register block at 0xe0005000
   -- this will be in a subsequent commit
 * setting the ID_PFR0.RAS field to 0b0010
   -- we will do this when we add the Cortex-M55 CPU model

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201119215617.29887-26-peter.maydell@linaro.org
---
 target/arm/cpu.h      | 14 ++++++++++++++
 target/arm/t32.decode |  4 ++++
 hw/intc/armv7m_nvic.c | 13 +++++++++++++
 3 files changed, 31 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 22c55c81933..7e6c881a7e2 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1827,6 +1827,15 @@ FIELD(ID_MMFR4, LSM, 20, 4)
 FIELD(ID_MMFR4, CCIDX, 24, 4)
 FIELD(ID_MMFR4, EVT, 28, 4)
 
+FIELD(ID_PFR0, STATE0, 0, 4)
+FIELD(ID_PFR0, STATE1, 4, 4)
+FIELD(ID_PFR0, STATE2, 8, 4)
+FIELD(ID_PFR0, STATE3, 12, 4)
+FIELD(ID_PFR0, CSV2, 16, 4)
+FIELD(ID_PFR0, AMU, 20, 4)
+FIELD(ID_PFR0, DIT, 24, 4)
+FIELD(ID_PFR0, RAS, 28, 4)
+
 FIELD(ID_PFR1, PROGMOD, 0, 4)
 FIELD(ID_PFR1, SECURITY, 4, 4)
 FIELD(ID_PFR1, MPROGMOD, 8, 4)
@@ -3573,6 +3582,11 @@ static inline bool isar_feature_aa32_predinv(const ARMISARegisters *id)
     return FIELD_EX32(id->id_isar6, ID_ISAR6, SPECRES) != 0;
 }
 
+static inline bool isar_feature_aa32_ras(const ARMISARegisters *id)
+{
+    return FIELD_EX32(id->id_pfr0, ID_PFR0, RAS) != 0;
+}
+
 static inline bool isar_feature_aa32_mprofile(const ARMISARegisters *id)
 {
     return FIELD_EX32(id->id_pfr1, ID_PFR1, MPROGMOD) != 0;
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index f045eb62c84..8b2c487fa7a 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -307,6 +307,10 @@ CLZ              1111 1010 1011 ---- 1111 .... 1000 ....      @rdm
       # SEV      1111 0011 1010 1111 1000 0000 0000 0100
       # SEVL     1111 0011 1010 1111 1000 0000 0000 0101
 
+      # For M-profile minimal-RAS ESB can be a NOP, which is the
+      # default behaviour since it is in the hint space.
+      # ESB      1111 0011 1010 1111 1000 0000 0001 0000
+
       # The canonical nop ends in 0000 0000, but the whole rest
       # of the space is "reserved hint, behaves as nop".
       NOP        1111 0011 1010 1111 1000 0000 ---- ----
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index cf233c05616..01e331ab1e4 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -1483,6 +1483,12 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
             return 0;
         }
         return cpu->env.v7m.sfar;
+    case 0xf04: /* RFSR */
+        if (!cpu_isar_feature(aa32_ras, cpu)) {
+            goto bad_offset;
+        }
+        /* We provide minimal-RAS only: RFSR is RAZ/WI */
+        return 0;
     case 0xf34: /* FPCCR */
         if (!cpu_isar_feature(aa32_vfp_simd, cpu)) {
             return 0;
@@ -1611,6 +1617,7 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
                               R_V7M_AIRCR_PRIGROUP_SHIFT,
                               R_V7M_AIRCR_PRIGROUP_LENGTH);
             }
+            /* AIRCR.IESB is RAZ/WI because we implement only minimal RAS */
             if (attrs.secure) {
                 /* These bits are only writable by secure */
                 cpu->env.v7m.aircr = value &
@@ -2026,6 +2033,12 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
         }
         break;
     }
+    case 0xf04: /* RFSR */
+        if (!cpu_isar_feature(aa32_ras, cpu)) {
+            goto bad_offset;
+        }
+        /* We provide minimal-RAS only: RFSR is RAZ/WI */
+        break;
     case 0xf34: /* FPCCR */
         if (cpu_isar_feature(aa32_vfp_simd, cpu)) {
             /* Not all bits here are banked. */
-- 
2.20.1


