Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 617432EE6D1
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 21:28:03 +0100 (CET)
Received: from localhost ([::1]:54234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxbt4-0007aG-B8
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 15:28:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbhW-0001XV-5h
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:16:06 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:38855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbhK-0001gq-2j
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:16:02 -0500
Received: by mail-pg1-x536.google.com with SMTP id q7so3833688pgm.5
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 12:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mZ7Cv5t9pDHcLwkTAHUkGoZLzbW+EIVJw5j5xRLRZ3w=;
 b=Rr7zdVBKld8yeDdRDoelwDknALAaiBZl2FT9IIgShFkR5o0tdcBV6/eIvn++b6DaMp
 iGplZVlFqruHqZlo3EcVCrzYTh69d8pFwhqYYaOxC+v6JWc3/ofRuX5cHNgDJuk7I6pN
 Wz2OpQOP1cDkCAbQRasOcwMTQ7ToZA/o2Rz+2aIYv3EHHmdIaKy3jDXTObVQcTuZ259S
 0OKukH+UZrj0fbTVhIi1H+qc0kjuwljbpb9Wt/PwfyVSDJia28/JVFnk95v2KJjVeKwK
 15YSd1TNX94mMvv0F8PalZMqNOVftr/opPeTyrf5MngFO7HU/P524fhW4gYhXaXwctPQ
 sETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mZ7Cv5t9pDHcLwkTAHUkGoZLzbW+EIVJw5j5xRLRZ3w=;
 b=rFsVhphMwqu1pflJO5OcShggbpP54xBHnd8A55zbyIgnP3lxNXIoMykWnO/fvAeOdU
 ac24I5gxHaCUU+DMBRTkWAST+CmQ7pnblNLie2lECo6qu2dupWAyaLV/q9EAKoUA/zAO
 4Wa3EM2D5zjQDJ+x58fmxRiUuqmFf6BlD4BfSo8ILfxnOzmsngNoHynYAWHi71frrBOi
 NIfSrGkxGly9m1cDmgGSwX9x1XUc9SBnJWqE/MYZcVQ1TDno8O9FNqtrhhGFNEALoQcH
 XhWZdxAHSZKxeQ1anGaVHj09bd5xwJVQ2+ABaSvMUnIq28Gr29WefZ37KqSuFFgiBqPN
 zGCA==
X-Gm-Message-State: AOAM5306OODYEGydei3oG9H+1diyaSJonxQfeTCNkSD2fPjcu3lqJwl3
 A8WgNM2czK4I0mDxGjA4ZbToiGkxzupkKQ==
X-Google-Smtp-Source: ABdhPJyb/IPP26i4eHv7UNaHwvyetgpSf1N8Li+FADwaSI6NW96xNjm5O/+gofnrU3x/k63IUpdleQ==
X-Received: by 2002:a63:520e:: with SMTP id g14mr3430556pgb.378.1610050551080; 
 Thu, 07 Jan 2021 12:15:51 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v6sm6516265pfi.31.2021.01.07.12.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 12:15:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 34/47] tcg/sparc: Use tcg_tbrel_diff
Date: Thu,  7 Jan 2021 10:14:35 -1000
Message-Id: <20210107201448.1152301-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107201448.1152301-1-richard.henderson@linaro.org>
References: <20210107201448.1152301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc/tcg-target.c.inc | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index d599ae27b5..8f04fdf981 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -440,7 +440,7 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
 
     /* A 13-bit constant relative to the TB.  */
     if (!in_prologue && USE_REG_TB) {
-        test = arg - (uintptr_t)s->code_gen_ptr;
+        test = tcg_tbrel_diff(s, (void *)arg);
         if (check_fit_ptr(test, 13)) {
             tcg_out_arithi(s, ret, TCG_REG_TB, test, ARITH_ADD);
             return;
@@ -537,15 +537,15 @@ static inline bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
     return false;
 }
 
-static void tcg_out_ld_ptr(TCGContext *s, TCGReg ret, uintptr_t arg)
+static void tcg_out_ld_ptr(TCGContext *s, TCGReg ret, const void *arg)
 {
-    intptr_t diff = arg - (uintptr_t)s->code_gen_ptr;
+    intptr_t diff = tcg_tbrel_diff(s, arg);
     if (USE_REG_TB && check_fit_ptr(diff, 13)) {
         tcg_out_ld(s, TCG_TYPE_PTR, ret, TCG_REG_TB, diff);
         return;
     }
-    tcg_out_movi(s, TCG_TYPE_PTR, ret, arg & ~0x3ff);
-    tcg_out_ld(s, TCG_TYPE_PTR, ret, ret, arg & 0x3ff);
+    tcg_out_movi(s, TCG_TYPE_PTR, ret, (uintptr_t)arg & ~0x3ff);
+    tcg_out_ld(s, TCG_TYPE_PTR, ret, ret, (uintptr_t)arg & 0x3ff);
 }
 
 static inline void tcg_out_sety(TCGContext *s, TCGReg rs)
@@ -1313,7 +1313,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
             tcg_out_movi_imm13(s, TCG_REG_O0, a0);
             break;
         } else if (USE_REG_TB) {
-            intptr_t tb_diff = a0 - (uintptr_t)s->code_gen_ptr;
+            intptr_t tb_diff = tcg_tbrel_diff(s, (void *)a0);
             if (check_fit_ptr(tb_diff, 13)) {
                 tcg_out_arithi(s, TCG_REG_G0, TCG_REG_I7, 8, RETURN);
                 /* Note that TCG_REG_TB has been unwound to O1.  */
@@ -1345,8 +1345,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
             }
         } else {
             /* indirect jump method */
-            tcg_out_ld_ptr(s, TCG_REG_TB,
-                           (uintptr_t)(s->tb_jmp_target_addr + a0));
+            tcg_out_ld_ptr(s, TCG_REG_TB, s->tb_jmp_target_addr + a0);
             tcg_out_arithi(s, TCG_REG_G0, TCG_REG_TB, 0, JMPL);
             tcg_out_nop(s);
         }
-- 
2.25.1


