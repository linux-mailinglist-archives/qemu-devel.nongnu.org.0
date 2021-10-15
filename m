Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A60C42E7ED
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:35:46 +0200 (CEST)
Received: from localhost ([::1]:46642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbEwb-0001qo-Ez
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEc3-0006Rc-P6
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:31 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:44015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEc2-0002l4-1E
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:31 -0400
Received: by mail-pl1-x633.google.com with SMTP id y1so5590513plk.10
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AlAKO3pHLk0w42dzpdqlCWgmBC5kkngUdLfuQLXO9ho=;
 b=gxL/J4fg2UqVuhFY6kvo4FD2c3UJHB2s+ejjFT81o8CcYpDVxep5lRnhe2MIRfXK/q
 mwQsVwq+gKm+K5gjGZv6kylWShC9TRbDrCtLqKKWZA0CG7EZTfC+Muz3rOnw+aCPrszS
 6M1J0hILeIkwBTbxfWWodD52rUvKYUqf3ein5e/ndFnG5wSx+bLzrAuGsNeWq3mVBUyX
 LC2yidsOofv9vUgiOjKGHFTjpXU80v5ceo1RcDHZGOnEF/kpBtzTrMs3frO9fNlgSWco
 /tsJRWtCZfm49G8kqaTqiPT5RaBlHDxiCDmoQtaJXnvg25AFKKfqF1EUtOKFQH70wkJR
 SKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AlAKO3pHLk0w42dzpdqlCWgmBC5kkngUdLfuQLXO9ho=;
 b=AJW9pqncHV37JwufH1I//GndVW2W+qq3F1fbU1yWpLdAQalVXw4FDLOl6rMz4yTpvN
 nxYohLKoiQWwUlnJCeWV6SajGBsIKaDbGYaaSvKXl+H0idwJhqDMGG7ZdriDMplArlqA
 FgJGyWuglSFbNtkBJi6+RtEs04u9T1yfacHvMM8nn+8X9JZtO9dekbfmOYAK5kEhQyNL
 eiCMoktPRkOXfSc9cmvKvDwtphbDdnY6+wvLUMGeWvDrfxIEltDM7lXhtXNXYlfSGey4
 8Ef+Mhvysudy+eeg0hO/CZJ/z0tkyx4+GgD/n0ZjesUqm0VkBhvt5CZITz9eFiBHx/h/
 M1JA==
X-Gm-Message-State: AOAM533Ttdbhy72u46hxtic5+DDycIM0fRYJp9oPwGDjE8d5Pexn1PEu
 juQniGIC7ZCj7EjCX4wqUayLwJDLdY38nQ==
X-Google-Smtp-Source: ABdhPJzFOxaobo995zRGx3+zs/20QSmwRBbhC7jHTNQvoo83tUWnoKKx0ef8N7pc2jpFyXQ0p/28vg==
X-Received: by 2002:a17:90a:8593:: with SMTP id
 m19mr10608225pjn.82.1634271268518; 
 Thu, 14 Oct 2021 21:14:28 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q8sm10236885pja.52.2021.10.14.21.14.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:14:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 41/67] accel/tcg: Restrict TCGCPUOps::tlb_fill() to sysemu
Date: Thu, 14 Oct 2021 21:10:27 -0700
Message-Id: <20211015041053.2769193-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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


