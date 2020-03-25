Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A35A192B79
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Mar 2020 15:46:10 +0100 (CET)
Received: from localhost ([::1]:37396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jH7IH-0000Q3-2x
	for lists+qemu-devel@lfdr.de; Wed, 25 Mar 2020 10:46:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37058)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <npiggin@gmail.com>) id 1jH7F2-0003oO-4u
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 10:42:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <npiggin@gmail.com>) id 1jH7F0-0005aU-T7
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 10:42:48 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:46538)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <npiggin@gmail.com>)
 id 1jH7Ey-0005YZ-Hm; Wed, 25 Mar 2020 10:42:44 -0400
Received: by mail-pf1-x442.google.com with SMTP id q3so1111254pff.13;
 Wed, 25 Mar 2020 07:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=86eibXe5DbOHRThV4ewjzZRWDtlOmwOJ+sM6y32+F6A=;
 b=siYyMHMLA6Z0mUkNc7QZS6SWnvau9VswmKPYmrTnvkrgUggAbJrqeXqgKJcl5hwmbP
 UVM1+RLq3QGruRgnHrq0p0oKJPfIuKKk1+PMwC80ZT1BtSfBWdop7m/wQAgAC7xCCuYA
 /xDEE+Rk3ipHCPWxbm0D5zhEBNG5LskWP8O6atCd6ZU0GYIXJMtiPj6uclPErdPNU8/T
 qLzbL8cLcQ8yJvfR9WjbylnOe6qAd9X/mlCtl9FoKNgVFm/hU7LM77pxzyMhQyZUMbSh
 f+EdBbabo1Csioonm5zuugZg6RQDvzDWu5g9OpYMRXl6RdDZX0VdA7Ya5LoBh/JqejGs
 a1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=86eibXe5DbOHRThV4ewjzZRWDtlOmwOJ+sM6y32+F6A=;
 b=m9qHv5UwUIZJ0649FR+prwY0pJ9M8usiq7lW+HYdImWYooxLqf6nW8BV8kh1vMg7Ai
 NbReNtmyjIz/nYJwZw1MMdwVcMxUUQerD7g04VXZj000CgrDeUU+YU7J+zw42PNtbw9C
 oo72zpdy6iyil6sQzlFMIshe1JNsH64L7eAQiF5ZOimIn26UjZvLsgc0U2cl8VYRilpq
 Y7M07QYk8/TTO20LmGOeLT+X1UsibzCGrpVeTuSH6CHdpjOPXMBvjLQ6hqViGFk6fV/3
 WQybS4Ej+fqUznIPSZ92kcRE0awNp9qK816Bn5IVKs2qjTKwEYEbsc1n5X3Dn3XQ4SUB
 tknA==
X-Gm-Message-State: ANhLgQ0+JJALHhvAz1sXD6aQAMcZI/ldl3S9SCTL6QGv5ybZc/hCSmZi
 A7Nhi75yzCvAhKsle8uVKhmLqn3n
X-Google-Smtp-Source: ADFU+vtGsTTcP8OhgDdqk1k57KGWf2ngm2Ehs1/AvTx5BfEH8TKwbmmLNQuuT18HIpOvkJ/YewWQiA==
X-Received: by 2002:a62:ce48:: with SMTP id y69mr3760476pfg.178.1585147363548; 
 Wed, 25 Mar 2020 07:42:43 -0700 (PDT)
Received: from bobo.ibm.com (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id 93sm4609599pjo.43.2020.03.25.07.42.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 07:42:43 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH 2/5] ppc/pnv: Add support for NMI interface
Date: Thu, 26 Mar 2020 00:41:44 +1000
Message-Id: <20200325144147.221875-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200325144147.221875-1-npiggin@gmail.com>
References: <20200325144147.221875-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@fr.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This implements the NMI interface for the PNV machine, similarly to
commit 3431648272d ("spapr: Add support for new NMI interface") for
SPAPR.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 hw/ppc/pnv.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index b75ad06390..671535ebe6 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -27,6 +27,7 @@
 #include "sysemu/runstate.h"
 #include "sysemu/cpus.h"
 #include "sysemu/device_tree.h"
+#include "sysemu/hw_accel.h"
 #include "target/ppc/cpu.h"
 #include "qemu/log.h"
 #include "hw/ppc/fdt.h"
@@ -34,6 +35,7 @@
 #include "hw/ppc/pnv.h"
 #include "hw/ppc/pnv_core.h"
 #include "hw/loader.h"
+#include "hw/nmi.h"
 #include "exec/address-spaces.h"
 #include "qapi/visitor.h"
 #include "monitor/monitor.h"
@@ -1955,10 +1957,35 @@ static void pnv_machine_set_hb(Object *obj, bool value, Error **errp)
     }
 }
 
+static void pnv_cpu_do_nmi_on_cpu(CPUState *cs, run_on_cpu_data arg)
+{
+    PowerPCCPU *cpu = POWERPC_CPU(cs);
+    CPUPPCState *env = &cpu->env;
+
+    cpu_synchronize_state(cs);
+    ppc_cpu_do_system_reset(cs);
+    /*
+     * SRR1[42:45] is set to 0100 which the ISA defines as implementation
+     * dependent. POWER processors use this for xscom triggered interrupts,
+     * which come from the BMC or NMI IPIs.
+     */
+    env->spr[SPR_SRR1] |= PPC_BIT(43);
+}
+
+static void pnv_nmi(NMIState *n, int cpu_index, Error **errp)
+{
+    CPUState *cs;
+
+    CPU_FOREACH(cs) {
+        async_run_on_cpu(cs, pnv_cpu_do_nmi_on_cpu, RUN_ON_CPU_NULL);
+    }
+}
+
 static void pnv_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
     InterruptStatsProviderClass *ispc = INTERRUPT_STATS_PROVIDER_CLASS(oc);
+    NMIClass *nc = NMI_CLASS(oc);
 
     mc->desc = "IBM PowerNV (Non-Virtualized)";
     mc->init = pnv_init;
@@ -1975,6 +2002,7 @@ static void pnv_machine_class_init(ObjectClass *oc, void *data)
     mc->default_ram_size = INITRD_LOAD_ADDR + INITRD_MAX_SIZE;
     mc->default_ram_id = "pnv.ram";
     ispc->print_info = pnv_pic_print_info;
+    nc->nmi_monitor_handler = pnv_nmi;
 
     object_class_property_add_bool(oc, "hb-mode",
                                    pnv_machine_get_hb, pnv_machine_set_hb,
@@ -2038,7 +2066,7 @@ static const TypeInfo types[] = {
         .class_size    = sizeof(PnvMachineClass),
         .interfaces = (InterfaceInfo[]) {
             { TYPE_INTERRUPT_STATS_PROVIDER },
-            { },
+            { TYPE_NMI },
         },
     },
     {
-- 
2.23.0


