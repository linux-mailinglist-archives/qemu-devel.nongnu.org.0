Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3F760D94C
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:30:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVuI-0005H5-5j; Tue, 25 Oct 2022 22:12:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVuG-0005Bp-1T
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:36 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVuE-00019J-8i
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:35 -0400
Received: by mail-pg1-x531.google.com with SMTP id 20so13457922pgc.5
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ov3aeYf9Oo0htgsB4UrYWgNfrt2xvA4eqzI8BqeKPbs=;
 b=pLnUxxiO+GAbNyYkn/vCTvFwd3giqz1rQ1ZKx0C9rb0hZE/pWu3cIgUSoSMFrTMyyj
 velu/smSxVo6Pb8P08nF1pJkRVk/Rmo7ArBweIJ732N0z4uL3frypgi9XE+jpWH9l6Rx
 GpaFOHn2ct3TediaFUb/iGtePhcaLwUHwoY919VUTfvXefpd1tYg7b3cT4j3Wq5yxEzH
 Od6w5AWkoArJwJwoKsjzE8rGdnSmP6Fke/j2jwlMt14duAJlyjRyFx5qOrlX0fjbwnXp
 BpZVzE/HoybdOxKABjAJlS3KDldWUAqyYhGzstMf9E8MsO6IKAaSoqA/5zjFS5n9nLOf
 V8Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ov3aeYf9Oo0htgsB4UrYWgNfrt2xvA4eqzI8BqeKPbs=;
 b=b6stdoiVFBLa6jNgNfiNyS4mp1ttfrKWk082S8IJGlzfezyNmWVslzM0LXs86aS/d/
 44M71Cm46x/MapyjC2Ce03Sl6Yiv5uBNlF7BGBFakbQQldMBFLJk9Hn0Zg6uQAILBtJ1
 eNdRYbmzzC7ploenMJ4N0YSJQICGyaeAI3QhZb08k2IjqrCIV1YQrV1QZE3duNoSsrZ+
 QhtBWAOWTqwx0SwlsZfZHAY6YrlMinpTD+xD2uajrX0ZVNMBEeGuZNO0TRpjrXlL93MR
 8hq0jg4au5meOMh0qsoz386BauVfWTtsfHAjrTXax8gcjWVb2bdwcYWUJafV/9OU9yhX
 s46w==
X-Gm-Message-State: ACrzQf2ZqilUb9ZIfmHl64D8XJOFax/I3mHmkpm4vvepaP+ZoC76e1wG
 LDyyq4VLraCcN44wXi3B37ncSaBF+JQfud/j
X-Google-Smtp-Source: AMsMyM6Tp1n/MD9nWtMUIrFxb0dCCjYE3pXn3O4dKzfpr8xZrfl1Endy6SUSFpZ1qEE75XRBYURBvg==
X-Received: by 2002:a05:6a00:27a1:b0:566:8937:27c2 with SMTP id
 bd33-20020a056a0027a100b00566893727c2mr40959692pfb.24.1666750353465; 
 Tue, 25 Oct 2022 19:12:33 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a635d5d000000b0043c9da02729sm1897833pgm.6.2022.10.25.19.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:12:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
	Claudio Fontana <cfontana@suse.de>
Subject: [PULL 25/47] accel/tcg: Add restore_state_to_opc to TCGCPUOps
Date: Wed, 26 Oct 2022 12:10:54 +1000
Message-Id: <20221026021116.1988449-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
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

Add a tcg_ops hook to replace the restore_state_to_opc
function call.  Because these generic hooks cannot depend
on target-specific types, temporarily, copy the current
target_ulong data[] into uint64_t d64[].

Reviewed-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h       |  2 +-
 include/hw/core/tcg-cpu-ops.h | 11 +++++++++++
 accel/tcg/translate-all.c     | 24 ++++++++++++++++++++++--
 3 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 5ae484e34d..3b5e84240b 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -40,7 +40,7 @@ typedef ram_addr_t tb_page_addr_t;
 #endif
 
 void restore_state_to_opc(CPUArchState *env, TranslationBlock *tb,
-                          target_ulong *data);
+                          target_ulong *data) __attribute__((weak));
 
 /**
  * cpu_restore_state:
diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index 78c6c6635d..20e3c0ffbb 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -31,6 +31,17 @@ struct TCGCPUOps {
      * function to restore all the state, and register it here.
      */
     void (*synchronize_from_tb)(CPUState *cpu, const TranslationBlock *tb);
+    /**
+     * @restore_state_to_opc: Synchronize state from INDEX_op_start_insn
+     *
+     * This is called when we unwind state in the middle of a TB,
+     * usually before raising an exception.  Set all part of the CPU
+     * state which are tracked insn-by-insn in the target-specific
+     * arguments to start_insn, passed as @data.
+     */
+    void (*restore_state_to_opc)(CPUState *cpu, const TranslationBlock *tb,
+                                 const uint64_t *data);
+
     /** @cpu_exec_enter: Callback for cpu_exec preparation */
     void (*cpu_exec_enter)(CPUState *cpu);
     /** @cpu_exec_exit: Callback for cpu_exec cleanup */
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 433fa247f4..4d8783efc7 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -256,7 +256,6 @@ int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
 {
     target_ulong data[TARGET_INSN_START_WORDS];
     uintptr_t host_pc = (uintptr_t)tb->tc.ptr;
-    CPUArchState *env = cpu->env_ptr;
     const uint8_t *p = tb->tc.ptr + tb->tc.size;
     int i, j, num_insns = tb->icount;
 #ifdef CONFIG_PROFILER
@@ -295,7 +294,20 @@ int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
            and shift if to the number of actually executed instructions */
         cpu_neg(cpu)->icount_decr.u16.low += num_insns - i;
     }
-    restore_state_to_opc(env, tb, data);
+
+    {
+        const struct TCGCPUOps *ops = cpu->cc->tcg_ops;
+        __typeof(ops->restore_state_to_opc) restore = ops->restore_state_to_opc;
+        if (restore) {
+            uint64_t d64[TARGET_INSN_START_WORDS];
+            for (i = 0; i < TARGET_INSN_START_WORDS; ++i) {
+                d64[i] = data[i];
+            }
+            restore(cpu, tb, d64);
+        } else {
+            restore_state_to_opc(cpu->env_ptr, tb, data);
+        }
+    }
 
 #ifdef CONFIG_PROFILER
     qatomic_set(&prof->restore_time,
@@ -307,6 +319,14 @@ int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
 
 bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc, bool will_exit)
 {
+    /*
+     * The pc update associated with restore without exit will
+     * break the relative pc adjustments performed by TARGET_TB_PCREL.
+     */
+    if (TARGET_TB_PCREL) {
+        assert(will_exit);
+    }
+
     /*
      * The host_pc has to be in the rx region of the code buffer.
      * If it is not we will not be able to resolve it here.
-- 
2.34.1


