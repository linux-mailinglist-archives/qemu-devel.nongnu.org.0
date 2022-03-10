Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F00E4D4563
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:12:16 +0100 (CET)
Received: from localhost ([::1]:44160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSGiN-0001lE-NO
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:12:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nSGfQ-0007B1-Ma
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:09:12 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:41718
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nSGfO-0004eD-Qw
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:09:12 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22A8eXZp006804
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:09:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=CGsrTlhSK1ihP9wrviRSavU7b2Rd7SevBe4A9Tix4ZA=;
 b=FomMZ3WRXcjED4hvAnqOMrHkv1KlFKhXhj/yNz/aRlfg+zjC3u5dvb3s8vG99Y2j+NXH
 MU/HZvIaRGTviFzo2po9uR+xsX+6rQE5wbEPLXNimHJV1NSrddG9MyThKeMgCxwUDAYK
 NZ0VllRav6yWRCqt8JC8rKEXbxZJk1IMeJVPvgbxU0lzT4nl9emjtnkbFgwGWPQgWYN/
 zYkjplWzju/sqvgb2T9GF5zHzzXT4W7zTkmdxYA1jW7ojs6CLaujpo7Ewf3UGo6TC8I0
 sCD6HHBPu01LH2C69IJgiGDfo4iU4tTqGYC3XOH11CVB4qJ6HHe/vJ23CjxuPNKOZlTd Pg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ep107sb0d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:09:09 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22AA6wWq023973
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:09:09 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ep107sayy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:09:09 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22AB25hr013822;
 Thu, 10 Mar 2022 11:09:07 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3enqgnq11f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:09:07 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22AB95JS57934140
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 11:09:05 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4DA5811C069;
 Thu, 10 Mar 2022 11:09:05 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D76C211C06E;
 Thu, 10 Mar 2022 11:09:04 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 10 Mar 2022 11:09:04 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/9] dump: Add more offset variables
Date: Thu, 10 Mar 2022 11:08:50 +0000
Message-Id: <20220310110854.2701-6-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220310110854.2701-1-frankja@linux.ibm.com>
References: <20220310110854.2701-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Lwua8eaIV58cz95hnyRNfmNQXQ060H3u
X-Proofpoint-GUID: HWekw5xDcG74T1CyIDV-Uoha1OFHa3Lr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-10_03,2022-03-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203100059
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

Offset calculations are easy enough to get wrong. Let's add a few
variables to make moving around elf headers and data sections easier.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 dump/dump.c           | 35 +++++++++++++++--------------------
 include/sysemu/dump.h |  4 ++++
 2 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 316c636f24..12b3a1a83e 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -137,13 +137,11 @@ static void write_elf64_header(DumpState *s, Error **errp)
     elf_header.e_machine = cpu_to_dump16(s, s->dump_info.d_machine);
     elf_header.e_version = cpu_to_dump32(s, EV_CURRENT);
     elf_header.e_ehsize = cpu_to_dump16(s, sizeof(elf_header));
-    elf_header.e_phoff = cpu_to_dump64(s, sizeof(Elf64_Ehdr));
+    elf_header.e_phoff = cpu_to_dump64(s, s->phdr_offset);
     elf_header.e_phentsize = cpu_to_dump16(s, sizeof(Elf64_Phdr));
     elf_header.e_phnum = cpu_to_dump16(s, phnum);
     if (s->shdr_num) {
-        uint64_t shoff = sizeof(Elf64_Ehdr) + sizeof(Elf64_Phdr) * s->phdr_num;
-
-        elf_header.e_shoff = cpu_to_dump64(s, shoff);
+        elf_header.e_shoff = cpu_to_dump64(s, s->shdr_offset);
         elf_header.e_shentsize = cpu_to_dump16(s, sizeof(Elf64_Shdr));
         elf_header.e_shnum = cpu_to_dump16(s, s->shdr_num);
     }
@@ -169,13 +167,11 @@ static void write_elf32_header(DumpState *s, Error **errp)
     elf_header.e_machine = cpu_to_dump16(s, s->dump_info.d_machine);
     elf_header.e_version = cpu_to_dump32(s, EV_CURRENT);
     elf_header.e_ehsize = cpu_to_dump16(s, sizeof(elf_header));
