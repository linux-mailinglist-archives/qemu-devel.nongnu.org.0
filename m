Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8524D459C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:23:51 +0100 (CET)
Received: from localhost ([::1]:49914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSGta-00089s-9w
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:23:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nSGfS-0007Fw-Od
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:09:15 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:19454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nSGfP-0004dx-Ez
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:09:14 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22AAWmiM011746
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:09:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=WQJzoE2T77JP0V4lczLo4utV01NEv26VqQNpf04mhQY=;
 b=ORKM3LBuxVw59ZrlAqihkwZfS6Oi+6ec7NOp7lcnKTVQzHdzjVtyM1EBZiWwM9TjiCYZ
 ShLLpIF7+HkEaXdkJeCSC85yiGooG6koe+33kn1mUf27lULuyyS1hOTfYL6DR7w1mvvi
 oHCNOzrNwMIMmIGRtP0SuopnD6AyRdcF/KDqftS8ZfUcqp3JO/ROK85I82W6Hr6u62P9
 y39qbHhwV8kbvxomoRTytUi4X7UOdvoQbM5aUI3EBr8o8AIUw1T7RYR9g/+y1XonLq6r
 gPUmFWYIPz+bb+bmGPNxCwETZy32hc4dC2ERRpF5mThItOdI4Uz4+Dhb2aYXBA6ON/q4 /A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eqctrcaqs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:09:08 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22AAYwn3003940
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:09:07 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eqctrcapy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:09:07 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22AB3gaj031924;
 Thu, 10 Mar 2022 11:09:05 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 3epysw9h39-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:09:05 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22AAvnj141484630
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 10:57:49 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E876211C069;
 Thu, 10 Mar 2022 11:09:02 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E71911C066;
 Thu, 10 Mar 2022 11:09:02 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 10 Mar 2022 11:09:02 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/9] dump: Use ERRP_GUARD()
