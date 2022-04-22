Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE1B50BE07
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:09:30 +0200 (CEST)
Received: from localhost ([::1]:58956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhwmf-00034A-3N
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwWw-0000xP-LK
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:15 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:39608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwWv-0007Ge-1M
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:14 -0400
Received: by mail-pl1-x62c.google.com with SMTP id c12so12097468plr.6
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qf4cYEUah8+UZ9PulZzd1wKH6UWiuDaNT9BP/AwB7KQ=;
 b=u4S1Jlljp6IxiHSeGBC5SlgoYO6hEkMQi5nIu7m9GycUWJvHvgz0A4NZxLQKUXe4cb
 /V1mV/ThxfZYnQwxcnFqfTJpQbSAf3rdBsY0kYQOq1GgrNIfScQ189SWQX+T5i61uuUf
 gSZxV3ZG6rrMxc6ZTSqppawv9h2zmf0Q9w/qQ2k8FxW/+HMUhzLr9yN/DgVognNT8PQW
 fSkqpv8jk0GErCm2nFzNLNVm4ODI9F9aMJAjQH/2tGVI0yoet3H6Vn5mPInFStB675R6
 NfEc/xnKNf/qJ481VJX8nENYJpUnbBpONFLMDtcNQTlrBeRF85H1P0coeF/gMsZId4ps
 69/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qf4cYEUah8+UZ9PulZzd1wKH6UWiuDaNT9BP/AwB7KQ=;
 b=MeMNfv7Bhc3IucmMhEfytVc/VNMNnBGR0xZZ8dlSlI//YPhLVoFXWBw5bA1H1AkLeH
 hLNCfDGxyqLOSoDqYD89kaAdEUEyO41rYwqVBPwOOrmMrLAfZkev4VlAeHNhcObjN1Rp
 O1mmzB94IXdlH0+BSPfKhJNQp0gWwN3guo3eXEGK8TsD77ZSc/kGszh3zluK17n6rowL
 s+0zsUMopeXohyJgPYM8cyh6wJtjxydUI8Mgmkc8cMYqGp5N1JgikBdcO0JCSoERCSSw
 VSPNzolVdMUhRuBJcQR783DpyV20rcZeitbwMuJAUBIRR8awLlk1DeXvwB9XxWWi0uce
 I1NA==
X-Gm-Message-State: AOAM531oNW8POVl2dGPm23jNxdNrFc2GNja6lNhU3hqXB08sO5VTIMA+
 p/6ZC6IskVstdvCVI4FcncDjsLClUqZPVsct
X-Google-Smtp-Source: ABdhPJxF9MdDLR31GjWyzgyFg+/y1e7+A0tcFT8VezQOnaRQ508waAN11+pQ1/MgjF2L2q3Sn5d1bg==
X-Received: by 2002:a17:902:d3cb:b0:15b:a002:d80c with SMTP id
 w11-20020a170902d3cb00b0015ba002d80cmr5289221plb.108.1650646391361; 
 Fri, 22 Apr 2022 09:53:11 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 6-20020a17090a030600b001cd4989ff5fsm6835904pje.38.2022.04.22.09.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:53:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 17/68] target/nios2: Split out helper for eret instruction
Date: Fri, 22 Apr 2022 09:51:47 -0700
Message-Id: <20220422165238.1971496-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Amir Gonnen <amir.gonnen@neuroblade.ai>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Amir Gonnen <amir.gonnen@neuroblade.ai>

The implementation of eret will become much more complex
with the introduction of shadow registers.

[rth: Split out of a larger patch for shadow register sets.
      Directly exit to the cpu loop from the helper.]

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Amir Gonnen <amir.gonnen@neuroblade.ai>
Message-Id: <20220303153906.2024748-3-amir.gonnen@neuroblade.ai>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-18-richard.henderson@linaro.org>
---
 target/nios2/helper.h    |  1 +
 target/nios2/op_helper.c |  9 +++++++++
 target/nios2/translate.c | 10 ++++++----
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/target/nios2/helper.h b/target/nios2/helper.h
index a44ecfdf7a..525b6b685b 100644
--- a/target/nios2/helper.h
+++ b/target/nios2/helper.h
@@ -21,6 +21,7 @@
 DEF_HELPER_FLAGS_2(raise_exception, TCG_CALL_NO_WG, noreturn, env, i32)
 
 #if !defined(CONFIG_USER_ONLY)
+DEF_HELPER_3(eret, noreturn, env, i32, i32)
 DEF_HELPER_2(mmu_write_tlbacc, void, env, i32)
 DEF_HELPER_2(mmu_write_tlbmisc, void, env, i32)
 DEF_HELPER_2(mmu_write_pteaddr, void, env, i32)
diff --git a/target/nios2/op_helper.c b/target/nios2/op_helper.c
index caa885f7b4..ee5ad8b23f 100644
--- a/target/nios2/op_helper.c
+++ b/target/nios2/op_helper.c
@@ -30,3 +30,12 @@ void helper_raise_exception(CPUNios2State *env, uint32_t index)
     cs->exception_index = index;
     cpu_loop_exit(cs);
 }
+
+#ifndef CONFIG_USER_ONLY
+void helper_eret(CPUNios2State *env, uint32_t new_status, uint32_t new_pc)
+{
+    env->regs[CR_STATUS] = new_status;
+    env->pc = new_pc;
+    cpu_loop_exit(env_cpu(env));
+}
+#endif /* !CONFIG_USER_ONLY */
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 226bd9e30b..53699ee088 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -391,10 +391,12 @@ static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
         return;
     }
 
-    tcg_gen_mov_tl(cpu_R[CR_STATUS], cpu_R[CR_ESTATUS]);
-    tcg_gen_mov_tl(cpu_pc, cpu_R[R_EA]);
-
-    dc->base.is_jmp = DISAS_JUMP;
+#ifdef CONFIG_USER_ONLY
+    g_assert_not_reached();
+#else
+    gen_helper_eret(cpu_env, cpu_R[CR_ESTATUS], cpu_R[R_EA]);
+    dc->base.is_jmp = DISAS_NORETURN;
+#endif
 }
 
 /* PC <- ra */
-- 
2.34.1


