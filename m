Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C51458FC55
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 14:33:35 +0200 (CEST)
Received: from localhost ([::1]:52422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM7NW-0003dx-Fj
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 08:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oM746-0005Ch-Ia; Thu, 11 Aug 2022 08:13:30 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:16900
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oM743-0000HR-TE; Thu, 11 Aug 2022 08:13:30 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27BC6uak013315;
 Thu, 11 Aug 2022 12:13:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=yukjEiYUj5exKyE5fHyHpCuo0XPMaSiF6DgBgDrWopY=;
 b=TpIa5jFK6IZLOCU8oZ/eS0vh4mHBdKzMJuJJAEfTmyCS/VfrLME3ZnUS9zcJmUX1m79r
 UFU/93KHkJObE1UbjP8bcLCd+1ie38LMbG0Qrd+ohTjsTLC6BfmBdaJ3TDGx8PsNTL4K
 zOl9luH6r4vW7gUINb9rLZHI47YEd5maCkMNIv+OteZE8VHUBOfXAUmNqNolC5v3/asb
 EFAyNDu2QDEgp1FYjHc3JMvmxnelLXQSp3X9wya8BmaI7lq8sORrnwEldrMbopuSUSmx
 b5pcwSjwk6YVu5IP8WuiKK2OY9+EvXpltJ8LcorI1Kx5vW6hgSolmlse8ZIkO5I1oGES Uw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hw1dp0pxc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:13:15 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27BC73gV014175;
 Thu, 11 Aug 2022 12:12:43 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hw1dp0nmx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:12:42 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27BC7KHm014887;
 Thu, 11 Aug 2022 12:12:03 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3huwvg20kr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:12:03 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 27BCCHX527066832
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 12:12:17 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5FFAFAE04D;
 Thu, 11 Aug 2022 12:12:00 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66F5CAE045;
 Thu, 11 Aug 2022 12:11:58 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 11 Aug 2022 12:11:58 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com, scgl@linux.ibm.com,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Subject: [PATCH v5 01/18] dump: Replace opaque DumpState pointer with a typed
 one
Date: Thu, 11 Aug 2022 12:10:54 +0000
Message-Id: <20220811121111.9878-2-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220811121111.9878-1-frankja@linux.ibm.com>
References: <20220811121111.9878-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: B3ELqBD_YFOIo1MtVqex4j5XYxiqqptc
X-Proofpoint-ORIG-GUID: YeeFagUliRtHpBQ8qfVQhyNU0EEAuds5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_05,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 mlxlogscore=904
 clxscore=1011 mlxscore=0 phishscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208110037
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's always better to convey the type of a pointer if at all
possible. So let's add the DumpState typedef to typedefs.h and move
the dump note functions from the opaque pointers to DumpState
pointers.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
CC: Peter Maydell <peter.maydell@linaro.org>
CC: Cédric Le Goater <clg@kaod.org>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>
CC: David Gibson <david@gibson.dropbear.id.au>
CC: Greg Kurz <groug@kaod.org>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Alistair Francis <alistair.francis@wdc.com>
CC: Bin Meng <bin.meng@windriver.com>
CC: Cornelia Huck <cohuck@redhat.com>
CC: Thomas Huth <thuth@redhat.com>
CC: Richard Henderson <richard.henderson@linaro.org>
CC: David Hildenbrand <david@redhat.com>
---
 include/hw/core/sysemu-cpu-ops.h |  8 ++++----
 include/qemu/typedefs.h          |  1 +
 target/arm/arch_dump.c           |  6 ++----
 target/arm/cpu.h                 |  4 ++--
 target/i386/arch_dump.c          | 30 +++++++++++++++---------------
 target/i386/cpu.h                |  8 ++++----
 target/ppc/arch_dump.c           | 18 +++++++++---------
 target/ppc/cpu.h                 |  4 ++--
 target/riscv/arch_dump.c         |  6 ++----
 target/riscv/cpu.h               |  4 ++--
 target/s390x/arch_dump.c         | 10 +++++-----
 target/s390x/s390x-internal.h    |  2 +-
 12 files changed, 49 insertions(+), 52 deletions(-)

diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
index a9ba39e5f2..ee169b872c 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -53,25 +53,25 @@ typedef struct SysemuCPUOps {
      * 32-bit VM coredump.
      */
     int (*write_elf32_note)(WriteCoreDumpFunction f, CPUState *cpu,
-                            int cpuid, void *opaque);
+                            int cpuid, DumpState *s);
     /**
      * @write_elf64_note: Callback for writing a CPU-specific ELF note to a
      * 64-bit VM coredump.
      */
     int (*write_elf64_note)(WriteCoreDumpFunction f, CPUState *cpu,
-                            int cpuid, void *opaque);
+                            int cpuid, DumpState *s);
     /**
      * @write_elf32_qemunote: Callback for writing a CPU- and QEMU-specific ELF
      * note to a 32-bit VM coredump.
      */
     int (*write_elf32_qemunote)(WriteCoreDumpFunction f, CPUState *cpu,
-                                void *opaque);
+                                DumpState *s);
     /**
      * @write_elf64_qemunote: Callback for writing a CPU- and QEMU-specific ELF
      * note to a 64-bit VM coredump.
      */
     int (*write_elf64_qemunote)(WriteCoreDumpFunction f, CPUState *cpu,
-                                void *opaque);
+                                DumpState *s);
     /**
      * @virtio_is_big_endian: Callback to return %true if a CPU which supports
      * runtime configurable endianness is currently big-endian.
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 42f4ceb701..054fd46fa6 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -129,6 +129,7 @@ typedef struct VirtIODevice VirtIODevice;
 typedef struct Visitor Visitor;
 typedef struct VMChangeStateEntry VMChangeStateEntry;
 typedef struct VMStateDescription VMStateDescription;
+typedef struct DumpState DumpState;
 
 /*
  * Pointer types
diff --git a/target/arm/arch_dump.c b/target/arm/arch_dump.c
index b1f040e69f..2d8e41ab8a 100644
--- a/target/arm/arch_dump.c
+++ b/target/arm/arch_dump.c
@@ -232,12 +232,11 @@ static int aarch64_write_elf64_sve(WriteCoreDumpFunction f,
 #endif
 
 int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
-                             int cpuid, void *opaque)
+                             int cpuid, DumpState *s)
 {
     struct aarch64_note note;
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
-    DumpState *s = opaque;
     uint64_t pstate, sp;
     int ret, i;
 
@@ -360,12 +359,11 @@ static int arm_write_elf32_vfp(WriteCoreDumpFunction f, CPUARMState *env,
 }
 
 int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
-                             int cpuid, void *opaque)
+                             int cpuid, DumpState *s)
 {
     struct arm_note note;
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
-    DumpState *s = opaque;
     int ret, i;
     bool fpvalid = cpu_isar_feature(aa32_vfp_simd, cpu);
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5168e3d837..fc8b358779 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1100,9 +1100,9 @@ int arm_gen_dynamic_svereg_xml(CPUState *cpu, int base_reg);
 const char *arm_gdb_get_dynamic_xml(CPUState *cpu, const char *xmlname);
 
 int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
-                             int cpuid, void *opaque);
+                             int cpuid, DumpState *s);
 int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
-                             int cpuid, void *opaque);
+                             int cpuid, DumpState *s);
 
 #ifdef TARGET_AARCH64
 int aarch64_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
diff --git a/target/i386/arch_dump.c b/target/i386/arch_dump.c
index 004141fc04..c290910a04 100644
--- a/target/i386/arch_dump.c
+++ b/target/i386/arch_dump.c
@@ -42,7 +42,7 @@ typedef struct {
 
 static int x86_64_write_elf64_note(WriteCoreDumpFunction f,
                                    CPUX86State *env, int id,
-                                   void *opaque)
+                                   DumpState *s)
 {
     x86_64_user_regs_struct regs;
     Elf64_Nhdr *note;
@@ -94,7 +94,7 @@ static int x86_64_write_elf64_note(WriteCoreDumpFunction f,
     buf += descsz - sizeof(x86_64_user_regs_struct)-sizeof(target_ulong);
     memcpy(buf, &regs, sizeof(x86_64_user_regs_struct));
 
-    ret = f(note, note_size, opaque);
+    ret = f(note, note_size, s);
     g_free(note);
     if (ret < 0) {
         return -1;
@@ -148,7 +148,7 @@ static void x86_fill_elf_prstatus(x86_elf_prstatus *prstatus, CPUX86State *env,
 }
 
 static int x86_write_elf64_note(WriteCoreDumpFunction f, CPUX86State *env,
-                                int id, void *opaque)
+                                int id, DumpState *s)
 {
     x86_elf_prstatus prstatus;
     Elf64_Nhdr *note;
@@ -170,7 +170,7 @@ static int x86_write_elf64_note(WriteCoreDumpFunction f, CPUX86State *env,
     buf += ROUND_UP(name_size, 4);
     memcpy(buf, &prstatus, sizeof(prstatus));
 
-    ret = f(note, note_size, opaque);
+    ret = f(note, note_size, s);
     g_free(note);
     if (ret < 0) {
         return -1;
@@ -180,7 +180,7 @@ static int x86_write_elf64_note(WriteCoreDumpFunction f, CPUX86State *env,
 }
 
 int x86_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
-                             int cpuid, void *opaque)
+                             int cpuid, DumpState *s)
 {
     X86CPU *cpu = X86_CPU(cs);
     int ret;
@@ -189,10 +189,10 @@ int x86_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
     bool lma = !!(first_x86_cpu->env.hflags & HF_LMA_MASK);
 
     if (lma) {
-        ret = x86_64_write_elf64_note(f, &cpu->env, cpuid, opaque);
+        ret = x86_64_write_elf64_note(f, &cpu->env, cpuid, s);
     } else {
 #endif
-        ret = x86_write_elf64_note(f, &cpu->env, cpuid, opaque);
+        ret = x86_write_elf64_note(f, &cpu->env, cpuid, s);
 #ifdef TARGET_X86_64
     }
 #endif
@@ -201,7 +201,7 @@ int x86_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
 }
 
 int x86_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
-                             int cpuid, void *opaque)
+                             int cpuid, DumpState *s)
 {
     X86CPU *cpu = X86_CPU(cs);
     x86_elf_prstatus prstatus;
@@ -224,7 +224,7 @@ int x86_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
     buf += ROUND_UP(name_size, 4);
     memcpy(buf, &prstatus, sizeof(prstatus));
 
-    ret = f(note, note_size, opaque);
+    ret = f(note, note_size, s);
     g_free(note);
     if (ret < 0) {
         return -1;
@@ -329,7 +329,7 @@ static void qemu_get_cpustate(QEMUCPUState *s, CPUX86State *env)
 
 static inline int cpu_write_qemu_note(WriteCoreDumpFunction f,
                                       CPUX86State *env,
-                                      void *opaque,
+                                      DumpState *s,
                                       int type)
 {
     QEMUCPUState state;
@@ -369,7 +369,7 @@ static inline int cpu_write_qemu_note(WriteCoreDumpFunction f,
     buf += ROUND_UP(name_size, 4);
     memcpy(buf, &state, sizeof(state));
 
-    ret = f(note, note_size, opaque);
+    ret = f(note, note_size, s);
     g_free(note);
     if (ret < 0) {
         return -1;
@@ -379,19 +379,19 @@ static inline int cpu_write_qemu_note(WriteCoreDumpFunction f,
 }
 
 int x86_cpu_write_elf64_qemunote(WriteCoreDumpFunction f, CPUState *cs,
-                                 void *opaque)
+                                 DumpState *s)
 {
     X86CPU *cpu = X86_CPU(cs);
 
-    return cpu_write_qemu_note(f, &cpu->env, opaque, 1);
+    return cpu_write_qemu_note(f, &cpu->env, s, 1);
 }
 
 int x86_cpu_write_elf32_qemunote(WriteCoreDumpFunction f, CPUState *cs,
-                                 void *opaque)
+                                 DumpState *s)
 {
     X86CPU *cpu = X86_CPU(cs);
 
-    return cpu_write_qemu_note(f, &cpu->env, opaque, 0);
+    return cpu_write_qemu_note(f, &cpu->env, s, 0);
 }
 
 int cpu_get_dump_info(ArchDumpInfo *info,
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 82004b65b9..b75108d6a3 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1938,13 +1938,13 @@ extern const VMStateDescription vmstate_x86_cpu;
 int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request);
 
 int x86_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cpu,
-                             int cpuid, void *opaque);
+                             int cpuid, DumpState *s);
 int x86_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cpu,
-                             int cpuid, void *opaque);
+                             int cpuid, DumpState *s);
 int x86_cpu_write_elf64_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
-                                 void *opaque);
+                                 DumpState *s);
 int x86_cpu_write_elf32_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
-                                 void *opaque);
+                                 DumpState *s);
 
 void x86_cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
                                 Error **errp);
diff --git a/target/ppc/arch_dump.c b/target/ppc/arch_dump.c
index 1139cead9f..f58e6359d5 100644
--- a/target/ppc/arch_dump.c
+++ b/target/ppc/arch_dump.c
@@ -270,23 +270,23 @@ ssize_t cpu_get_note_size(int class, int machine, int nr_cpus)
 static int ppc_write_all_elf_notes(const char *note_name,
                                    WriteCoreDumpFunction f,
                                    PowerPCCPU *cpu, int id,
-                                   void *opaque)
+                                   DumpState *s)
 {
-    NoteFuncArg arg = { .state = opaque };
+    NoteFuncArg arg = { .state = s };
     int ret = -1;
     int note_size;
     const NoteFuncDesc *nf;
 
     for (nf = note_func; nf->note_contents_func; nf++) {
-        arg.note.hdr.n_namesz = cpu_to_dump32(opaque, sizeof(arg.note.name));
-        arg.note.hdr.n_descsz = cpu_to_dump32(opaque, nf->contents_size);
+        arg.note.hdr.n_namesz = cpu_to_dump32(s, sizeof(arg.note.name));
+        arg.note.hdr.n_descsz = cpu_to_dump32(s, nf->contents_size);
         strncpy(arg.note.name, note_name, sizeof(arg.note.name));
 
         (*nf->note_contents_func)(&arg, cpu);
 
         note_size =
             sizeof(arg.note) - sizeof(arg.note.contents) + nf->contents_size;
-        ret = f(&arg.note, note_size, opaque);
+        ret = f(&arg.note, note_size, s);
         if (ret < 0) {
             return -1;
         }
@@ -295,15 +295,15 @@ static int ppc_write_all_elf_notes(const char *note_name,
 }
 
 int ppc64_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
-                               int cpuid, void *opaque)
+                               int cpuid, DumpState *s)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
-    return ppc_write_all_elf_notes("CORE", f, cpu, cpuid, opaque);
+    return ppc_write_all_elf_notes("CORE", f, cpu, cpuid, s);
 }
 
 int ppc32_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
-                               int cpuid, void *opaque)
+                               int cpuid, DumpState *s)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
-    return ppc_write_all_elf_notes("CORE", f, cpu, cpuid, opaque);
+    return ppc_write_all_elf_notes("CORE", f, cpu, cpuid, s);
 }
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index a4c893cfad..f7d28fe093 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1354,9 +1354,9 @@ void ppc_gdb_gen_spr_xml(PowerPCCPU *cpu);
 const char *ppc_gdb_get_dynamic_xml(CPUState *cs, const char *xml_name);
 #endif
 int ppc64_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
-                               int cpuid, void *opaque);
+                               int cpuid, DumpState *s);
 int ppc32_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
-                               int cpuid, void *opaque);
+                               int cpuid, DumpState *s);
 #ifndef CONFIG_USER_ONLY
 void ppc_cpu_do_interrupt(CPUState *cpu);
 bool ppc_cpu_exec_interrupt(CPUState *cpu, int int_req);
diff --git a/target/riscv/arch_dump.c b/target/riscv/arch_dump.c
index 709f621d82..736a232956 100644
--- a/target/riscv/arch_dump.c
+++ b/target/riscv/arch_dump.c
@@ -64,12 +64,11 @@ static void riscv64_note_init(struct riscv64_note *note, DumpState *s,
 }
 
 int riscv_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
-                               int cpuid, void *opaque)
+                               int cpuid, DumpState *s)
 {
     struct riscv64_note note;
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-    DumpState *s = opaque;
     int ret, i = 0;
     const char name[] = "CORE";
 
@@ -134,12 +133,11 @@ static void riscv32_note_init(struct riscv32_note *note, DumpState *s,
 }
 
 int riscv_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
-                               int cpuid, void *opaque)
+                               int cpuid, DumpState *s)
 {
     struct riscv32_note note;
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-    DumpState *s = opaque;
     int ret, i;
     const char name[] = "CORE";
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5c7acc055a..9699504721 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -505,9 +505,9 @@ extern const char * const riscv_fpr_regnames[];
 const char *riscv_cpu_get_trap_name(target_ulong cause, bool async);
 void riscv_cpu_do_interrupt(CPUState *cpu);
 int riscv_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
-                               int cpuid, void *opaque);
+                               int cpuid, DumpState *s);
 int riscv_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
-                               int cpuid, void *opaque);
+                               int cpuid, DumpState *s);
 int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out_rdzero);
diff --git a/target/s390x/arch_dump.c b/target/s390x/arch_dump.c
index 08daf93ae1..f60a14920d 100644
--- a/target/s390x/arch_dump.c
+++ b/target/s390x/arch_dump.c
@@ -204,7 +204,7 @@ static const NoteFuncDesc note_linux[] = {
 static int s390x_write_elf64_notes(const char *note_name,
                                        WriteCoreDumpFunction f,
                                        S390CPU *cpu, int id,
-                                       void *opaque,
+                                       DumpState *s,
                                        const NoteFuncDesc *funcs)
 {
     Note note;
@@ -222,7 +222,7 @@ static int s390x_write_elf64_notes(const char *note_name,
         (*nf->note_contents_func)(&note, cpu, id);
 
         note_size = sizeof(note) - sizeof(note.contents) + nf->contents_size;
-        ret = f(&note, note_size, opaque);
+        ret = f(&note, note_size, s);
 
         if (ret < 0) {
             return -1;
@@ -235,16 +235,16 @@ static int s390x_write_elf64_notes(const char *note_name,
 
 
 int s390_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
-                              int cpuid, void *opaque)
+                              int cpuid, DumpState *s)
 {
     S390CPU *cpu = S390_CPU(cs);
     int r;
 
-    r = s390x_write_elf64_notes("CORE", f, cpu, cpuid, opaque, note_core);
+    r = s390x_write_elf64_notes("CORE", f, cpu, cpuid, s, note_core);
     if (r) {
         return r;
     }
-    return s390x_write_elf64_notes("LINUX", f, cpu, cpuid, opaque, note_linux);
+    return s390x_write_elf64_notes("LINUX", f, cpu, cpuid, s, note_linux);
 }
 
 int cpu_get_dump_info(ArchDumpInfo *info,
diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h
index 6aba7fd0ca..b5ae0ae364 100644
--- a/target/s390x/s390x-internal.h
+++ b/target/s390x/s390x-internal.h
@@ -227,7 +227,7 @@ static inline hwaddr decode_basedisp_s(CPUS390XState *env, uint32_t ipb,
 
 /* arch_dump.c */
 int s390_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
-                              int cpuid, void *opaque);
+                              int cpuid, DumpState *s);
 
 
 /* cc_helper.c */
-- 
2.34.1


