Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F9E3F88F3
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 15:29:11 +0200 (CEST)
Received: from localhost ([::1]:55118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJFRJ-0002Ec-Iy
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 09:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFG9-0005h9-TC
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:17:33 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFG6-0004uq-SA
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:17:33 -0400
Received: by mail-wr1-x435.google.com with SMTP id h4so5015796wro.7
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 06:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=i35Lsr/dn1GODrzYN0U582ydyfLQGp/hvCXCCo2NUrA=;
 b=vaNMDH3KI+7Ye0fdPLWsSE+pVz+xGjaivRVCqR2pfr73Wfy7AlQHLUJchnmy9ibp5F
 nGMGepYLZMAJQiqK7KD0Ac7N8VSXhUGJGrgKYlG9T9YAcXuNlbY++C0y4GjWGtV0OhYh
 Plw5KGG9c3MirogKm5g+NnS8epq2K+Cvojky0sVNcDZ3+2KukQgHZZPkzRz0rylZpDlf
 1nFvGnBWHENDrr6YzJ6CWmFbhh314vq3UD2NXLWacqgJ0BYXz+3GRUMKi71LtOVJAmVU
 BqrWDsUUkc55I4uPQVu1L9khf4kkwBDzkfZ83ihAK64wVlLjmfmRrfcQmXpC0ZifMYZA
 nedA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i35Lsr/dn1GODrzYN0U582ydyfLQGp/hvCXCCo2NUrA=;
 b=ODws34BozWYbPMmCXvjay8yE5A8rWkvF5yXAycC/moD10j1wyel6IbwBkqqDp8ObYJ
 tK6IJsQ2tEut9yQIhPUpLsX10VDGpd/bZxBl+gA2+TKyoLnlIeQJB/XWdUgBOrhDQPuX
 70y5+lVEDKYQywuWsW2G9Ukthtpbb7q86zEtdfGCYlYfi4JEfTZ3g1SdmYJUTWMMywwI
 WQMMDq99+DBqAo9W9J0ajYtLHRWqPhfp6tG1gqokoMIATtytm1w8mOwG35NYplIAvtYX
 bhIqj+QD02xERKI0sSkebTrFB0W7egeOV2D11VTK8+IcLmbykdrZb/caGAD3swicCDw6
 TwAQ==
X-Gm-Message-State: AOAM5322gHkTpoOEvofTd7S0AqoTK3gP4Wf+OKVB+qPJ9nWVxoFkyVZr
 LlKADGDa0ezr1W2gpeEukijHSg==
X-Google-Smtp-Source: ABdhPJxRnUA0Bc0cnFCED3/cw2XQ4DYq6vHfqCs5SYjZcnXMd0f418BvwaQ9LRkUwefgwWgdjercIA==
X-Received: by 2002:a05:6000:234:: with SMTP id
 l20mr3908366wrz.359.1629983849374; 
 Thu, 26 Aug 2021 06:17:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i17sm1341908wrc.38.2021.08.26.06.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 06:17:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 02/18] target/arm: Implement MVE VSUB, VMUL, VABD, VMAXNM,
 VMINNM
Date: Thu, 26 Aug 2021 14:17:09 +0100
Message-Id: <20210826131725.22449-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826131725.22449-1-peter.maydell@linaro.org>
References: <20210826131725.22449-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Implement more simple 2-operand floating point MVE insns.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
v1->v2: use DO_2OP_FP_ALL
---
 target/arm/helper-mve.h    | 15 +++++++++++++++
 target/arm/mve.decode      |  6 ++++++
 target/arm/mve_helper.c    | 16 ++++++++++++++++
 target/arm/translate-mve.c |  5 +++++
 4 files changed, 42 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 32fd2e1f9be..370876d7934 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -413,6 +413,21 @@ DEF_HELPER_FLAGS_4(mve_vhcadd270w, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vfaddh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vfadds, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vfsubh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vfsubs, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vfmulh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vfmuls, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vfabdh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vfabds, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vmaxnmh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmaxnms, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vminnmh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vminnms, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index e211cb016c6..cdbfaa4245b 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -625,3 +625,9 @@ VCMPLE_scalar     1111 1110 0 . .. ... 1 ... 1 1111 1 1 1 0 .... @vcmp_scalar
 
 # 2-operand FP
 VADD_fp           1110 1111 0 . 0 . ... 0 ... 0 1101 . 1 . 0 ... 0 @2op_fp
+VSUB_fp           1110 1111 0 . 1 . ... 0 ... 0 1101 . 1 . 0 ... 0 @2op_fp
+VMUL_fp           1111 1111 0 . 0 . ... 0 ... 0 1101 . 1 . 1 ... 0 @2op_fp
+VABD_fp           1111 1111 0 . 1 . ... 0 ... 0 1101 . 1 . 0 ... 0 @2op_fp
+
+VMAXNM            1111 1111 0 . 0 . ... 0 ... 0 1111 . 1 . 1 ... 0 @2op_fp
+VMINNM            1111 1111 0 . 1 . ... 0 ... 0 1111 . 1 . 1 ... 0 @2op_fp
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index abca7c0b2ab..d6bc686c985 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -2838,3 +2838,19 @@ DO_VMAXMINA(vminaw, 4, int32_t, uint32_t, DO_MIN)
     DO_2OP_FP(OP##s, 4, float32, float32_##FN)
 
 DO_2OP_FP_ALL(vfadd, add)
+DO_2OP_FP_ALL(vfsub, sub)
+DO_2OP_FP_ALL(vfmul, mul)
+
+static inline float16 float16_abd(float16 a, float16 b, float_status *s)
+{
+    return float16_abs(float16_sub(a, b, s));
+}
+
+static inline float32 float32_abd(float32 a, float32 b, float_status *s)
+{
+    return float32_abs(float32_sub(a, b, s));
+}
+
+DO_2OP_FP_ALL(vfabd, abd)
+DO_2OP_FP_ALL(vmaxnm, maxnum)
+DO_2OP_FP_ALL(vminnm, minnum)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index d2c40ede564..98282335820 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -847,6 +847,11 @@ static bool trans_VSBCI(DisasContext *s, arg_2op *a)
     }
 
 DO_2OP_FP(VADD_fp, vfadd)
+DO_2OP_FP(VSUB_fp, vfsub)
+DO_2OP_FP(VMUL_fp, vfmul)
+DO_2OP_FP(VABD_fp, vfabd)
+DO_2OP_FP(VMAXNM, vmaxnm)
+DO_2OP_FP(VMINNM, vminnm)
 
 static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
                           MVEGenTwoOpScalarFn fn)
-- 
2.20.1


