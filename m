Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2616C4D45B5
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:32:31 +0100 (CET)
Received: from localhost ([::1]:37436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSH1y-0002DQ-7E
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:32:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nSGmd-0004Ge-OL
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:16:40 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:42518
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nSGmb-0005t4-6X
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:16:39 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22ABEWcL025811
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=qVu2Erh61J7rw6GKWhuxsf80nSZOEzeoUcw18mQnUqE=;
 b=VFkqqa3/zEB1B3XN2/LBfGUKZsN2LPRcwT2QYIw6eWcCGWg5EHp1C+TfRU/BRiI+MTxZ
 dCXy8CXWNWOvN/oxuaugwQrIPZDsFVVMgwDj/mwlXz2qXUKUJ1Sbei5hyP22gsQHkRjp
 KSyz82DeCc2feGRk3P12MManUeh2vJ3lLAvVLjhn95aA4pfeOVfEY5s5emZB8ogWG3xg
 nOe/3GUQWgcHRrNEn1K/1+Gt1h3m4Y44sECW4D7+f04zmDyxne+qCzw+1VPLuGFLuON2
 iU0Tyh5jee0BDxxVcgSOzy/8QWeXdLUevTHTvgGflfkfmg0Epem6IglIhrg8KFtEjN7f Aw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eqg9dg1b2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:16:36 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22ABEhGr026474
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:16:35 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eqg9dg1ap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:16:35 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22ABC0vS024030;
 Thu, 10 Mar 2022 11:16:34 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3enqgnq1py-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:16:33 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22ABGVgo52691208
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 11:16:31 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BCCDA4C040;
 Thu, 10 Mar 2022 11:16:31 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E7164C046;
 Thu, 10 Mar 2022 11:16:31 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 10 Mar 2022 11:16:31 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] dump/dump: Add section string table support
Date: Thu, 10 Mar 2022 11:16:07 +0000
Message-Id: <20220310111608.3362-5-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220310111608.3362-1-frankja@linux.ibm.com>
References: <20220310111608.3362-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: m9TgBqwHimZSZgQkXMBlGzMlOEiU5UnD
X-Proofpoint-ORIG-GUID: Yj3PkZ5mKYp8Cj0E-D4Gxci2NpRL9xt7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-10_03,2022-03-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203100059
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
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
Cc: marcandre.lureau@redhat.com, mhartmay@linux.ibm.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Time to add a bit more descriptiveness to the dumps.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 dump/dump.c           | 106 ++++++++++++++++++++++++++++++++++++------
 include/sysemu/dump.h |   1 +
 2 files changed, 94 insertions(+), 13 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index e4198e8f3e..7b3fd6a065 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -100,6 +100,7 @@ static int dump_cleanup(DumpState *s)
     close(s->fd);
     g_free(s->guest_note);
     g_free(s->elf_header);
+    g_array_unref(s->string_table_buf);
     s->guest_note = NULL;
     if (s->resume) {
         if (s->detached) {
@@ -357,14 +358,47 @@ static size_t write_elf_section_hdr_zero(DumpState *s, void *buff)
     return dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
 }
 
+static void write_elf_section_hdr_string(DumpState *s, void *buff)
+{
+    Elf32_Shdr shdr32;
+    Elf64_Shdr shdr64;
+    int shdr_size;
+    void *shdr = buff;
+
+    if (dump_is_64bit(s)) {
+        shdr_size = sizeof(Elf64_Shdr);
+        memset(&shdr64, 0, shdr_size);
+        shdr64.sh_type = SHT_STRTAB;
+        shdr64.sh_offset = s->section_offset + s->elf_section_data_size;
+        shdr64.sh_name = s->string_table_buf->len;
+        g_array_append_vals(s->string_table_buf, ".strtab", sizeof(".strtab"));
+        shdr64.sh_size = s->string_table_buf->len;
+        shdr = &shdr64;
+    } else {
+        shdr_size = sizeof(Elf32_Shdr);
+        memset(&shdr32, 0, shdr_size);
+        shdr32.sh_type = SHT_STRTAB;
+        shdr32.sh_offset = s->section_offset + s->elf_section_data_size;
+        shdr32.sh_name = s->string_table_buf->len;
+        g_array_append_vals(s->string_table_buf, ".strtab", sizeof(".strtab"));
+        shdr32.sh_size = s->string_table_buf->len;
+        shdr = &shdr32;
+    }
+
+    memcpy(buff, shdr, shdr_size);
+}
+
 static void prepare_elf_section_hdrs(DumpState *s)
 {
     uint8_t *buff_hdr;
-    size_t len, sizeof_shdr;
+    size_t len, size = 0, sizeof_shdr;
+    Elf64_Ehdr *hdr64 = s->elf_header;
+    Elf32_Ehdr *hdr32 = s->elf_header;
 
     /*
      * Section ordering:
      * - HDR zero (if needed)
+     * - String table hdr
      */
     sizeof_shdr = dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
     len = sizeof_shdr * s->shdr_num ;
@@ -375,6 +409,22 @@ static void prepare_elf_section_hdrs(DumpState *s)
     if (s->phdr_num == PN_XNUM) {
             write_elf_section_hdr_zero(s, buff_hdr);
     }
+    buff_hdr += size;
+
+    if (s->shdr_num < 2) {
+        return;
+    }
+
+    /*
+     * String table needs to be last section since strings are added
+     * via arch_sections_write_hdr().
+     */
+    write_elf_section_hdr_string(s, buff_hdr);
+    if (dump_is_64bit(s)) {
+        hdr64->e_shstrndx = cpu_to_dump16(s, s->shdr_num - 1);
+    } else {
+        hdr32->e_shstrndx = cpu_to_dump16(s, s->shdr_num - 1);
+    }
 }
 
 static void prepare_elf_sections(DumpState *s, Error **errp)
@@ -403,11 +453,18 @@ static void write_elf_sections(DumpState *s, Error **errp)
 {
     int ret;
 
-    /* Write section zero */
+    /* Write section zero and arch sections */
     ret = fd_write_vmcore(s->elf_section_data, s->elf_section_data_size, s);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "dump: failed to write section data");
     }
