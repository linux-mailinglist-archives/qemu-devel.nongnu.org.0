Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 909FC4D45EC
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:40:24 +0100 (CET)
Received: from localhost ([::1]:49440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSH9b-00029l-JB
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:40:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nSGwC-0004J5-S9; Thu, 10 Mar 2022 06:26:32 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:61642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nSGwA-0007fe-1Q; Thu, 10 Mar 2022 06:26:32 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22AAoqe0021676; 
 Thu, 10 Mar 2022 11:26:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=IMry9aev+NZYRR6SZW21FqFeVaiZQ5OTAhHnepcL8cY=;
 b=HYhZTAlV6ia2rst0TbfUDjUYw7b6GGK+dpVjf2kI7rBsOevwCdXSm/+SIna0sBpsAs11
 Fh8xGnomLPniGXwpssz1pM3/KIJwzmxzrzjUBQvmVrd75sQkBneW0UCyGKXCvb2CAwis
 JFOV83dBd2tDb09/eKjnISMgmF78Xqc/X14/BdIX0yNCLXY/UwVl8YGJuLuDunfxWoMi
 SqZyB6OALPxoLs+hQ4hwnramSmJjxbati8b3sDaVd7MCGMTUf8mfzKE/mKzxWsYigNm8
 tKy3zuoZV2+mQ2tvZWPMuqzV50tgwWB2QmhGLxhCcFRtVmvKYkg7udlMnZFegzovqpZI wA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eqfxfrnkf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:26:28 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22ABPD2c026373;
 Thu, 10 Mar 2022 11:26:27 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eqfxfrnj0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:26:27 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22ABDSOH009196;
 Thu, 10 Mar 2022 11:26:22 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3eky4j4jc7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:26:21 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22ABQJkp34079206
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 11:26:19 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF64C42041;
 Thu, 10 Mar 2022 11:26:18 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8D0D42047;
 Thu, 10 Mar 2022 11:26:17 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 10 Mar 2022 11:26:17 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] s390x: pv: Add dump support
Date: Thu, 10 Mar 2022 11:25:47 +0000
Message-Id: <20220310112547.3823-6-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220310112547.3823-1-frankja@linux.ibm.com>
References: <20220310112547.3823-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BhnXwyvOZ_Iayqepxb9WEEBlCquU3dZ2
X-Proofpoint-ORIG-GUID: -bzDQV-um-O1iaB4f2w9A7kx3IzL296-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-10_03,2022-03-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 mlxscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203100059
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: thuth@redhat.com, borntraeger@linux.ibm.com, cohuck@redhat.com,
 pasic@linux.ibm.com, qemu-s390x@nongnu.org, mhartmay@linux.ibm.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, imbrenda@linux.ibm.com
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

Users can use a tool to convert the encrypted QEMU dump to an
unencrypted one.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 dump/dump.c              |  27 -----
 include/elf.h            |   1 +
 include/sysemu/dump.h    |  27 +++++
 target/s390x/arch_dump.c | 247 ++++++++++++++++++++++++++++++++++-----
 4 files changed, 244 insertions(+), 58 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index a9d9ea514d..4b7d333866 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -708,33 +708,6 @@ static void dump_begin(DumpState *s, Error **errp)
     write_elf_notes(s, errp);
 }
 
