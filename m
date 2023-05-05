Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 510656F86DE
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 18:36:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puyOd-0000V0-BH; Fri, 05 May 2023 12:35:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1puyOb-0000Tm-5k; Fri, 05 May 2023 12:35:01 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1puyOY-0004t3-7M; Fri, 05 May 2023 12:35:00 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-195c83a9ed8so328740fac.0; 
 Fri, 05 May 2023 09:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683304496; x=1685896496;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eHy0HJQ1lV3HX5R5N57n1GwLHd91WYmU4Ru7Dfuq1AI=;
 b=hsvCSTZQ8JKyN+TwBSdQPH84rtJPCr7cMfzWfK1pqfBB6BLJ+k4X5ImrDu8AD4kEFz
 TCHveGhFOPNvVY2Ybwt3uX0ujb/mf0Gw4QxhudHt/VVC6/1Y1djIM1ESWW1PfR2G6pIi
 aYEJH98PmKWrWr08kzu4CC2pgbueUAZWonivIdzxg8nJTveijiuIxp9E7bRg3bvbX/ai
 zuO5aZMcFGc6CFb6MSfnjCBK8xYVDTQ6+b710lANRSyUHb4awnfBHRTxh8BkfKuNqR3b
 fzYGDsk50OyVm6qi5ol5Ao+1vNdxnKkBKQOfwY8AL2JD2KPHaSfz5Vp1Y7iO8JKyVthj
 Y6ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683304496; x=1685896496;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eHy0HJQ1lV3HX5R5N57n1GwLHd91WYmU4Ru7Dfuq1AI=;
 b=EnOtPC8MCqBHuOdMm6GFO8hhxvnAEYtJfsAlmK3GS5CivHA9tSZMeLxNubYLULLV9L
 7ENYoFJD+QSIHT+8JIIdtwnRTiuSSa9xAJA9wKvjaahqdFxqa6Aw2IOnicU0JDIr8pKd
 617vJOk30ijCezaRhWLiyiuWrEeiSuJyzL9tYr1ZNSU1VvGPslh1H56rlsxhJLDb5p0w
 BLaWnyTSf3NWCUF7M+PoajZmonSQrFh08m6RQaSVmd7FW91oyxAGBmDQqYc+FGVb3Nia
 OehMBwPdwaEtqnwxchVQhDxZlafH2+IobPHJFP08/h0p6CCWmWrAjEi972c9jq17aFhY
 8IMw==
X-Gm-Message-State: AC+VfDzsLkqXlJvf8ttTNuaUocR5HWLaT5cQWb+eg6swXN5jfzQrgT9Y
 uFRcMhKpDzNyiYcF9D15LCh4gs/gcF0=
X-Google-Smtp-Source: ACHHUZ7qKeyf7lhRJ3r+1Ev9gJDLrmAxVYmVwE8JjlNxCP+vncPG5GDjk4QEBslvbx9CNyjyNnCWNQ==
X-Received: by 2002:a05:6870:98a7:b0:18c:988a:72dd with SMTP id
 eg39-20020a05687098a700b0018c988a72ddmr1397530oab.33.1683304495798; 
 Fri, 05 May 2023 09:34:55 -0700 (PDT)
Received: from grind.. (189-46-207-53.dsl.telesp.net.br. [189.46.207.53])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a9d62c3000000b006a43519523fsm1033475otk.1.2023.05.05.09.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 09:34:55 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Fabiano Rosas <farosas@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 2/6] ppc: spapr: cleanup cr get/set with helpers.
Date: Fri,  5 May 2023 13:34:40 -0300
Message-Id: <20230505163444.347006-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230505163444.347006-1-danielhb413@gmail.com>
References: <20230505163444.347006-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Harsh Prateek Bora <harshpb@linux.ibm.com>

The bits in cr reg are grouped into eight 4-bit fields represented
by env->crf[8] and the related calculations should be abstracted to
keep the calling routines simpler to read. This is a step towards
cleaning up the related/calling code for better readability.

Signed-off-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230503093619.2530487-2-harshpb@linux.ibm.com>
[danielhb: add 'const' modifier to fix linux-user build]
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_hcall.c      | 18 ++----------------
 linux-user/elfload.c      |  4 +---
 linux-user/ppc/signal.c   |  9 ++-------
 target/ppc/cpu.c          | 17 +++++++++++++++++
 target/ppc/cpu.h          |  2 ++
 target/ppc/gdbstub.c      | 22 ++++------------------
 target/ppc/kvm.c          | 13 ++-----------
 target/ppc/ppc-qmp-cmds.c |  6 +-----
 8 files changed, 31 insertions(+), 60 deletions(-)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index ec4def62f8..1c102c8c0d 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1566,8 +1566,6 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
     struct kvmppc_hv_guest_state hv_state;
     struct kvmppc_pt_regs *regs;
     hwaddr len;
