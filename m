Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CC43F0BBA
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:26:33 +0200 (CEST)
Received: from localhost ([::1]:56008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRCq-0005xs-Cm
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR63-0008WP-AQ
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:31 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:36368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR61-0008KG-UT
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:31 -0400
Received: by mail-pg1-x529.google.com with SMTP id t1so3313305pgv.3
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=71tdkhl+EKYly8UOFWcHm8vi/Vwmi4Z6T/GrGz60k9I=;
 b=aBE6T/2/bUl9cckmWkhVa4PwFJw2WIP20et++gbToNUXQ+mm3fDrN496QBRGOLPEtC
 xHIFGYIieDQhN7wG14fwq+x+xgdd5UQrAOHJcw+8vonP590niGCqsi7myOke1IzbnWXm
 fHsnM/COncoJ1cDglGK7F3E4jyvyaoIXcX3vmFepZAc9AjzgUpdKED4Y0nTvYtqb7Wz/
 y+UjETJ6DVvR2O7IVDjezOZgJPhvlBg8bVlqDPv5ZGl1Ng1GZ9aiZFdGbt118vUBJSs/
 QKeFWvb4lQSwjiiVWSEceaUIwZStZcbofwB9lGJ7azonH21nVEvjNnb0ZC0OkHhRmY6Q
 n0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=71tdkhl+EKYly8UOFWcHm8vi/Vwmi4Z6T/GrGz60k9I=;
 b=lpkjocGSwoQW3+e1DUgAogl8paE4Inp7tpHuPjM1euTDF3SOGpo0BT/iQaA5p2phjw
 o4+Atsnkmwfq+/ju7NqUZAo4VZpLDv9aNlhg+RbaTcBKqKE/d9HpIsVbUInp0smt7o7V
 uTQDtyqJafzUO3TZ5Gm+09WRcuqS3yTXMDC2ld9TStGmhXjCSCWT7H8HlI19v5qqXXcu
 1sLvgtsk8gd9MgNkSo55Z9HPUZFts8PnzsQPUPefrI1698piSDJooggedDoGgKT0wDU+
 VnuvbfvFL8S9GSeH7bGICdyt3cUI08usWFnyUuBzma+qYFWbLysuV0UJoErLu5rHmOem
 sRPw==
X-Gm-Message-State: AOAM531TfdZQKYJAETYhxElsVDFDVtDm7oxv6NWd2xOOJ3E90mO8VL3Q
 npnRSdITi8uDXalMhNaGMJum5PatJBgNhQ==
X-Google-Smtp-Source: ABdhPJzJELi2m9vB808KEFJ5MTWFcRa5qGThgoArgG19Lz/Jjp29guDfekYo48FiD+3GtPSNbhKimw==
X-Received: by 2002:a63:83c7:: with SMTP id h190mr10403670pge.51.1629314368689; 
 Wed, 18 Aug 2021 12:19:28 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id a6sm524108pjs.40.2021.08.18.12.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:19:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/66] target/alpha: Implement do_unaligned_access for
 user-only
Date: Wed, 18 Aug 2021 09:18:18 -1000
Message-Id: <20210818191920.390759-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


