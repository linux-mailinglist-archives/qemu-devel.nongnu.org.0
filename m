Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E34411747
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:39:55 +0200 (CEST)
Received: from localhost ([::1]:33858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSKSY-0007pw-58
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:39:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9S-0002iv-Uj
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:10 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9D-0000nQ-PW
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:09 -0400
Received: by mail-wr1-x436.google.com with SMTP id q11so30193545wrr.9
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 07:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=habRdyVLAcbkdz94dGzbRaHOGiITwOvcI0H5zqLes+M=;
 b=LAXhi+fQp1QEnJfqWf+4nrVDwzBSr/p15ugm7iVM/8DSdtSDxLAohIJhCQ4GRKuuAu
 UY3OT2bzSI6aRtXVmG2fiBD8bWUWlH2WJTskW7erxBPUChpbBGfSQAYZArql4VcG7aod
 wKGo1fF6D5b58ide8aYg+NYRyiLRyfrEOTEDb65yl/eB0Qm3bQpotkOuD/ZltIDioiXn
 8uWtUlyvU/UQIGKI8dO0c7m5osK05Ly8xDpKTgKB5lFEv0h1ORt1+QzXP3tWRIiUOFG9
 8VEGyLLdduhYoJH4JAEKCgMzT/Ghl6oLLzdOZ84pkYit5PZtgnVOyVW+/eClCQZVVa62
 vvuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=habRdyVLAcbkdz94dGzbRaHOGiITwOvcI0H5zqLes+M=;
 b=S/0aHGoxM+n4VHTo15fyLp5YyqJak2M4Mct27uNizcGmA5HI5mEC971CSSvckv0xEp
 o5yuH+9hzIl8JmYwiAK42RfpZswwlEKhN/7NQ0SaXdXIhaCGO/ahNdm2a6ZA9pT7dtj7
 7a/HgJwwfdtd+RvF77Cm/fjRRmIPXvzl/13LGdv8PU62nCOYamWMDwRoCqZRNysPDg1B
 irNvA++ocxVlBJDQeb7zx2k4juX2RDSYeq28Fb1BagRXl/g7DiCrca7pFGHgomxf9Xwr
 ph8mu08sIBgz2wcIRalHXT8DCrNsFu1OqmuRYrL+yYWfL8uQvrevdiEbePqepKJ/BHsG
 RqvQ==
X-Gm-Message-State: AOAM533H/jrjbkq1znFi3pzmUB0IoziSWtqQN9JVh2i2nVCd+puW/66Z
 S+aqPnQL9cmWq2sfMl29lxV3hjz94gE+iQ==
X-Google-Smtp-Source: ABdhPJw8BpkqErA9FGifhom3JetaTcbRGKgeLGT6XCd3EQHHoMPOJQal33V5NGcb+UC3tSLKWvQ0og==
X-Received: by 2002:a05:600c:4c09:: with SMTP id
 d9mr16435406wmp.194.1632147593480; 
 Mon, 20 Sep 2021 07:19:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n17sm16229693wrp.17.2021.09.20.07.19.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 07:19:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/27] hw/intc: Set GIC maintenance interrupt level to only 0
 or 1
Date: Mon, 20 Sep 2021 15:19:26 +0100
Message-Id: <20210920141947.5537-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210920141947.5537-1-peter.maydell@linaro.org>
References: <20210920141947.5537-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Shashi Mallela <shashi.mallela@linaro.org>

During sbsa acs level 3 testing, it is seen that the GIC maintenance
interrupts are not triggered and the related test cases fail.  This
is because we were incorrectly passing the value of the MISR register
(from maintenance_interrupt_state()) to qemu_set_irq() as the level
argument, whereas the device on the other end of this irq line
expects a 0/1 value.

Fix the logic to pass a 0/1 level indication, rather than a
0/not-0 value.

Fixes: c5fc89b36c0 ("hw/intc/arm_gicv3: Implement gicv3_cpuif_virt_update()")
Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210915205809.59068-1-shashi.mallela@linaro.org
[PMM: tweaked commit message; collapsed nested if()s into one]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_cpuif.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 462a35f66eb..3fe5de8ad7d 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -417,8 +417,9 @@ static void gicv3_cpuif_virt_update(GICv3CPUState *cs)
         }
     }
 
-    if (cs->ich_hcr_el2 & ICH_HCR_EL2_EN) {
-        maintlevel = maintenance_interrupt_state(cs);
+    if ((cs->ich_hcr_el2 & ICH_HCR_EL2_EN) &&
+        maintenance_interrupt_state(cs) != 0) {
+        maintlevel = 1;
     }
 
     trace_gicv3_cpuif_virt_set_irqs(gicv3_redist_affid(cs), fiqlevel,
-- 
2.20.1


