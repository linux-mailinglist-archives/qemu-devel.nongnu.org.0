Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D849258141
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Aug 2020 20:43:04 +0200 (CEST)
Received: from localhost ([::1]:47336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kColj-0006Ep-2S
	for lists+qemu-devel@lfdr.de; Mon, 31 Aug 2020 14:43:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCojD-0001gu-RY
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 14:40:28 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:46121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCojA-0007CO-Qy
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 14:40:27 -0400
Received: by mail-pg1-x541.google.com with SMTP id 31so1097392pgy.13
 for <qemu-devel@nongnu.org>; Mon, 31 Aug 2020 11:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/FRfwFQyl+rc/4qcCbyfg/WRxye2H27LBDcRzwljzQ4=;
 b=Xwp19xuBJGrAMWYsuVPiFC4jVsRyqzhwzUPQCd6teqVH+Uhm/wZRPuwZJ4cmdt+8hE
 e59uxRdHHiNpd/CAE1y38qi+azhq4H8pG8Fq71HTIowNUQtaHb4SoE9iQF5r5LNI04qP
 /ED5MPxm3edvs/U17a9+5X1a/fW6TtH9t+JOJEDEWdvoeYu+8CnRYvLfp2EPJl0cMmfe
 ifGZKeU5BIRfc2N0jzUsuKUcIqlSyrc0VOgx96wm6VobWS5oL/LwTfTYuhGnnoyH5COr
 GdFMy9gv2uWAesJBbTHa/7mWlXZ2eircgmcHC7hrpWMmGGxGXz5Ax0af5AnsGOr5HNV4
 PYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/FRfwFQyl+rc/4qcCbyfg/WRxye2H27LBDcRzwljzQ4=;
 b=PDSmfnF9xwjCt2+JdhPbZeSSkLLZOWyk2pJyTZKI8iN3fdWVuuqQLMRa0c2goeA33b
 wVhl49DuAAP8u7ZLufFrZvEwhDM1POe4OF4dx/0CvoTi+ZnA+3np+sX0SFU7OaVI/I+M
 J0VTONrhvjgVvTMeLcUluugjMUs3/wyLRG0c5V0T390ZQwFp59/w1LxL2DX2ZscWmYzo
 4XSKdumXeAzMfL9/LX9qA7GukMg2glP6O5ub9sWT6moHfH2xppDcGy55XZdgwmc6MyUo
 Lb9MUQqn1XeesEgvDf2Di3kxdBaLPFMzQlttEt7vC7RdRCwigtAu14VNZr80aZlsY7r+
 XN9A==
X-Gm-Message-State: AOAM53243FLo6a07NSyUv+G7SzUUsCDDAnZtzp0NVL+fqcxB+IBnqESx
 TSAVYbH7a3bC9k5jsvMACNsKhkMtVVNibA==
X-Google-Smtp-Source: ABdhPJx1uvXrIDpWKXPwNOSqgaYj/iRdRuhN9wWvbmbvgwuvSD7KHdzXlkM0yWXTReqTsLDTZwqkDA==
X-Received: by 2002:a62:8003:: with SMTP id j3mr2385450pfd.221.1598899223109; 
 Mon, 31 Aug 2020 11:40:23 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id y195sm5757580pfc.137.2020.08.31.11.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 11:40:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] target/microblaze: Introduce DISAS_EXIT_NEXT,
 DISAS_EXIT_JUMP
Date: Mon, 31 Aug 2020 11:40:14 -0700
Message-Id: <20200831184018.839906-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200831184018.839906-1-richard.henderson@linaro.org>
References: <20200831184018.839906-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
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
Cc: edgar.iglesias@xilinx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Like DISAS_EXIT, except we need to update cpu_pc,
either to pc_next or to btarget respectively.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/translate.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 03fc653ce2..0733728794 100644
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