Date: Thu, 10 Mar 2022 11:08:46 +0000
Message-Id: <20220310110854.2701-2-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220310110854.2701-1-frankja@linux.ibm.com>
References: <20220310110854.2701-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lqtGKWLq5pcv_IrWilVjwawA2jT-coGL
X-Proofpoint-ORIG-GUID: nOMagTYiYdIXBSR1Y_DNQd5nLTO6OoSW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-10_03,2022-03-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 mlxlogscore=873 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203100059
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
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's move to the new way of handling errors before changing the dump
code. This patch has mostly been generated by the coccinelle script
scripts/coccinelle/errp-guard.cocci.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 dump/dump.c | 144 ++++++++++++++++++++++------------------------------
 1 file changed, 61 insertions(+), 83 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index a84d8b1598..ef1700174b 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -390,23 +390,21 @@ static void write_data(DumpState *s, void *buf, int length, Error **errp)
 static void write_memory(DumpState *s, GuestPhysBlock *block, ram_addr_t start,
                          int64_t size, Error **errp)
 {
+    ERRP_GUARD();
     int64_t i;
-    Error *local_err = NULL;
 
     for (i = 0; i < size / s->dump_info.page_size; i++) {
         write_data(s, block->host_addr + start + i * s->dump_info.page_size,
-                   s->dump_info.page_size, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
+                   s->dump_info.page_size, errp);
+        if (*errp) {
             return;
         }
     }
 
     if ((size % s->dump_info.page_size) != 0) {
         write_data(s, block->host_addr + start + i * s->dump_info.page_size,
-                   size % s->dump_info.page_size, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
+                   size % s->dump_info.page_size, errp);
+        if (*errp) {
             return;
         }
     }
@@ -476,11 +474,11 @@ static void get_offset_range(hwaddr phys_addr,
 
 static void write_elf_loads(DumpState *s, Error **errp)
 {
+    ERRP_GUARD();
     hwaddr offset, filesz;
     MemoryMapping *memory_mapping;
     uint32_t phdr_index = 1;
     uint32_t max_index;
-    Error *local_err = NULL;
 
     if (s->have_section) {
         max_index = s->sh_info;
@@ -494,14 +492,13 @@ static void write_elf_loads(DumpState *s, Error **errp)
                          s, &offset, &filesz);
         if (s->dump_info.d_class == ELFCLASS64) {
             write_elf64_load(s, memory_mapping, phdr_index++, offset,
-                             filesz, &local_err);
+                             filesz, errp);
         } else {
             write_elf32_load(s, memory_mapping, phdr_index++, offset,
-                             filesz, &local_err);
+                             filesz, errp);
         }
 
-        if (local_err) {
-            error_propagate(errp, local_err);
+        if (*errp) {
             return;
         }
 
@@ -514,7 +511,7 @@ static void write_elf_loads(DumpState *s, Error **errp)
 /* write elf header, PT_NOTE and elf note to vmcore. */
 static void dump_begin(DumpState *s, Error **errp)
 {
-    Error *local_err = NULL;
+    ERRP_GUARD();
 
     /*
      * the vmcore's format is:
@@ -542,73 +539,64 @@ static void dump_begin(DumpState *s, Error **errp)
 
     /* write elf header to vmcore */
     if (s->dump_info.d_class == ELFCLASS64) {
-        write_elf64_header(s, &local_err);
+        write_elf64_header(s, errp);
     } else {
-        write_elf32_header(s, &local_err);
+        write_elf32_header(s, errp);
     }
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (*errp) {
         return;
     }
 
     if (s->dump_info.d_class == ELFCLASS64) {
         /* write PT_NOTE to vmcore */
-        write_elf64_note(s, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
+        write_elf64_note(s, errp);
+        if (*errp) {
             return;
         }
 
         /* write all PT_LOAD to vmcore */
-        write_elf_loads(s, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
+        write_elf_loads(s, errp);
+        if (*errp) {
             return;
         }
 
         /* write section to vmcore */
         if (s->have_section) {
-            write_elf_section(s, 1, &local_err);
-            if (local_err) {
-                error_propagate(errp, local_err);
+            write_elf_section(s, 1, errp);
+            if (*errp) {
                 return;
             }
         }
 
         /* write notes to vmcore */
-        write_elf64_notes(fd_write_vmcore, s, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
+        write_elf64_notes(fd_write_vmcore, s, errp);
+        if (*errp) {
             return;
         }
     } else {
         /* write PT_NOTE to vmcore */
-        write_elf32_note(s, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
+        write_elf32_note(s, errp);
+        if (*errp) {
             return;
         }
 
         /* write all PT_LOAD to vmcore */
-        write_elf_loads(s, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
+        write_elf_loads(s, errp);
+        if (*errp) {
             return;
         }
 
         /* write section to vmcore */
         if (s->have_section) {
-            write_elf_section(s, 0, &local_err);
-            if (local_err) {
-                error_propagate(errp, local_err);
+            write_elf_section(s, 0, errp);
+            if (*errp) {
                 return;
             }
         }
 
         /* write notes to vmcore */
-        write_elf32_notes(fd_write_vmcore, s, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
+        write_elf32_notes(fd_write_vmcore, s, errp);
+        if (*errp) {
             return;
         }
     }
@@ -644,9 +632,9 @@ static int get_next_block(DumpState *s, GuestPhysBlock *block)
 /* write all memory to vmcore */
 static void dump_iterate(DumpState *s, Error **errp)
 {
+    ERRP_GUARD();
     GuestPhysBlock *block;
     int64_t size;
-    Error *local_err = NULL;
 
     do {
         block = s->next_block;
@@ -658,9 +646,8 @@ static void dump_iterate(DumpState *s, Error **errp)
                 size -= block->target_end - (s->begin + s->length);
             }
         }
-        write_memory(s, block, s->start, size, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
+        write_memory(s, block, s->start, size, errp);
+        if (*errp) {
             return;
         }
 
@@ -669,11 +656,10 @@ static void dump_iterate(DumpState *s, Error **errp)
 
 static void create_vmcore(DumpState *s, Error **errp)
 {
-    Error *local_err = NULL;
+    ERRP_GUARD();
 
-    dump_begin(s, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    dump_begin(s, errp);
+    if (*errp) {
         return;
     }
 
@@ -810,6 +796,7 @@ static bool note_name_equal(DumpState *s,
 /* write common header, sub header and elf note to vmcore */
 static void create_header32(DumpState *s, Error **errp)
 {
+    ERRP_GUARD();
     DiskDumpHeader32 *dh = NULL;
     KdumpSubHeader32 *kh = NULL;
     size_t size;
@@ -818,7 +805,6 @@ static void create_header32(DumpState *s, Error **errp)
     uint32_t bitmap_blocks;
     uint32_t status = 0;
     uint64_t offset_note;
-    Error *local_err = NULL;
 
     /* write common header, the version of kdump-compressed format is 6th */
     size = sizeof(DiskDumpHeader32);
@@ -894,9 +880,8 @@ static void create_header32(DumpState *s, Error **errp)
     s->note_buf_offset = 0;
 
     /* use s->note_buf to store notes temporarily */
-    write_elf32_notes(buf_write_note, s, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    write_elf32_notes(buf_write_note, s, errp);
+    if (*errp) {
         goto out;
     }
     if (write_buffer(s->fd, offset_note, s->note_buf,
@@ -922,6 +907,7 @@ out:
 /* write common header, sub header and elf note to vmcore */
 static void create_header64(DumpState *s, Error **errp)
 {
+    ERRP_GUARD();
     DiskDumpHeader64 *dh = NULL;
     KdumpSubHeader64 *kh = NULL;
     size_t size;
@@ -930,7 +916,6 @@ static void create_header64(DumpState *s, Error **errp)
     uint32_t bitmap_blocks;
     uint32_t status = 0;
     uint64_t offset_note;
-    Error *local_err = NULL;
 
     /* write common header, the version of kdump-compressed format is 6th */
     size = sizeof(DiskDumpHeader64);
@@ -1006,9 +991,8 @@ static void create_header64(DumpState *s, Error **errp)
     s->note_buf_offset = 0;
 
     /* use s->note_buf to store notes temporarily */
-    write_elf64_notes(buf_write_note, s, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    write_elf64_notes(buf_write_note, s, errp);
+    if (*errp) {
         goto out;
     }
 
@@ -1464,8 +1448,8 @@ out:
 
 static void create_kdump_vmcore(DumpState *s, Error **errp)
 {
+    ERRP_GUARD();
     int ret;
-    Error *local_err = NULL;
 
     /*
      * the kdump-compressed format is:
@@ -1495,21 +1479,18 @@ static void create_kdump_vmcore(DumpState *s, Error **errp)
         return;
     }
 
-    write_dump_header(s, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    write_dump_header(s, errp);
+    if (*errp) {
         return;
     }
 
-    write_dump_bitmap(s, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    write_dump_bitmap(s, errp);
+    if (*errp) {
         return;
     }
 
-    write_dump_pages(s, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    write_dump_pages(s, errp);
+    if (*errp) {
         return;
     }
 
@@ -1639,10 +1620,10 @@ static void dump_init(DumpState *s, int fd, bool has_format,
                       DumpGuestMemoryFormat format, bool paging, bool has_filter,
                       int64_t begin, int64_t length, Error **errp)
 {
+    ERRP_GUARD();
     VMCoreInfoState *vmci = vmcoreinfo_find();
     CPUState *cpu;
     int nr_cpus;
-    Error *err = NULL;
     int ret;
 
     s->has_format = has_format;
@@ -1761,9 +1742,8 @@ static void dump_init(DumpState *s, int fd, bool has_format,
 
     /* get memory mapping */
     if (paging) {
-        qemu_get_guest_memory_mapping(&s->list, &s->guest_phys_blocks, &err);
-        if (err != NULL) {
-            error_propagate(errp, err);
+        qemu_get_guest_memory_mapping(&s->list, &s->guest_phys_blocks, errp);
+        if (*errp) {
             goto cleanup;
         }
     } else {
@@ -1862,33 +1842,32 @@ cleanup:
 /* this operation might be time consuming. */
 static void dump_process(DumpState *s, Error **errp)
 {
-    Error *local_err = NULL;
+    ERRP_GUARD();
     DumpQueryResult *result = NULL;
 
     if (s->has_format && s->format == DUMP_GUEST_MEMORY_FORMAT_WIN_DMP) {
 #ifdef TARGET_X86_64
-        create_win_dump(s, &local_err);
+        create_win_dump(s, errp);
 #endif
     } else if (s->has_format && s->format != DUMP_GUEST_MEMORY_FORMAT_ELF) {
-        create_kdump_vmcore(s, &local_err);
+        create_kdump_vmcore(s, errp);
     } else {
-        create_vmcore(s, &local_err);
+        create_vmcore(s, errp);
     }
 
     /* make sure status is written after written_size updates */
     smp_wmb();
     qatomic_set(&s->status,
-               (local_err ? DUMP_STATUS_FAILED : DUMP_STATUS_COMPLETED));
+               (*errp ? DUMP_STATUS_FAILED : DUMP_STATUS_COMPLETED));
 
     /* send DUMP_COMPLETED message (unconditionally) */
     result = qmp_query_dump(NULL);
     /* should never fail */
     assert(result);
-    qapi_event_send_dump_completed(result, !!local_err, (local_err ?
-                                   error_get_pretty(local_err) : NULL));
+    qapi_event_send_dump_completed(result, !!*errp, (*errp ?
+                                                     error_get_pretty(*errp) : NULL));
     qapi_free_DumpQueryResult(result);
 
-    error_propagate(errp, local_err);
     dump_cleanup(s);
 }
 
@@ -1917,10 +1896,10 @@ void qmp_dump_guest_memory(bool paging, const char *file,
                            int64_t length, bool has_format,
                            DumpGuestMemoryFormat format, Error **errp)
 {
+    ERRP_GUARD();
     const char *p;
     int fd = -1;
     DumpState *s;
-    Error *local_err = NULL;
     bool detach_p = false;
 
     if (runstate_check(RUN_STATE_INMIGRATE)) {
@@ -2020,9 +1999,8 @@ void qmp_dump_guest_memory(bool paging, const char *file,
     dump_state_prepare(s);
 
     dump_init(s, fd, has_format, format, paging, has_begin,
-              begin, length, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+              begin, length, errp);
+    if (*errp) {
         qatomic_set(&s->status, DUMP_STATUS_FAILED);
         return;
     }
-- 
2.32.0


