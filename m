Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3840939A543
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:04:42 +0200 (CEST)
Received: from localhost ([::1]:35080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loppn-0000fH-SE
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:04:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkX-0007t2-Ps
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:13 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkV-0006mE-Dg
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:13 -0400
Received: by mail-wr1-x42c.google.com with SMTP id n4so6397515wrw.3
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wXISN6ZA+fySx1Wmxbs/iMnId7qOVgagiX+zub5wUmg=;
 b=zk51MTlVlN51i/S29XnhvUR3UaV/nturN8OZmIJUsffHc2eQS6HUc09Jn4/r35YVse
 q/NiURmi6ZaXFLyFeK9M0JGSl5z3dQKNk+hKzCmRDs/cawTNChbwjRo3cNtxayMQiB9G
 FmGUuckwYnRHdKRdT+NG6O2VKPQUzgIyjzEESadiRjpCHsBervs5dphT0U4xtfDwNbpR
 WWAF62nX7Mb4Ig8rVBDgEO9x1ZfQWAaZI79AkXPBQoPfH4KnbcXbMz375IE/lpxxEsdP
 AyczDa/LxA+vCIpTGTvgqbDIQ3EpOB/Zf2ProUGbOb6advMBmZtFmiTJBlxgh2qOiBPB
 EKUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wXISN6ZA+fySx1Wmxbs/iMnId7qOVgagiX+zub5wUmg=;
 b=n34vpYXeSrEHfeQ84wzoWRWiLohraXPOZdP+FL4hNVjjFFS3qtYK26ZsvuF9d1l4je
 HDEj0WaHSb5BayJP/CcIfyCsUiBbDvlgrU9QqR1y/Kq0tZfGn+Gas3lXq9GhdDRmXkIa
 qvqdeU9Xf/EbB3l8ptKJKcV/RKS3eSEtYulA1mP6nOmKakVMkiVBXCjGYxwXZkXD3p+6
 v1OyjMafcmljRzpWbzswJzifbL3sxQrRLLg5XCeWMEysF8cdGtOxazyyNyOBbtnYPK43
 0pcPoKDndEBUCGyOboBsYWpaGUgHJ+U6aFesrGT4JiOkWJQpgdVq0ptkc6KuARQL0kWr
 3Oog==
X-Gm-Message-State: AOAM5333feK8tX7TFA5tusZM5BXDz5t3heMXejqDVVtLrfdDBJOzlIL9
 LFAFFHshY49QtSFQp8v9RkrY0EE0WrwYGAJX
X-Google-Smtp-Source: ABdhPJy3d8T+Q+j7lerHiObg1LrTOaMTrypDWa2NtLLPvjFaZVSgSrxgNqv5J1Aly0C7bfzy7Kn2qA==
X-Received: by 2002:adf:fbce:: with SMTP id d14mr626217wrs.201.1622735950031; 
 Thu, 03 Jun 2021 08:59:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/45] target/arm: Add MVE check to VMOV_reg_sp and VMOV_reg_dp
Date: Thu,  3 Jun 2021 16:58:23 +0100
Message-Id: <20210603155904.26021-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
References: <20210603155904.26021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210520152840.24453-5-peter.maydell@linaro.org
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