-static int get_next_block(DumpState *s, GuestPhysBlock *block)
-{
-    while (1) {
-        block = QTAILQ_NEXT(block, next);
-        if (!block) {
-            /* no more block */
-            return 1;
-        }
-
-        s->start = 0;
-        s->next_block = block;
-        if (s->has_filter) {
-            if (block->target_start >= s->begin + s->length ||
-                block->target_end <= s->begin) {
-                /* This block is out of the range */
-                continue;
-            }
-
-            if (s->begin > block->target_start) {
-                s->start = s->begin - block->target_start;
-            }
-        }
-
-        return 0;
-    }
-}
-
 /* write all memory to vmcore */
 static void dump_iterate(DumpState *s, Error **errp)
 {
diff --git a/include/elf.h b/include/elf.h
index 3a4bcb646a..58f76fd5b4 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -1649,6 +1649,7 @@ typedef struct elf64_shdr {
 #define NT_TASKSTRUCT	4
 #define NT_AUXV		6
 #define NT_PRXFPREG     0x46e62b7f      /* copied from gdb5.1/include/elf/common.h */
+#define NT_S390_PV_DATA 0x30e           /* s390 protvirt cpu dump data */
 #define NT_S390_GS_CB   0x30b           /* s390 guarded storage registers */
 #define NT_S390_VXRS_HIGH 0x30a         /* s390 vector registers 16-31 */
 #define NT_S390_VXRS_LOW  0x309         /* s390 vector registers 0-15 (lower half) */
diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
index 9a000e7483..6106e0de78 100644
--- a/include/sysemu/dump.h
+++ b/include/sysemu/dump.h
@@ -213,4 +213,31 @@ typedef struct DumpState {
 uint16_t cpu_to_dump16(DumpState *s, uint16_t val);
 uint32_t cpu_to_dump32(DumpState *s, uint32_t val);
 uint64_t cpu_to_dump64(DumpState *s, uint64_t val);
+
+static inline int get_next_block(DumpState *s, GuestPhysBlock *block)
+{
+    while (1) {
+        block = QTAILQ_NEXT(block, next);
+        if (!block) {
+            /* no more block */
+            return 1;
+        }
+
+        s->start = 0;
+        s->next_block = block;
+        if (s->has_filter) {
+            if (block->target_start >= s->begin + s->length ||
+                block->target_end <= s->begin) {
+                /* This block is out of the range */
+                continue;
+            }
+
+            if (s->begin > block->target_start) {
+                s->start = s->begin - block->target_start;
+            }
+        }
+
+        return 0;
+    }
+}
 #endif
diff --git a/target/s390x/arch_dump.c b/target/s390x/arch_dump.c
index 08daf93ae1..e8e8cfbc9f 100644
--- a/target/s390x/arch_dump.c
+++ b/target/s390x/arch_dump.c
@@ -16,7 +16,8 @@
 #include "s390x-internal.h"
 #include "elf.h"
 #include "sysemu/dump.h"
-
+#include "hw/s390x/pv.h"
+#include "kvm/kvm_s390x.h"
 
 struct S390xUserRegsStruct {
     uint64_t psw[2];
@@ -76,9 +77,12 @@ typedef struct noteStruct {
         uint64_t todcmp;
         uint32_t todpreg;
         uint64_t ctrs[16];
+        uint8_t dynamic;  /* Real size comes from PV info interface */
     } contents;
 } QEMU_PACKED Note;
 
+static bool pv_dump_initialized;
+
 static void s390x_write_elf64_prstatus(Note *note, S390CPU *cpu, int id)
 {
     int i;
@@ -177,52 +181,82 @@ static void s390x_write_elf64_prefix(Note *note, S390CPU *cpu, int id)
     note->contents.prefix = cpu_to_be32((uint32_t)(cpu->env.psa));
 }
 
+static void s390x_write_elf64_pv(Note *note, S390CPU *cpu, int id)
+{
+    note->hdr.n_type = cpu_to_be32(NT_S390_PV_DATA);
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
+    { 0, NULL, NULL}
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
+    { 0, NULL, NULL}
 };
 
 static int s390x_write_elf64_notes(const char *note_name,
-                                       WriteCoreDumpFunction f,
-                                       S390CPU *cpu, int id,
-                                       void *opaque,
-                                       const NoteFuncDesc *funcs)
+                                   WriteCoreDumpFunction f,
+                                   S390CPU *cpu, int id,
+                                   void *opaque,
+                                   const NoteFuncDesc *funcs)
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
-        ret = f(&note, note_size, opaque);
+        content_size = nf->contents_size ? nf->contents_size : nf->note_size_func();
+        note_size = sizeof(note) - sizeof(notep->contents) + content_size;
+
+        /* Notes with dynamic sizes need to allocate a note */
+        if (nf->note_size_func) {
+            notep = g_malloc0(note_size);
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
+        ret = f(notep, note_size, opaque);
+
+        if (nf->note_size_func) {
+            g_free(notep);
+        }
 
         if (ret < 0) {
             return -1;
@@ -233,7 +267,6 @@ static int s390x_write_elf64_notes(const char *note_name,
     return 0;
 }
 
-
 int s390_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
                               int cpuid, void *opaque)
 {
@@ -247,12 +280,161 @@ int s390_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
     return s390x_write_elf64_notes("LINUX", f, cpu, cpuid, opaque, note_linux);
 }
 
+/* PV dump section size functions */
+static uint64_t get_dump_mem_size_from_len(uint64_t len)
+{
+    return (len / (1 << 20)) * kvm_s390_pv_dmp_get_size_mem();
+}
+
+static uint64_t get_size_mem(DumpState *s)
+{
+    return get_dump_mem_size_from_len(s->total_size);
+}
+
+static uint64_t get_size_complete(DumpState *s)
+{
+    return kvm_s390_pv_dmp_get_size_complete();
+}
+
+/* PV dump section data functions*/
+static int get_data_complete(DumpState *s, uint8_t *buff)
+{
+    int rc;
+
+    if (!pv_dump_initialized) {
+        return 0;
+    }
+    rc = kvm_s390_dump_finish(buff);
+    if (!rc) {
+            pv_dump_initialized = false;
+    }
+    return rc;
+}
+
+static int dump_mem(DumpState *s, uint64_t gaddr, uint8_t *buff, uint64_t buff_len)
+{
+    /* We need the gaddr + len and something to write to */
+    if (!pv_dump_initialized) {
+        return 0;
+    }
+    return kvm_s390_dump_mem(gaddr, buff_len, buff);
+}
+
+static int get_data_mem(DumpState *s, uint8_t *buff)
+{
+    GuestPhysBlock *block;
+    uint64_t off;
+    int64_t size;
+
+    do {
+        block = s->next_block;
+
+        size = block->target_end - block->target_start;
+        if (s->has_filter) {
+            size -= s->start;
+            if (s->begin + s->length < block->target_end) {
+                size -= block->target_end - (s->begin + s->length);
+            }
+        }
+        off = get_dump_mem_size_from_len(block->target_start);
+        dump_mem(s, block->target_start, buff + off,
+                 get_dump_mem_size_from_len(size));
+    } while (!get_next_block(s, block));
+
+    return 0;
+}
+
+struct sections {
+    uint64_t (*sections_size_func)(DumpState *s);
+    int (*sections_contents_func)(DumpState *s, uint8_t *buff);
+    char sctn_str[12];
+} sections[] = {
+    { get_size_mem, get_data_mem, "pv_mem_meta"},
+    { get_size_complete, get_data_complete, "pv_compl"},
+    {NULL , NULL, ""}
+};
+
+static uint64_t arch_sections_write_hdr(void *opaque, uint8_t *buff)
+{
+    DumpState *s = opaque;
+    Elf64_Shdr *shdr = (void *)buff;
+    struct sections *sctn = sections;
+    uint64_t off = s->section_offset;
+
+    if (!s390_is_pv()) {
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
+static void arch_sections_add(void *opaque)
+{
+    DumpState *s = opaque;
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
+            pv_dump_initialized = true;
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
+static void arch_sections_write(void *opaque, uint8_t *buff)
+{
+    DumpState *s = opaque;
+    struct sections *sctn = sections;
+
+    /* shdr_num should only have been set > 1 if we are protected */
+    assert(s390_is_pv());
+
+    for (; sctn->sections_size_func; sctn++) {
+        sctn->sections_contents_func(s, buff);
+        buff += sctn->sections_size_func(s);
+    }
+}
+
 int cpu_get_dump_info(ArchDumpInfo *info,
                       const struct GuestPhysBlockList *guest_phys_blocks)
 {
     info->d_machine = EM_S390;
     info->d_endian = ELFDATA2MSB;
     info->d_class = ELFCLASS64;
+    info->arch_sections_add_fn = *arch_sections_add;
+    info->arch_sections_write_hdr_fn = *arch_sections_write_hdr;
+    info->arch_sections_write_fn = *arch_sections_write;
 
     return 0;
 }
@@ -261,7 +443,7 @@ ssize_t cpu_get_note_size(int class, int machine, int nr_cpus)
 {
     int name_size = 8; /* "LINUX" or "CORE" + pad */
     size_t elf_note_size = 0;
-    int note_head_size;
+    int note_head_size, content_size;
     const NoteFuncDesc *nf;
 
     assert(class == ELFCLASS64);
@@ -270,12 +452,15 @@ ssize_t cpu_get_note_size(int class, int machine, int nr_cpus)
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
2.32.0


