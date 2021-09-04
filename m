Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7269E400DAC
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 02:13:48 +0200 (CEST)
Received: from localhost ([::1]:38028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMfn9-0003U9-IU
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 20:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfX9-00084m-T1
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:57:15 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:37846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfX7-0008Dm-7d
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:57:15 -0400
Received: by mail-wr1-x42d.google.com with SMTP id v10so4067115wrd.4
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 16:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ckzIrTOGwucKvNX/l+ogfKjL1PFJKsWDkPt+s6zjYCI=;
 b=lA+9iHko3Ovh78WSMU3zEHLFc2MPyYzzQVCIsN+IHi4Cx4B5nsIV1c8hYWvy3LSF+O
 amxIc1ggJR0LtCEIEGl3qXDZ1jnHcotbhkzZ9HizFbqm9GV5/tysrksWdRUKUhkUeZBl
 2rdTz20aGxXYDwPCZ20qq/8sEhZojtHux5jC4A910lasYZDI7XH3iP6F8SBAoQiXoSej
 u+s06oAN0BzkjIqioYquGj0DA3/Y5MEREclpvHQJxb9DIU6TWcSwE0qZtufdE+IeE/Y5
 G3ov2NfNvGmhHJdoRGPejU/V1GADxqMhApHN/vmBHJGn+d6vD10aUOElZIl4q3KNv6m3
 VcmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ckzIrTOGwucKvNX/l+ogfKjL1PFJKsWDkPt+s6zjYCI=;
 b=GnYor54+nYimvEmlKZ+Rh6+EeTU27okom5ZG026m02MVbMEMr77sSiRccpxXUUaReG
 frcmLHvlP3hjvmjo9atT/bEIUvGiaj3kbMuWI0qVmzwRMoLBtGAFTzQSUWvzN04aRRtY
 Z14VjySzha5ETwdCxSKagfPPVJNn7WurIXcNgpeVmA0apurFkfQYZWPx3F912sj69bm/
 6dRtM8YJuIcqM4ahitNuvozcKQqE3Fo2pf1877Ysi32rylc6FDpZ4MrYqtx2Sddu0ZLE
 PJVXd7E7VvovHf8yfqjdxtao8i5SABOZrLETJxenHKWxORDuEtp9p432oj6+DbxNwYAX
 A0wQ==
X-Gm-Message-State: AOAM531CpfEegrFT91IsGa/Mmpc3hEa/boZsjMexf4Byb8cx7+jMqAdP
 zWXUDLizb1k6kMzc06gUCHgXLan0/J4=
X-Google-Smtp-Source: ABdhPJwrTWI1zpRfnqsZWh3l1qnan3Qqy7/PU5H56XTshlWPe+1OXWql/dYZkaBnZ+wTmFZC/nl4Xw==
X-Received: by 2002:a5d:4d8c:: with SMTP id b12mr5784073wru.232.1630799830661; 
 Sat, 04 Sep 2021 16:57:10 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id q13sm3181245wmj.46.2021.09.04.16.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 16:57:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/24] target/ppc: Restrict cpu_exec_interrupt() handler to
 sysemu
Date: Sun,  5 Sep 2021 01:55:35 +0200
Message-Id: <20210904235542.1092641-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210904235542.1092641-1-f4bug@amsat.org>
References: <20210904235542.1092641-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict cpu_exec_interrupt() and its callees to sysemu.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/ppc/cpu.h         |  4 ++--
 target/ppc/cpu_init.c    |  2 +-
 target/ppc/excp_helper.c | 21 +++------------------
 3 files changed, 6 insertions(+), 21 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 500205229c0..362e7c4c5c7 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1254,8 +1254,6 @@ DECLARE_OBJ_CHECKERS(PPCVirtualHypervisor, PPCVirtualHypervisorClass,
                      PPC_VIRTUAL_HYPERVISOR, TYPE_PPC_VIRTUAL_HYPERVISOR)
 #endif /* CONFIG_USER_ONLY */
 
-void ppc_cpu_do_interrupt(CPUState *cpu);
-bool ppc_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void ppc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int ppc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
@@ -1271,6 +1269,8 @@ int ppc64_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
 int ppc32_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
                                int cpuid, void *opaque);
 #ifndef CONFIG_USER_ONLY
+void ppc_cpu_do_interrupt(CPUState *cpu);
+bool ppc_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void ppc_cpu_do_system_reset(CPUState *cs);
 void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, target_ulong vector);
 extern const VMStateDescription vmstate_ppc_cpu;
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index ad7abc6041a..6aad01d1d3a 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -9014,10 +9014,10 @@ static const struct SysemuCPUOps ppc_sysemu_ops = {
 
 static const struct TCGCPUOps ppc_tcg_ops = {
   .initialize = ppc_translate_init,
-  .cpu_exec_interrupt = ppc_cpu_exec_interrupt,
   .tlb_fill = ppc_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+  .cpu_exec_interrupt = ppc_cpu_exec_interrupt,
   .do_interrupt = ppc_cpu_do_interrupt,
   .cpu_exec_enter = ppc_cpu_exec_enter,
   .cpu_exec_exit = ppc_cpu_exec_exit,
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 7b6ac16eef7..d7e32ee107e 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -40,24 +40,8 @@
 
 /*****************************************************************************/
 /* Exception processing */
-#if defined(CONFIG_USER_ONLY)
-void ppc_cpu_do_interrupt(CPUState *cs)
-{
-    PowerPCCPU *cpu = POWERPC_CPU(cs);
-    CPUPPCState *env = &cpu->env;
+#if !defined(CONFIG_USER_ONLY)
 
-    cs->exception_index = POWERPC_EXCP_NONE;
-    env->error_code = 0;
-}
-
-static void ppc_hw_interrupt(CPUPPCState *env)
-{
-    CPUState *cs = env_cpu(env);
-
-    cs->exception_index = POWERPC_EXCP_NONE;
-    env->error_code = 0;
-}
-#else /* defined(CONFIG_USER_ONLY) */
 static inline void dump_syscall(CPUPPCState *env)
 {
     qemu_log_mask(CPU_LOG_INT, "syscall r0=%016" PRIx64
@@ -1113,7 +1097,6 @@ void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, target_ulong vector)
 
     powerpc_set_excp_state(cpu, vector, msr);
 }
-#endif /* !CONFIG_USER_ONLY */
 
 bool ppc_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
@@ -1130,6 +1113,8 @@ bool ppc_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     return false;
 }
 
+#endif /* !CONFIG_USER_ONLY */
+
 #if defined(DEBUG_OP)
 static void cpu_dump_rfi(target_ulong RA, target_ulong msr)
 {
-- 
2.31.1


