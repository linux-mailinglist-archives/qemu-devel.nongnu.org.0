Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B63936DE07
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 19:17:17 +0200 (CEST)
Received: from localhost ([::1]:33492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbnoK-0002bg-6j
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 13:17:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbnco-00084M-K7
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:05:23 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:41768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbncm-00061H-HG
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:05:21 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 o21-20020a1c4d150000b029012e52898006so9239631wmh.0
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 10:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fVSsRIdWjTO573Wp4QCX8aQdVwf3iswd3WsuMon1AAs=;
 b=DVsvn6rVWYLt16vA/ur6Vu/DOjWdXnD+nTpNs/BqPeuxk/AZXd6ib/S1r/kldtPc0T
 0rtMBacmw4rxcBQWZ7K9+DQoHuXlsm9ZV5kxKoivhcJyz3KWwC2pLSinoisOrE6uvywk
 2NDac1bXpcyQqPTXTo8z8PQKLD/2U67/dV1B6NzJwyW3wX3msPYcfTiA8I2kMG01hgkm
 h8T0poTJMfdkT/yNYo0F+DVPMqlI4R2bK8on1rz6qc4L0kly7faFeGCfP9q+IwAfn/sI
 SDYwxd3tTM6XUFfHLWa+bKo7DlohozxZs5MiJ/WPDkPirGjp+nIOR744O1/UqIuNSjGV
 y8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fVSsRIdWjTO573Wp4QCX8aQdVwf3iswd3WsuMon1AAs=;
 b=nM0sF1jA7NqOt5J1e3vR9ExxpY/rz4808q/ihHZvYrsgDdBRHR+EGZANCVJYVA396D
 Fu55InaIgijTArFsWAprFvYRvGnnUjOnKeN50or9tpfTXWTzUX6rEYDrHGszxcn3Q4t1
 IrXBt0nItfWVKvu4+XrovzDzVcLtHP9WR68omFEY6BbjHX5qPD64UwC2zA3rqn/QSguT
 /5WSKJPLnLtAgxTRxX7PL0+80t3+dfALU3NdDBrzs5oZtvA0zXNkKgHpKgxgFRCRWpM2
 n0nkDRXN/2LhdQyKldVJ7yoxjR6df0MsMiGZ9H/gkReTOAWvb3KlWrTVpeSiwvKgTIss
 gQOQ==
X-Gm-Message-State: AOAM533rNXPqpcy466WBRmXlogf6P0Zlp+WSOMgCaVnM9m5hg3/hvKoy
 NTgTNFdA3FmYQDmeKeThtPxm510t3JsCBg==
X-Google-Smtp-Source: ABdhPJyTqpy0HC5hDBvRtqUL49sURErddUHzRGMc8hC0f5QOakjby5qzf3rEw+vYGJhMm+1Iwkwtgg==
X-Received: by 2002:a7b:c74d:: with SMTP id w13mr5908334wmk.25.1619629516585; 
 Wed, 28 Apr 2021 10:05:16 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id o17sm243715wmq.47.2021.04.28.10.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 10:05:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/30] target/mips: Merge do_translate_address into
 cpu_mips_translate_address
Date: Wed, 28 Apr 2021 19:03:49 +0200
Message-Id: <20210428170410.479308-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210428170410.479308-1-f4bug@amsat.org>
References: <20210428170410.479308-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently cpu_mips_translate_address() calls raise_mmu_exception(),
and do_translate_address() calls cpu_loop_exit_restore().

This API split is dangerous, we could call cpu_mips_translate_address
without returning to the main loop.

As there is only one caller, it is trivial (and safer) to merge
do_translate_address() back to cpu_mips_translate_address().

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h   |  2 +-
 target/mips/op_helper.c  | 20 ++------------------
 target/mips/tlb_helper.c | 11 ++++++-----
 3 files changed, 9 insertions(+), 24 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 04f4b3d6614..e93e057bece 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -148,7 +148,7 @@ void mips_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                     int mmu_idx, MemTxAttrs attrs,
                                     MemTxResult response, uintptr_t retaddr);
 hwaddr cpu_mips_translate_address(CPUMIPSState *env, target_ulong address,
-                                  MMUAccessType access_type);
+                                  MMUAccessType access_type, uintptr_t retaddr);
 #endif
 
 #define cpu_signal_handler cpu_mips_signal_handler
diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c
index 222a0d7c7b3..61e68cc8bed 100644
--- a/target/mips/op_helper.c
+++ b/target/mips/op_helper.c
@@ -287,23 +287,6 @@ target_ulong helper_rotx(target_ulong rs, uint32_t shift, uint32_t shiftx,
 
 #ifndef CONFIG_USER_ONLY
 
-static inline hwaddr do_translate_address(CPUMIPSState *env,
-                                          target_ulong address,
-                                          MMUAccessType access_type,
-                                          uintptr_t retaddr)
-{
-    hwaddr paddr;
-    CPUState *cs = env_cpu(env);
-
-    paddr = cpu_mips_translate_address(env, address, access_type);
-
-    if (paddr == -1LL) {
-        cpu_loop_exit_restore(cs, retaddr);
-    } else {
-        return paddr;
-    }
-}
-
 #define HELPER_LD_ATOMIC(name, insn, almask, do_cast)                         \
 target_ulong helper_##name(CPUMIPSState *env, target_ulong arg, int mem_idx)  \
 {                                                                             \
@@ -313,7 +296,8 @@ target_ulong helper_##name(CPUMIPSState *env, target_ulong arg, int mem_idx)  \
         }                                                                     \
         do_raise_exception(env, EXCP_AdEL, GETPC());                          \
     }                                                                         \
-    env->CP0_LLAddr = do_translate_address(env, arg, MMU_DATA_LOAD, GETPC()); \
+    env->CP0_LLAddr = cpu_mips_translate_address(env, arg, MMU_DATA_LOAD,     \
+                                                 GETPC());                    \
     env->lladdr = arg;                                                        \
     env->llval = do_cast cpu_##insn##_mmuidx_ra(env, arg, mem_idx, GETPC());  \
     return env->llval;                                                        \
diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
index 8d3ea497803..1ffdc1f8304 100644
--- a/target/mips/tlb_helper.c
+++ b/target/mips/tlb_helper.c
@@ -904,21 +904,22 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
 #ifndef CONFIG_USER_ONLY
 hwaddr cpu_mips_translate_address(CPUMIPSState *env, target_ulong address,
-                                  MMUAccessType access_type)
+                                  MMUAccessType access_type, uintptr_t retaddr)
 {
     hwaddr physical;
     int prot;
     int ret = 0;
+    CPUState *cs = env_cpu(env);
 
     /* data access */
     ret = get_physical_address(env, &physical, &prot, address, access_type,
                                cpu_mmu_index(env, false));
-    if (ret != TLBRET_MATCH) {
-        raise_mmu_exception(env, address, access_type, ret);
-        return -1LL;
-    } else {
+    if (ret == TLBRET_MATCH) {
         return physical;
     }
+
+    raise_mmu_exception(env, address, access_type, ret);
+    cpu_loop_exit_restore(cs, retaddr);
 }
 
 static void set_hflags_for_handler(CPUMIPSState *env)
-- 
2.26.3


