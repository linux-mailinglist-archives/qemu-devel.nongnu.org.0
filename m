Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15200628D5F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:25:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouinx-0008LR-OD; Mon, 14 Nov 2022 18:23:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jens.wiklander@linaro.org>)
 id 1ouifP-0005Ez-B5
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:15:04 -0500
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jens.wiklander@linaro.org>)
 id 1ouZaP-0006Rz-Jp
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 08:33:20 -0500
Received: by mail-lj1-x22f.google.com with SMTP id s24so13166606ljs.11
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 05:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tfneRg/gsPSVQlEdifSjggr7QvzAAQiGCHa04CF2Nj4=;
 b=D4QKCpPeCgFSMTCODtX9SYWW+gkq9ep1DeKfadZD48i8WsomBOT9cli55m1ELNyGV6
 9kHzCO/PHeOxAnmSuseC+VA4LprKh3Dbx9qVpZ9cJnRTOxApd8PLfEXu8UaXB46b/sTD
 ObzZk1L/81pGki4DMiWkTRKM2PbZFk5LEMsHTgUR01QGUqf8Pf7XWXqn87j1MVhcaZDr
 5w8u5UM7vNiARvPdp7msFPBcHvkWYKa2hKGr2pjjDpDYXRPvVlBadCLEpL/qUxaXLL03
 3teltm4dWahR5K2Q+6qR6iwtc24KFCAdmswNLuoQQ1B8p2aJlhvLVUD1vVqEIVUOY5o1
 LFxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tfneRg/gsPSVQlEdifSjggr7QvzAAQiGCHa04CF2Nj4=;
 b=6Jh+1TdYWsCKXI7f/UbaxNLx3Pd/JY95BSsyqM2r0LdF/dHvuCyEfS0EtWAmdxs6FE
 QPVCYUbBiZlGc4Y2nxs3rCNxD4gT023/ezW8YTa1OCUPL+d8nQk3pQ1y6rT1HaKlV8Ty
 rrowka6eOuh2ojzrCeGrMTUESZkT540uW8EkFLSVNRHQc6/pZU/aatet01y1fsd1G2kN
 MVrsT8VTSgy7OmPxsTf5ceA2K+A6WDsKkNH5rHoz3ddfp1pdeSjy5r2grECog36kXjpE
 WkHLr++GDYc4HleU03xexZ3jqYJrGM/VXlQJafjj5F1vw9va8bSLVA5v2uwgLTBwEZzA
 qX5A==
X-Gm-Message-State: ANoB5pms+ZiQVaq3gkpO4cQpCEH/51c/GXkSZSW21BXxReYV7B+m6MWw
 8wG0Pr9j/vKGFy5F9ylfI/IkRw==
X-Google-Smtp-Source: AA0mqf6s0iVKavET9PCDmpQu4WW3PmN4JoiHS+vNpZf9U+WlCZJH7qroVqnyGTHDGh6g0rxkpMJJTA==
X-Received: by 2002:a2e:711a:0:b0:277:2f15:4179 with SMTP id
 m26-20020a2e711a000000b002772f154179mr4193619ljc.408.1668432793718; 
 Mon, 14 Nov 2022 05:33:13 -0800 (PST)
Received: from jade.urgonet (h-79-136-84-253.A175.priv.bahnhof.se.
 [79.136.84.253]) by smtp.gmail.com with ESMTPSA id
 y15-20020a05651c106f00b0027760138c53sm2006609ljm.72.2022.11.14.05.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 05:33:13 -0800 (PST)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH] hw/intc/arm_gicv3: fix prio masking on pmr write
Date: Mon, 14 Nov 2022 14:32:57 +0100
Message-Id: <20221114133257.1752176-1-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=jens.wiklander@linaro.org; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

With commit 39f29e599355 ("hw/intc/arm_gicv3: Use correct number of
priority bits for the CPU") the number of priority bits was changed from
the maximum value 8 to typically 5. As a consequence a few of the lowest
bits in ICC_PMR_EL1 becomes RAZ/WI. However prior to this patch one of
these bits was still used since the supplied priority value is masked
before it's eventually right shifted with one bit. So the bit is not
lost as one might expect when the register is read again.

The Linux kernel depends on lowest valid bit to be reset to zero, see
commit 33625282adaa ("irqchip/gic-v3: Probe for SCR_EL3 being clear
before resetting AP0Rn") for details.

So fix this by masking the priority value after it may have been right
shifted by one bit.

Fixes: 39f29e599355 ("hw/intc/arm_gicv3: Use correct number of priority bits for the CPU")
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
Hi,

I've only tested this patch on top of v7.1.0 since I couldn't get current
to run in my test setup.

In case anyone wonders what I'm testing, it's a setup with Hafnium at
S-EL2, OP-TEE at S-EL1 and the Linux kernel at NS-EL1 (no NS-EL2 for
simplicity).

Regards,
Jens

 hw/intc/arm_gicv3_cpuif.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 8ca630e5ad1e..b17b29288c73 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -1016,8 +1016,6 @@ static void icc_pmr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
     trace_gicv3_icc_pmr_write(gicv3_redist_affid(cs), value);
 
-    value &= icc_fullprio_mask(cs);
-
     if (arm_feature(env, ARM_FEATURE_EL3) && !arm_is_secure(env) &&
         (env->cp15.scr_el3 & SCR_FIQ)) {
         /* NS access and Group 0 is inaccessible to NS: return the
@@ -1029,6 +1027,7 @@ static void icc_pmr_write(CPUARMState *env, const ARMCPRegInfo *ri,
         }
         value = (value >> 1) | 0x80;
     }
+    value &= icc_fullprio_mask(cs);
     cs->icc_pmr_el1 = value;
     gicv3_cpuif_update(cs);
 }
-- 
2.31.1


