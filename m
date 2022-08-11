Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE9158FC56
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 14:33:43 +0200 (CEST)
Received: from localhost ([::1]:52612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM7Nd-0003ln-83
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 08:33:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oM73s-0004U4-SU; Thu, 11 Aug 2022 08:13:17 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:62016
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oM73r-0000Eo-12; Thu, 11 Aug 2022 08:13:16 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27BC710w013937;
 Thu, 11 Aug 2022 12:13:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=bdIbOQY0jxfJ2FrdQNxv5WzAMkJkihpevhrYoSTx27A=;
 b=tgeaxipzhR1DFsC6x+O2pqAwbccJw0yK/5hjEToaEdtQVjHutWTG4scq+lyAOoRwOzei
 tksF1aSY3hGY3nBY284BkFcMt8pAwFxOj7pLd4tBugHX0AH/GoMTL31e81yrLaXNICMp
 CrmNNlBVyUg5VOgb3yPnMNgl5eJ+b0/CJ/lxtfWujQZSseUmszYZo7OYI9gkBEsDIM80
 0p2a6lG9bViIaptKQSQCa0Qz+ND3yRVP363rdU8r4fXgOmRUmfMN8hj1pRu7kbF9zF99
 4apj1eSjjAWHdgRtUXDnkwlhmRIKPoJSNqc5JCIQERLso7Abhhhn2GMuaWpexnlmi+ry tA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hw1dp0pyp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:13:07 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27BC7Z7i019734;
 Thu, 11 Aug 2022 12:12:44 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hw1dp0p15-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:12:44 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27BC7EVk014866;
 Thu, 11 Aug 2022 12:12:11 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3huwvg20kx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:12:11 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 27BC9ZtY29426008
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 12:09:35 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 44310AE04D;
 Thu, 11 Aug 2022 12:12:08 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 217C4AE045;
 Thu, 11 Aug 2022 12:12:07 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 11 Aug 2022 12:12:07 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com, scgl@linux.ibm.com
Subject: [PATCH v5 07/18] dump: Split elf header functions into prepare and
 write
Date: Thu, 11 Aug 2022 12:11:00 +0000
Message-Id: <20220811121111.9878-8-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220811121111.9878-1-frankja@linux.ibm.com>
References: <20220811121111.9878-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bmN53e9eBdvk1Sk7KYkYzuGja0B_8v0J
X-Proofpoint-ORIG-GUID: 4ZEBiUNJohjH8XDjUgblkjv5M4Dhw8ba
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_05,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=969
 suspectscore=0 malwarescore=0 mlxscore=0 phishscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208110037
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

Let's split the write from the modification of the elf header so we
can consolidate the write of the data in one function.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 dump/dump.c | 100 ++++++++++++++++++++++++++++------------------------
 1 file changed, 53 insertions(+), 47 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index d82cc46d7d..8a2a97a85e 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -131,7 +131,7 @@ static int fd_write_vmcore(const void *buf, size_t size, void *opaque)
     return 0;
 }
 
-static void write_elf64_header(DumpState *s, Error **errp)
+static void prepare_elf64_header(DumpState *s, Elf64_Ehdr *elf_header)
 {
     /*
      * phnum in the elf header is 16 bit, if we have more segments we
@@ -139,34 +139,27 @@ static void write_elf64_header(DumpState *s, Error **errp)
      * special section.
      */
     uint16_t phnum = MIN(s->phdr_num, PN_XNUM);
-    Elf64_Ehdr elf_header;
-    int ret;
 
-    memset(&elf_header, 0, sizeof(Elf64_Ehdr));
-    memcpy(&elf_header, ELFMAG, SELFMAG);
-    elf_header.e_ident[EI_CLASS] = ELFCLASS64;
-    elf_header.e_ident[EI_DATA] = s->dump_info.d_endian;
-    elf_header.e_ident[EI_VERSION] = EV_CURRENT;
-    elf_header.e_type = cpu_to_dump16(s, ET_CORE);
-    elf_header.e_machine = cpu_to_dump16(s, s->dump_info.d_machine);
-    elf_header.e_version = cpu_to_dump32(s, EV_CURRENT);
-    elf_header.e_ehsize = cpu_to_dump16(s, sizeof(elf_header));
-    elf_header.e_phoff = cpu_to_dump64(s, s->phdr_offset);
-    elf_header.e_phentsize = cpu_to_dump16(s, sizeof(Elf64_Phdr));
-    elf_header.e_phnum = cpu_to_dump16(s, phnum);
+    memset(elf_header, 0, sizeof(Elf64_Ehdr));
+    memcpy(elf_header, ELFMAG, SELFMAG);
+    elf_header->e_ident[EI_CLASS] = ELFCLASS64;
+    elf_header->e_ident[EI_DATA] = s->dump_info.d_endian;
+    elf_header->e_ident[EI_VERSION] = EV_CURRENT;
+    elf_header->e_type = cpu_to_dump16(s, ET_CORE);
+    elf_header->e_machine = cpu_to_dump16(s, s->dump_info.d_machine);
+    elf_header->e_version = cpu_to_dump32(s, EV_CURRENT);
+    elf_header->e_ehsize = cpu_to_dump16(s, sizeof(elf_header));
+    elf_header->e_phoff = cpu_to_dump64(s, s->phdr_offset);
+    elf_header->e_phentsize = cpu_to_dump16(s, sizeof(Elf64_Phdr));
+    elf_header->e_phnum = cpu_to_dump16(s, phnum);
     if (s->shdr_num) {
-        elf_header.e_shoff = cpu_to_dump64(s, s->shdr_offset);
-        elf_header.e_shentsize = cpu_to_dump16(s, sizeof(Elf64_Shdr));
-        elf_header.e_shnum = cpu_to_dump16(s, s->shdr_num);
-    }
-
-    ret = fd_write_vmcore(&elf_header, sizeof(elf_header), s);
-    if (ret < 0) {
-        error_setg_errno(errp, -ret, "dump: failed to write elf header");
+        elf_header->e_shoff = cpu_to_dump64(s, s->shdr_offset);
+        elf_header->e_shentsize = cpu_to_dump16(s, sizeof(Elf64_Shdr));
+        elf_header->e_shnum = cpu_to_dump16(s, s->shdr_num);
     }
 }
 
