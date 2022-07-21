Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D220957CC02
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 15:33:43 +0200 (CEST)
Received: from localhost ([::1]:46122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEWJC-0005vU-Qf
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 09:33:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oEW9b-0000c1-JO; Thu, 21 Jul 2022 09:23:47 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:52162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oEW9Z-0006Xs-PA; Thu, 21 Jul 2022 09:23:47 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26LDDwYN001859;
 Thu, 21 Jul 2022 13:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=v4BYRU/lytNL925iyKrTX95grUvN4n/36ru0uKxLLQY=;
 b=TXLUSFWvZcqOWY+ZPQ2x0e3Z7tbRfGHd/TTLhgC4yvyJ4Z7mjUL18vMp7/EAMrlfq+Wa
 YGg0ooulbBYksdlIsUv3UEDLwOHrY11e+4z5d0z2fWPfa6CATqbM8bUyMwU3GFyr8s/Z
 DrEw7rpNWhdwhtgPQ/uXw2E5QQVDd5JupbRDoPGUgX03gc7cXS9+6Q4qzFw5Ywt0Uf55
 xTLSH9reG3UqGnzwY+HZA+A6qx30vOz4OnYt7G+yQ3ApQAknkyVjHNR4JVvrsU4fgD4O
 6bbIZK35FAMulvmfzAbW9LhteYQZ5wEpXn0TbpfZ6FBEMZkiH3YTcabbuyQZVxOiC2ai hg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hf74q9ayw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 13:23:43 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26LDE2gY002538;
 Thu, 21 Jul 2022 13:23:42 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hf74q9ay3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 13:23:42 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26LDNKen028555;
 Thu, 21 Jul 2022 13:23:40 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 3hbmy8y4xp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 13:23:40 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26LDNabk24773102
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jul 2022 13:23:37 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D91814C046;
 Thu, 21 Jul 2022 13:23:36 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB0364C044;
 Thu, 21 Jul 2022 13:23:35 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 21 Jul 2022 13:23:35 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com
Subject: [PATCH v3 08/14] dump/dump: Add section string table support
Date: Thu, 21 Jul 2022 13:22:50 +0000
Message-Id: <20220721132256.2171-9-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220721132256.2171-1-frankja@linux.ibm.com>
References: <20220721132256.2171-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ggh9sijvVsfNeKlC0kEyZlZMWejEeQwb
X-Proofpoint-ORIG-GUID: 7GZHN_o3y20vF240BGtImrJkc43SFHgT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-21_16,2022-07-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207210053
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
 dump/dump.c           | 81 +++++++++++++++++++++++++++++++++++++++++--
 include/sysemu/dump.h |  1 +
 2 files changed, 80 insertions(+), 2 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 6f3274c5af..944217349a 100644
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
@@ -357,14 +358,47 @@ static size_t prepare_elf_section_hdr_zero(DumpState *s, void *buff)
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
     len = sizeof_shdr * s->shdr_num;
@@ -375,6 +409,22 @@ static void prepare_elf_section_hdrs(DumpState *s)
     if (s->phdr_num == PN_XNUM) {
             prepare_elf_section_hdr_zero(s, buff_hdr);
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
@@ -678,6 +735,7 @@ static void create_vmcore(DumpState *s, Error **errp)
         return;
     }
 
+    /* Iterate over memory and dump it to file */
     dump_iterate(s, errp);
     if (*errp) {
         return;
@@ -1660,6 +1718,13 @@ static void dump_init(DumpState *s, int fd, bool has_format,
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
 
@@ -1820,6 +1885,18 @@ static void dump_init(DumpState *s, int fd, bool has_format,
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
index a94d81303d..af2dd1f090 100644
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


