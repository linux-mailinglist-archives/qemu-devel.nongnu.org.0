Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A0C42B351
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 05:21:58 +0200 (CEST)
Received: from localhost ([::1]:56548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maUq5-0006KQ-AT
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 23:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUL8-0005iU-7Y
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:49:58 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:36579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUL6-0001BB-9W
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:49:57 -0400
Received: by mail-pl1-x633.google.com with SMTP id f21so822927plb.3
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=DLEdjZy+09uGaMjE1uPY2LFNBR2LKIkdI9ZG+WGq/kQ=;
 b=a7YTTEUxKOmxhoQqs1bbS1+FPhXNeuDU6mZf/O03aVVCX/TMfXqhoueDk448M/Ul9i
 Bii0GIWoRKY/ouBd/ROyDxJxiscWc1UghuBf3jpbbnVZ0byFUF+ImxN3rjYA2xpETdQH
 dSvWyOUrTxQwSOXWWfl3eRqpeABs09jRFQx5AIc4JO01mjR6OqzTMNlQXcgZcA1YaROt
 M5KYKpkxTUb27ZnoPSqmC/eKwT8cCyuwLv+mGZWnUhzznHe6wDnAiWlwXr6BNzvudJSv
 rkAu4TYU4qoctncQn76NLvx63T8B45IInyad+5LiKkRKMMdc0xpgvmgBKYJM9QxtYoMO
 SHwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DLEdjZy+09uGaMjE1uPY2LFNBR2LKIkdI9ZG+WGq/kQ=;
 b=i0OgPxy9F22MYvSRa+kMfK0VKmb6bSug3DE5eYOhsooAAdKePj4yEJgiAXQpcufXLk
 Awab2h+0NDxkG2VXvYKyouxW30Y9MSclMgTEX6bf8VUeWWmreyI2GJcr6rUYYcXCck6B
 suAYpmVnQgydFKSJPgwiDNmES7dutKoJH97Vz1m9kksur4XsBFozSQ5WxJ16IW1yYKdi
 JTEVL7cQF0nIJNOHuBecvVrjpf9ZGHuisbtwXqKhgT/TT7UFIcg6yWkNOOcjB0Hw6+B6
 A3uDxyKbedZNkM1WnzOBSoXmqbB6peI2ChGCtt4cfy+NLGki6eadfLnj1uvAFWn1YXuu
 FRgQ==
X-Gm-Message-State: AOAM5328kk90LKhb8gD6VUKiZ7dZpSQPqH+3tV+Cc58YGDwwugzRQ0E7
 /yTXKzD9YjC50dTRWwqSk34BqzF+Huj27A==
X-Google-Smtp-Source: ABdhPJwgTi3T8SN0ChWqEN2B7s7vVrwU9mvK9vemFhvH51V7D1mvH5Rocp/ZRefIesap1J7PjAHuRQ==
X-Received: by 2002:a17:903:2c2:b029:101:9c88:d928 with SMTP id
 s2-20020a17090302c2b02901019c88d928mr33291008plk.62.1634093394911; 
 Tue, 12 Oct 2021 19:49:54 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y20sm12579610pfp.68.2021.10.12.19.49.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:49:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 47/48] tcg/riscv: Support raising sigbus for user-only
Date: Tue, 12 Oct 2021 19:46:06 -0700
Message-Id: <20211013024607.731881-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
 tcg/riscv/tcg-target.h     |  2 --
 tcg/riscv/tcg-target.c.inc | 63 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 61 insertions(+), 4 deletions(-)

diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index ef78b99e98..11c9b3e4f4 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -165,9 +165,7 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
 #define TCG_TARGET_DEFAULT_MO (0)
 
-#ifdef CONFIG_SOFTMMU
 #define TCG_TARGET_NEED_LDST_LABELS
-#endif
 #define TCG_TARGET_NEED_POOL_LABELS
 
 #define TCG_TARGET_HAS_MEMORY_BSWAP 0
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 9b13a46fb4..49e84cbe13 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -27,6 +27,7 @@
  * THE SOFTWARE.
  */
 
+#include "../tcg-ldst.c.inc"
 #include "../tcg-pool.c.inc"
 
 #ifdef CONFIG_DEBUG_TCG
@@ -847,8 +848,6 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
  */
 
 #if defined(CONFIG_SOFTMMU)
-#include "../tcg-ldst.c.inc"
-
 /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
  *                                     MemOpIdx oi, uintptr_t ra)
  */
@@ -1053,6 +1052,54 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     tcg_out_goto(s, l->raddr);
     return true;
 }
+#else
+
+static void tcg_out_test_alignment(TCGContext *s, bool is_ld, TCGReg addr_reg,
+                                   unsigned a_bits)
+{
+    unsigned a_mask = (1 << a_bits) - 1;
+    TCGLabelQemuLdst *l = new_ldst_label(s);
+
+    l->is_ld = is_ld;
+    l->addrlo_reg = addr_reg;
+
+    /* We are expecting a_bits to max out at 7, so we can always use andi. */
+    tcg_debug_assert(a_bits < 12);
+    tcg_out_opc_imm(s, OPC_ANDI, TCG_REG_TMP1, addr_reg, a_mask);
+
+    l->label_ptr[0] = s->code_ptr;
+    tcg_out_opc_branch(s, OPC_BNE, TCG_REG_TMP1, TCG_REG_ZERO, 0);
+
+    l->raddr = tcg_splitwx_to_rx(s->code_ptr);
+}
+
+static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
+{
+    /* resolve label address */
+    if (!reloc_sbimm12(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
+        return false;
+    }
+
+    tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_A1, l->addrlo_reg);
+    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A0, TCG_AREG0);
+
+    /* tail call, with the return address back inline. */
+    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_RA, (uintptr_t)l->raddr);
+    tcg_out_call_int(s, (const void *)(l->is_ld ? helper_unaligned_ld
+                                       : helper_unaligned_st), true);
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
 #endif /* CONFIG_SOFTMMU */
 
 static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
@@ -1108,6 +1155,8 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
     MemOp opc;
 #if defined(CONFIG_SOFTMMU)
     tcg_insn_unit *label_ptr[1];
+#else
+    unsigned a_bits;
 #endif
     TCGReg base = TCG_REG_TMP0;
 
@@ -1130,6 +1179,10 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
         tcg_out_ext32u(s, base, addr_regl);
         addr_regl = base;
     }
+    a_bits = get_alignment_bits(opc);
+    if (a_bits) {
+        tcg_out_test_alignment(s, true, addr_regl, a_bits);
+    }
     if (guest_base != 0) {
         tcg_out_opc_reg(s, OPC_ADD, base, TCG_GUEST_BASE_REG, addr_regl);
     }
@@ -1174,6 +1227,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
     MemOp opc;
 #if defined(CONFIG_SOFTMMU)
     tcg_insn_unit *label_ptr[1];
+#else
+    unsigned a_bits;
 #endif
     TCGReg base = TCG_REG_TMP0;
 
@@ -1196,6 +1251,10 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
         tcg_out_ext32u(s, base, addr_regl);
         addr_regl = base;
     }
+    a_bits = get_alignment_bits(opc);
+    if (a_bits) {
+        tcg_out_test_alignment(s, false, addr_regl, a_bits);
+    }
     if (guest_base != 0) {
         tcg_out_opc_reg(s, OPC_ADD, base, TCG_GUEST_BASE_REG, addr_regl);
     }
-- 
2.25.1


