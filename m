Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9375B702881
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 11:28:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyUUq-0004vq-1V; Mon, 15 May 2023 05:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pyUUV-0004nX-VN; Mon, 15 May 2023 05:27:40 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pyUUL-0002uT-Gz; Mon, 15 May 2023 05:27:39 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6438d95f447so8705572b3a.3; 
 Mon, 15 May 2023 02:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684142847; x=1686734847;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eKzTaElM3wY97A0BT54fsna/RWbBlG74gXJr9SNsntU=;
 b=JyHVtIVib7PHA9WRkO8ArOirZq1LfpySW7Vwq2mwddiLO1eJYp4zxwSYP/5lmkmSBR
 FZr0E+wLTIcctQ/RMjv5M5Vf+Zygt8KPUJN15UaNpGQo2B2hmHUw9EAX1zNExf1PSU28
 HTz3hdrvMi5cs1WYuh2VCKHrgCpYRY/QzRC0VoTQlW1N0yGzubJowMc5BdktLwZvNZ/5
 nOF7TM0MXCSxhsX7LkTCjRwnkC801JltR64nlO3kvHX71sgSpzD9Fv1ECtfufXHvOrdq
 wUaCDoQ+mW39UFAzI62B7ARuUpSNfiMx04ZhaS+xrnUff6xFdkyG8PrV90f/+0w8VYwB
 NKcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684142847; x=1686734847;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eKzTaElM3wY97A0BT54fsna/RWbBlG74gXJr9SNsntU=;
 b=CGnZIa/O2qZ4yt7qvRzduxHnEr7c9PrKrQdwU0e6DNrEdexEvWsYwp66V5q2Kv1VZu
 7X3NC9+yuKTVsDlgWNE1jkw/x9KZHrcirEJbUXf+etYroKcJ7gUKO1s5zel0siy87amf
 AiDlMwGsp4Iz2Kv2OAW1Kw7dgjII5WMp2yozip/77KSOVa/GbV9zNlrMiW5yqX2JUvUI
 eR0elG6/LGDWkGe+WAgTRjq3sufudmNUOxBA/NQtdiIi0OZbKs5woTDglRQiOz7MYe1A
 MKp5t470qyZ4uNuLBB+nEjf3yup3srMBKhYatljgQxiAOZTxbECZD7xEi3Lx7AVOIXOh
 qqgg==
X-Gm-Message-State: AC+VfDztBT1uHptO1IDnUlguE9TCDErfIV01nY8KxFARL2Ed2YQSNR/V
 pl7v+f+/3PLPnQzLWBWhNH2LI1NNdyA=
X-Google-Smtp-Source: ACHHUZ5BZiT9AGMgNqYoue05INZgqmTcHnoFbcmCaScpGl0CaHDb1HzRMnD0jBhF3yb1eXcWQJuJwQ==
X-Received: by 2002:a05:6a20:9384:b0:106:93b:aa9a with SMTP id
 x4-20020a056a20938400b00106093baa9amr3864688pzh.48.1684142847350; 
 Mon, 15 May 2023 02:27:27 -0700 (PDT)
Received: from wheely.local0.net ([202.168.30.146])
 by smtp.gmail.com with ESMTPSA id
 n20-20020aa79054000000b006466f0be263sm11387818pfo.73.2023.05.15.02.27.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 02:27:26 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>, qemu-devel@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Fabiano Rosas <farosas@suse.de>
Subject: [PATCH v3 6/9] target/ppc: Add SRR1 prefix indication to interrupt
 handlers
Date: Mon, 15 May 2023 19:26:52 +1000
Message-Id: <20230515092655.171206-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515092655.171206-1-npiggin@gmail.com>
References: <20230515092655.171206-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

ISA v3.1 introduced prefix instructions. Among the changes, various
synchronous interrupts report whether they were caused by a prefix
instruction in (H)SRR1.

The case of instruction fetch that causes an HDSI due to access of a
process-scoped table faulting on the partition scoped translation is the
tricky one. As with ISIs and HISIs, this does not try to set the prefix
bit because there is no instruction image to be loaded. The HDSI needs
the originating access type to be passed through to the handler to
distinguish this from HDSIs that fault translating process scoped tables
originating from a load or store instruction (in that case the prefix
bit should be provided).

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Since v2:
- Fix a bug where ifetch access causing HDSI due to process scoped table
  access failing on partition scope translation would go into infinite
  recursive fault attempting to load the instruction image. This
  requires more data from the page fault to distinguish this from the
  same case but initiated by a load or store (in which case we can load
  the instruction image).

 target/ppc/excp_helper.c | 44 ++++++++++++++++++++++++++++++++++++++++
 target/ppc/mmu-radix64.c | 14 ++++++++++---
 2 files changed, 55 insertions(+), 3 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 453750a9d6..27d321c15f 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1346,12 +1346,21 @@ static bool books_vhyp_handles_hv_excp(PowerPCCPU *cpu)
     return false;
 }
 
