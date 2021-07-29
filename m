Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 190AC3D9AD0
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 03:09:18 +0200 (CEST)
Received: from localhost ([::1]:59102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8uY1-00008u-4Y
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 21:09:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCg-0004Mx-O3
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:14 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:45671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCe-0002ay-Pw
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:14 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 m10-20020a17090a34cab0290176b52c60ddso6639380pjf.4
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 17:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=69IismDG8mKiGlccU40BbniZyUFG7yiBSbUwVB87kXw=;
 b=VdExl0wPGYC2Mj+R6XoZ30J7g7RGsT77NkfNEH3tG1YvlRcnNbWpp5FqnDjoTPG0Cu
 wCTLRNk9ZrRMVEeBQXz1vYBBCg0C2iQa+jhcy87reac8249MhdcVry4wBf9AbxhjL267
 Xw0jBp1G8LecOk8mGvHFfJAtsdF/QyQr3XEThMcw4XRMkZxQjaoKMbmpQNOt286GTeWS
 Nunxge2w1/Twz58k66WGQxSQwYGHyfVhKumhOdcBDl5M7rV3M54wMYFGVSY4nr6VJr3t
 HhUowZlD5hCoA0DwpWnDNTenpAyK33zitOKq6X7ZUleJpLJMyLmJlF4Z/BbI+VNJCK69
 pljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=69IismDG8mKiGlccU40BbniZyUFG7yiBSbUwVB87kXw=;
 b=NGz8R/mt+bL/8bCNiSE5XSymeVddJPr/nK4ll+nS/R++bl8xXA65B2oRnO675h4FBu
 z9dyvZh7HXOP5NNhpIW2LTic2kRiYktfVcQYbyQ8cl5PwaqUQq6yS1WSjOPFpDTo5F+Y
 SEHJIArb6nubaDjrLa1bNU0JkpBSlB9vSKEfbFVhxnJYxFcSOZUIhqr7UoyGi8j3vFUw
 PRO8rpsAgZ08oT40u+ftWxg6FwK6CINJ2sfJfK6axVzXG606SEGWyIF9bLyFarKbi9RR
 Fqs2WfZVvfU2mINVDXiFAOXlVXqRcl9tzsNmf7Wh7bxRSkYhiQ08xsv2/OSYTkbZimPc
 Zzpg==
X-Gm-Message-State: AOAM5326/TXNUoMcir9Bo2GUkcpuAbv/ZrIGfn5+YSQVKQFbqJRs7fOr
 r10/Seuh/C/Jcnz7xMLk5BWPVO57Igs3Ag==
X-Google-Smtp-Source: ABdhPJxOm2yYQbaMbVpU3ANf72GW1hZucgJrkGWKh14icuR5Joul89asEScURsdgyLGHREWn18GF5A==
X-Received: by 2002:aa7:8e51:0:b029:332:920f:1430 with SMTP id
 d17-20020aa78e510000b0290332920f1430mr2483527pfr.1.1627519630677; 
 Wed, 28 Jul 2021 17:47:10 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id t205sm1305005pfc.32.2021.07.28.17.47.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 17:47:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 17/43] accel/tcg: Report unaligned atomics for
 user-only
Date: Wed, 28 Jul 2021 14:46:21 -1000
Message-Id: <20210729004647.282017-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the newly exposed do_unaligned_access hook from atomic_mmu_lookup,
which has access to complete alignment info from the TCGMemOpIdx arg.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/user-exec.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 90d1a2d327..dd77e90789 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -852,6 +852,16 @@ int cpu_signal_handler(int host_signum, void *pinfo,
 
 /* The softmmu versions of these helpers are in cputlb.c.  */
 
+static void cpu_unaligned_access(CPUState *cpu, vaddr addr,
+                                 MMUAccessType access_type,
+                                 int mmu_idx, uintptr_t ra)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    cc->tcg_ops->do_unaligned_access(cpu, addr, access_type, mmu_idx, ra);
+    g_assert_not_reached();
+}
+
 uint32_t cpu_ldub_data(CPUArchState *env, abi_ptr ptr)
 {
     uint32_t ret;
@@ -1230,11 +1240,22 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
                                TCGMemOpIdx oi, int size, int prot,
                                uintptr_t retaddr)
 {
+    MemOp mop = get_memop(oi);
+    int a_bits = get_alignment_bits(mop);
+    void *ret;
+
+    /* Enforce guest required alignment.  */
+    if (unlikely(addr & ((1 << a_bits) - 1))) {
+        MMUAccessType t = prot == PAGE_READ ? MMU_DATA_LOAD : MMU_DATA_STORE;
+        cpu_unaligned_access(env_cpu(env), addr, t, get_mmuidx(oi), retaddr);
+    }
+
     /* Enforce qemu required alignment.  */
     if (unlikely(addr & (size - 1))) {
         cpu_loop_exit_atomic(env_cpu(env), retaddr);
     }
-    void *ret = g2h(env_cpu(env), addr);
+
+    ret = g2h(env_cpu(env), addr);
     set_helper_retaddr(retaddr);
     return ret;
 }
-- 
2.25.1


