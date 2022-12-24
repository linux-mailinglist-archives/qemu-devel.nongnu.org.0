Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B166655A73
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 16:19:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p96I8-00056Y-TY; Sat, 24 Dec 2022 10:18:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p96I7-00055t-1i
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 10:18:27 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p96I5-00016Z-Cp
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 10:18:26 -0500
Received: by mail-pg1-x532.google.com with SMTP id 79so4929729pgf.11
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 07:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EogRULrLfJQmVZpCaE9KC8IG8I8XrMvRS8yWEac0lHY=;
 b=QefQAZ0Vlf6OZqv485bBrR4VBI563u/QNy3e9dlRZ7Rhl/ADexBgZX0evJ9/J+r6o+
 /kX1rwdbpU/D7zroy9uZP3WhBJWXJ6X/pQ3vDOGl3dDFXNZMD1h5ERLcAc2TDyh1czuv
 Wq2x2kHo+d7z8Moe6r0bxEdEVRqFlZlmvit7a4575P4+23+TbTvzvEEXIvxKWWF1mUzr
 0pL0F6sXDze85/LrTKCUYnZJu4GEpj1GeYEQ0OCQti6qUannTK7mpF8AqY7Gc3IYjpVn
 QMFWvWqYhRatQR6klfKWzMl/GSyJ0HW8xLGCPojNlLT8uougL9RjB2xjOGGNNVIuygut
 TWEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EogRULrLfJQmVZpCaE9KC8IG8I8XrMvRS8yWEac0lHY=;
 b=i/ROv1UYDHHvpcGAX4IjV92W0C73hrjevWvTl15NVjQqsFxG3qro+IlldWfopvNtBS
 Ng8VgXVaD641AfuwQZIDVL3iHOCJl8j0R/rHkqCwKc2g+su26fOavysDvRdd/RoB2tLW
 FBjYYGqbrdRNCCjyOmJU9suYxm01R8q/ErYdZU9rcue7qEHvr6gd9XEtV72ccXntqVBV
 rADTQvx/0Cjtv6wCBTGHqjQ96wlYwm4SVDv06cxeIsH7RoGUBlKXLlJaKE06R6WlabE7
 pNv/D0e2+ggs+UkRj7mY6m8HTwPJsZZzorJ4R7MdhjEUJvZCax/ptYvbL6jdKh3bQk4l
 juvw==
X-Gm-Message-State: AFqh2krSnuSFJWvhTdq4ZEUkmPrPICki8gQp1AKeur+a7qXGksMvNVuw
 a5Y3ZzLnsiGMeNnd/flrseaD2EzfKUcA38E+
X-Google-Smtp-Source: AMrXdXt5RR8raH2ywViZvh0n8ZT1NZikGTbPxB0hkLxJW8oEIGsuVum3JIIO0ELf91ctTxLNK8p8kg==
X-Received: by 2002:aa7:9154:0:b0:57b:30b6:9e85 with SMTP id
 20-20020aa79154000000b0057b30b69e85mr14201906pfi.22.1671895103731; 
 Sat, 24 Dec 2022 07:18:23 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 t64-20020a625f43000000b005774f19b41csm4231124pfb.88.2022.12.24.07.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 07:18:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: iii@linux.ibm.com
Subject: [PATCH 1/4] accel/tcg: Fix tb_invalidate_phys_page_unwind
Date: Sat, 24 Dec 2022 07:18:18 -0800
Message-Id: <20221224151821.464455-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224151821.464455-1-richard.henderson@linaro.org>
References: <20221224151821.464455-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When called from syscall(), we are not within a TB and pc == 0.
We can skip the check for invalidating the current TB.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tb-maint.c | 78 ++++++++++++++++++++++++--------------------
 1 file changed, 43 insertions(+), 35 deletions(-)

diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index 1b8e860647..b3d6529ae2 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -1024,43 +1024,51 @@ void tb_invalidate_phys_page(tb_page_addr_t addr)
  */
 bool tb_invalidate_phys_page_unwind(tb_page_addr_t addr, uintptr_t pc)
 {
-    assert(pc != 0);
-#ifdef TARGET_HAS_PRECISE_SMC
-    assert_memory_lock();
-    {
-        TranslationBlock *current_tb = tcg_tb_lookup(pc);
-        bool current_tb_modified = false;
-        TranslationBlock *tb;
-        PageForEachNext n;
+    TranslationBlock *current_tb;
+    bool current_tb_modified;
+    TranslationBlock *tb;
+    PageForEachNext n;
 
-        addr &= TARGET_PAGE_MASK;
-
-        PAGE_FOR_EACH_TB(addr, addr + TARGET_PAGE_SIZE, unused, tb, n) {
-            if (current_tb == tb &&
-                (tb_cflags(current_tb) & CF_COUNT_MASK) != 1) {
-                /*
-                 * If we are modifying the current TB, we must stop its
-                 * execution. We could be more precise by checking that
-                 * the modification is after the current PC, but it would
-                 * require a specialized function to partially restore
-                 * the CPU state.
-                 */
-                current_tb_modified = true;
-                cpu_restore_state_from_tb(current_cpu, current_tb, pc);
-            }
-            tb_phys_invalidate__locked(tb);
-        }
-
-        if (current_tb_modified) {
-            /* Force execution of one insn next time.  */
-            CPUState *cpu = current_cpu;
-            cpu->cflags_next_tb = 1 | CF_NOIRQ | curr_cflags(current_cpu);
-            return true;
-        }
+    /*
+     * Without precise smc semantics, or when outside of a TB,
+     * we can skip to invalidate.
+     */
+#ifndef TARGET_HAS_PRECISE_SMC
+    pc = 0;
+#endif
+    if (!pc) {
+        tb_invalidate_phys_page(addr);
+        return false;
+    }
+
+    assert_memory_lock();
+    current_tb = tcg_tb_lookup(pc);
+
+    addr &= TARGET_PAGE_MASK;
+    current_tb_modified = false;
+
+    PAGE_FOR_EACH_TB(addr, addr + TARGET_PAGE_SIZE, unused, tb, n) {
+        if (current_tb == tb &&
+            (tb_cflags(current_tb) & CF_COUNT_MASK) != 1) {
+            /*
+             * If we are modifying the current TB, we must stop its
+             * execution. We could be more precise by checking that
+             * the modification is after the current PC, but it would
+             * require a specialized function to partially restore
+             * the CPU state.
+             */
+            current_tb_modified = true;
+            cpu_restore_state_from_tb(current_cpu, current_tb, pc);
+        }
+        tb_phys_invalidate__locked(tb);
+    }
+
+    if (current_tb_modified) {
+        /* Force execution of one insn next time.  */
+        CPUState *cpu = current_cpu;
+        cpu->cflags_next_tb = 1 | CF_NOIRQ | curr_cflags(current_cpu);
+        return true;
     }
-#else
-    tb_invalidate_phys_page(addr);
-#endif /* TARGET_HAS_PRECISE_SMC */
     return false;
 }
 #else
-- 
2.34.1