-    elf_header.e_phoff = cpu_to_dump32(s, sizeof(Elf32_Ehdr));
+    elf_header.e_phoff = cpu_to_dump32(s, s->phdr_offset);
     elf_header.e_phentsize = cpu_to_dump16(s, sizeof(Elf32_Phdr));
     elf_header.e_phnum = cpu_to_dump16(s, phnum);
     if (s->shdr_num) {
-        uint32_t shoff = sizeof(Elf32_Ehdr) + sizeof(Elf32_Phdr) * s->phdr_num;
-
-        elf_header.e_shoff = cpu_to_dump32(s, shoff);
+        elf_header.e_shoff = cpu_to_dump32(s, s->shdr_offset);
         elf_header.e_shentsize = cpu_to_dump16(s, sizeof(Elf32_Shdr));
         elf_header.e_shnum = cpu_to_dump16(s, s->shdr_num);
     }
@@ -238,12 +234,11 @@ static void write_elf32_load(DumpState *s, MemoryMapping *memory_mapping,
 static void write_elf64_note(DumpState *s, Error **errp)
 {
     Elf64_Phdr phdr;
-    hwaddr begin = s->memory_offset - s->note_size;
     int ret;
 
     memset(&phdr, 0, sizeof(Elf64_Phdr));
     phdr.p_type = cpu_to_dump32(s, PT_NOTE);
-    phdr.p_offset = cpu_to_dump64(s, begin);
+    phdr.p_offset = cpu_to_dump64(s, s->note_offset);
     phdr.p_paddr = 0;
     phdr.p_filesz = cpu_to_dump64(s, s->note_size);
     phdr.p_memsz = cpu_to_dump64(s, s->note_size);
@@ -303,13 +298,12 @@ static void write_elf64_notes(WriteCoreDumpFunction f, DumpState *s,
 
 static void write_elf32_note(DumpState *s, Error **errp)
 {
-    hwaddr begin = s->memory_offset - s->note_size;
     Elf32_Phdr phdr;
     int ret;
 
     memset(&phdr, 0, sizeof(Elf32_Phdr));
     phdr.p_type = cpu_to_dump32(s, PT_NOTE);
-    phdr.p_offset = cpu_to_dump32(s, begin);
+    phdr.p_offset = cpu_to_dump32(s, s->note_offset);
     phdr.p_paddr = 0;
     phdr.p_filesz = cpu_to_dump32(s, s->note_size);
     phdr.p_memsz = cpu_to_dump32(s, s->note_size);
@@ -1808,15 +1802,16 @@ static void dump_init(DumpState *s, int fd, bool has_format,
     }
 
     if (s->dump_info.d_class == ELFCLASS64) {
-        s->memory_offset = sizeof(Elf64_Ehdr) +
-                           sizeof(Elf64_Phdr) * s->phdr_num +
-                           sizeof(Elf64_Shdr) * s->shdr_num +
-                           s->note_size;
+        s->phdr_offset = sizeof(Elf64_Ehdr);
+        s->shdr_offset = s->phdr_offset + sizeof(Elf64_Phdr) * s->phdr_num;
+        s->note_offset = s->shdr_offset + sizeof(Elf64_Shdr) * s->shdr_num;
+        s->memory_offset = s->note_offset + s->note_size;
     } else {
-        s->memory_offset = sizeof(Elf32_Ehdr) +
-                           sizeof(Elf32_Phdr) * s->phdr_num +
-                           sizeof(Elf32_Shdr) * s->shdr_num +
-                           s->note_size;
+
+        s->phdr_offset = sizeof(Elf32_Ehdr);
+        s->shdr_offset = s->phdr_offset + sizeof(Elf32_Phdr) * s->phdr_num;
+        s->note_offset = s->shdr_offset + sizeof(Elf32_Shdr) * s->shdr_num;
+        s->memory_offset = s->note_offset + s->note_size;
     }
 
     return;
diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
index 19458bffbd..ffc2ea1072 100644
--- a/include/sysemu/dump.h
+++ b/include/sysemu/dump.h
@@ -159,6 +159,10 @@ typedef struct DumpState {
     bool resume;
     bool detached;
     ssize_t note_size;
+    hwaddr shdr_offset;
+    hwaddr phdr_offset;
+    hwaddr section_offset;
+    hwaddr note_offset;
     hwaddr memory_offset;
     int fd;
 
-- 
2.32.0


