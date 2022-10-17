Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4484600973
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 10:56:09 +0200 (CEST)
Received: from localhost ([::1]:41252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okLuq-0004Nb-NP
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 04:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1okLf8-0008Gf-50; Mon, 17 Oct 2022 04:39:58 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:63822
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1okLf0-0003gT-H4; Mon, 17 Oct 2022 04:39:53 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29H7BUDJ032162;
 Mon, 17 Oct 2022 08:39:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=SWbZ7HJ/5O/laHrYC9DJdoVQc8ZuhfD8aMa6RHnEcG0=;
 b=O5CLTPu9a9ApZ1zMmYnVWHIobcRtOsjnJ4xl21WQEG9JKLmBE4MX1iOiZZL+x6qWDXxT
 GxIEQGW7ZpIpZ6xopqPuLZOQnDhfftALssRTOTzKvbRAaq8dvNly/DV8bXxH8EsHwGGT
 mM6u1ADV4wwxSeXWFHBdX4tiJOg6B1UV0tmh6soRbf8CUf+frOATp13IeE4Eq0sXtuoM
 Aeis4NOgq0JE9JIoc45lGSMeY/6+i5kIUWbE7YjzB8PShWBzuec8PohHKf1jI1GBJ9we
 A0+TtASZWoLFdwdBt3UWdpELB4s1ATDY7w6jr0MoLUf5JcY5luoTx7jO0O+Ka70o/JnC EQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3k86x8953h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 08:39:44 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29H8aWGv009468;
 Mon, 17 Oct 2022 08:39:43 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3k86x8952g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 08:39:43 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29H8bALO007748;
 Mon, 17 Oct 2022 08:39:42 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 3k7mg920jd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 08:39:41 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29H8dcDt41353514
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Oct 2022 08:39:38 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BFA46A4040;
 Mon, 17 Oct 2022 08:39:38 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94263A404D;
 Mon, 17 Oct 2022 08:39:37 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 17 Oct 2022 08:39:37 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com, scgl@linux.ibm.com
Subject: [PATCH v6 10/10] s390x: pv: Add dump support
Date: Mon, 17 Oct 2022 08:38:22 +0000
Message-Id: <20221017083822.43118-11-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017083822.43118-1-frankja@linux.ibm.com>
References: <20221017083822.43118-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dDGjDOSQGr6YSswiremxwDj7JhABu0sc
X-Proofpoint-GUID: A758_vVGN9AAR7eWXamEqBEVCjg9otr9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-17_06,2022-10-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210170049
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Sometimes dumping a guest from the outside is the only way to get the
data that is needed. This can be the case if a dumping mechanism like
KDUMP hasn't been configured or data needs to be fetched at a specific
point. Dumping a protected guest from the outside without help from
fw/hw doesn't yield sufficient data to be useful. Hence we now
introduce PV dump support.

The PV dump support works by integrating the firmware into the dump
process. New Ultravisor calls are used to initiate the dump process,
dump cpu data, dump memory state and lastly complete the dump process.
The UV calls are exposed by KVM via the new KVM_PV_DUMP command and
its subcommands. The guest's data is fully encrypted and can only be
decrypted by the entity that owns the customer communication key for
the dumped guest. Also dumping needs to be allowed via a flag in the
SE header.

On the QEMU side of things we store the PV dump data in the newly
introduced architecture ELF sections (storage state and completion
data) and the cpu notes (for cpu dump data).

Users can use the zgetdump tool to convert the encrypted QEMU dump to an
unencrypted one.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 dump/dump.c              |  12 +-
 include/sysemu/dump.h    |   5 +
 target/s390x/arch_dump.c | 262 +++++++++++++++++++++++++++++++++++----
 3 files changed, 246 insertions(+), 33 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index b5bc4f7119..9feaf0e238 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -708,9 +708,9 @@ static void dump_begin(DumpState *s, Error **errp)
     write_elf_notes(s, errp);
 }
 
