Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EDD40A218
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 02:38:27 +0200 (CEST)
Received: from localhost ([::1]:41088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPwSw-0002Pw-Ns
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 20:38:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6b-0001n5-No
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:24 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:42615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6Z-0007ne-JS
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:21 -0400
Received: by mail-pg1-x52c.google.com with SMTP id q68so10999085pga.9
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pgJuYElGnmU/oPrsffDSy3tS07hzW3KHJHZQaiPDMOA=;
 b=czXca8Xa7/tuo10vDJ5uN/QoK56L1BsdCikK2vWgQCEF5dqMpnt1Zy8+XIIZdUh6eD
 vu/LxQZqAHMg+kgE8qllBn/R8pd70XyjhEwMYgdEtgaVYCZS0XQU7Ed0zljZfxL6HVML
 QWnGFi/0I75xnaHa/a/SmQf0aBsRXn+3szJ+33b7Zg1nlvBXo39VA06L0yoH/2Ht2nol
 Gen2lmXzAO3v/kQWH/mRFCGW5vIJB+NVEtn8EXKOzDRpbWEGh7HrNZdp999U8c7U3EBA
 lg9GDsmORJ+vY7XH7TZJZSGyAsJMF13gTl4EDyh4+UtC30MK5DmAlN0MhPdft8XyiLJz
 uxeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pgJuYElGnmU/oPrsffDSy3tS07hzW3KHJHZQaiPDMOA=;
 b=kKPaJHC2FeXh5VDvoSkA5WS6FaRqFWYj4vIU4mrxC5Hjtlhi9QV/xv7Fzd35GWXjMR
 8dg1uE/UCucmsTdHMd+eMmOoOCnHEUFJUPv+HNMkxfw36txS+Ry0NTafcruvtEKFg5p9
 8ja49jTIjegcMZ+0scDctb18eubLHxuVvHvVVOWXRmM/7PrL7S/D289xxiYkRCi+8t8e
 czwSfvFU+Dw+9SyRl8QWs3JWxtZqTOOBzmOrfGE19riCExfo0HWs+5YSUt4hLfzG77ft
 b6/eFIN3wbhbwv1p0O2BlEsJw63eGTMLbVzCbs0uqkh2dbKGvV6xNnjbJTsH+sLH/onx
 Y4rQ==
X-Gm-Message-State: AOAM533J2BgartZ7mMeatrwa+lzx9+pOh1YgPhb7Y7/ONhfSVcwXrci0
 J7CDeGlwGCetGIE3Eln8oI7QoJverTNfeQ==
X-Google-Smtp-Source: ABdhPJzkxe/7xde9GOnMNgyFOXYT2wE1gszcITs3FkXr/JjJ1x7uumlGsVl7nydKeJtwi7p6ondHhw==
X-Received: by 2002:aa7:953d:0:b0:438:c168:df09 with SMTP id
 c29-20020aa7953d000000b00438c168df09mr1903563pfp.59.1631578517340; 
 Mon, 13 Sep 2021 17:15:17 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m7sm9334179pgn.32.2021.09.13.17.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:15:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/44] target/riscv: Restrict cpu_exec_interrupt() handler to
 sysemu
Date: Mon, 13 Sep 2021 17:14:38 -0700
Message-Id: <20210914001456.793490-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Restrict cpu_exec_interrupt() and its callees to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20210911165434.531552-19-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.h        | 2 +-
 target/riscv/cpu.c        | 2 +-
 target/riscv/cpu_helper.c | 5 -----
 3 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index bf1c899c00..e735e53e26 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -334,7 +334,6 @@ int riscv_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
                                int cpuid, void *opaque);
 int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
-bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
 bool riscv_cpu_fp_enabled(CPURISCVState *env);
 bool riscv_cpu_virt_enabled(CPURISCVState *env);
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
@@ -362,6 +361,7 @@ void riscv_cpu_list(void);
 #define cpu_mmu_index riscv_cpu_mmu_index
 
 #ifndef CONFIG_USER_ONLY
+bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
 void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env);
 int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts);
 uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value);
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1a2b03d579..13575c1408 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -644,10 +644,10 @@ static const struct SysemuCPUOps riscv_sysemu_ops = {
 static const struct TCGCPUOps riscv_tcg_ops = {
     .initialize = riscv_translate_init,
     .synchronize_from_tb = riscv_cpu_synchronize_from_tb,
-    .cpu_exec_interrupt = riscv_cpu_exec_interrupt,
     .tlb_fill = riscv_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = riscv_cpu_exec_interrupt,
     .do_interrupt = riscv_cpu_do_interrupt,
     .do_transaction_failed = riscv_cpu_do_transaction_failed,
     .do_unaligned_access = riscv_cpu_do_unaligned_access,
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 968cb8046f..701858d670 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -75,11 +75,9 @@ static int riscv_cpu_local_irq_pending(CPURISCVState *env)
         return RISCV_EXCP_NONE; /* indicates no pending interrupt */
     }
 }
-#endif
 
 bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
-#if !defined(CONFIG_USER_ONLY)
     if (interrupt_request & CPU_INTERRUPT_HARD) {
         RISCVCPU *cpu = RISCV_CPU(cs);
         CPURISCVState *env = &cpu->env;
@@ -90,12 +88,9 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
             return true;
         }
     }
-#endif
     return false;
 }
 
-#if !defined(CONFIG_USER_ONLY)
-
 /* Return true is floating point support is currently enabled */
 bool riscv_cpu_fp_enabled(CPURISCVState *env)
 {
-- 
2.25.1


