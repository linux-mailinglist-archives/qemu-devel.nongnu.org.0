Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6E8515FBE
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 20:04:05 +0200 (CEST)
Received: from localhost ([::1]:54862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkrRs-00027x-Fp
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 14:04:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkrI5-0004gD-3k
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:53:57 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:43668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkrI3-00083U-6R
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:53:56 -0400
Received: by mail-pg1-x534.google.com with SMTP id q76so5757643pgq.10
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 10:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oRQ/mar5G+infSJc2ilEsVMhvFAJHQK4f6Z4DpycXng=;
 b=B5EzusbRaKIs5/osk46dWpWhp1IBzqQJUhC8miGqWyYajWJuQ4oqw3uDzJiezGKFnV
 I4XLJEi+aM/FQj63yzOL90tqGKwAuZjGzJapv/Ynj1reZZkxjK+jB3Qk7fO3OGeVOB4t
 fRABalxbQWBQOOajpsYIEk3VLVr4U3XyOdiFgN/q04NWJhyYvZMppBfDzGYBbP25JiRG
 JH6oPjtnnNxnnSATcj9Ove8cIcwk55KBVcQkQM3FBR8W/WsMoORLfqx++rKhdOby7B+Y
 7zV2kc6s5ZmgE5Cs1Fpy0LF5lXVHf3pIaJbTUTooPPzAjJwnPW+QKLGomnsLa4Yb54H5
 b54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oRQ/mar5G+infSJc2ilEsVMhvFAJHQK4f6Z4DpycXng=;
 b=7TO063OiQgM0pbfcwJGDm3IPm/rOdC6jD6LYLL7VlfcWnsV3g5HIhMO+4YPr1VXeWP
 Ou2IW7BArnbiRBmMnfs3pUE3wF7Vx2XXNyYPtV1AtzFCf5R2fCtQGegPwZI2CEPrOp54
 bMahrCpEq+B06G8AQt1ZHN7Dm5y2A5rFWnrWfDTBHHTqxXSV/2ki8/1g+L88g8eRBZwG
 G1E4VA8xScfBMNQS5oBoPva6Pmycy3heFO/qnfoC5nOgnita4qMgJaCTE2/Sy+OzNUAF
 NNiMKEZ1SjQ7KpfRThs8KktpB7pdS0ErOeJKa6Eq14LYALUbVpw+c3H5w/sKQxT0U3vN
 eljw==
X-Gm-Message-State: AOAM533HH7uCmJ5h6wY9AYkd1ZiYhwWEVWArcHpeZfQMYc5n845Og71Y
 cgoKjoDQ/rdyzFs6K1JACX4fAU/ECEKsJw==
X-Google-Smtp-Source: ABdhPJwvmJ7ZFAo8061vI/clZ0Qm6MDsGQ4RZqueYQP+7GFESvaSsDUVzyanpFOHQj1jrjVFq4dL5Q==
X-Received: by 2002:a63:18f:0:b0:37c:4671:a2ce with SMTP id
 137-20020a63018f000000b0037c4671a2cemr3888862pgb.429.1651341233958; 
 Sat, 30 Apr 2022 10:53:53 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 5-20020a170902c20500b0015e8d4eb282sm1740910pll.204.2022.04.30.10.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 10:53:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/17] target/m68k: Implement TPF in terms of TRAPcc
Date: Sat, 30 Apr 2022 10:53:36 -0700
Message-Id: <20220430175342.370628-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430175342.370628-1-richard.henderson@linaro.org>
References: <20220430175342.370628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TPF stands for "trap false", and is a long-form nop for ColdFire.
Re-use the immediate consumption code from trapcc; the insn will
already expand to a nop because of the TCG_COND_NEVER test
within do_trapcc.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index c4fe8abc03..bb5ed1b7b1 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -3075,22 +3075,6 @@ DISAS_INSN(addsubq)
     tcg_temp_free(dest);
 }
 
-DISAS_INSN(tpf)
-{
-    switch (insn & 7) {
-    case 2: /* One extension word.  */
-        s->pc += 2;
-        break;
-    case 3: /* Two extension words.  */
-        s->pc += 4;
-        break;
-    case 4: /* No extension words.  */
-        break;
-    default:
-        disas_undef(env, s, insn);
-    }
-}
-
 DISAS_INSN(branch)
 {
     int32_t offset;
@@ -6099,7 +6083,7 @@ void register_m68k_insns (CPUM68KState *env)
     INSN(scc,       50c0, f0c0, M68000);   /* Scc.B <EA> */
     INSN(dbcc,      50c8, f0f8, M68000);
     INSN(trapcc,    50f8, f0f8, TRAPCC);
-    INSN(tpf,       51f8, fff8, CF_ISA_A);
+    INSN(trapcc,    51f8, fff8, CF_ISA_A); /* TPF (trapf) */
 
     /* Branch instructions.  */
     BASE(branch,    6000, f000);
-- 
2.34.1


