Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E27B8418317
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 17:14:17 +0200 (CEST)
Received: from localhost ([::1]:34362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU9NY-0004Op-T5
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 11:14:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU93e-0002KN-T9; Sat, 25 Sep 2021 10:53:42 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU93c-0006kC-7X; Sat, 25 Sep 2021 10:53:42 -0400
Received: by mail-wr1-x430.google.com with SMTP id d6so36342982wrc.11;
 Sat, 25 Sep 2021 07:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7WPGnjIwDqq9FNiuzjIUo9e3oGnINOP8qAvzXoIP118=;
 b=Iiz4vQh/m+lhAO95wYxFN05EsZO6PTARpNzm5HlbcZlCXv0zBbPgjlpBKW0i9tOyNE
 RP0WY4YnokBM7SAof7fDjLljH00iGViqaacNbPQy0Y5hVdLF1oT0ft8+9ozkynQoMZd4
 9g8c4Tpzo/SynMpBFQCpozVssqbSXgAKuxr3CF1JqNAI828s/PrQJNP7bWCXaBDyPI5o
 bulQrLTpygOUIBrsvBMO/QyidZfigzYHK1DU+ezAt/tmW03g1iJpDhVVP7z54uzo/Kdm
 BaBtb+hbqa8cD8af8tdAG7itWbrphK/OykAJUwqtbidndv8LygfmyDlwq1Os0Pl/VwVa
 wh6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7WPGnjIwDqq9FNiuzjIUo9e3oGnINOP8qAvzXoIP118=;
 b=j0CZCaCja+UbiPWU5vYfhBqionOXpiMzXEOiKjf2k71PN8mBpd3KL12DIiUfxbXA30
 z+VpRealMoO6TMfEnmjAbsXp/XkhJZV2QiaSf19JeY/4aISaRGRddHF+9jBcllPblEnX
 6kWk6+bDtJFH6Kj+ettTHveXVJsCoDOeORXc8UPO4oAqPiyo+oI3ua+KzJ+zghjlJjG3
 ZkToCegGv8fXg2z8M4er/1HYilAEvRTPpJhLD2SNWdm1756L4oZeYL12dClbrg+2IlKK
 6ofVXfjSFPC9msx0O7FBOTzepB7YyWjry1UGnAaoDaKX+viq3JSBCUMVeZzh52UCJyWC
 hYrA==
X-Gm-Message-State: AOAM533pKG7gNoiVfzNgNpzjRVkWt2eNa4TrXnZrCiH0tiPDqq1dpLyQ
 n+u0eJhF2160jBJmbYVkvIWnZ1ykQks=
X-Google-Smtp-Source: ABdhPJwszQjjnXnsiwMnGsLWmfMFJDb0i6N4HyFEVJ0rcCKX6VS8U592pjH05jYt/1cfzSlgS79udQ==
X-Received: by 2002:a5d:4481:: with SMTP id j1mr17638463wrq.6.1632581618107;
 Sat, 25 Sep 2021 07:53:38 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 f1sm11616153wrc.66.2021.09.25.07.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 07:53:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 29/40] target/ppc: Introduce PowerPCCPUClass::has_work()
