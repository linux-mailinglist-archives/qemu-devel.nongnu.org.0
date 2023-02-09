Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2357A690062
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 07:32:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ0SR-0007jj-3v; Thu, 09 Feb 2023 01:30:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pQ0S1-0007Xg-Hi
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 01:30:33 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pQ0Ry-0000mj-Bi
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 01:30:33 -0500
Received: by mail-pg1-x531.google.com with SMTP id 78so934377pgb.8
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 22:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MgwkEef7vxsb/V1HXgcHLlMSEMyA02TSLlxvE3Cow40=;
 b=BJp4gQFJur4hucyaYSCMV0vWmBA3IXMp/46pWJrHezGegEO6bIjfmI0loHUB1yMQ37
 P8Rsm8cIEWrlpYCniqF3ubP/WnTnSw9uvGUgjehPu5M2nLaDlFJL57ezNhw6uBdoFupt
 u7q3NXT7gtkZ9LgedS457rtDyzABbjW+lgAoszhQHYXzNBQ6UrEIhYZevcAUG1Sftq1v
 ujgXNqUnWhCaP2FQKCXqJnx9VpscJodcW3cwDV1PxIXocvswjrmeIm4h/z9WAZZC2EFA
 5sWG4sXxhh7QXLVHaon0VO16f9iW0LJ6SyyaqukE68Iyf9SsKIGbEIyXkdn3GmWB29D1
 S3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MgwkEef7vxsb/V1HXgcHLlMSEMyA02TSLlxvE3Cow40=;
 b=EXPwAJpEca5pKR5ylqyNUZk5G4JYZ+VUACPPFnNuFeyC+h/AOF/is4Ew/T9tleA0r8
 nS6pEIY6qkko9ZjYKhymA7cvp7p8z7itIcjiSECRQMBLcrRYHcReleXw/PId4Rlcbo4+
 BG+ftkkG0pU8GZTQ7fPMnQQ+ZesMiW4bb9as+vMWSZYNHE0FOWj8jH3vEz7mzo3pgFys
 3ya1+tUyPlvChwaMr97a+WeVbwpC1WdpkOxKKm2cJIs1vrE31vlF0ZyZBL06Cdr/ZUDI
 3Lcg8JaUvUn48x0anZS7tq5cRaAToQ4emBYv+o2pWxWQTgnqU+81u2EM7fed134I4cJI
 9hAg==
X-Gm-Message-State: AO0yUKXqqfFrw7LUQSwGV+Ge3YihACQKvffHSv7VPUSYVB+wddz7Ne9V
 uDxGdmkxPFoSYY2ho1Ppqo4cMlM1/+H8BFzM
X-Google-Smtp-Source: AK7set9P/26eCJIVugsXypbPsucHIQ7Hqq6zaq01bzPHVb5fOvd0SegnQS6U2Vb0FiJEChsi1siAjA==
X-Received: by 2002:aa7:9509:0:b0:594:26a7:cbd2 with SMTP id
 b9-20020aa79509000000b0059426a7cbd2mr1002962pfp.8.1675924228350; 
 Wed, 08 Feb 2023 22:30:28 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 u15-20020aa7848f000000b00593c434b1b8sm543649pfn.48.2023.02.08.22.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 22:30:27 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Deepak Gupta <debug@rivosinc.com>, Kip Walker <kip@rivosinc.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v1 RFC Zisslpcfi 5/9] target/riscv: state save and restore of
 zisslppcfi state
Date: Wed,  8 Feb 2023 22:29:43 -0800
Message-Id: <20230209062947.3585481-6-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230209062947.3585481-1-debug@rivosinc.com>
References: <20230209062947.3585481-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=debug@rivosinc.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

zisslpcfi's forward cfi if enabled on a hart, enables tracking of
indirect branches. CPU/hart internally keeps a state `elp` short
for expecting landing pad instruction. This state goes into
LP_EXPECTED on an indirect branch. But an interrupt/exception can occur
before target instruction is executed. In such a case this state must be
preserved so that it can be restored later. zisslpcfi saves elp state in
`sstatus` CSR. This patch saves elp state in sstatus CSR on trap delivery
while restores from sstatus CSR on trap return.

