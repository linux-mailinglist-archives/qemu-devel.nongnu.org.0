Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9837430435
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 20:32:54 +0200 (CEST)
Received: from localhost ([::1]:60824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mboUH-0000oP-Pz
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 14:32:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDc-0008OG-D1
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:41 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:37600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDX-00025U-HQ
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:40 -0400
Received: by mail-pg1-x52b.google.com with SMTP id s136so8558069pgs.4
 for <qemu-devel@nongnu.org>; Sat, 16 Oct 2021 11:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Js0hOIKw65GpTS+Hl57060G5VKgpqQyhyy+p7V5A7kA=;
 b=CM7/q+sB2WRDGNXsfQV1Bq+rpd/P78WXCMw5xh02PO5vBuaM20G5jY5DPLDjf2dPuS
 wLnHMl8xeFiR0eSybMCFYd3mtw/HR6HjZasCTXWI8Ywdc1WkE6WYWZfjDHQ1RI5zzopC
 y6O6ryun9gr66dOdqIwSlKZOLSpQ4Q9fiKSCRRtPUHS7NIyYPDJQzScyPQG81ogPFr2A
 8hhj6qONLGuYbCTlJbi6VYXHjmdhTGGDregOdiAzXJZ4hmXYYnLLKf46oiKIslROvmKv
 ipmSldUQMaUFdge2IKs54mZmTkirrX8P3hwFJg9WoC0poDfFbZh3pvomfLZolxToU5PU
 oTnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Js0hOIKw65GpTS+Hl57060G5VKgpqQyhyy+p7V5A7kA=;
 b=DUwOukTc+uqIh5dkCLBRBOTRbM0qyRRPiLyegCXStA8MpM/2JvfK4fxEdzrVD9KuyZ
 xOWut55MZEFtdZM1dtAYrixY+jfgITgWhyGKHvNoFMoYS63Eupob6YytSTmGTUxZ1F5V
 8bKohPRtwpXEHYb93PtXrkraLzIMHa4H6iIu2hqEquhxKLxUpAlf76DVnBjkQ+v/Ju2z
 rjtleHVYUZpbA3Y5b1kwpztH7C/m/oxa7iXkGXI4l/dQeSyd8jv3DodjlGOpz5Qf+nmz
 XxSYrxh2zcn/ij04YpBsjO2dpQWNKWT9rIoujHIcIVShRuU9R3M9mttkilzpIRWmzmy3
 VtPg==
X-Gm-Message-State: AOAM531b3z8RHYlf81L/4ew3BaztyZ6lbJHVP+ndtmR42eDx5acSNR2l
 ucvFNrWRG2MFFnPKyGkjRx9HHRGWS8cKAQ==
X-Google-Smtp-Source: ABdhPJzGTviiB6V+FV6d9dVwSh9ZKQU0mIIxqabPQDvr6mdlto/faVny7fAQ8y4JuNVzZ8nLqr2vBQ==
X-Received: by 2002:a63:7c4e:: with SMTP id l14mr14769182pgn.389.1634408133018; 
 Sat, 16 Oct 2021 11:15:33 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id ob5sm5075097pjb.2.2021.10.16.11.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 11:15:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/24] target/rx: Drop checks for singlestep_enabled
Date: Sat, 16 Oct 2021 11:15:09 -0700
Message-Id: <20211016181514.3165661-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016181514.3165661-1-richard.henderson@linaro.org>
References: <20211016181514.3165661-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GDB single-stepping is now handled generically.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


