Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CDC659394
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 01:08:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB2uh-0006ce-I9; Thu, 29 Dec 2022 19:06:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2uX-0006TN-Fi
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:06:12 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2uU-0004FG-5t
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:06:08 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 h7-20020a17090aa88700b00225f3e4c992so11739310pjq.1
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 16:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+wd2mrgCejqfl59r8NBlXKIcEt28IplSSnv1nGG8U1o=;
 b=gDpDdU/StNlTRo49c7YcJ9Y8tMPsfTtMGiYpQmoJTSS2xNY7/gJ+ulDCeFTptBHGNe
 VSk7v3HEpGcOiHWqsjhGyVmTGddXr0oiZ+5IwenSxhDRTjcULFkPS1xulQ9S+j0lrRVL
 VxHbnCOt4h5wu9/dBgr7X5ld6jHrr43EviHF17BQGvfoDKgXESsOqXeyk3v7TqATKmXJ
 q+Yi3oLuemxJW5oayDBrHf4l1ztC0uLz4pmNtjbesYzwq1NMgwiUSX4gZNACiC77Mmhc
 moMAATpHCTUuWN/wJaQu8OW0ls2qhDByoZF0OqMmo7LaK79VqaX7ts/1M/IWn66dYm0I
 v49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+wd2mrgCejqfl59r8NBlXKIcEt28IplSSnv1nGG8U1o=;
 b=bRPmuNI/2pyoCZAWVgbfAusit3P2PXK8py1B32CuRonBKqOaYcSvFAvfvIzkFFjSEL
 DFvylDrNaNQUMc3uj6J8UxMLALGt2G9CpL5HZVq6uNobIrpSeHB2MLVHTLWi9gHvOkPs
 bb4Gp2pXrH+r7Ks6WMZRLM0Vai5l3CFQrI28Z6ar8nW/OTpb4dNjgFRYexWcFDWcvN+q
 6FyNUDPqw+Mnc0vgw4vq4DAXGKuEVFoseiQTrEH2+cJPtxoZupml/ubFkdzGe+3asZWr
 0q/j4DOKJqcBEGwShe6IdtZzpPf/79Mx8/AZQYiJXk/RWJSkUL78geAELPqbVNYkzaoE
 utjA==
X-Gm-Message-State: AFqh2koLa5B2NwJ9P85T627SbYOwan2TmtaZC12dyO9VEnQPkB6wQ3tA
 O7psTLYAzloeMhTNJncav2A9hkVz9emVIjcg
X-Google-Smtp-Source: AMrXdXsUJ745PzijVARq982P9bB+o/pzKW7DcgA2jq0qqlQu7+hGiAop2LfwoUH9jT2+VWg/S6kVpw==
X-Received: by 2002:a05:6a20:a6a7:b0:a7:8e19:e59d with SMTP id
 ba39-20020a056a20a6a700b000a78e19e59dmr42161066pzb.24.1672358763838; 
 Thu, 29 Dec 2022 16:06:03 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 x185-20020a6286c2000000b0056bfebfa6e4sm12586151pfd.190.2022.12.29.16.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 16:06:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 44/47] accel/tcg: Fix tb_invalidate_phys_page_unwind
Date: Thu, 29 Dec 2022 16:02:18 -0800
Message-Id: <20221230000221.2764875-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230000221.2764875-1-richard.henderson@linaro.org>
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


