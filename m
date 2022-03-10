Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8724D4571
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:15:00 +0100 (CET)
Received: from localhost ([::1]:52758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSGl1-0007fh-85
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:14:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nSGfQ-0007BB-Qv
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:09:12 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:22864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nSGfO-0004dm-Py
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:09:12 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22AAO5wi021914
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:09:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=aVBS4vqSja7A6Tgn8Ff+RtPqBPWaWNg0FEO5KMxV1kQ=;
 b=cO37KC+bdJZ0LkuqqoSFfvtDQfGHfyTA9kpgkziABCJzrUMh1vqErSNx31HEiEjHXw1N
 GpR9rSwoOn9R7P/aFta5FY1BHsaAFVze+RPrGQd9sHQJF/S/gIx61Orx4iNZp8dgFLZ7
 bx9aqiI+PVBoAui6WVXWSbF58XypmGdalWUXu8jv+M2qz+gKpaU651wx7EemRZKMDBIf
 tjVQE1sSQQeAPd21Xejag61o+QfIUtp6NVYgsfB2KDh5mEC9djHyIlWhc4O5kqwTceB/
 or9WwkQAb8F2dU7LMTg1/xl676fTAWeuCovHmAQLvOxoQWmtgrNKgvYHH5KFo20imKLP pQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eqcyy46m6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:09:08 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22AB97ld014107
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:09:08 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eqcyy46kg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:09:07 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22AB31vw010641;
 Thu, 10 Mar 2022 11:09:06 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 3eky4janj2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:09:06 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22AAvo8V15466808
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 10:57:50 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 84FAE11C069;
 Thu, 10 Mar 2022 11:09:03 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1AD5411C066;
 Thu, 10 Mar 2022 11:09:03 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 10 Mar 2022 11:09:02 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/9] dump: Remove the sh_info variable
Date: Thu, 10 Mar 2022 11:08:47 +0000
Message-Id: <20220310110854.2701-3-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220310110854.2701-1-frankja@linux.ibm.com>
References: <20220310110854.2701-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: INS0Sz2HCU2iPt8vwkPzmADX6JdiJJkS
X-Proofpoint-GUID: OfXinevw1D7cG6GwmE60FDZ7gxAFHPe1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-10_03,2022-03-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203100059
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

