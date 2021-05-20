Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FB238B34D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 17:33:30 +0200 (CEST)
Received: from localhost ([::1]:47210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljkfx-0003XI-JM
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 11:33:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljkbR-0007ur-5Z
 for qemu-devel@nongnu.org; Thu, 20 May 2021 11:28:49 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljkbO-0000fD-NI
 for qemu-devel@nongnu.org; Thu, 20 May 2021 11:28:48 -0400
Received: by mail-wr1-x42a.google.com with SMTP id v12so18103634wrq.6
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 08:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xk/LgAvvnfOjfZuNtHdhra7NwJBtH4H6uF2mN72rtJ0=;
 b=wUsRTHRsgrBJtxJn7OetEzWjkrUZh+C8fneyqAFZWp8r1jQgAFBQLC6E/2GzSGbwVm
 DIcZlH2Pwr88wmOxj+EemsCwgm3fqVv0q0Rzydgyj3KnBvN2xsZJG/TwHCblz32sbq+I
 RmmHNcV+FqR1pD/OcoGP+Zej18KaQ480imWrNphOHOYijFoWevjejir+iqeAa3gEZZZF
 9MTCOMo3NsSPEwyw0of8pxVkBvlTfu3a1POyvNB00d+2laZ3N0DFwbljJEymgmfsMrtd
 fIoVMpeoNwOgdgEzWwYLxMTpuCYbHN9grX3OzXmAlJUEg3jX39bv3xOIFfCt4jobrPe8
 75Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xk/LgAvvnfOjfZuNtHdhra7NwJBtH4H6uF2mN72rtJ0=;
 b=GVkJ9f2EBg9IMNVwj9fV6M4qqEkLqFHsFLmgm5ItoabCw6g3fZMIc4z5Z8vyD8pEEQ
 Xgw2vlUo4puy0X67P7Cb7ht9Pv74XWr7z94SjKYCGs0aNgxBYIqV5GttRzPFNzh0Iltm
 SajnlodiwjRPMV9Y7w/fV/gEix8s3YJNVDnOO2lc/JOQw1hwUAsTVP1EAYsxiORI9uab
 MV4MudK7LYlr+PN2W3b2JK/1BM0vqBPPJlYFOipsqB+yU9lCMuVBNbRKg+lCEtBL3MAM
 sOIP8ExhX5FJ9QHKvdpcpPeuhPTsaKuhqLRcJnrFxZV15T4K1KbupEwayMs3Q8ETz6oT
 ul0g==
X-Gm-Message-State: AOAM531PzKOrB0+0GzkUoeF9OQV8n0oXyFFgJbM2fBMgRtC2HngQ85Q7
 LufFk9Mdvh+RN2ZR2oLJ7qIoUCxW9TYDiQFX
X-Google-Smtp-Source: ABdhPJyOx/wlAJZhrp0GO5I7vWQOHxnsHalaR/CFRRH2c93Ud7735K30uc0L8aW0S+VInkH9a5xXag==
X-Received: by 2002:a05:6000:1c1:: with SMTP id
 t1mr4863891wrx.421.1621524525310; 
 Thu, 20 May 2021 08:28:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id r2sm3916126wrv.39.2021.05.20.08.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 08:28:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 4/9] target/arm: Add MVE check to VMOV_reg_sp and VMOV_reg_dp
Date: Thu, 20 May 2021 16:28:35 +0100
Message-Id: <20210520152840.24453-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210520152840.24453-1-peter.maydell@linaro.org>
References: <20210520152840.24453-1-peter.maydell@linaro.org>
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

Split out the handling of VMOV_reg_sp and VMOV_reg_dp so that we can
permit the insns if either FP or MVE are present.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 89246a284aa..ac5832a4ed5 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -2818,8 +2818,19 @@ static bool trans_VMOV_imm_dp(DisasContext *s, arg_VMOV_imm_dp *a)
         return do_vfp_2op_##PREC(s, FN, a->vd, a->vm);          \
     }
 
-DO_VFP_2OP(VMOV_reg, sp, tcg_gen_mov_i32, aa32_fpsp_v2)
-DO_VFP_2OP(VMOV_reg, dp, tcg_gen_mov_i64, aa32_fpdp_v2)
+#define DO_VFP_VMOV(INSN, PREC, FN)                             \
+    static bool trans_##INSN##_##PREC(DisasContext *s,          \
+                                      arg_##INSN##_##PREC *a)   \
+    {                                                           \
+        if (!dc_isar_feature(aa32_fp##PREC##_v2, s) &&          \
+            !dc_isar_feature(aa32_mve, s)) {                    \
+            return false;                                       \
+        }                                                       \
+        return do_vfp_2op_##PREC(s, FN, a->vd, a->vm);          \
+    }
+
+DO_VFP_VMOV(VMOV_reg, sp, tcg_gen_mov_i32)
+DO_VFP_VMOV(VMOV_reg, dp, tcg_gen_mov_i64)
 
 DO_VFP_2OP(VABS, hp, gen_helper_vfp_absh, aa32_fp16_arith)
 DO_VFP_2OP(VABS, sp, gen_helper_vfp_abss, aa32_fpsp_v2)
-- 
2.20.1