+static bool is_prefix_excp(CPUPPCState *env, uint32_t insn)
+{
+    if (!(env->insns_flags2 & PPC2_ISA310)) {
+        return false;
+    }
+    return ((insn & 0xfc000000) == 0x04000000);
+}
+
 static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
     target_ulong msr, new_msr, vector;
     int srr0, srr1, lev = -1;
+    uint32_t insn = 0;
 
     /* new srr1 value excluding must-be-zero bits */
     msr = env->msr & ~0x783f0000ULL;
@@ -1390,6 +1399,41 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
 
     vector |= env->excp_prefix;
 
+    switch (excp) {
+    case POWERPC_EXCP_HDSI:
+        /* HDSI PRTABLE_FAULT has the originating access type in error_code */
+        if ((env->spr[SPR_HDSISR] & DSISR_PRTABLE_FAULT) &&
+            (env->error_code == MMU_INST_FETCH)) {
+            /*
+             * Fetch failed due to partition scope translation, so prefix
+             * indication is not relevant (and attempting to load the
+             * instruction at NIP would cause recursive faults with the same
+             * translation).
+             */
+            break;
+        }
+        /* fall through */
+    case POWERPC_EXCP_MCHECK:
+    case POWERPC_EXCP_DSI:
+    case POWERPC_EXCP_DSEG:
+    case POWERPC_EXCP_ALIGN:
+    case POWERPC_EXCP_PROGRAM:
+    case POWERPC_EXCP_FPU:
+    case POWERPC_EXCP_TRACE:
+    case POWERPC_EXCP_HV_EMU:
+    case POWERPC_EXCP_VPU:
+    case POWERPC_EXCP_VSXU:
+    case POWERPC_EXCP_FU:
+    case POWERPC_EXCP_HV_FU:
+        insn = ppc_ldl_code(env, env->nip);
+        if (is_prefix_excp(env, insn)) {
+            msr |= PPC_BIT(34);
+        }
+        break;
+    default:
+        break;
+    }
+
     switch (excp) {
     case POWERPC_EXCP_MCHECK:    /* Machine check exception                  */
         if (!FIELD_EX64(env->msr, MSR, ME)) {
diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 1fc1ba3ecf..920084bd8f 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -145,6 +145,13 @@ static void ppc_radix64_raise_hsi(PowerPCCPU *cpu, MMUAccessType access_type,
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
 
+    env->error_code = 0;
+    if (cause & DSISR_PRTABLE_FAULT) {
+        /* HDSI PRTABLE_FAULT gets the originating access type in error_code */
+        env->error_code = access_type;
+        access_type = MMU_DATA_LOAD;
+    }
+
     qemu_log_mask(CPU_LOG_MMU, "%s for %s @0x%"VADDR_PRIx" 0x%"
                   HWADDR_PRIx" cause %08x\n",
                   __func__, access_str(access_type),
@@ -166,7 +173,6 @@ static void ppc_radix64_raise_hsi(PowerPCCPU *cpu, MMUAccessType access_type,
         env->spr[SPR_HDSISR] = cause;
         env->spr[SPR_HDAR] = eaddr;
         env->spr[SPR_ASDR] = g_raddr;
-        env->error_code = 0;
         break;
     default:
         g_assert_not_reached();
@@ -369,13 +375,14 @@ static bool validate_pate(PowerPCCPU *cpu, uint64_t lpid, ppc_v3_pate_t *pate)
 }
 
 static int ppc_radix64_partition_scoped_xlate(PowerPCCPU *cpu,
-                                              MMUAccessType access_type,
+                                              MMUAccessType orig_access_type,
                                               vaddr eaddr, hwaddr g_raddr,
                                               ppc_v3_pate_t pate,
                                               hwaddr *h_raddr, int *h_prot,
                                               int *h_page_size, bool pde_addr,
                                               int mmu_idx, bool guest_visible)
 {
+    MMUAccessType access_type = orig_access_type;
     int fault_cause = 0;
     hwaddr pte_addr;
     uint64_t pte;
@@ -404,7 +411,8 @@ static int ppc_radix64_partition_scoped_xlate(PowerPCCPU *cpu,
             fault_cause |= DSISR_PRTABLE_FAULT;
         }
         if (guest_visible) {
-            ppc_radix64_raise_hsi(cpu, access_type, eaddr, g_raddr, fault_cause);
+            ppc_radix64_raise_hsi(cpu, orig_access_type,
+                                  eaddr, g_raddr, fault_cause);
         }
         return 1;
     }
-- 
2.40.1