+
+    /* Write string table data */
+    ret = fd_write_vmcore(s->string_table_buf->data,
+                          s->string_table_buf->len, s);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "dump: failed to write string table data");
+    }
 }
 
 static void write_data(DumpState *s, void *buf, int length, Error **errp)
@@ -595,6 +652,9 @@ static void dump_begin(DumpState *s, Error **errp)
      *   --------------
      *   |  memory     |
      *   --------------
+     *   |  sectn data |
+     *   --------------
+
      *
      * we only know where the memory is saved after we write elf note into
      * vmcore.
@@ -709,6 +769,7 @@ static void create_vmcore(DumpState *s, Error **errp)
         return;
     }
 
+    /* Iterate over memory and dump it to file */
     dump_iterate(s, errp);
 
     /* Write section data after memory has been dumped */
@@ -1704,6 +1765,13 @@ static void dump_init(DumpState *s, int fd, bool has_format,
     s->has_filter = has_filter;
     s->begin = begin;
     s->length = length;
+    /* First index is 0, it's the special null name */
+    s->string_table_buf = g_array_new(FALSE, TRUE, 1);
+    /*
+     * Allocate the null name, due to the clearing option set to true
+     * it will be 0.
+     */
+    g_array_set_size(s->string_table_buf, 1);
 
     memory_mapping_list_init(&s->list);
 
@@ -1864,19 +1932,31 @@ static void dump_init(DumpState *s, int fd, bool has_format,
         }
     }
 
-    if (dump_is_64bit(s)) {
-        s->phdr_offset = sizeof(Elf64_Ehdr);
-        s->shdr_offset = s->phdr_offset + sizeof(Elf64_Phdr) * s->phdr_num;
-        s->note_offset = s->shdr_offset + sizeof(Elf64_Shdr) * s->shdr_num;
-        s->memory_offset = s->note_offset + s->note_size;
-    } else {
-
-        s->phdr_offset = sizeof(Elf32_Ehdr);
-        s->shdr_offset = s->phdr_offset + sizeof(Elf32_Phdr) * s->phdr_num;
-        s->note_offset = s->shdr_offset + sizeof(Elf32_Shdr) * s->shdr_num;
-        s->memory_offset = s->note_offset + s->note_size;
+    /*
+     * calculate shdr_num and elf_section_data_size so we know the offsets and
+     * sizes of all parts.
+     *
+     * If phdr_num overflowed we have at least one section header
+     * More sections/hdrs can be added by the architectures
+     */
+    if (s->shdr_num > 1) {
+        /* Reserve the string table */
+        s->shdr_num += 1;
     }
 
+    tmp = (s->phdr_num == PN_XNUM) ? s->sh_info : s->phdr_num;
+    if (dump_is_64bit(s)) {
+        s->shdr_offset = sizeof(Elf64_Ehdr);
+        s->phdr_offset = s->shdr_offset + sizeof(Elf64_Shdr) * s->shdr_num;
+        s->note_offset = s->phdr_offset + sizeof(Elf64_Phdr) * tmp;
+    } else {
+        s->shdr_offset = sizeof(Elf32_Ehdr);
+        s->phdr_offset = s->shdr_offset + sizeof(Elf32_Shdr) * s->shdr_num;
+        s->note_offset = s->phdr_offset + sizeof(Elf32_Phdr) * tmp;
+    }
+    s->memory_offset = s->note_offset + s->note_size;
+    s->section_offset = s->memory_offset + s->total_size;
+
     return;
 
 cleanup:
diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
index 186348a972..9a000e7483 100644
--- a/include/sysemu/dump.h
+++ b/include/sysemu/dump.h
@@ -180,6 +180,7 @@ typedef struct DumpState {
     void *elf_section_hdrs;
     uint64_t elf_section_data_size;
     void *elf_section_data;
+    GArray *string_table_buf;  /* String table section */
 
     uint8_t *note_buf;          /* buffer for notes */
     size_t note_buf_offset;     /* the writing place in note_buf */
-- 
2.32.0


