Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBC0689C01
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:37:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNx51-0006xV-1G; Fri, 03 Feb 2023 09:30:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4Y-0006ho-Mw
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:52 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4U-000566-FS
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:50 -0500
Received: by mail-wm1-x335.google.com with SMTP id o36so4020314wms.1
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VPoHsQyZBehpHPFgUeyHV4nrXZ51tWP4ro3jxrpAuIc=;
 b=yaG0Yu5edOsbec845lS2t3qRBwtEXeIORo2yyXAQD3UNqIVHBaKueJ0ppCO5rJz/Bm
 2R+dvZjHAheHH5Pfl6KgP480s7w2szbTaOSnDWIxiv0PLvgoA9d/YQQdiWAHpFem5R7B
 d+wOKqUFyDSUOkjCN04pSlzMLp5UM6QoY/opTC3oGcG2wsM1rVAkv+/LTaKhTgH7Mk7U
 VLaHwxYw+iEbZd4nDhGNG8KfU0rfNWf0NjaRtgUq5Q3y6L/qy9rLNObh+AACcIuRbh42
 tMHPa7dueOrG/EZj7T+F/QKKw71JtfdRElW5p4mSeQ4Vah331ESF7wisGtlsJN7SAXLA
 aTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VPoHsQyZBehpHPFgUeyHV4nrXZ51tWP4ro3jxrpAuIc=;
 b=BBxOHXKDjJQe/a9RQTVxJ69Z9oeawjvDDPi+3mBS7Ibq9r4WLsPWET/VErpj0Mfk34
 HFzXoGSMqhAtQuZu1k/p4Bmmi3JcR6Fy/xRbcHQu15itIpsKLF3Iwe8jzJxOrEGYm+Wq
 mCYWBfIGbWu1tGhj3TRJoZRLtIoMhMXj8rOUPfewfPtDxq6ShesyzOnvlZnWCJjXgbjT
 lCsdOx1XYq9pmjepH6toG7wXbFyMP5ubWtxV0R/VCNdNe/x4OhzQ1dQG9zV1CUZigsJk
 zYG0h6RwsnS6ddKkelrrX98NbobVa0coJsMG2sueGGv95aykiK2U1F48zQDI1XMKwpVt
 DK/w==
X-Gm-Message-State: AO0yUKX8bbfIcaZ+2dGa+SbxyDlrL1Dlpc4pTuhNiXrBQ1bX64nHiR7a
 NU+onOq5eNXJpqCPpWLNHfMYES3yDED6fm+S
X-Google-Smtp-Source: AK7set+zFaG7T8znvS3vHl01F49XTUeUFtJB642uZL15iPIFSvBAL0kc7Z5uj0h5EfOUvf4nJfVOhQ==
X-Received: by 2002:a05:600c:3c94:b0:3da:2a78:d7a4 with SMTP id
 bg20-20020a05600c3c9400b003da2a78d7a4mr9665379wmb.21.1675434581761; 
 Fri, 03 Feb 2023 06:29:41 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c130e00b003df241f52e8sm2578492wmf.42.2023.02.03.06.29.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 06:29:41 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/33] target/arm: All UNDEF-at-EL0 traps take priority over
 HSTR_EL2 traps
Date: Fri,  3 Feb 2023 14:29:09 +0000
Message-Id: <20230203142927.834793-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203142927.834793-1-peter.maydell@linaro.org>
References: <20230203142927.834793-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The HSTR_EL2 register has a collection of trap bits which allow
trapping to EL2 for AArch32 EL0 or EL1 accesses to coprocessor
registers.  The specification of these bits is that when the bit is
set we should trap
 * EL1 accesses
 * EL0 accesses, if the access is not UNDEFINED when the
   trap bit is 0

In other words, all UNDEF traps from EL0 to EL1 take precedence over
the HSTR_EL2 trap to EL2.  (Since this is all AArch32, the only kind
of trap-to-EL1 is the UNDEF.)

Our implementation doesn't quite get this right -- we check for traps
in the order:
 * no such register
 * ARMCPRegInfo::access bits
 * HSTR_EL2 trap bits
 * ARMCPRegInfo::accessfn

So UNDEFs that happen because of the access bits or because the
register doesn't exist at all correctly take priority over the
HSTR_EL2 trap, but where a register can UNDEF at EL0 because of the
accessfn we are incorrectly always taking the HSTR_EL2 trap.  There
aren't many of these, but one example is the PMCR; if you look at the
access pseudocode for this register you can see that UNDEFs taken
because of the value of PMUSERENR.EN are checked before the HSTR_EL2
bit.

Rearrange helper_access_check_cp_reg() so that we always call the
accessfn, and use its return value if it indicates that the access
traps to EL0 rather than continuing to do the HSTR_EL2 check.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Fuad Tabba <tabba@google.com>
Message-id: 20230130182459.3309057-6-peter.maydell@linaro.org
Message-id: 20230127175507.2895013-6-peter.maydell@linaro.org
---
 target/arm/op_helper.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index def5d3515e2..660dae696dd 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -640,10 +640,24 @@ const void *HELPER(access_check_cp_reg)(CPUARMState *env, uint32_t key,
         goto fail;
     }
 
+    if (ri->accessfn) {
+        res = ri->accessfn(env, ri, isread);
+    }
+
     /*
-     * Check for an EL2 trap due to HSTR_EL2. We expect EL0 accesses
-     * to sysregs non accessible at EL0 to have UNDEF-ed already.
+     * If the access function indicates a trap from EL0 to EL1 then
+     * that always takes priority over the HSTR_EL2 trap. (If it indicates
+     * a trap to EL3, then the HSTR_EL2 trap takes priority; if it indicates
+     * a trap to EL2, then the syndrome is the same either way so we don't
+     * care whether technically the architecture says that HSTR_EL2 trap or
+     * the other trap takes priority. So we take the "check HSTR_EL2" path
+     * for all of those cases.)
      */
+    if (res != CP_ACCESS_OK && ((res & CP_ACCESS_EL_MASK) == 0) &&
+        arm_current_el(env) == 0) {
+        goto fail;
+    }
+
     if (!is_a64(env) && arm_current_el(env) < 2 && ri->cp == 15 &&
         (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
         uint32_t mask = 1 << ri->crn;
@@ -661,9 +675,6 @@ const void *HELPER(access_check_cp_reg)(CPUARMState *env, uint32_t key,
         }
     }
 
-    if (ri->accessfn) {
-        res = ri->accessfn(env, ri, isread);
-    }
     if (likely(res == CP_ACCESS_OK)) {
         return ri;
     }
-- 
2.34.1


