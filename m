Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E92F560AACA
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 15:39:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omxSn-0003Pm-4e; Mon, 24 Oct 2022 09:25:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSY-0003Iw-As
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:25:44 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSW-00040U-Lo
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:25:41 -0400
Received: by mail-pf1-x42c.google.com with SMTP id d10so8948000pfh.6
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 06:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zkKot/9RwNdoZ5yNziAUJ8ZKlma/qkDODlgfsBLjRko=;
 b=ZX/T4KdqzKFKNJF72qSfQ+VuhX9WtusKk1n9rZ43skMcBAKsUVyMFrOQes0y3KJEyN
 zJDJyuZJg+cz7ssuD0D4em+pr49ZIru7j/5MjeW1Pa07jjWcq/rM6Hjkkdg8cAfoSUgu
 LCvUNAvc2pgT2uAKDlyB0Wv+CK4hyksXU2qA0z/FG0jc8qDDL5+0OYjrudHHToeXS/N6
 5n3063LDhF7b8j6yoxdKzwfwvUNDto3ahecFBiKtLW4MIvrrx36e7mcpd4U2BozE/TzE
 a/8gCpeTCTg7Ir+J5VgcC6L8Wm5LoC4+GIOk+uP74ofUOtfYJ6+mIh5BfML8mi3dmD7B
 kBGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zkKot/9RwNdoZ5yNziAUJ8ZKlma/qkDODlgfsBLjRko=;
 b=qCBdnSaY5i1+lDKiA3T9irfcrm0H5t7jKN4IbMySQkFBT0iDvOJK49NGeMw0dyPnP4
 RfHRANNk9z80HvnAzbfAXfeXPOc3Lnx98DjoN0Mc80ajnkGKnabw/x0OUcouXODYGH3n
 pdt06R9Do2WUX40KrpJYLAZOTEPE4N5MDRkkoP4PvQOR/v5lApvkwgqWIoCPqkGkyBXd
 2cHELuerxltbVZaMme7TXyU1M9SYvIuyI/7sZmKN340mtHuxdK+OhJdzXoECzQOJUy6Y
 MsvxT1XR8tAa1yO0mp1slgho50yrizePqYDBDMWwG3oUSVPYnZri5gRNfcoBK0sawCxg
 KWHw==
X-Gm-Message-State: ACrzQf3N6Ke8GITbIWRzW8Ao0Tjhkxqigx8yRMd2UPnRg2iQ23OJ7u6S
 niTwwGE8vnnB788FoXTy9VLiKqHNwT3KNQ==
X-Google-Smtp-Source: AMsMyM6U4KZ7qZ8L+C2VRBVTSOBQu1wy0MU21kUFtslC/xuCt/QfaKwpDzHv2j/cjUgWhV8ynVWqHA==
X-Received: by 2002:a63:8449:0:b0:46e:ecba:c46d with SMTP id
 k70-20020a638449000000b0046eecbac46dmr9045586pgd.310.1666617939335; 
 Mon, 24 Oct 2022 06:25:39 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 b12-20020a1709027e0c00b00178ab008364sm17009216plm.37.2022.10.24.06.25.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 06:25:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/29] target/microblaze: Convert to tcg_ops
 restore_state_to_opc
Date: Mon, 24 Oct 2022 23:24:41 +1000
Message-Id: <20221024132459.3229709-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024132459.3229709-1-richard.henderson@linaro.org>
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
 target/microblaze/cpu.c       | 11 +++++++++++
 target/microblaze/translate.c |  7 -------
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index c10b8ac029..89e493f3ff 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -100,6 +100,16 @@ static void mb_cpu_synchronize_from_tb(CPUState *cs,
     cpu->env.iflags = tb->flags & IFLAGS_TB_MASK;
 }
 
+static void mb_restore_state_to_opc(CPUState *cs,
+                                    const TranslationBlock *tb,
+                                    const uint64_t *data)
+{
+    MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
+
+    cpu->env.pc = data[0];
+    cpu->env.iflags = data[1];
+}
+
 static bool mb_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
@@ -373,6 +383,7 @@ static const struct SysemuCPUOps mb_sysemu_ops = {
 static const struct TCGCPUOps mb_tcg_ops = {
     .initialize = mb_tcg_init,
     .synchronize_from_tb = mb_cpu_synchronize_from_tb,
+    .restore_state_to_opc = mb_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
     .tlb_fill = mb_cpu_tlb_fill,
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index c5546f93aa..974f21eb31 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -1946,10 +1946,3 @@ void mb_tcg_init(void)
     cpu_res_addr =
         tcg_global_mem_new(cpu_env, offsetof(CPUMBState, res_addr), "res_addr");
 }
-
-void restore_state_to_opc(CPUMBState *env, TranslationBlock *tb,
-                          target_ulong *data)
-{
-    env->pc = data[0];
-    env->iflags = data[1];
-}
-- 
2.34.1


