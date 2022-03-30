Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C4C4EC4D9
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 14:46:45 +0200 (CEST)
Received: from localhost ([::1]:44416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZXim-0005bd-93
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 08:46:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nZXZT-0006Xe-6N
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 08:37:10 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nZXZQ-0003Ml-3C
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 08:37:05 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22UBLY7H011195; 
 Wed, 30 Mar 2022 12:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=9dgrN1vBwy7wDkw6GU22GaS7vRhMJQ8kjbgrRPAymT0=;
 b=ggQOmE/TZhI+3Ebk+lmGHQ3K9MxXjiwe2tgFhH+h69RAl1CTuN/y6fGDF8apkkzl9EBD
 z9A+zWJIi/PnjSL486QJ+aw7WyzdgsOkePrDPdiKjx0jRNyIAR//8AUugmFN5UOkN/DI
 HBQ5IbhY6e2Ck6+S69dBoMc6hF4ZZlmuOLpGGJMt5irfc9wmVmTy3er9BPBa+Nt/haf5
 2Y94LD4TCgdQyP6PaVW00/enoq/ATTamAXNHUNbyoixMbsalq568TApBgaol7lEDDeMJ
 F5+0Dk4QxTyOU3b4Oysz0BSRBpq93nomjAeXpaQBuqW3XwN4wY61HWthLtokf3bmmzzN tg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f3ydcpr28-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 12:37:02 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22UC8Bss021184;
 Wed, 30 Mar 2022 12:37:02 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f3ydcpr1h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 12:37:01 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22UCMY12030982;
 Wed, 30 Mar 2022 12:37:00 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3f1tf90js3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 12:37:00 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22UCOw4O46072122
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 12:24:58 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 043C45204F;
 Wed, 30 Mar 2022 12:36:58 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 7BC2A5204E;
 Wed, 30 Mar 2022 12:36:57 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/9] dump: Introduce shdr_num to decrease complexity
Date: Wed, 30 Mar 2022 12:35:57 +0000
Message-Id: <20220330123603.107120-4-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220330123603.107120-1-frankja@linux.ibm.com>
References: <20220330123603.107120-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: yxgERfuVSq99Lr7HMNtlAsmShqrjZVty
X-Proofpoint-GUID: PIGD6td-DDnJXcKZLJRoGuotPcd70PId
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-30_04,2022-03-30_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 clxscore=1015 malwarescore=0 mlxscore=0 mlxlogscore=793 suspectscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203300063
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: marcandre.lureau@redhat.com, richard.henderson@linaro.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's move from a boolean to a int variable which will later enable us
to store the number of sections that are in the dump file.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 dump/dump.c           | 24 ++++++++++++------------
 include/sysemu/dump.h |  2 +-
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 0e6187c962..cd11dec0f4 100644
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


