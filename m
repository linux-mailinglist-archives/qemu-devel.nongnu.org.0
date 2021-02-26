Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B76325C68
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 05:13:38 +0100 (CET)
Received: from localhost ([::1]:56304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFUVV-0002Ex-1c
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 23:13:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTkB-0002j1-8O
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:24:44 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:51164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTk8-0002fu-SP
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:24:42 -0500
Received: by mail-pj1-x1036.google.com with SMTP id b15so5197253pjb.0
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 19:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=904MHIB6dwGdUnT5Mu+K6agQSSFZ5G7aY9j9XtwICcA=;
 b=MbqxRMYVY70pLZsf4MrTzWcSfy9BDfmOjkq1Jv+tBlOUmcCP/UMfi+0yznRu5DhOqs
 jhXF6JAnrtIpDu7Bz3/6zGFAsboba1Kon1Pigp3icToRNsgammjGRysk9je0DSt0J5Qq
 iaqJHLEpXlpWQLpM0s46oVMQs78m7hsM55JMd8jzS1uCqR1/Z4Z9wACkG1hHkFxSnd0Q
 SdScNeyNSDlf+nndV4Lp/64TU6DzgEW0JBcqOe4qPso6HoW7XiV7XEzB1kl7vSaBtPKt
 XCzXgAw1rY/Kh8TrOY+2f9GIpeKVyLR4qBQJXFUl4kwDtDZ2yjE0CYwmdMqFmlJRa5Ye
 AxSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=904MHIB6dwGdUnT5Mu+K6agQSSFZ5G7aY9j9XtwICcA=;
 b=dpNB5CpclzTPQCRwnHkG/1/jetjtQR2e+mLqKIYDzI5/mHVAspN2eLAhqLEmLwoOOJ
 rUhdSSXkLH5IcKvBcQEjwhompn/KwcYRljNjW+TsJGeWOR67REN0RSbhY+7ALJfPckSz
 KOo5W0AcpAEKQkUvTqt5AtXnT2CvpjrdXXc/8xvkFH5k5n89unMNnXECQyjOOIB5bDQO
 E1UK2oQbE0MM2HYZtsdLtpRR3Kk2eSunaO9fMplEqSiBlRzQ9MG7+ykFNZMWfV/bEQS1
 +NkC1N5vCjltvN+ChG7DwB25h6/qE6Akde9mkzzMKS3HP27cb/wRisOkYLvpKIwgFUuV
 kTkA==
X-Gm-Message-State: AOAM533s/K4iNFfxf3qX1QA/vBpR750uHZIqydYcrpt2dnVKq2bYuAE7
 83w1lfp2prb+omJl7qEjkUe9RceZsm7RPw==
X-Google-Smtp-Source: ABdhPJwt5sUL0Wu+Kpi2vxOSoSoDkoJBcekF4BNuKIVETymIacYFa34GvRWZynK8a+vOgQJGBtlGOg==
X-Received: by 2002:a17:90a:d70b:: with SMTP id
 y11mr1221120pju.230.1614309878978; 
 Thu, 25 Feb 2021 19:24:38 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:24:38 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 58/75] target/riscv: rvv-1.0: floating-point min/max
 instructions
Date: Fri, 26 Feb 2021 11:18:42 +0800
Message-Id: <20210226031902.23656-59-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1036.google.com
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/vector_helper.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index c5e65720120..e3056a06fe2 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3596,28 +3596,28 @@ GEN_VEXT_V_ENV(vfsqrt_v_w, 4, 4)
 GEN_VEXT_V_ENV(vfsqrt_v_d, 8, 8)
 
 /* Vector Floating-Point MIN/MAX Instructions */
