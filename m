Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AFE4C8DD3
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 15:33:56 +0100 (CET)
Received: from localhost ([::1]:42080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP3Zb-0002UY-Ui
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 09:33:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nP3OZ-0002il-4H
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 09:22:32 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:15292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nP3OX-0007Ii-Ch
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 09:22:30 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 221DBv07032732
 for <qemu-devel@nongnu.org>; Tue, 1 Mar 2022 14:22:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=LERqkgealUFF5MC4lv/bBBOQtzBpeD/k60OzMIfyiyo=;
 b=YFZa1fIShNSoCByqdPezlul/4uAzaPjMx4/EjNBrw5IwaoTZQzovjb+BBZDQHAY0OKwH
 G/hG3IF2uIA5lUP/tpgR1yjrtQH20besPey1REnl3eRS6kZXj1N2kTMrTGi+5C9oNPQY
 iirxDpGlrTJjZl8+sBFDmH6HMk9iVQrh2d/TxgXwah+BeAmuv0LCRbwGId3B/pG+ZGcg
 dp5l60ofjPAkvoxLC9Ksnt3epaYjH23R6Qjzkfcjf6T+3zAe7d2QcloQjqvfh6T4hP8P
 zQ4qejz0jeiDl74sY1My1qEk4Vyh1gYugkAorTo2G1Xc3aAH4oN2L2qSfWhhTxIDRxz/ OA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ehm5esr7w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 14:22:27 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 221DbBeN008830
 for <qemu-devel@nongnu.org>; Tue, 1 Mar 2022 14:22:27 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ehm5esr7e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 14:22:26 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 221EK6J8014207;
 Tue, 1 Mar 2022 14:22:25 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma05fra.de.ibm.com with ESMTP id 3efbu9au2v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 14:22:25 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 221EMMNK46793086
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Mar 2022 14:22:23 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8F9111C04C;
 Tue,  1 Mar 2022 14:22:22 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D53311C050;
 Tue,  1 Mar 2022 14:22:22 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  1 Mar 2022 14:22:21 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/7] dump: Introduce shdr_num to decrease complexity
Date: Tue,  1 Mar 2022 14:22:07 +0000
Message-Id: <20220301142213.28568-2-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220301142213.28568-1-frankja@linux.ibm.com>
References: <20220301142213.28568-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7ItvSkgcy4ZQVQ0wlNlM8l4D4UtUTGlG
X-Proofpoint-GUID: xelzUs6ohwUwYr9Nzd-HpP5SK0IIZ-kJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-01_07,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 spamscore=0 mlxlogscore=619 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203010077
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
 dump/dump.c           | 43 ++++++++++++++++++-------------------------
 include/sysemu/dump.h |  2 +-
 2 files changed, 19 insertions(+), 26 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index a84d8b1598..6696d9819a 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -139,12 +139,12 @@ static void write_elf64_header(DumpState *s, Error **errp)
     elf_header.e_phoff = cpu_to_dump64(s, sizeof(Elf64_Ehdr));
     elf_header.e_phentsize = cpu_to_dump16(s, sizeof(Elf64_Phdr));
     elf_header.e_phnum = cpu_to_dump16(s, s->phdr_num);
