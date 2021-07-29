Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 687AE3D9A92
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 02:50:38 +0200 (CEST)
Received: from localhost ([::1]:35414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8uFx-0006zE-D4
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 20:50:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCO-0003sN-0n
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:46:56 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:44986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCL-0002MU-Ve
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:46:55 -0400
Received: by mail-pl1-x629.google.com with SMTP id q2so4834199plr.11
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 17:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0AkpqeTt4XZrVCGSl1psMF5yX6hJb+/zHSmbVTbcVTo=;
 b=K4CSMo21OWtfWqHpL99O3Es/n/UzyLTv3Jv+iYUohhRQNu+ctZhCA/sLlCxs+azzT1
 dHExeCPQEHqY1/BHvxVXB0SvNezbUrhWfeYjAv37plhjl8wFkRHpeA++ygSZuMVDRE3m
 Ri8te0/ke8g+Hgs2caR1KKsKQ4qOHU3viTnr72f4cH7AJ2/CbegyItndSB/qnTYXyEfW
 yaBNVyiaqw5QJtK6Gdfwn3IGOCgQNOa1qOqrYqjX0TDFlT/gThEpkoyREe6VqP2FcVeU
 TFWuzuEQt/nmRfin3QB4Ouu7Z78/cIe37KuBWemfd9SlJEQLPHdKHkw4X0QgePv8GYsN
 7Rcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0AkpqeTt4XZrVCGSl1psMF5yX6hJb+/zHSmbVTbcVTo=;
 b=ivQgofYvoMZE8rfL6189Zo9TK0tnzdJDQTob+p2sMxZV369uXvtoL/g3kRLfWCjxa4
 rhYvK/wKmXwxcG/fj3WxiOLCcZp3ab8+yaYjT8NKLyInt71bsmZm2CKgZHG7d/LUw0iC
 Nhx+OVrfFagtFE7kyW75IzuYcsd32U0myxoIypuOUBEctifqBuTYv88FzWf5eTfaWcfg
 kUYLkRmVnmKmZWXMHfPxdL7CM5bOPDF+JzrUM4xbHf/M2mfOBGTadbyHBAvY2IcGIyJ5
 wB8fZRhgT285bPYPTcMksWg6r2ZPGRprUFbndugVuEOABv9RJq7BkSLLHGHd0Gw4ZYw0
 g6FQ==
X-Gm-Message-State: AOAM531Rn7cnZW2rr0pePYHf25AC4KUhCxSUQ84HkiFDULbWHQ67UDIP
 OfcrWB5a8f7Hzcblw1NssrTGzeqM0mXUbw==
X-Google-Smtp-Source: ABdhPJwcKzWYYCngrgV5NDFIeInbtL7XNnusNvamDQ5YwNFmhtVtP+m3tC5sALT8xDxkexmZRh+uSQ==
X-Received: by 2002:a17:90a:404a:: with SMTP id
 k10mr2462710pjg.145.1627519612734; 
 Wed, 28 Jul 2021 17:46:52 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id t205sm1305005pfc.32.2021.07.28.17.46.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 17:46:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 02/43] target/alpha: Implement do_unaligned_access for
 user-only
Date: Wed, 28 Jul 2021 14:46:06 -1000
Message-Id: <20210729004647.282017-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/cpu.c        | 2 +-
 target/alpha/mem_helper.c | 8 +++-----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 4871ad0c0a..cb7e5261bd 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -220,11 +220,11 @@ static const struct TCGCPUOps alpha_tcg_ops = {
     .initialize = alpha_translate_init,
     .cpu_exec_interrupt = alpha_cpu_exec_interrupt,
     .tlb_fill = alpha_cpu_tlb_fill,
+    .do_unaligned_access = alpha_cpu_do_unaligned_access,
 
 #ifndef CONFIG_USER_ONLY
     .do_interrupt = alpha_cpu_do_interrupt,
     .do_transaction_failed = alpha_cpu_do_transaction_failed,
-    .do_unaligned_access = alpha_cpu_do_unaligned_access,
 #endif /* !CONFIG_USER_ONLY */
 };
 
diff --git a/target/alpha/mem_helper.c b/target/alpha/mem_helper.c
index 75e72bc337..e3cf98b270 100644
--- a/target/alpha/mem_helper.c
+++ b/target/alpha/mem_helper.c
@@ -23,30 +23,28 @@
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
 
-/* Softmmu support */
-#ifndef CONFIG_USER_ONLY
 void alpha_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                    MMUAccessType access_type,
                                    int mmu_idx, uintptr_t retaddr)
 {
     AlphaCPU *cpu = ALPHA_CPU(cs);
     CPUAlphaState *env = &cpu->env;
-    uint64_t pc;
     uint32_t insn;
 
     cpu_restore_state(cs, retaddr, true);
 
-    pc = env->pc;
-    insn = cpu_ldl_code(env, pc);
+    insn = cpu_ldl_code(env, env->pc);
 
     env->trap_arg0 = addr;
     env->trap_arg1 = insn >> 26;                /* opcode */
     env->trap_arg2 = (insn >> 21) & 31;         /* dest regno */
+
     cs->exception_index = EXCP_UNALIGN;
     env->error_code = 0;
     cpu_loop_exit(cs);
 }
 
+#ifndef CONFIG_USER_ONLY
 void alpha_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                      vaddr addr, unsigned size,
                                      MMUAccessType access_type,
-- 
2.25.1


