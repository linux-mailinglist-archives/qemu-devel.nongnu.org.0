Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 434D8600979
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 10:56:16 +0200 (CEST)
Received: from localhost ([::1]:56694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okLux-0004vj-7O
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 04:56:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1okLf0-0007ts-D9; Mon, 17 Oct 2022 04:39:46 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:46948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1okLeu-0003fb-6K; Mon, 17 Oct 2022 04:39:44 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29H6qt89017339;
 Mon, 17 Oct 2022 08:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=A4HQ6E713KcKxEA4GIs7jkRLHX/WzDGi+jfZtAVL2XE=;
 b=Vq7KjK3nEz79DgHLE2EQfhdejIjVOCGEvHvPeiKJATPou9QhDYpvWzv5zIgPQgg8Zyhb
 Z164uSx4YWi20g2TDOg9F5xYYuBkJKw4zuWkH9qAfZ/RYt8qgiVsLHeyB17ccum+wg7i
 XRIola9LL492DmotLdqu0jUk4+24w6ARoATgI4E0BkelPYo/XyFq4Ix7NGvRLS67S5Pu
 jAn6R40TUnsB1myrwYnyOPI9yDu4KhHszmM7yOJJWODGEHf9nKlKZnguPBE+ngJgO5Eq
 0KnJH5Xd/4jCsKiOh81yyRlH6SVYlxqv90QshpygTS6gDeABJOwcrz/rwVJQ86YNbthw 3g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k86sjhtnw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 08:39:38 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29H6RvqB013832;
 Mon, 17 Oct 2022 08:39:38 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k86sjhtn6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 08:39:37 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29H8cv8O030308;
 Mon, 17 Oct 2022 08:39:35 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3k7m4jjncd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 08:39:35 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29H8dWtw4915858
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Oct 2022 08:39:32 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 378D9A404D;
 Mon, 17 Oct 2022 08:39:32 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B918A4051;
 Mon, 17 Oct 2022 08:39:31 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 17 Oct 2022 08:39:30 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com, scgl@linux.ibm.com
Subject: [PATCH v6 05/10] dump: Add architecture section and section string
 table support
Date: Mon, 17 Oct 2022 08:38:17 +0000
Message-Id: <20221017083822.43118-6-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017083822.43118-1-frankja@linux.ibm.com>
References: <20221017083822.43118-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UqaRDZUJgzEIvlYlvYwZH4RUziE-WA6-
X-Proofpoint-GUID: VFV_tWfcsOc_RIaqkQXIFJquDFMBVKsm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-17_07,2022-10-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 spamscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210170049
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
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

Add hooks which architectures can use to add arbitrary data to custom
sections.

Also add a section name string table in order to identify section
contents

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 dump/dump.c                | 190 +++++++++++++++++++++++++++++++------
 include/sysemu/dump-arch.h |   3 +
 include/sysemu/dump.h      |   3 +
 3 files changed, 168 insertions(+), 28 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 626f7b2fd0..b5bc4f7119 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -103,6 +103,7 @@ static int dump_cleanup(DumpState *s)
     memory_mapping_list_free(&s->list);
     close(s->fd);
     g_free(s->guest_note);
+    g_array_unref(s->string_table_buf);
     s->guest_note = NULL;
     if (s->resume) {
         if (s->detached) {
@@ -152,11 +153,10 @@ static void prepare_elf64_header(DumpState *s, Elf64_Ehdr *elf_header)
     elf_header->e_phoff = cpu_to_dump64(s, s->phdr_offset);
     elf_header->e_phentsize = cpu_to_dump16(s, sizeof(Elf64_Phdr));
     elf_header->e_phnum = cpu_to_dump16(s, phnum);
-    if (s->shdr_num) {
-        elf_header->e_shoff = cpu_to_dump64(s, s->shdr_offset);
-        elf_header->e_shentsize = cpu_to_dump16(s, sizeof(Elf64_Shdr));
-        elf_header->e_shnum = cpu_to_dump16(s, s->shdr_num);
-    }
+    elf_header->e_shoff = cpu_to_dump64(s, s->shdr_offset);
+    elf_header->e_shentsize = cpu_to_dump16(s, sizeof(Elf64_Shdr));
+    elf_header->e_shnum = cpu_to_dump16(s, s->shdr_num);
+    elf_header->e_shstrndx = cpu_to_dump16(s, s->shdr_num - 1);
 }
 
 static void prepare_elf32_header(DumpState *s, Elf32_Ehdr *elf_header)
@@ -180,11 +180,10 @@ static void prepare_elf32_header(DumpState *s, Elf32_Ehdr *elf_header)
     elf_header->e_phoff = cpu_to_dump32(s, s->phdr_offset);
     elf_header->e_phentsize = cpu_to_dump16(s, sizeof(Elf32_Phdr));
     elf_header->e_phnum = cpu_to_dump16(s, phnum);
-    if (s->shdr_num) {
-        elf_header->e_shoff = cpu_to_dump32(s, s->shdr_offset);
-        elf_header->e_shentsize = cpu_to_dump16(s, sizeof(Elf32_Shdr));
-        elf_header->e_shnum = cpu_to_dump16(s, s->shdr_num);
-    }
+    elf_header->e_shoff = cpu_to_dump32(s, s->shdr_offset);
+    elf_header->e_shentsize = cpu_to_dump16(s, sizeof(Elf32_Shdr));
+    elf_header->e_shnum = cpu_to_dump16(s, s->shdr_num);
+    elf_header->e_shstrndx = cpu_to_dump16(s, s->shdr_num - 1);
 }
 
 static void write_elf_header(DumpState *s, Error **errp)
@@ -195,6 +194,8 @@ static void write_elf_header(DumpState *s, Error **errp)
     void *header_ptr;
     int ret;
 
+    /* The NULL header and the shstrtab are always defined */
+    assert(s->shdr_num >= 2);
     if (dump_is_64bit(s)) {
         prepare_elf64_header(s, &elf64_header);
         header_size = sizeof(elf64_header);
@@ -393,17 +394,49 @@ static void prepare_elf_section_hdr_zero(DumpState *s)
     }
 }
 
