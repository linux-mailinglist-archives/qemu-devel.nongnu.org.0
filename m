Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF83C5F1D9E
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 18:30:34 +0200 (CEST)
Received: from localhost ([::1]:57862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oefNp-0002F3-Qk
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 12:30:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHH-0006iz-4J
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:23:48 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:39770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHB-0006DC-Ay
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:23:46 -0400
Received: by mail-qv1-xf34.google.com with SMTP id z18so4439053qvn.6
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 09:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=9IDKhGDW8UhVUT6RQq69U/ovNhvqqaoZDY9SKNRcNWM=;
 b=Ch/eTdlmb9zwMTZnqdq4L/CL/P/3ersfsm8/4/W3I2vRNztAgx/DEL1a1Rzhppx7K5
 +w4vcW4miapZVPQeZzFbTZbvAlqDFuO1mQa3IPQMMKiFyW2zmRiUJh2bwEyVuSlt2zXm
 C/9zki4sQgZwC4cwG4XYHQEnizoXRehTu9G90IWSzWzmPmSPXL50Tn4yXtpU3xxO6M4+
 WtBM6X4wzj3USpOKa8ogF0kHsKgV7cO03+7d1jlSt8WLdAfEdSAHyxkg4Ly7CAekEY1l
 DS6VJOG8FcrhHnQO1RRM9+xiS0hqkYkREXC/keAEinC6v3L3W99QSBFwJM0mj5tiypM/
 MDFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=9IDKhGDW8UhVUT6RQq69U/ovNhvqqaoZDY9SKNRcNWM=;
 b=Nnqn8h1npdvaVQRmJo2G+6GCFh7NAcTXslLF778YZHiYJ6gdaebv1j7s0O2Vs0sAbz
 fWKuKoOs1Y8JZX53KQFnR0Rx+HAPID98BidH0BJ4DvkOn5Y8mLQx2A1y9TFvqJhLUwfA
 qBP/KUwclOMt1xBJKCEK2oQYMuoy6ArX37XdsPPGYKxbkbAZ7I7gYQGzriU3AwV6e94/
 7mVgxDQBh9FjxaruZ1EkadLmkxxxvVhh6aeta+9XToudDct8KwwAyrwDMnfboeNdfPYf
 abVXEEgzyHu3c+JAkRpzfz84nSZ6pxefWI+dKTwt3+YqjMvyFXJdCJCro5rotGkB7hTb
 TeUA==
X-Gm-Message-State: ACrzQf2vZwsWDMpIZjxLzZWiZKFaxvfbVusR1QdLpcRkxACnORAd1BI+
 WfivEXKvVBpSI7J6TJO6yII7ADzhiFnDow==
X-Google-Smtp-Source: AMsMyM4XtKSU83az55GinbzmrhemIM2ElAJGHSZ63YyDr28BHyf8xuVogL4LYNyL32cO2QCv/IOvLg==
X-Received: by 2002:a05:6214:ac1:b0:4af:9cdb:e4f with SMTP id
 g1-20020a0562140ac100b004af9cdb0e4fmr11173180qvi.40.1664641420130; 
 Sat, 01 Oct 2022 09:23:40 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:23:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 07/42] target/arm: Add TBFLAG_M32.SECURE
Date: Sat,  1 Oct 2022 09:22:43 -0700
Message-Id: <20221001162318.153420-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf34.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove the use of regime_is_secure from arm_tr_init_disas_context.
Instead, provide the value of v8m_secure directly from tb_flags.
Rather than use regime_is_secure, use the env->v7m.secure directly,
as per arm_mmu_idx_el.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h       | 2 ++
 target/arm/helper.c    | 4 ++++
 target/arm/translate.c | 3 +--
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 33cdbc0143..790328c598 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3197,6 +3197,8 @@ FIELD(TBFLAG_M32, NEW_FP_CTXT_NEEDED, 3, 1)     /* Not cached. */
 FIELD(TBFLAG_M32, FPCCR_S_WRONG, 4, 1)          /* Not cached. */
 /* Set if MVE insns are definitely not predicated by VPR or LTPSIZE */
 FIELD(TBFLAG_M32, MVE_NO_PRED, 5, 1)            /* Not cached. */
+/* Set if in secure mode */
+FIELD(TBFLAG_M32, SECURE, 6, 1)
 
 /*
  * Bit usage when in AArch64 state
diff --git a/target/arm/helper.c b/target/arm/helper.c
index b5dac651e7..772218f0d2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10935,6 +10935,10 @@ static CPUARMTBFlags rebuild_hflags_m32(CPUARMState *env, int fp_el,
         DP_TBFLAG_M32(flags, STACKCHECK, 1);
     }
 
+    if (arm_feature(env, ARM_FEATURE_M_SECURITY) && env->v7m.secure) {
+        DP_TBFLAG_M32(flags, SECURE, 1);
+    }
+
     return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
 }
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5aaccbbf71..ac647e0262 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9351,8 +9351,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
         dc->vfp_enabled = 1;
         dc->be_data = MO_TE;
         dc->v7m_handler_mode = EX_TBFLAG_M32(tb_flags, HANDLER);
-        dc->v8m_secure = arm_feature(env, ARM_FEATURE_M_SECURITY) &&
-            regime_is_secure(env, dc->mmu_idx);
+        dc->v8m_secure = EX_TBFLAG_M32(tb_flags, SECURE);
         dc->v8m_stackcheck = EX_TBFLAG_M32(tb_flags, STACKCHECK);
         dc->v8m_fpccr_s_wrong = EX_TBFLAG_M32(tb_flags, FPCCR_S_WRONG);
         dc->v7m_new_fp_ctxt_needed =
-- 
2.34.1


