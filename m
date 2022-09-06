Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C06165AE639
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 13:11:59 +0200 (CEST)
Received: from localhost ([::1]:47914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVWUo-0000MF-Oc
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 07:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWn-0000Gw-Dp
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:58 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:35562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWf-0003b5-JL
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:57 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 m17-20020a7bce11000000b003a5bedec07bso9286781wmc.0
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=3Wy6M0gYXcjQAQC8/MZK8xQ1mhCVCa0Cc3b+Bvb1QSw=;
 b=npMdZTg70WFYYPsbz0Npts9Ls7gXmP0ANDLrxBYle/ftNGU59V7Hp7PrDgc3JPlKbz
 cHbS8Zc/aJMbUyORwHbe41UMAa0TYH1HC+hLC5QwLvEAWjotf07uZlZOdB7S/bBjId5C
 uu8Nx6lE9zZBwTbOHecaXXj/rK2CLN4SY5/9WgoBK7BOQvaXpCR/Jy6CrXvuSJ0OxNvt
 4yjObmWJPFXfv6VvR/UWEaBlx+fXE6g+5Bx+KE0Pl6bfcOxb+ZKHrNLzWLC5ZLI5tQo9
 L0boLlB3V5/39VUbNifxSmkAb4DCwt0mw/r2N0jLk0f9kotdHvcPW+lbQ6V42c3cJYvx
 C/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=3Wy6M0gYXcjQAQC8/MZK8xQ1mhCVCa0Cc3b+Bvb1QSw=;
 b=SVvA2PIJJcJUlcjnf5e+WGJlnVs+CFbeYiaXpr1fYHbqTvfjfPdmmLQCkbP0LaYAda
 EYxyMNZ5LNc2CaBx8zz6SNaMo+2bfOnmuFxhOTR8EQy8QiWHzllzVgho8hsE+qkwN9W+
 S5MEUTOtDx/yAuHqh2zUCUcVOXD6G2FPrCLZRyg2DHBaMxF5dG4+0ol1CR2Svf8B6hMh
 WDS4BbtJ5WYKkFBMv7PXAGzL0biA1AXyr7sz8lCmUkxsW+FMpqIecnV2DpNDhFm9jiAQ
 PmpOeiQMogpxruanM+RmiSlFsxn06PwSk/NFjE4D/4Ap4MrLqAc2pSBZiKwZYOK6oKKo
 IBlA==
X-Gm-Message-State: ACgBeo3fmUGwmVD7Wp90tU6GfrGeUTOWV3ZtbBU4J0buNVXugZbQEGfk
 5gieqiq+Tvg3p711Of1j618gMUf45wDE+2u1
X-Google-Smtp-Source: AA6agR4WlRoiroxtEYxqzf9ouxJhTlUYiV6c1WWD5LK51fgWrwg+MqwD+CDCOGVPJ/SUu41AhhZaHg==
X-Received: by 2002:a05:600c:89a:b0:3a5:4ea9:d5ee with SMTP id
 l26-20020a05600c089a00b003a54ea9d5eemr13247121wmp.8.1662458987925; 
 Tue, 06 Sep 2022 03:09:47 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 f25-20020a1c6a19000000b003a840690609sm23125014wmc.36.2022.09.06.03.09.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:09:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v2 14/23] target/i386: Truncate values for lcall_real to i32
Date: Tue,  6 Sep 2022 11:09:23 +0100
Message-Id: <20220906100932.343523-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906100932.343523-1-richard.henderson@linaro.org>
References: <20220906100932.343523-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
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

Use i32 not int or tl for eip and cs arguments.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/helper.h         | 2 +-
 target/i386/tcg/seg_helper.c | 6 ++----
 target/i386/tcg/translate.c  | 3 ++-
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/i386/helper.h b/target/i386/helper.h
index ac3b4d1ee3..39a3c24182 100644
--- a/target/i386/helper.h
+++ b/target/i386/helper.h
@@ -37,7 +37,7 @@ DEF_HELPER_2(lldt, void, env, int)
 DEF_HELPER_2(ltr, void, env, int)
 DEF_HELPER_3(load_seg, void, env, int, int)
 DEF_HELPER_4(ljmp_protected, void, env, int, tl, tl)
-DEF_HELPER_5(lcall_real, void, env, int, tl, int, int)
+DEF_HELPER_5(lcall_real, void, env, i32, i32, int, i32)
 DEF_HELPER_5(lcall_protected, void, env, int, tl, int, tl)
 DEF_HELPER_2(iret_real, void, env, int)
 DEF_HELPER_3(iret_protected, void, env, int, int)
diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
index bffd82923f..539189b4d1 100644
--- a/target/i386/tcg/seg_helper.c
+++ b/target/i386/tcg/seg_helper.c
@@ -1504,14 +1504,12 @@ void helper_ljmp_protected(CPUX86State *env, int new_cs, target_ulong new_eip,
 }
 
 /* real mode call */
-void helper_lcall_real(CPUX86State *env, int new_cs, target_ulong new_eip1,
-                       int shift, int next_eip)
+void helper_lcall_real(CPUX86State *env, uint32_t new_cs, uint32_t new_eip,
+                       int shift, uint32_t next_eip)
 {
-    int new_eip;
     uint32_t esp, esp_mask;
     target_ulong ssp;
 
-    new_eip = new_eip1;
     esp = env->regs[R_ESP];
     esp_mask = get_sp_mask(env->segs[R_SS].flags);
     ssp = env->segs[R_SS].base;
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 1997f8d291..427ee72442 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -5302,7 +5302,8 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                                            tcg_const_tl(s->pc - s->cs_base));
             } else {
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
-                gen_helper_lcall_real(cpu_env, s->tmp2_i32, s->T1,
+                tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
+                gen_helper_lcall_real(cpu_env, s->tmp2_i32, s->tmp3_i32,
                                       tcg_const_i32(dflag - 1),
                                       tcg_const_i32(s->pc - s->cs_base));
             }
-- 
2.34.1


