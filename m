Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB7760F492
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 12:11:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onzjj-00083t-Gb; Thu, 27 Oct 2022 06:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onzjY-0007O7-EK
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:03:32 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onzjV-0004Gd-I4
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:03:32 -0400
Received: by mail-pg1-x531.google.com with SMTP id h2so851611pgp.4
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 03:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i4zXGhAahLgSXdO3U/esGQ4mxgb9DP6esDERUUVmeB4=;
 b=kZP9a0wrjTxiZWCgdkAAOSMDxyZPtKB7Sr0kkfzSMVgib+KoU09/9I/Gqy46voRYSq
 OSv6T03K1HM6gVxdWI9Yq7ItWPA/vcehP90iycBOTxtnURpx1aUHfL0mcprcwVKg2I3A
 PPRRspUXaIQUEg8qkqFdXn4XY5hXlA1DKMrdv+L04maZE5GmBkR02Fhu9FhkBF41ii66
 SVYDkHZTrvH8xzvj5fxi7J9rsZ2nVh2HumSpuH3tkNf7d484hLo/LSXqFbFc9W/ekK5l
 4YunTfcPSxRriHYhdWiJgWOZqqUUki6o8gq6TIthx7zT8yJ/sLMx/aKxYqOFkWtJWFoT
 oDmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i4zXGhAahLgSXdO3U/esGQ4mxgb9DP6esDERUUVmeB4=;
 b=wcDLTovkm9mW5zljs+v6mu6ZwXFTHGK2HAB0wqKYzPs6hZxZtURqRUJDQyVkIViPR3
 AT0xaiRv5YAHG2PxvP8/yWrTZxSAeeugiO5OEnTVdbfF05oqH1wcD7WarU+X64VIrueQ
 N+K5YAU6GLxrAplLv6EyCeSOuUVKXqmdtSNKIbX5xlHbjeRBEJ2WpP/KfrUL4GkoyaaM
 F3h7Yrn0K5Al7wGZzAUX6Xr7lAw34t0ba31jNYXatE4pIpbR+RZGQcfXd2153qb5A9Nc
 LiHHEr2Xwygym8VgpYWT2zSKdQVAFYech9AB7idUq08k1FXRluSwCyBKlWGnXFzIcCXp
 M76w==
X-Gm-Message-State: ACrzQf0DedicHp4mFxVcKbqduijrD+gtw63xnLKa1CXvBDvE5gpl8jKy
 xXpEC8Lnu0Zy7g/JJXKsxCdRBYxGktMc7blj
X-Google-Smtp-Source: AMsMyM5nxpZvQZTP732Y/vPFSaKKJ0B3k1HGWtHdw8qQjTHYOn9GGZavB/gqqZ31w7OQuRb9zx/KXw==
X-Received: by 2002:a63:2c4c:0:b0:434:e001:89fd with SMTP id
 s73-20020a632c4c000000b00434e00189fdmr41231987pgs.444.1666865006768; 
 Thu, 27 Oct 2022 03:03:26 -0700 (PDT)
Received: from localhost.localdomain ([2001:8003:501a:d301:3a91:9408:3918:55a])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a17090a2bcd00b0020a825fc912sm2354631pje.45.2022.10.27.03.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 03:03:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: cfontana@suse.de
Subject: [PATCH v2 6/6] accel/tcg: Remove reset_icount argument from
 cpu_restore_state_from_tb
Date: Thu, 27 Oct 2022 21:02:54 +1100
Message-Id: <20221027100254.215253-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027100254.215253-1-richard.henderson@linaro.org>
References: <20221027100254.215253-1-richard.henderson@linaro.org>
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


