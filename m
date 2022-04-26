Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 615695107B5
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 20:54:41 +0200 (CEST)
Received: from localhost ([::1]:40194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQKe-0000iu-Gv
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 14:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmh-0002g8-Oq
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:36 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:45755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmf-0004R5-3r
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:35 -0400
Received: by mail-pl1-x633.google.com with SMTP id h12so27286957plf.12
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C/u00nAmgF45yxO3zIMu5WmncM8sGR/FNykbnvTKhkM=;
 b=yanGUVQwNFfuuZDkOCb7BTrja9Jro/krMx0XiHF8bCYHiC1uAzADctrHBri6G/qhgW
 dSors3IY4/NsswvjTCIPTF1Uzp2rZokL/PCCSrRpMd5tWlyJdHPxGkcaTxa/T2wAggWS
 hJR7VmwFEyFnZvhysdRDsvYsdA9tQNAO1wD4SHVg+vmQ6qiTFY/JoUjhXdUo7Lq6l+p1
 OcYGxw5gWKOfXYuFo3S6a6jqKDsKy6s5Z/Q6903qdEmh9e1yhvF2i33NcksMvGu2LEQs
 z/36HwEACb7X0Vlt4/+d9vyxKvO2vrvj1dyzK547oDBb2JkTYkrp6BqbqjxgqOhW/O87
 IyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C/u00nAmgF45yxO3zIMu5WmncM8sGR/FNykbnvTKhkM=;
 b=JaHFeeEBw92jVfAVORaUyzVdbmza00xNp5ZIBGLHxyE+Vzt0YY34eV+T3zi41yzJcN
 NeeZBKiAxB4kNDW7xEMnkJzbuuuoVqR3CJ1cjnaJnuNMWQgwZVTWVbvbzxPD2r1k1uVN
 0u5bigxeIyMx0O3Pwaq1drcjGh3sUZNthgRr5I24rX2p5zwfI08iq8sryzMkNvrLLAWN
 JclsFdFPAPoG+M0buXt4MU+21/P73u9XafLEOjtyGMDF4+cFTACe6DQypwJBqfexPNbR
 8d3SuJ/qFi1ipysBe9bkcDaOieeDtOwsW8C5E+JF3JBhnplN5ctyEWkXLhZQFMak5g8G
 cMew==
X-Gm-Message-State: AOAM531NYyNpqC11TR3hsi4kPHuwQBMPo3pa7Jbas4e/P6LNFPgzL0x/
 9nlYEgZyLPQct3UZA20VKkjPAngTnSDHxw==
X-Google-Smtp-Source: ABdhPJzq2zMA8yTcBhzZNjezRSxFdVxV27poCl1bvBSekvxIOkJKAGbeytWpnlOZJEGqNKrVIJH7Zg==
X-Received: by 2002:a17:902:7296:b0:151:62b1:e2b0 with SMTP id
 d22-20020a170902729600b0015162b1e2b0mr24469797pll.165.1650997171759; 
 Tue, 26 Apr 2022 11:19:31 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a056a00130700b004b9f7cd94a4sm16482827pfu.56.2022.04.26.11.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:19:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/68] target/nios2: Use hw/registerfields.h for CR_TLBADDR
 fields
Date: Tue, 26 Apr 2022 11:18:25 -0700
Message-Id: <20220426181907.103691-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use FIELD_EX32 and FIELD_DP32 instead of manual manipulation
of the fields.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-27-richard.henderson@linaro.org>
---
 target/nios2/cpu.h       |  8 ++++----
 target/nios2/helper.c    |  4 ++--
 target/nios2/mmu.c       | 17 +++++++++--------
 target/nios2/translate.c |  2 +-
 4 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index f8cd5dc218..a6811ff7ea 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -110,10 +110,10 @@ FIELD(CR_EXCEPTION, CAUSE, 2, 5)
 FIELD(CR_EXCEPTION, ECCFTL, 31, 1)
 
 #define CR_PTEADDR       8
-#define   CR_PTEADDR_PTBASE_SHIFT 22
-#define   CR_PTEADDR_PTBASE_MASK  (0x3FF << CR_PTEADDR_PTBASE_SHIFT)
-#define   CR_PTEADDR_VPN_SHIFT    2
-#define   CR_PTEADDR_VPN_MASK     (0xFFFFF << CR_PTEADDR_VPN_SHIFT)
+
+FIELD(CR_PTEADDR, VPN, 2, 20)
+FIELD(CR_PTEADDR, PTBASE, 22, 10)
+
 #define CR_TLBACC        9
 #define   CR_TLBACC_IGN_SHIFT 25
 #define   CR_TLBACC_IGN_MASK  (0x7F << CR_TLBACC_IGN_SHIFT)
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index b30740824c..c2d0afe1b6 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -286,8 +286,8 @@ bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     } else {
         env->ctrl[CR_TLBMISC] |= CR_TLBMISC_D;
     }
