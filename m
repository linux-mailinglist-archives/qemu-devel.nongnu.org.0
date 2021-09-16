Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D959240DE4E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:42:51 +0200 (CEST)
Received: from localhost ([::1]:36116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtXG-0005lE-Sz
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:42:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLk-0001Zm-4H
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:56 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:43605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLY-0002ZA-KX
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:52 -0400
Received: by mail-pg1-x52b.google.com with SMTP id r2so6474600pgl.10
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R7BRXEWvxWUGmwl0JiVhEapCxr/L2l4nPcG0jEXDrDU=;
 b=ILll7l8l0832sU+IQQE1ndDm8dBYqmgusQUSdgvvgUDz5ki8ZB7TJsWR5HPt31ui8T
 AvYJNHWCVd5kLue2i4eRO42HM3INtoCD3M+zhpkmLmL6m14x2ygQinOnHJvVIOWhsVPb
 WoFws7GR5okAfQwGKK0xsDcW9nC7K6rRx64f87tpsRlAaR4uYpd0MH2i+bRGjeI/7g2h
 pSpUOleUYN+kcECFskq2+j9/2EZ2aheNRoElkBOnLnOY97Isjl5acNywblHtiHzvkekC
 VtpehcmkL6shfh5SiDhdsltMV7HwWY0nWwDWHdkOOHkMgtPxgGdcnC+Kul8fmaovlnUA
 ATSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R7BRXEWvxWUGmwl0JiVhEapCxr/L2l4nPcG0jEXDrDU=;
 b=vH0yFVBUj1Rd1Ug+IjYF6bhp8GzsS7PBoZKLyzZubeZZ1WhBgw4Id/xF6mRdjrd/mA
 po3WuIdiPgvQI7KvpDbxK/pAMfDP0/1j56RJdJfQiDWcTBF2h/ZCWBBTyf8Bll1oIopE
 lvpFVuc8aLrUZVMXjH+4HSOV2Mfm08KlPsbXJQd3RkPx1f1T2MfHQY4mpmYUI4XhRXE7
 IOSTtYFO5XpxjkpHdK7Ci6sy2RgKdHA/wqmERHXocYubl/6ZxRooUikqdgLuRYrhTHC6
 5a738ceo3wjz5h9uqr4vFWiy7/+V26h9e/LQSPhiJqF11vCNoYGYaz+JImTG1H1intgS
 t81g==
X-Gm-Message-State: AOAM531uu3rkDreWK3MHgHkHrad86gigelnGW80AMWjCb0E0ogsW409X
 leRh9bDlRIHRaqFW5leX2p+rCspFk6B/JA==
X-Google-Smtp-Source: ABdhPJzacPRc9xBXBGpOaarSorzaejxPnKHUPDBucTAuJ+OUed0TBPcrp8F/YuJrPArUG+N1e7+qXg==
X-Received: by 2002:a05:6a00:c83:b0:43e:d99:7e1e with SMTP id
 a3-20020a056a000c8300b0043e0d997e1emr5791538pfv.43.1631806241083; 
 Thu, 16 Sep 2021 08:30:41 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b7sm3779447pgs.64.2021.09.16.08.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 08:30:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/35] target/ppc: Introduce PowerPCCPUClass::has_work()
Date: Thu, 16 Sep 2021 08:30:11 -0700
Message-Id: <20210916153025.1944763-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916153025.1944763-1-richard.henderson@linaro.org>
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We're moving the hook from CPUState to TCGCPUOps. TCGCPUOps is
a const structure, so to avoid creating multiple versions of
the same structure, simply changing the has_work() handler,
introduce yet another indirection with a has_work() handler in
PowerPCCPUClass, and ppc_cpu_has_work() method which dispatch
to it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210912172731.789788-21-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu-qom.h  |  1 +
 target/ppc/cpu_init.c | 23 ++++++++++++++---------
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 5800fa324e..3611011250 100644
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
index 6aad01d1d3..2f7d262b17 100644
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
2.25.1


