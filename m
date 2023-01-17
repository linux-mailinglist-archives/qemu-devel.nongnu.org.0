Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A516670CEC
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 00:13:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHv6q-0003Ta-7y; Tue, 17 Jan 2023 18:11:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv6k-0003Pl-6l
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:11:10 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv6i-0001Js-2G
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:11:09 -0500
Received: by mail-pg1-x531.google.com with SMTP id 141so23223860pgc.0
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 15:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wm2x9VYi1GK8d/tbr4pBE9kGbjpSFNQ5bcLAS3uC+RE=;
 b=BMTPZnjAElD5zz9drLiCm51wUbXrfr0ElTuKLB/ZQKU6Pa/2unPXDZ6+YUuNkVLFks
 rM3wXinGoSCh2nc7rUpYQEc/v21epYy2vR6QYEiGIjWWtBhcTWQ/ycXsLksFxgN75g9I
 gCp0bY+LZHrDY4WeqpO876q4xv+Jxqv3frVrZ1qYvCVTfiD5VqrFJ4lTwdsUIjpM/Obj
 65Gb/HV8ntcpHYPPT+cx0eLUnb/VGFo6liaixad44/FOKUFJgnqJu+Sc8QeV4z6PzNKu
 Sv1M9coa9iv+Q2PFmQE8IPKzmNEQrf3NqggjDR/j/TSUL61l899HpQdqsh2eaP3sVdLA
 lS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wm2x9VYi1GK8d/tbr4pBE9kGbjpSFNQ5bcLAS3uC+RE=;
 b=4W9vBVZDLB3jEmc/hK1o6bLme+obWSYuvWHP5hCS+RO0hhX7g8XhmC+070/1yvS3+P
 zybLnSrDieyuH5shxJwX2RlRG653HWXPjYU93eiLsuXlYBXwozg+9L2AoHXurb2sbdki
 XsoYX+1P1gGX96azit1l0GG8jb15sZM4+ToFkjWeGSUqriUJdPBQpK1b8pCU/rtuPJWp
 EcfzS1ONxpVOlCo/kUvFQlsvvT+V/7GyOONG0BfkgT58o77lNpeoIEFvV1AY7MWp7gN3
 SLTDOdwVVrqRETZ0w0zI2Ub7Js69enxD5svIWmlGVOc41BLHYG/z7DtB/SAE5dotkt/V
 NHig==
X-Gm-Message-State: AFqh2kqDtAXed/UW6DZU76wOdlCztDpxl5cpQBt51ek5x5oPcZrMA8kq
 oFDR3rHN4TaLdvvmcnfsw71is5EvfaboH7iT
X-Google-Smtp-Source: AMrXdXvrRbraarrOTSf600j9mB7S0wpk4iDxvk6vezlTH9xyIkFm28x4Mp+SW4wGhztKn+jt6Z2Cuw==
X-Received: by 2002:a05:6a00:a27:b0:566:900d:a1de with SMTP id
 p39-20020a056a000a2700b00566900da1demr6512210pfh.26.1673997066537; 
 Tue, 17 Jan 2023 15:11:06 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 b193-20020a621bca000000b005810c4286d6sm20747070pfb.0.2023.01.17.15.11.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 15:11:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 07/22] tcg: Introduce get_jmp_target_addr
Date: Tue, 17 Jan 2023 13:10:36 -1000
Message-Id: <20230117231051.354444-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117231051.354444-1-richard.henderson@linaro.org>
References: <20230117231051.354444-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Similar to the existing set_jmp_reset_offset.  Include the
rw->rx address space conversion done by arm and s390x, and
forgotten by mips and riscv.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                  | 9 +++++++++
 tcg/arm/tcg-target.c.inc   | 2 +-
 tcg/mips/tcg-target.c.inc  | 2 +-
 tcg/riscv/tcg-target.c.inc | 2 +-
 tcg/tci/tcg-target.c.inc   | 2 +-
 5 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 4092dac294..2a14fc2a97 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -323,6 +323,15 @@ static void G_GNUC_UNUSED set_jmp_insn_offset(TCGContext *s, int which)
     s->tb_jmp_insn_offset[which] = tcg_current_code_size(s);
 }
 
+static uintptr_t G_GNUC_UNUSED get_jmp_target_addr(TCGContext *s, int which)
+{
+    /*
+     * Return the read-execute version of the pointer, for the benefit
+     * of any pc-relative addressing mode.
+     */
+    return (uintptr_t)tcg_splitwx_to_rx(&s->tb_jmp_target_addr[which]);
+}
+
 /* Signal overflow, starting over with fewer guest insns. */
 static G_NORETURN
 void tcg_raise_tb_overflow(TCGContext *s)
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 033ff90daa..83b6d77e2e 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1954,7 +1954,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
             TCGReg base = TCG_REG_PC;
 
             qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
-            ptr = (intptr_t)tcg_splitwx_to_rx(s->tb_jmp_target_addr + args[0]);
+            ptr = get_jmp_target_addr(s, args[0]);
             dif = tcg_pcrel_diff(s, (void *)ptr) - 8;
             dil = sextract32(dif, 0, 12);
             if (dif != dil) {
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 02887d7cb1..c30173ab64 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1989,7 +1989,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         /* indirect jump method */
         qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
         tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP0, TCG_REG_ZERO,
-                   (uintptr_t)(s->tb_jmp_target_addr + a0));
+                   get_jmp_target_addr(s, a0));
         tcg_out_opc_reg(s, OPC_JR, 0, TCG_TMP0, 0);
         tcg_out_nop(s);
         set_jmp_reset_offset(s, a0);
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index b977c8025d..5b2eac6ab8 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1314,7 +1314,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
         /* indirect jump method */
         tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_REG_ZERO,
-                   (uintptr_t)(s->tb_jmp_target_addr + a0));
+                   get_jmp_target_addr(s, a0));
         tcg_out_opc_imm(s, OPC_JALR, TCG_REG_ZERO, TCG_REG_TMP0, 0);
         set_jmp_reset_offset(s, a0);
         break;
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index ad356f1875..59daffc0a0 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -605,7 +605,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_goto_tb:
         qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
         /* indirect jump method. */
-        tcg_out_op_p(s, opc, s->tb_jmp_target_addr + args[0]);
+        tcg_out_op_p(s, opc, (void *)get_jmp_target_addr(s, args[0]));
         set_jmp_reset_offset(s, args[0]);
         break;
 
-- 
2.34.1


