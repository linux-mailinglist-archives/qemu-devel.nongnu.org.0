Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0064F41084C
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 21:09:53 +0200 (CEST)
Received: from localhost ([::1]:43314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRfii-0005rw-2P
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 15:09:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfOc-00028c-9P
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:49:07 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:42817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfOa-0000YN-Ne
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:49:06 -0400
Received: by mail-pg1-x52b.google.com with SMTP id q68so13076548pga.9
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 11:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=loPJ4fwu9tGHXBjISnsRpqTsfoBC8LJntmjmF4lGwE8=;
 b=aL+gt94Vb9+9BwTUJRN2W4P+jro2wkEzdTYq9+TQLx7wtNcNgWhS0iNngGjXeI+Xug
 8IKjz7apG76IJeacSUXnBwD5Q7cpv/FbA5jg/qXXDtIA6lXJlI4gYCvar93xbdBjJHUZ
 vJssrWihnSveyxIquwJU8NzToYShdqUroHDAqzYxYK2+OxmZS2pPpCCVy4Ru5poEbHH7
 lNJb48+EqiSSh5sZFgfpdXTAkb7CYX5wTBYbkK0A5U2sT3cVEjaGHCRgydsFWAH8xz8+
 fOt1Q05rCJWdBOWfTgfuYsVK14P/E6OKeeeH9EcEbA/5X3c/bd4r7uh9YuLTVmhWDXj+
 K9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=loPJ4fwu9tGHXBjISnsRpqTsfoBC8LJntmjmF4lGwE8=;
 b=r2no62dWd6IL/ZnBV5AKWGfI+Ii6Xspv2z181qcyfNEFwcjckRv6kx3uEefUwT9mAL
 nHJpC03LQ1IqTi9Ossxc5/O4ZZqxA00DKDAteg4NkpIRBwTvxiL1btPRwypxGeAiN0+O
 36cJOTo/uaeL2TVvBaI8QQW//nzCc7DChYWQqjiKrKzOJO/yTqdFODxSUBs91de3Yx1h
 tDAyD1sBYe4XNeX8IHN1tENOdFCU/rZmWvHxjyxd3SwN542MmtgZufFJl3LD+wZ80UPq
 EASg0SfjERFv/hRYQ+wDzk8c6KqRJNktaUjAL7qwznBEGrV4quJ2McIZFqNh6FXMEQt3
 yJZw==
X-Gm-Message-State: AOAM532PPYyd6+dEYQu/SMaMyHkaKXAV4bgGEh9kJ8zhTsc/piziuquc
 8cwzofa44p1lX/nsKfqiAVFbHzJs5DxfQw==
X-Google-Smtp-Source: ABdhPJzjATC2E9KX1FBnZ2BqYNXatViFDy/tIuXuJjTTZ/xBOBHHS0rhEpfoCyQ1dPNgICB+pQ55Jg==
X-Received: by 2002:aa7:9823:0:b0:43c:6454:92b0 with SMTP id
 q3-20020aa79823000000b0043c645492b0mr17021396pfl.68.1631990943309; 
 Sat, 18 Sep 2021 11:49:03 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id p30sm9916522pfh.116.2021.09.18.11.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 11:49:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 41/41] accel/tcg: Restrict TCGCPUOps::tlb_fill() to sysemu
Date: Sat, 18 Sep 2021 11:45:27 -0700
Message-Id: <20210918184527.408540-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918184527.408540-1-richard.henderson@linaro.org>
References: <20210918184527.408540-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have replaced tlb_fill with record_sigsegv for user mod.
Move the declaration to restrict it to system emulation.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/tcg-cpu-ops.h | 22 ++++++++++------------
 linux-user/signal.c           |  3 ---
 2 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index e229a40772..988561e8d4 100644
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
 
@@ -72,6 +60,16 @@ struct TCGCPUOps {
     bool (*has_work)(CPUState *cpu);
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
index ae31b46be0..4f4c919b23 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -690,9 +690,6 @@ void raise_sigsegv(CPUState *cpu, target_ulong addr,
 
     if (tcg_ops->record_sigsegv) {
         tcg_ops->record_sigsegv(cpu, addr, access_type, maperr, ra);
-    } else if (tcg_ops->tlb_fill) {
-        tcg_ops->tlb_fill(cpu, addr, 0, access_type, MMU_USER_IDX, false, ra);
-        g_assert_not_reached();
     }
 
     force_sig_fault(TARGET_SIGSEGV,
-- 
2.25.1


