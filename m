Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F57F50BF1E
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:59:31 +0200 (CEST)
Received: from localhost ([::1]:56844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhxZ4-00014K-DQ
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:59:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwat-0000Da-Ce
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:20 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:39510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwar-000815-53
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:18 -0400
Received: by mail-io1-xd2b.google.com with SMTP id r12so9219676iod.6
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FydhLHa4yRdKoi+QMZFm3ACoytrW9DGPCspIkMaQe9I=;
 b=jS3qgQlegnnXkPzQVOIyGQzh5F/zTwwVewaynpkuNQF8KvE6DAjZunROAlCJ9YT1Hi
 ttDOOY8SVp0Qu4cp+4QZc4UUaticCspaNDeK7CakhUh3FAyG3oGEq5iZGpsacrbVJhKm
 R7rTrUonAaTHWWX5W3i+aHfjuHXzxr3TsvVK88KP7dfHp8aiY56YkpwilAeRusI/8OMK
 mCUn+sWuhAlmhIsFUjiQtOsOc2zF6JtMxrJW+CbjxZN870KTo5kRdVg6ehlcs+s+F0/4
 IFDhzIGU+9sJvCPRfJWrPIApCPpH9PBhvbPYMJEdv+NhNt5KxCw0Hv0VlTY44fkZWj0V
 /8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FydhLHa4yRdKoi+QMZFm3ACoytrW9DGPCspIkMaQe9I=;
 b=4LBIfE2Ji4z8Q6a5FT1wSSNR+z7hVessgDtqNH3QiPdjjf121ulwiaKcBiNoxu25ei
 G0A0QmD0mUbwKN1GOFx1u2RuWvFMGML8+Wd/fD3GwKBo+G72IepdivEkQG04MMeRTnMF
 kEI8CPhioUEucXAV0aRdr4TUSRVA30szexuhyomyLV+Gsm17xL1M/9D+NKgP9EWHL8kD
 pG5U1fM/TbHduyK7z2u4osEoucXemgU7bRxKPru1HFpJogGL5lCqy0czhq+6T4uNvue/
 cfFV/pb9iUM+4jXExxGpCDjybuhtorUUd4jTTAloZ7KWVE72fysX68XFd8lne6B7ru+Z
 UKjw==
X-Gm-Message-State: AOAM5329SKic5A83BBEricvlAY4AfFk+PBWUdAfjrlEiJRjoME3N/Tn3
 M96xSHD+i6YI3VqAUUbYYFBw+k+IpOMhaD/j
X-Google-Smtp-Source: ABdhPJxONK0+QjvMxMiW2nqVG4qX2SN4mEGqhqLX2lWo+ejl1gU0PjK2/05KTG0vV83HBlgNKiiINA==
X-Received: by 2002:a02:a30f:0:b0:327:277b:c380 with SMTP id
 q15-20020a02a30f000000b00327277bc380mr2497768jai.241.1650646634669; 
 Fri, 22 Apr 2022 09:57:14 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a6b8b17000000b00649a2634725sm816380iod.17.2022.04.22.09.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:57:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 52/68] target/nios2: Create gen_jumpr
Date: Fri, 22 Apr 2022 09:52:22 -0700
Message-Id: <20220422165238.1971496-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd2b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split out a function to perform an indirect branch.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-49-richard.henderson@linaro.org>
---
 target/nios2/translate.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index e2742a8556..8616813365 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -36,7 +36,6 @@
 #include "semihosting/semihost.h"
 
 /* is_jmp field values */
-#define DISAS_JUMP    DISAS_TARGET_0 /* only pc was modified dynamically */
 #define DISAS_UPDATE  DISAS_TARGET_1 /* cpu state was modified dynamically */
 
 #define INSTRUCTION_FLG(func, flags) { (func), (flags) }
@@ -195,6 +194,16 @@ static void gen_goto_tb(DisasContext *dc, int n, uint32_t dest)
     }
 }
 
+static void gen_jumpr(DisasContext *dc, int regno, bool is_call)
+{
+    tcg_gen_mov_tl(cpu_pc, load_gpr(dc, regno));
+    if (is_call) {
+        tcg_gen_movi_tl(dest_gpr(dc, R_RA), dc->base.pc_next);
+    }
+    tcg_gen_exit_tb(NULL, 0);
+    dc->base.is_jmp = DISAS_NORETURN;
+}
+
 static void gen_excp(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     t_gen_helper_raise_exception(dc, flags);
@@ -437,8 +446,7 @@ static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
 /* PC <- ra */
 static void ret(DisasContext *dc, uint32_t code, uint32_t flags)
 {
-    tcg_gen_mov_tl(cpu_pc, load_gpr(dc, R_RA));
-    dc->base.is_jmp = DISAS_JUMP;
+    gen_jumpr(dc, R_RA, false);
 }
 
 /*
@@ -468,8 +476,7 @@ static void jmp(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     R_TYPE(instr, code);
 
-    tcg_gen_mov_tl(cpu_pc, load_gpr(dc, instr.a));
-    dc->base.is_jmp = DISAS_JUMP;
+    gen_jumpr(dc, instr.a, false);
 }
 
 /* rC <- PC + 4 */
@@ -488,10 +495,7 @@ static void callr(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     R_TYPE(instr, code);
 
-    tcg_gen_mov_tl(cpu_pc, load_gpr(dc, instr.a));
-    tcg_gen_movi_tl(dest_gpr(dc, R_RA), dc->base.pc_next);
-
-    dc->base.is_jmp = DISAS_JUMP;
+    gen_jumpr(dc, instr.a, true);
 }
 
 /* rC <- ctlN */
@@ -909,11 +913,6 @@ static void nios2_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
         tcg_gen_exit_tb(NULL, 0);
         break;
 
-    case DISAS_JUMP:
-        /* The jump will already have updated the PC register */
-        tcg_gen_exit_tb(NULL, 0);
-        break;
-
     case DISAS_NORETURN:
         /* nothing more to generate */
         break;
-- 
2.34.1


