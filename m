Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 409F94B1BCA
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 03:01:30 +0100 (CET)
Received: from localhost ([::1]:45484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nILFZ-0000kS-2Z
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 21:01:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKnG-00049C-1P
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:32:16 -0500
Received: from [2607:f8b0:4864:20::430] (port=41767
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKnD-0007PJ-Cs
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:32:13 -0500
Received: by mail-pf1-x430.google.com with SMTP id i30so13465187pfk.8
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 17:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zEuruAU4Gg9D5uqZ9fSiUk5LmbWCZEEQTTVVGzrpyrE=;
 b=zf8dA+3TH7Bf63/llFN9CUdTvOKqXkxdCILf0zpmsLTn4IlLNoxb6rxCbj36TZXrpa
 s+qoBGUzy9GixnJ5lMKsT3x0VuPA0HX36VGZ1VcGHEsXo9+aKCvkwBs06zYQU39LvhP2
 /7MgFbvoLToLUUx8A7oHF3tXTU5KipZWKdfWeV8OM/5rdu9EUOvWgDBpNVNstvGX/ZgM
 4AcRKp6eyY/MT6Qsvyu+BKwi8YVpmMaTBtC7d9o+ocqLCnknX6fcCVN0dmsIgD8h1pDW
 o7JV0XAihay6hWVhN5UM1Qcy2OV4kz+uR41PMW7gBu8Qv8mB9woikH6y05sIBQ3/O9MP
 nyxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zEuruAU4Gg9D5uqZ9fSiUk5LmbWCZEEQTTVVGzrpyrE=;
 b=Q7hGCK6SkhiLbQMmnL7xyLgMq3sarrVkN25cQOPAO+qlIq6tSaiVrFhRPnM7ZoH3D6
 pshkPv66SDY63t8DLlFRRcl+MNSA51lECSX4TXWye1ixrguWOHRoJVVV0NE+xaCzvSO9
 XFEft7iFotQgZqpf3SdwVjrjtiEAmfS7kZxnB5tEjPIivCt5ekEPePv02LE7bnInewX2
 j0T/rMRm4ex8e+zjMHl3fRkBStTpJMcUq8DYkELvBe8ZMOp4K1n5dRyxM90el9ulsdmn
 Hr1gIXo05+boWuCIrnOuXIXNyigHbhDuxjMvP3+ZE0/4jaK5X/Y6wJ/RkOk814Yylx9m
 Ad5g==
X-Gm-Message-State: AOAM531foPp0ZQkJ/qHsHOnd4rkhX1EiP6G8OLEXxIRzv95rGiyxjqaq
 ShgJiDn2sa+gZ6qIJUSZNlXaDjwRhyFYIYxF
X-Google-Smtp-Source: ABdhPJyqn7tbYJPbXLowmZgtz7AIcBfnJQlBpez6xaq8+kj1rMabX/HSrIItKt5wAlPe3MS8hmnkWw==
X-Received: by 2002:a65:6947:: with SMTP id w7mr1040139pgq.435.1644543130160; 
 Thu, 10 Feb 2022 17:32:10 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id h5sm25738788pfi.111.2022.02.10.17.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 17:32:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/34] tcg/s390x: Support raising sigbus for user-only
Date: Fri, 11 Feb 2022 12:30:39 +1100
Message-Id: <20220211013059.17994-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211013059.17994-1-richard.henderson@linaro.org>
References: <20220211013059.17994-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.h     |  2 --
 tcg/s390x/tcg-target.c.inc | 59 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 57 insertions(+), 4 deletions(-)

diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 527ada0f63..69217d995b 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -178,9 +178,7 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
     /* no need to flush icache explicitly */
 }
 
-#ifdef CONFIG_SOFTMMU
 #define TCG_TARGET_NEED_LDST_LABELS
-#endif
 #define TCG_TARGET_NEED_POOL_LABELS
 
 #endif
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index b12fbfda63..d56c1e51e4 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -29,6 +29,7 @@
 #error "unsupported code generation mode"
 #endif
 
