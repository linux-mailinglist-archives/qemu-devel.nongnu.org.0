Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 910326F50DC
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:12:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6Uw-0006zM-AS; Wed, 03 May 2023 03:01:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6UC-00061E-Sd
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:01:14 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6U5-00038X-Co
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:01:11 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f19afc4f60so29531245e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097263; x=1685689263;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mj3a+zcWVqs2C3w0reTnX7wZZ61td92YW4iK8rO87Zg=;
 b=b0Ez72VVo5hAUQZeXMwXjlELdflMX6uvKMg9B+W28E1aJHg6ywgSVu7WeaW7wA/lM5
 v/mEmJ/ilUl6hr4Y6MAkx+59t+ME+LD3ujdnSPHwY31C/ASQ8Qw5VHL9M97b8nncA6GX
 ACpittC0cowBdmhLPP2ZfdPsxqke6C8D8a1GF6REcon9V19kKz1M9YwX7bMwN2ZqUq3G
 nuZVcEWt7g1wdykiLhAWnOCIANoKjBeW2UptQ5mhYDX1ADq3zTsbEVoAoE3K+9NA3Il3
 pafNkvambBY7gz7l9OpAWlLXVm6eW4lwcx4kE/hshWoAu23OrEo90aG+fThQaWrKu7xZ
 SepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097263; x=1685689263;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mj3a+zcWVqs2C3w0reTnX7wZZ61td92YW4iK8rO87Zg=;
 b=Vo0UA+c79rd8Pa9UEEPXgVO8sPg5OdWALzc4a6qxNZLIg7tGMRmaeyWYLVpE5wSUn3
 DBfr4zNNhpL2xykAX9WRijbWLWjFDeSt9hp4RVP8MgYlVRY6L3A98sv4tJ0CcaqGWdIJ
 /T9D5ZRzgoUhvWuKeLOgcqLb/17c94OMvcspVBHKC2Qzc+cJTxlWNZdRZAg497HOko0C
 Rzi4W9pPErUeDwZBt7g+laqL983Z+rR2ZI67hLhMtIdGmzl8H8ZsOlp7XIogCTenCeT3
 1vKYN3DJmviGaRdnypqxPxMHfrBjtA2ertXglsshEDJXZsKbZutkKBgCF00q9WANGjYR
 etmg==
X-Gm-Message-State: AC+VfDx/bA1n8JOJySMCOWU5+prJQUEkC1mm3a+HC73NAzj8HTz2HYc+
 OapUXmd8ekm23lZlpoXzi9WlY0NpQyf8Doay5xfLLg==
X-Google-Smtp-Source: ACHHUZ6tQPosyjiG1P218rGD611TcWytB/PDNUwFgpD0jUjxj2NUPCr3QwgsPwJC0XN11T+D64M+dQ==
X-Received: by 2002:a05:600c:22d2:b0:3f1:6458:99a7 with SMTP id
 18-20020a05600c22d200b003f1645899a7mr14101171wmg.38.1683097263182; 
 Wed, 03 May 2023 00:01:03 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a1ced02000000b003f19b3d89e9sm905035wmh.33.2023.05.03.00.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:01:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 42/54] tcg/riscv: Convert tcg_out_qemu_{ld,st}_slow_path
Date: Wed,  3 May 2023 07:57:17 +0100
Message-Id: <20230503065729.1745843-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
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


