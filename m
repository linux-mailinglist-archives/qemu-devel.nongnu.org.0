Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2AC30E9FE
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:12:31 +0100 (CET)
Received: from localhost ([::1]:46614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7U8E-00020y-O5
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:12:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TiT-0004x7-JM
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:53 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:46777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TiR-0003pH-SA
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:53 -0500
Received: by mail-pf1-x42f.google.com with SMTP id f63so1046685pfa.13
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aEJQJ28aTfFYwWXCrc4/tQ7PstJpDur23rDVFAChQBo=;
 b=RixZ2tfG4LIRL+V3EXWjLFxaErEiHAkX62uedpc/7udtA6rqMVPDJP36G6hDNwBK6G
 tfsst1+7V2O8zecmXnWirr8AtTxdNQmcgNExM0tb//8vX62CsdS2ZrJQUf1e41PsfabG
 pz65jsZYndxld7EQIqJ4RzZs1LS7M36oR5d+nJipqV+6hL2I1SqU5EGGFni3gUQid11V
 GRmrIsodM00q7mAZD5vkoj3wOQfJRrS4YfUk1r9lKGiSfdmlH+H0LEs6QW6eMYJTZb4l
 OSdDUaaHceEW4HQE1DmZMytffHm1GRqdyYY7iLZBvSJecGaF1feeccJ2UslQ7Kc02BWT
 mtlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aEJQJ28aTfFYwWXCrc4/tQ7PstJpDur23rDVFAChQBo=;
 b=WNEv5FI/6ibUsqLrh5ojbCLOmy9LOQiFQ6YxRqikfHAsUJXA4bhlP911NuejO0h30N
 8Ux+j4sPdnPL3PSe4I77gzeBe1vqLcZMuXovrjZY3bpDEMdzhhtVuZWiXHYv6n1gxSG7
 UND0pCNORovIFNFjWCLophLWNHd5kouNUPgMTldBuZld7DodN2ErUB9yhOb4sE54iEb8
 gKRaQnfDGqdXJylCNooI0BkeNEtLC+t4RpHzvBkI3KmLztBZjvT6TADTUHzXXkuNOArj
 FPT5VuTEXasufPm1VpR9JJufBLCI9Kkzr7oY7QzJN9fkgtBt1vjtwI2ULPgohUyBpvWW
 uZtw==
X-Gm-Message-State: AOAM530mH4pNPjHWxQHLi+94jvGXzbJDuh5rsA+EyMjgX10px0bbLNHZ
 ytUSawj1eW+otSJD4Ll7zky22ssxkSet0m+S
X-Google-Smtp-Source: ABdhPJwflp2+Jr+UrevoEzwyTX6jknaYbF3jvW8+AmcjvCgS3w0ONZlFC7DqTaI2BMRMP73q49TWsQ==
X-Received: by 2002:a65:4983:: with SMTP id r3mr6716986pgs.288.1612403150550; 
 Wed, 03 Feb 2021 17:45:50 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.45.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:45:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/93] tcg/tci: Move stack bounds check to compile-time
Date: Wed,  3 Feb 2021 15:43:56 -1000
Message-Id: <20210204014509.882821-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: sw@weilnetz.de, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The existing check was incomplete:
(1) Only applied to two of the 7 stores, and not to the loads at all.
(2) Only checked the upper, but not the lower bound of the stack.

Doing this at compile time means that we don't need to do it
at runtime as well.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c                |  2 --
 tcg/tci/tcg-target.c.inc | 13 +++++++++++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index fe935e71a3..ee2cd7dfa2 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -628,7 +628,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t0 = tci_read_r32(regs, &tb_ptr);
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
-            tci_assert(t1 != sp_value || (int32_t)t2 < 0);
             *(uint32_t *)(t1 + t2) = t0;
             break;
 
@@ -884,7 +883,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t0 = tci_read_r64(regs, &tb_ptr);
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
-            tci_assert(t1 != sp_value || (int32_t)t2 < 0);
             *(uint64_t *)(t1 + t2) = t0;
             break;
 
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index f0f6b13112..82efb9af60 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -375,10 +375,20 @@ static void tci_out_label(TCGContext *s, TCGLabel *label)
     }
 }
 
+static void stack_bounds_check(TCGReg base, target_long offset)
+{
+    if (base == TCG_REG_CALL_STACK) {
+        tcg_debug_assert(offset < 0);
+        tcg_debug_assert(offset >= -(CPU_TEMP_BUF_NLONGS * sizeof(long)));
+    }
+}
+
 static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg1,
                        intptr_t arg2)
 {
     uint8_t *old_code_ptr = s->code_ptr;
+
+    stack_bounds_check(arg1, arg2);
     if (type == TCG_TYPE_I32) {
         tcg_out_op_t(s, INDEX_op_ld_i32);
         tcg_out_r(s, ret);
@@ -514,6 +524,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     case INDEX_op_st16_i64:
     case INDEX_op_st32_i64:
     case INDEX_op_st_i64:
+        stack_bounds_check(args[1], args[2]);
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
         tcg_debug_assert(args[2] == (int32_t)args[2]);
@@ -716,6 +727,8 @@ static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg, TCGReg arg1,
                        intptr_t arg2)
 {
     uint8_t *old_code_ptr = s->code_ptr;
+
+    stack_bounds_check(arg1, arg2);
     if (type == TCG_TYPE_I32) {
         tcg_out_op_t(s, INDEX_op_st_i32);
         tcg_out_r(s, arg);
-- 
2.25.1


