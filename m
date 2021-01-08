Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EFD2EF4F8
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 16:38:50 +0100 (CET)
Received: from localhost ([::1]:57014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxtqj-0006KR-WB
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 10:38:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtoY-0004X8-SZ
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:34 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:35316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtoX-0002ry-A8
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:34 -0500
Received: by mail-wm1-x334.google.com with SMTP id e25so8799953wme.0
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 07:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PHnQifPYkpxyN3yopYiKijmjA/1sTdlzBbc4NIn5EpQ=;
 b=HULWYQOAMxLCA0UUz3+2moD29KWcF98X71uUYyllv+KlRii4uiHBG+Q6U1+Br9mpHs
 u1J75J8mPrMrpEat/6Ye++tYYDAYp4zreD8ZENC1FPOCMHqvTXClNOIsFMbkDQQ5/HYJ
 WKDREr3hb/gKhk6PtPBNUq0vvDTkyFlJ0rvGnk1+7s/TnW9xUqYddmmLTx+LfqO4kAm1
 L6EXHTfx5+0bjFFneZIjNb++tZkw5eO206FRocAlJim9qmSWVuYdOp9Iv/Eq8lxaHGCo
 yCWzmxJh9N5zxHTr/G0txoExucn6Rq08gpoNvJECwe8uLy2uCrT9e6p5RJoJCA+Mll/u
 G5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PHnQifPYkpxyN3yopYiKijmjA/1sTdlzBbc4NIn5EpQ=;
 b=X9uO6IwKY2zBJsUP639x/9eV+VYeB/y3AAfsCbgOd6dTD9anxbt5PlXp293rODXS0X
 uIWfoipRsFrPrn+tPXcvlpb6KB/V2urhUfTmlf5C3B/dxJftM2ohsCpR8YL+TJcUB/pv
 fscbbzU+c/0hkU1NPXTtZFSKejA5Dv2qKAjVgbsppgHugYi8UCd3OYIdgTgJwoFIJiO4
 LNooDuoPHsKGSemYrAGuFC8/ExTpzP6PSgdnq8pwgu0kEIftMdrML7SO3u0qpfqIDF65
 lFabY4DRUT5cJQzqLmybUgND3rqOHIKnpddIV+xeXpkZkr0as25TW3kqaIpnkkmMtFAX
 8Z/w==
X-Gm-Message-State: AOAM5324bUVSA7AmHK4aZtJR+ukp2bD6UiWiwlUKigueNFJkO3VcRGjC
 +9PhADFVlIXZfhJUuYBCa30sN4NwVV9DGQ==
X-Google-Smtp-Source: ABdhPJwcD5BbnB+69NBBKw9zo5yCwG+1A14kdSsKZSxVDGYf3DKtDMDfYgx6TUy83KPAFwkpFTP4Hw==
X-Received: by 2002:a1c:2e88:: with SMTP id u130mr3541898wmu.83.1610120191734; 
 Fri, 08 Jan 2021 07:36:31 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f9sm15887572wrw.81.2021.01.08.07.36.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 07:36:30 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/23] target/arm: Correct store of FPSCR value via FPCXT_S
Date: Fri,  8 Jan 2021 15:36:03 +0000
Message-Id: <20210108153621.3868-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108153621.3868-1-peter.maydell@linaro.org>
References: <20210108153621.3868-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201210201433.26262-3-peter.maydell@linaro.org
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


