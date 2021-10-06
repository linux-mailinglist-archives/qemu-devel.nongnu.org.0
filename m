Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DF242454C
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 19:52:36 +0200 (CEST)
Received: from localhost ([::1]:48166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYB5n-0001BK-Ml
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 13:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAgv-0004pB-Qe
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:26:53 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:41478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAgn-0002Np-4d
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:26:50 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so2961795pjb.0
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 10:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AlAKO3pHLk0w42dzpdqlCWgmBC5kkngUdLfuQLXO9ho=;
 b=x70oBWRTOUjlHSfDe3laRmP5zMnWvUljraFSQ+9jRkLzpEEmkxsFLMCMAiiHN0PmpW
 eisbObKcnaZN0VTgVKLrcVaUeWaSkjyRg7YMkj/wRCC+xIixY/lhBbS1gQY3spiyzm5G
 GYI8deWV04wL42ZcyuyGwPVHxkzdxAjrpJct6cqt8EfacDlEH5rZbvspsFVbcxYEKYIN
 c/6fTpvhNI+u6Gvdb7Dgadj2llaZVbUOQjSXtkWXvlbITfj7XeJwH0nX0KSGApjSCTer
 1iDljmQsdMmWWicz8kokM20pozyZxy7VL80bQhowcbiAAuPSqZVG1N1c07K7e9T+mD9g
 geWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AlAKO3pHLk0w42dzpdqlCWgmBC5kkngUdLfuQLXO9ho=;
 b=FGZCJcZoeifPj9CQd/C+kJXb8Ek1GeZUFLXWriR0LyZmeKeIgXj3FpOOTNbOSXricD
 EtW8/HBknLGWW/m1ThmbrPjubeEBAI/ujRPf/2hB1wCs9cQoW9yXyB0HY+2JVqGafzCh
 +9tfgGWnZf+eMJkzM0N9MAnyi0gCDR7B8Fpe//T0AKq0m6jTsN6FYsq9IIBfxmhZ3uwO
 Bofu7MMgYAVUn5IItxA2nJgtMRLoMGHwM1d/of0mAtEBYh8GHjpQ3gUedRm0QYpESdSm
 v125tc79ztlw1eKOcUvi67WLBoxkUMvlETxuHbxHq+RGmCMBLGMQozc1Bge71UNGzEQ4
 DLRQ==
X-Gm-Message-State: AOAM532RfTeUqkVgK+RBayS2mAouLbHCxOSYTAx+aZtDwhPuQDI8E1i6
 o/o8itRqgIjq74ZvKNBtQKpzpKm3M8xj+A==
X-Google-Smtp-Source: ABdhPJxdhdy+73GXwSdwV1/UpV6DqI5A0TFXoj1Z2vK6MhjCN6UQx8MVqxylrCN3jgtybiea3DK+pw==
X-Received: by 2002:a17:902:7843:b0:13d:c728:69c9 with SMTP id
 e3-20020a170902784300b0013dc72869c9mr12226098pln.55.1633541203587; 
 Wed, 06 Oct 2021 10:26:43 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id p13sm5434011pjb.44.2021.10.06.10.26.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 10:26:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 41/41] accel/tcg: Restrict TCGCPUOps::tlb_fill() to sysemu
Date: Wed,  6 Oct 2021 10:23:07 -0700
Message-Id: <20211006172307.780893-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006172307.780893-1-richard.henderson@linaro.org>
References: <20211006172307.780893-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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


