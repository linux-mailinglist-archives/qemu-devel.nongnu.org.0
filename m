Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A38C64FB4C
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 18:32:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6b1G-0002jo-J9; Sat, 17 Dec 2022 12:30:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6b0u-0002dA-8M
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 12:30:20 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6b0q-0002gE-DT
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 12:30:19 -0500
Received: by mail-ej1-x62f.google.com with SMTP id jo4so4016590ejb.7
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 09:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xTDBNSZT6+fFieDTVKKGY2cR9GIfCF8Bd1zuisc6hQg=;
 b=WQPkSwxp9OggpYWVLQormmZ7UTdFovnPXafayr/1UFYULzpXfpp1Y9FUF1iDz3rLag
 37Mb/Sm2Jlp+oVEG3jkHrJDpDttvpR5q3XcuX+vUCAL1OuHp8Hew88tOO7NwqfmpsVEV
 lbM7XOdCq4GFnjK/VMR4KpDtpIOqSt+Ig6AIUfaKZjuOSMsjBlOprX+NmkqXcZhKkNle
 TXq3/8qPoF8TRWZq/LzxGml7WFyJ2ErnRLfH4i5xH1Gl+Gm/J6uapYVji5b71JCeXLZQ
 7LM7v8OIhLa7+9WkQYU+0F0rBTOn0PCYxFXX1XPKxV1wSmRXjOy9H1ZrrV6vHKfmm2xc
 iMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xTDBNSZT6+fFieDTVKKGY2cR9GIfCF8Bd1zuisc6hQg=;
 b=16sNaU8KpgJivORRN1jopXNBrdO6SSFpiFae2CoLLvjiAoV/Om+8EghYdolE9gTEJw
 hDCVBhKGQaP0x1vvqoKxl1AXA+95XVENMo52E4y379VFQYw5ysOHnuDRBvq5Xn/QzRBo
 O3p38OtbVfDsPURDiAGHalZNiRnskXSIc7ncLOYDVqSHFjNMS1bkvVUXNwffcix7X6x/
 2QsEUGuh46yofsTjgNr6qA8D8AW4ILNVYDt7qR6hTDznEivtkYhRURxuyQPqs0/FzRm8
 pwPwK1IwDVOrGjUSS2WG9ooYdO4w4GBebRKxiRpiVHWCfdCjjsd4yQtC2F6aFF71ARKd
 2oOQ==
X-Gm-Message-State: ANoB5pnKej4zQxsIaPTN3CaHt7Gy0pgxLMRA5ttwWepZXLUE2F7kAiTA
 YAknnKqy4QHKHDiJDXCJxSRcAHkMyTiKnPFWQyY=
X-Google-Smtp-Source: AA0mqf5uffLuz/RlOfjx3LfW2nOvJMq6renGCJgwWAJXO0ybGJQODl54a+q3RLQhkF3i6mqFdWu7PQ==
X-Received: by 2002:a17:906:4998:b0:7b6:62c:dd58 with SMTP id
 p24-20020a170906499800b007b6062cdd58mr31761091eju.57.1671298214979; 
 Sat, 17 Dec 2022 09:30:14 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a170906504a00b007b29d292852sm2219059ejk.148.2022.12.17.09.30.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 17 Dec 2022 09:30:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, kvm@vger.kernel.org,
 qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>, qemu-riscv@nongnu.org,
 Song Gao <gaosong@loongson.cn>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 7/9] target/riscv/cpu: Restrict some sysemu-specific fields
 from CPUArchState
Date: Sat, 17 Dec 2022 18:29:05 +0100
Message-Id: <20221217172907.8364-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221217172907.8364-1-philmd@linaro.org>
References: <20221217172907.8364-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The 'hwaddr' type is only available / meaningful on system emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/cpu.h | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 05fafebff7..71ea1bb411 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -370,7 +370,7 @@ struct CPUArchState {
     uint64_t menvcfg;
     target_ulong senvcfg;
     uint64_t henvcfg;
-#endif
+
     target_ulong cur_pmmask;
     target_ulong cur_pmbase;
 
@@ -388,6 +388,7 @@ struct CPUArchState {
     uint64_t kvm_timer_compare;
     uint64_t kvm_timer_state;
     uint64_t kvm_timer_frequency;
+#endif
 };
 
 OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
@@ -553,12 +554,20 @@ bool riscv_cpu_virt_enabled(CPURISCVState *env);
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
 bool riscv_cpu_two_stage_lookup(int mmu_idx);
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
+#ifndef CONFIG_USER_ONLY
+hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 G_NORETURN void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                                MMUAccessType access_type, int mmu_idx,
                                                uintptr_t retaddr);
 bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
                         bool probe, uintptr_t retaddr);
+void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
+                                     vaddr addr, unsigned size,
+                                     MMUAccessType access_type,
+                                     int mmu_idx, MemTxAttrs attrs,
+                                     MemTxResult response, uintptr_t retaddr);
+#endif
 char *riscv_isa_string(RISCVCPU *cpu);
 void riscv_cpu_list(void);
 
@@ -566,12 +575,6 @@ void riscv_cpu_list(void);
 #define cpu_mmu_index riscv_cpu_mmu_index
 
 #ifndef CONFIG_USER_ONLY
-void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
-                                     vaddr addr, unsigned size,
-                                     MMUAccessType access_type,
-                                     int mmu_idx, MemTxAttrs attrs,
-                                     MemTxResult response, uintptr_t retaddr);
-hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
 void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env);
 int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts);
-- 
2.38.1


