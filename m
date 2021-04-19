Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 105D7364A9B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 21:33:54 +0200 (CEST)
Received: from localhost ([::1]:60758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYZea-00058A-1e
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 15:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYZQO-0006tz-5V
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:19:12 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYZQM-0001GT-FC
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:19:11 -0400
Received: by mail-wr1-x433.google.com with SMTP id h4so26140410wrt.12
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 12:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9idQeRNSVgpcYg4jC2bsnFCTDNB04ha1mM3lDtmDX/g=;
 b=P5yDUNz8mNDAqz0rIZlRpo2axmEAWEY3qKoo3bdVRneKgLv2e7rzKd/QsCBUbNH9Ta
 ZaFtJIqF3R+yE51h99H1284ogezoZOJFVFsDG//eI8L43OeFDkVdtC7bBG4FIZLU+FQr
 P/pcEz3mrJMU7SYUFNNZndBA6NiBmmzHAf4mVHwPhMOzDfEW+kI0269ADRdRhp1+Wd02
 9FFtrnxAymmH4R4RmHz9NxUFH6uhk1w6m8S+wrzNBuRQgUCEEbjhG/wVSCnczZqYkZM/
 Qk6qL16jjT2xmOshw045ZZZTabVOfguvKKUZgfLvfA1o0c6rHNJBAXDom7iYPyEZAtDY
 d1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9idQeRNSVgpcYg4jC2bsnFCTDNB04ha1mM3lDtmDX/g=;
 b=Bthggaib/0m4jsg1t3uxscljuVtSMzFK/vklz6WCwWhxs1PM6BK2pBzyc9eILJzxcZ
 ydyx87p10qm/nPakBLo2nnzULiGDp9k2dUGBgZrdlaE5ZSC9rwlVDVub7PAQjbiUqBm6
 Iuj771QxkutBcXetxj6V6wiqAFKG9Ar4QrWMSuVb7T/JUMw/w5q1/8+Yi8sQBmJWkGRu
 Hkzzsgjz+pnGpjvbxkuib+ebPyvQbEKoT4jCTUe2enlNT2WBSSnvRB1E2n6Sj/smKeyB
 28DklsKXX7gaaXdojgrHPgX4QdyG/KC1rBiuTizg1hT1tgVsbOCmJFU89mFR+aL9XwNq
 41BA==
X-Gm-Message-State: AOAM531D2E09eIeOefV7DBP9XMw4bApc4CLyowkbLJ5YjCdwDB0uXzvi
 7A+P5nuqwVRqth46MOSKOMuJGXsLpMR+og==
X-Google-Smtp-Source: ABdhPJxH580qYZZS1oehqGPSKisZxVPPVdfdkSMzcmMSlYLGXGNCohYz1jpsw4Pzkr4yNftBfR70PA==
X-Received: by 2002:adf:f106:: with SMTP id r6mr15982021wro.214.1618859948967; 
 Mon, 19 Apr 2021 12:19:08 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id l20sm510160wmg.33.2021.04.19.12.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 12:19:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/30] target/mips: Merge do_translate_address into
 cpu_mips_translate_address
Date: Mon, 19 Apr 2021 21:18:02 +0200
Message-Id: <20210419191823.1555482-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210419191823.1555482-1-f4bug@amsat.org>
References: <20210419191823.1555482-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h   |  2 +-
 target/mips/op_helper.c  | 20 ++------------------
 target/mips/tlb_helper.c | 11 ++++++-----
 3 files changed, 9 insertions(+), 24 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 81671d567d0..806d39fa6c3 100644
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
index f7da8c83aee..fdae5a3d687 100644
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