There's no need to have phdr_num and sh_info at the same time. We can
make phdr_num 32 bit and set PN_XNUM when we write the header if
phdr_num >= PN_XNUM.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 dump/dump.c           | 34 ++++++++++++++--------------------
 include/sysemu/dump.h |  3 +--
 2 files changed, 15 insertions(+), 22 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index ef1700174b..7015c92177 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -124,6 +124,7 @@ static int fd_write_vmcore(const void *buf, size_t size, void *opaque)
 
 static void write_elf64_header(DumpState *s, Error **errp)
 {
+    uint16_t phnum = s->phdr_num >= PN_XNUM ? PN_XNUM : s->phdr_num;
     Elf64_Ehdr elf_header;
     int ret;
 
@@ -138,9 +139,9 @@ static void write_elf64_header(DumpState *s, Error **errp)
     elf_header.e_ehsize = cpu_to_dump16(s, sizeof(elf_header));
     elf_header.e_phoff = cpu_to_dump64(s, sizeof(Elf64_Ehdr));
     elf_header.e_phentsize = cpu_to_dump16(s, sizeof(Elf64_Phdr));
-    elf_header.e_phnum = cpu_to_dump16(s, s->phdr_num);
+    elf_header.e_phnum = cpu_to_dump16(s, phnum);
     if (s->have_section) {
-        uint64_t shoff = sizeof(Elf64_Ehdr) + sizeof(Elf64_Phdr) * s->sh_info;
+        uint64_t shoff = sizeof(Elf64_Ehdr) + sizeof(Elf64_Phdr) * s->phdr_num;
 
         elf_header.e_shoff = cpu_to_dump64(s, shoff);
         elf_header.e_shentsize = cpu_to_dump16(s, sizeof(Elf64_Shdr));
@@ -155,6 +156,7 @@ static void write_elf64_header(DumpState *s, Error **errp)
 
 static void write_elf32_header(DumpState *s, Error **errp)
 {
+    uint16_t phnum = s->phdr_num >= PN_XNUM ? PN_XNUM : s->phdr_num;
     Elf32_Ehdr elf_header;
     int ret;
 
@@ -169,9 +171,9 @@ static void write_elf32_header(DumpState *s, Error **errp)
     elf_header.e_ehsize = cpu_to_dump16(s, sizeof(elf_header));
     elf_header.e_phoff = cpu_to_dump32(s, sizeof(Elf32_Ehdr));
     elf_header.e_phentsize = cpu_to_dump16(s, sizeof(Elf32_Phdr));
-    elf_header.e_phnum = cpu_to_dump16(s, s->phdr_num);
+    elf_header.e_phnum = cpu_to_dump16(s, phnum);
     if (s->have_section) {
-        uint32_t shoff = sizeof(Elf32_Ehdr) + sizeof(Elf32_Phdr) * s->sh_info;
+        uint32_t shoff = sizeof(Elf32_Ehdr) + sizeof(Elf32_Phdr) * s->phdr_num;
 
         elf_header.e_shoff = cpu_to_dump32(s, shoff);
         elf_header.e_shentsize = cpu_to_dump16(s, sizeof(Elf32_Shdr));
@@ -358,12 +360,12 @@ static void write_elf_section(DumpState *s, int type, Error **errp)
     if (type == 0) {
         shdr_size = sizeof(Elf32_Shdr);
         memset(&shdr32, 0, shdr_size);
-        shdr32.sh_info = cpu_to_dump32(s, s->sh_info);
+        shdr32.sh_info = cpu_to_dump32(s, s->phdr_num);
         shdr = &shdr32;
     } else {
         shdr_size = sizeof(Elf64_Shdr);
         memset(&shdr64, 0, shdr_size);
-        shdr64.sh_info = cpu_to_dump32(s, s->sh_info);
+        shdr64.sh_info = cpu_to_dump32(s, s->phdr_num);
         shdr = &shdr64;
     }
 
@@ -478,13 +480,6 @@ static void write_elf_loads(DumpState *s, Error **errp)
     hwaddr offset, filesz;
     MemoryMapping *memory_mapping;
     uint32_t phdr_index = 1;
-    uint32_t max_index;
-
-    if (s->have_section) {
-        max_index = s->sh_info;
-    } else {
-        max_index = s->phdr_num;
-    }
 
     QTAILQ_FOREACH(memory_mapping, &s->list.head, next) {
         get_offset_range(memory_mapping->phys_addr,
@@ -502,7 +497,7 @@ static void write_elf_loads(DumpState *s, Error **errp)
             return;
         }
 
-        if (phdr_index >= max_index) {
+        if (phdr_index >= s->phdr_num) {
             break;
         }
     }
@@ -1801,22 +1796,21 @@ static void dump_init(DumpState *s, int fd, bool has_format,
         s->phdr_num += s->list.num;
         s->have_section = false;
     } else {
+        /* sh_info of section 0 holds the real number of phdrs */
         s->have_section = true;
-        s->phdr_num = PN_XNUM;
-        s->sh_info = 1; /* PT_NOTE */
 
         /* the type of shdr->sh_info is uint32_t, so we should avoid overflow */
         if (s->list.num <= UINT32_MAX - 1) {
-            s->sh_info += s->list.num;
+            s->phdr_num += s->list.num;
         } else {
-            s->sh_info = UINT32_MAX;
+            s->phdr_num = UINT32_MAX;
         }
     }
 
     if (s->dump_info.d_class == ELFCLASS64) {
         if (s->have_section) {
             s->memory_offset = sizeof(Elf64_Ehdr) +
-                               sizeof(Elf64_Phdr) * s->sh_info +
+                               sizeof(Elf64_Phdr) * s->phdr_num +
                                sizeof(Elf64_Shdr) + s->note_size;
         } else {
             s->memory_offset = sizeof(Elf64_Ehdr) +
@@ -1825,7 +1819,7 @@ static void dump_init(DumpState *s, int fd, bool has_format,
     } else {
         if (s->have_section) {
             s->memory_offset = sizeof(Elf32_Ehdr) +
-                               sizeof(Elf32_Phdr) * s->sh_info +
+                               sizeof(Elf32_Phdr) * s->phdr_num +
                                sizeof(Elf32_Shdr) + s->note_size;
         } else {
             s->memory_offset = sizeof(Elf32_Ehdr) +
diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
index 250143cb5a..b463fc9c02 100644
--- a/include/sysemu/dump.h
+++ b/include/sysemu/dump.h
@@ -154,8 +154,7 @@ typedef struct DumpState {
     GuestPhysBlockList guest_phys_blocks;
     ArchDumpInfo dump_info;
     MemoryMappingList list;
-    uint16_t phdr_num;
-    uint32_t sh_info;
+    uint32_t phdr_num;
     bool have_section;
     bool resume;
     bool detached;
-- 
2.32.0