-static int64_t dump_filtered_memblock_size(GuestPhysBlock *block,
-                                           int64_t filter_area_start,
-                                           int64_t filter_area_length)
+int64_t dump_filtered_memblock_size(GuestPhysBlock *block,
+                                    int64_t filter_area_start,
+                                    int64_t filter_area_length)
 {
     int64_t size, left, right;
 
@@ -728,9 +728,9 @@ static int64_t dump_filtered_memblock_size(GuestPhysBlock *block,
     return size;
 }
 
-static int64_t dump_filtered_memblock_start(GuestPhysBlock *block,
-                                            int64_t filter_area_start,
-                                            int64_t filter_area_length)
+int64_t dump_filtered_memblock_start(GuestPhysBlock *block,
+                                     int64_t filter_area_start,
+                                     int64_t filter_area_length)
 {
     if (filter_area_length) {
         /* return -1 if the block is not within filter area */
diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
index 38ccac7190..4ffed0b659 100644
--- a/include/sysemu/dump.h
+++ b/include/sysemu/dump.h
@@ -215,4 +215,9 @@ typedef struct DumpState {
 uint16_t cpu_to_dump16(DumpState *s, uint16_t val);
 uint32_t cpu_to_dump32(DumpState *s, uint32_t val);
 uint64_t cpu_to_dump64(DumpState *s, uint64_t val);
+
+int64_t dump_filtered_memblock_size(GuestPhysBlock *block, int64_t filter_area_start,
+                                    int64_t filter_area_length);
+int64_t dump_filtered_memblock_start(GuestPhysBlock *block, int64_t filter_area_start,
+                                     int64_t filter_area_length);
 #endif
diff --git a/target/s390x/arch_dump.c b/target/s390x/arch_dump.c
index f60a14920d..a2329141e8 100644
--- a/target/s390x/arch_dump.c
+++ b/target/s390x/arch_dump.c
@@ -12,11 +12,13 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "cpu.h"
 #include "s390x-internal.h"
 #include "elf.h"
 #include "sysemu/dump.h"
-
+#include "hw/s390x/pv.h"
+#include "kvm/kvm_s390x.h"
 
 struct S390xUserRegsStruct {
     uint64_t psw[2];
@@ -76,9 +78,16 @@ typedef struct noteStruct {
         uint64_t todcmp;
         uint32_t todpreg;
         uint64_t ctrs[16];
+        uint8_t dynamic[1];  /*
+                              * Would be a flexible array member, if
+                              * that was legal inside a union. Real
+                              * size comes from PV info interface.
+                              */
     } contents;
 } QEMU_PACKED Note;
 
+static bool pv_dump_initialized;
+
 static void s390x_write_elf64_prstatus(Note *note, S390CPU *cpu, int id)
 {
     int i;
@@ -177,28 +186,39 @@ static void s390x_write_elf64_prefix(Note *note, S390CPU *cpu, int id)
     note->contents.prefix = cpu_to_be32((uint32_t)(cpu->env.psa));
 }
 
+static void s390x_write_elf64_pv(Note *note, S390CPU *cpu, int id)
+{
+    note->hdr.n_type = cpu_to_be32(NT_S390_PV_CPU_DATA);
+    if (!pv_dump_initialized) {
+        return;
+    }
+    kvm_s390_dump_cpu(cpu, &note->contents.dynamic);
+}
 
 typedef struct NoteFuncDescStruct {
     int contents_size;
+    uint64_t (*note_size_func)(void); /* NULL for non-dynamic sized contents */
     void (*note_contents_func)(Note *note, S390CPU *cpu, int id);
+    bool pvonly;
 } NoteFuncDesc;
 
 static const NoteFuncDesc note_core[] = {
-    {sizeof_field(Note, contents.prstatus), s390x_write_elf64_prstatus},
-    {sizeof_field(Note, contents.fpregset), s390x_write_elf64_fpregset},
-    { 0, NULL}
+    {sizeof_field(Note, contents.prstatus), NULL, s390x_write_elf64_prstatus, false},
+    {sizeof_field(Note, contents.fpregset), NULL, s390x_write_elf64_fpregset, false},
+    { 0, NULL, NULL, false}
 };
 
 static const NoteFuncDesc note_linux[] = {
-    {sizeof_field(Note, contents.prefix),   s390x_write_elf64_prefix},
-    {sizeof_field(Note, contents.ctrs),     s390x_write_elf64_ctrs},
-    {sizeof_field(Note, contents.timer),    s390x_write_elf64_timer},
-    {sizeof_field(Note, contents.todcmp),   s390x_write_elf64_todcmp},
-    {sizeof_field(Note, contents.todpreg),  s390x_write_elf64_todpreg},
-    {sizeof_field(Note, contents.vregslo),  s390x_write_elf64_vregslo},
-    {sizeof_field(Note, contents.vregshi),  s390x_write_elf64_vregshi},
-    {sizeof_field(Note, contents.gscb),     s390x_write_elf64_gscb},
-    { 0, NULL}
+    {sizeof_field(Note, contents.prefix),   NULL, s390x_write_elf64_prefix,  false},
+    {sizeof_field(Note, contents.ctrs),     NULL, s390x_write_elf64_ctrs,    false},
+    {sizeof_field(Note, contents.timer),    NULL, s390x_write_elf64_timer,   false},
+    {sizeof_field(Note, contents.todcmp),   NULL, s390x_write_elf64_todcmp,  false},
+    {sizeof_field(Note, contents.todpreg),  NULL, s390x_write_elf64_todpreg, false},
+    {sizeof_field(Note, contents.vregslo),  NULL, s390x_write_elf64_vregslo, false},
+    {sizeof_field(Note, contents.vregshi),  NULL, s390x_write_elf64_vregshi, false},
+    {sizeof_field(Note, contents.gscb),     NULL, s390x_write_elf64_gscb,    false},
+    {0, kvm_s390_pv_dmp_get_size_cpu,       s390x_write_elf64_pv, true},
+    { 0, NULL, NULL, false}
 };
 
 static int s390x_write_elf64_notes(const char *note_name,
@@ -207,22 +227,41 @@ static int s390x_write_elf64_notes(const char *note_name,
                                        DumpState *s,
                                        const NoteFuncDesc *funcs)
 {
-    Note note;
+    Note note, *notep;
     const NoteFuncDesc *nf;
-    int note_size;
+    int note_size, content_size;
     int ret = -1;
 
     assert(strlen(note_name) < sizeof(note.name));
 
     for (nf = funcs; nf->note_contents_func; nf++) {
-        memset(&note, 0, sizeof(note));
-        note.hdr.n_namesz = cpu_to_be32(strlen(note_name) + 1);
-        note.hdr.n_descsz = cpu_to_be32(nf->contents_size);
-        g_strlcpy(note.name, note_name, sizeof(note.name));
-        (*nf->note_contents_func)(&note, cpu, id);
+        notep = &note;
+        if (nf->pvonly && !s390_is_pv()) {
+            continue;
+        }
 
-        note_size = sizeof(note) - sizeof(note.contents) + nf->contents_size;
-        ret = f(&note, note_size, s);
+        content_size = nf->note_size_func ? nf->note_size_func() : nf->contents_size;
+        note_size = sizeof(note) - sizeof(notep->contents) + content_size;
+
+        /* Notes with dynamic sizes need to allocate a note */
+        if (nf->note_size_func) {
+            notep = g_malloc(note_size);
+        }
+
+        memset(notep, 0, sizeof(note));
+
+        /* Setup note header data */
+        notep->hdr.n_descsz = cpu_to_be32(content_size);
+        notep->hdr.n_namesz = cpu_to_be32(strlen(note_name) + 1);
+        g_strlcpy(notep->name, note_name, sizeof(notep->name));
+
+        /* Get contents and write them out */
+        (*nf->note_contents_func)(notep, cpu, id);
+        ret = f(notep, note_size, s);
+
+        if (nf->note_size_func) {
+            g_free(notep);
+        }
 
         if (ret < 0) {
             return -1;
@@ -247,13 +286,179 @@ int s390_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
     return s390x_write_elf64_notes("LINUX", f, cpu, cpuid, s, note_linux);
 }
 
+/* PV dump section size functions */
+static uint64_t get_mem_state_size_from_len(uint64_t len)
+{
+    return (len / (MiB)) * kvm_s390_pv_dmp_get_size_mem_state();
+}
+
+static uint64_t get_size_mem_state(DumpState *s)
+{
+    return get_mem_state_size_from_len(s->total_size);
+}
+
+static uint64_t get_size_completion_data(DumpState *s)
+{
+    return kvm_s390_pv_dmp_get_size_completion_data();
+}
+
+/* PV dump section data functions*/
+static int get_data_completion(DumpState *s, uint8_t *buff)
+{
+    int rc;
+
+    if (!pv_dump_initialized) {
+        return 0;
+    }
+    rc = kvm_s390_dump_completion_data(buff);
+    if (!rc) {
+            pv_dump_initialized = false;
+    }
+    return rc;
+}
+
+static int get_mem_state(DumpState *s, uint8_t *buff)
+{
+    int64_t memblock_size, memblock_start;
+    GuestPhysBlock *block;
+    uint64_t off;
+    int rc;
+
+    QTAILQ_FOREACH(block, &s->guest_phys_blocks.head, next) {
+        memblock_start = dump_filtered_memblock_start(block, s->filter_area_begin,
+                                                      s->filter_area_length);
+        if (memblock_start == -1) {
+            continue;
+        }
+
+        memblock_size = dump_filtered_memblock_size(block, s->filter_area_begin,
+                                                    s->filter_area_length);
+
+        off = get_mem_state_size_from_len(block->target_start);
+
+        rc = kvm_s390_dump_mem_state(block->target_start,
+                                     get_mem_state_size_from_len(memblock_size),
+                                     buff + off);
+        if (rc) {
+            return rc;
+        }
+    }
+
+    return 0;
+}
+
+static struct sections {
+    uint64_t (*sections_size_func)(DumpState *s);
+    int (*sections_contents_func)(DumpState *s, uint8_t *buff);
+    char sctn_str[12];
+} sections[] = {
+    { get_size_mem_state, get_mem_state, "pv_mem_meta"},
+    { get_size_completion_data, get_data_completion, "pv_compl"},
+    {NULL , NULL, ""}
+};
+
+static uint64_t arch_sections_write_hdr(DumpState *s, uint8_t *buff)
+{
+    Elf64_Shdr *shdr = (void *)buff;
+    struct sections *sctn = sections;
+    uint64_t off = s->section_offset;
+
+    if (!pv_dump_initialized) {
+        return 0;
+    }
+
+    for (; sctn->sections_size_func; off += shdr->sh_size, sctn++, shdr++) {
+        memset(shdr, 0, sizeof(*shdr));
+        shdr->sh_type = SHT_PROGBITS;
+        shdr->sh_offset = off;
+        shdr->sh_size = sctn->sections_size_func(s);
+        shdr->sh_name = s->string_table_buf->len;
+        g_array_append_vals(s->string_table_buf, sctn->sctn_str, sizeof(sctn->sctn_str));
+    }
+
+    return (uintptr_t)shdr - (uintptr_t)buff;
+}
+
+
+/* Add arch specific number of sections and their respective sizes */
+static void arch_sections_add(DumpState *s)
+{
+    struct sections *sctn = sections;
+
+    /*
+     * We only do a PV dump if we are running a PV guest, KVM supports
+     * the dump API and we got valid dump length information.
+     */
+    if (!s390_is_pv() || !kvm_s390_get_protected_dump() ||
+        !kvm_s390_pv_info_basic_valid()) {
+        return;
+    }
+
+    /*
+     * Start the UV dump process by doing the initialize dump call via
+     * KVM as the proxy.
+     */
+    if (!kvm_s390_dump_init()) {
+        pv_dump_initialized = true;
+    } else {
+        /*
+         * Dump init failed, maybe the guest owner disabled dumping.
+         * We'll continue the non-PV dump process since this is no
+         * reason to crash qemu.
+         */
+        return;
+    }
+
+    for (; sctn->sections_size_func; sctn++) {
+        s->shdr_num += 1;
+        s->elf_section_data_size += sctn->sections_size_func(s);
+    }
+}
+
+/*
+ * After the PV dump has been initialized, the CPU data has been
+ * fetched and memory has been dumped, we need to grab the tweak data
+ * and the completion data.
+ */
+static int arch_sections_write(DumpState *s, uint8_t *buff)
+{
+    struct sections *sctn = sections;
+    int rc;
+
+    if (!pv_dump_initialized) {
+        return -EINVAL;
+    }
+
+    for (; sctn->sections_size_func; sctn++) {
+        rc = sctn->sections_contents_func(s, buff);
+        buff += sctn->sections_size_func(s);
+        if (rc) {
+            return rc;
+        }
+    }
+    return 0;
+}
+
 int cpu_get_dump_info(ArchDumpInfo *info,
                       const struct GuestPhysBlockList *guest_phys_blocks)
 {
     info->d_machine = EM_S390;
     info->d_endian = ELFDATA2MSB;
     info->d_class = ELFCLASS64;
-
+    /*
+     * This is evaluated for each dump so we can freely switch
+     * between PV and non-PV.
+     */
+    if (s390_is_pv() && kvm_s390_get_protected_dump() &&
+        kvm_s390_pv_info_basic_valid()) {
+        info->arch_sections_add_fn = *arch_sections_add;
+        info->arch_sections_write_hdr_fn = *arch_sections_write_hdr;
+        info->arch_sections_write_fn = *arch_sections_write;
+    } else {
+        info->arch_sections_add_fn = NULL;
+        info->arch_sections_write_hdr_fn = NULL;
+        info->arch_sections_write_fn = NULL;
+    }
     return 0;
 }
 
@@ -261,7 +466,7 @@ ssize_t cpu_get_note_size(int class, int machine, int nr_cpus)
 {
     int name_size = 8; /* "LINUX" or "CORE" + pad */
     size_t elf_note_size = 0;
-    int note_head_size;
+    int note_head_size, content_size;
     const NoteFuncDesc *nf;
 
     assert(class == ELFCLASS64);
@@ -270,12 +475,15 @@ ssize_t cpu_get_note_size(int class, int machine, int nr_cpus)
     note_head_size = sizeof(Elf64_Nhdr);
 
     for (nf = note_core; nf->note_contents_func; nf++) {
-        elf_note_size = elf_note_size + note_head_size + name_size +
-                        nf->contents_size;
+        elf_note_size = elf_note_size + note_head_size + name_size + nf->contents_size;
     }
     for (nf = note_linux; nf->note_contents_func; nf++) {
+        if (nf->pvonly && !s390_is_pv()) {
+            continue;
+        }
+        content_size = nf->contents_size ? nf->contents_size : nf->note_size_func();
         elf_note_size = elf_note_size + note_head_size + name_size +
-                        nf->contents_size;
+                        content_size;
     }
 
     return (elf_note_size) * nr_cpus;
-- 
2.34.1


