Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6676F8FF9
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 09:28:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvCGA-0004iz-UZ; Sat, 06 May 2023 03:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCG7-0004f6-J2
 for qemu-devel@nongnu.org; Sat, 06 May 2023 03:23:11 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCFo-0004SD-Ic
 for qemu-devel@nongnu.org; Sat, 06 May 2023 03:23:11 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f193ca059bso16893855e9.3
 for <qemu-devel@nongnu.org>; Sat, 06 May 2023 00:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683357770; x=1685949770;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mj3a+zcWVqs2C3w0reTnX7wZZ61td92YW4iK8rO87Zg=;
 b=Q7AUr5FfRa6JPB7ZgojgUuypgrcrd+YukMgxC9AMur5zGPVcIDlWfE04HkjGGFPqje
 L2fZLAZ0cwqwgZv0VnUfa7fCv0DeIpKs1Icp2QgjWDe27J2o3uuDfgmS7x1EMBAdITK/
 83HBgGz2b6vkLDjGNjiUqW5RoB091SwFuz5h/DhBOSwPu9wtWa5d2qBdyVmnd/kPAyGl
 ++nLOgILq80xYKXJCbzxj99C8av/CoB5lkX2P0v7OxkxXHMQ/IVntIKjvkE+7Zxl1txw
 RTOBFXIElKgorg4SZ794eVUlKaYHsLBHT5NUTm5brJrgW0/oxNOGS6PNmEwtKJP6NXhH
 zaLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683357770; x=1685949770;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mj3a+zcWVqs2C3w0reTnX7wZZ61td92YW4iK8rO87Zg=;
 b=bXPPO7KEkC6K+92wn8JIG77g/0R286OpbkWXGI0ApIjL8uvdqaFfo+gjkEIl6AgTdc
 THqksE5sVucbBIbCLra67LDnwRBWd5KnmZuwn8BqldP3OPOcB+Qu9fQpTbP4DunNiOdP
 6hm2wDkUvybVyZtyPdgUCjveJsdx0uulhyU0VvDfiK5BKrpy3bjhdgKQ3WHYTv4kdHAR
 /xuql5PvLoo1LsF5nhc9IU6KNKIg6qIC1BjktlcJLMuAKjgFJ4Owqk1oNEpRb7JaGjjP
 CYtE1Gr4nOqS0bzJCX7Tw735jBN7i6PpjOzjeWBgk4Or3c3D2hSEsYn18mAv6KoIx0eV
 fLPA==
X-Gm-Message-State: AC+VfDy4US6pLRSbH6cWI4sv9yX+wzyvhbntB27cg4h/tGNxCa/QHjPa
 5i7Oy/b0CFpv5kuWrSCjjhJ5hRYGxGJrsoZ2m5eEcA==
X-Google-Smtp-Source: ACHHUZ5MuI33qUOB4uebDjvwEw6MRDGaqI/qqC6n1mjnb9iuEUW7P8iJ67FdyvxztGqQlXKmJWCBeA==
X-Received: by 2002:a7b:c38e:0:b0:3f0:310c:e3cf with SMTP id
 s14-20020a7bc38e000000b003f0310ce3cfmr2887721wmj.37.1683357770164; 
 Sat, 06 May 2023 00:22:50 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 x9-20020adfec09000000b002faaa9a1721sm4481223wrn.58.2023.05.06.00.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 00:22:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v5 18/30] tcg/riscv: Convert tcg_out_qemu_{ld,st}_slow_path
Date: Sat,  6 May 2023 08:22:23 +0100
Message-Id: <20230506072235.597467-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230506072235.597467-1-richard.henderson@linaro.org>
References: <20230506072235.597467-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Use tcg_out_ld_helper_args, tcg_out_ld_helper_ret,
and tcg_out_st_helper_args.

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 37 ++++++++++---------------------------
 1 file changed, 10 insertions(+), 27 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 2b2d313fe2..c22d1e35ac 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -906,14 +906,14 @@ static void tcg_out_goto(TCGContext *s, const tcg_insn_unit *target)
     tcg_debug_assert(ok);
 }
 
+/* We have three temps, we might as well expose them. */
+static const TCGLdstHelperParam ldst_helper_param = {
+    .ntmp = 3, .tmp = { TCG_REG_TMP0, TCG_REG_TMP1, TCG_REG_TMP2 }
+};
+
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
-    MemOpIdx oi = l->oi;
-    MemOp opc = get_memop(oi);
-    TCGReg a0 = tcg_target_call_iarg_regs[0];
-    TCGReg a1 = tcg_target_call_iarg_regs[1];
-    TCGReg a2 = tcg_target_call_iarg_regs[2];
-    TCGReg a3 = tcg_target_call_iarg_regs[3];
+    MemOp opc = get_memop(l->oi);
 
     /* resolve label address */
     if (!reloc_sbimm12(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
@@ -921,13 +921,9 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     }
 
     /* call load helper */
-    tcg_out_mov(s, TCG_TYPE_PTR, a0, TCG_AREG0);
-    tcg_out_mov(s, TCG_TYPE_PTR, a1, l->addrlo_reg);
-    tcg_out_movi(s, TCG_TYPE_PTR, a2, oi);
-    tcg_out_movi(s, TCG_TYPE_PTR, a3, (tcg_target_long)l->raddr);
-
+    tcg_out_ld_helper_args(s, l, &ldst_helper_param);
     tcg_out_call_int(s, qemu_ld_helpers[opc & MO_SSIZE], false);
-    tcg_out_mov(s, (opc & MO_SIZE) == MO_64, l->datalo_reg, a0);
+    tcg_out_ld_helper_ret(s, l, true, &ldst_helper_param);
 
     tcg_out_goto(s, l->raddr);
     return true;
@@ -935,14 +931,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
-    MemOpIdx oi = l->oi;
-    MemOp opc = get_memop(oi);
-    MemOp s_bits = opc & MO_SIZE;
-    TCGReg a0 = tcg_target_call_iarg_regs[0];
-    TCGReg a1 = tcg_target_call_iarg_regs[1];
-    TCGReg a2 = tcg_target_call_iarg_regs[2];
-    TCGReg a3 = tcg_target_call_iarg_regs[3];
-    TCGReg a4 = tcg_target_call_iarg_regs[4];
+    MemOp opc = get_memop(l->oi);
 
     /* resolve label address */
     if (!reloc_sbimm12(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
@@ -950,13 +939,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     }
 
     /* call store helper */
-    tcg_out_mov(s, TCG_TYPE_PTR, a0, TCG_AREG0);
-    tcg_out_mov(s, TCG_TYPE_PTR, a1, l->addrlo_reg);
-    tcg_out_movext(s, s_bits == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32, a2,
-                   l->type, s_bits, l->datalo_reg);
-    tcg_out_movi(s, TCG_TYPE_PTR, a3, oi);
-    tcg_out_movi(s, TCG_TYPE_PTR, a4, (tcg_target_long)l->raddr);
-
+    tcg_out_st_helper_args(s, l, &ldst_helper_param);
     tcg_out_call_int(s, qemu_st_helpers[opc & MO_SIZE], false);
 
     tcg_out_goto(s, l->raddr);
-- 
2.34.1


