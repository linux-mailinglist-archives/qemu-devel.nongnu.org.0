Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A106C5C90
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 03:24:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfAbN-00022q-Mq; Wed, 22 Mar 2023 22:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pfAbL-00022O-9Q; Wed, 22 Mar 2023 22:22:51 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pfAbJ-000836-H1; Wed, 22 Mar 2023 22:22:51 -0400
Received: by mail-pl1-x62a.google.com with SMTP id u5so20997433plq.7;
 Wed, 22 Mar 2023 19:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679538167;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vD3clw3JVdGa9oC9XYxYZAunXVlX+f0D0gOjgPJxem8=;
 b=ZFVeFbF7w6RdsnLUOqcq44VMcbEBujvKDR4Jngi1R+dHK/tpWvUfgdMB5bcZu9WBpQ
 VkaHyH/JuX3Abm/2Lt2QvHfOpUWiHEeIECy3UghUi4yG3l0AxySslqWS9pVrQi35o1aW
 eRBPjPsSkSLLA8z6LPRAJfH1AU3kRlMyjxjQgfm6L7/OFJomkjM0Fi9XGZYvU7FH3GX2
 gjm0MVZwfbCmZawPraXRxc4D8cxAp80hqmuYnvYMm8SZOnZJzE9oIiMQmtzMbBezh9wV
 WGBoQPf8UuLot5xqgzSDZMEBDPSE834Em7pa7LxYhjCoQPqYLhCzsJwBwvG6ryRmlgi5
 Gafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679538167;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vD3clw3JVdGa9oC9XYxYZAunXVlX+f0D0gOjgPJxem8=;
 b=n5TPg2RFnV5cd07qyNTJoyhWh9cVkd0qrFa3yOYwN177WYpbjokGFYQ5Ifzr1sNr1d
 InU8sM7OG3JNMms1B3OqXLfGIiwuPaICuIVXX9P5J8+yjv9L/hMwj1EfLMBVGMyIX5Ef
 g3+O1R2ZWMgySgfQnXiaul3lkrI7nhW2S16SJ+g//maYuvsKr7g7FRpxbn7+4fVn/hIV
 XScFTUA5nFVjMUwVio7Spiq38tLAnYHA+zoS+6/9claFXu/vu8p9/6u5wr6V3Sh47H5K
 bc97AlWGK5wZ1FDoaPdG+HCOtRcR+Dx8cROFAE2fgTeFs8NvFswoM7OV52/XCTw1qqbk
 F3nA==
X-Gm-Message-State: AO0yUKWDP5/SKnCSoExRgaqfkCN1+NX5SxzfynX/SSamgFddK1AzFvpA
 fpAXrsEng0uhNeviIX8XdWQMFHnoN4wXkA==
X-Google-Smtp-Source: AK7set8+lpidyWNvjc4twLyBM9PIhX1uIOjr5+1g/PPuP53JsJsxE1H1BqCfxdykKItD/QQE2Hh/SA==
X-Received: by 2002:a17:902:eccc:b0:1a1:bb4e:4eb8 with SMTP id
 a12-20020a170902eccc00b001a1bb4e4eb8mr5766839plh.62.1679538166948; 
 Wed, 22 Mar 2023 19:22:46 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-215-123.tpgi.com.au. [61.68.215.123])
 by smtp.gmail.com with ESMTPSA id
 jc11-20020a17090325cb00b001a1abc93eabsm10609438plb.226.2023.03.22.19.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 19:22:46 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 1/6] target/ppc: Fix width of some 32-bit SPRs
Date: Thu, 23 Mar 2023 12:22:32 +1000
Message-Id: <20230323022237.1807512-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Some 32-bit SPRs are incorrectly implemented as 64-bits on 64-bit
targets.

This changes VRSAVE, DSISR, HDSISR, DAWRX0, PIDR, LPIDR, DEXCR,
HDEXCR, CTRL, TSCR, MMCRH, and PMC[1-6] from to be 32-bit registers.

This only goes by the 32/64 classification in the architecture, it
does not try to implement finer details of SPR implementation (e.g.,
not all bits implemented as simple read/write storage).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 target/ppc/cpu_init.c    | 18 +++++++++---------
 target/ppc/helper_regs.c |  2 +-
 target/ppc/misc_helper.c |  4 ++--
 target/ppc/power8-pmu.c  |  2 +-
 target/ppc/translate.c   |  2 +-
 5 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 0ce2e3c91d..5aa0b3f0f1 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -5085,8 +5085,8 @@ static void register_book3s_altivec_sprs(CPUPPCState *env)
     }
 
     spr_register_kvm(env, SPR_VRSAVE, "VRSAVE",
-                     &spr_read_generic, &spr_write_generic,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_generic, &spr_write_generic32,
+                     &spr_read_generic, &spr_write_generic32,
                      KVM_REG_PPC_VRSAVE, 0x00000000);
 
 }
