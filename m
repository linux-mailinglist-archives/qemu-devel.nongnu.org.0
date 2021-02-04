Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 380EB30EA3A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:33:33 +0100 (CET)
Received: from localhost ([::1]:44444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7USa-0000Cw-9P
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:33:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TjO-0005YZ-OV
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:50 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:46286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TjM-00041z-4L
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:50 -0500
Received: by mail-pl1-x636.google.com with SMTP id u11so865709plg.13
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1LT2MbDB8DSsnJ6nk4ZYA0KuSI+0ipd9FJnZcTxjPRQ=;
 b=HbGV/3iKFDtFAmLUS7tlS7c69oaaLBT8pIaNn1nBNJL0beoC+AVcadAEgHwKl3pfjt
 wE3I8W0A9FscBLk8Zx61TVnOHXTI70gE4aWcax7OfWZzzJjgGlVmELkCGTV89NWQ5VYR
 NyCc8M0o6Wmqxctr/JyNaI3h7RJuch3CJT31bc0IkLsEcRGdSU7Gvq4yH6g238FV2Ajs
 6mm+nOIjFo0GLqmGkThq92xFnkgzf1m+o5SmxbMPfq0XN4YOyj7r03SuDg55Ltz74sZA
 vQOT29h3lOsxGGJvdUG24zplL18P6oWycd1t9sKyLqwR8VmpgEvcZhc+mKDJ2Yin/uZr
 4Gfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1LT2MbDB8DSsnJ6nk4ZYA0KuSI+0ipd9FJnZcTxjPRQ=;
 b=hKw42rs64W0Zs1XY5RX3TTATTVJ0ngw1xXsrhEQJN+AHos1Z888dkzGdS/95D9QQx2
 g7bFVISF9UMF1mlmWR3YUXByBlEBFaLVbB0EtFsZ6nR0qN8yL9kj2kJmludZXQCa1OSi
 ipxW1RAarvZlMKlIPgxdQZDnffD3x+SUTFHVAU4hORDcPGh7++skGvRZlnPfRUW0u6Qr
 mrIqOf2LAfSkbakq1ZQhMehMdNEbVwDltDatz1hA2bOGlrlViwvY6K7yE63gLP+TA8YA
 oY6aPRcg1KRZaiN/pVggwjjnUSzV3P+ZEHDm8jM4SO3smArhjixPcES3SER7V3UCnglt
 048A==
X-Gm-Message-State: AOAM530FjkCwuAjK9aZdGverxOFzFpGJW5+0+Nqnq7fueGXgNO3KXwk3
 rzgjmRiDFuBvWKkXcU9ZNi5yHZHi14c+NAb7
X-Google-Smtp-Source: ABdhPJzD1WtOAXwYHO9Kdvs3/jtaoZFkx6o3EBAcTAcX4NplyJ2+mTMEb8GkCFmKn1mXuGAyRvZycQ==
X-Received: by 2002:a17:902:c942:b029:de:abac:f9c4 with SMTP id
 i2-20020a170902c942b02900deabacf9c4mr5582718pla.30.1612403206915; 
 Wed, 03 Feb 2021 17:46:46 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:46:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 53/93] tcg/tci: Reuse tci_args_l for goto_tb
Date: Wed,  3 Feb 2021 15:44:29 -1000
Message-Id: <20210204014509.882821-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert to indirect jumps, as it's less complicated.
Then we just have a pointer to the tb address at which
the chain is stored, from which we read.

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
index 57b6defe09..0301ee63a7 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -833,13 +833,11 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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


