Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E31D025BBB8
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 09:31:37 +0200 (CEST)
Received: from localhost ([::1]:54626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDjia-0001sI-VL
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 03:31:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kDjeD-00021T-PH
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 03:27:05 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:38610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kDjeB-0001m7-RZ
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 03:27:05 -0400
Received: by mail-pf1-x444.google.com with SMTP id d22so1577724pfn.5
 for <qemu-devel@nongnu.org>; Thu, 03 Sep 2020 00:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qxvKwmePa50MKIg8eLv8VBXTLXGDs/q8gqEzTKISHeQ=;
 b=QsBkaBqDYLpU5KQhE0OhI9mLcw+tQaAncMeWL7wQ1rsH+O4NYP0JGgQTz5k4q7NrhZ
 wYdcCSYy79fCW4ft0ZUcUSVH9k0lVNM3Xms61r02m/66t12cJ703S3BIxJ6LDoY+U0vM
 BTNHkTFTKPMD/PQsa27RqWDgDZZk8LSQHQ/pBESFCa+aX3J+IfPa+lLDVyo4AGOWrOvc
 e5ey+/FRmbpER1PWP3E+pU7P4fcYTm4AE22/y+ATvtMsG+TTq1yI984y5zEarmwbbxw1
 vqrbBnJgAl0J+RRbfvk6gsqMUBh1KH+BwPo5ZfQfYi1WWGC4UxNzIuAjXgvfYNtLh1Bt
 C94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qxvKwmePa50MKIg8eLv8VBXTLXGDs/q8gqEzTKISHeQ=;
 b=dJUA2QK0MB177eevcw/yB4jQKdZ5Kr36IJtebIHCUoudkJiIQ9YVmOw9FGp/s8IAG5
 fC8POtecHJh31cG2cQLs4lx6xWzOC79e1HJMkRC3/6Y8fTss+UEY8NXUIRalWKuXYeO/
 lrNVhwrGOSikXy6RnHvn1ntXTy83yNU9Bz86wVLkFyq0544JUFnEe4kw+LtjymorJ0mJ
 xjR2T4HzCybfSq29pOBGuKmFiPUzvgUFOZPgnUkJINHtxl+QEJ0x5Yd+mGPq82/avBOj
 GzwIDW28JAi0wo6w05BRicQkZtwWkMzRY2PUlZfOVvFltN7FISuw/v3wdFHI/KbTSik9
 8KfA==
X-Gm-Message-State: AOAM530+qNWrJQwOlRqHf/XYI93stFCK7pTcvh4vzP0NVKJh9CSsvIdX
 XVzVlTY6aKLiJvDVrbtND1QEjcsQVHeKTg==
X-Google-Smtp-Source: ABdhPJwoebgbuPlRUs9mmY+QaDcxU9erLj/4g50EMFBCHG4WtyyEtb/NGcYBCtder7vx0jKdjimCYg==
X-Received: by 2002:a62:fb05:: with SMTP id x5mr2581534pfm.121.1599118022008; 
 Thu, 03 Sep 2020 00:27:02 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id x185sm1930229pfc.188.2020.09.03.00.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 00:27:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/12] target/microblaze: Introduce DISAS_EXIT_NEXT,
 DISAS_EXIT_JUMP
Date: Thu,  3 Sep 2020 00:26:45 -0700
Message-Id: <20200903072650.1360454-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200903072650.1360454-1-richard.henderson@linaro.org>
References: <20200903072650.1360454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: edgar.iglesias@xilinx.com, thuth@redhat.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Like DISAS_EXIT, except we need to update cpu_pc,
either to pc_next or to btarget respectively.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/translate.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 8ceb04f4f0..2abef328a3 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -39,6 +39,11 @@
 #define DISAS_JUMP    DISAS_TARGET_0 /* only pc was modified dynamically */
 #define DISAS_EXIT    DISAS_TARGET_1 /* all cpu state modified dynamically */
 
+/* cpu state besides pc was modified dynamically; update pc to next */
+#define DISAS_EXIT_NEXT DISAS_TARGET_2
+/* cpu state besides pc was modified dynamically; update pc to btarget */
+#define DISAS_EXIT_JUMP DISAS_TARGET_3
+
 static TCGv_i32 cpu_R[32];
 static TCGv_i32 cpu_pc;
 static TCGv_i32 cpu_msr;
@@ -1712,8 +1717,7 @@ static void mb_tr_translate_insn(DisasContextBase *dcb, CPUState *cs)
 
     /* Force an exit if the per-tb cpu state has changed.  */
     if (dc->base.is_jmp == DISAS_NEXT && dc->cpustate_changed) {
-        dc->base.is_jmp = DISAS_EXIT;
-        tcg_gen_movi_i32(cpu_pc, dc->base.pc_next);
+        dc->base.is_jmp = DISAS_EXIT_NEXT;
     }
 }
 
@@ -1734,12 +1738,14 @@ static void mb_tr_tb_stop(DisasContextBase *dcb, CPUState *cs)
         return;
 
     case DISAS_EXIT:
-        if (unlikely(cs->singlestep_enabled)) {
-            gen_raise_exception(dc, EXCP_DEBUG);
-        } else {
-            tcg_gen_exit_tb(NULL, 0);
-        }
-        return;
+        break;
+    case DISAS_EXIT_NEXT:
+        tcg_gen_movi_i32(cpu_pc, dc->base.pc_next);
+        break;
+    case DISAS_EXIT_JUMP:
+        tcg_gen_mov_i32(cpu_pc, cpu_btarget);
+        tcg_gen_discard_i32(cpu_btarget);
+        break;
 
     case DISAS_JUMP:
         if (dc->jmp_dest != -1 && !cs->singlestep_enabled) {
@@ -1781,6 +1787,13 @@ static void mb_tr_tb_stop(DisasContextBase *dcb, CPUState *cs)
     default:
         g_assert_not_reached();
     }
+
+    /* Finish DISAS_EXIT_* */
+    if (unlikely(cs->singlestep_enabled)) {
+        gen_raise_exception(dc, EXCP_DEBUG);
+    } else {
+        tcg_gen_exit_tb(NULL, 0);
+    }
 }
 
 static void mb_tr_disas_log(const DisasContextBase *dcb, CPUState *cs)
-- 
2.25.1


