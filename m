Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E57153CF153
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 03:27:48 +0200 (CEST)
Received: from localhost ([::1]:58586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5eXz-0002jp-Vz
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 21:27:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5eOs-0006hc-4d
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 21:18:22 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:38908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5eOq-0003U3-JT
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 21:18:21 -0400
Received: by mail-pg1-x535.google.com with SMTP id j4so4364930pgk.5
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 18:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PHrvozsxOuSVOdMrHpVZufZjeOyEcT2c7pJZ5VYPbLQ=;
 b=LqcLCGC/iSpJhqSymm6FsT2nMAYWGbh3DA3hh7GUU2r8bESyyT6easxU6T6tWZH4DY
 0VY3EurKgJ4gQ8nDb0tAVCXiWrbFcrUNoPMGouvMGoxUFI8y107Skx+aA9HODHlO4fi1
 zPXNJaQl5DC2j6hyc/Dkd8FfW77azMxWCwwtvj0E434sIL3L/Zw1plrEpJhEQ3E99ywp
 4513cRD1GK1Uds0yWtutcGu/5Dn1X6G6Vlrve4h94Ov4FDHOf7dIupHYfKIU3W+e2Ya7
 hHy39A8FofkZehKfO4wWE5JiDurGdyTEbeyT7p4OENAsdFTG/FNOXoDTQPFjA+KNpF8m
 8qMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PHrvozsxOuSVOdMrHpVZufZjeOyEcT2c7pJZ5VYPbLQ=;
 b=fPdYWfhFYPepDcIM4OENDbWUOFB4BPnj0YBeSmBUjL7MZeBFS105HV/OB2zG2UaSoM
 AsVyCw4CdD5gJDEWi1GRrEoDZXvPirHwHffRfBEfxSJhlSJUzHhn1o0KfH6STE8wdRS4
 6l5NvhPeFBbIz08SGim5moBVNZz/L9xmGa4jXwQfBGZzYC+c5RUx0zBRzWozyo+gbN0o
 WUk3Y4KmXi2dstGW7GJq5eSLs+IJe0JSpaeT+qOImqjOUSJSNiKCoSOZ8JEzbZNrTU0r
 2hd6BhxsJ6C8xQuFERjt0Ma4aRKarVFUn/8Z+VwQiLDhsyKx5r+CAL7qq1sAw99Zwgx4
 MNfA==
X-Gm-Message-State: AOAM532W5cpjOwJetmLwcxf2KMt0CzLp4kekX45al7HAh4dbXWk3qmd7
 j20p0FkbrhbPWthD6Q3hJ7b3PhbQvdLfPg==
X-Google-Smtp-Source: ABdhPJwpCPuBDWiVEWXTSyDbdGOFgEs4mqk4lfCtvRe0vX95//mugNQN5Mle3CIYV+XOUO2EHCLrUA==
X-Received: by 2002:a63:4761:: with SMTP id w33mr28069071pgk.195.1626743899332; 
 Mon, 19 Jul 2021 18:18:19 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id e4sm25378054pgi.94.2021.07.19.18.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 18:18:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v5 11/15] accel/tcg: Merge tb_find into its only caller
Date: Mon, 19 Jul 2021 15:17:56 -1000
Message-Id: <20210720011800.483966-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720011800.483966-1-richard.henderson@linaro.org>
References: <20210720011800.483966-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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


