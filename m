Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3402858FC54
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 14:33:35 +0200 (CEST)
Received: from localhost ([::1]:52406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM7NW-0003dN-8X
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 08:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oM749-0005Oa-Ex; Thu, 11 Aug 2022 08:13:33 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:9442
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oM744-0000HZ-N7; Thu, 11 Aug 2022 08:13:33 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27BC6tUZ013304;
 Thu, 11 Aug 2022 12:13:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=voPlRj8GPGQVW5MEv458j60nxAy5q0cngODTWlIpjao=;
 b=ftJBU3/nzsJbibfJLlJEZBMaGIMmIRF/Otpb4enVn7a718Hocr/SbyHPjzFWJyso4++m
 nJ+Uswzs/EoLhbrkVkzgv460ASNv+qMcR6nHzTaxMPGOorxv1CuXi/3LXiVrwvTWuM/f
 9uZ/Z/JkdZai9ycRI9mAx+psA6b68kb2xkEitQqS/mqMz0bqbo8j6WYP6El2d0Q2yyNr
 C3Zf+RKYcyCl7sTyFUUcTAFe+Nhkpb9U5dz+iNs3N6A59e2aMdHIh3dxixsUi80DT+Ql
 P1GNllsQkXq0qUb3c7blSMGRr6pHDd/ZjEmVT8lFFQEihSWbYJqWU8XLvXP0f0lS6a3S 2w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hw1dp0qra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:13:26 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27BC7QBk018032;
 Thu, 11 Aug 2022 12:13:19 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hw1dp0pd3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:13:19 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27BC7Fuk029831;
 Thu, 11 Aug 2022 12:12:19 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3huwvf1ywt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:12:19 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27BCCGAO28836134
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 12:12:16 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 19EF0AE04D;
 Thu, 11 Aug 2022 12:12:16 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ECBF9AE045;
 Thu, 11 Aug 2022 12:12:14 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 11 Aug 2022 12:12:14 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com, scgl@linux.ibm.com
Subject: [PATCH v5 13/18] dump/dump: Add arch section support
Date: Thu, 11 Aug 2022 12:11:06 +0000
Message-Id: <20220811121111.9878-14-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220811121111.9878-1-frankja@linux.ibm.com>
References: <20220811121111.9878-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NjGt04qqb-fwXF_FR4IB-TkH21rPM3BU
X-Proofpoint-ORIG-GUID: 4X-3Vi7H7ZzV4bJAoOPRmjRzLVVpspmO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_05,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 phishscore=0 adultscore=0 bulkscore=0
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

Add hooks which architectures can use to add arbitrary data to custom
sections.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 dump/dump.c                | 120 ++++++++++++++++++++++++++++++-------
 include/sysemu/dump-arch.h |   3 +
 2 files changed, 100 insertions(+), 23 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 0d6dbf453a..65b18fc602 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -430,7 +430,7 @@ static void prepare_elf_section_hdr_string(DumpState *s, void *buff)
     memcpy(buff, shdr, shdr_size);
 }
 
-static void prepare_elf_section_hdrs(DumpState *s)
+static void prepare_elf_section_hdrs(DumpState *s, Error **errp)
 {
     size_t len, sizeof_shdr;
     void *buff_hdr;
@@ -438,6 +438,7 @@ static void prepare_elf_section_hdrs(DumpState *s)
     /*
      * Section ordering:
      * - HDR zero
+     * - Arch section hdrs
      * - String table hdr
      */
     sizeof_shdr = dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
@@ -465,6 +466,16 @@ static void prepare_elf_section_hdrs(DumpState *s)
         return;
     }
 
+    /* Add architecture defined section headers */
+    if (s->dump_info.arch_sections_write_hdr_fn) {
+        buff_hdr += s->dump_info.arch_sections_write_hdr_fn(s, buff_hdr);
+
+        if (s->shdr_num >= SHN_LORESERVE) {
+            error_setg_errno(errp, EINVAL, "dump: too many architecture defined sections");
+            return;
+        }
+    }
+
     /*
      * String table is the last section since strings are added via
      * arch_sections_write_hdr().
@@ -477,7 +488,10 @@ static void write_elf_section_headers(DumpState *s, Error **errp)
     size_t sizeof_shdr = dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
     int ret;
 
-    prepare_elf_section_hdrs(s);
+    prepare_elf_section_hdrs(s, errp);
+    if (*errp) {
+        return;
+    }
 
     ret = fd_write_vmcore(s->elf_section_hdrs, s->shdr_num * sizeof_shdr, s);
     if (ret < 0) {
@@ -485,6 +499,30 @@ static void write_elf_section_headers(DumpState *s, Error **errp)
     }
 }
 
+static void write_elf_sections(DumpState *s, Error **errp)
+{
+    int ret;
+
+    if (!s->elf_section_data_size) {
+        return;
+    }
+
+    /* Write architecture section data */
+    ret = fd_write_vmcore(s->elf_section_data,
+                          s->elf_section_data_size, s);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "dump: failed to write architecture section  data");
+        return;
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
@@ -744,6 +782,24 @@ static void dump_iterate(DumpState *s, Error **errp)
     }
 }
 
