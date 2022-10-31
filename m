Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBB8614052
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 23:02:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opcr5-0005Vo-3F; Mon, 31 Oct 2022 18:02:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opcqU-0005FC-EY
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 18:01:33 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opcqS-00015T-Nu
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 18:01:26 -0400
Received: by mail-io1-xd30.google.com with SMTP id p141so10933718iod.6
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 15:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i4zXGhAahLgSXdO3U/esGQ4mxgb9DP6esDERUUVmeB4=;
 b=M5vekugyVmneOtnAbz3CJzUp0bmppL8R4FR8iVUyIScgCorL93Yza0ZmjeUBRxNf6j
 ztnFUFADt5IFVOnf4H8apNDHnbnVmwfHXSPVVm2pJLQuOf38PGLBeG5b5uGXy+JGR6bz
 4bX5wLE96txlmW7ZGk9ssO10TDQT7n+joHY2uy7pKbp4tVlZk9x3QVTRuPgeKsDGliBN
 ZTWzJ9omPTfl+9b4kCsy+8NccsdHe6fFs0RD9rdq0wd8YFhJvFBmdzcYqJKtOIb3+8Lq
 51CvXA1Iccwy0ygS3JePRnl3M25IkeAj/psY5de1Bj0mQQHHpy45gq+51e5FSiBVHw3Z
 pcJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i4zXGhAahLgSXdO3U/esGQ4mxgb9DP6esDERUUVmeB4=;
 b=Q5rQjmyW2JcyM8/6Q4+WevrYi26n+WsCaGzVHx8507sPa+ai6MT/kzW859Q17o3sF0
 093rL3EEK9jyg6KD6WCwqBx4eh60PLsjfPeML/72wZ4va270peOYwkH3NQhVET6IKQt8
 Q9w7D1cTptNcti9j51kSVX/+04MCUR+HcUyCdPZpfVJy8zRrO/9dTbiOTgG4J7VUmNyr
 p9lVYPLFAi3PQlAKVgK5EWZXnCgpw/arDl6qGEOeS0o2xYZiT6AXyBIxY0mt2Bn5kqpi
 806XIL5l+Glq23Ohd7sh2VgJd/QIsk5dF3geb+BalHfT0nFQ3hqz9fgYz9AbDYOxydtF
 xcqg==
X-Gm-Message-State: ACrzQf1QzApqWyUwpW2CXt0dKlvyAENa+a72+6Qi6WmiyvNb+44tpYEk
 Ten+Ae/EIeL20s2xqL3Jr4xbqqW1C6n7cQ==
X-Google-Smtp-Source: AMsMyM463nmafQ2YPRIO9Af64jMxiB610TGD9jkoUt+Hvsm+mUsQ6mNrRoJBxGWf7iHNF5KVMV+NnQ==
X-Received: by 2002:a05:6638:1210:b0:375:4aa6:ff85 with SMTP id
 n16-20020a056638121000b003754aa6ff85mr6843097jas.227.1667253683964; 
 Mon, 31 Oct 2022 15:01:23 -0700 (PDT)
Received: from stoup.. ([172.58.176.58]) by smtp.gmail.com with ESMTPSA id
 s7-20020a02c507000000b00363ec4dcaacsm3203039jam.22.2022.10.31.15.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 15:01:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@gmail.com,
	Claudio Fontana <cfontana@suse.de>
Subject: [PULL v2 10/13] accel/tcg: Remove reset_icount argument from
 cpu_restore_state_from_tb
Date: Tue,  1 Nov 2022 09:01:10 +1100
Message-Id: <20221031220113.414796-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031215723.414467-1-richard.henderson@linaro.org>
References: <20221031215723.414467-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd30.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

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


