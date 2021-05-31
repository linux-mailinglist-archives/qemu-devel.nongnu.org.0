Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5473962E3
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 17:00:43 +0200 (CEST)
Received: from localhost ([::1]:51110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnjPE-0000sf-UW
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 11:00:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lnjMK-0007Rd-TV; Mon, 31 May 2021 10:57:41 -0400
Received: from [201.28.113.2] (port=60167 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lnjMJ-0001Ug-DM; Mon, 31 May 2021 10:57:40 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 31 May 2021 11:57:32 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id A22CB801481;
 Mon, 31 May 2021 11:57:32 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/4] hw/core/cpu: removed cpu_dump_statistics function
Date: Mon, 31 May 2021 11:56:26 -0300
Message-Id: <20210531145629.21300-2-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210531145629.21300-1-bruno.larsen@eldorado.org.br>
References: <20210531145629.21300-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 31 May 2021 14:57:32.0820 (UTC)
 FILETIME=[48F43540:01D7562D]
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
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No more architectures set the pointer to dump_statistics, so there's no
point in keeping it, or the related cpu_dump_statistics function.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Message-Id: <20210526202104.127910-6-bruno.larsen@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/core/cpu-common.c  |  9 ---------
 include/hw/core/cpu.h | 12 ------------
 2 files changed, 21 deletions(-)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 9530e266ec..e2f5a64604 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -109,15 +109,6 @@ void cpu_dump_state(CPUState *cpu, FILE *f, int flags)
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
index 044f668a6e..6b3bd3a1d4 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -92,7 +92,6 @@ struct SysemuCPUOps;
  * @has_work: Callback for checking if there is work to do.
  * @memory_rw_debug: Callback for GDB memory access.
  * @dump_state: Callback for dumping state.
- * @dump_statistics: Callback for dumping statistics.
  * @get_arch_id: Callback for getting architecture-dependent CPU ID.
  * @set_pc: Callback for setting the Program Counter register. This
  *       should have the semantics used by the target architecture when
@@ -134,7 +133,6 @@ struct CPUClass {
     int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
                            uint8_t *buf, int len, bool is_write);
     void (*dump_state)(CPUState *cpu, FILE *, int flags);
-    void (*dump_statistics)(CPUState *cpu, int flags);
     int64_t (*get_arch_id)(CPUState *cpu);
     void (*set_pc)(CPUState *cpu, vaddr value);
     int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int reg);
@@ -534,16 +532,6 @@ enum CPUDumpFlags {
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