Date: Sat, 25 Sep 2021 16:51:07 +0200
Message-Id: <20210925145118.1361230-30-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925145118.1361230-1-f4bug@amsat.org>
References: <20210925145118.1361230-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Greg Kurz <groug@kaod.org>, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're moving the hook from CPUState to TCGCPUOps. TCGCPUOps is
a const structure, so to avoid creating multiple versions of
the same structure, simply changing the has_work() handler,
introduce yet another indirection with a has_work() handler in
PowerPCCPUClass, and ppc_cpu_has_work() method which dispatch
to it.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/ppc/cpu-qom.h  |  1 +
 target/ppc/cpu_init.c | 23 ++++++++++++++---------
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 5800fa324e8..36110112506 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -188,6 +188,7 @@ struct PowerPCCPUClass {
     uint32_t flags;
     int bfd_mach;
     uint32_t l1_dcache_size, l1_icache_size;
+    bool (*has_work)(CPUState *cpu);
 #ifndef CONFIG_USER_ONLY
     unsigned int gdb_num_sprs;
     const char *gdb_spr_xml;
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 6aad01d1d3a..2f7d262b176 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7621,7 +7621,6 @@ POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
     PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-    CPUClass *cc = CPU_CLASS(oc);
 
     dc->fw_name = "PowerPC,POWER7";
     dc->desc = "POWER7";
@@ -7630,7 +7629,7 @@ POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
     pcc->pcr_supported = PCR_COMPAT_2_06 | PCR_COMPAT_2_05;
     pcc->init_proc = init_proc_POWER7;
     pcc->check_pow = check_pow_nocheck;
-    cc->has_work = cpu_has_work_POWER7;
+    pcc->has_work = cpu_has_work_POWER7;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
@@ -7789,7 +7788,6 @@ POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
     PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-    CPUClass *cc = CPU_CLASS(oc);
 
     dc->fw_name = "PowerPC,POWER8";
     dc->desc = "POWER8";
@@ -7798,7 +7796,7 @@ POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
     pcc->pcr_supported = PCR_COMPAT_2_07 | PCR_COMPAT_2_06 | PCR_COMPAT_2_05;
     pcc->init_proc = init_proc_POWER8;
     pcc->check_pow = check_pow_nocheck;
-    cc->has_work = cpu_has_work_POWER8;
+    pcc->has_work = cpu_has_work_POWER8;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
@@ -8003,7 +8001,6 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
     PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-    CPUClass *cc = CPU_CLASS(oc);
 
     dc->fw_name = "PowerPC,POWER9";
     dc->desc = "POWER9";
@@ -8013,7 +8010,7 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
                          PCR_COMPAT_2_05;
     pcc->init_proc = init_proc_POWER9;
     pcc->check_pow = check_pow_nocheck;
-    cc->has_work = cpu_has_work_POWER9;
+    pcc->has_work = cpu_has_work_POWER9;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
@@ -8212,7 +8209,6 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
     PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-    CPUClass *cc = CPU_CLASS(oc);
 
     dc->fw_name = "PowerPC,POWER10";
     dc->desc = "POWER10";
@@ -8223,7 +8219,7 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
                          PCR_COMPAT_2_06 | PCR_COMPAT_2_05;
     pcc->init_proc = init_proc_POWER10;
     pcc->check_pow = check_pow_nocheck;
-    cc->has_work = cpu_has_work_POWER10;
+    pcc->has_work = cpu_has_work_POWER10;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
@@ -8790,7 +8786,7 @@ static void ppc_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.nip = value;
 }
 
-static bool ppc_cpu_has_work(CPUState *cs)
+static bool cpu_has_work_default(CPUState *cs)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
     CPUPPCState *env = &cpu->env;
@@ -8798,6 +8794,14 @@ static bool ppc_cpu_has_work(CPUState *cs)
     return msr_ee && (cs->interrupt_request & CPU_INTERRUPT_HARD);
 }
 
+static bool ppc_cpu_has_work(CPUState *cs)
+{
+    PowerPCCPU *cpu = POWERPC_CPU(cs);
+    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
+
+    return pcc->has_work(cs);
+}
+
 static void ppc_cpu_reset(DeviceState *dev)
 {
     CPUState *s = CPU(dev);
@@ -9037,6 +9041,7 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_unrealize(dc, ppc_cpu_unrealize,
                                       &pcc->parent_unrealize);
     pcc->pvr_match = ppc_pvr_match_default;
+    pcc->has_work = cpu_has_work_default;
     device_class_set_props(dc, ppc_cpu_properties);
 
     device_class_set_parent_reset(dc, ppc_cpu_reset, &pcc->parent_reset);
-- 
2.31.1