-    uint64_t cr;
-    int i;
 
     if (spapr->nested_ptcr == 0) {
         return H_NOT_AVAILABLE;
@@ -1616,12 +1614,7 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
     env->lr = regs->link;
     env->ctr = regs->ctr;
     cpu_write_xer(env, regs->xer);
-
-    cr = regs->ccr;
-    for (i = 7; i >= 0; i--) {
-        env->crf[i] = cr & 15;
-        cr >>= 4;
-    }
+    ppc_set_cr(env, regs->ccr);
 
     env->msr = regs->msr;
     env->nip = regs->nip;
@@ -1698,8 +1691,6 @@ void spapr_exit_nested(PowerPCCPU *cpu, int excp)
     struct kvmppc_hv_guest_state *hvstate;
     struct kvmppc_pt_regs *regs;
     hwaddr len;
-    uint64_t cr;
-    int i;
 
     assert(spapr_cpu->in_nested);
 
@@ -1757,12 +1748,7 @@ void spapr_exit_nested(PowerPCCPU *cpu, int excp)
     regs->link = env->lr;
     regs->ctr = env->ctr;
     regs->xer = cpu_read_xer(env);
-
-    cr = 0;
-    for (i = 0; i < 8; i++) {
-        cr |= (env->crf[i] & 15) << (4 * (7 - i));
-    }
-    regs->ccr = cr;
+    regs->ccr = ppc_get_cr(env);
 
     if (excp == POWERPC_EXCP_MCHECK ||
         excp == POWERPC_EXCP_RESET ||
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index f1370a7a8b..703f7434a0 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -961,9 +961,7 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUPPCState *en
     (*regs)[36] = tswapreg(env->lr);
     (*regs)[37] = tswapreg(cpu_read_xer(env));
 
-    for (i = 0; i < ARRAY_SIZE(env->crf); i++) {
-        ccr |= env->crf[i] << (32 - ((i + 1) * 4));
-    }
+    ccr = ppc_get_cr(env);
     (*regs)[38] = tswapreg(ccr);
 }
 
diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
index 07729c1653..a616f20efb 100644
--- a/linux-user/ppc/signal.c
+++ b/linux-user/ppc/signal.c
@@ -243,9 +243,7 @@ static void save_user_regs(CPUPPCState *env, struct target_mcontext *frame)
     __put_user(env->lr, &frame->mc_gregs[TARGET_PT_LNK]);
     __put_user(cpu_read_xer(env), &frame->mc_gregs[TARGET_PT_XER]);
 
-    for (i = 0; i < ARRAY_SIZE(env->crf); i++) {
-        ccr |= env->crf[i] << (32 - ((i + 1) * 4));
-    }
+    ccr = ppc_get_cr(env);
     __put_user(ccr, &frame->mc_gregs[TARGET_PT_CCR]);
 
     /* Save Altivec registers if necessary.  */
@@ -335,10 +333,7 @@ static void restore_user_regs(CPUPPCState *env,
     cpu_write_xer(env, xer);
 
     __get_user(ccr, &frame->mc_gregs[TARGET_PT_CCR]);
-    for (i = 0; i < ARRAY_SIZE(env->crf); i++) {
-        env->crf[i] = (ccr >> (32 - ((i + 1) * 4))) & 0xf;
-    }
-
+    ppc_set_cr(env, ccr);
     if (!sig) {
         env->gpr[2] = save_r2;
     }
diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
index 1a97b41c6b..424f2e1741 100644
--- a/target/ppc/cpu.c
+++ b/target/ppc/cpu.c
@@ -67,6 +67,23 @@ uint32_t ppc_get_vscr(CPUPPCState *env)
     return env->vscr | (sat << VSCR_SAT);
 }
 
+void ppc_set_cr(CPUPPCState *env, uint64_t cr)
+{
+    for (int i = 7; i >= 0; i--) {
+        env->crf[i] = cr & 0xf;
+        cr >>= 4;
+    }
+}
+
+uint64_t ppc_get_cr(const CPUPPCState *env)
+{
+    uint64_t cr = 0;
+    for (int i = 0; i < 8; i++) {
+        cr |= (env->crf[i] & 0xf) << (4 * (7 - i));
+    }
+    return cr;
+}
+
 /* GDBstub can read and write MSR... */
 void ppc_store_msr(CPUPPCState *env, target_ulong value)
 {
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 557d736dab..1c02596d9f 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2773,6 +2773,8 @@ void dump_mmu(CPUPPCState *env);
 void ppc_maybe_bswap_register(CPUPPCState *env, uint8_t *mem_buf, int len);
 void ppc_store_vscr(CPUPPCState *env, uint32_t vscr);
 uint32_t ppc_get_vscr(CPUPPCState *env);
+void ppc_set_cr(CPUPPCState *env, uint64_t cr);
+uint64_t ppc_get_cr(const CPUPPCState *env);
 
 /*****************************************************************************/
 /* Power management enable checks                                            */
diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index d2bc1d7c53..63c9abe4f1 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -145,11 +145,7 @@ int ppc_cpu_gdb_read_register(CPUState *cs, GByteArray *buf, int n)
             break;
         case 66:
             {
-                uint32_t cr = 0;
-                int i;
-                for (i = 0; i < 8; i++) {
-                    cr |= env->crf[i] << (32 - ((i + 1) * 4));
-                }
+                uint32_t cr = ppc_get_cr(env);
                 gdb_get_reg32(buf, cr);
                 break;
             }
@@ -203,11 +199,7 @@ int ppc_cpu_gdb_read_register_apple(CPUState *cs, GByteArray *buf, int n)
             break;
         case 66 + 32:
             {
-                uint32_t cr = 0;
-                int i;
-                for (i = 0; i < 8; i++) {
-                    cr |= env->crf[i] << (32 - ((i + 1) * 4));
-                }
+                uint32_t cr = ppc_get_cr(env);
                 gdb_get_reg32(buf, cr);
                 break;
             }
@@ -257,10 +249,7 @@ int ppc_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
         case 66:
             {
                 uint32_t cr = ldl_p(mem_buf);
-                int i;
-                for (i = 0; i < 8; i++) {
-                    env->crf[i] = (cr >> (32 - ((i + 1) * 4))) & 0xF;
-                }
+                ppc_set_cr(env, cr);
                 break;
             }
         case 67:
@@ -307,10 +296,7 @@ int ppc_cpu_gdb_write_register_apple(CPUState *cs, uint8_t *mem_buf, int n)
         case 66 + 32:
             {
                 uint32_t cr = ldl_p(mem_buf);
-                int i;
-                for (i = 0; i < 8; i++) {
-                    env->crf[i] = (cr >> (32 - ((i + 1) * 4))) & 0xF;
-                }
+                ppc_set_cr(env, cr);
                 break;
             }
         case 67 + 32:
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 78f6fc50cd..336e663bc3 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -927,10 +927,7 @@ int kvm_arch_put_registers(CPUState *cs, int level)
         regs.gpr[i] = env->gpr[i];
     }
 
-    regs.cr = 0;
-    for (i = 0; i < 8; i++) {
-        regs.cr |= (env->crf[i] & 15) << (4 * (7 - i));
-    }
+    regs.cr = ppc_get_cr(env);
 
     ret = kvm_vcpu_ioctl(cs, KVM_SET_REGS, &regs);
     if (ret < 0) {
@@ -1205,7 +1202,6 @@ int kvm_arch_get_registers(CPUState *cs)
     PowerPCCPU *cpu = POWERPC_CPU(cs);
     CPUPPCState *env = &cpu->env;
     struct kvm_regs regs;
-    uint32_t cr;
     int i, ret;
 
     ret = kvm_vcpu_ioctl(cs, KVM_GET_REGS, &regs);
@@ -1213,12 +1209,7 @@ int kvm_arch_get_registers(CPUState *cs)
         return ret;
     }
 
-    cr = regs.cr;
-    for (i = 7; i >= 0; i--) {
-        env->crf[i] = cr & 15;
-        cr >>= 4;
-    }
-
+    ppc_set_cr(env, regs.cr);
     env->ctr = regs.ctr;
     env->lr = regs.lr;
     cpu_write_xer(env, regs.xer);
diff --git a/target/ppc/ppc-qmp-cmds.c b/target/ppc/ppc-qmp-cmds.c
index 36e5b5eff8..f9acc21056 100644
--- a/target/ppc/ppc-qmp-cmds.c
+++ b/target/ppc/ppc-qmp-cmds.c
@@ -37,12 +37,8 @@ static target_long monitor_get_ccr(Monitor *mon, const struct MonitorDef *md,
 {
     CPUArchState *env = mon_get_cpu_env(mon);
     unsigned int u;
-    int i;
 
-    u = 0;
-    for (i = 0; i < 8; i++) {
-        u |= env->crf[i] << (32 - (4 * (i + 1)));
-    }
+    u = ppc_get_cr(env);
 
     return u;
 }
-- 
2.40.1


