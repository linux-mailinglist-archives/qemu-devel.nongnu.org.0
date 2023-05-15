Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C94AD70287F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 11:28:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyUUU-0004n0-7M; Mon, 15 May 2023 05:27:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pyUUQ-0004it-Nx; Mon, 15 May 2023 05:27:34 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pyUUP-0002uw-1M; Mon, 15 May 2023 05:27:34 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-64ac461af60so3714082b3a.3; 
 Mon, 15 May 2023 02:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684142851; x=1686734851;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+NbL0Ik4ps0LTyNiuqnemtkETX8V8tJp2mM1329chhs=;
 b=MEMMmooPupLitljCyBz8zPOAqYZ377JXKiRNE+YxKQUU+jig2oSxY8QYi1N6ZmSHJ4
 SzGpfDRid0QdTt+0qhLD+FNjXb8Wr9EPf1/I0BMttNsi4gAzFWIxVmCAcy+GvW6Er4uR
 90gF7QNqR6fm7pny7jIY2Oxat1+IxO/3qEnRToF1n6iSuUufC3oPB05b6MXFbbNZC9KI
 w13YLiyHxTYGxM37mnko1gzvWYB6iDDuMtxJaD89RJOVrcp5QQM9acviDhaWeSlghLxe
 8msBAvE3XA6xoEeknj1nn3jvJ5QJWFf/N4w2Emg4MOGb/8+UFiH+rntWlPHwwilSM9EK
 vy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684142851; x=1686734851;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+NbL0Ik4ps0LTyNiuqnemtkETX8V8tJp2mM1329chhs=;
 b=AOgmyN/Kj2z1Q/bdodM9UtIMVLtUPE/pdowYnvZX0SCioFjxFdC8NqLyIe56AgZeFK
 +IZoZbau3umcOHRb0Cs+3RIUOsIajfH/Lt2H8eyjlhkSQpVcttycsYHU+wVZAAZj+lLj
 kf76RYMesBVSeBwdexaDPL99aBhHxPE+cS0XgV2F0IdsK7y9XDXeykhteFc7qH6q5vrr
 +19WLiMDAi6um6kWd9ycyCewT5+Il7B7Ufk8NOH7z3ue4nm2k7YFGw5keJ5z+68tCtU3
 BMubn+eAnV9FbNdQCTsKofe7IpGwPu6IXN2AwwZS3WYsjtzhpd0WkVbOez69zeiJwKzl
 dAcg==
X-Gm-Message-State: AC+VfDyNS2P4oS8raxu+sfrabfUR+cMAVdv0QS+n+tf5HY82G2T6R8Jf
 btBNfk3uvm6o2Z0IQRCT6Y+jRiEr1EM=
X-Google-Smtp-Source: ACHHUZ7q5I7RHbVgn+AXTI4aG9JCG0epYE2fgdxuIB4nL7nv+8ABXjVSB1vgvUMI7KGnNxJY6ZoeWw==
X-Received: by 2002:a05:6a20:2588:b0:103:377e:439e with SMTP id
 k8-20020a056a20258800b00103377e439emr23671176pzd.60.1684142850823; 
 Mon, 15 May 2023 02:27:30 -0700 (PDT)
Received: from wheely.local0.net ([202.168.30.146])
 by smtp.gmail.com with ESMTPSA id
 n20-20020aa79054000000b006466f0be263sm11387818pfo.73.2023.05.15.02.27.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 02:27:30 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>, qemu-devel@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Michael Neuling <mikey@neuling.org>
Subject: [PATCH v3 7/9] target/ppc: Implement HEIR SPR
Date: Mon, 15 May 2023 19:26:53 +1000
Message-Id: <20230515092655.171206-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515092655.171206-1-npiggin@gmail.com>
References: <20230515092655.171206-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x434.google.com
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

The hypervisor emulation assistance interrupt modifies HEIR to
contain the value of the instruction which caused the exception.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Since v2:
- Fix ordering of prefix/suffix words in the register, as pointed
  out by Mikey.

 target/ppc/cpu.h         |  1 +
 target/ppc/cpu_init.c    | 23 +++++++++++++++++++++++
 target/ppc/excp_helper.c | 13 ++++++++++++-
 3 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 1c02596d9f..73851aa7a3 100644
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
index 27d321c15f..529a4513a3 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1608,13 +1608,24 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
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
+            env->spr[SPR_HEIR] <<= 32;
+            env->spr[SPR_HEIR] |= insn2;
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
2.40.1


