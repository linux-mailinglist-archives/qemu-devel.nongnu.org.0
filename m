Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 301863DE4FA
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:18:24 +0200 (CEST)
Received: from localhost ([::1]:56562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAlsl-0002eA-4Q
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:18:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpM-0002PB-7r
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:14:52 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:36584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpK-0001zT-P8
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:14:52 -0400
Received: by mail-pl1-x635.google.com with SMTP id i10so22160154pla.3
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o7f9pq5L0TzmsrOXr/ZiuGxR/VCctySCfk7zYCcLFRk=;
 b=Vvg/rgB0M44Xdj5tt+IVyNMjEwED5v4aUZeen7IBwRsFiwJskxHa5MpjhOp8PxCCJa
 P7euxvhGeILxUNh+TjXP2iikmEE5wK9pZ9q/dyook5YhHXvlLvGRM0nYDj46w4TtZizD
 Bgdl3c/Mm8xocFNjd8BPtqxYn7ivC87+ee3LnpogO/JbyU2bEFJiCwBtaMH3ZtN+ugI9
 8GA5eFJ+YNY/ex2DQMkHU7F4Beazobvs+h3/ER9qDbpEGswUNloxCH+0zjLPgrapYBOx
 SHuIGvLNlmsUk+Fb1sUcXHurhGg1CgBE4hz5RZCL4Jlx7lREChfzTA5e/+RWEyvg+NDN
 NaQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o7f9pq5L0TzmsrOXr/ZiuGxR/VCctySCfk7zYCcLFRk=;
 b=d9X9sBWjAhBYvQcjbNn/tT7qNOc6PQhGskOZeSuj/nkazSBs5Hgq+jFfz4U/i0uE7t
 ijHj4njPaq3/RZhRHQ6sYXvKMBuPHH6scDRQpUdwz1N0YXj/qIf4pzn5WJ5o/KwjPFwE
 LquFKPtJDeJMqwPqoxaCBjYgCZc35hzwWae20RDRROSa3Bb7eoJEUetzpO9gWOaVaNq4
 b9C59WEYk05iMRx1RlW8otrErEeTWvK5PBb20iomm9T0W7vEd5cb9nwkvzRrn1DoVKuZ
 3ha6D9DPsfVYPriMdKuyTa1V3nXxhxRZoMLoAky3ACMW94ok8g/ZYXt0T/Pto7gX7k3L
 4P/A==
X-Gm-Message-State: AOAM532/kW02iD0G9zyJVW84i4kKrYhnPTKRp5y3Q1pGcxF5OwY7CmpL
 t+V8Yup+54jOAt4IYj6kAMjvmgGNjZVXOw==
X-Google-Smtp-Source: ABdhPJz6GtVRZ2F/DZmkB4JOq76qDv3ZAa5/4PT1Oa5MrkAXWw1VUF+JT69nU9Ik8EH9aSTzTCcCfg==
X-Received: by 2002:a17:902:c443:b029:12c:92c1:9b4d with SMTP id
 m3-20020a170902c443b029012c92c19b4dmr16367159plm.85.1627964089542; 
 Mon, 02 Aug 2021 21:14:49 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id c23sm13718532pfn.140.2021.08.02.21.14.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:14:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/55] target/alpha: Implement do_unaligned_access for
 user-only
Date: Mon,  2 Aug 2021 18:13:51 -1000
Message-Id: <20210803041443.55452-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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


