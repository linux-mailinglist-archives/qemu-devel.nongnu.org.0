Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B2260AC01
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 16:01:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omxTM-0003gP-OC; Mon, 24 Oct 2022 09:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxTE-0003b7-Ie
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:26:24 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxTC-0004Dt-Vy
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:26:24 -0400
Received: by mail-pg1-x531.google.com with SMTP id e129so8666114pgc.9
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 06:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=f8qsMcCsQagx0RPMC3BDVQY/Bl0raSyyh0zngsEm1gg=;
 b=IkLdm1m8k8vObCoOFbHK97HUhGpL3KJo9Dq3Doc56b7wjGiXrW1xudd1AZR2BwZzwZ
 4EdSw0YbOvwmjMli10KGq+459ZSFxWjIvIaQuj85JgQuMwLJ5becRje96QpPAzvm7gy6
 fNhMuBg/TLWabQ/H+lFVtCy39crHzfQILhokLoIpMm+VNrHSrIKikQJMTIHVqo0RRVr4
 DdYs3aQYFIrJoZoZXClPh9K8A71xtbg0qefhF0+8DhCrVcbWEpbqy+nzBEirUcU0QTlR
 Vz3+3A6tbr/PgJypR+Sz1y7l8s368pvUUpAlWgqeUFaW8zFupQp4XR/WjW90/4YT8rKD
 aM7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f8qsMcCsQagx0RPMC3BDVQY/Bl0raSyyh0zngsEm1gg=;
 b=2AEEZLNWwi+ljjeqoQkUi4xeyxC899S7nnslnXPIS+THTNABD1r828kjaKLHVHi+n5
 kQQwV9X5diDKe0QSKhn69oXAWf2HbnRgooEFDrrqIvZo/sLItNwIInAXYGu6KCCf/MTC
 l0Io+MUUdTe4G3S4n9a6wZvplULpV/7GUVnKp6SlqQB4z+bZfIU+UdAs1uWnnKpM+uhp
 suQWSu+qtozn17LmcGPLtkJ5nRvLL2/VTWycw1DyY6M69eO1FmP7z7Yl7urT4c1j204i
 1iY4b3JYgUX/ArBRYuJOTHmXQNSE/xvieXuUEHFEuajHjHk6nOr2g6xRwZ4x84jR82dg
 D+tg==
X-Gm-Message-State: ACrzQf3nhiU/bjAQEhP+dbA0RGMiPkdkLBUi7we5Hv6ZayQl/SHcZDli
 R3WaD3qNLFMxopygUgPE3FRJIJNbiQ6mMA==
X-Google-Smtp-Source: AMsMyM6hpgnPJYeDKWntc5QEYQ+RYnMZkcU1wBeFsGv+wxnsilBqGPjyfVvDs/iICAycV32PdHbVpg==
X-Received: by 2002:a05:6a00:16c4:b0:535:890:d4a with SMTP id
 l4-20020a056a0016c400b0053508900d4amr33795615pfc.0.1666617981378; 
 Mon, 24 Oct 2022 06:26:21 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 b12-20020a1709027e0c00b00178ab008364sm17009216plm.37.2022.10.24.06.26.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 06:26:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 29/29] accel/tcg: Remove reset_icount argument from
 cpu_restore_state_from_tb
Date: Mon, 24 Oct 2022 23:24:59 +1000
Message-Id: <20221024132459.3229709-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024132459.3229709-1-richard.henderson@linaro.org>
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The value passed is always true.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index dd439b5e3c..9e7dd41795 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -353,12 +353,11 @@ static int cpu_unwind_data_from_tb(TranslationBlock *tb, uintptr_t host_pc,
 }
 
 /*
- * The cpu state corresponding to 'host_pc' is restored.
- * When reset_icount is true, current TB will be interrupted and
- * icount should be recalculated.
+ * The cpu state corresponding to 'host_pc' is restored in
+ * preparation for exiting the TB.
  */
 static void cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
-                                      uintptr_t host_pc, bool reset_icount)
+                                      uintptr_t host_pc)
 {
     uint64_t data[TARGET_INSN_START_WORDS];
 #ifdef CONFIG_PROFILER
@@ -371,7 +370,7 @@ static void cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
         return;
     }
 
-    if (reset_icount && (tb_cflags(tb) & CF_USE_ICOUNT)) {
+    if (tb_cflags(tb) & CF_USE_ICOUNT) {
         assert(icount_enabled());
         /*
          * Reset the cycle counter to the start of the block and
@@ -404,7 +403,7 @@ bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc)
     if (in_code_gen_buffer((const void *)(host_pc - tcg_splitwx_diff))) {
         TranslationBlock *tb = tcg_tb_lookup(host_pc);
         if (tb) {
-            cpu_restore_state_from_tb(cpu, tb, host_pc, true);
+            cpu_restore_state_from_tb(cpu, tb, host_pc);
             return true;
         }
     }
@@ -1715,7 +1714,7 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
                  * restore the CPU state.
                  */
                 current_tb_modified = true;
-                cpu_restore_state_from_tb(cpu, current_tb, retaddr, true);
+                cpu_restore_state_from_tb(cpu, current_tb, retaddr);
                 cpu_get_tb_cpu_state(env, &current_pc, &current_cs_base,
                                      &current_flags);
             }
@@ -1874,7 +1873,7 @@ static bool tb_invalidate_phys_page(tb_page_addr_t addr, uintptr_t pc)
                    restore the CPU state */
 
             current_tb_modified = 1;
-            cpu_restore_state_from_tb(cpu, current_tb, pc, true);
+            cpu_restore_state_from_tb(cpu, current_tb, pc);
             cpu_get_tb_cpu_state(env, &current_pc, &current_cs_base,
                                  &current_flags);
         }
@@ -1904,7 +1903,7 @@ void tb_check_watchpoint(CPUState *cpu, uintptr_t retaddr)
     tb = tcg_tb_lookup(retaddr);
     if (tb) {
         /* We can use retranslation to find the PC.  */
-        cpu_restore_state_from_tb(cpu, tb, retaddr, true);
+        cpu_restore_state_from_tb(cpu, tb, retaddr);
         tb_phys_invalidate(tb, -1);
     } else {
         /* The exception probably happened in a helper.  The CPU state should
@@ -1940,7 +1939,7 @@ void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
         cpu_abort(cpu, "cpu_io_recompile: could not find TB for pc=%p",
                   (void *)retaddr);
     }
-    cpu_restore_state_from_tb(cpu, tb, retaddr, true);
+    cpu_restore_state_from_tb(cpu, tb, retaddr);
 
     /*
      * Some guests must re-execute the branch when re-executing a delay
-- 
2.34.1