Additionally state in sstatus CSR must have save and restore zisslpcfi
state on exiting from hypervisor and entering into hypervisor.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Signed-off-by: Kip Walker  <kip@rivosinc.com>
---
 target/riscv/cpu_bits.h   |  5 +++++
 target/riscv/cpu_helper.c | 26 ++++++++++++++++++++++++++
 target/riscv/op_helper.c  | 12 ++++++++++++
 3 files changed, 43 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 1663ba5775..37100ec8f6 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -594,6 +594,11 @@ typedef enum {
 
 #define CFISTATUS_S_MASK    (SSTATUS_UFCFIEN | SSTATUS_UBCFIEN | \
                              SSTATUS_SPELP)
+/* enum for branch tracking state in cpu/hart */
+typedef enum {
+    NO_LP_EXPECTED = 0,
+    LP_EXPECTED = 1,
+} cfi_elp;
 
 /* hstatus CSR bits */
 #define HSTATUS_VSBE         0x00000020
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index a397023840..fc188683c9 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -534,6 +534,16 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
     if (riscv_has_ext(env, RVF)) {
         mstatus_mask |= MSTATUS_FS;
     }
+
+    /*
+     * If cfi extension available, menvcfg.CFI = 1 and henvcfg.CFI = 1,
+     * then apply CFI mask on mstatus
+     */
+    if (env_archcpu(env)->cfg.ext_cfi &&
+        get_field(env->menvcfg, MENVCFG_CFI) &&
+        get_field(env->henvcfg, HENVCFG_CFI)) {
+        mstatus_mask |= CFISTATUS_S_MASK;
+    }
     bool current_virt = riscv_cpu_virt_enabled(env);
 
     g_assert(riscv_has_ext(env, RVH));
@@ -1723,6 +1733,10 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     if (env->priv <= PRV_S &&
             cause < TARGET_LONG_BITS && ((deleg >> cause) & 1)) {
         /* handle the trap in S-mode */
+        /* save elp status */
+        if (cpu_get_fcfien(env)) {
+            env->mstatus = set_field(env->mstatus, MSTATUS_SPELP, env->elp);
+        }
         if (riscv_has_ext(env, RVH)) {
             uint64_t hdeleg = async ? env->hideleg : env->hedeleg;
 
@@ -1772,6 +1786,10 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         riscv_cpu_set_mode(env, PRV_S);
     } else {
         /* handle the trap in M-mode */
+        /* save elp status */
+        if (cpu_get_fcfien(env)) {
+            env->mstatus = set_field(env->mstatus, MSTATUS_MPELP, env->elp);
+        }
         if (riscv_has_ext(env, RVH)) {
             if (riscv_cpu_virt_enabled(env)) {
                 riscv_cpu_swap_hypervisor_regs(env);
@@ -1803,6 +1821,14 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         riscv_cpu_set_mode(env, PRV_M);
     }
 
+    /*
+     * Interrupt/exception/trap delivery is asynchronous event and as per
+     * Zisslpcfi spec CPU should clear up the ELP state. If cfi extension is
+     * available, clear ELP state.
+     */
+    if (cpu->cfg.ext_cfi) {
+        env->elp = NO_LP_EXPECTED;
+    }
     /* NOTE: it is not necessary to yield load reservations here. It is only
      * necessary for an SC from "another hart" to cause a load reservation
      * to be yielded. Refer to the memory consistency model section of the
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 878bcb03b8..d15893aa82 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -176,6 +176,12 @@ target_ulong helper_sret(CPURISCVState *env)
         riscv_cpu_set_virt_enabled(env, prev_virt);
     }
 
+    /* If forward cfi enabled for target, restore elp status */
+    if (cpu_get_fcfien(env)) {
+        env->elp = get_field(env->mstatus, MSTATUS_SPELP);
+        env->mstatus = set_field(env->mstatus, MSTATUS_SPELP, 0);
+    }
+
     riscv_cpu_set_mode(env, prev_priv);
 
     return retpc;
@@ -220,6 +226,12 @@ target_ulong helper_mret(CPURISCVState *env)
         riscv_cpu_set_virt_enabled(env, prev_virt);
     }
 
+    /* If forward cfi enabled for target, restore elp status */
+    if (cpu_get_fcfien(env)) {
+        env->elp = get_field(env->mstatus, MSTATUS_MPELP);
+        env->mstatus = set_field(env->mstatus, MSTATUS_MPELP, 0);
+    }
+
     return retpc;
 }
 
-- 
2.25.1


