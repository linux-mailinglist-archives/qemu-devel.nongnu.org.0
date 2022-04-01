Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E62864EEDBB
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 15:03:31 +0200 (CEST)
Received: from localhost ([::1]:46014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naGw7-0001KC-28
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 09:03:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1naGse-0007RM-5M
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 08:59:56 -0400
Received: from [2607:f8b0:4864:20::c36] (port=40828
 helo=mail-oo1-xc36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1naGsb-000370-FO
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 08:59:55 -0400
Received: by mail-oo1-xc36.google.com with SMTP id
 o22-20020a4ad156000000b00324910b18d2so506240oor.7
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 05:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yF7C9gaOsw5q5PId/RPk9weVI8GZSE/i/UYTi79cArg=;
 b=Fv9EPnrAA2w7zGLj+VSTHip02aJ3WndToaz3PLpV8oCsH46TIH8cn5g6q7lLNb9R/Y
 1wUh4QyIbv4fWeHrepGScG9nbBzw1zGeliONU3lVoU60wsxmt/QSoK5UCvh0CwPerYGi
 ccQLPNTXkg4G2hrV+XhpuZOaBEmh8d2S2faufns3maDyZPkfPyvIM4IsBL7hHYPBpCvQ
 EOtoGUVWrp4Y40Utqdmlw7TFNabUDba2PIcks01UeCVeWU2mQzyUxvFqCWwYllVQzGq3
 br8B40lDZC6z6CYgjXRMbbEDWo7CfcFVWMFHbsqzoPrx9u1v+8vGKu1L61qT6kEUEMp0
 Wuxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yF7C9gaOsw5q5PId/RPk9weVI8GZSE/i/UYTi79cArg=;
 b=b7t4qZhOlX6CuBFtK9H15jiPYliI+w+bmZkTgVsDiiWSUo0hPGxr5hq89gmx2OynoS
 kE/UL3T4m7422nrJXTKtjvtT5IGY6slzIHDO4JLob1KgvFUI5eFYQe5X3IkZqcLk4vfJ
 dTY/r/n7A8inOfg/VJfB+5l5X7ypJoXC/chk5fNOZW1av/nfuP704jR7n2dBANHyyq7R
 iHIwccZJrvqecE4i+9KvivUPtQVCT+4fRK8sajMjVw5s3xBxn/b/WlLDqbtbbmndmVZc
 VMeu95PVMMAr9puP+XdhunpF/EZAw3KPQfetYbjxi+4VCG9Tt8qYH3C2amQK162T0jkA
 2ZuA==
X-Gm-Message-State: AOAM53177bxUc83EzAJ8GtApne00irSqLYeNXLrduvKofs2zn9yeAHCK
 CkS7169forj7aIqLfHpJFP+ljN4sOOwAqHQHGjY=
X-Google-Smtp-Source: ABdhPJwa/Q6VsR8hj8hy8guj5P+ot4ujgW1DYefmfwYdd0LLOBXN16YcbXRVZiICt8fZsaugisOIRw==
X-Received: by 2002:a4a:5510:0:b0:328:faf7:9ed9 with SMTP id
 e16-20020a4a5510000000b00328faf79ed9mr1806789oob.65.1648817992380; 
 Fri, 01 Apr 2022 05:59:52 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 h6-20020a9d7986000000b005ce0d5433cdsm1066665otm.15.2022.04.01.05.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 05:59:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] target/riscv: Use cpu_loop_exit_restore directly from mmu
 faults
Date: Fri,  1 Apr 2022 06:59:47 -0600
Message-Id: <20220401125948.79292-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220401125948.79292-1-richard.henderson@linaro.org>
References: <20220401125948.79292-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc36.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, bin.meng@windriver.com, alistair.francis@wdc.com,
 palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The riscv_raise_exception function stores its argument into
exception_index and then exits to the main loop.  When we
have already set exception_index, we can just exit directly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 1c60fb2e80..126251d5da 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1150,7 +1150,7 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
     env->badaddr = addr;
     env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
                             riscv_cpu_two_stage_lookup(mmu_idx);
-    riscv_raise_exception(&cpu->env, cs->exception_index, retaddr);
+    cpu_loop_exit_restore(cs, retaddr);
 }
 
 void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
@@ -1175,7 +1175,7 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     env->badaddr = addr;
     env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
                             riscv_cpu_two_stage_lookup(mmu_idx);
-    riscv_raise_exception(env, cs->exception_index, retaddr);
+    cpu_loop_exit_restore(cs, retaddr);
 }
 
 bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
@@ -1311,7 +1311,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                             first_stage_error,
                             riscv_cpu_virt_enabled(env) ||
                                 riscv_cpu_two_stage_lookup(mmu_idx));
-        riscv_raise_exception(env, cs->exception_index, retaddr);
+        cpu_loop_exit_restore(cs, retaddr);
     }
 
     return true;
-- 
2.25.1