+static void dump_end(DumpState *s, Error **errp)
+{
+    ERRP_GUARD();
+
+    if (!s->elf_section_data_size) {
+        return;
+    }
+    s->elf_section_data = g_malloc0(s->elf_section_data_size);
+
+    /* Adds the architecture defined section data to s->elf_section_data  */
+    if (s->dump_info.arch_sections_write_fn) {
+        s->dump_info.arch_sections_write_fn(s, s->elf_section_data);
+    }
+
+    /* write sections to vmcore */
+    write_elf_sections(s, errp);
+}
+
 static void create_vmcore(DumpState *s, Error **errp)
 {
     ERRP_GUARD();
@@ -758,6 +814,9 @@ static void create_vmcore(DumpState *s, Error **errp)
     if (*errp) {
         return;
     }
+
+    /* Write the section data */
+    dump_end(s, errp);
 }
 
 static int write_start_flat_header(int fd)
@@ -1883,38 +1942,53 @@ static void dump_init(DumpState *s, int fd, bool has_format,
     }
 
     /*
-     * calculate phdr_num
-     *
-     * the type of ehdr->e_phnum is uint16_t, so we should avoid overflow
+     * Adds the number of architecture sections to shdr_num, sets
+     * string_table_usage and sets elf_section_data_size so we know
+     * the offsets and sizes of all parts.
      */
-    s->phdr_num = 1; /* PT_NOTE */
-    if (s->list.num < UINT16_MAX - 2) {
-        s->shdr_num = 0;
-        s->phdr_num += s->list.num;
-    } else {
-        /* sh_info of section 0 holds the real number of phdrs */
-        s->shdr_num = 1;
+    if (s->dump_info.arch_sections_add_fn) {
+        s->dump_info.arch_sections_add_fn(s);
 
-        /* the type of shdr->sh_info is uint32_t, so we should avoid overflow */
-        if (s->list.num <= UINT32_MAX - 1) {
-            s->phdr_num += s->list.num;
-        } else {
-            s->phdr_num = UINT32_MAX;
+        if (s->shdr_num) {
+            s->string_table_usage = true;
         }
     }
 
     /*
-     * calculate shdr_num and elf_section_data_size so we know the offsets and
-     * sizes of all parts.
+     * Calculate phdr_num
      *
-     * If phdr_num overflowed we have at least one section header
-     * More sections/hdrs can be added by the architectures
+     * The absolute maximum amount of phdrs is UINT32_MAX - 1 as
+     * sh_info is 32 bit. There's special handling once we go over
+     * UINT16_MAX - 1 but that is handled in the ehdr and section
+     * code.
      */
-    if (s->shdr_num > 1) {
-        /* Reserve the string table */
+    s->phdr_num = 1; /* Reserve PT_NOTE */
+    if (s->list.num <= UINT32_MAX - 1) {
+        s->phdr_num += s->list.num;
+    } else {
+        s->phdr_num = UINT32_MAX;
+    }
+
+    /*
+     * The first section header is always a special one in which most
+     * fields are 0.
+     *
+     * We need it if we have custom sections and if phdr_num >=
+     * PN_XNUM so we can write the real phdr_num into sh_info.
+     */
+    if (s->shdr_num || s->phdr_num >= PN_XNUM) {
         s->shdr_num += 1;
     }
 
+    /* Reserve the string table for the arch sections if needed */
+    if (s->string_table_usage) {
+        s->shdr_num += 1;
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
index e25b02e990..824c0c1152 100644
--- a/include/sysemu/dump-arch.h
+++ b/include/sysemu/dump-arch.h
@@ -21,6 +21,9 @@ typedef struct ArchDumpInfo {
     uint32_t page_size;      /* The target's page size. If it's variable and
                               * unknown, then this should be the maximum. */
     uint64_t phys_base;      /* The target's physmem base. */
+    void (*arch_sections_add_fn)(DumpState *s);
+    uint64_t (*arch_sections_write_hdr_fn)(DumpState *s, uint8_t *buff);
+    void (*arch_sections_write_fn)(DumpState *s, uint8_t *buff);
 } ArchDumpInfo;
 
 struct GuestPhysBlockList; /* memory_mapping.h */
-- 
2.34.1


