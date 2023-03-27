Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F646CA54D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 15:13:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgmeG-0006Fl-6I; Mon, 27 Mar 2023 09:12:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pgmeD-0006Dj-US; Mon, 27 Mar 2023 09:12:30 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pgmeB-00015c-Si; Mon, 27 Mar 2023 09:12:29 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 f6-20020a17090ac28600b0023b9bf9eb63so8753249pjt.5; 
 Mon, 27 Mar 2023 06:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679922746;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vD3clw3JVdGa9oC9XYxYZAunXVlX+f0D0gOjgPJxem8=;
 b=frqm23H50pHzpkDdXGIIdb+XuAzADNjFe/KETRVqLoL0ZbcuYpOLxU83o3R2DPPa47
 68vMRMu6BUmCphPNTW4LCRMiGORryW2xIBykkYVjZeZXBkC1hH9HllRCTaD2g6SsXB85
 XYgKAghJaYgz+QIuucAsegIPEDOtBj5Rt7m8y7ax43Legrop8KG6hDfoejMnEz8/pzDE
 W7zb4eOixRDDTufuDY+wWgG552+21I77sHHHSZmo3n6QGMQDW6KI6S1va8fsq0aKK1Cp
 OQKP/fxuqrg0Iw4zuP2XBehlWy98dczUUW8FpzClWTU/7s1RxV1Nlefx+OE0ta9HuHwz
 tUFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679922746;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vD3clw3JVdGa9oC9XYxYZAunXVlX+f0D0gOjgPJxem8=;
 b=gWnNhYNWLzh53b/ghjFsOYIIiHG4yONZqEMS2ykuqrR/N7/QZ0G9/Jt1XpacY2CUO6
 DrIbj0844vhqRKqKlXGOkjhu90TX3gZ3h00mUinrgoVyI/kzsv7B1oBMMZAENxcFO6Mb
 8HLYCMC/UHmpACriAT/B0VY5grnm+LxYNdoMNAbecIt/gyaf34pNndrhJnriQDOiQUzZ
 38ry99GgyfqS4GTfaFyHA3paXajl5Du7Euw0UAALGeFotF39gs0RAxQARMRC8FyrNzuH
 sprbhv40CRZejyDcXTZDvSkb0/zKQvZ/oF0GkQy53MiP4X3I+p2DpjmyJcGjzjxaRiY2
 nIZQ==
X-Gm-Message-State: AAQBX9fJ//gxAzQnYcdRxp18NkRYHGTLqjbJmNxhRRlIfO7PblK7XaEf
 pj35ZynONqu5ylEf5kyqOxMvXIZBNvs=
X-Google-Smtp-Source: AKy350Z8HUjmwpd8Gp//SNyx2pJ2lIcTRwfqA/GNL9JaVuRXdT5e1b6ogEnu10NKdIkudVBMDkEQJg==
X-Received: by 2002:a17:90a:3:b0:233:f786:35ca with SMTP id
 3-20020a17090a000300b00233f78635camr12444564pja.35.1679922745663; 
 Mon, 27 Mar 2023 06:12:25 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.221.180.225])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a63f50c000000b0050bcf117643sm17301638pgh.17.2023.03.27.06.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 06:12:25 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>, qemu-devel@nongnu.org,
 Fabiano Rosas <farosas@suse.de>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 1/6] target/ppc: Fix width of some 32-bit SPRs
Date: Mon, 27 Mar 2023 23:12:13 +1000
Message-Id: <20230327131218.2721044-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x1034.google.com
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


