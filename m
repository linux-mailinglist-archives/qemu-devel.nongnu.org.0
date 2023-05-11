Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 522BB6FED8B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:07:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1It-00071s-8p; Thu, 11 May 2023 04:05:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1Ib-0006PC-6s
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:17 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1IT-0000zl-GB
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:16 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9659c5b14d8so1353011866b.3
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683792307; x=1686384307;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gGX1OvBPBJZ0dJTeWQA17dDEsVv5029y7NlB8JCmIAo=;
 b=sI/IRxR2ODrHpeebLZ6menmGfU2l1SS02AUjebBvw3+X8dHVSWTbS7l/ipjq/FDntp
 NtCEsmWNBifgPtEVxnWcEHvEwKII2ZG8GLvSLWAJ36TxdgPJCUuPS4tygpqk4HkoZWf1
 4kpQdNNfG0o5+urs7vOZVzaaVnV/AODcznOBVcOaaMTQkFXwEDeqvvWtA0Hdv+epgQQm
 P8ehXY9aAr4ERNT5Pt1dUZ2eoQRZklLV5kpzPBSvu0QuHCjHI34+LJyL/wG+Dy8c7D8Y
 0dDDMLunA7jys8JB10Ve64JJpYLR9eTzgFUY98LG2oOQgCSLAv/psAxJlg/ZoSEorTwc
 w4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683792307; x=1686384307;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gGX1OvBPBJZ0dJTeWQA17dDEsVv5029y7NlB8JCmIAo=;
 b=f0wj/WBf++ws0gRtVOvIbpgx3gu6GvLuo+dDi4Mv3FXRxuN8RY4ClkQ9Bsm1FWaW74
 IgSpjTwDMNKiTBq2SYUj8MQhYeixmCXzICVGzJGWW9JS/8giWDWwAyqn6nQTg/lfn2/b
 Fkyu6wCuKBwPc75p96v0bc7Tb5FnDIdL7XaPsuYlBhmNph3DlUlIcTFmVcdA+X2K4lw4
 dqOdHnzPioBHTtU1DNE6nXjSfpc5cyEzJr3Z8LtZPjIa/B02ZCKX3XQTfb9NACM6nNCu
 2jcANlwpOw23EcXnHVDs/lMQS41CPVfXQSxgr8dGFpNYYUwtfsFolVt1cxvJ+ZHRTmTf
 14lQ==
X-Gm-Message-State: AC+VfDxFMdYya3NYU1MaohbGLMro67jrwDFS19REoubEUKt+c/NyS4m2
 7U3LDwNJyf+lFiqX7pd3lU4Vz/eckH5jYbW6e/RCWw==
X-Google-Smtp-Source: ACHHUZ5okSQXBFMGGqTFGsyMf/0pl+AEGe8HFVsxT/lZWKRoi64X7kF0BDyNZU5e4bPhRanrtCSPAw==
X-Received: by 2002:a17:907:96a1:b0:966:a691:678d with SMTP id
 hd33-20020a17090796a100b00966a691678dmr13271605ejc.51.1683792306637; 
 Thu, 11 May 2023 01:05:06 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 i12-20020aa7c70c000000b0050bd7267a5csm2662095edq.58.2023.05.11.01.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:05:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 22/53] tcg/i386: Convert tcg_out_qemu_st_slow_path
Date: Thu, 11 May 2023 09:04:19 +0100
Message-Id: <20230511080450.860923-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511080450.860923-1-richard.henderson@linaro.org>
References: <20230511080450.860923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Use tcg_out_st_helper_args.  This eliminates the use of a tail call to
the store helper.  This may or may not be an improvement, depending on
the call/return branch prediction of the host microarchitecture.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 57 +++------------------------------------
 1 file changed, 4 insertions(+), 53 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 3508b9cc6c..a01bfad773 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1854,11 +1854,8 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
  */
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
-    MemOpIdx oi = l->oi;
-    MemOp opc = get_memop(oi);
-    MemOp s_bits = opc & MO_SIZE;
+    MemOp opc = get_memop(l->oi);
     tcg_insn_unit **label_ptr = &l->label_ptr[0];
-    TCGReg retaddr;
 
     /* resolve label address */
     tcg_patch32(label_ptr[0], s->code_ptr - label_ptr[0] - 4);
@@ -1866,56 +1863,10 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
         tcg_patch32(label_ptr[1], s->code_ptr - label_ptr[1] - 4);
     }
 
-    if (TCG_TARGET_REG_BITS == 32) {
-        int ofs = 0;
+    tcg_out_st_helper_args(s, l, &ldst_helper_param);
+    tcg_out_branch(s, 1, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
 
-        tcg_out_st(s, TCG_TYPE_PTR, TCG_AREG0, TCG_REG_ESP, ofs);
-        ofs += 4;
-
-        tcg_out_st(s, TCG_TYPE_I32, l->addrlo_reg, TCG_REG_ESP, ofs);
-        ofs += 4;
-
-        if (TARGET_LONG_BITS == 64) {
-            tcg_out_st(s, TCG_TYPE_I32, l->addrhi_reg, TCG_REG_ESP, ofs);
-            ofs += 4;
-        }
-
-        tcg_out_st(s, TCG_TYPE_I32, l->datalo_reg, TCG_REG_ESP, ofs);
-        ofs += 4;
-
-        if (s_bits == MO_64) {
-            tcg_out_st(s, TCG_TYPE_I32, l->datahi_reg, TCG_REG_ESP, ofs);
-            ofs += 4;
-        }
-
-        tcg_out_sti(s, TCG_TYPE_I32, oi, TCG_REG_ESP, ofs);
-        ofs += 4;
-
-        retaddr = TCG_REG_EAX;
-        tcg_out_movi(s, TCG_TYPE_PTR, retaddr, (uintptr_t)l->raddr);
-        tcg_out_st(s, TCG_TYPE_PTR, retaddr, TCG_REG_ESP, ofs);
-    } else {
-        tcg_out_mov(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[0], TCG_AREG0);
-        tcg_out_mov(s, TCG_TYPE_TL, tcg_target_call_iarg_regs[1],
-                    l->addrlo_reg);
-        tcg_out_mov(s, (s_bits == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
-                    tcg_target_call_iarg_regs[2], l->datalo_reg);
-        tcg_out_movi(s, TCG_TYPE_I32, tcg_target_call_iarg_regs[3], oi);
-
-        if (ARRAY_SIZE(tcg_target_call_iarg_regs) > 4) {
-            retaddr = tcg_target_call_iarg_regs[4];
-            tcg_out_movi(s, TCG_TYPE_PTR, retaddr, (uintptr_t)l->raddr);
-        } else {
-            retaddr = TCG_REG_RAX;
-            tcg_out_movi(s, TCG_TYPE_PTR, retaddr, (uintptr_t)l->raddr);
-            tcg_out_st(s, TCG_TYPE_PTR, retaddr, TCG_REG_ESP,
-                       TCG_TARGET_CALL_STACK_OFFSET);
-        }
-    }
-
-    /* "Tail call" to the helper, with the return address back inline.  */
-    tcg_out_push(s, retaddr);
-    tcg_out_jmp(s, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
+    tcg_out_jmp(s, l->raddr);
     return true;
 }
 #else
-- 
2.34.1


