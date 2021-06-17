Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E12A43ABAEC
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 19:53:21 +0200 (CEST)
Received: from localhost ([::1]:58996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltwCe-0008E4-WC
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 13:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltw3T-0006QL-UV
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:43:51 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:35758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltw3S-0001Gw-Cg
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:43:51 -0400
Received: by mail-wr1-x430.google.com with SMTP id m18so7709989wrv.2
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 10:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=unit4JgEQfUxC97CDRdybI6rtAIvnMfZCcJpKphtNpg=;
 b=J9Vpkm9G1T4lmDFD6yo2LhUyQ0vSvDJKGZSdzdZpbMG1GGLIU7eNICcbKMJD9zFRcU
 ow81eVV5ayQEUVB++eS1lq34x/molt0PpINzxIrN9Qj6YgrNqmsowdvv/+pJRIdEZ42L
 qtXwg/GW3WNkonrBHTSutNUO4X8tDaIFzLR5vejbASOCM+V/VVE3Wl8zTa7YxCKAAYgR
 0LeM6vJA5ys8hZ+k4FfxIT6EuJWNFu2ZRV3G54eLbSe/IUUbpPCzjV257dR1rgIc3XU1
 hzevHUQjOU8dZgn8V08i8ABovJf+gVgNNbNNBmQfI2gkpcsun6hPgUZxt3xMKH4u5Cz9
 qOcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=unit4JgEQfUxC97CDRdybI6rtAIvnMfZCcJpKphtNpg=;
 b=oE+Zw0pan9ZYbamlp096ldHBuyx0je0qgDDlx/4t9zjbIAg3WD3aoAFNSmnZHEzBZi
 QFR+suKz1Yh6WwQ6ZBtMrFIbZhyOKejnoU0ntQ3M8tim88Eg3SiMHTEsnCZQyLTX6eph
 nBX5FGRmBYjEA0TV1R3lIWhzldWRII4kWJN2VYLcXE/uJKjpstSavRYY8XNXRbFb+h5s
 nsAeBuCWzP0zsB2yFuWzSHTCDVKyt6r2w/Im/IuL+nf0d89VtgjthhzdIjmLzCN+gibN
 C4U+mm16fwZ+hi4ZGtIFAYV/G9Wl29fcNCWNSZe5Fqz+EVv1KILDJec6lsCAXfhqtHGa
 HF5A==
X-Gm-Message-State: AOAM533WikLG5Fjt28ZyUwWFNEACMG78b2QPAWJY8+hHHXdRy6yIxylY
 +A5S0HWmD/lbsNbX26JWMqfCBzsAakEOyQ==
X-Google-Smtp-Source: ABdhPJzoawBpP6dRG8mB8IUJiQAxDP04knRuNV7zhmZx7rxtugGzfU8G21K8mjNyP2vpGXIOFfZcIQ==
X-Received: by 2002:a5d:648a:: with SMTP id o10mr7245444wri.274.1623951828902; 
 Thu, 17 Jun 2021 10:43:48 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id a9sm5942092wrv.37.2021.06.17.10.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 10:43:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/9] target/mips: Restrict some system specific declarations
 to sysemu
Date: Thu, 17 Jun 2021 19:43:19 +0200
Message-Id: <20210617174323.2900831-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617174323.2900831-1-f4bug@amsat.org>
References: <20210617174323.2900831-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 043715d1e0f ("target/mips: Update ITU to utilize SAARI
and SAAR CP0 registers") declared itc_reconfigure() in public
namespace, while it is restricted to system emulation.

Similarly commit 5679479b9a1 ("target/mips: Move CP0 helpers
to sysemu/cp0.c") restricted cpu_mips_soft_irq() definition to
system emulation, but forgot to restrict its declaration.

Commit a2b0a27d33e ("target/mips: Move TCG source files under
tcg/ sub directory") restricted mips_cpu_do_unaligned_access()
to system emulation but forgot to guard the declaration.

To avoid polluting user-mode emulation with these declarations,
restrict them to sysemu. Also restrict the sysemu ITU/ITC/IRQ
fields from CPUMIPSState.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu.h              | 10 +++++++---
 target/mips/tcg/tcg-internal.h |  6 +++---
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 075c24abdad..1dfe69c6c0c 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1152,13 +1152,13 @@ struct CPUMIPSState {
     CPUMIPSMVPContext *mvp;
 #if !defined(CONFIG_USER_ONLY)
     CPUMIPSTLBContext *tlb;
+    void *irq[8];
+    struct MIPSITUState *itu;
+    MemoryRegion *itc_tag; /* ITC Configuration Tags */
 #endif
 
     const mips_def_t *cpu_model;
-    void *irq[8];
     QEMUTimer *timer; /* Internal timer */
-    struct MIPSITUState *itu;
-    MemoryRegion *itc_tag; /* ITC Configuration Tags */
     target_ulong exception_base; /* ExceptionBase input to the core */
     uint64_t cp0_count_ns; /* CP0_Count clock period (in nanoseconds) */
 };
@@ -1316,12 +1316,16 @@ uint64_t cpu_mips_phys_to_kseg1(void *opaque, uint64_t addr);
 bool mips_um_ksegs_enabled(void);
 void mips_um_ksegs_enable(void);
 
+#if !defined(CONFIG_USER_ONLY)
+
 /* mips_int.c */
 void cpu_mips_soft_irq(CPUMIPSState *env, int irq, int level);
 
 /* mips_itu.c */
 void itc_reconfigure(struct MIPSITUState *tag);
 
+#endif /* !CONFIG_USER_ONLY */
+
 /* helper.c */
 target_ulong exception_resume_pc(CPUMIPSState *env);
 
diff --git a/target/mips/tcg/tcg-internal.h b/target/mips/tcg/tcg-internal.h
index 81b14eb219e..11d98a717f2 100644
--- a/target/mips/tcg/tcg-internal.h
+++ b/target/mips/tcg/tcg-internal.h
@@ -23,9 +23,6 @@ bool mips_cpu_exec_interrupt(CPUState *cpu, int int_req);
 bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr);
-void mips_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
-                                  MMUAccessType access_type,
-                                  int mmu_idx, uintptr_t retaddr);
 
 const char *mips_exception_name(int32_t exception);
 
@@ -57,6 +54,9 @@ void mips_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                     MMUAccessType access_type,
                                     int mmu_idx, MemTxAttrs attrs,
                                     MemTxResult response, uintptr_t retaddr);
+void mips_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
+                                  MMUAccessType access_type,
+                                  int mmu_idx, uintptr_t retaddr);
 void cpu_mips_tlb_flush(CPUMIPSState *env);
 
 #endif /* !CONFIG_USER_ONLY */
-- 
2.31.1