-static void prepare_elf_section_hdrs(DumpState *s)
+static void prepare_elf_section_hdr_string(DumpState *s, void *buff)
+{
+    uint64_t index = s->string_table_buf->len;
+    const char strtab[] = ".shstrtab";
+    Elf32_Shdr shdr32 = {};
+    Elf64_Shdr shdr64 = {};
+    int shdr_size;
+    void *shdr;
+
+    g_array_append_vals(s->string_table_buf, strtab, sizeof(strtab));
+    if (dump_is_64bit(s)) {
+        shdr_size = sizeof(Elf64_Shdr);
+        shdr64.sh_type = SHT_STRTAB;
+        shdr64.sh_offset = s->section_offset + s->elf_section_data_size;
+        shdr64.sh_name = index;
+        shdr64.sh_size = s->string_table_buf->len;
+        shdr = &shdr64;
+    } else {
+        shdr_size = sizeof(Elf32_Shdr);
+        shdr32.sh_type = SHT_STRTAB;
+        shdr32.sh_offset = s->section_offset + s->elf_section_data_size;
+        shdr32.sh_name = index;
+        shdr32.sh_size = s->string_table_buf->len;
+        shdr = &shdr32;
+    }
+    memcpy(buff, shdr, shdr_size);
+}
+
+static int prepare_elf_section_hdrs(DumpState *s, Error **errp)
 {
     size_t len, sizeof_shdr;
+    void *buff_hdr;
 
     /*
      * Section ordering:
      * - HDR zero
+     * - Arch section hdrs
+     * - String table hdr
      */
     sizeof_shdr = dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
     len = sizeof_shdr * s->shdr_num;
     s->elf_section_hdrs = g_malloc0(len);
+    buff_hdr = s->elf_section_hdrs;
 
     /*
      * The first section header is ALWAYS a special initial section
@@ -419,6 +452,26 @@ static void prepare_elf_section_hdrs(DumpState *s)
     if (s->phdr_num >= PN_XNUM) {
         prepare_elf_section_hdr_zero(s);
     }
+    buff_hdr += sizeof_shdr;
+
+    /* Add architecture defined section headers */
+    if (s->dump_info.arch_sections_write_hdr_fn
+        && s->shdr_num > 2) {
+        buff_hdr += s->dump_info.arch_sections_write_hdr_fn(s, buff_hdr);
+
+        if (s->shdr_num >= SHN_LORESERVE) {
+            error_setg_errno(errp, EINVAL,
+                             "dump: too many architecture defined sections");
+            return -EINVAL;
+        }
+    }
+
+    /*
+     * String table is the last section since strings are added via
+     * arch_sections_write_hdr().
+     */
+    prepare_elf_section_hdr_string(s, buff_hdr);
+    return 0;
 }
 
 static void write_elf_section_headers(DumpState *s, Error **errp)
