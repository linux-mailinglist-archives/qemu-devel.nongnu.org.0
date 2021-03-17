Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEAA33F498
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:52:16 +0100 (CET)
Received: from localhost ([::1]:42306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYT1-000510-Ah
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:52:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCP-00058U-68
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:05 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:39516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCK-00078o-4a
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:04 -0400
Received: by mail-oi1-x231.google.com with SMTP id u62so26393512oib.6
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 08:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BZ0ZY1gI/xHAH0bHqFpAGpcK8xAM2Wgm2gqCXnQ6Hdw=;
 b=Inx22Ci9v08PALsSgnSYvnr66g/lOPJWtCkvLx2opKMhxrgPz+Y6wKXc5MTc7BwmMR
 ilTQaGAnd8Be7W+LCtDSBtvn2ljjPuRbBYDA9Pf5EOJ4HejJbjx7v/7UVwTcCOWDRI7k
 +4vq4Fu4/bcNzQB3uI+B2XqpB8eewWjgHnP9LO9YI5LUQSCVgRgK1yJ6jZe0RPohdS2z
 DjkzebPjBj8hHfD8U6HVaQEVNdOLaR1/9Ves0Mq7l31LOrpRmG1tleXIPBTf0oIr43Ii
 S/7Qv1SpUbbuubGn2dpHsrLjDE6T7oKnpUxmDtVDbY0hNXWMjnJEwOR5pOhFDFRadhgG
 NLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BZ0ZY1gI/xHAH0bHqFpAGpcK8xAM2Wgm2gqCXnQ6Hdw=;
 b=o9CSmmp4Y9yb7LLOKZtyPAQtrUNm59t2td5RXCNftndpP0dNJ25qaUP/VckULtXxDj
 nciGka4hWVEbvqPQ6RTz8tBgYwKr0T+xmwSKXkokPWFkut82aYE3B7+kY2q+CO+61Kpe
 5sYVd6MB5o8LCcstB6XlFk2yeQTzWm328NXbIeBEnJd3xcjzpckEt3+BGlA3Gc7/mOG3
 MpMlHW+QH2SrwHIa7l4y5txkIe/YqWgfCI3xnuD4GxxP1Xsp4IkOBMyMpLQVTLBaS3Mi
 paVepF/+XSvWqj4o85b5EQzFmepCDYRVaBLybteyrG63tISZee/atWSl1Bi/s+smGVXz
 vx9g==
X-Gm-Message-State: AOAM530AyoksD8S592HZlr4T5+YmdmDwC/keNRoKjHKFiCfZFJ5VSINL
 hff9bPPjUI0AlJPw/O4Z4bd1xiw3wLoGy3oO
X-Google-Smtp-Source: ABdhPJyac+QiKMVO1ep81aapD9Z5463XIOtFK55ytypFpM7qxZCjakK4f0qjAV/jkAicH7I5UnVlDg==
X-Received: by 2002:aca:4284:: with SMTP id p126mr3210031oia.123.1615995299108; 
 Wed, 17 Mar 2021 08:34:59 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i11sm8271154otp.76.2021.03.17.08.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 08:34:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/38] tcg/tci: Reuse tci_args_l for goto_tb
Date: Wed, 17 Mar 2021 09:34:19 -0600
Message-Id: <20210317153444.310566-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317153444.310566-1-richard.henderson@linaro.org>
References: <20210317153444.310566-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert to indirect jumps, as it's less complicated.
Then we just have a pointer to the tb address at which
the chain is stored, from which we read.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.h     | 11 +++--------
 tcg/tci.c                |  8 +++-----
 tcg/tci/tcg-target.c.inc | 13 +++----------
 3 files changed, 9 insertions(+), 23 deletions(-)

diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 9c0021a26f..9285c930a2 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -87,7 +87,7 @@
 #define TCG_TARGET_HAS_muluh_i32        0
 #define TCG_TARGET_HAS_mulsh_i32        0
 #define TCG_TARGET_HAS_goto_ptr         0
-#define TCG_TARGET_HAS_direct_jump      1
+#define TCG_TARGET_HAS_direct_jump      0
 #define TCG_TARGET_HAS_qemu_st8_i32     0
 
 #if TCG_TARGET_REG_BITS == 64
@@ -174,12 +174,7 @@ void tci_disas(uint8_t opc);
 
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
 
-static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
-                                            uintptr_t jmp_rw, uintptr_t addr)
-{
-    /* patch the branch destination */
-    qatomic_set((int32_t *)jmp_rw, addr - (jmp_rx + 4));
-    /* no need to flush icache explicitly */
-}
+/* not defined -- call should be eliminated at compile time */
+void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
 #endif /* TCG_TARGET_H */
diff --git a/tcg/tci.c b/tcg/tci.c
index 71d6720e22..53e49ccf8e 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -818,13 +818,11 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             return (uintptr_t)ptr;
 
         case INDEX_op_goto_tb:
-            /* Jump address is aligned */
-            tb_ptr = QEMU_ALIGN_PTR_UP(tb_ptr, 4);
-            t0 = qatomic_read((int32_t *)tb_ptr);
-            tb_ptr += sizeof(int32_t);
+            tci_args_l(&tb_ptr, &ptr);
             tci_assert(tb_ptr == old_code_ptr + op_size);
-            tb_ptr += (int32_t)t0;
+            tb_ptr = *(void **)ptr;
             continue;
+
         case INDEX_op_qemu_ld_i32:
             t0 = *tb_ptr++;
             taddr = tci_read_ulong(regs, &tb_ptr);
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index ff8040510f..2c64b4f617 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -405,16 +405,9 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
 
     case INDEX_op_goto_tb:
-        if (s->tb_jmp_insn_offset) {
-            /* Direct jump method. */
-            /* Align for atomic patching and thread safety */
-            s->code_ptr = QEMU_ALIGN_PTR_UP(s->code_ptr, 4);
-            s->tb_jmp_insn_offset[args[0]] = tcg_current_code_size(s);
-            tcg_out32(s, 0);
-        } else {
-            /* Indirect jump method. */
-            TODO();
-        }
+        tcg_debug_assert(s->tb_jmp_insn_offset == 0);
+        /* indirect jump method. */
+        tcg_out_i(s, (uintptr_t)(s->tb_jmp_target_addr + args[0]));
         set_jmp_reset_offset(s, args[0]);
         break;
 
-- 
2.25.1


