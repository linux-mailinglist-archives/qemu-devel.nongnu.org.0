Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 800382EF4FF
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 16:41:30 +0100 (CET)
Received: from localhost ([::1]:36936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxttJ-0001Gs-Gn
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 10:41:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtoX-0004Up-QX
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:33 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:43398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtoV-0002rm-IT
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:33 -0500
Received: by mail-wr1-x430.google.com with SMTP id y17so9399927wrr.10
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 07:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Ggk6XwbVgArtMF3BwIoGtJEK0P5cWAROytXFXCULmto=;
 b=EcpP0KliWpMITXEFV+oH2EW/1VQUi2bKwT+lbJrrEQgA6oiLtHsGDkYcuxwiJfSO0k
 WVMbEswM5401E8p8EhUWbUML9A7WGgaP0qRXQw0PX15RUxfuBh1wlMvwxnkK/oaFF09m
 QLTHrf7OPl52aY5Ie/dUx9eUwNwjX7rspUa9dM7jCrsEEbI03aNeVxNgD2skIS91d8ZG
 C0t/wV2e61SlKNkLpTkdgoJgsWzdldy0uN3lwgGZnBu89z25SH7jCS8mHA3IRtxvmNC+
 IF1q4YwOAxwZFoctbxTlgzakdGSa1Kij6oOoWIfqmJVJ0/NIPSaj0HI7ir29VeQYIQlI
 hA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ggk6XwbVgArtMF3BwIoGtJEK0P5cWAROytXFXCULmto=;
 b=lHl8A0cIp7i3cevNDJq0XkK0t5KiEj/GYqdf1EQVTZhfI5t5CUoB8O8HVCCTRVeEgz
 vlpccA+AYiS3YX34py/DjYk2ne62w65TyRLL3efTvT/2Ktu8cwXYntFf4S4TosZWTKdb
 K51SCuUl9R6BdQ6fHOxj74hfxy2qUbGV5zJLEJBEJnffF3MEIE2fTHeMEmttmDzK48uo
 kQZY+ww7YHokTUtdjjw4zKYUGo5NFD0aPnfKTcYUpb+hztb4QV2R1cusRLCiG1ryJfBS
 u3t4jRTrezjBtOrf6iu71Dd7xxKCEsJmr0aN6qigMFwIAMy0DOhRINZ14ngulYgK1KAr
 SIsQ==
X-Gm-Message-State: AOAM532r6OJ0xQm22SB6dat23vM1v+QF0mEM4awENM9CWo/bVHoRAQrp
 ISezPQBcgkMF2zqsMmSTaAM6pqX9kKSSTA==
X-Google-Smtp-Source: ABdhPJy3GXDzmY0M8jHzBLjq0U+OeCASN/7qdK7RApfj6/yxB3Xoys7ZFi46mokOtzf6jPEDPRNGow==
X-Received: by 2002:a5d:4a10:: with SMTP id m16mr4358769wrq.18.1610120190019; 
 Fri, 08 Jan 2021 07:36:30 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f9sm15887572wrw.81.2021.01.08.07.36.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 07:36:28 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/23] hw/intc/armv7m_nvic: Correct handling of CCR.BFHFNMIGN
Date: Fri,  8 Jan 2021 15:36:02 +0000
Message-Id: <20210108153621.3868-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108153621.3868-1-peter.maydell@linaro.org>
References: <20210108153621.3868-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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

The CCR is a register most of whose bits are banked between security
states but where BFHFNMIGN is not, and we keep it in the non-secure
entry of the v7m.ccr[] array.  The logic which tries to handle this
bit fails to implement the "RAZ/WI from Nonsecure if AIRCR.BFHFNMINS
is zero" requirement; correct the omission.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201210201433.26262-2-peter.maydell@linaro.org
---
 hw/intc/armv7m_nvic.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index f63aa2d8713..0d8426dafc9 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -1106,6 +1106,12 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
          */
         val = cpu->env.v7m.ccr[attrs.secure];
         val |= cpu->env.v7m.ccr[M_REG_NS] & R_V7M_CCR_BFHFNMIGN_MASK;
+        /* BFHFNMIGN is RAZ/WI from NS if AIRCR.BFHFNMINS is 0 */
+        if (!attrs.secure) {
+            if (!(cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK)) {
+                val &= ~R_V7M_CCR_BFHFNMIGN_MASK;
+            }
+        }
         return val;
     case 0xd24: /* System Handler Control and State (SHCSR) */
         if (!arm_feature(&cpu->env, ARM_FEATURE_V7)) {
@@ -1683,6 +1689,15 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
                 (cpu->env.v7m.ccr[M_REG_NS] & ~R_V7M_CCR_BFHFNMIGN_MASK)
                 | (value & R_V7M_CCR_BFHFNMIGN_MASK);
             value &= ~R_V7M_CCR_BFHFNMIGN_MASK;
+        } else {
+            /*
+             * BFHFNMIGN is RAZ/WI from NS if AIRCR.BFHFNMINS is 0, so
+             * preserve the state currently in the NS element of the array
+             */
+            if (!(cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK)) {
+                value &= ~R_V7M_CCR_BFHFNMIGN_MASK;
+                value |= cpu->env.v7m.ccr[M_REG_NS] & R_V7M_CCR_BFHFNMIGN_MASK;
+            }
         }
 
         cpu->env.v7m.ccr[attrs.secure] = value;
-- 
2.20.1


