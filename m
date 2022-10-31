Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F04612FD9
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 06:41:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opNXX-0001ng-7n; Mon, 31 Oct 2022 01:40:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opNXV-0001m5-52
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 01:40:49 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opNXT-00045m-Fb
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 01:40:48 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-13b23e29e36so12473192fac.8
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 22:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i4zXGhAahLgSXdO3U/esGQ4mxgb9DP6esDERUUVmeB4=;
 b=v690nMUk+aUOCBbF8KBNfMPy7DDyo1NIrel5zhYqBjxZf9MmF5cBB5Huc71fGiS/nc
 BwfQ0y12CqdO/0A8J9q3A9X9KVc+LBtz97XQLCc0TuUdQiNLf2yCLK4306WA+a/rI3Ig
 ueY8YqUeem7jp0+9HwjkS7O9UI6l9a6EcB+MfX/5q5XnA6UclZs5j6ZJ4YeAUbAh78Mv
 37N8/WLUJXwAjfBYMk1XaWG1P6+865MFJCgP5Lqzm6Wircqp2RLwXLkfYCZk21Wje0Yb
 qxGcmLVsTIeTqshh+8ryhUW353+2HSTuDqMySoOocCfKVNWtNJDg/C8m8XsYjjy1kWy8
 NdfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i4zXGhAahLgSXdO3U/esGQ4mxgb9DP6esDERUUVmeB4=;
 b=J35eT8RymXPVOiiORAk5BY5UO2YQBMIMgx90LiT9xXMMhqT2dmstVmi4JCAB58hUMy
 77LdE4vzGxsXX4HNfA67p56gh4WdBlHmlU+ejjz/3IjgogxrLBfwqwqVGHKpaiSPr8n6
 HaYt2hDSmrc5LHIsXxN2JbkCwhqsTUn76IZh5NoZQiplOkwHfvou5pYGYivCLekWuWXy
 GfOUY8e7TIG79aFLMJXotfxcXSJvHxhjhN0Xw3Je5NX+b/9frN4G4MeaPBa8Nj/ZY7oy
 IivoD3jkDoUmm1dNvi0AD8MJwCrgsfSYCYUEJbJjupIP9189y7/7i7y5g230T4f3zCp7
 bAYw==
X-Gm-Message-State: ACrzQf2Qi1jpozrd1sNtxwGa8GilE0JUkZh5Kcrc9sPIJuAdYg0oVcPf
 ny6QVIiE7OlfP9bHIPOyN3MMAdMyC6dodQ==
X-Google-Smtp-Source: AMsMyM5bdwkBAK/whIIi+UT9skVv7lg0Im47bpMAnoAjU0vTJODKlZALyvLdgIBfFurdM0RK3hIk/A==
X-Received: by 2002:a05:6870:970e:b0:13c:5da4:aeb0 with SMTP id
 n14-20020a056870970e00b0013c5da4aeb0mr11772929oaq.27.1667194846093; 
 Sun, 30 Oct 2022 22:40:46 -0700 (PDT)
Received: from stoup.. ([172.58.176.235]) by smtp.gmail.com with ESMTPSA id
 u8-20020a9d4d88000000b006618586b850sm2473857otk.46.2022.10.30.22.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 22:40:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>
Subject: [PULL 10/11] accel/tcg: Remove reset_icount argument from
 cpu_restore_state_from_tb
Date: Mon, 31 Oct 2022 16:39:47 +1100
Message-Id: <20221031053948.3408-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031053948.3408-1-richard.henderson@linaro.org>
References: <20221031053948.3408-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2d.google.com
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

Reviewed-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/internal.h      |  2 +-
 accel/tcg/tb-maint.c      |  4 ++--
 accel/tcg/translate-all.c | 15 +++++++--------
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index 9c06b320b7..cb13bade4f 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -107,7 +107,7 @@ TranslationBlock *tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
                                tb_page_addr_t phys_page2);
 bool tb_invalidate_phys_page_unwind(tb_page_addr_t addr, uintptr_t pc);
 void cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
-                               uintptr_t host_pc, bool reset_icount);
+                               uintptr_t host_pc);
 
 /* Return the current PC from CPU, which may be cached in TB. */
 static inline target_ulong log_pc(CPUState *cpu, const TranslationBlock *tb)
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index c8e921089d..0cdb35548c 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -536,7 +536,7 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
                  * restore the CPU state.
                  */
                 current_tb_modified = true;
-                cpu_restore_state_from_tb(cpu, current_tb, retaddr, true);
+                cpu_restore_state_from_tb(cpu, current_tb, retaddr);
             }
 #endif /* TARGET_HAS_PRECISE_SMC */
             tb_phys_invalidate__locked(tb);
@@ -685,7 +685,7 @@ bool tb_invalidate_phys_page_unwind(tb_page_addr_t addr, uintptr_t pc)
              * function to partially restore the CPU state.
              */
             current_tb_modified = true;
-            cpu_restore_state_from_tb(cpu, current_tb, pc, true);
+            cpu_restore_state_from_tb(cpu, current_tb, pc);
         }
 #endif /* TARGET_HAS_PRECISE_SMC */
         tb_phys_invalidate(tb, addr);
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 90997fed47..0089578f8f 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -282,12 +282,11 @@ static int cpu_unwind_data_from_tb(TranslationBlock *tb, uintptr_t host_pc,
 }
 
 /*
- * The cpu state corresponding to 'host_pc' is restored.
- * When reset_icount is true, current TB will be interrupted and
- * icount should be recalculated.
+ * The cpu state corresponding to 'host_pc' is restored in
+ * preparation for exiting the TB.
  */
 void cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
-                               uintptr_t host_pc, bool reset_icount)
+                               uintptr_t host_pc)
 {
     uint64_t data[TARGET_INSN_START_WORDS];
 #ifdef CONFIG_PROFILER
@@ -300,7 +299,7 @@ void cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
         return;
     }
 
-    if (reset_icount && (tb_cflags(tb) & CF_USE_ICOUNT)) {
+    if (tb_cflags(tb) & CF_USE_ICOUNT) {
         assert(icount_enabled());
         /*
          * Reset the cycle counter to the start of the block and
@@ -333,7 +332,7 @@ bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc)
     if (in_code_gen_buffer((const void *)(host_pc - tcg_splitwx_diff))) {
         TranslationBlock *tb = tcg_tb_lookup(host_pc);
         if (tb) {
-            cpu_restore_state_from_tb(cpu, tb, host_pc, true);
+            cpu_restore_state_from_tb(cpu, tb, host_pc);
             return true;
         }
     }
@@ -1032,7 +1031,7 @@ void tb_check_watchpoint(CPUState *cpu, uintptr_t retaddr)
     tb = tcg_tb_lookup(retaddr);
     if (tb) {
         /* We can use retranslation to find the PC.  */
-        cpu_restore_state_from_tb(cpu, tb, retaddr, true);
+        cpu_restore_state_from_tb(cpu, tb, retaddr);
         tb_phys_invalidate(tb, -1);
     } else {
         /* The exception probably happened in a helper.  The CPU state should
@@ -1068,7 +1067,7 @@ void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
         cpu_abort(cpu, "cpu_io_recompile: could not find TB for pc=%p",
                   (void *)retaddr);
     }
-    cpu_restore_state_from_tb(cpu, tb, retaddr, true);
+    cpu_restore_state_from_tb(cpu, tb, retaddr);
 
     /*
      * Some guests must re-execute the branch when re-executing a delay
-- 
2.34.1


