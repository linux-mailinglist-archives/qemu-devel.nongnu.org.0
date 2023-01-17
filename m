Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A35A9670CDD
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 00:12:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHv7A-00041r-BP; Tue, 17 Jan 2023 18:11:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv78-0003y5-AK
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:11:34 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv76-0001Js-NZ
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:11:34 -0500
Received: by mail-pg1-x531.google.com with SMTP id 141so23224555pgc.0
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 15:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oIHXkQP1DRpOptMrudVFP2nZqqF+K6pmNG9baQp/CCA=;
 b=yQWl3rYBqWkzSEK2NhZO8e0qLXBqImpkmsrwcr8q6MjByyI9I/NKMJXPBHs6DP53L8
 gGumYTsEMrSa4P4zBygcgXOJGpTX5Nko7Vx8vDieyqBe8CezsCdmncBiFxO7JjqZDso9
 p4MabaCOVy1Z37AoxrPhcPrBBsnHkEJriLzhxkOtkyI4f6IcpGVc3IsGbG7+nLl03yHX
 xeKJsfTW9sCfaB7GXphdGIY4wcmnSmehDfSdIYbi9IXUfo2DtMfscLU3alr3IQgv8fyk
 LSC03VL+icwI5fZl0K6PtHojV1PMMNScM4hIolqU+fBGVf00691dLT6UuyGtUczoGDJL
 8ACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oIHXkQP1DRpOptMrudVFP2nZqqF+K6pmNG9baQp/CCA=;
 b=DzIP1d7UikDZa+KlfbCp69svAL2pvcSdjOssk2W3zyPfeY5klXL/J+Jdc7ZDTEc/aj
 75c/02Sw8PLzU6Jf8Fwv7iZnlIja3Tglc0chgXE6StXESTCo4TlIkZ2eP8bWWLoHm9eO
 C32VPbi7GaQY07WJzL++42xo2sE66x19o+U9Mmv3wf/A90dQuKBdfVfyLtPkD1pSqv8n
 4SzsyX2wYx/8+m+0F+Ml87nEloFFwro7uIM4cEwpYqhy1N4YLtAbvvoJxAUoQ69XDztf
 yuGBINqa3mRcnXGYiIeGrANW5lT2ZeS5Qrh8ExrQVeTq94RNtQ1qqOJgGfSeLJ1CFx07
 vI3A==
X-Gm-Message-State: AFqh2kqAbOFqM86zgKfQKRcIw6mFWi5Svsu1Yh7wBvG2e6K8yLgVgRnv
 yiIffSZu5r7UwybeTMxjsTtBA89HldQGQmzm
X-Google-Smtp-Source: AMrXdXtP3sR+BxFCMF2nvk8dcVHRqxRQgV5fjZUPCrurlAY+C4ph7Vw3uXzAWAZXtxzAkRpsULk+vg==
X-Received: by 2002:a62:f203:0:b0:58a:59d4:25aa with SMTP id
 m3-20020a62f203000000b0058a59d425aamr4633455pfh.31.1673997090406; 
 Tue, 17 Jan 2023 15:11:30 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 b193-20020a621bca000000b005810c4286d6sm20747070pfb.0.2023.01.17.15.11.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 15:11:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 22/22] tcg/riscv: Implement direct branch for goto_tb
Date: Tue, 17 Jan 2023 13:10:51 -1000
Message-Id: <20230117231051.354444-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117231051.354444-1-richard.henderson@linaro.org>
References: <20230117231051.354444-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 82ca86431e..fc0edd811f 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1303,7 +1303,11 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
 
 static void tcg_out_goto_tb(TCGContext *s, int which)
 {
-    /* indirect jump method */
+    /* Direct branch will be patched by tb_target_set_jmp_target. */
+    set_jmp_insn_offset(s, which);
+    tcg_out32(s, OPC_JAL);
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