@@ -426,7 +479,9 @@ static void write_elf_section_headers(DumpState *s, Error **errp)
     size_t sizeof_shdr = dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
     int ret;
 
-    prepare_elf_section_hdrs(s);
+    if (prepare_elf_section_hdrs(s, errp)) {
+        return;
+    }
 
     ret = fd_write_vmcore(s->elf_section_hdrs, s->shdr_num * sizeof_shdr, s);
     if (ret < 0) {
@@ -436,6 +491,29 @@ static void write_elf_section_headers(DumpState *s, Error **errp)
     g_free(s->elf_section_hdrs);
 }
 
+static void write_elf_sections(DumpState *s, Error **errp)
+{
+    int ret;
+
+    if (s->elf_section_data_size) {
+        /* Write architecture section data */
+        ret = fd_write_vmcore(s->elf_section_data,
+                              s->elf_section_data_size, s);
+        if (ret < 0) {
+            error_setg_errno(errp, -ret,
+                             "dump: failed to write architecture section data");
+            return;
+        }
+    }
+
+    /* Write string table */
+    ret = fd_write_vmcore(s->string_table_buf->data,
+                          s->string_table_buf->len, s);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "dump: failed to write string table data");
+    }
+}
+
 static void write_data(DumpState *s, void *buf, int length, Error **errp)
 {
     int ret;
@@ -692,6 +770,31 @@ static void dump_iterate(DumpState *s, Error **errp)
     }
 }
 
+static void dump_end(DumpState *s, Error **errp)
+{
+    int rc;
+    ERRP_GUARD();
+
+    if (s->elf_section_data_size) {
+        s->elf_section_data = g_malloc0(s->elf_section_data_size);
+    }
+
+    /* Adds the architecture defined section data to s->elf_section_data  */
+    if (s->dump_info.arch_sections_write_fn &&
+        s->elf_section_data_size) {
+        rc = s->dump_info.arch_sections_write_fn(s, s->elf_section_data);
+        if (rc) {
+            error_setg_errno(errp, rc,
+                             "dump: failed to get arch section data");
+            g_free(s->elf_section_data);
+            return;
+        }
+    }
+
+    /* write sections to vmcore */
+    write_elf_sections(s, errp);
+}
+
 static void create_vmcore(DumpState *s, Error **errp)
 {
     ERRP_GUARD();
@@ -701,7 +804,14 @@ static void create_vmcore(DumpState *s, Error **errp)
         return;
     }
 
+    /* Iterate over memory and dump it to file */
     dump_iterate(s, errp);
+    if (*errp) {
+        return;
+    }
+
+    /* Write the section data */
+    dump_end(s, errp);
 }
 
 static int write_start_flat_header(int fd)
