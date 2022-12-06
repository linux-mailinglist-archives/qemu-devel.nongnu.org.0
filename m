Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFA2643C31
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 05:22:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2POx-0003Um-H1; Mon, 05 Dec 2022 23:17:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POu-0003U3-J8
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:48 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POs-0006yh-RJ
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:48 -0500
Received: by mail-oi1-x22b.google.com with SMTP id v70so7210770oie.3
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 20:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nViIHSFjfOIWq3NohhhvUXaF8+WP2rU2B4NkQ7rnjQQ=;
 b=S63mfpzvHMuIvpm82NSHqmrTKuaNaCb0E3A667FYNoZFKcrIePQ1jAG6Z2xJ4zIMSZ
 57KPxVhQjcD0l5Ox/O4y3RWGk7w/uDvO/QGEXcYKGj9sF97yThdQHVyYj/92oiT3jNTB
 VRdKu5f/tmo1qjYcS4Qgh/WBjmZwW2gNF2FV/khUg3fV1bn+JLJJgQ/3IqJgzA1h7vG8
 M9IrTAdQt+m3FDL7i8nzGfRD6wbITE7S5beWXCSrjcmmCj6QySYubuTz2PKxETwaUaUC
 9Sxbrc43R0BfTK+XGFGqCN3HLUqN2/dm3GoIc9Iwjs/7XdnXTFBsu54/ULy+MgpwVrTs
 HhyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nViIHSFjfOIWq3NohhhvUXaF8+WP2rU2B4NkQ7rnjQQ=;
 b=xhMJxzooTR1MJwc0l5UN3xZDH+nvS+j1II99i1MfvasdyaiwKoyDKA+//AUZX89Bci
 bi0AZkqndvIg3whI7/iF9vsktma6DcahVCSRu5BqAhOM7qmeGikRt18V82iO9G0b+BoH
 mNZrbrgwv8BGyaPLcoWT+WwEQXcp0XibMGFubgu0PrA4TFdqA8yJKaHkuCn2VVSGa82z
 uPZRqk9j4gXKEiP3tcsxxs1E8EYt+VzGT+tsd5wWuQ36Az7A+ERhWnqBSlV3DN8MUdgG
 eHZC/mKjkoL38X3NYCwj1zomDZayH4O7KDetcH0wu3onwBY7+BGRlTcIA+aBv8+YXEh9
 kphg==
X-Gm-Message-State: ANoB5plpWcvSZRXN54zQzVi2icFMXtQJ/9DbyqNSdO97C0yRqao5FLKK
 +Ds9pCycO+5e0VqIRcQ355pnBQFPd0Av5XXHqKQ=
X-Google-Smtp-Source: AA0mqf4Yjuvg7ltJAj/TaX7zUSQccNDhDthK6MtOl3RSOJIatakThl4F0d6xlfd6akJL1FIHIRJqXg==
X-Received: by 2002:aca:1308:0:b0:354:94c3:2b33 with SMTP id
 e8-20020aca1308000000b0035494c32b33mr45247396oii.247.1670300266100; 
 Mon, 05 Dec 2022 20:17:46 -0800 (PST)
Received: from stoup.. ([2806:102e:18:70b5:d104:21c2:8c7e:77e6])
 by smtp.gmail.com with ESMTPSA id
 o35-20020a056870912300b0014185b2b3d5sm10162018oae.18.2022.12.05.20.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 20:17:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: r@hev.cc
Subject: [PATCH 22/22] tcg/riscv: Implement direct branch for goto_tb
Date: Mon,  5 Dec 2022 22:17:15 -0600
Message-Id: <20221206041715.314209-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206041715.314209-1-richard.henderson@linaro.org>
References: <20221206041715.314209-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Now that tcg can handle direct and indirect goto_tb simultaneously,
we can optimistically leave space for a direct branch and fall back
to loading the pointer from the TB for an indirect branch.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.h     |  5 +++++
 tcg/riscv/tcg-target.c.inc | 19 +++++++++++++++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index 56f7bc3346..a75c84f2a6 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -159,6 +159,11 @@ typedef enum {
 #define TCG_TARGET_HAS_mulsh_i64        1
 #endif
 
+<<<<<<< HEAD
+=======
+void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
+
+>>>>>>> 89ab294271 (tcg/riscv: Implement TCG_TARGET_HAS_direct_jump)
 #define TCG_TARGET_DEFAULT_MO (0)
 
 #define TCG_TARGET_NEED_LDST_LABELS
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index de029d62b4..ee269ea157 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1278,7 +1278,11 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
 
 static void tcg_out_goto_tb(TCGContext *s, int which)
 {
-    /* indirect jump method */
+    /* Direct branch will be patched by tb_target_set_jmp_target. */
+    set_jmp_insn_offset(s, which);
+    tcg_out32(s, OPC_NOP);
+
+    /* When branch is out of range, fall through to indirect. */
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_REG_ZERO,
                get_jmp_target_addr(s, which));
     tcg_out_opc_imm(s, OPC_JALR, TCG_REG_ZERO, TCG_REG_TMP0, 0);
@@ -1288,7 +1292,18 @@ static void tcg_out_goto_tb(TCGContext *s, int which)
 void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
                               uintptr_t jmp_rx, uintptr_t jmp_rw)
 {
-    /* Always indirect, nothing to do */
+    uintptr_t addr = tb->jmp_target_addr[n];
+    ptrdiff_t offset = addr - jmp_rx;
+    tcg_insn_unit insn;
+
+    /* Either directly branch, or fall through to indirect branch. */
+    if (offset == sextreg(offset, 0, 20)) {
+        insn = encode_uj(OPC_JAL, TCG_REG_ZERO, offset);
+    } else {
+        insn = OPC_NOP;
+    }
+    qatomic_set((uint32_t *)jmp_rw, insn);
+    flush_idcache_range(jmp_rx, jmp_rw, 4);
 }
 
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
-- 
2.34.1