-    env->ctrl[CR_PTEADDR] &= CR_PTEADDR_PTBASE_MASK;
-    env->ctrl[CR_PTEADDR] |= (address >> 10) & CR_PTEADDR_VPN_MASK;
+    env->ctrl[CR_PTEADDR] = FIELD_DP32(env->ctrl[CR_PTEADDR], CR_PTEADDR, VPN,
+                                       address >> TARGET_PAGE_BITS);
     env->mmu.pteaddr_wr = env->ctrl[CR_PTEADDR];
 
     cs->exception_index = excp;
diff --git a/target/nios2/mmu.c b/target/nios2/mmu.c
index 95900724e8..75afc56daf 100644
--- a/target/nios2/mmu.c
+++ b/target/nios2/mmu.c
@@ -97,7 +97,7 @@ void helper_mmu_write_tlbacc(CPUNios2State *env, uint32_t v)
     /* if tlbmisc.WE == 1 then trigger a TLB write on writes to TLBACC */
     if (env->ctrl[CR_TLBMISC] & CR_TLBMISC_WR) {
         int way = (env->ctrl[CR_TLBMISC] >> CR_TLBMISC_WAY_SHIFT);
-        int vpn = (env->mmu.pteaddr_wr & CR_PTEADDR_VPN_MASK) >> 2;
+        int vpn = FIELD_EX32(env->mmu.pteaddr_wr, CR_PTEADDR, VPN);
         int pid = (env->mmu.tlbmisc_wr & CR_TLBMISC_PID_MASK) >> 4;
         int g = (v & CR_TLBACC_G) ? 1 : 0;
         int valid = ((vpn & CR_TLBACC_PFN_MASK) < 0xC0000) ? 1 : 0;
@@ -148,7 +148,7 @@ void helper_mmu_write_tlbmisc(CPUNios2State *env, uint32_t v)
     /* if tlbmisc.RD == 1 then trigger a TLB read on writes to TLBMISC */
     if (v & CR_TLBMISC_RD) {
         int way = (v >> CR_TLBMISC_WAY_SHIFT);
-        int vpn = (env->mmu.pteaddr_wr & CR_PTEADDR_VPN_MASK) >> 2;
+        int vpn = FIELD_EX32(env->mmu.pteaddr_wr, CR_PTEADDR, VPN);
         Nios2TLBEntry *entry =
             &env->mmu.tlb[(way * cpu->tlb_num_ways) +
                           (vpn & env->mmu.tlb_entry_mask)];
@@ -160,8 +160,9 @@ void helper_mmu_write_tlbmisc(CPUNios2State *env, uint32_t v)
             (v & ~CR_TLBMISC_PID_MASK) |
             ((entry->tag & ((1 << cpu->pid_num_bits) - 1)) <<
              CR_TLBMISC_PID_SHIFT);
-        env->ctrl[CR_PTEADDR] &= ~CR_PTEADDR_VPN_MASK;
-        env->ctrl[CR_PTEADDR] |= (entry->tag >> 12) << CR_PTEADDR_VPN_SHIFT;
+        env->ctrl[CR_PTEADDR] = FIELD_DP32(env->ctrl[CR_PTEADDR],
+                                           CR_PTEADDR, VPN,
+                                           entry->tag >> TARGET_PAGE_BITS);
     } else {
         env->ctrl[CR_TLBMISC] = v;
     }
@@ -171,12 +172,12 @@ void helper_mmu_write_tlbmisc(CPUNios2State *env, uint32_t v)
 
 void helper_mmu_write_pteaddr(CPUNios2State *env, uint32_t v)
 {
-    trace_nios2_mmu_write_pteaddr(v >> CR_PTEADDR_PTBASE_SHIFT,
-                                  (v & CR_PTEADDR_VPN_MASK) >> CR_PTEADDR_VPN_SHIFT);
+    trace_nios2_mmu_write_pteaddr(FIELD_EX32(v, CR_PTEADDR, PTBASE),
+                                  FIELD_EX32(v, CR_PTEADDR, VPN));
 
     /* Writes to PTEADDR don't change the read-back VPN value */
-    env->ctrl[CR_PTEADDR] = ((v & ~CR_PTEADDR_VPN_MASK) |
-                             (env->ctrl[CR_PTEADDR] & CR_PTEADDR_VPN_MASK));
+    env->ctrl[CR_PTEADDR] = ((v & ~R_CR_PTEADDR_VPN_MASK) |
+                             (env->ctrl[CR_PTEADDR] & R_CR_PTEADDR_VPN_MASK));
     env->mmu.pteaddr_wr = v;
 }
 
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index fc49a7101f..baa22c5101 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -924,7 +924,7 @@ void nios2_cpu_dump_state(CPUState *cs, FILE *f, int flags)
         }
     }
     qemu_fprintf(f, " mmu write: VPN=%05X PID %02X TLBACC %08X\n",
-                 env->mmu.pteaddr_wr & CR_PTEADDR_VPN_MASK,
+                 env->mmu.pteaddr_wr & R_CR_PTEADDR_VPN_MASK,
                  (env->mmu.tlbmisc_wr & CR_TLBMISC_PID_MASK) >> 4,
                  env->mmu.tlbacc_wr);
 #endif
-- 
2.34.1


