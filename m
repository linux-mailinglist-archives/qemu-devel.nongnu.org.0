Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF3542B35C
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 05:24:43 +0200 (CEST)
Received: from localhost ([::1]:35818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maUsk-0002zr-7x
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 23:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUL6-0005cw-UJ
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:49:56 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:34503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUL5-0001A5-43
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:49:56 -0400
Received: by mail-pl1-x634.google.com with SMTP id g5so830020plg.1
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0w3+xrnKvaU2OEox0ZNuOdUILQRpNN2Q/xBzhKWN3og=;
 b=ESK2Mf7DY8KY41//icyEstaXs0xzR+/XyZZ/64+Xs8YtmyL8m3yjjJ3POJInsGcRjQ
 Lek6SgyMu/e0+3LBRJStCctT/bLqSdpf6ErHg7xxpIimSbyYcl5YDS8OmWFw0xmmhVAe
 Fnc8Y9cde0ShlWj2Bz8cJOqfmqJdf3ly2K5BeR1v75Ai2exfqu5+AhXn1U7ySgB+w2ss
 /GPJLkR4wV4p6i2xNJZiTg/9qPp31kS9c+xTqiqP7dPqtCp9VXlPbXYrsHn98Vt5MHvn
 kMNsNi6eVgwkAoL3NkaW6/qHkZ0sgiQeTFLkqRTL3Zuw10ldVpJ85NQS9s2pISJqzZix
 0LlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0w3+xrnKvaU2OEox0ZNuOdUILQRpNN2Q/xBzhKWN3og=;
 b=unUhF0+6ozVx5ie8ZIRA79eoWBQU/uE9rAhnoWOYzU5cL1KTOg5MwduVS2Z+l594uZ
 km0hZlqDDnnnjiXZ5TFHbjyWTR8eHmbjZRS/44995WVDu2d8kJPi5UBqlVc7d07+AqC2
 CF19Bd4Xe0pvH6rWH/qsYJD/bMyhPB+daIRk5+ec8sp0QgRUADH1tK7hv6ivKstEwV6b
 e4ddwNAc3tw8U7iMLlA6EBsnVT8NhkL/8nnq0NHb6Rxu290ramq9dzzrt1zOv6hQUayc
 4bCAggHBRC8fLOUjYK91n0zF6kqZAw8O5i8aGqa2W919wRfElaOFwIV6tEDvtkzcF5PR
 eP8w==
X-Gm-Message-State: AOAM530x+elDTknfpPRP/ogUBHD2DNtCHhzD8ueWt4y1twiSZzEnbEkf
 v6gVoeN29fymCcth5zeX2GSWJzgeC2P+yA==
X-Google-Smtp-Source: ABdhPJyOriI6+6GTbEwE8Ndee3MBsKXC4bellER2I/jhofgXExZ6ep+OlAlARiUk40PO0bdf6qhDfw==
X-Received: by 2002:a17:902:ec81:b0:13f:19b3:c0cd with SMTP id
 x1-20020a170902ec8100b0013f19b3c0cdmr25322220plg.81.1634093393575; 
 Tue, 12 Oct 2021 19:49:53 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y20sm12579610pfp.68.2021.10.12.19.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:49:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 45/48] tcg/s390: Support raising sigbus for user-only
Date: Tue, 12 Oct 2021 19:46:04 -0700
Message-Id: <20211013024607.731881-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
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
index 8938c446c8..bc6a13d797 100644
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


