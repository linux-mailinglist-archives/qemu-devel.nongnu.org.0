Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E9B60AAA7
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 15:36:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omxTI-0003cr-Eb; Mon, 24 Oct 2022 09:26:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxT8-0003W3-OD
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:26:21 -0400
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSz-0004AS-Qm
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:26:12 -0400
Received: by mail-vs1-xe35.google.com with SMTP id k67so7833759vsk.2
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 06:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Zh2RvC3pN/K5VvnXNLzrbwqSruMWEZTNe5V7ylhZCfA=;
 b=Beqi774qZzUQiK0e6RUzqLjtXdnyYMQx8ZzYL8pA2MvHsVacM0WMaJPDnnJA2a9Mgk
 OJ3L22R8ls4+llK2mqDXIA6kUHKFVsxEyvnxIU772LLwGLQgTJTprTgjydFgO4yOXXSp
 ImVnT1AwLeB8zus5185jAekPhUr/eJ3W0WjGxrM4LZspMuICGrbh3oF7DbTuoa8RkKyJ
 xg3XbR22IgRNqmNJArbUudMnoge1U0CiukiA2uSYIpgGQanRNj25py7kRCaFOx/f/sMF
 TGIVA05lMoattGd1DLYsVKdrnBWNh6F0usdY7+1WIyAxC/EmT19XE744p5++2BJatLnA
 8ejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zh2RvC3pN/K5VvnXNLzrbwqSruMWEZTNe5V7ylhZCfA=;
 b=QjUZw2TYxzBr00R6ZuCg5a7Y2EGmuv2W6pk+YDFxCDChfn4luIj27dzHCAZskUSzbN
 Tea3ptwdHWpBmUV3BDRp/XAR8f6LjpAaBUi08qQjnCgP1EFsi2oqe1SeK10if8bV7tn9
 hyeQ5VN9y8Jbu3RGL6KoyvRmlrfMINgmXZy7Pyk8/OO0knLvUcqcP7rTEzKSUlSeUCOI
 aciJaltc0SAiwoE7pBx0yjflemcATMazWYoIcX7elO1S5hEf7EqdgxkOyTwIKgeh1L8b
 m+9dAg8mbAcQky2Ajwdn/gkVj9EOYEvfAT7BgAqNhbwnzMX2e/XSIdLKhG2qFTfDpa6n
 FowQ==
X-Gm-Message-State: ACrzQf27+0U5jCewn2SSTzRGWbhpST+hJgpSRsmWzzMcm6m5FgGVi/WX
 RTS4LqHdr0iadmPn7P3piyzBLcn+jLk9cA==
X-Google-Smtp-Source: AMsMyM7cEUUOa2UjHDAGO+uKsQJ9/WWAKHd830HN5E6S3sdDZ1U+z2371i4gb+elMrcC6H0h3FIzlQ==
X-Received: by 2002:a17:902:e952:b0:17c:7aaa:c679 with SMTP id
 b18-20020a170902e95200b0017c7aaac679mr33695010pll.74.1666617958020; 
 Mon, 24 Oct 2022 06:25:58 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 b12-20020a1709027e0c00b00178ab008364sm17009216plm.37.2022.10.24.06.25.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 06:25:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/29] target/sh4: Convert to tcg_ops restore_state_to_opc
Date: Mon, 24 Oct 2022 23:24:49 +1000
Message-Id: <20221024132459.3229709-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024132459.3229709-1-richard.henderson@linaro.org>
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=richard.henderson@linaro.org; helo=mail-vs1-xe35.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sh4/cpu.c       | 16 ++++++++++++++++
 target/sh4/translate.c | 10 ----------
 2 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 56c50530da..453268392b 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -50,6 +50,21 @@ static void superh_cpu_synchronize_from_tb(CPUState *cs,
     cpu->env.flags = tb->flags;
 }
 
+static void superh_restore_state_to_opc(CPUState *cs,
+                                        const TranslationBlock *tb,
+                                        const uint64_t *data)
+{
+    SuperHCPU *cpu = SUPERH_CPU(cs);
+
+    cpu->env.pc = data[0];
+    cpu->env.flags = data[1];
+    /*
+     * Theoretically delayed_pc should also be restored. In practice the
+     * branch instruction is re-executed after exception, so the delayed
+     * branch target will be recomputed.
+     */
+}
+
 #ifndef CONFIG_USER_ONLY
 static bool superh_io_recompile_replay_branch(CPUState *cs,
                                               const TranslationBlock *tb)
@@ -243,6 +258,7 @@ static const struct SysemuCPUOps sh4_sysemu_ops = {
 static const struct TCGCPUOps superh_tcg_ops = {
     .initialize = sh4_translate_init,
     .synchronize_from_tb = superh_cpu_synchronize_from_tb,
+    .restore_state_to_opc = superh_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
     .tlb_fill = superh_cpu_tlb_fill,
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 26231b2a5a..7db3468b01 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -2381,13 +2381,3 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
 
     translator_loop(cs, tb, max_insns, pc, host_pc, &sh4_tr_ops, &ctx.base);
 }
-
-void restore_state_to_opc(CPUSH4State *env, TranslationBlock *tb,
-                          target_ulong *data)
-{
-    env->pc = data[0];
-    env->flags = data[1];
-    /* Theoretically delayed_pc should also be restored. In practice the
-       branch instruction is re-executed after exception, so the delayed
-       branch target will be recomputed. */
-}
-- 
2.34.1