-static void write_elf32_header(DumpState *s, Error **errp)
+static void prepare_elf32_header(DumpState *s, Elf32_Ehdr *elf_header)
 {
     /*
      * phnum in the elf header is 16 bit, if we have more segments we
@@ -174,28 +167,45 @@ static void write_elf32_header(DumpState *s, Error **errp)
      * special section.
      */
     uint16_t phnum = MIN(s->phdr_num, PN_XNUM);
-    Elf32_Ehdr elf_header;
+
+    memset(elf_header, 0, sizeof(Elf32_Ehdr));
+    memcpy(elf_header, ELFMAG, SELFMAG);
+    elf_header->e_ident[EI_CLASS] = ELFCLASS32;
+    elf_header->e_ident[EI_DATA] = s->dump_info.d_endian;
+    elf_header->e_ident[EI_VERSION] = EV_CURRENT;
+    elf_header->e_type = cpu_to_dump16(s, ET_CORE);
+    elf_header->e_machine = cpu_to_dump16(s, s->dump_info.d_machine);
+    elf_header->e_version = cpu_to_dump32(s, EV_CURRENT);
+    elf_header->e_ehsize = cpu_to_dump16(s, sizeof(elf_header));
+    elf_header->e_phoff = cpu_to_dump32(s, s->phdr_offset);
+    elf_header->e_phentsize = cpu_to_dump16(s, sizeof(Elf32_Phdr));
+    elf_header->e_phnum = cpu_to_dump16(s, phnum);
+    if (s->shdr_num) {
+        elf_header->e_shoff = cpu_to_dump32(s, s->shdr_offset);
+        elf_header->e_shentsize = cpu_to_dump16(s, sizeof(Elf32_Shdr));
+        elf_header->e_shnum = cpu_to_dump16(s, s->shdr_num);
+    }
+}
+
+static void write_elf_header(DumpState *s, Error **errp)
+{
+    Elf32_Ehdr elf32_header;
+    Elf64_Ehdr elf64_header;
+    size_t header_size;
+    void *header_ptr;
     int ret;
 
-    memset(&elf_header, 0, sizeof(Elf32_Ehdr));
-    memcpy(&elf_header, ELFMAG, SELFMAG);
-    elf_header.e_ident[EI_CLASS] = ELFCLASS32;
-    elf_header.e_ident[EI_DATA] = s->dump_info.d_endian;
-    elf_header.e_ident[EI_VERSION] = EV_CURRENT;
-    elf_header.e_type = cpu_to_dump16(s, ET_CORE);
-    elf_header.e_machine = cpu_to_dump16(s, s->dump_info.d_machine);
-    elf_header.e_version = cpu_to_dump32(s, EV_CURRENT);
-    elf_header.e_ehsize = cpu_to_dump16(s, sizeof(elf_header));
-    elf_header.e_phoff = cpu_to_dump32(s, s->phdr_offset);
-    elf_header.e_phentsize = cpu_to_dump16(s, sizeof(Elf32_Phdr));
-    elf_header.e_phnum = cpu_to_dump16(s, phnum);
-    if (s->shdr_num) {
-        elf_header.e_shoff = cpu_to_dump32(s, s->shdr_offset);
-        elf_header.e_shentsize = cpu_to_dump16(s, sizeof(Elf32_Shdr));
-        elf_header.e_shnum = cpu_to_dump16(s, s->shdr_num);
+    if (dump_is_64bit(s)) {
+        prepare_elf64_header(s, &elf64_header);
+        header_size = sizeof(elf64_header);
+        header_ptr = &elf64_header;
+    } else {
+        prepare_elf32_header(s, &elf32_header);
+        header_size = sizeof(elf32_header);
+        header_ptr = &elf32_header;
     }
 
-    ret = fd_write_vmcore(&elf_header, sizeof(elf_header), s);
+    ret = fd_write_vmcore(header_ptr, header_size, s);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "dump: failed to write elf header");
     }
@@ -564,11 +574,7 @@ static void dump_begin(DumpState *s, Error **errp)
      */
 
     /* write elf header to vmcore */
-    if (dump_is_64bit(s)) {
-        write_elf64_header(s, errp);
-    } else {
-        write_elf32_header(s, errp);
-    }
+    write_elf_header(s, errp);
     if (*errp) {
         return;
     }
-- 
2.34.1


