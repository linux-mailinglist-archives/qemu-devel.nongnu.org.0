Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 879AA4EC4CA
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 14:45:10 +0200 (CEST)
Received: from localhost ([::1]:43064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZXhF-0004VP-IN
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 08:45:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nZXZU-0006Xj-KU
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 08:37:10 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:20024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nZXZS-0003Ne-R7
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 08:37:08 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22UBtK8G027552; 
 Wed, 30 Mar 2022 12:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=WYQ+Xlox94YTYQMkY2zxvl6qIS/JoH4wVE56qMQ37kg=;
 b=fXLWKYfAjeTnX8poy3Glh4nCSUYfD9aTn5DwdknQyz3xlX26zqEU8meHJv35OeDWkMAT
 7AHXMTWJKmG/qLvuBTnmkqG8o1m9YPTbunnVYDgwrvN/QKGHEqwFQpKU/XVdP9SL8/Vu
 0PybjCtWo7wx2V+z3Od2Nls6skp4y4d6eYegPB/N+AJk+2Ebsmp+s5YcNmfnjK75/+2f
 31aT6K4AQArisKZVVD+WK7lu1on6K/+DuY44gEGNFx8VYfgctPnbbSfpZk0L1WfrrQQG
 Ej4+UAV6GOB2sdBqQLrGkdQ2ITgZdAedGdak6oTNSjQRVDwGvhzhDELYyZEyad6Rp3go DQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f3ydcpr3c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 12:37:04 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22UBqQvG024589;
 Wed, 30 Mar 2022 12:37:04 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f3ydcpr2n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 12:37:03 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22UCMiqd012534;
 Wed, 30 Mar 2022 12:37:02 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 3f1tf8q9wx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 12:37:02 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22UCaxPf39125254
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 12:36:59 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D9EE95204F;
 Wed, 30 Mar 2022 12:36:59 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 5DB5D5204E;
 Wed, 30 Mar 2022 12:36:59 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/9] dump: Introduce dump_is_64bit() helper function
Date: Wed, 30 Mar 2022 12:36:00 +0000
Message-Id: <20220330123603.107120-7-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220330123603.107120-1-frankja@linux.ibm.com>
References: <20220330123603.107120-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AQAa805WNUy4sP4F9QsieHmsRYhtndsP
X-Proofpoint-GUID: FDHUrl71YoYEmtCPXHAHkIGwqnQmQEPp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-30_04,2022-03-30_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 clxscore=1015 malwarescore=0 mlxscore=0 mlxlogscore=880 suspectscore=0
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

Checking d_class in dump_info leads to lengthy conditionals so let's
shorten things a bit by introducing a helper function.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 dump/dump.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 4be4dcab24..a7cf112d8f 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -55,6 +55,11 @@ static Error *dump_migration_blocker;
       DIV_ROUND_UP((name_size), 4) +                    \
       DIV_ROUND_UP((desc_size), 4)) * 4)
 
+static inline bool dump_is_64bit(DumpState *s)
+{
+    return s->dump_info.d_class == ELFCLASS64;
+}
+
 uint16_t cpu_to_dump16(DumpState *s, uint16_t val)
 {
     if (s->dump_info.d_endian == ELFDATA2LSB) {
@@ -479,7 +484,7 @@ static void write_elf_loads(DumpState *s, Error **errp)
         get_offset_range(memory_mapping->phys_addr,
                          memory_mapping->length,
                          s, &offset, &filesz);
-        if (s->dump_info.d_class == ELFCLASS64) {
+        if (dump_is_64bit(s)) {
             write_elf64_load(s, memory_mapping, phdr_index++, offset,
                              filesz, errp);
         } else {
@@ -527,7 +532,7 @@ static void dump_begin(DumpState *s, Error **errp)
      */
 
     /* write elf header to vmcore */
-    if (s->dump_info.d_class == ELFCLASS64) {
+    if (dump_is_64bit(s)) {
         write_elf64_header(s, errp);
     } else {
         write_elf32_header(s, errp);
@@ -536,7 +541,7 @@ static void dump_begin(DumpState *s, Error **errp)
         return;
     }
 
-    if (s->dump_info.d_class == ELFCLASS64) {
+    if (dump_is_64bit(s)) {
         /* write PT_NOTE to vmcore */
         write_elf64_note(s, errp);
         if (*errp) {
@@ -747,7 +752,7 @@ static void get_note_sizes(DumpState *s, const void *note,
     uint64_t name_sz;
     uint64_t desc_sz;
 
-    if (s->dump_info.d_class == ELFCLASS64) {
+    if (dump_is_64bit(s)) {
         const Elf64_Nhdr *hdr = note;
         note_head_sz = sizeof(Elf64_Nhdr);
         name_sz = tswap64(hdr->n_namesz);
@@ -1007,10 +1012,10 @@ out:
 
 static void write_dump_header(DumpState *s, Error **errp)
 {
-    if (s->dump_info.d_class == ELFCLASS32) {
-        create_header32(s, errp);
-    } else {
+    if (dump_is_64bit(s)) {
         create_header64(s, errp);
+    } else {
+        create_header32(s, errp);
     }
 }
 
@@ -1697,8 +1702,8 @@ static void dump_init(DumpState *s, int fd, bool has_format,
         uint32_t size;
         uint16_t format;
 
-        note_head_size = s->dump_info.d_class == ELFCLASS32 ?
-            sizeof(Elf32_Nhdr) : sizeof(Elf64_Nhdr);
+        note_head_size = dump_is_64bit(s) ?
+            sizeof(Elf64_Nhdr) : sizeof(Elf32_Nhdr);
 
         format = le16_to_cpu(vmci->vmcoreinfo.guest_format);
         size = le32_to_cpu(vmci->vmcoreinfo.size);
@@ -1801,7 +1806,7 @@ static void dump_init(DumpState *s, int fd, bool has_format,
         }
     }
 
-    if (s->dump_info.d_class == ELFCLASS64) {
+    if (dump_is_64bit(s)) {
         s->phdr_offset = sizeof(Elf64_Ehdr);
         s->shdr_offset = s->phdr_offset + sizeof(Elf64_Phdr) * s->phdr_num;
         s->note_offset = s->shdr_offset + sizeof(Elf64_Shdr) * s->shdr_num;
-- 
2.32.0


