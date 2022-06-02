Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8AC53C0C0
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 00:21:57 +0200 (CEST)
Received: from localhost ([::1]:34684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwtCV-0005gx-Uc
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 18:21:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgz-0004tu-Q5
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:21 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:37473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgx-00006q-Jw
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:21 -0400
Received: by mail-pg1-x534.google.com with SMTP id i185so5804360pge.4
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UQ6mvuDTnZBD5iD1SP6A6OjgNUDJxGksfDsQZ9X7HOg=;
 b=JVUkaiVdrkR7r5S/WRFOT/bKqM8nlWXClR4wnbxL/oWTC7i+t2c1tSicz5Bqu8RFSx
 V9FofpmM5WA4QuuTfDz25bVKFkCE4ISHPSdETnhLEinXlGqn1KSr5VGfMgvxdj8EVHdy
 FtL49w+gotM6HUXYZhAENEfi7569PURtPjp8+GDC0+GwQIpVXX04vH8IZX8arJXKHpuA
 dyJGmnJLi0VbZ2jRFlQKOBiNHoHchTuhoB8qtBK2ScqDyyGDpdwsT+Pl2pRw+uKdDPo9
 I9OcSx1QzQP+FC/D01bpVd+oPVXG0IkKVuUeCA37pKRiUP0gaL0QPQGpOlXSEL0rme5x
 Z06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UQ6mvuDTnZBD5iD1SP6A6OjgNUDJxGksfDsQZ9X7HOg=;
 b=hmGReYVs8xIMZYc03lQkcZcMi4/D4/vmhk4eAzArezYDJn/mUJt/dM/ngmRy/NUGjJ
 4lJZkwncQTe5E6oNIULc7ezahp0ltgqBtsjfQ5f2y3Kn8/MZ1uIIZq4SDB4tEwyN+2Jq
 s5aSqV/Ejm/n+MVFMp5hlwTTjG4f8Jx3QaGnpudOzWDmUVSjhE3jVnpzUPxhHt+UbCjU
 USMp5QjD4EC458qR2a6WD2H7FOBAb+8IO7c0cGiKJCUhI1BOeBIjz67X9/eH9g7fKGS/
 yLaQCKu3i7I0H5CQFZZ1WL90zi/zfecj6rQXXlRsnYlX0i4Ihqw+0uqo3GZjSfXL1p0P
 Xk/Q==
X-Gm-Message-State: AOAM530JlfeH8WoGLsPu0hURdtwkDpRTcNjzApLtzTXJNSGC0/VHD54O
 Phb4pF9VK6HtoEldYgEWTHVnHyFpLm8zjg==
X-Google-Smtp-Source: ABdhPJxLNOMu3b5JvWBp3OsTm19iGaihRhBg25SsUA23GN8AQX5uVyEohnygDVbHcNfyJGF4PC2owQ==
X-Received: by 2002:a05:6a00:e8e:b0:518:287c:ce82 with SMTP id
 bo14-20020a056a000e8e00b00518287cce82mr7038046pfb.4.1654206558854; 
 Thu, 02 Jun 2022 14:49:18 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 28/71] target/arm: Add PSTATE.{SM,ZA} to TB flags
Date: Thu,  2 Jun 2022 14:48:10 -0700
Message-Id: <20220602214853.496211-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These are required to determine if various insns
are allowed to issue.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           | 2 ++
 target/arm/translate.h     | 4 ++++
 target/arm/helper.c        | 4 ++++
 target/arm/translate-a64.c | 2 ++
 4 files changed, 12 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 1ae1b7122b..9bd8058afe 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3284,6 +3284,8 @@ FIELD(TBFLAG_A64, TCMA, 16, 2)
 FIELD(TBFLAG_A64, MTE_ACTIVE, 18, 1)
 FIELD(TBFLAG_A64, MTE0_ACTIVE, 19, 1)
 FIELD(TBFLAG_A64, SMEEXC_EL, 20, 2)
+FIELD(TBFLAG_A64, PSTATE_SM, 22, 1)
+FIELD(TBFLAG_A64, PSTATE_ZA, 23, 1)
 
 /*
  * Helpers for using the above.
diff --git a/target/arm/translate.h b/target/arm/translate.h
index a492e4217b..fbd6713572 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -101,6 +101,10 @@ typedef struct DisasContext {
     bool align_mem;
     /* True if PSTATE.IL is set */
     bool pstate_il;
+    /* True if PSTATE.SM is set. */
+    bool pstate_sm;
+    /* True if PSTATE.ZA is set. */
+    bool pstate_za;
     /* True if MVE insns are definitely not predicated by VPR or LTPSIZE */
     bool mve_no_pred;
     /*
diff --git a/target/arm/helper.c b/target/arm/helper.c
index f852fd7644..3edecb56b6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13857,6 +13857,10 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
     }
     if (cpu_isar_feature(aa64_sme, env_archcpu(env))) {
         DP_TBFLAG_A64(flags, SMEEXC_EL, sme_exception_el(env, el));
+        if (FIELD_EX64(env->svcr, SVCR, SM)) {
+            DP_TBFLAG_A64(flags, PSTATE_SM, 1);
+        }
+        DP_TBFLAG_A64(flags, PSTATE_ZA, FIELD_EX64(env->svcr, SVCR, ZA));
     }
 
     sctlr = regime_sctlr(env, stage1);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index f51d80d816..fdc035ad9a 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14635,6 +14635,8 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->ata = EX_TBFLAG_A64(tb_flags, ATA);
     dc->mte_active[0] = EX_TBFLAG_A64(tb_flags, MTE_ACTIVE);
     dc->mte_active[1] = EX_TBFLAG_A64(tb_flags, MTE0_ACTIVE);
+    dc->pstate_sm = EX_TBFLAG_A64(tb_flags, PSTATE_SM);
+    dc->pstate_za = EX_TBFLAG_A64(tb_flags, PSTATE_ZA);
     dc->vec_len = 0;
     dc->vec_stride = 0;
     dc->cp_regs = arm_cpu->cp_regs;
-- 
2.34.1


