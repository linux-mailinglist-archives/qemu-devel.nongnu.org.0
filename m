Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBC06DCED5
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 03:12:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm2Wi-0005H3-6L; Mon, 10 Apr 2023 21:10:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2WX-0003yY-Bw
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:10:17 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2WO-0001uu-Pp
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:10:12 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 e18-20020a17090ac21200b00246952d917fso4816925pjt.4
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 18:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175407;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z0TzkZkGwvP3W/rurD/DH/1BeGi6qkBSt5gUCUNt6eQ=;
 b=oKiHGhSC7dxrG+CBlWAlNmSyZnIa6EpmvVNG2UNj1opIPi482fp59tFrYRldGR2Xqn
 /Jv/ONwcFzdK2XTWEGQqKtk/DoiMYWkfcN93wQTa0CcTO8T9jragvjI18k1iEjYgXc//
 RFtXdXfq+G8fNzUy5Z9itSMjvssEWq7cS/ozjBa5556fjZaNifQvnQ6AkMV7ds6SQExe
 SG1qII5CMlROXfYOz10JQ1EBKkJdGqtBImOtRWMk/Ja6TxSEJmAbu28unBehnV8vnhJk
 FZ1oBRYl6nLuKl7nAbPkzMdsDtCZ9rVijJ+JvFY4DzmaZq7tIwiwwKLpcbKHsU0y0oJs
 CKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175407;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z0TzkZkGwvP3W/rurD/DH/1BeGi6qkBSt5gUCUNt6eQ=;
 b=BGSQi7p/1qcX/Qr3syYtut4mV0SESZnRXGzv8HKklrH1H6pJSZqkGtV920c7joWvCz
 RoaHsM97FpHPqBNtnjRRPOrdCJ+BHpWqiwdt1xvIUYnIVtz0vev+RioiekM3QJFUSLpM
 ccqxrE/tN7JayWjR+XyilbTF4Lbm1kdyGNd6Bmg6Y8HcWrHZqC4pWvpbBb6btmNharil
 /AWvmLGtEqjODVffBE1tUPqY/bqiqhOdmjw6F847wZnGix0+orb0HNW+XfkHi5wTLbnD
 IV+eRtXEt6hj9DO/l483sg6+1vP22MnC9ISQqO2thdMKSpXMjdYZF8Yzjmc4Sosp5VYA
 1yNA==
X-Gm-Message-State: AAQBX9cRtwgceybcm4ClNyUyrm6H1fXfd2nRU7tDgf1fSSNMeNZYu3se
 cG5GBqHtSeZKbIO0TPK3wZIcv0Ztx9+wdQpyMGRfmg==
X-Google-Smtp-Source: AKy350YiU6pI582jgSyutXd6928AINyylEAfPQEqX+6blq9RDMAs2L1kHMxszDFm/EstkUqPcZzXyg==
X-Received: by 2002:a17:90b:224b:b0:246:a5b5:eb26 with SMTP id
 hk11-20020a17090b224b00b00246a5b5eb26mr1463406pjb.41.1681175407174; 
 Mon, 10 Apr 2023 18:10:07 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a1709028a8c00b001a63deeb5e2sm2652130plo.92.2023.04.10.18.10.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:10:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 43/54] tcg/riscv: Convert tcg_out_qemu_{ld,st}_slow_path
Date: Mon, 10 Apr 2023 18:05:01 -0700
Message-Id: <20230411010512.5375-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 37 ++++++++++---------------------------
 1 file changed, 10 insertions(+), 27 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index d4134bc86f..425ea8902e 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -994,14 +994,14 @@ static void add_qemu_ldst_label(TCGContext *s, int is_ld, MemOpIdx oi,
     label->label_ptr[0] = label_ptr[0];
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
@@ -1009,13 +1009,9 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
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
@@ -1023,14 +1019,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
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
@@ -1038,13 +1027,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
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


