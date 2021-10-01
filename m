Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A774341F3FC
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 19:54:45 +0200 (CEST)
Received: from localhost ([::1]:39214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWMk8-00089d-Ml
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 13:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM8C-00024X-9k
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:15:32 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:34319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM8A-0007nf-Lf
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:15:31 -0400
Received: by mail-qt1-x834.google.com with SMTP id m26so9655851qtn.1
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iPL+UEtKoL8lJ1cyR3L2m8ieOZFTWfsG23UG08w8UQA=;
 b=lAPempVc8wKoCpsCyl7WPizXjjoRoKUIKutQDgqLcxRhw7QBy0BxLYrht4oKg0isT4
 zOlLhpP2bm7/id7TvMYJ1b+GU84WV8m4bso67TY4kY7v/wPtLZwCGzWtFks2nAHiU7gK
 C0YNteDLdHvMWlrjoi3jwWFPqcuv5FUruHTBldgQavauA0Qf+MgxbS9rWa+uYHBe8aj5
 nP3Q2HN9ZyJBRJ5aB2+4dhh+o2wsWRInuzamwdveUZZTSWg7/PAU+O7zLaoUps+gMU0T
 3PCTIIXnvUdA1plp4RL/+GgBR8riSefC4Xx35wKauR3oVbZgMUgJDgNzU/JZ6MV8iYt+
 MLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iPL+UEtKoL8lJ1cyR3L2m8ieOZFTWfsG23UG08w8UQA=;
 b=aiZNJYvtjsMcFHxq3Ye1/sLymfsp5rj65kYGObqC5qP17i5rQSBR9c19JRXWdWfwGc
 zvh/2W4fCy7uAPhkSyLIMmUbYo2EZc6gcyj9mEFToj+V+eLFL+o+VFRQHIV0gF7rpDxJ
 SEsvZAfi5Ez3Yvv0fkRGjnMDSnPQbRZt72a3KiOMoiXLD4WglKlP8lJfu3H3dNCQvTp7
 Sq4XYspFuRCzTgdxWuT3sJmbrSJ4c4BwzeZrv2S//g9EcRKqbcGBu/W0ByvR2tR44Xp+
 lIsEOs8TWcgF7Y+4JSZP1R6aph19spEZg/HVkMVS2iujGjrwTrNLAoQKPPxxJgj0qAr4
 ld/A==
X-Gm-Message-State: AOAM531w7iRMaImzUuxhcDPNGVkA9+Pae7Ssn65a1WKnTSttp0ttUSAC
 odwQw76AOmF2NuMu4jgz1/7CWCm3vr3lmQ==
X-Google-Smtp-Source: ABdhPJzHFC3svVyqxQADWjy6VBZDGrHRTTk2XDh3VIMaDTjbnaXDe25twIY7MlD5luhNrd3b4rxsxA==
X-Received: by 2002:ac8:5685:: with SMTP id h5mr14364478qta.153.1633108529762; 
 Fri, 01 Oct 2021 10:15:29 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id l5sm3697516qtq.4.2021.10.01.10.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:15:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 41/41] accel/tcg: Restrict TCGCPUOps::tlb_fill() to sysemu
Date: Fri,  1 Oct 2021 13:11:51 -0400
Message-Id: <20211001171151.1739472-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001171151.1739472-1-richard.henderson@linaro.org>
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x834.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have replaced tlb_fill with record_sigsegv for user mod.
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
index 8c22f711f1..d32bc5e1e5 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -694,9 +694,6 @@ void cpu_loop_exit_segv(CPUState *cpu, target_ulong addr,
 
     if (tcg_ops->record_sigsegv) {
         tcg_ops->record_sigsegv(cpu, addr, access_type, maperr, ra);
-    } else if (tcg_ops->tlb_fill) {
-        tcg_ops->tlb_fill(cpu, addr, 0, access_type, MMU_USER_IDX, false, ra);
-        g_assert_not_reached();
     }
 
     force_sig_fault(TARGET_SIGSEGV,
-- 
2.25.1


