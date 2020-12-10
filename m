Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9081A2D6891
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 21:22:24 +0100 (CET)
Received: from localhost ([::1]:34672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knSSF-0003NI-KU
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 15:22:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knSKn-0007WX-Uf
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 15:14:41 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:51836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knSKl-000113-Qs
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 15:14:41 -0500
Received: by mail-wm1-x343.google.com with SMTP id v14so5755069wml.1
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 12:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=4JszHbEHPGhqf66CxwuYFej6f7p+30mZ+/vaBICvo3g=;
 b=m5NsZuccYFf8exaynJ+yABK0pfeETDKhzKSpS5DPcxtiHSf26B4PPTZg7tmG2NbV/L
 nW6AiEM5WXsrHOTKRc9+qb9Vcbhh9+RSJ7f9OOKly4lVycDlU/0Ch/Og/FAjTM492KvT
 /tPTWplWfjdg/CsP8NX5+GAAs5yuq7xQ7+XuAkJ1wmJwpE8a7Q2wAeM0S43H35INvDYa
 TLB+qDvyOiEG7UmuqEom0LeyPL0M/+P5FdomZYnAwpE8TioVr2/Kf0f89YTcX4WZft9B
 iYh6iiuYydhajfusrC+jwrVQabeRga+P/r9OOzhmgzcF2xifARWUCWIWOATDgZF7h/T1
 rnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4JszHbEHPGhqf66CxwuYFej6f7p+30mZ+/vaBICvo3g=;
 b=cwx8IbrAn7CC4vSXw8aXDW9PlBE0ZGpn4C/rqyQdr4ND7UcZL8mgan4jNPMsCkL3Jy
 8XegqCq6QEeKC82/EQbsIj14I3DrdHVNksK1bohm37wuFtKIdzeCey3qrxWbUUxWFsTA
 KL91Z7pEh6UUFsjZ7Aka/qhuouM5KtjnquOR5XTFLJbq7c0ub38p975CGfxylU7bxWEK
 9OqgmvlsT8JRXa9g9FpEMATw5O8pEv7OnDc6Bp4AN+n3c6ovvbiaCoKD80+yq0S8kSUb
 c4vWsmnIRBGmtu7fSUq1fDjYOkAk+VaLu/XdxB+wuosuSR1uVIjlFVGJu9pEWuLWDWQO
 0efA==
X-Gm-Message-State: AOAM5311idBjzboYbWgjk7FISImfazuPv07X0XNW5NT9EuQUHaM74T0Z
 RsV0P9pCO/Y1NO6BAh1SIcPuLXGhbAPKAA==
X-Google-Smtp-Source: ABdhPJxiS0Yuxg0z5HMfstOJGCor3x61aS8Z8lAK38dr268sto7Pejl7hQc9IO2nM6i7ZuEBPVPn6g==
X-Received: by 2002:a1c:4156:: with SMTP id o83mr9938467wma.178.1607631278283; 
 Thu, 10 Dec 2020 12:14:38 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y130sm11879591wmc.22.2020.12.10.12.14.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 12:14:37 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/4] target/arm: Correct store of FPSCR value via FPCXT_S
Date: Thu, 10 Dec 2020 20:14:31 +0000
Message-Id: <20201210201433.26262-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210201433.26262-1-peter.maydell@linaro.org>
References: <20201210201433.26262-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x343.google.com
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

In commit 64f863baeedc8659 we implemented the v8.1M FPCXT_S register,
but we got the write behaviour wrong. On read, this register reads
bits [27:0] of FPSCR plus the CONTROL.SFPA bit. On write, it doesn't
just write back those bits -- it writes a value to the whole FPSCR,
whose upper 4 bits are zeroes.

We also incorrectly implemented the write-to-FPSCR as a simple store
to vfp.xregs; this skips the "update the softfloat flags" part of
the vfp_set_fpscr helper so the value would read back correctly but
not actually take effect.

Fix both of these things by doing a complete write to the FPSCR
using the helper function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.c.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 0db936084bd..8b4cfd68cad 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -723,8 +723,11 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
     }
     case ARM_VFP_FPCXT_S:
     {
-        TCGv_i32 sfpa, control, fpscr;
-        /* Set FPSCR[27:0] and CONTROL.SFPA from value */
+        TCGv_i32 sfpa, control;
+        /*
+         * Set FPSCR and CONTROL.SFPA from value; the new FPSCR takes
+         * bits [27:0] from value and zeroes bits [31:28].
+         */
         tmp = loadfn(s, opaque);
         sfpa = tcg_temp_new_i32();
         tcg_gen_shri_i32(sfpa, tmp, 31);
@@ -732,11 +735,8 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
         tcg_gen_deposit_i32(control, control, sfpa,
                             R_V7M_CONTROL_SFPA_SHIFT, 1);
         store_cpu_field(control, v7m.control[M_REG_S]);
-        fpscr = load_cpu_field(vfp.xregs[ARM_VFP_FPSCR]);
-        tcg_gen_andi_i32(fpscr, fpscr, FPCR_NZCV_MASK);
         tcg_gen_andi_i32(tmp, tmp, ~FPCR_NZCV_MASK);
-        tcg_gen_or_i32(fpscr, fpscr, tmp);
-        store_cpu_field(fpscr, vfp.xregs[ARM_VFP_FPSCR]);
+        gen_helper_vfp_set_fpscr(cpu_env, tmp);
         tcg_temp_free_i32(tmp);
         tcg_temp_free_i32(sfpa);
         break;
-- 
2.20.1


