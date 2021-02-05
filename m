Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2216231171F
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 00:30:40 +0100 (CET)
Received: from localhost ([::1]:54078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8AYh-0001ke-6w
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 18:30:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A3J-0002oc-1k
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:58:13 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:37879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A3H-0003g0-7r
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:58:12 -0500
Received: by mail-pg1-x532.google.com with SMTP id z21so5586060pgj.4
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 14:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cBSZecFHJJp/usGc+3/heP75DKhmYnZ0kaH0ekZQKBs=;
 b=JGy7VPrHFvp6Q5MFOHFT7S+4keAzms7339nHI3a/B2GazBwJY8NXdWPHU4G8shMB6F
 IjTaGvuJjc/qM4oHqXO0f7HarSFamue0w0DJ8Ln0ggUVssIXcsJKiKkvZSVobSzYcWmV
 GpL2EHXalAHQLrKax+Tf1lFxorkg5I8WlWtUscAqctbGG/f55+wjXn786DRzOzhBdh7W
 BWyAz4vwExVcAQ0nPjLuYascgX2ym1qEbSfuEbHVZR/Bd89y8hpIOl72XaBJi+Y8wSuq
 +8h/+s8oihx6o2lQ/agricg023jkX+xkbpncEA9ZIBabOCSrIMUeW4aQJq/aqgBjPLW7
 ODYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cBSZecFHJJp/usGc+3/heP75DKhmYnZ0kaH0ekZQKBs=;
 b=UwRLnJPFEMziWnp7iqZrzpasIX9vufIk6XuBHXHKaA7yjxA0khLDP2FVD/S/NkZ10M
 AmtjXJ78NlKeMjs+SdYUiyZ3mNIv+AV0PMBqQbA10piUkq0CP/6rdIOkXpcpLCgVa8Bn
 aiSzf5CRBfJC9aDylio4oZnv2dMNmtPWLwGNNFQy53gGBA1Y2hoMsZ9UMsfbnvTgmIe/
 3rnAfEMH3OVhu9h+VilC2lW+nGm5ominyQ+GBvRvqoRNCoc5phnwm43HT7rD4uq4k209
 9ho6SLyAuzL7okqLZCln+sQtP6Z8RBTFTktp4HnnF/fZojZIgzGrB8i5M2nT9TcPSKDH
 QAOA==
X-Gm-Message-State: AOAM533ZECa0WrUY/phXKnyZlZYp/0h9w1me6YDsSCrQFNid7VtOmwVx
 7GN1agF2sq8W40ZEAHod5tm60WEiK/yCZZ3q
X-Google-Smtp-Source: ABdhPJy6SSGcqwiRwiH/abjyxH8d3FQRAT3+Cqv4ZICUl4RPyeQCW2t/Ij3kyxqZ8pTDUvot4O+wqA==
X-Received: by 2002:aa7:8bce:0:b029:1b8:f395:87a with SMTP id
 s14-20020aa78bce0000b02901b8f395087amr6500518pfd.36.1612565889820; 
 Fri, 05 Feb 2021 14:58:09 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id c23sm12155149pgc.72.2021.02.05.14.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:58:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 40/46] physmem: make watchpoint checking code TCG-only
Date: Fri,  5 Feb 2021 12:56:44 -1000
Message-Id: <20210205225650.1330794-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205225650.1330794-1-richard.henderson@linaro.org>
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

cpu_check_watchpoint, watchpoint_address_matches are TCG-only.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210204163931.7358-13-cfontana@suse.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 softmmu/physmem.c | 141 +++++++++++++++++++++++-----------------------
 1 file changed, 72 insertions(+), 69 deletions(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 60760a3bdc..51ed600bf9 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -840,6 +840,7 @@ void cpu_watchpoint_remove_all(CPUState *cpu, int mask)
     }
 }
 
