Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C913F3C64
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 22:08:49 +0200 (CEST)
Received: from localhost ([::1]:60900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHXIO-0007DZ-Ej
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 16:08:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHXA0-0002En-V3
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 16:00:09 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:54208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHX9x-0004WM-CJ
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 16:00:08 -0400
Received: by mail-pj1-x1035.google.com with SMTP id j1so9427836pjv.3
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 13:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+ZAhinf24CQJmFBs0vLR+aQqqKuFbYYjrTVj6/rZMr0=;
 b=x8XzlXMqmNwEWr+RvHQwja3b0lcaWPiL2/HWJRE+q+Mv02ofI9U+RD1kU0CRrE/g2n
 YlZNlvt5UfgZDDTEo2O9eVIX7CwOTUr6qQjSLT+lxpPbrEEcT2CTgwbXR7jWcF0VJdmg
 FkeWjLd3niDydLoNQ+8ksEmI1XlO+cieLMJMs1WVdgvwXLi7ZpudUWYMUFfQNgnBxw/G
 moGbzvBV1PTBxHkkY7i6yya4TqoUcSh/roxkGARu9yjXV5MtHRlifMl6cEG5Aq7Qe7yD
 ZuoZj4GKHQh/PzlmD2qX7w7jtMiIQNS7V/pPt68RmzKMioRSc3X1Caa6z77MwM/0/ChN
 ipRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+ZAhinf24CQJmFBs0vLR+aQqqKuFbYYjrTVj6/rZMr0=;
 b=FqRyUVzaoGAOYCqxPNKZ2w9XXcxSU7oP95W4XocFKrWDQgB/2nnsnN989cOWOmcJwP
 x5ThNVuruTg3z/kBpqeUzMbqx378GkFPh49RkS+twT4Q+ZpfCzg86xjuKBRy5a+xUnKi
 +h0Fo7F0o8SBwBA10oVk68/8+1DagJ3xsW6m47e2zpgvWgI74okfOh5IIXOj5ij9EJmM
 LVv8TFNpp7ecJ7azgsOpgp7AnXhXT0rTTOuNU5rmwzihzljS2V096hDsdriUSBw08h4t
 VHTgfcz7d4xvmz2yeaxSSARZJSEcZmdnV7rh6qxDk86bQpekFy8J4u7MZmRkLKWvlDRj
 xODg==
X-Gm-Message-State: AOAM530kssCnuz0TCckLmsW93tUp0zUnM4qsrrwQz17lIZvGQCplXkif
 zuxlSWVsvHTt0h46MFKYNE5QY85i8HitCg==
X-Google-Smtp-Source: ABdhPJxcnYyHszeuBgUdyGf8JMJBt9iR4cVmYe5f3BVVElli4bTyXOnsrvtneCwVgVSMXTrhu2Rs4Q==
X-Received: by 2002:a17:902:8c90:b0:12f:699b:27 with SMTP id
 t16-20020a1709028c9000b0012f699b0027mr15372004plo.28.1629576003929; 
 Sat, 21 Aug 2021 13:00:03 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id h13sm12562257pgh.93.2021.08.21.13.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 13:00:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/8] target/arm: Assert thumb pc is aligned
Date: Sat, 21 Aug 2021 12:59:56 -0700
Message-Id: <20210821195958.41312-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210821195958.41312-1-richard.henderson@linaro.org>
References: <20210821195958.41312-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Misaligned thumb PC is architecturally impossible.
Assert is better than proceeding, in case we've missed
something somewhere.

Expand a comment about aligning the pc in gdbstub.
Fail an incoming migrate if a thumb pc is misaligned.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/gdbstub.c   | 9 +++++++--
 target/arm/machine.c   | 9 +++++++++
 target/arm/translate.c | 3 +++
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 826601b341..a54b42418b 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -76,8 +76,13 @@ int arm_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 
     tmp = ldl_p(mem_buf);
 
-    /* Mask out low bit of PC to workaround gdb bugs.  This will probably
-       cause problems if we ever implement the Jazelle DBX extensions.  */
+    /*
+     * Mask out low bits of PC to workaround gdb bugs.
+     * This avoids an assert in thumb_tr_translate_insn, because it is
+     * architecturally impossible to misalign the pc.
+     * This will probably cause problems if we ever implement the
+     * Jazelle DBX extensions.
+     */
     if (n == 15) {
         tmp &= ~1;
     }
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 81e30de824..b5004a67e9 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -781,6 +781,15 @@ static int cpu_post_load(void *opaque, int version_id)
     hw_breakpoint_update_all(cpu);
     hw_watchpoint_update_all(cpu);
 
+    /*
+     * Misaligned thumb pc is architecturally impossible.
+     * We have an assert in thumb_tr_translate_insn to verify this.
+     * Fail an incoming migrate to avoid this assert.
+     */
+    if (!is_a64(env) && env->thumb && (env->regs[15] & 1)) {
+        return -1;
+    }
+
     if (!kvm_enabled()) {
         pmu_op_finish(&cpu->env);
     }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index dfeaa2321d..a93ea3c47c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9595,6 +9595,9 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     uint32_t insn;
     bool is_16bit;
 
+    /* Misaligned thumb PC is architecturally impossible. */
+    assert((dc->base.pc_next & 1) == 0);
+
     if (arm_check_ss_active(dc) || arm_check_kernelpage(dc)) {
         dc->base.pc_next += 2;
         return;
-- 
2.25.1


