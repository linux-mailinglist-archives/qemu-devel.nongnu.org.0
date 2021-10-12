Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3B442A9A9
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 18:38:41 +0200 (CEST)
Received: from localhost ([::1]:60680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maKnY-000168-4x
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 12:38:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXl-0006oH-5v
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:21 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:35381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXh-0004AJ-6o
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:20 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 d13-20020a17090ad3cd00b0019e746f7bd4so2310545pjw.0
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 09:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=e1o+LTNCDTCEYnibXAgW5W5UXTzPq2g9X5wgbhLcsnA=;
 b=EKMRS9lCc0gvT2CEndKhNcQsPmreXg7ubbG4vjldMDCWEVMzvq/PYDU51wFbgUq6GW
 JJ4dRfgE4s/MigG80GLjYWvtCu+bSJESEem97jGb9g7+pb7NtgBBFMlpiA4GzImUCjyj
 pQLjmKXg+FyXrXy4UYau8tVtQCf3xikWKTdlQCrHTtFi08qT5q6alNjmwbzxnRobCnja
 4eE7vFIVzGMKiojhL908A3VGzbqlusxj2oSA4jiETmilvLV7OasD+00j2HT1auNYafF+
 Z92D0ZFbcNW0QOrNye3rOdajeOgBhQHKu6DZ5hgBhG2clBEj9eMC7TovcFVT/Z4vH7+2
 ncYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e1o+LTNCDTCEYnibXAgW5W5UXTzPq2g9X5wgbhLcsnA=;
 b=5kwkvr7coga3KGAyGZxgTMdiqRtogSmDWxSWCzIbreSifCq2676dV+OPSffkPonc3Z
 DL2Y0WXqURWIEdDuqZzAIvehcNW/d7rv+ZPnD+Wid6dAw/4wPD+yRT8x1nNKXulZIrSu
 p3ffaCuIhBiZiP20UPmbLbfFxV/ZSUEnaDT0bcwOlxomFMsbOk5QbBGWc+BYeJGGg2y+
 V76TSeAuQZjrxjXALwXA8wZJv1mRBsIB4sccwkGBb8WhKBwe1PPE4HhrEy+eFyOK/NC6
 pTrk9P0BOkG/QzGw70gDxKAbwZniSal1sctzUTsBH4rqP2Wbw/oQZ7y7KL2Vxp4OlaH8
 oyxQ==
X-Gm-Message-State: AOAM533W/aV5FXeCCrIETQBpfLX3K+GTdm0/kZ6Lg3GtOIJ49jOl/V10
 J+o4Y1hPmdKL+E8eDN3WYiygOitloMmSQg==
X-Google-Smtp-Source: ABdhPJwp6Il8Msz0mJ/+CfKhjcUs8sliUmHSCVZJlfwdCEFDX7goccA3uhpBVXp8WPuWgKL3knSSsg==
X-Received: by 2002:a17:902:d4ca:b0:13f:36bb:9b20 with SMTP id
 o10-20020a170902d4ca00b0013f36bb9b20mr12957877plg.1.1634055735856; 
 Tue, 12 Oct 2021 09:22:15 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k190sm11525023pfd.211.2021.10.12.09.22.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 09:22:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/23] target/rx: Drop checks for singlestep_enabled
Date: Tue, 12 Oct 2021 09:21:55 -0700
Message-Id: <20211012162159.471406-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012162159.471406-1-richard.henderson@linaro.org>
References: <20211012162159.471406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

GDB single-stepping is now handled generically.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/helper.h    |  1 -
 target/rx/op_helper.c |  8 --------
 target/rx/translate.c | 12 ++----------
 3 files changed, 2 insertions(+), 19 deletions(-)

diff --git a/target/rx/helper.h b/target/rx/helper.h
index f0b7ebbbf7..ebb4739474 100644
--- a/target/rx/helper.h
+++ b/target/rx/helper.h
@@ -2,7 +2,6 @@ DEF_HELPER_1(raise_illegal_instruction, noreturn, env)
 DEF_HELPER_1(raise_access_fault, noreturn, env)
 DEF_HELPER_1(raise_privilege_violation, noreturn, env)
 DEF_HELPER_1(wait, noreturn, env)
-DEF_HELPER_1(debug, noreturn, env)
 DEF_HELPER_2(rxint, noreturn, env, i32)
 DEF_HELPER_1(rxbrk, noreturn, env)
 DEF_HELPER_FLAGS_3(fadd, TCG_CALL_NO_WG, f32, env, f32, f32)
diff --git a/target/rx/op_helper.c b/target/rx/op_helper.c
index 4d315b4449..11f952d340 100644
--- a/target/rx/op_helper.c
+++ b/target/rx/op_helper.c
@@ -451,14 +451,6 @@ void QEMU_NORETURN helper_wait(CPURXState *env)
     raise_exception(env, EXCP_HLT, 0);
 }
 
-void QEMU_NORETURN helper_debug(CPURXState *env)
-{
-    CPUState *cs = env_cpu(env);
-
-    cs->exception_index = EXCP_DEBUG;
-    cpu_loop_exit(cs);
-}
-
 void QEMU_NORETURN helper_rxint(CPURXState *env, uint32_t vec)
 {
     raise_exception(env, 0x100 + vec, 0);
diff --git a/target/rx/translate.c b/target/rx/translate.c
index a3cf720455..5db8f79a82 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -150,11 +150,7 @@ static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
         tcg_gen_exit_tb(dc->base.tb, n);
     } else {
         tcg_gen_movi_i32(cpu_pc, dest);
-        if (dc->base.singlestep_enabled) {
-            gen_helper_debug(cpu_env);
-        } else {
-            tcg_gen_lookup_and_goto_ptr();
-        }
+        tcg_gen_lookup_and_goto_ptr();
     }
     dc->base.is_jmp = DISAS_NORETURN;
 }
@@ -2331,11 +2327,7 @@ static void rx_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
         gen_goto_tb(ctx, 0, dcbase->pc_next);
         break;
     case DISAS_JUMP:
-        if (ctx->base.singlestep_enabled) {
-            gen_helper_debug(cpu_env);
-        } else {
-            tcg_gen_lookup_and_goto_ptr();
-        }
+        tcg_gen_lookup_and_goto_ptr();
         break;
     case DISAS_UPDATE:
         tcg_gen_movi_i32(cpu_pc, ctx->base.pc_next);
-- 
2.25.1