-RVVCALL(OPFVV2, vfmin_vv_h, OP_UUU_H, H2, H2, H2, float16_minnum)
-RVVCALL(OPFVV2, vfmin_vv_w, OP_UUU_W, H4, H4, H4, float32_minnum)
-RVVCALL(OPFVV2, vfmin_vv_d, OP_UUU_D, H8, H8, H8, float64_minnum)
+RVVCALL(OPFVV2, vfmin_vv_h, OP_UUU_H, H2, H2, H2, float16_minnum_noprop)
+RVVCALL(OPFVV2, vfmin_vv_w, OP_UUU_W, H4, H4, H4, float32_minnum_noprop)
+RVVCALL(OPFVV2, vfmin_vv_d, OP_UUU_D, H8, H8, H8, float64_minnum_noprop)
 GEN_VEXT_VV_ENV(vfmin_vv_h, 2, 2)
 GEN_VEXT_VV_ENV(vfmin_vv_w, 4, 4)
 GEN_VEXT_VV_ENV(vfmin_vv_d, 8, 8)
-RVVCALL(OPFVF2, vfmin_vf_h, OP_UUU_H, H2, H2, float16_minnum)
-RVVCALL(OPFVF2, vfmin_vf_w, OP_UUU_W, H4, H4, float32_minnum)
-RVVCALL(OPFVF2, vfmin_vf_d, OP_UUU_D, H8, H8, float64_minnum)
+RVVCALL(OPFVF2, vfmin_vf_h, OP_UUU_H, H2, H2, float16_minnum_noprop)
+RVVCALL(OPFVF2, vfmin_vf_w, OP_UUU_W, H4, H4, float32_minnum_noprop)
+RVVCALL(OPFVF2, vfmin_vf_d, OP_UUU_D, H8, H8, float64_minnum_noprop)
 GEN_VEXT_VF(vfmin_vf_h, 2, 2)
 GEN_VEXT_VF(vfmin_vf_w, 4, 4)
 GEN_VEXT_VF(vfmin_vf_d, 8, 8)
 
-RVVCALL(OPFVV2, vfmax_vv_h, OP_UUU_H, H2, H2, H2, float16_maxnum)
-RVVCALL(OPFVV2, vfmax_vv_w, OP_UUU_W, H4, H4, H4, float32_maxnum)
-RVVCALL(OPFVV2, vfmax_vv_d, OP_UUU_D, H8, H8, H8, float64_maxnum)
+RVVCALL(OPFVV2, vfmax_vv_h, OP_UUU_H, H2, H2, H2, float16_maxnum_noprop)
+RVVCALL(OPFVV2, vfmax_vv_w, OP_UUU_W, H4, H4, H4, float32_maxnum_noprop)
+RVVCALL(OPFVV2, vfmax_vv_d, OP_UUU_D, H8, H8, H8, float64_maxnum_noprop)
 GEN_VEXT_VV_ENV(vfmax_vv_h, 2, 2)
 GEN_VEXT_VV_ENV(vfmax_vv_w, 4, 4)
 GEN_VEXT_VV_ENV(vfmax_vv_d, 8, 8)
-RVVCALL(OPFVF2, vfmax_vf_h, OP_UUU_H, H2, H2, float16_maxnum)
-RVVCALL(OPFVF2, vfmax_vf_w, OP_UUU_W, H4, H4, float32_maxnum)
-RVVCALL(OPFVF2, vfmax_vf_d, OP_UUU_D, H8, H8, float64_maxnum)
+RVVCALL(OPFVF2, vfmax_vf_h, OP_UUU_H, H2, H2, float16_maxnum_noprop)
+RVVCALL(OPFVF2, vfmax_vf_w, OP_UUU_W, H4, H4, float32_maxnum_noprop)
+RVVCALL(OPFVF2, vfmax_vf_d, OP_UUU_D, H8, H8, float64_maxnum_noprop)
 GEN_VEXT_VF(vfmax_vf_h, 2, 2)
 GEN_VEXT_VF(vfmax_vf_w, 4, 4)
 GEN_VEXT_VF(vfmax_vf_d, 8, 8)
-- 
2.17.1


