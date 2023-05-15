Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7910E702883
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 11:28:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyUUH-0004Zu-1r; Mon, 15 May 2023 05:27:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pyUUB-0004XU-Ar; Mon, 15 May 2023 05:27:19 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pyUU5-0002r3-Et; Mon, 15 May 2023 05:27:19 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-643557840e4so13550337b3a.2; 
 Mon, 15 May 2023 02:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684142830; x=1686734830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EG+uChkRqLpCa9UFio/Pn/5mI33HfT5FXVHJcPdnIWU=;
 b=UOm2+naf+zegV0TgIKnARb0WI3mdAGFUtVqmWioWjrKIcGxz7TX2qIiIATQuW1b5iT
 wlzn4tZWtlkaE92MUEmkww8JgHi4bRRMqEeU3FgsxYao8SbA0XqHCkHSn+7YdEKn/QTb
 1nFgWENUfBU/18sPYNCY28oLn6ztsuT4ckGd2erPshw+fPVcVZS5zZsZNg5SZijAi4hf
 3SJKtO4kSaxdhAviD9pj8Wue2tDJaAx9c0qIxmxjkhAe9E/TwQ0qzhkj5G92TQrLZ8M3
 hADWJ9B50N2ETh+JIw/YP7o5VvQFhS9jqn0HBNjs+RehebQe/gC/IP+5t0HVoWJNckqY
 75Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684142830; x=1686734830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EG+uChkRqLpCa9UFio/Pn/5mI33HfT5FXVHJcPdnIWU=;
 b=MvyovL8sKJ1XPjpWsKSzp/G/hKkmZwsjD23Ed7IrZKkLp+Ngk8hSk5wAT9nQnpinsq
 Xn0LJysdVRdhnPAyl3NXWGFhZBelmifi4Au8d7hgC2U54sceB01yUqyQTg9kkuSXdVQU
 Faz055P90Ph3IgjAo87vt8wn5gjC900gYYwnVNbAQ0rg87IMBAvwIjacYEc2+zxNiDiX
 vgRUGpbqCb0woAW1Jj3jh72eUM2wGWDjGSDMfCV7I2aZctsCtsigz7Vve5l/jfjEEhf5
 jxmlnqKZujzXfksrDygUX569z8GOHIi0EDZxlVwR5Q2tfHTl7zC//JWFrYKul6vr9aJB
 5bwA==
X-Gm-Message-State: AC+VfDwtxSzGBhYP/Wnd6nw/uQduSaV82L5QSvW7fxgpTQ6gPUqcPKza
 AJVt2+U1WOVCrUedMPggZtT+H/cgLnA=
X-Google-Smtp-Source: ACHHUZ7dOEHOooQiE6/TPGORZKLc0iVey8ySsOAPAW9i+9JuK2PiM2b5/HRW+1d42I2nBEzcssFspw==
X-Received: by 2002:a05:6a00:a15:b0:647:5409:5d0b with SMTP id
 p21-20020a056a000a1500b0064754095d0bmr32060584pfh.19.1684142830572; 
 Mon, 15 May 2023 02:27:10 -0700 (PDT)
Received: from wheely.local0.net ([202.168.30.146])
 by smtp.gmail.com with ESMTPSA id
 n20-20020aa79054000000b006466f0be263sm11387818pfo.73.2023.05.15.02.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 02:27:10 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>, qemu-devel@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 1/9] target/ppc: Fix width of some 32-bit SPRs
Date: Mon, 15 May 2023 19:26:47 +1000
Message-Id: <20230515092655.171206-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515092655.171206-1-npiggin@gmail.com>
References: <20230515092655.171206-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Since v2: no change.

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
index f603f1a939..c03a6bdc9a 100644
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
2.40.1


