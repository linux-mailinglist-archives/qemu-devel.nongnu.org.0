Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0391E2D9984
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:14:51 +0100 (CET)
Received: from localhost ([::1]:43346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koock-0005ZG-1J
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:14:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSD-0001wY-Gu
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:03:57 -0500
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:46382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSA-0003y2-3F
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:03:57 -0500
Received: by mail-ot1-x335.google.com with SMTP id w3so15756601otp.13
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=OGI5CxyxTF/dbCInhRa9B5Chz/cSyqz69O9vDa9Oxg0=;
 b=Im0tD85RfrABwMbtbZuAW+HmJYIhfmG5hwgKaCx7ru9svTTOnwu9tFAFC6QF9clAag
 Im3czpcSd5p/vv0JE4PuoVmr8gOBUG27HbXBHTZPaj0yhFbvgunS0wDau7A/MeTwxjJU
 ihBx4SH53TqLZvfGAquOI7UjVkgDql/fIOW7DmvIJ7d73jbBdh5u0AwJ5HM31+PfEnOb
 rnYuU8C8ogpaD97WaBtQjXJ4KbBuCAXaA2SJp2TXcNl9pRFkSaOdLwb5YahhYJJeZzw4
 onsKOTPnJnzBLg3CF+32DwVpOHISBsHpL0qtKJmkdpS219y1VCSYfQJ9iWb8RZxjZRvc
 ieaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OGI5CxyxTF/dbCInhRa9B5Chz/cSyqz69O9vDa9Oxg0=;
 b=M0vpiAAfjkbgfD7DEUNhcv/bm6PdQcPbiY1MnJi5WzvsTYEPPV/64d/R5dkJBdokyd
 c9RdfLJB+5+8FEMy3WKcJnpc6FHVSUU2gQ2G6RJjWPYm2EPq4jB+fUhS8GlCrUTm9Ycl
 yFw2KO922RFfEjQmauT4RCYMmTXrQodZhAuGO3Qqs2nSJbc2PF7kDu1yjFRGktpoQV4m
 QF9tgBuxG8Kfz4HTH8bXVnJWJ3Bl663wnNSVat1JC3Q9fMTeV/owp9mq3jcWouWAil8D
 Dw8qEKilRrKL9hLuLaryJ30/b5qKihvtUTOtw5+0iRHk68o6t3uuTKgH159NQK8ooq62
 /nmg==
X-Gm-Message-State: AOAM53326l0Iz3TECkEBuC9Xli4XomVrZnjm/mmYjCppHfIMXZIuwdIS
 0RC8k8yp5fCrDpY1y1tQzxAX4EnLDyjN7Zch
X-Google-Smtp-Source: ABdhPJyzFW++ByXz910YOuLT+ULApO9ml6ebzivzmn4AxGmgd1L/MH4+siv6GW9BakP3FH22Ak+Haw==
X-Received: by 2002:a05:6830:2371:: with SMTP id
 r17mr20042064oth.236.1607954632463; 
 Mon, 14 Dec 2020 06:03:52 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm3940146oou.4.2020.12.14.06.03.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:03:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 21/43] tcg/i386: Support split-wx code generation
Date: Mon, 14 Dec 2020 08:02:52 -0600
Message-Id: <20201214140314.18544-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214140314.18544-1-richard.henderson@linaro.org>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.h     |  2 +-
 tcg/i386/tcg-target.c.inc | 20 +++++++++++---------
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 04eefbfb90..2e57e95ac2 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -231,6 +231,6 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_SUPPORT_MIRROR       0
+#define TCG_TARGET_SUPPORT_MIRROR       1
 
 #endif
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 7f74c77d7f..23c7a8a383 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -165,7 +165,7 @@ static bool have_lzcnt;
 # define have_lzcnt 0
 #endif
 
-static tcg_insn_unit *tb_ret_addr;
+static const tcg_insn_unit *tb_ret_addr;
 
 static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
                         intptr_t value, intptr_t addend)
@@ -173,7 +173,7 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
     value += addend;
     switch(type) {
     case R_386_PC32:
-        value -= (uintptr_t)code_ptr;
+        value -= (uintptr_t)tcg_splitwx_to_rx(code_ptr);
         if (value != (int32_t)value) {
             return false;
         }
@@ -182,7 +182,7 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
         tcg_patch32(code_ptr, value);
         break;
     case R_386_PC8:
-        value -= (uintptr_t)code_ptr;
+        value -= (uintptr_t)tcg_splitwx_to_rx(code_ptr);
         if (value != (int8_t)value) {
             return false;
         }
@@ -1006,7 +1006,7 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
     }
 
     /* Try a 7 byte pc-relative lea before the 10 byte movq.  */
-    diff = arg - ((uintptr_t)s->code_ptr + 7);
+    diff = tcg_pcrel_diff(s, (const void *)arg) - 7;
     if (diff == (int32_t)diff) {
         tcg_out_opc(s, OPC_LEA | P_REXW, ret, 0, 0);
         tcg_out8(s, (LOWREGMASK(ret) << 3) | 5);
@@ -1615,7 +1615,7 @@ static inline void tcg_out_call(TCGContext *s, const tcg_insn_unit *dest)
     tcg_out_branch(s, 1, dest);
 }
 
-static void tcg_out_jmp(TCGContext *s, tcg_insn_unit *dest)
+static void tcg_out_jmp(TCGContext *s, const tcg_insn_unit *dest)
 {
     tcg_out_branch(s, 0, dest);
 }
@@ -1786,7 +1786,8 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld, bool is_64,
     label->datahi_reg = datahi;
     label->addrlo_reg = addrlo;
     label->addrhi_reg = addrhi;
-    label->raddr = raddr;
+    /* TODO: Cast goes away when all hosts converted */
+    label->raddr = (void *)tcg_splitwx_to_rx(raddr);
     label->label_ptr[0] = label_ptr[0];
     if (TARGET_LONG_BITS > TCG_TARGET_REG_BITS) {
         label->label_ptr[1] = label_ptr[1];
@@ -2280,7 +2281,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
             /* jump displacement must be aligned for atomic patching;
              * see if we need to add extra nops before jump
              */
-            gap = tcg_pcrel_diff(s, QEMU_ALIGN_PTR_UP(s->code_ptr + 1, 4));
+            gap = QEMU_ALIGN_PTR_UP(s->code_ptr + 1, 4) - s->code_ptr;
             if (gap != 1) {
                 tcg_out_nopn(s, gap - 1);
             }
@@ -3825,11 +3826,12 @@ static void tcg_target_qemu_prologue(TCGContext *s)
      * Return path for goto_ptr. Set return value to 0, a-la exit_tb,
      * and fall through to the rest of the epilogue.
      */
-    tcg_code_gen_epilogue = s->code_ptr;
+    /* TODO: Cast goes away when all hosts converted */
+    tcg_code_gen_epilogue = (void *)tcg_splitwx_to_rx(s->code_ptr);
     tcg_out_movi(s, TCG_TYPE_REG, TCG_REG_EAX, 0);
 
     /* TB epilogue */
-    tb_ret_addr = s->code_ptr;
+    tb_ret_addr = tcg_splitwx_to_rx(s->code_ptr);
 
     tcg_out_addi(s, TCG_REG_CALL_STACK, stack_addend);
 
-- 
2.25.1


