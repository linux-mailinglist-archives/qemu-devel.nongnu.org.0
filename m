Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF61050929B
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 00:22:53 +0200 (CEST)
Received: from localhost ([::1]:44858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhIiq-0006jq-Un
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 18:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIde-000851-LQ; Wed, 20 Apr 2022 18:17:30 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33]:35912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIdd-00065k-2T; Wed, 20 Apr 2022 18:17:30 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-e5ca5c580fso3522027fac.3; 
 Wed, 20 Apr 2022 15:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tcAGPl7Du3u2iEadLbeo110VJySotasxMHkhNA552H8=;
 b=OhQRReFxNtis9G2tsErHj1hbPzN4P0JliLJpBP1s1RSN4bp/rLuVmYGPFZ7/eOdAxi
 JnGT3vlPc8q+cCxsOp09J9NoE6TiG+myhIIF5wOYl9brbirPQD0jI3QT29koCdnmloTV
 IJWs9dsE2n8LN7B/yDa2qtjcvmCROoyGy8ZLJkWidYq0du4O5D1AD33mjbE0v9Oxu6DF
 QwMIwk9i7qAcNNuzXEHr8E7N96jkvqr9Wt/kxg7VO8O0VH8e11kZEDPqCRGP0PNQTm6X
 VgEupiAk6mBpN1zpIRal2H/U3545ncJsWaLWhMViDcOGjne2zqOzruZikX24xAQQFO3n
 gjBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tcAGPl7Du3u2iEadLbeo110VJySotasxMHkhNA552H8=;
 b=vpr9Es02eEDvzRBUCIdaJ+rhX6K0HS3enG55ZiOG2jQ3prGerAsR5X4qpkD8CnxF3D
 7JPHmLTrskmLzwsfo3HzGNWDrMtFWfpOzFHDCLOtXIgrj+Uq/h8STjvLAtbyUhkaEeNJ
 m4G4Oo3mx50UAaYr7S5fZ/P2RYmEfOk+oBEj3PyrS1U2lBhqJmQQfxJl7rBCf2kpcn7a
 fnMIRjO4oOhqTXcdlXBNT5GWJYv2FvzUZeB9zUa0FX0nr5iH3/hQbIhaOP99/SxpFNI0
 Jtr0x3ck5RaTrBQd5XoIsNkrPdDUaRNR6l7egNajlPmJ356YA2mij+rH7XugP1fB7QtQ
 SieQ==
X-Gm-Message-State: AOAM533zqhTZ/VxXcRgouizt9ua+mUtAACEC2V7f5y2idOsACI/eQ7Pe
 fxa9z9dS9szy9p6RKBSNu/yC/qCYGIs=
X-Google-Smtp-Source: ABdhPJxmZqEHUZMrFVNe96wZY+F5VP3+7EqirIFtndZWWwUBeoQwA/pw6B97RTwfKFPbhyH28jBBpQ==
X-Received: by 2002:a05:6870:c88a:b0:e2:125a:809b with SMTP id
 er10-20020a056870c88a00b000e2125a809bmr2608864oab.242.1650493047345; 
 Wed, 20 Apr 2022 15:17:27 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:486c:c4fd:c4aa:a799:60c2])
 by smtp.gmail.com with ESMTPSA id
 14-20020aca110e000000b00322847e6f53sm3876082oir.46.2022.04.20.15.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 15:17:27 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/23] ppc/pnv: Remove useless checks in set_irq handlers
Date: Wed, 20 Apr 2022 19:13:13 -0300
Message-Id: <20220420221329.169755-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420221329.169755-1-danielhb413@gmail.com>
References: <20220420221329.169755-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 danielhb413@gmail.com, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220323072846.1780212-6-clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/pnv_psi.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/hw/ppc/pnv_psi.c b/hw/ppc/pnv_psi.c
index 950ecca405..98045ed3d2 100644
--- a/hw/ppc/pnv_psi.c
+++ b/hw/ppc/pnv_psi.c
@@ -219,11 +219,6 @@ static void pnv_psi_power8_set_irq(void *opaque, int irq, int state)
     uint32_t src;
     bool masked;
 
-    if (irq > PSIHB_IRQ_EXTERNAL) {
-        qemu_log_mask(LOG_GUEST_ERROR, "PSI: Unsupported irq %d\n", irq);
-        return;
-    }
-
     xivr_reg = xivr_regs[irq];
     stat_reg = stat_regs[irq];
 
@@ -813,11 +808,6 @@ static void pnv_psi_power9_set_irq(void *opaque, int irq, int state)
     PnvPsi *psi = opaque;
     uint64_t irq_method = psi->regs[PSIHB_REG(PSIHB9_INTERRUPT_CONTROL)];
 
-    if (irq > PSIHB9_NUM_IRQS) {
-        qemu_log_mask(LOG_GUEST_ERROR, "PSI: Unsupported irq %d\n", irq);
-        return;
-    }
-
     if (irq_method & PSIHB9_IRQ_METHOD) {
         qemu_log_mask(LOG_GUEST_ERROR, "PSI: LSI IRQ method no supported\n");
         return;
-- 
2.35.1


