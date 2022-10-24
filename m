Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6443260ABC2
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 15:56:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omxTG-0003cJ-EY; Mon, 24 Oct 2022 09:26:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSu-0003Rn-UL
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:26:06 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSt-0003s1-E1
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:26:04 -0400
Received: by mail-pg1-x52a.google.com with SMTP id f9so4280778pgj.2
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 06:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Bd4nOs5cndwUPUkE6wb4N+9NYguPemV5ztELXhebcaM=;
 b=bI54Be1eClS5XTixCR8MX4uST3sWSPzfIjIOTDnQ1x4rA+1MeGIw3N8VPjAdBBA9By
 Xv/C0+mxsclptUEw7JHttAcxsA5/jXccuETOJ3NUSg0KVR/tIoHqV8w50MvkIy/lJohh
 1TXLowBqtH6FEV/hiIMyrsU/ZNxuOAGpro9uVasgMfSwr77pdrbrp7+8oOlxtKr/ZKeG
 nQnZ7b7+Q3JkMKIsIZ5YuzppyK4CoRSoANpqZMFsNBROpMWCy2/tB+O1z3OXG4XO6lmY
 +cf2OmryLzb1/zVeAz5dLk1uETkKrKFyljuwguThnSKuoktPHAr/47HgpEwWJ6uPq8lJ
 mZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bd4nOs5cndwUPUkE6wb4N+9NYguPemV5ztELXhebcaM=;
 b=5nKxuSMirNwzG9R4/Dug2F7aGq6emUsgzEDlmiQmFGjBLkSu8ZPjxlVEyd7ULw4BMD
 Dj3NZ7XIiKoJPj0BFyT/WSAWBy7w1fJ32DrpP6Ldef3IdVvtehOfOuzu8iFTJJRji4Xa
 EtDkECrPHkpEuxUpqpJg9FHpcCLmxtNoni8Ui3Zt2da/urf4WLUeKkHZDXd8UILB1Hd2
 NMWJLd0ekZDgyYXx6u7P7wPcRM0CCWZcRucmZcvnMverXxSGynLfKuR+nVg+lvvmy5yC
 8vMEi62D63nsu5Ai4HMWYqoP6WaVoNSm2mgChbTXRxkHylbK8CIgNxgWSxeArpj6E0SI
 8/3w==
X-Gm-Message-State: ACrzQf3TDFUUiUgYtGLJVkF9HUcgAvOsS6R+mce8fKiZ2IpllqdLGZGe
 vOpHmzT/2tUFP7cG4m0TOjaXUiUn4+Iaeg==
X-Google-Smtp-Source: AMsMyM6qB4hhIkV+P0gC9Wyhdn+DknSjyT0TsUGE1JiMV5S0NJFyjKXt1k/3AOhTv86gZndIzsqD3g==
X-Received: by 2002:a05:6a00:114c:b0:528:2c7a:630e with SMTP id
 b12-20020a056a00114c00b005282c7a630emr33132032pfm.86.1666617962560; 
 Mon, 24 Oct 2022 06:26:02 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 b12-20020a1709027e0c00b00178ab008364sm17009216plm.37.2022.10.24.06.26.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 06:26:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/29] target/tricore: Convert to tcg_ops restore_state_to_opc
Date: Mon, 24 Oct 2022 23:24:51 +1000
Message-Id: <20221024132459.3229709-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024132459.3229709-1-richard.henderson@linaro.org>
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
 target/tricore/cpu.c       | 11 +++++++++++
 target/tricore/translate.c |  6 ------
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index ab7a1e3a6d..2c54a2825f 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -58,6 +58,16 @@ static void tricore_cpu_synchronize_from_tb(CPUState *cs,
     env->PC = tb_pc(tb);
 }
 
+static void tricore_restore_state_to_opc(CPUState *cs,
+                                         const TranslationBlock *tb,
+                                         const uint64_t *data)
+{
+    TriCoreCPU *cpu = TRICORE_CPU(cs);
+    CPUTriCoreState *env = &cpu->env;
+
+    env->PC = data[0];
+}
+
 static void tricore_cpu_reset(DeviceState *dev)
 {
     CPUState *s = CPU(dev);
@@ -161,6 +171,7 @@ static const struct SysemuCPUOps tricore_sysemu_ops = {
 static const struct TCGCPUOps tricore_tcg_ops = {
     .initialize = tricore_tcg_init,
     .synchronize_from_tb = tricore_cpu_synchronize_from_tb,
+    .restore_state_to_opc = tricore_restore_state_to_opc,
     .tlb_fill = tricore_cpu_tlb_fill,
 };
 
diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index a0558ead71..c5b7bfbf20 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -8886,12 +8886,6 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
                     &tricore_tr_ops, &ctx.base);
 }
 
-void
-restore_state_to_opc(CPUTriCoreState *env, TranslationBlock *tb,
-                     target_ulong *data)
-{
-    env->PC = data[0];
-}
 /*
  *
  * Initialization
-- 
2.34.1


