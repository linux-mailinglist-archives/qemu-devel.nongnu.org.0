Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AACC6D66B5
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 17:05:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjiDL-00036W-1j; Tue, 04 Apr 2023 11:04:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjiDC-00035x-DA
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 11:04:46 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjiD9-0000AK-2B
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 11:04:42 -0400
Received: by mail-pl1-x629.google.com with SMTP id n14so15690090plc.8
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 08:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680620677;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6xMVCBhwZpi/WE/lHJiBdLctPgtyWm5BEEwKw+b1210=;
 b=u5twseoF9tbzcnlt4UkX6wkoaT17OkMZaMib9Vh3WZ6MZUvaN8ljY0DTPBZGIqYSf/
 EaaG04k9cMVj/NtHT6ZxNz6MidV/x1i2Y7OQlX3QNFKvy7gi6eVXz6s3uSWn0503IDps
 pwCzXEi2tel7nMEGftlWUfZaTuH4k7eCHIiNZbmNZo2EMGOyY+ZlnQBX7GjyTcOqBOVQ
 P/HcDw0+fK3Ye9hfmPFgFCh+CCmfAP/kiDypiW89oXLS8chsHS80/Gz+AqJ0V2orOnva
 wqwakKn4EvuPpz9VKRnG9danymkRdw8ZHqnugnerCHGHlYVv4qRPX6kzc9Qc8eyICEWQ
 sQ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620677;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6xMVCBhwZpi/WE/lHJiBdLctPgtyWm5BEEwKw+b1210=;
 b=f8ct/a2Hb8YwqI5v3esyT/R2Cf2eSmHNYQlXl3RVh4isXvZ6bZ7Ss7tngsB4HR2xEw
 TqgtPxhjS25a53sSzfWqimwpR4JB8O+wRbbTimglTf/bIQizbk2qbnDbhQgmzotcw8th
 xKzRn+z6gqJx9GxeyMZF4zBv9WrcYgGo3PXvy1fzJpiPwmtcJTw8X0IS3wPVqVw3ud40
 iJayWkuHwzfKmzjzlQxmmBMRv1Id21z+QqQUMfJC+y4vucmHsmdTL63wmxV2LwqterDH
 x1xGF6UHU5xg9l8yU4JneWhVlbwEmEnzDA9nlTRM0482a+IfW3FfacT4QOKz9IHF40SP
 6FDg==
X-Gm-Message-State: AAQBX9dLLGyVX1yJRkBbBvjTf7t37TSqfyfQDZLMSpWU61KEwzWvEpXr
 gRdg+btryabJEMvMPEMiJMDKIErikQmlWDfLT48=
X-Google-Smtp-Source: AKy350bj0h6fIP7MRbvWqYlzcfyAPUC75kSeaYOdgXpYAMzjktQXVF1einm1pkPvrVi1CP7u3JO1mA==
X-Received: by 2002:a05:6a20:8b14:b0:cc:a5d4:c31e with SMTP id
 l20-20020a056a208b1400b000cca5d4c31emr2887797pzh.10.1680620677012; 
 Tue, 04 Apr 2023 08:04:37 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:1d41:7730:d7dd:6f41])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a62aa0e000000b00622e01989cbsm1782703pff.176.2023.04.04.08.04.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 08:04:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	philmd@linaro.org
Subject: [PATCH for-8.0] tcg/sparc64: Disable direct linking for goto_tb
Date: Tue,  4 Apr 2023 08:04:35 -0700
Message-Id: <20230404150435.1571646-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

Something is wrong with this code, and also wrong with gdb on the
sparc systems to which I have access, so I cannot debug it either.
Disable for now, so the release is not broken.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 30 ++++--------------------------
 1 file changed, 4 insertions(+), 26 deletions(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index ccc4144f7c..694f2b9dd4 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1445,12 +1445,12 @@ static void tcg_out_goto_tb(TCGContext *s, int which)
 {
     ptrdiff_t off = tcg_tbrel_diff(s, (void *)get_jmp_target_addr(s, which));
 
-    /* Direct branch will be patched by tb_target_set_jmp_target. */
+    /* Load link and indirect branch. */
     set_jmp_insn_offset(s, which);
-    tcg_out32(s, CALL);
-    /* delay slot */
-    tcg_debug_assert(check_fit_ptr(off, 13));
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TB, TCG_REG_TB, off);
+    tcg_out_arithi(s, TCG_REG_G0, TCG_REG_TB, 0, JMPL);
+    /* delay slot */
+    tcg_out_nop(s);
     set_jmp_reset_offset(s, which);
 
     /*
@@ -1469,28 +1469,6 @@ static void tcg_out_goto_tb(TCGContext *s, int which)
 void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
                               uintptr_t jmp_rx, uintptr_t jmp_rw)
 {
-    uintptr_t addr = tb->jmp_target_addr[n];
-    intptr_t br_disp = (intptr_t)(addr - jmp_rx) >> 2;
-    tcg_insn_unit insn;
-
-    br_disp >>= 2;
-    if (check_fit_ptr(br_disp, 19)) {
-        /* ba,pt %icc, addr */
-        insn = deposit32(INSN_OP(0) | INSN_OP2(1) | INSN_COND(COND_A)
-                         | BPCC_ICC | BPCC_PT, 0, 19, br_disp);
-    } else if (check_fit_ptr(br_disp, 22)) {
-        /* ba addr */
-        insn = deposit32(INSN_OP(0) | INSN_OP2(2) | INSN_COND(COND_A),
-                         0, 22, br_disp);
-    } else {
-        /* The code_gen_buffer can't be larger than 2GB.  */
-        tcg_debug_assert(check_fit_ptr(br_disp, 30));
-        /* call addr */
-        insn = deposit32(CALL, 0, 30, br_disp);
-    }
-
-    qatomic_set((uint32_t *)jmp_rw, insn);
-    flush_idcache_range(jmp_rx, jmp_rw, 4);
 }
 
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
-- 
2.34.1


