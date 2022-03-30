Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E8B4EC4F0
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 14:50:45 +0200 (CEST)
Received: from localhost ([::1]:54360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZXmb-0004dC-Tm
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 08:50:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nZXZT-0006Xh-4i
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 08:37:10 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:3790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nZXZQ-0003Mh-Ar
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 08:37:06 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22UBCkOd011116; 
 Wed, 30 Mar 2022 12:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=8WzN/R0WchSHBbAcZ3MykMNtGn68Gdr+7wJbS81+pB8=;
 b=Jfx4wr/oecunugbRktkjq7ZJvOo/Vg+2vxhQWBIU5ZBRCvuEkhy79yLSOzMXBn5FPu1w
 cWS+h5BXt2IMtRpSkP11m9C/ftfSzSP8/2QXKQgoCe3HAuEXCzjngRfqndZMKgaHfbmn
 ZCmJ6OYT5qT8m5jFIecZbceTlqEg6FZAgYC5pez9uBI8yaOksiIoluhFhiAHZIAH6EG8
 Ga6excmYyUERrfWN35ccaL5nuIoyLegFra84WozlGKQPFNMRotW3ubS5wqXjaoGfxzpA
 mkPi/QuOwj2K0H/Dnd5YZN6NzEJdbe+pkeJ5/9DIF9qtxMAKBJkDTXc3alDZEzOYy6kO /Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f3ydcpr23-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 12:37:02 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22UBslKd006796;
 Wed, 30 Mar 2022 12:37:01 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f3ydcpr15-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 12:37:01 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22UCMYpm010026;
 Wed, 30 Mar 2022 12:36:59 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 3f1t3hyay4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 12:36:59 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22UCb38933227082
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 12:37:03 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F6235204E;
 Wed, 30 Mar 2022 12:36:57 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id D73A952051;
 Wed, 30 Mar 2022 12:36:56 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/9] dump: Remove the sh_info variable
Date: Wed, 30 Mar 2022 12:35:56 +0000
Message-Id: <20220330123603.107120-3-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220330123603.107120-1-frankja@linux.ibm.com>
References: <20220330123603.107120-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rWSH4wFFpJiDOi13iOa0Va3p8T6skcoz
X-Proofpoint-GUID: syjJT8OqPnwkRZ1hvwhCwzfJsxysFD5k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-30_04,2022-03-30_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 clxscore=1015 malwarescore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
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

There's no need to have phdr_num and sh_info at the same time. We can
make phdr_num 32 bit and set PN_XNUM when we write the header if
phdr_num >= PN_XNUM.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 dump/dump.c           | 34 ++++++++++++++--------------------
 include/sysemu/dump.h |  3 +--
 2 files changed, 15 insertions(+), 22 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 58c4923fce..0e6187c962 100644
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