-    if (s->have_section) {
+    if (s->shdr_num) {
         uint64_t shoff = sizeof(Elf64_Ehdr) + sizeof(Elf64_Phdr) * s->sh_info;
 
         elf_header.e_shoff = cpu_to_dump64(s, shoff);
         elf_header.e_shentsize = cpu_to_dump16(s, sizeof(Elf64_Shdr));
-        elf_header.e_shnum = cpu_to_dump16(s, 1);
+        elf_header.e_shnum = cpu_to_dump16(s, s->shdr_num);
     }
 
     ret = fd_write_vmcore(&elf_header, sizeof(elf_header), s);
@@ -170,12 +170,12 @@ static void write_elf32_header(DumpState *s, Error **errp)
     elf_header.e_phoff = cpu_to_dump32(s, sizeof(Elf32_Ehdr));
     elf_header.e_phentsize = cpu_to_dump16(s, sizeof(Elf32_Phdr));
     elf_header.e_phnum = cpu_to_dump16(s, s->phdr_num);
-    if (s->have_section) {
+    if (s->shdr_num) {
         uint32_t shoff = sizeof(Elf32_Ehdr) + sizeof(Elf32_Phdr) * s->sh_info;
 
         elf_header.e_shoff = cpu_to_dump32(s, shoff);
         elf_header.e_shentsize = cpu_to_dump16(s, sizeof(Elf32_Shdr));
-        elf_header.e_shnum = cpu_to_dump16(s, 1);
+        elf_header.e_shnum = cpu_to_dump16(s, s->shdr_num);
     }
 
     ret = fd_write_vmcore(&elf_header, sizeof(elf_header), s);
@@ -482,7 +482,7 @@ static void write_elf_loads(DumpState *s, Error **errp)
     uint32_t max_index;
     Error *local_err = NULL;
 
-    if (s->have_section) {
+    if (s->shdr_num) {
         max_index = s->sh_info;
     } else {
         max_index = s->phdr_num;
@@ -567,7 +567,7 @@ static void dump_begin(DumpState *s, Error **errp)
         }
 
         /* write section to vmcore */
-        if (s->have_section) {
+        if (s->shdr_num) {
             write_elf_section(s, 1, &local_err);
             if (local_err) {
                 error_propagate(errp, local_err);
@@ -597,7 +597,7 @@ static void dump_begin(DumpState *s, Error **errp)
         }
 
         /* write section to vmcore */
-        if (s->have_section) {
+        if (s->shdr_num) {
             write_elf_section(s, 0, &local_err);
             if (local_err) {
                 error_propagate(errp, local_err);
@@ -1818,11 +1818,12 @@ static void dump_init(DumpState *s, int fd, bool has_format,
      */
     s->phdr_num = 1; /* PT_NOTE */
     if (s->list.num < UINT16_MAX - 2) {
+        s->shdr_num = 0;
         s->phdr_num += s->list.num;
-        s->have_section = false;
     } else {
-        s->have_section = true;
+        /* sh_info of section 0 holds the real number of phdrs */
         s->phdr_num = PN_XNUM;
+        s->shdr_num = 1;
         s->sh_info = 1; /* PT_NOTE */
 
         /* the type of shdr->sh_info is uint32_t, so we should avoid overflow */
@@ -1834,23 +1835,15 @@ static void dump_init(DumpState *s, int fd, bool has_format,
     }
 
     if (s->dump_info.d_class == ELFCLASS64) {
-        if (s->have_section) {
-            s->memory_offset = sizeof(Elf64_Ehdr) +
-                               sizeof(Elf64_Phdr) * s->sh_info +
-                               sizeof(Elf64_Shdr) + s->note_size;
-        } else {
-            s->memory_offset = sizeof(Elf64_Ehdr) +
-                               sizeof(Elf64_Phdr) * s->phdr_num + s->note_size;
-        }
+        s->memory_offset = sizeof(Elf64_Ehdr) +
+                           sizeof(Elf64_Phdr) * s->sh_info +
+                           sizeof(Elf64_Shdr) * s->shdr_num +
+                           s->note_size;
     } else {
-        if (s->have_section) {
-            s->memory_offset = sizeof(Elf32_Ehdr) +
-                               sizeof(Elf32_Phdr) * s->sh_info +
-                               sizeof(Elf32_Shdr) + s->note_size;
-        } else {
-            s->memory_offset = sizeof(Elf32_Ehdr) +
-                               sizeof(Elf32_Phdr) * s->phdr_num + s->note_size;
-        }
+        s->memory_offset = sizeof(Elf32_Ehdr) +
+                           sizeof(Elf32_Phdr) * s->sh_info +
+                           sizeof(Elf32_Shdr) * s->shdr_num +
+                           s->note_size;
     }
 
     return;
diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
index 250143cb5a..854341da0d 100644
--- a/include/sysemu/dump.h
+++ b/include/sysemu/dump.h
@@ -155,8 +155,8 @@ typedef struct DumpState {
     ArchDumpInfo dump_info;
     MemoryMappingList list;
     uint16_t phdr_num;
+    uint32_t shdr_num;
     uint32_t sh_info;
-    bool have_section;
     bool resume;
     bool detached;
     ssize_t note_size;
-- 
2.32.0


