Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAC86C5C8A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 03:23:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfAba-00027r-Gx; Wed, 22 Mar 2023 22:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pfAbY-00027T-GK; Wed, 22 Mar 2023 22:23:04 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pfAbW-000853-LZ; Wed, 22 Mar 2023 22:23:04 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 o6-20020a17090a9f8600b0023f32869993so549608pjp.1; 
 Wed, 22 Mar 2023 19:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679538180;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YEz8aCZjcSRYRWc+Ad+zfuyeXpPHd8Gq49IbWEjv/c4=;
 b=kY3rJBSPBZT/eIbxW3bK4aJPdDt9+t3efomxXD9wJx7hDb9VuEvHqi+IaeF+kn/DhY
 IVCgRDPBqpN5emlgcIemWQJfld+oNVSu/ux/jb36FL65d1iYbl7YZuvKCHOS+hfcMmHG
 CTbF2KdaijkxJVIyHX6o+RhUegH2HbQZd/8IOKtB3iVOXEKRL9sWHbCFbVfUwyV8o9d8
 fKrozrZuiQsW/yA1r3ApU2Au/WmJWHDqOolowBHeeKv/AyyoI5QA+YmGu0v2AX8J2a4r
 Ep58575q20HZmfihHPOZfsGF85OYlsv/Lu5KZrKHpoTzZyqacptOT5PmtEQ93SrcsE+R
 imkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679538180;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YEz8aCZjcSRYRWc+Ad+zfuyeXpPHd8Gq49IbWEjv/c4=;
 b=HKFvv8JzvC0KE6rqPvp62hvO7u1ZYQCtFQn/urtZS0X8DMAPWAisLQNTIkD30ox9lC
 kZrlWTXeMYYhjNtttoolC3YQBBUTBIMFMmQVdo+Ab2QvjEEYSx8Xrj8fece9TB6dVs+8
 LoNtOTaNCe0hp+Ajtz0Wmo7QLF9xfQC3pmxNOTLgit0LclL3XSmsx8mP8Y5zUlqbtTc+
 wMDeZm35bllybW1nyg42xzfoVOw44UypWhJkEzJRJ9ACQn9+MrBruaX4iP3ayZhow3t3
 aDHZL5cQdbDvfByJ9uTQeWpP7IClj/nXRIG24JG+eFtAoQU3njNJw6lx6Ro7Vm7QheOu
 jiHg==
X-Gm-Message-State: AO0yUKVDAzCMQDTjHit0TzKX08x6ADJXLlUMap3ueEAmeavrcQciD47S
 WaUY1b4j96/3wuZcfZ+bdvAvq9OdHnps6Q==
X-Google-Smtp-Source: AK7set+O4gXTJqvGB7Z/FMFsugvJo2hVe1ufA5dX1idb6pEA40hVy5m54euoBqOAtCZSrPNXWu405g==
X-Received: by 2002:a17:902:d0d2:b0:19f:2e2b:3577 with SMTP id
 n18-20020a170902d0d200b0019f2e2b3577mr3806699pln.41.1679538180620; 
 Wed, 22 Mar 2023 19:23:00 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-215-123.tpgi.com.au. [61.68.215.123])
 by smtp.gmail.com with ESMTPSA id
 jc11-20020a17090325cb00b001a1abc93eabsm10609438plb.226.2023.03.22.19.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 19:23:00 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 6/6] target/ppc: Implement HEIR SPR
Date: Thu, 23 Mar 2023 12:22:37 +1000
Message-Id: <20230323022237.1807512-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230323022237.1807512-1-npiggin@gmail.com>
References: <20230323022237.1807512-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x1036.google.com
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

