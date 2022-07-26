Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DB658101F
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 11:41:59 +0200 (CEST)
Received: from localhost ([::1]:58892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGH4g-0001HS-RS
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 05:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oGGn9-0004Td-Tr; Tue, 26 Jul 2022 05:23:51 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:61786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oGGn8-0005Zl-2j; Tue, 26 Jul 2022 05:23:51 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26Q9LY9S006820;
 Tue, 26 Jul 2022 09:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=TWNFPLetfuYq3GnO6Ykr6Rxzu2X2prDjwxYveKUbppU=;
 b=jDTKvBBv82VlbKrIelXb7ixznDpeiJLmMxncqgqaVAij9moTbeIfLqFe3fckRbgKjrz+
 4VQ9V3o4j68PqNc+tOl5XwQtW5HNqeuwwBABi195iZGYTq6gmqOYUp5DqF9xYCbyOrDB
 wwRvhQuTrT1pUKysEge2nVlHVpYMOZ71tCGXZcpj9lP32KHVKUmoQLZ4HVs92XWLvH0V
 Tv7K97izwStgo3TnnSYBmGBqEg8q+OgPtdxI15kPYyqsQDOW+TkGp2gKrB9i9+ZvQSEs
 DfV8RLb+g4PdOYQXXXzAaB6um7ABSUiNB1w6zG4nCLw3J6DqejPrJ7eN+Ps0nTzKbnBV ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hjdjpr1ub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 09:23:48 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26Q9NVGs018418;
 Tue, 26 Jul 2022 09:23:48 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hjdjpr1th-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 09:23:48 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26Q9LFjr026308;
 Tue, 26 Jul 2022 09:23:46 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 3hg96wkjtc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 09:23:46 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26Q9NhP414680358
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 09:23:43 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 372B9A405C;
 Tue, 26 Jul 2022 09:23:43 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1652BA4054;
 Tue, 26 Jul 2022 09:23:42 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 26 Jul 2022 09:23:41 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com, scgl@linux.ibm.com
Subject: [PATCH v4 11/17] dump/dump: Add section string table support
Date: Tue, 26 Jul 2022 09:22:42 +0000
Message-Id: <20220726092248.128336-12-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220726092248.128336-1-frankja@linux.ibm.com>
References: <20220726092248.128336-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sTbdFMMNiC8Bz5D8TZ7i8wSuUE8F4zKA
X-Proofpoint-ORIG-GUID: YNY3w9clBnBlX52cFIDYdd_W4SLLMdyl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_02,2022-07-25_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207260033
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

As sections don't have a type like the notes do we need another way to
determine their contents. The string table allows us to assign each
section an identification string which architectures can then use to
tag their sections with.

There will be no string table if the architecture doesn't add custom
sections which are introduced in a following patch.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 dump/dump.c           | 81 ++++++++++++++++++++++++++++++++++++++++++-
 include/sysemu/dump.h |  1 +
 2 files changed, 81 insertions(+), 1 deletion(-)

diff --git a/dump/dump.c b/dump/dump.c
index 3cf846d0a0..298a1e923f 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -99,6 +99,7 @@ static int dump_cleanup(DumpState *s)
     close(s->fd);
     g_free(s->guest_note);
     g_free(s->elf_header);
+    g_array_unref(s->string_table_buf);
     s->guest_note = NULL;
     if (s->resume) {
         if (s->detached) {
@@ -357,21 +358,72 @@ static size_t prepare_elf_section_hdr_zero(DumpState *s)
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
     size_t len, sizeof_shdr;
+    Elf64_Ehdr *hdr64 = s->elf_header;
+    Elf32_Ehdr *hdr32 = s->elf_header;
+    void *buff_hdr;
 
     /*
      * Section ordering:
      * - HDR zero (if needed)
+     * - String table hdr
      */
     sizeof_shdr = dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
     len = sizeof_shdr * s->shdr_num;
     s->elf_section_hdrs = g_malloc0(len);
+    buff_hdr = s->elf_section_hdrs;
 
     /* Write special section first */
     if (s->phdr_num == PN_XNUM) {
         prepare_elf_section_hdr_zero(s);
+        buff_hdr += sizeof_shdr;
+    }
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
     }
 }
 
@@ -401,11 +453,18 @@ static void write_elf_sections(DumpState *s, Error **errp)
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
@@ -713,6 +772,7 @@ static void create_vmcore(DumpState *s, Error **errp)
         return;
     }
 
+    /* Iterate over memory and dump it to file */
     dump_iterate(s, errp);
     if (*errp) {
         return;
@@ -1695,6 +1755,13 @@ static void dump_init(DumpState *s, int fd, bool has_format,
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
 
@@ -1855,6 +1922,18 @@ static void dump_init(DumpState *s, int fd, bool has_format,
         }
     }
 
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
+    }
+
     tmp = (s->phdr_num == PN_XNUM) ? s->sh_info : s->phdr_num;
     if (dump_is_64bit(s)) {
         s->shdr_offset = sizeof(Elf64_Ehdr);
diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
index 696e6c67d6..299b611180 100644
--- a/include/sysemu/dump.h
+++ b/include/sysemu/dump.h
@@ -178,6 +178,7 @@ typedef struct DumpState {
     void *elf_section_hdrs;
     uint64_t elf_section_data_size;
     void *elf_section_data;
+    GArray *string_table_buf;  /* String table section */
 
     uint8_t *note_buf;          /* buffer for notes */
     size_t note_buf_offset;     /* the writing place in note_buf */
-- 
2.34.1


