Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1776CA54F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 15:13:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgmeb-0006X4-Md; Mon, 27 Mar 2023 09:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pgmeU-0006R1-IX; Mon, 27 Mar 2023 09:12:49 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pgmeS-00018D-CA; Mon, 27 Mar 2023 09:12:46 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 fy10-20020a17090b020a00b0023b4bcf0727so8791367pjb.0; 
 Mon, 27 Mar 2023 06:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679922762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=avdBuU0PTVH+NPw2m7B7nROfO4MKkIro1XNd6foKyk0=;
 b=iLwQQOeVQytIj5NLPXUNYbVKFD9b9wJFT2NUr8f0pBENRHafXU1Z4jd3klNv5MvbyF
 kj36LmUX3P9cRLKYZrn3eIsMFvlxZ9UXsfo80vKt05s9hfrJrDXXUqztrZwUd4hZl//K
 cvsgbfVuGL/xjo0BkOUMRamqwXQcdAOIMhT+dcd6vyZRkQj4WrxAXeU+Hqf5C8nYfQZI
 opVe3/KrW0LB5mqQXjYRVHKTPKu2KQiEupBKwABheeIUepQcgBBFFGbbDQbbdhQpNp4p
 HkXY6S2JNjUYxwOW+vYxLzwn+ZKeVO6Fa7DsPvRxrtvsK35xm9yLrEJ6VIgkZNrGAQNM
 jJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679922762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=avdBuU0PTVH+NPw2m7B7nROfO4MKkIro1XNd6foKyk0=;
 b=yb/4FYf2k/zVSTldr9O7exI+Vnsvvkk0poR/uUZdQbiUu/Aph+63f/Vfke5G/Ch2Hw
 KJ1qUFaf4CFAW6Io1OW8IIOnKtlnp3CGc200e38xrGc5wVGTBPoWMqUiFR1+4eAMUKsU
 E6j2nluNDaB7Ek1z2zt0eFK93Dlnqp2mEOhFts6zTpserR4K83swQOT4RMGXQlD95CeP
 cty5N630N8LiUkcNah3RkbE+g3TiTy6mKvLhZhh2AZn6vYyiJHOWvYI1l8J7rsinw3t1
 HZL0++uA5Zi8iucF6vsiGGc/FNnuTWc5ivqlvv5lf9u4kHebii/PcTgdHRdE6hyDthwB
 VmQQ==
X-Gm-Message-State: AAQBX9fuVTsJblFzN3YlysvrPtaWdnYmk0S0hIBr0foeW2n7RKwKnhZP
 EAqhARxRqAyEqHsC2/5i0gag0Nj7tVE=
X-Google-Smtp-Source: AKy350YWlg1dMCmlTkpvPr0Ws6ZCmdpkZmXQKny6IN3eV0xdYSTgmsi/4k1k7Zfe8vNh+QKOSms+iA==
X-Received: by 2002:a17:903:32d1:b0:1a1:80ea:4352 with SMTP id
 i17-20020a17090332d100b001a180ea4352mr12580664plr.0.1679922761688; 
 Mon, 27 Mar 2023 06:12:41 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.221.180.225])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a63f50c000000b0050bcf117643sm17301638pgh.17.2023.03.27.06.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 06:12:41 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>, qemu-devel@nongnu.org,
 Fabiano Rosas <farosas@suse.de>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 6/6] target/ppc: Implement HEIR SPR
Date: Mon, 27 Mar 2023 23:12:18 +1000
Message-Id: <20230327131218.2721044-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230327131218.2721044-1-npiggin@gmail.com>
References: <20230327131218.2721044-1-npiggin@gmail.com>
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
index 4e119c4dfc..84f222ba1d 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1596,13 +1596,23 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
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