+#include "../tcg-ldst.c.inc"
 #include "../tcg-pool.c.inc"
 #include "elf.h"
 
@@ -136,6 +137,7 @@ typedef enum S390Opcode {
     RI_OIHL     = 0xa509,
     RI_OILH     = 0xa50a,
     RI_OILL     = 0xa50b,
+    RI_TMLL     = 0xa701,
 
     RIE_CGIJ    = 0xec7c,
     RIE_CGRJ    = 0xec64,
@@ -1804,8 +1806,6 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg data,
 }
 
 #if defined(CONFIG_SOFTMMU)
-#include "../tcg-ldst.c.inc"
-
 /* We're expecting to use a 20-bit negative offset on the tlb memory ops.  */
 QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
 QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -(1 << 19));
@@ -1942,6 +1942,53 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     return true;
 }
 #else
+static void tcg_out_test_alignment(TCGContext *s, bool is_ld,
+                                   TCGReg addrlo, unsigned a_bits)
+{
+    unsigned a_mask = (1 << a_bits) - 1;
+    TCGLabelQemuLdst *l = new_ldst_label(s);
+
+    l->is_ld = is_ld;
+    l->addrlo_reg = addrlo;
+
+    /* We are expecting a_bits to max out at 7, much lower than TMLL. */
+    tcg_debug_assert(a_bits < 16);
+    tcg_out_insn(s, RI, TMLL, addrlo, a_mask);
+
+    tcg_out16(s, RI_BRC | (7 << 4)); /* CC in {1,2,3} */
+    l->label_ptr[0] = s->code_ptr;
+    s->code_ptr += 1;
+
+    l->raddr = tcg_splitwx_to_rx(s->code_ptr);
+}
+
+static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
+{
+    if (!patch_reloc(l->label_ptr[0], R_390_PC16DBL,
+                     (intptr_t)tcg_splitwx_to_rx(s->code_ptr), 2)) {
+        return false;
+    }
+
+    tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_R3, l->addrlo_reg);
+    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_R2, TCG_AREG0);
+
+    /* "Tail call" to the helper, with the return address back inline. */
+    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R14, (uintptr_t)l->raddr);
+    tgen_gotoi(s, S390_CC_ALWAYS, (const void *)(l->is_ld ? helper_unaligned_ld
+                                                 : helper_unaligned_st));
+    return true;
+}
+
+static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
+{
+    return tcg_out_fail_alignment(s, l);
+}
+
+static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
+{
+    return tcg_out_fail_alignment(s, l);
+}
+
 static void tcg_prepare_user_ldst(TCGContext *s, TCGReg *addr_reg,
                                   TCGReg *index_reg, tcg_target_long *disp)
 {
@@ -1980,7 +2027,11 @@ static void tcg_out_qemu_ld(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
 #else
     TCGReg index_reg;
     tcg_target_long disp;
+    unsigned a_bits = get_alignment_bits(opc);
 
+    if (a_bits) {
+        tcg_out_test_alignment(s, true, addr_reg, a_bits);
+    }
     tcg_prepare_user_ldst(s, &addr_reg, &index_reg, &disp);
     tcg_out_qemu_ld_direct(s, opc, data_reg, addr_reg, index_reg, disp);
 #endif
@@ -2007,7 +2058,11 @@ static void tcg_out_qemu_st(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
 #else
     TCGReg index_reg;
     tcg_target_long disp;
+    unsigned a_bits = get_alignment_bits(opc);
 
+    if (a_bits) {
+        tcg_out_test_alignment(s, false, addr_reg, a_bits);
+    }
     tcg_prepare_user_ldst(s, &addr_reg, &index_reg, &disp);
     tcg_out_qemu_st_direct(s, opc, data_reg, addr_reg, index_reg, disp);
 #endif
-- 
2.25.1


