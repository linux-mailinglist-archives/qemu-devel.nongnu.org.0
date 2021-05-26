Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBD5392190
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 22:37:39 +0200 (CEST)
Received: from localhost ([::1]:35456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm0HZ-0002tD-Pi
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 16:37:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lm02i-0007uB-7U; Wed, 26 May 2021 16:22:16 -0400
Received: from [201.28.113.2] (port=2123 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lm02g-00019i-LR; Wed, 26 May 2021 16:22:15 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 26 May 2021 17:21:08 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 0489F8013CA;
 Wed, 26 May 2021 17:21:08 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] hw/core/cpu: removed cpu_dump_statistics function
Date: Wed, 26 May 2021 17:21:04 -0300
Message-Id: <20210526202104.127910-6-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
References: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 26 May 2021 20:21:08.0166 (UTC)
 FILETIME=[A9562660:01D7526C]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, farosas@linux.ibm.com,
 richard.henderson@linaro.org, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No more architectures set the pointer to dump_statistics, so there's no
point in keeping it, or the related cpu_dump_statistics function.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---
 hw/core/cpu.c         |  9 ---------
 include/hw/core/cpu.h | 12 ------------
 2 files changed, 21 deletions(-)

diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 00330ba07d..b700d884ad 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -218,15 +218,6 @@ void cpu_dump_state(CPUState *cpu, FILE *f, int flags)
     }
 }
 
-void cpu_dump_statistics(CPUState *cpu, int flags)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    if (cc->dump_statistics) {
-        cc->dump_statistics(cpu, flags);
-    }
-}
-
 void cpu_reset(CPUState *cpu)
 {
     device_cold_reset(DEVICE(cpu));
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index d45f78290e..6d14923206 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -93,7 +93,6 @@ struct AccelCPUClass;
  * not be used by any callers other than the pre-1.0 virtio devices.
  * @memory_rw_debug: Callback for GDB memory access.
  * @dump_state: Callback for dumping state.
- * @dump_statistics: Callback for dumping statistics.
  * @get_arch_id: Callback for getting architecture-dependent CPU ID.
  * @get_paging_enabled: Callback for inquiring whether paging is enabled.
  * @get_memory_mapping: Callback for obtaining the memory mappings.
@@ -155,7 +154,6 @@ struct CPUClass {
                            uint8_t *buf, int len, bool is_write);
     void (*dump_state)(CPUState *cpu, FILE *, int flags);
     GuestPanicInformation* (*get_crash_info)(CPUState *cpu);
-    void (*dump_statistics)(CPUState *cpu, int flags);
     int64_t (*get_arch_id)(CPUState *cpu);
     bool (*get_paging_enabled)(const CPUState *cpu);
     void (*get_memory_mapping)(CPUState *cpu, MemoryMappingList *list,
@@ -562,16 +560,6 @@ enum CPUDumpFlags {
  */
 void cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 
-/**
- * cpu_dump_statistics:
- * @cpu: The CPU whose state is to be dumped.
- * @flags: Flags what to dump.
- *
- * Dump CPU statistics to the current monitor if we have one, else to
- * stdout.
- */
-void cpu_dump_statistics(CPUState *cpu, int flags);
-
 #ifndef CONFIG_USER_ONLY
 /**
  * cpu_get_phys_page_attrs_debug:
-- 
2.17.1


