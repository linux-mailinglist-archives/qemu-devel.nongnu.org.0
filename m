Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFE94612C4
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 11:44:08 +0100 (CET)
Received: from localhost ([::1]:40570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mre8m-0001fX-1E
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 05:44:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mre4B-0002OP-DS
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 05:39:23 -0500
Received: from [2a00:1450:4864:20::42b] (port=37472
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mre49-0004n6-GO
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 05:39:23 -0500
Received: by mail-wr1-x42b.google.com with SMTP id d9so14818069wrw.4
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 02:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=OjFLH2BFS+yCBbLcJauIqCZyc8Dqk6KrwSVe0yu3cfA=;
 b=NXANIftrw3uInIBAD1R0OaYw2tWvSd9V42K+gxpQw9e6lj0IG5FIEe7FVV6OQ+ZPqg
 lUehKs3kKrccq2S9ndKvJA/6eSt8ZNADAKczz6sIceBGvoHZlAl3YbuXCNpGcSVF2NbW
 RduR63oXxGWuw0iSLU6ynVZZEsbWFu18TOjNLuw4kngoT7g6SJRtsVKNKIN567iB4sWf
 2/btmxchs4AM2eimh3aMyLPLVP8SvI6CMxx9bGdaoN3InB7/5kIOExS3z2SaT0ffkLvS
 1wliglJycSuMrIJsd7L2+GqaXMQEZS+2vu1Mz5UebOwwaJ/b+ACdjSV0RfROEzHXUvOi
 ttFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OjFLH2BFS+yCBbLcJauIqCZyc8Dqk6KrwSVe0yu3cfA=;
 b=muksfQ9+08QoGeRjbjYwlCnPbSDTCEIAIBHt2PN2cENXtXjeySoriWg+WnYXXex34O
 H5R78RvZZ8dRuybzCE4RzvU73o260EXUkjRT5smCiQWvvXrA7FvHAEs3xnau8e7Lv+tb
 8i9hawL2nNS59QPpxGwcoRunlJ2zMEAsXZt0E5Yf3cNQ35sBujmZnYTK+iUrAi+FiYhQ
 npmBZguejXTrIQDeYEKcJm0nKfG4Ng/7kdhlcRmbc88uYqMl3xy8Y7bZyFj0yA0C3nIL
 4PD/qPHKIep1G1/YZhFUWDeN2Oy/cbv7v9htHdn+7TOvZUDimmNlqFSUZViu67S5RHP7
 f/SQ==
X-Gm-Message-State: AOAM53269jFrrZ4HUkIr+ku68wpdF+UXn6EkQTz3Kvjn5B0xr3nhjpPi
 fYR7DgcoGyWrCmlm/v3PU/jOtfIPIjUx+w==
X-Google-Smtp-Source: ABdhPJzWfTdnqrCqhPY4sgpajujtncgsSYtvpSeX+gwBuQuZM3TSd+6TNwmcjtv4lMTDhoFX1dVJAg==
X-Received: by 2002:a5d:4b45:: with SMTP id w5mr33316013wrs.272.1638182360215; 
 Mon, 29 Nov 2021 02:39:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t17sm18810912wmq.15.2021.11.29.02.39.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 02:39:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 5/5] hw/intc/arm_gicv3: fix handling of LPIs in list registers
Date: Mon, 29 Nov 2021 10:39:15 +0000
Message-Id: <20211129103915.1162989-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129103915.1162989-1-peter.maydell@linaro.org>
References: <20211129103915.1162989-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

It is valid for an OS to put virtual interrupt ID values into the
list registers ICH_LR<n> which are greater than 1023.  This
corresponds to (for example) KVM using the in-kernel emulated ITS to
give a (nested) guest an ITS.  LPIs are delivered by the L1 kernel to
the L2 guest via the list registers in the same way as non-LPI
interrupts.

QEMU's code for handling writes to ICV_IARn (which happen when the L2
guest acknowledges an interrupt) and to ICV_EOIRn (which happen at
the end of the interrupt) did not consider LPIs, so it would
incorrectly treat interrupt IDs above 1023 as invalid.  Fix this by
using the correct condition, which is gicv3_intid_is_special().

Note that the condition in icv_dir_write() is correct -- LPIs
are not valid there and so we want to ignore both "special" ID
values and LPIs.

(In the pseudocode this logic is in:
 - VirtualReadIAR0(), VirtualReadIAR1(), which call IsSpecial()
 - VirtualWriteEOIR0(), VirtualWriteEOIR1(), which call
     VirtualIdentifierValid(data, TRUE) meaning "LPIs OK"
 - VirtualWriteDIR(), which calls VirtualIdentifierValid(data, FALSE)
     meaning "LPIs not OK")

This bug doesn't seem to have any visible effect on Linux L2 guests
most of the time, because the two bugs cancel each other out: we
neither mark the interrupt active nor deactivate it.  However it does
mean that the L2 vCPU priority while the LPI handler is running will
not be correct, so the interrupt handler could be unexpectedly
interrupted by a different interrupt.

(NB: this has nothing to do with using QEMU's emulated ITS.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Marc Zyngier <maz@kernel.org>
---
 hw/intc/arm_gicv3_cpuif.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 7fbc36ff41b..7fba9314508 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -653,7 +653,7 @@ static uint64_t icv_iar_read(CPUARMState *env, const ARMCPRegInfo *ri)
 
         if (thisgrp == grp && icv_hppi_can_preempt(cs, lr)) {
             intid = ich_lr_vintid(lr);
-            if (intid < INTID_SECURE) {
+            if (!gicv3_intid_is_special(intid)) {
                 icv_activate_irq(cs, idx, grp);
             } else {
                 /* Interrupt goes from Pending to Invalid */
@@ -1265,8 +1265,7 @@ static void icv_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
     trace_gicv3_icv_eoir_write(ri->crm == 8 ? 0 : 1,
                                gicv3_redist_affid(cs), value);
 
-    if (irq >= GICV3_MAXIRQ) {
-        /* Also catches special interrupt numbers and LPIs */
+    if (gicv3_intid_is_special(irq)) {
         return;
     }
 
-- 
2.25.1


