Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A304D4592
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:20:58 +0100 (CET)
Received: from localhost ([::1]:41376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSGqn-0002MC-5U
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:20:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nSGfS-0007FF-Dw
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:09:14 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:36272
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nSGfP-0004e3-FQ
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:09:14 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22A9KB1t026729
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:09:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=XIpDNNT6h59f/HivB7hMUQfCCGq5z25+dE1V9VmAbQs=;
 b=hNCMkiqx4Pw1aejto0MPRtrsP0l2Sqn7dPegs1nq8p0Lk+QuV6RGC1hgY+XRNIGVoDU0
 89zOICUARtxhNVVM4udX3vAA2V76Mhl9l3y1SGqrBBMmnD14wpSmt91JsX12bIt4GNqi
 rdqBrrUEQJRhk2plDZ46XYh1YZWjbeFJNVenunfJnbu7cEWQuREOy1SmDXKhTfrkNCjF
 BMqABSy5O7cAHZSqCvrrMQsZGZJGxd42CChqPXvCV8tZkGww27duZrOa28YlwXwv4uEc
 dRYeQzoe4mw6cm1kWPT3boT0VD1Og+9c9nIHss/8jz2SEmpiZpGrsSYaz2JDYd6RCnMy 8Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eq7yr1k52-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:09:08 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22AALAW3009614
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:09:08 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eq7yr1k4k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:09:08 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22AB34Jv019601;
 Thu, 10 Mar 2022 11:09:06 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04fra.de.ibm.com with ESMTP id 3ep8c3v4vt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:09:06 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22AB94e244302766
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 11:09:04 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20C2311C06E;
 Thu, 10 Mar 2022 11:09:04 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AAFD511C06C;
 Thu, 10 Mar 2022 11:09:03 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 10 Mar 2022 11:09:03 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/9] dump: Introduce shdr_num to decrease complexity
Date: Thu, 10 Mar 2022 11:08:48 +0000
Message-Id: <20220310110854.2701-4-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220310110854.2701-1-frankja@linux.ibm.com>
References: <20220310110854.2701-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IDk0yXfBuHTYQs_nAhObh6G9qELtLHdd
X-Proofpoint-ORIG-GUID: yxCsfBNMBgpOVGjmmaueSBTdEfUW_3uW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-10_03,2022-03-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 clxscore=1011 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 mlxscore=0 mlxlogscore=695 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's move from a boolean to a int variable which will later enable us
to store the number of sections that are in the dump file.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 dump/dump.c           | 24 ++++++++++++------------
 include/sysemu/dump.h |  2 +-
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 7015c92177..c5ca6027ae 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -140,12 +140,12 @@ static void write_elf64_header(DumpState *s, Error **errp)
     elf_header.e_phoff = cpu_to_dump64(s, sizeof(Elf64_Ehdr));
     elf_header.e_phentsize = cpu_to_dump16(s, sizeof(Elf64_Phdr));
     elf_header.e_phnum = cpu_to_dump16(s, phnum);
-    if (s->have_section) {
+    if (s->shdr_num) {
         uint64_t shoff = sizeof(Elf64_Ehdr) + sizeof(Elf64_Phdr) * s->phdr_num;
 
         elf_header.e_shoff = cpu_to_dump64(s, shoff);
         elf_header.e_shentsize = cpu_to_dump16(s, sizeof(Elf64_Shdr));
-        elf_header.e_shnum = cpu_to_dump16(s, 1);
+        elf_header.e_shnum = cpu_to_dump16(s, s->shdr_num);
     }
 
     ret = fd_write_vmcore(&elf_header, sizeof(elf_header), s);
@@ -172,12 +172,12 @@ static void write_elf32_header(DumpState *s, Error **errp)
     elf_header.e_phoff = cpu_to_dump32(s, sizeof(Elf32_Ehdr));
     elf_header.e_phentsize = cpu_to_dump16(s, sizeof(Elf32_Phdr));
     elf_header.e_phnum = cpu_to_dump16(s, phnum);
-    if (s->have_section) {
+    if (s->shdr_num) {
         uint32_t shoff = sizeof(Elf32_Ehdr) + sizeof(Elf32_Phdr) * s->phdr_num;
 
         elf_header.e_shoff = cpu_to_dump32(s, shoff);
         elf_header.e_shentsize = cpu_to_dump16(s, sizeof(Elf32_Shdr));
-        elf_header.e_shnum = cpu_to_dump16(s, 1);
+        elf_header.e_shnum = cpu_to_dump16(s, s->shdr_num);
     }
 
     ret = fd_write_vmcore(&elf_header, sizeof(elf_header), s);
@@ -556,7 +556,7 @@ static void dump_begin(DumpState *s, Error **errp)
         }
 
         /* write section to vmcore */
-        if (s->have_section) {
+        if (s->shdr_num) {
             write_elf_section(s, 1, errp);
             if (*errp) {
                 return;
@@ -582,7 +582,7 @@ static void dump_begin(DumpState *s, Error **errp)
         }
 
         /* write section to vmcore */
-        if (s->have_section) {
+        if (s->shdr_num) {
             write_elf_section(s, 0, errp);
             if (*errp) {
                 return;
@@ -1793,11 +1793,11 @@ static void dump_init(DumpState *s, int fd, bool has_format,
      */
     s->phdr_num = 1; /* PT_NOTE */
     if (s->list.num < UINT16_MAX - 2) {
+        s->shdr_num = 0;
         s->phdr_num += s->list.num;
-        s->have_section = false;
     } else {
         /* sh_info of section 0 holds the real number of phdrs */
-        s->have_section = true;
+        s->shdr_num = 1;
 
         /* the type of shdr->sh_info is uint32_t, so we should avoid overflow */
         if (s->list.num <= UINT32_MAX - 1) {
@@ -1808,19 +1808,19 @@ static void dump_init(DumpState *s, int fd, bool has_format,
     }
 
     if (s->dump_info.d_class == ELFCLASS64) {
-        if (s->have_section) {
+        if (s->shdr_num) {
             s->memory_offset = sizeof(Elf64_Ehdr) +
                                sizeof(Elf64_Phdr) * s->phdr_num +
-                               sizeof(Elf64_Shdr) + s->note_size;
+                               sizeof(Elf64_Shdr) * s->shdr_num + s->note_size;
         } else {
             s->memory_offset = sizeof(Elf64_Ehdr) +
                                sizeof(Elf64_Phdr) * s->phdr_num + s->note_size;
         }
     } else {
-        if (s->have_section) {
+        if (s->shdr_num) {
             s->memory_offset = sizeof(Elf32_Ehdr) +
                                sizeof(Elf32_Phdr) * s->phdr_num +
-                               sizeof(Elf32_Shdr) + s->note_size;
+                               sizeof(Elf32_Shdr) * s->shdr_num + s->note_size;
         } else {
             s->memory_offset = sizeof(Elf32_Ehdr) +
                                sizeof(Elf32_Phdr) * s->phdr_num + s->note_size;
diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
index b463fc9c02..19458bffbd 100644
--- a/include/sysemu/dump.h
+++ b/include/sysemu/dump.h
@@ -155,7 +155,7 @@ typedef struct DumpState {
     ArchDumpInfo dump_info;
     MemoryMappingList list;
     uint32_t phdr_num;
-    bool have_section;
+    uint32_t shdr_num;
     bool resume;
     bool detached;
     ssize_t note_size;
-- 
2.32.0


