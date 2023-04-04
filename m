Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B09EB6D67E9
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 17:53:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjixT-00078C-UH; Tue, 04 Apr 2023 11:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjixQ-0006zT-UX
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 11:52:29 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjixO-0004vL-LU
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 11:52:28 -0400
Received: by mail-pl1-x631.google.com with SMTP id le6so31691549plb.12
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 08:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680623545;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1FfqWjRKCkyAB/lxL8k5+KsN14fs9T5Mf//4IwBSq1A=;
 b=MEneH7qFHc1kNUK51ifWTR7Uz6F65lBO4c/xrKj9r4D+sauYJB1tjOIl6lAJYc80qg
 UY4n/OVKceMfwzjPVDKlAvyB+ja8lZtctpRA+VZP7BKruaDj65XvtUaNZOaAIAtGjRyL
 f/oBUgRy86oa2kRuD/iC8nlSRY6KAMMbdSORXgEALgTYiDNc+aUJ3ThwoqtEpQ8l+h7g
 9VJYZDxLJVwM9SnDnBgDB5PWCruRTYriBWCCFHtBKnx0o0mFWfqb7MZRcdqUSnzDHr/Z
 kupt5PH+cS2yQjLekh0x6sxt+w8cB6drcthyeX8rO5pDcMFegrByObhMZvrN7zK2l5up
 FGcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680623545;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1FfqWjRKCkyAB/lxL8k5+KsN14fs9T5Mf//4IwBSq1A=;
 b=lFY4VdRDTDoBGYnJpy0ddB7NN5um2EQYvL33Nch8ZMBTdJPbImFRBxFSbhs63Hxr/v
 udU+ARHShpw1j3pRcVvnFCmLaPAQPtgv1Bru+KmhzdO8q3lFw+28/S9Khw/6SMhT0vFV
 6G6ogOWQmpZ8l+L1HhJMG2omvoI7ZTCOtbaVSoMpxgYRcU51W3HnaTjA7t+dQIlgfRqC
 6o53XKqh8E1kFlbf9JfHOpMo7plSHmXD24pTsebK1bQaAxixjXRnQyJKJaJEylzX4xZR
 SZDfXXrE+ftJKnpsZZIWhUz4VlkxGMK7zc5TYLKdeTlkC5ioUiBGR6z6dRqk/jNB0czF
 IIwA==
X-Gm-Message-State: AAQBX9c07bzUuMNBgCB6dyy+Fi0BMCJZOPNCRs0JIHn6tZBSXxQNlTAL
 nk3JdrcGPARFsUEM04GimHTJgSJV07X3mF0K/5A=
X-Google-Smtp-Source: AKy350Y/9iZM5GZ52mnphvj98pjM7xmt+b7cvpoWXNvzGioGhNh0rfYKzBmMZTgyFniOoeM8C1j25w==
X-Received: by 2002:a17:90a:bc85:b0:237:752f:1af0 with SMTP id
 x5-20020a17090abc8500b00237752f1af0mr3380674pjr.29.1680623545340; 
 Tue, 04 Apr 2023 08:52:25 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:1d41:7730:d7dd:6f41])
 by smtp.gmail.com with ESMTPSA id
 nl5-20020a17090b384500b00233ccd04a15sm11562013pjb.24.2023.04.04.08.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 08:52:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 4/4] tcg/sparc64: Disable direct linking for goto_tb
Date: Tue,  4 Apr 2023 08:52:20 -0700
Message-Id: <20230404155220.1572650-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230404155220.1572650-1-richard.henderson@linaro.org>
References: <20230404155220.1572650-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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