The hypervisor emulation assistance interrupt modifies HEIR to
contain the value of the instruction which caused the exception.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 target/ppc/cpu.h         |  1 +
 target/ppc/cpu_init.c    | 23 +++++++++++++++++++++++
 target/ppc/excp_helper.c | 12 +++++++++++-
 3 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 557d736dab..8c4a203ecb 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1653,6 +1653,7 @@ void ppc_compat_add_property(Object *obj, const char *name,
 #define SPR_HMER              (0x150)
 #define SPR_HMEER             (0x151)
 #define SPR_PCR               (0x152)
+#define SPR_HEIR              (0x153)
 #define SPR_BOOKE_LPIDR       (0x152)
 #define SPR_BOOKE_TCR         (0x154)
 #define SPR_BOOKE_TLB0PS      (0x158)
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 5aa0b3f0f1..ff73be1812 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -1629,6 +1629,7 @@ static void register_8xx_sprs(CPUPPCState *env)
  * HSRR0   => SPR 314 (Power 2.04 hypv)
  * HSRR1   => SPR 315 (Power 2.04 hypv)
  * LPIDR   => SPR 317 (970)
+ * HEIR    => SPR 339 (Power 2.05 hypv) (64-bit reg from 3.1)
  * EPR     => SPR 702 (Power 2.04 emb)
  * perf    => 768-783 (Power 2.04)
  * perf    => 784-799 (Power 2.04)
@@ -5522,6 +5523,24 @@ static void register_power6_common_sprs(CPUPPCState *env)
                  0x00000000);
 }
 
+static void register_HEIR32_spr(CPUPPCState *env)
+{
+    spr_register_hv(env, SPR_HEIR, "HEIR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic32,
+                 0x00000000);
+}
+
+static void register_HEIR64_spr(CPUPPCState *env)
+{
+    spr_register_hv(env, SPR_HEIR, "HEIR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+}
+
 static void register_power8_tce_address_control_sprs(CPUPPCState *env)
 {
     spr_register_kvm(env, SPR_TAR, "TAR",
@@ -5950,6 +5969,7 @@ static void init_proc_POWER7(CPUPPCState *env)
     register_power5p_ear_sprs(env);
     register_power5p_tb_sprs(env);
     register_power6_common_sprs(env);
+    register_HEIR32_spr(env);
     register_power6_dbg_sprs(env);
     register_power7_book4_sprs(env);
 
@@ -6072,6 +6092,7 @@ static void init_proc_POWER8(CPUPPCState *env)
     register_power5p_ear_sprs(env);
     register_power5p_tb_sprs(env);
     register_power6_common_sprs(env);
+    register_HEIR32_spr(env);
     register_power6_dbg_sprs(env);
     register_power8_tce_address_control_sprs(env);
     register_power8_ids_sprs(env);
@@ -6234,6 +6255,7 @@ static void init_proc_POWER9(CPUPPCState *env)
     register_power5p_ear_sprs(env);
     register_power5p_tb_sprs(env);
     register_power6_common_sprs(env);
+    register_HEIR32_spr(env);
     register_power6_dbg_sprs(env);
     register_power8_tce_address_control_sprs(env);
     register_power8_ids_sprs(env);
@@ -6409,6 +6431,7 @@ static void init_proc_POWER10(CPUPPCState *env)
     register_power5p_ear_sprs(env);
     register_power5p_tb_sprs(env);
     register_power6_common_sprs(env);
+    register_HEIR64_spr(env);
     register_power6_dbg_sprs(env);
     register_power8_tce_address_control_sprs(env);
     register_power8_ids_sprs(env);
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 2e0321ab69..d206903562 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1614,13 +1614,23 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_HDECR:     /* Hypervisor decrementer exception         */
     case POWERPC_EXCP_HDSI:      /* Hypervisor data storage exception        */
     case POWERPC_EXCP_SDOOR_HV:  /* Hypervisor Doorbell interrupt            */
-    case POWERPC_EXCP_HV_EMU:
     case POWERPC_EXCP_HVIRT:     /* Hypervisor virtualization                */
         srr0 = SPR_HSRR0;
         srr1 = SPR_HSRR1;
         new_msr |= (target_ulong)MSR_HVB;
         new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
         break;
+    case POWERPC_EXCP_HV_EMU:
+        env->spr[SPR_HEIR] = insn;
+        if (is_prefix_excp(env, insn)) {
+            uint32_t insn2 = ppc_ldl_code(env, env->nip + 4);
+            env->spr[SPR_HEIR] |= (uint64_t)insn2 << 32;
+        }
+        srr0 = SPR_HSRR0;
+        srr1 = SPR_HSRR1;
+        new_msr |= (target_ulong)MSR_HVB;
+        new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
+        break;
     case POWERPC_EXCP_VPU:       /* Vector unavailable exception             */
     case POWERPC_EXCP_VSXU:       /* VSX unavailable exception               */
     case POWERPC_EXCP_FU:         /* Facility unavailable exception          */
-- 
2.37.2