@@ -5120,7 +5120,7 @@ static void register_book3s_207_dbg_sprs(CPUPPCState *env)
     spr_register_kvm_hv(env, SPR_DAWRX0, "DAWRX0",
                         SPR_NOACCESS, SPR_NOACCESS,
                         SPR_NOACCESS, SPR_NOACCESS,
-                        &spr_read_generic, &spr_write_generic,
+                        &spr_read_generic, &spr_write_generic32,
                         KVM_REG_PPC_DAWRX, 0x00000000);
     spr_register_kvm_hv(env, SPR_CIABR, "CIABR",
                         SPR_NOACCESS, SPR_NOACCESS,
@@ -5376,7 +5376,7 @@ static void register_book3s_ids_sprs(CPUPPCState *env)
     spr_register_hv(env, SPR_TSCR, "TSCR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
+                 &spr_read_generic, &spr_write_generic32,
                  0x00000000);
     spr_register_hv(env, SPR_HMER, "HMER",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -5406,7 +5406,7 @@ static void register_book3s_ids_sprs(CPUPPCState *env)
     spr_register_hv(env, SPR_MMCRC, "MMCRC",
                  SPR_NOACCESS, SPR_NOACCESS,
                  SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
+                 &spr_read_generic, &spr_write_generic32,
                  0x00000000);
     spr_register_hv(env, SPR_MMCRH, "MMCRH",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -5441,7 +5441,7 @@ static void register_book3s_ids_sprs(CPUPPCState *env)
     spr_register_hv(env, SPR_HDSISR, "HDSISR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
+                 &spr_read_generic, &spr_write_generic32,
                  0x00000000);
     spr_register_hv(env, SPR_HRMOR, "HRMOR",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -5665,7 +5665,7 @@ static void register_power7_book4_sprs(CPUPPCState *env)
                      KVM_REG_PPC_ACOP, 0);
     spr_register_kvm(env, SPR_BOOKS_PID, "PID",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_generic, &spr_write_generic32,
                      KVM_REG_PPC_PID, 0);
 #endif
 }
@@ -5730,7 +5730,7 @@ static void register_power10_dexcr_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_DEXCR, "DEXCR",
             SPR_NOACCESS, SPR_NOACCESS,
-            &spr_read_generic, &spr_write_generic,
+            &spr_read_generic, &spr_write_generic32,
             0);
 
     spr_register(env, SPR_UDEXCR, "DEXCR",
@@ -5741,7 +5741,7 @@ static void register_power10_dexcr_sprs(CPUPPCState *env)
     spr_register_hv(env, SPR_HDEXCR, "HDEXCR",
             SPR_NOACCESS, SPR_NOACCESS,
             SPR_NOACCESS, SPR_NOACCESS,
-            &spr_read_generic, &spr_write_generic,
+            &spr_read_generic, &spr_write_generic32,
             0);
 
     spr_register(env, SPR_UHDEXCR, "HDEXCR",
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 779e7db513..fb351c303f 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -448,7 +448,7 @@ void register_non_embedded_sprs(CPUPPCState *env)
     /* Exception processing */
     spr_register_kvm(env, SPR_DSISR, "DSISR",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_generic, &spr_write_generic32,
                      KVM_REG_PPC_DSISR, 0x00000000);
     spr_register_kvm(env, SPR_DAR, "DAR",
                      SPR_NOACCESS, SPR_NOACCESS,
diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
index a9bc1522e2..40ddc5c08c 100644
--- a/target/ppc/misc_helper.c
+++ b/target/ppc/misc_helper.c
@@ -190,13 +190,13 @@ void helper_store_dpdes(CPUPPCState *env, target_ulong val)
 
 void helper_store_pidr(CPUPPCState *env, target_ulong val)
 {
-    env->spr[SPR_BOOKS_PID] = val;
+    env->spr[SPR_BOOKS_PID] = (uint32_t)val;
     tlb_flush(env_cpu(env));
 }
 
 void helper_store_lpidr(CPUPPCState *env, target_ulong val)
 {
-    env->spr[SPR_LPIDR] = val;
+    env->spr[SPR_LPIDR] = (uint32_t)val;
 
     /*
      * We need to flush the TLB on LPID changes as we only tag HV vs
diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index 1381072b9e..64a64865d7 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -272,7 +272,7 @@ void helper_store_pmc(CPUPPCState *env, uint32_t sprn, uint64_t value)
 {
     pmu_update_cycles(env);
 
-    env->spr[sprn] = value;
+    env->spr[sprn] = (uint32_t)value;
 
     pmc_update_overflow_timer(env, sprn);
 }
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index df324fc7ff..58fa509057 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -413,7 +413,7 @@ void spr_write_generic(DisasContext *ctx, int sprn, int gprn)
 
 void spr_write_CTRL(DisasContext *ctx, int sprn, int gprn)
 {
-    spr_write_generic(ctx, sprn, gprn);
+    spr_write_generic32(ctx, sprn, gprn);
 
     /*
      * SPR_CTRL writes must force a new translation block,
-- 
2.37.2


