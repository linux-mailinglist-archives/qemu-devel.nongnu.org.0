Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1CA661C1B
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 02:50:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEhBl-0000mj-P9; Sun, 08 Jan 2023 20:43:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhBj-0000lV-Hs
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:42:59 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhBh-0001X4-QO
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:42:59 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 o8-20020a17090a9f8800b00223de0364beso11214721pjp.4
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 17:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l1XkOrURQbEjzKpNCT5axppzb0ADc0C5+daoVD38V04=;
 b=zJr2KtTfNmKXeUCwZVwwI6H/awS6AH63LmlptNMa5JJdpaFvgz+Z5n0nLY3IlbYxoJ
 7wiBRRUGYUvjRew3CQz+N5JcjSZpnBBDerpmXLjlI59P8xC8XgqRRPaflhf8kDYJDPTF
 NLb9NDKLXjTSBUQkN0Qd3rA/gzBKDFb9Hfmu/BiwlVZbGAuL8XK1KmVThfzimtHwzFk/
 cTiswneICXb8/tAKNz1vQRHQ/Ibk96r2IaCgJ0G0rnWFnKVG9hUGecdk0beNCZHc/Y5g
 0sTCoIBVfuDJTxMg0/vqMvPMbp9zxyVZNnbrE+UlXsb/dK+7M7IDFdu/NOLMUSDUYrhJ
 W4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l1XkOrURQbEjzKpNCT5axppzb0ADc0C5+daoVD38V04=;
 b=uDyYs4asm4sQ5y1lnj7Wh1tmK1oVqcDPmZT//rVafU/+vkpmvrHdTvvj6KQ2XGsXA7
 ODWGoaM/fglXsWQQDmvI9WRBlivy5f+8YK7TN/dfd8CjYbxuVtt1JmvB1iMpmB4ZX1T0
 Abw+I0docguJUza+WJqwwARNYuTCZsMCG4fNY6S+Pnloz74fzPWdOLXrnBk0L2cXNkMz
 U/yl7oeTDeULGLlvrz0HOlQ4F6GrDotKNwqUwYwlgUPMjY8dF9xmduf9SMPgVXSxqaJZ
 D5mRz+nRwLuI2Z6SoElHQtD5W0wK8c0o8xcLHnkXSgI+i60b8JN+hiQBP2lpP3Mkrmtf
 EQsg==
X-Gm-Message-State: AFqh2kp6j42QtD/pg2HcQ7o+CI6d2k3s5wXqeQlrs30RMoPFo9e7jmne
 elzKGRN207xSEuM8J8mPUbdXB+/jmTrwiVnt
X-Google-Smtp-Source: AMrXdXuo0bqKQDpb0/O8s0zDh01bCeYiKMtAXsT4Hi/iPtus35uTPABMMtszyinNjiPEgWIaBrAfng==
X-Received: by 2002:a17:902:b493:b0:189:cb73:75f0 with SMTP id
 y19-20020a170902b49300b00189cb7375f0mr58055220plr.8.1673228576479; 
 Sun, 08 Jan 2023 17:42:56 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a170902ca0d00b00178b77b7e71sm4743617pld.188.2023.01.08.17.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 17:42:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 07/22] tcg: Introduce get_jmp_target_addr
Date: Sun,  8 Jan 2023 17:42:33 -0800
Message-Id: <20230109014248.2894281-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109014248.2894281-1-richard.henderson@linaro.org>
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
index edd86d6a59..f59f0bfe39 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -322,6 +322,15 @@ static void G_GNUC_UNUSED set_jmp_insn_offset(TCGContext *s, int which)
     s->tb_jmp_insn_offset[which] = tcg_current_code_size(s);
 }
 
+static uintptr_t G_GNUC_UNUSED get_jmp_target_addr(TCGContext *s, int which)
+{
+    /*
+     * Return the read-execute version of the pointer, for the benefit
+     * of any pc-relative addressing mode.
+     */
+    return (uintptr_t)tcg_splitwx_to_rx(s->tb_jmp_target_addr + which);
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


