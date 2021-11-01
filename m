Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBD3441FD5
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 19:13:39 +0100 (CET)
Received: from localhost ([::1]:48774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhboQ-0008Sv-9g
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 14:13:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb99-0007nM-K7
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:30:59 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:43717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb96-0001BN-FC
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:30:59 -0400
Received: by mail-qk1-x734.google.com with SMTP id bp7so12001741qkb.10
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AlAKO3pHLk0w42dzpdqlCWgmBC5kkngUdLfuQLXO9ho=;
 b=PpbPMVkXeomNsZeoSgLpp+YasKiomCQTW4/4SHDN7W+swgL9vnBh8vbriy/ftBWkEV
 BvbZhiGTgTpyEAmLH4v46aAHVMn20W3Gu/owMc7lp6SBP5q9yGnWdP4oohMzOGZhjz0Y
 pwFq/Ew8PgycsFkHH0673c0AOyi/zqNZShXYdB+Z4myBbyzlNwMNSaLIBRx3+FxFF7kY
 2BxyyweCa8oVzfoPOQZw9/TW3a820UYS7JEmZAJ9HXOkZG5KCCjyvGcJC+a4TRs592CL
 02Kn6FW3gC1oGoCUmAe7b14g7mOcswJPuEyL0Rnsv8k95OHwo9n0Ucv22yBvfXcz6Y8x
 1/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AlAKO3pHLk0w42dzpdqlCWgmBC5kkngUdLfuQLXO9ho=;
 b=ySTFG/e53eOPLfdQNA5L2r7HYkizIuXXetthlnoMnu6h1J/FOCzp+GSezRsJIMpr2n
 kXP2dku6nfvKmRxVtKRbDwv+2791lZVV9YIpOOFfYJLwhmOxj1GCYfW4unbvrHFg/4yg
 Hxm0yoFLsWZnQ/5uUSUgPBS8tfIOmQO6foAN7Q6JjbzlB/fU1tD6zArCdgBqi/g73laj
 q9mTDbuWk9INIOC+zwExDl3cuDVrzGYT4t23H0WAQNK0EocQn4Z2+FogSdY9mfHIpKmy
 fE7zDBIRyfXpZ2gwsfq3IYbShf2qte1w5eoMaBZA/wltW0Ktiox2RprODBT+z5cgdak/
 tOjQ==
X-Gm-Message-State: AOAM532nWpB4Mey3nH5jaUjD5Tu/n5GW6aK1GRvvKLhmdGe7QA4mQJCQ
 bwiTIbWlCiaXKJV6i4QpGOb+eFS85ALADQ==
X-Google-Smtp-Source: ABdhPJyZyQG0w1Kg0RkepMgJXlgSh/geD939yGN5R/8FneXfUYqRr5kpY4BT/G8Ca1nGR/st9acdmw==
X-Received: by 2002:a05:620a:4706:: with SMTP id
 bs6mr23795494qkb.122.1635787855338; 
 Mon, 01 Nov 2021 10:30:55 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id 13sm1222289qkc.40.2021.11.01.10.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:30:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 41/60] accel/tcg: Restrict TCGCPUOps::tlb_fill() to sysemu
Date: Mon,  1 Nov 2021 13:27:10 -0400
Message-Id: <20211101172729.23149-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x734.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have replaced tlb_fill with record_sigsegv for user mode.
Move the declaration to restrict it to system emulation.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/tcg-cpu-ops.h | 22 ++++++++++------------
 linux-user/signal.c           |  3 ---
 2 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index 41718b695b..8eadd404c8 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -35,18 +35,6 @@ struct TCGCPUOps {
     void (*cpu_exec_enter)(CPUState *cpu);
     /** @cpu_exec_exit: Callback for cpu_exec cleanup */
     void (*cpu_exec_exit)(CPUState *cpu);
-    /**
-     * @tlb_fill: Handle a softmmu tlb miss or user-only address fault
-     *
-     * For system mode, if the access is valid, call tlb_set_page
-     * and return true; if the access is invalid, and probe is
-     * true, return false; otherwise raise an exception and do
-     * not return.  For user-only mode, always raise an exception
-     * and do not return.
-     */
-    bool (*tlb_fill)(CPUState *cpu, vaddr address, int size,
-                     MMUAccessType access_type, int mmu_idx,
-                     bool probe, uintptr_t retaddr);
     /** @debug_excp_handler: Callback for handling debug exceptions */
     void (*debug_excp_handler)(CPUState *cpu);
 
@@ -68,6 +56,16 @@ struct TCGCPUOps {
 #ifdef CONFIG_SOFTMMU
     /** @cpu_exec_interrupt: Callback for processing interrupts in cpu_exec */
     bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
+    /**
+     * @tlb_fill: Handle a softmmu tlb miss
+     *
+     * If the access is valid, call tlb_set_page and return true;
+     * if the access is invalid and probe is true, return false;
+     * otherwise raise an exception and do not return.
+     */
+    bool (*tlb_fill)(CPUState *cpu, vaddr address, int size,
+                     MMUAccessType access_type, int mmu_idx,
+                     bool probe, uintptr_t retaddr);
     /**
      * @do_transaction_failed: Callback for handling failed memory transactions
      * (ie bus faults or external aborts; not MMU faults)
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 135983747d..9d60abc038 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -697,9 +697,6 @@ void cpu_loop_exit_sigsegv(CPUState *cpu, target_ulong addr,
 
     if (tcg_ops->record_sigsegv) {
         tcg_ops->record_sigsegv(cpu, addr, access_type, maperr, ra);
-    } else if (tcg_ops->tlb_fill) {
-        tcg_ops->tlb_fill(cpu, addr, 0, access_type, MMU_USER_IDX, false, ra);
-        g_assert_not_reached();
     }
 
     force_sig_fault(TARGET_SIGSEGV,
-- 
2.25.1


