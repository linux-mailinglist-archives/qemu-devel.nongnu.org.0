Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E1E647340
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 16:37:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3IwF-0003QR-9p; Thu, 08 Dec 2022 10:35:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3IwD-0003NJ-Qm
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 10:35:53 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3IwB-0006WS-R7
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 10:35:53 -0500
Received: by mail-wr1-x432.google.com with SMTP id h10so2058922wrx.3
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 07:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D0ClmvfrnC5uwLcCZt7jUcxr3DIHaRVyT4haTfqPSpU=;
 b=XpzzT24iw0ZShhQVX3SJQm+NbNuVucn667ZU54sKCPOK0bo92MkIa8N8QzmTVRSMiG
 63sXpqwP5eWwHMzRp5h/eIy4/fAHBtcH1esawAN94i15yVrZWbbqOq05xGyTwX1c7Z+4
 PtDqQRAUE4nhIt5gpAZOP8QMY3LgEenjva5NWuZGf9nUo1Sm+Jbrb8+z8uw/xgmVDXQV
 xFeuUkSgSPZl8YGm7PY+hm58cZEZyw5sa1kh1lqc2ow9wm5RFY127PL3NrBB0Hm2lrUq
 8jX//1MakTmQCDQyIJgBRhc75hPe+dkaz+WQHZ17iqj+HCeSKopLcpqnT7QX36cAUue/
 rshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D0ClmvfrnC5uwLcCZt7jUcxr3DIHaRVyT4haTfqPSpU=;
 b=UXMu8bKrjPdcmf8S4DBiVfdpoN12Wo55PVahWqeRlEDzNxD6V+EjtPv1NtiNHmAG3A
 U+KdW6pK5ELPJBKSkWFPcOrPf5xZ/S5nTFwX5P4PhJE60xyoMszm+XU55aG64fhQ1hTU
 AMcdToY12+nuX1wxhkRN7L2Eb2Nfw6eT0H0r3IDYAuUpC/zknRqhz597ST/uNbFlr3SC
 IkP3iYkc1rzDdhGmUtIASzlQmW+GM11E3L0QDGYej5tqVp+gArNO7PmRwTZMFdHNAq8E
 ZurVyBTBpZkTFU7IVdIvgM2ZHOW9t1T0Y2SZcAsBoJ82fL54xQ3yBHoZ96+gLIo6Oafl
 QCIg==
X-Gm-Message-State: ANoB5pmzKMgD1MPevZzFI5TMlv7jItYp4OuvVSfw3UDryZPaZtRZ1/sg
 EGO2UvXzv96mVyERpXVSJfS57MbGgZz9gkk9xm4=
X-Google-Smtp-Source: AA0mqf7edx/LknZ0K6jubJYtk5goftomacXDeZkGPqG/218Y0tB27yp0nabXYRvAR0X9CWJ8mVDivA==
X-Received: by 2002:adf:f145:0:b0:242:486:5037 with SMTP id
 y5-20020adff145000000b0024204865037mr1714207wro.32.1670513749928; 
 Thu, 08 Dec 2022 07:35:49 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t12-20020adfeb8c000000b0023662245d3csm22310885wrn.95.2022.12.08.07.35.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 08 Dec 2022 07:35:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, kvm@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>, Chris Wulff <crwulff@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Fabiano Rosas <farosas@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marek Vasut <marex@denx.de>, Max Filippov <jcmvbkbc@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Laurent Vivier <laurent@vivier.eu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH-for-8.0 v2 3/4] target/cpu: Restrict cpu_get_phys_page_debug()
 handlers to sysemu
Date: Thu,  8 Dec 2022 16:35:27 +0100
Message-Id: <20221208153528.27238-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221208153528.27238-1-philmd@linaro.org>
References: <20221208153528.27238-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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
 target/alpha/cpu.h    | 2 +-
 target/cris/cpu.h     | 3 +--
 target/hppa/cpu.h     | 2 +-
 target/m68k/cpu.h     | 2 +-
 target/nios2/cpu.h    | 2 +-
 target/openrisc/cpu.h | 3 ++-
 target/ppc/cpu.h      | 2 +-
 target/rx/cpu.h       | 2 +-
 target/rx/helper.c    | 4 ++--
 target/sh4/cpu.h      | 2 +-
 target/sparc/cpu.h    | 3 ++-
 target/xtensa/cpu.h   | 2 +-
 12 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index d0abc949a8..5e67304d81 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -276,9 +276,9 @@ extern const VMStateDescription vmstate_alpha_cpu;
 
 void alpha_cpu_do_interrupt(CPUState *cpu);
 bool alpha_cpu_exec_interrupt(CPUState *cpu, int int_req);
+hwaddr alpha_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 #endif /* !CONFIG_USER_ONLY */
 void alpha_cpu_dump_state(CPUState *cs, FILE *f, int flags);
-hwaddr alpha_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int alpha_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int alpha_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 
diff --git a/target/cris/cpu.h b/target/cris/cpu.h
index e6776f25b1..71fa1f96e0 100644
--- a/target/cris/cpu.h
+++ b/target/cris/cpu.h
@@ -193,12 +193,11 @@ bool cris_cpu_exec_interrupt(CPUState *cpu, int int_req);
 bool cris_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr);
+hwaddr cris_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 #endif
 
 void cris_cpu_dump_state(CPUState *cs, FILE *f, int flags);
 
