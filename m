Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 242CF4AD2EA
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 09:16:56 +0100 (CET)
Received: from localhost ([::1]:52200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHLgE-0008Mf-MD
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 03:16:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHKkg-0000Of-93
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:17:27 -0500
Received: from [2607:f8b0:4864:20::42d] (port=47098
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHKke-00018K-1m
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:17:25 -0500
Received: by mail-pf1-x42d.google.com with SMTP id i17so17347279pfq.13
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 23:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dUr/cOpdXcovl9VYgkicbpsTWqKsk7pQ35LtJatklyk=;
 b=nxkp5w1fGUhwgZ7w84j/t1iyduJopxKEfF01+BEaYZJfE8SjdCT74G7PmIYOFhPmqT
 WulOjJx82n4mozGvoK47R77aIsA2+jM5AK6/d1sSw/Pl1haN6yKuulIzaMh0HOVXpEko
 fMwDkDL6m66bIkpbcByhxjulVKBMSSXEjuj/bODRo4sXqSBUG0nE2u3fbmynZFhJ8+YI
 m1dFbpn5rw2s2sA6KvB3WEV/AwIQR6r8mV/ti961p3piOEAg864vD0ObsLGB1y9DeyLs
 DOU4SMp8hodXrIzQsw/QUGQsvPh6WBsM2vwFi4fE+b9hKkhPMg5mC2V7ElUvXcGfo1ZL
 /GAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dUr/cOpdXcovl9VYgkicbpsTWqKsk7pQ35LtJatklyk=;
 b=recEhbjy9syCSa32YEjawh2OzWN9TqWJ+NnrUPsoK61PRO3QU9mu9gi56aGsim2MAc
 pshgUyJrmMB7ThtLC5RkMR/GkzHS9qDuI/rlkAhmlIEDNkNDha1eP8AiuDhQPmzj3oCr
 6yUlRDauhNfOxCo0tu2roqMsIUgHeLV/WdhB0HLzwIzWaVYDAps/KENs6dboDCBKLCcR
 XuG7pVBFPVxeoBHsfWjtbZ/xdiQBbO1OnebGE4tB2c651wKHP3W6uodcXuhcaNSx2UMu
 VWwlonEek2Owv3ZNAEVMrWe75XklAvvqU8GrB9jk+t+RxWUsamXSfhyozaN44ZehNrKR
 +poQ==
X-Gm-Message-State: AOAM530sooPPqFnK+QaEEbjvPYAN9VncBxAzvuhuSwwIdWKAL7KKhYkm
 McP2Ac5DLi/Z6EmINESbnE2O5ZwxN3lGjQ==
X-Google-Smtp-Source: ABdhPJwfLKDM4zBi/Q664TRQv96BHjDYLNobWEZJlu7mztKx0KONGu7jEXCNPL9K0W22eQdcRV/qcg==
X-Received: by 2002:a63:f508:: with SMTP id w8mr2557383pgh.236.1644304642178; 
 Mon, 07 Feb 2022 23:17:22 -0800 (PST)
Received: from localhost.localdomain (121-45-127-8.tpgi.com.au. [121.45.127.8])
 by smtp.gmail.com with ESMTPSA id mi11sm1543422pjb.37.2022.02.07.23.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 23:17:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 3/8] tcg/sparc: Add scratch argument to tcg_out_movi_int
Date: Tue,  8 Feb 2022 18:17:05 +1100
Message-Id: <20220208071710.320122-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208071710.320122-1-richard.henderson@linaro.org>
References: <20220208071710.320122-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will allow us to control exactly what scratch register is
used for loading the constant.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc/tcg-target.c.inc | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 576903e0d8..7b970d58e3 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -428,7 +428,8 @@ static void tcg_out_movi_imm32(TCGContext *s, TCGReg ret, int32_t arg)
 }
 
 static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
-                             tcg_target_long arg, bool in_prologue)
+                             tcg_target_long arg, bool in_prologue,
+                             TCGReg scratch)
 {
     tcg_target_long hi, lo = (int32_t)arg;
     tcg_target_long test, lsb;
@@ -483,16 +484,17 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
     } else {
         hi = arg >> 32;
         tcg_out_movi_imm32(s, ret, hi);
-        tcg_out_movi_imm32(s, TCG_REG_T2, lo);
+        tcg_out_movi_imm32(s, scratch, lo);
         tcg_out_arithi(s, ret, ret, 32, SHIFT_SLLX);
-        tcg_out_arith(s, ret, ret, TCG_REG_T2, ARITH_OR);
+        tcg_out_arith(s, ret, ret, scratch, ARITH_OR);
     }
 }
 
 static void tcg_out_movi(TCGContext *s, TCGType type,
                          TCGReg ret, tcg_target_long arg)
 {
-    tcg_out_movi_int(s, type, ret, arg, false);
+    tcg_debug_assert(ret != TCG_REG_T2);
+    tcg_out_movi_int(s, type, ret, arg, false, TCG_REG_T2);
 }
 
 static void tcg_out_ldst_rr(TCGContext *s, TCGReg data, TCGReg a1,
@@ -847,7 +849,7 @@ static void tcg_out_call_nodelay(TCGContext *s, const tcg_insn_unit *dest,
     } else {
         uintptr_t desti = (uintptr_t)dest;
         tcg_out_movi_int(s, TCG_TYPE_PTR, TCG_REG_T1,
-                         desti & ~0xfff, in_prologue);
+                         desti & ~0xfff, in_prologue, TCG_REG_O7);
         tcg_out_arithi(s, TCG_REG_O7, TCG_REG_T1, desti & 0xfff, JMPL);
     }
 }
@@ -1023,7 +1025,8 @@ static void tcg_target_qemu_prologue(TCGContext *s)
 
 #ifndef CONFIG_SOFTMMU
     if (guest_base != 0) {
-        tcg_out_movi_int(s, TCG_TYPE_PTR, TCG_GUEST_BASE_REG, guest_base, true);
+        tcg_out_movi_int(s, TCG_TYPE_PTR, TCG_GUEST_BASE_REG,
+                         guest_base, true, TCG_REG_T1);
         tcg_regset_set_reg(s->reserved_regs, TCG_GUEST_BASE_REG);
     }
 #endif
-- 
2.25.1


