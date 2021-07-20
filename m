Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 570B13D028C
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 22:10:42 +0200 (CEST)
Received: from localhost ([::1]:53852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5w4f-0007gj-BW
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 16:10:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5vpX-0007MK-1n
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 15:55:03 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:46960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5vpV-00088O-58
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 15:55:02 -0400
Received: by mail-pg1-x533.google.com with SMTP id r21so5347399pgv.13
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 12:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ii+bv9Rk/DIfrNA6Uf1YrDYjps9D/8ScD8K+6wC+mQk=;
 b=vGfKQNK/o1HO/PP7SEsGdc5pHtI8kB8b1qzxDut0ooinv38eNmEK5a60zIErD2COVu
 JoXhsbCehN5KRdTReadNBJXnNkxmOCzcTXlM7VgShY5WgHC+QLBlbr/aBjY0c13KH/Ve
 ZQpFR7WJYzdvPkt+/fuF8hJivAEAEe0Z86dP7D5ubxir4HzJ/uEUgcRWz2r8BICdK8dK
 CdiSFfcW9s9DM7O9ixt1+bgiE2QAOizNMwxHOWv3/2f2nUhHEdUUktuNRLpJyIGx/TW5
 vFGvpq3eBlfHsEpo3VWjd1+5rXyxjhew2/e8nCYQ8GCQrB95PfUDj0zeVv+r/LkT+GSd
 LwJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ii+bv9Rk/DIfrNA6Uf1YrDYjps9D/8ScD8K+6wC+mQk=;
 b=GOS7Hgo+EcFdQdgUhpoW08ol4Es7AEtPBM9Kr/A37N6op2/x56AsnhrAN0mLKg8XdT
 0DDZGDiayN6sERyTy78yFfkxaqfH1eOOc1JlZBjHqjopoi/GJ7jL1sJyOeopw5NiiB/c
 yKsQ2TPgvyFr0YVoVIU28p9UzP6XYIC5IaX8zRYkxwSV1mBFlP4bM0y1axqvW2KmH+qy
 7m+/e7vSM84/eYk9D9tc1++6FgVqYFaO70DXI1wFrz20YZUW/uJQzRt1cQrC2raXO/SI
 xPUMiCAmtz7IOkrO1F6wAc1LtwtpV6pmBC608WhvFI/Se/AD/6Hm/jsMcyV+TJqC0S7z
 wthg==
X-Gm-Message-State: AOAM532ucSSl+aZqvrZzbzoRn69ntqwfUadr67lUMyrbOamJRC39TqtG
 UtJlCUmHtPMK2W4XGXmgSkMV3Ml0Wv+qTg==
X-Google-Smtp-Source: ABdhPJxmgYwShXOY5g66StCOPhzih7yrThM9YLsSr/ZRZl2Qxy7iOS53wfLofod2mKPUoA41g/IPjg==
X-Received: by 2002:a63:d84b:: with SMTP id k11mr32391176pgj.372.1626810899941; 
 Tue, 20 Jul 2021 12:54:59 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id j25sm15422179pfh.77.2021.07.20.12.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 12:54:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v6 13/17] accel/tcg: Merge tb_find into its only caller
Date: Tue, 20 Jul 2021 09:54:35 -1000
Message-Id: <20210720195439.626594-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720195439.626594-1-richard.henderson@linaro.org>
References: <20210720195439.626594-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to want two things:
(1) check for breakpoints will want to break out of the loop here,
(2) cflags can only be calculated with pc in hand.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 83 ++++++++++++++++++++++----------------------
 1 file changed, 41 insertions(+), 42 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 5bb099174f..cde7069eb7 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -500,41 +500,6 @@ static inline void tb_add_jump(TranslationBlock *tb, int n,
     return;
 }
 
-static inline TranslationBlock *tb_find(CPUState *cpu,
-                                        TranslationBlock *last_tb,
-                                        int tb_exit, uint32_t cflags)
-{
-    CPUArchState *env = (CPUArchState *)cpu->env_ptr;
-    TranslationBlock *tb;
-    target_ulong cs_base, pc;
-    uint32_t flags;
-
-    cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
-
-    tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
-    if (tb == NULL) {
-        mmap_lock();
-        tb = tb_gen_code(cpu, pc, cs_base, flags, cflags);
-        mmap_unlock();
-        /* We add the TB in the virtual pc hash table for the fast lookup */
-        qatomic_set(&cpu->tb_jmp_cache[tb_jmp_cache_hash_func(pc)], tb);
-    }
-#ifndef CONFIG_USER_ONLY
-    /* We don't take care of direct jumps when address mapping changes in
-     * system emulation. So it's not safe to make a direct jump to a TB
-     * spanning two pages because the mapping for the second page can change.
-     */
-    if (tb->page_addr[1] != -1) {
-        last_tb = NULL;
-    }
-#endif
-    /* See if we can patch the calling TB. */
-    if (last_tb) {
-        tb_add_jump(last_tb, tb_exit, tb);
-    }
-    return tb;
-}
-
 static inline bool cpu_handle_halt(CPUState *cpu)
 {
     if (cpu->halted) {
@@ -868,22 +833,56 @@ int cpu_exec(CPUState *cpu)
         int tb_exit = 0;
 
         while (!cpu_handle_interrupt(cpu, &last_tb)) {
-            uint32_t cflags = cpu->cflags_next_tb;
             TranslationBlock *tb;
+            target_ulong cs_base, pc;
+            uint32_t flags, cflags;
 
-            /* When requested, use an exact setting for cflags for the next
-               execution.  This is used for icount, precise smc, and stop-
-               after-access watchpoints.  Since this request should never
-               have CF_INVALID set, -1 is a convenient invalid value that
-               does not require tcg headers for cpu_common_reset.  */
+            /*
+             * When requested, use an exact setting for cflags for the next
+             * execution.  This is used for icount, precise smc, and stop-
+             * after-access watchpoints.  Since this request should never
+             * have CF_INVALID set, -1 is a convenient invalid value that
+             * does not require tcg headers for cpu_common_reset.
+             */
+            cflags = cpu->cflags_next_tb;
             if (cflags == -1) {
                 cflags = curr_cflags(cpu);
             } else {
                 cpu->cflags_next_tb = -1;
             }
 
-            tb = tb_find(cpu, last_tb, tb_exit, cflags);
+            cpu_get_tb_cpu_state(cpu->env_ptr, &pc, &cs_base, &flags);
+
+            tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
+            if (tb == NULL) {
+                mmap_lock();
+                tb = tb_gen_code(cpu, pc, cs_base, flags, cflags);
+                mmap_unlock();
+                /*
+                 * We add the TB in the virtual pc hash table
+                 * for the fast lookup
+                 */
+                qatomic_set(&cpu->tb_jmp_cache[tb_jmp_cache_hash_func(pc)], tb);
+            }
+
+#ifndef CONFIG_USER_ONLY
+            /*
+             * We don't take care of direct jumps when address mapping
+             * changes in system emulation.  So it's not safe to make a
+             * direct jump to a TB spanning two pages because the mapping
+             * for the second page can change.
+             */
+            if (tb->page_addr[1] != -1) {
+                last_tb = NULL;
+            }
+#endif
+            /* See if we can patch the calling TB. */
+            if (last_tb) {
+                tb_add_jump(last_tb, tb_exit, tb);
+            }
+
             cpu_loop_exec_tb(cpu, tb, &last_tb, &tb_exit);
+
             /* Try to align the host and virtual clocks
                if the guest is in advance */
             align_clocks(&sc, cpu);
-- 
2.25.1


