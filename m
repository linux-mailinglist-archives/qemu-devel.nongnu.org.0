Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6172B9DA2
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 23:26:37 +0100 (CET)
Received: from localhost ([::1]:41280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfsNw-0002LR-Lg
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 17:26:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrvL-00019O-8I
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:57:03 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:41157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrv7-0004Fw-Nv
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:57:02 -0500
Received: by mail-wr1-x42a.google.com with SMTP id 23so7985344wrc.8
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 13:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hc3nzG7RWM4GF2g+cHgdNWNtIjr6cjy/0CNOT4ryRb8=;
 b=RQtwC5zInM3ITyRG2NIjSUH0Hu3QyUL7tLZMXcUmuR+TZeBRTj4LmVL/0LfLr1QX4L
 4ahWFWr9QLLLvi/ES4BZEFNgJwpVaDAOtWt2kTyoKLbOFrL9GuHuXTwszXR+4M4dR02V
 0dR6yb+HEHEbrBjqD6DoLUigEu61FnqtKzE+t74UMXNioSjfXl964TulEIthU6J1RcVw
 bb5YPS8Ye+znT1kEHjUR+1igRpZKybkG0JEhURgqKX1Pfd9zjnVxSg+bSM8Hr9Fekilz
 MsJYWwf6d++jHbl+ARCmMLSvQQYHPNOflfZSrMQ02ZkRO26bwLDN7I31iL7M+EgY3ecT
 FDvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hc3nzG7RWM4GF2g+cHgdNWNtIjr6cjy/0CNOT4ryRb8=;
 b=a/AAm997pfvg/JuJSBvqZsPbu5LUYMMB7PYDskYFt2Vf75JDEZUS+YfL7uMgfViD5o
 jA523HUbukHms3u5dMLTVJiK+J37I8VHke1IAatfRWpOVygBYhTodJN+z1NnVky1bSxy
 ikV0YCjhS4/NnzglSfKM1StPk/mjSCnso79gT4vnaZKVGIo9heK1wep41gm+dHhQAaO/
 pODfCyhLDbFz2QK6PUKpusvN63LFDfxXUMqDF3SUCY7spOmTG+iQEdZXxJ0Hdxv5ONet
 YjqIctBITEpiDCJNhhpKBq4Rvr5vGroNSueLJpzVUox4M7ShxFm2oUDjhf4ztvynUk0R
 NM5g==
X-Gm-Message-State: AOAM530Rhdq4CMaQ/hK566BSKNUGj6/xhSz1Cgq9XS+l8xbtCUwTX4Kb
 aJNP5pjFp9agLsRtg1GpE07diwwDY2D/oQ==
X-Google-Smtp-Source: ABdhPJy/u2on9eFhgXC+YN5vLUQVIz+jyBnF341YbEOOEkeBIiJ6OCnH+hlbwERipI0KNNyWHK9Q0A==
X-Received: by 2002:adf:f881:: with SMTP id u1mr13311461wrp.103.1605823008351; 
 Thu, 19 Nov 2020 13:56:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm1934851wrm.62.2020.11.19.13.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 13:56:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 25/28] target/arm: Implement M-profile "minimal RAS
 implementation"
Date: Thu, 19 Nov 2020 21:56:14 +0000
Message-Id: <20201119215617.29887-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119215617.29887-1-peter.maydell@linaro.org>
References: <20201119215617.29887-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
index fa8aeca82ec..c42b291f881 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -1489,6 +1489,12 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
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
@@ -1617,6 +1623,7 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
                               R_V7M_AIRCR_PRIGROUP_SHIFT,
                               R_V7M_AIRCR_PRIGROUP_LENGTH);
             }
+            /* AIRCR.IESB is RAZ/WI because we implement only minimal RAS */
             if (attrs.secure) {
                 /* These bits are only writable by secure */
                 cpu->env.v7m.aircr = value &
@@ -2037,6 +2044,12 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
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