@@ -1711,6 +1821,14 @@ static void dump_init(DumpState *s, int fd, bool has_format,
     s->filter_area_begin = begin;
     s->filter_area_length = length;
 
+    /* First index is 0, it's the special null name */
+    s->string_table_buf = g_array_new(FALSE, TRUE, 1);
+    /*
+     * Allocate the null name, due to the clearing option set to true
+     * it will be 0.
+     */
+    g_array_set_size(s->string_table_buf, 1);
+
     memory_mapping_list_init(&s->list);
 
     guest_phys_blocks_init(&s->guest_phys_blocks);
@@ -1847,26 +1965,42 @@ static void dump_init(DumpState *s, int fd, bool has_format,
     }
 
     /*
-     * calculate phdr_num
-     *
-     * the type of ehdr->e_phnum is uint16_t, so we should avoid overflow
+     * The first section header is always a special one in which most
+     * fields are 0. The section header string table is also always
+     * set.
      */
-    s->phdr_num = 1; /* PT_NOTE */
-    if (s->list.num < UINT16_MAX - 2) {
-        s->shdr_num = 0;
-        s->phdr_num += s->list.num;
-    } else {
-        /* sh_info of section 0 holds the real number of phdrs */
-        s->shdr_num = 1;
+    s->shdr_num = 2;
 
-        /* the type of shdr->sh_info is uint32_t, so we should avoid overflow */
-        if (s->list.num <= UINT32_MAX - 1) {
-            s->phdr_num += s->list.num;
-        } else {
-            s->phdr_num = UINT32_MAX;
-        }
+    /*
+     * Adds the number of architecture sections to shdr_num and sets
+     * elf_section_data_size so we know the offsets and sizes of all
+     * parts.
+     */
+    if (s->dump_info.arch_sections_add_fn) {
+        s->dump_info.arch_sections_add_fn(s);
     }
 
+    /*
+     * calculate shdr_num so we know the offsets and sizes of all
+     * parts.
+     * Calculate phdr_num
+     *
+     * The absolute maximum amount of phdrs is UINT32_MAX - 1 as
+     * sh_info is 32 bit. There's special handling once we go over
+     * UINT16_MAX - 1 but that is handled in the ehdr and section
+     * code.
+     */
+    s->phdr_num = 1; /* Reserve PT_NOTE */
+    if (s->list.num <= UINT32_MAX - 1) {
+        s->phdr_num += s->list.num;
+    } else {
+        s->phdr_num = UINT32_MAX;
+    }
+
+    /*
+     * Now that the number of section and program headers is known we
+     * can calculate the offsets of the headers and data.
+     */
     if (dump_is_64bit(s)) {
         s->shdr_offset = sizeof(Elf64_Ehdr);
         s->phdr_offset = s->shdr_offset + sizeof(Elf64_Shdr) * s->shdr_num;
diff --git a/include/sysemu/dump-arch.h b/include/sysemu/dump-arch.h
index e25b02e990..59bbc9be38 100644
--- a/include/sysemu/dump-arch.h
+++ b/include/sysemu/dump-arch.h
@@ -21,6 +21,9 @@ typedef struct ArchDumpInfo {
     uint32_t page_size;      /* The target's page size. If it's variable and
                               * unknown, then this should be the maximum. */
     uint64_t phys_base;      /* The target's physmem base. */
+    void (*arch_sections_add_fn)(DumpState *s);
+    uint64_t (*arch_sections_write_hdr_fn)(DumpState *s, uint8_t *buff);
+    int (*arch_sections_write_fn)(DumpState *s, uint8_t *buff);
 } ArchDumpInfo;
 
 struct GuestPhysBlockList; /* memory_mapping.h */
diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
index 9ed811b313..38ccac7190 100644
--- a/include/sysemu/dump.h
+++ b/include/sysemu/dump.h
@@ -180,6 +180,9 @@ typedef struct DumpState {
     hwaddr note_offset;
 
     void *elf_section_hdrs;     /* Pointer to section header buffer */
+    void *elf_section_data;     /* Pointer to section data buffer */
+    uint64_t elf_section_data_size; /* Size of section data */
+    GArray *string_table_buf;   /* String table data buffer */
 
     uint8_t *note_buf;          /* buffer for notes */
     size_t note_buf_offset;     /* the writing place in note_buf */
-- 
2.34.1