-hwaddr cris_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
-
 int crisv10_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int cris_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int cris_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 6f3b6beecf..b595ef25a9 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -322,11 +322,11 @@ static inline void cpu_hppa_change_prot_id(CPUHPPAState *env) { }
 void cpu_hppa_change_prot_id(CPUHPPAState *env);
 #endif
 
-hwaddr hppa_cpu_get_phys_page_debug(CPUState *cs, vaddr addr);
 int hppa_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int hppa_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void hppa_cpu_dump_state(CPUState *cs, FILE *f, int);
 #ifndef CONFIG_USER_ONLY
+hwaddr hppa_cpu_get_phys_page_debug(CPUState *cs, vaddr addr);
 bool hppa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr);
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 3a9cfe2f33..68ed531fc3 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -176,9 +176,9 @@ struct ArchCPU {
 #ifndef CONFIG_USER_ONLY
 void m68k_cpu_do_interrupt(CPUState *cpu);
 bool m68k_cpu_exec_interrupt(CPUState *cpu, int int_req);
+hwaddr m68k_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 #endif /* !CONFIG_USER_ONLY */
 void m68k_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
-hwaddr m68k_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int m68k_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int m68k_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 
diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index f85581ee56..2f43b67a8f 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -262,7 +262,6 @@ void nios2_tcg_init(void);
 void nios2_cpu_do_interrupt(CPUState *cs);
 void dump_mmu(CPUNios2State *env);
 void nios2_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
-hwaddr nios2_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 G_NORETURN void nios2_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
                                               MMUAccessType access_type, int mmu_idx,
                                               uintptr_t retaddr);
@@ -288,6 +287,7 @@ static inline int cpu_mmu_index(CPUNios2State *env, bool ifetch)
 }
 
 #ifndef CONFIG_USER_ONLY
+hwaddr nios2_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
                         bool probe, uintptr_t retaddr);
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index 1d5efa5ca2..31a4ae5ad3 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -312,7 +312,6 @@ struct ArchCPU {
 
 void cpu_openrisc_list(void);
 void openrisc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
-hwaddr openrisc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int openrisc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int openrisc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void openrisc_translate_init(void);
@@ -321,6 +320,8 @@ int print_insn_or1k(bfd_vma addr, disassemble_info *info);
 #define cpu_list cpu_openrisc_list
 
 #ifndef CONFIG_USER_ONLY
+hwaddr openrisc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
+
 bool openrisc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                            MMUAccessType access_type, int mmu_idx,
                            bool probe, uintptr_t retaddr);
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 81d4263a07..6a7a8634da 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1346,12 +1346,12 @@ static inline bool vhyp_cpu_in_nested(PowerPCCPU *cpu)
 #endif /* CONFIG_USER_ONLY */
 
 void ppc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
-hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int ppc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int ppc_cpu_gdb_read_register_apple(CPUState *cpu, GByteArray *buf, int reg);
 int ppc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 int ppc_cpu_gdb_write_register_apple(CPUState *cpu, uint8_t *buf, int reg);
 #ifndef CONFIG_USER_ONLY
+hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 void ppc_gdb_gen_spr_xml(PowerPCCPU *cpu);
 const char *ppc_gdb_get_dynamic_xml(CPUState *cs, const char *xml_name);
 #endif
diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index 5655dffeff..555d230f24 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -123,11 +123,11 @@ const char *rx_crname(uint8_t cr);
 #ifndef CONFIG_USER_ONLY
 void rx_cpu_do_interrupt(CPUState *cpu);
 bool rx_cpu_exec_interrupt(CPUState *cpu, int int_req);
+hwaddr rx_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 #endif /* !CONFIG_USER_ONLY */
 void rx_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 int rx_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int rx_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
-hwaddr rx_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 
 void rx_translate_init(void);
 void rx_cpu_list(void);
diff --git a/target/rx/helper.c b/target/rx/helper.c
index f34945e7e2..dad5fb4976 100644
--- a/target/rx/helper.c
+++ b/target/rx/helper.c
@@ -144,9 +144,9 @@ bool rx_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     return false;
 }
 
-#endif /* !CONFIG_USER_ONLY */
-
 hwaddr rx_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
 {
     return addr;
 }
+
+#endif /* !CONFIG_USER_ONLY */
diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index 727b829598..02bfd612ea 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -214,7 +214,6 @@ struct ArchCPU {
 
 
 void superh_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
-hwaddr superh_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int superh_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int superh_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 G_NORETURN void superh_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
@@ -225,6 +224,7 @@ void sh4_translate_init(void);
 void sh4_cpu_list(void);
 
 #if !defined(CONFIG_USER_ONLY)
+hwaddr superh_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                          MMUAccessType access_type, int mmu_idx,
                          bool probe, uintptr_t retaddr);
diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index e478c5eb16..ed0069d0b1 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -569,10 +569,11 @@ struct ArchCPU {
 
 #ifndef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_sparc_cpu;
+
+hwaddr sparc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 #endif
 
 void sparc_cpu_do_interrupt(CPUState *cpu);
-hwaddr sparc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int sparc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int sparc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 G_NORETURN void sparc_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 579adcb769..b7a54711a6 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -576,9 +576,9 @@ void xtensa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
                                       unsigned size, MMUAccessType access_type,
                                       int mmu_idx, MemTxAttrs attrs,
                                       MemTxResult response, uintptr_t retaddr);
+hwaddr xtensa_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 #endif
 void xtensa_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
-hwaddr xtensa_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 void xtensa_count_regs(const XtensaConfig *config,
                        unsigned *n_regs, unsigned *n_core_regs);
 int xtensa_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
-- 
2.38.1