+#ifdef CONFIG_TCG
 /* Return true if this watchpoint address matches the specified
  * access (ie the address range covered by the watchpoint overlaps
  * partially or completely with the address range covered by the
@@ -873,6 +874,77 @@ int cpu_watchpoint_address_matches(CPUState *cpu, vaddr addr, vaddr len)
     return ret;
 }
 
+/* Generate a debug exception if a watchpoint has been hit.  */
+void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
+                          MemTxAttrs attrs, int flags, uintptr_t ra)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+    CPUWatchpoint *wp;
+
+    assert(tcg_enabled());
+    if (cpu->watchpoint_hit) {
+        /*
+         * We re-entered the check after replacing the TB.
+         * Now raise the debug interrupt so that it will
+         * trigger after the current instruction.
+         */
+        qemu_mutex_lock_iothread();
+        cpu_interrupt(cpu, CPU_INTERRUPT_DEBUG);
+        qemu_mutex_unlock_iothread();
+        return;
+    }
+
+    addr = cc->adjust_watchpoint_address(cpu, addr, len);
+    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
+        if (watchpoint_address_matches(wp, addr, len)
+            && (wp->flags & flags)) {
+            if (replay_running_debug()) {
+                /*
+                 * Don't process the watchpoints when we are
+                 * in a reverse debugging operation.
+                 */
+                replay_breakpoint();
+                return;
+            }
+            if (flags == BP_MEM_READ) {
+                wp->flags |= BP_WATCHPOINT_HIT_READ;
+            } else {
+                wp->flags |= BP_WATCHPOINT_HIT_WRITE;
+            }
+            wp->hitaddr = MAX(addr, wp->vaddr);
+            wp->hitattrs = attrs;
+            if (!cpu->watchpoint_hit) {
+                if (wp->flags & BP_CPU &&
+                    !cc->debug_check_watchpoint(cpu, wp)) {
+                    wp->flags &= ~BP_WATCHPOINT_HIT;
+                    continue;
+                }
+                cpu->watchpoint_hit = wp;
+
+                mmap_lock();
+                tb_check_watchpoint(cpu, ra);
+                if (wp->flags & BP_STOP_BEFORE_ACCESS) {
+                    cpu->exception_index = EXCP_DEBUG;
+                    mmap_unlock();
+                    cpu_loop_exit_restore(cpu, ra);
+                } else {
+                    /* Force execution of one insn next time.  */
+                    cpu->cflags_next_tb = 1 | curr_cflags();
+                    mmap_unlock();
+                    if (ra) {
+                        cpu_restore_state(cpu, ra, true);
+                    }
+                    cpu_loop_exit_noexc(cpu);
+                }
+            }
+        } else {
+            wp->flags &= ~BP_WATCHPOINT_HIT;
+        }
+    }
+}
+
+#endif /* CONFIG_TCG */
+
 /* Called from RCU critical section */
 static RAMBlock *qemu_get_ram_block(ram_addr_t addr)
 {
@@ -2359,75 +2431,6 @@ ram_addr_t qemu_ram_addr_from_host(void *ptr)
     return block->offset + offset;
 }
 
-/* Generate a debug exception if a watchpoint has been hit.  */
-void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
-                          MemTxAttrs attrs, int flags, uintptr_t ra)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-    CPUWatchpoint *wp;
-
-    assert(tcg_enabled());
-    if (cpu->watchpoint_hit) {
-        /*
-         * We re-entered the check after replacing the TB.
-         * Now raise the debug interrupt so that it will
-         * trigger after the current instruction.
-         */
-        qemu_mutex_lock_iothread();
-        cpu_interrupt(cpu, CPU_INTERRUPT_DEBUG);
-        qemu_mutex_unlock_iothread();
-        return;
-    }
-
-    addr = cc->adjust_watchpoint_address(cpu, addr, len);
-    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
-        if (watchpoint_address_matches(wp, addr, len)
-            && (wp->flags & flags)) {
-            if (replay_running_debug()) {
-                /*
-                 * Don't process the watchpoints when we are
-                 * in a reverse debugging operation.
-                 */
-                replay_breakpoint();
-                return;
-            }
-            if (flags == BP_MEM_READ) {
-                wp->flags |= BP_WATCHPOINT_HIT_READ;
-            } else {
-                wp->flags |= BP_WATCHPOINT_HIT_WRITE;
-            }
-            wp->hitaddr = MAX(addr, wp->vaddr);
-            wp->hitattrs = attrs;
-            if (!cpu->watchpoint_hit) {
-                if (wp->flags & BP_CPU &&
-                    !cc->debug_check_watchpoint(cpu, wp)) {
-                    wp->flags &= ~BP_WATCHPOINT_HIT;
-                    continue;
-                }
-                cpu->watchpoint_hit = wp;
-
-                mmap_lock();
-                tb_check_watchpoint(cpu, ra);
-                if (wp->flags & BP_STOP_BEFORE_ACCESS) {
-                    cpu->exception_index = EXCP_DEBUG;
-                    mmap_unlock();
-                    cpu_loop_exit_restore(cpu, ra);
-                } else {
-                    /* Force execution of one insn next time.  */
-                    cpu->cflags_next_tb = 1 | curr_cflags();
-                    mmap_unlock();
-                    if (ra) {
-                        cpu_restore_state(cpu, ra, true);
-                    }
-                    cpu_loop_exit_noexc(cpu);
-                }
-            }
-        } else {
-            wp->flags &= ~BP_WATCHPOINT_HIT;
-        }
-    }
-}
-
 static MemTxResult flatview_read(FlatView *fv, hwaddr addr,
                                  MemTxAttrs attrs, void *buf, hwaddr len);
 static MemTxResult flatview_write(FlatView *fv, hwaddr addr, MemTxAttrs attrs,
-- 
2.25.1


