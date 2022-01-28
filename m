Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 107D349FD20
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 16:51:14 +0100 (CET)
Received: from localhost ([::1]:58318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDTWq-0003uZ-5g
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 10:51:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTDD-0002B4-C6
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:30:58 -0500
Received: from [2a00:1450:4864:20::335] (port=36642
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTD0-0006QQ-3B
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:30:48 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d2ed1be2aso8467013wma.1
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 07:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=D4/JY7YnGKUGzScyxUteDIAudBSMtW8ARwUhsJowhg4=;
 b=iVSvz6xI8L4CLmJPIcmbJ5g+WMSqLX18fT/913n8G0H/mgvypWn23WAYVz3gl/SgZo
 DNfPEgJJ7D/3TRF8RAoaIMQWd3PJFduPEUbQsVe+a3uUBGfuKknx5gfn5J8RbWjkHCpF
 LVwyQqqSpybBLyEJ4bmoXHmo+IVGgjIac42jF7PMcHiuoswNTmcaBxJlHmb6/pEJg9/a
 ZeMzUJMSQWMzqChFFajLd0o7faHnca6VPk+BEeGwOqzz7zTczftmQmiKsMkF24iTDNfR
 Zr0tZYaaA4Q37HqSBq72SwUhUHhNWbckF+y5R3PMw0lM2y98cz6wNxpHq37R6Cvbo9jh
 4opA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D4/JY7YnGKUGzScyxUteDIAudBSMtW8ARwUhsJowhg4=;
 b=cQnx8PqV57HBYHsV48V3gfq3wGQLPI96hGZ1WaPVujuynFKuc2/c7dD55Fuu1IQWnv
 JM0NifgMZgZjQFpaIIDon5brR/MLE/gAiH2MRLUUODhL8csxaT2kzajkDHJssqEmLowR
 RNvQyN785a9rUeYSt0tX4bmr297fS0uNS8HPsTofs41ywea49Mx1pZ/VEYCaX1igRhW0
 H1kKiOAbHoiM3/4+Q2gLUow+kU6Ulwe9jzR/mKUm6AwFVeQjpqgjdwAZ62z54v0AO3Rl
 Puu6pahMxrHsB1+fRfDNbGl0n23+tpxYCA3MfGgqFNx+f+VObA3OPKCHxluFBjeMAxrh
 lXtQ==
X-Gm-Message-State: AOAM531IuQ3KU/g/iEQHev2moqwBI5CpjdANF9fyRiMc1EvmIzzLzdZ0
 C9eJ3M0iAFA3VPwHeAhX/VcTKiem4OP0QA==
X-Google-Smtp-Source: ABdhPJxrIzHCX7w0lmrijQHb0Cuek+ftrn+N7bQmLQ9lGhAiymDfRaVOBneWHUplSQkdYvEOkH4e7A==
X-Received: by 2002:a05:600c:22c3:: with SMTP id
 3mr7681057wmg.21.1643383835877; 
 Fri, 28 Jan 2022 07:30:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id j3sm4749485wrb.57.2022.01.28.07.30.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 07:30:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/32] hw/intc/arm_gicv3: Honour GICD_CTLR.EnableGrp1NS for LPIs
Date: Fri, 28 Jan 2022 15:29:59 +0000
Message-Id: <20220128153009.2467560-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128153009.2467560-1-peter.maydell@linaro.org>
References: <20220128153009.2467560-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The GICD_CTLR distributor register has enable bits which control
whether the different interrupt groups (Group 0, Non-secure Group 1
and Secure Group 1) are forwarded to the CPU.  We get this right for
traditional interrupts, but forgot to account for it when adding
LPIs.  LPIs are always Group 1 NS and if the EnableGrp1NS bit is not
set we must not forward them to the CPU.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220122182444.724087-7-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index 715df5421dd..6d3c8ee231c 100644
--- a/hw/intc/arm_gicv3.c
+++ b/hw/intc/arm_gicv3.c
@@ -166,6 +166,7 @@ static void gicv3_redist_update_noirqset(GICv3CPUState *cs)
     }
 
     if ((cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) && cs->gic->lpi_enable &&
+        (cs->gic->gicd_ctlr & GICD_CTLR_EN_GRP1NS) &&
         (cs->hpplpi.prio != 0xff)) {
         if (irqbetter(cs, cs->hpplpi.irq, cs->hpplpi.prio)) {
             cs->hppi.irq = cs->hpplpi.irq;
-- 
2.25.1


