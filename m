Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE457312924
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:03:39 +0100 (CET)
Received: from localhost ([::1]:32928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8wpu-0003FI-SU
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:03:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRm-0001cg-QI
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:42 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:44649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRa-0005rw-Tg
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:42 -0500
Received: by mail-pg1-x533.google.com with SMTP id j5so452245pgb.11
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1LT2MbDB8DSsnJ6nk4ZYA0KuSI+0ipd9FJnZcTxjPRQ=;
 b=jXWHc1qZH5MYycwjIKu/DBrEd8ebULK5J3dQR5ZkPe6JOYugGVlzVHKc2A7YCIEkMF
 NS9iRINg3hL6rMUL/a74F/1VEt3LuV4pegYrOY9MaOMIkyUTk2mBKBR8gTH8DFq/OgmU
 TXxLA9Boj8+sjh3cCxZMWlxfa+Be9xy5HdfTN+Wo1Y8JmKnq1OmIs5OTzETVyum8HYs2
 TCHXdoZVjMTpoZAVgbsnpnoLHWazczA/6R5IkPvIyoxROyfxMV9KRD+q7R5g5tw9UXS4
 eaXcXhBDlOuwen2vM8ltoKQDGt3f+J0W4HDQDzDezDGSnjGlurkgw3hJR+RmAIxkqSsv
 bJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1LT2MbDB8DSsnJ6nk4ZYA0KuSI+0ipd9FJnZcTxjPRQ=;
 b=KI5NcDJQTKcnnbVRSG/RSsaWIj9eW842Cw5jzsEGrvGiQMPUfeCP31JkiTDmhe7y+H
 QFyN/6VSQ7YWbBut4C50UeWPLU29cZAWvlpzRoxRKUlnxtKL0VVoAkcJ/fPTnKKZSVG+
 OeymgDauK3Pn06olUU8N1BBXRke/B+RqgMMYg5gbEYv4evT001M5diW1td9gL4nTt7Sf
 ka7r5cIIdnQnnn41Z3oDxj5bgcUKfgduXfpQzUxL3LA4Olzd5KeX4xe5oLbei2gm8LrT
 klfcf2wQSGE7oOwdH6JZV1tAUUO4sMlc8uzV0Tfo5YyuSesGVJpZWNnG78OyKlJ0kC3w
 ZblQ==
X-Gm-Message-State: AOAM533MFBK9tOkYAJ6acYfb+t9Yq3dYNqyZBP8GgKrnb3MCX0ChA+nq
 YWGUB9koNzcJhuoSCOMXpahmgZMF+/a1Zw==
X-Google-Smtp-Source: ABdhPJwjuHVuBK5dFlG8kSbDSe8ewDOoMXMQmlOkI19cOHaVENBhw02RP560MkzzQA9g0DoBZYsD9w==
X-Received: by 2002:a63:551e:: with SMTP id j30mr6013449pgb.376.1612751908835; 
 Sun, 07 Feb 2021 18:38:28 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id j17sm16158689pfh.183.2021.02.07.18.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:38:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 28/70] tcg/tci: Reuse tci_args_l for goto_tb
Date: Sun,  7 Feb 2021 18:37:10 -0800
Message-Id: <20210208023752.270606-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


