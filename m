Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F45661C1F
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 02:51:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEhBx-0000tG-Ff; Sun, 08 Jan 2023 20:43:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhBw-0000sL-3N
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:43:12 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhBu-0001af-Iv
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:43:11 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 fz16-20020a17090b025000b002269d6c2d83so10246398pjb.0
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 17:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+h7RCn1T3BLlChRBESm2AUKCCLXsKfuBBeFApIcrDxY=;
 b=wT5yyM6zUtVSQbCKL2TDavKToH9e8JA9+hT1i1OxFgH/ju8yO/ZtL8kNn8SZct9cd3
 g8BTi8HtM0oMCBdWlUk7WeYtMx0EWg1fRwI2EXqcfEL+eLWmEsEXa3xuT3uxUEWC1Oq+
 olz+v5s3akkt8dlEjES2Od8iV6WSMQCI5f16FIqb2y2IlyjO0boehZUorJoM2wT5jYFe
 /Fsmvz8KVbLIntREquCtzf5Vr3A9ep4kyh1qkWArDRZ6aKiRBRbpgbjvKtqQ4OGpebZi
 ZYyD2980sVUFeEEqg7NJsDLXGrrZrNERmep3O6qccaehMeYNfQCl8rICjpKr+4CByf4T
 OLxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+h7RCn1T3BLlChRBESm2AUKCCLXsKfuBBeFApIcrDxY=;
 b=RL2r5IfT7jDYbrlwnNsqEwUcs3tJ3cdkD1QjmxBfGxu1GeAzCqwMF4VNU5gAWLrsb+
 eklX7FUSmvrwDFA8gAjA333ThACgSfopeBAyLYyaxluxXa1C63awCRaVzLj1TCMpaQ66
 m1U+3d5KYGf1gNg9pXxlAnhtnlp05bm/a+vR8GZokjbdtRalYKt3S2GPZvoD1MJttyX8
 kxqvyqpfqkvoids8OvnQWW6RxQ5SoRI4CR1HKUbp9vbTkFzKFObv2hoX+SmJcHa0RHiK
 T1X6qJUtplaQcY3MfjmKQoE3OTGHZnKdnRDdH1RiWYT9LhtTqmh9ca915RQRrMjo+r98
 I/jQ==
X-Gm-Message-State: AFqh2kr2+4tY08yeuImVSHXD79YY3lsH8BlLslo+cZInvicpyUb7ACc1
 8ARMZ5EQRbyejyD1AV9w35NmjI50wLXQhKBH
X-Google-Smtp-Source: AMrXdXs1XSpJY09O/o7ZgeVFSMs3fHou25EthMRo5FEUfCJ+odrofa6afsa4vK/WlTOoprrBsaagFg==
X-Received: by 2002:a17:903:240b:b0:192:8bee:3e29 with SMTP id
 e11-20020a170903240b00b001928bee3e29mr53786136plo.2.1673228589290; 
 Sun, 08 Jan 2023 17:43:09 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a170902ca0d00b00178b77b7e71sm4743617pld.188.2023.01.08.17.43.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 17:43:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/22] tcg/riscv: Implement direct branch for goto_tb
Date: Sun,  8 Jan 2023 17:42:48 -0800
Message-Id: <20230109014248.2894281-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109014248.2894281-1-richard.henderson@linaro.org>
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
 tcg/riscv/tcg-target.c.inc | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 82ca86431e..f0b0a98e2c 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1303,7 +1303,11 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
 
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
@@ -1313,7 +1317,18 @@ static void tcg_out_goto_tb(TCGContext *s, int which)
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


