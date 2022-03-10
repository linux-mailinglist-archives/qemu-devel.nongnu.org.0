Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBFA4D4572
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:15:05 +0100 (CET)
Received: from localhost ([::1]:52944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSGl6-0007ms-Pe
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:15:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nSGfS-0007Ea-9D
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:09:14 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:30538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nSGfP-0004eL-Bn
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:09:13 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22A9SjHA025706
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:09:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=u5Gi7ccqvYbGC4XJBpuFuWT7Fab4qX61E/HIb3xdbRQ=;
 b=ddUJB23poUIx0sNCWssUmvYKaymwXTLjGaKelrrs3+CYyVmZEH+QuJdTQMhDyUsi1/Df
 96FdI5eA8TN0yLmadf131FHPUBvRD8XDEuroCgA23FazLCTOFuyYOFmzSERE1DO4KlUA
 OVY3ftNoSb9SAJl+dqNOpZqB5MfIGFuzfeiK1W85cV0X4QpdHsy28JVnlhQJbV97eVLq
 k9nrjtJalFoD8dKkAm86af+wWvzxQlAUjqQmwpQtnbmbBKsnaTlPJdLbSLWiOKghmJgR
 D4aCuDstWG5m3zy//HclsaKzS9jOgBdek9gKm4kZtD8KQbnUXgeOhCFY9JMr8ra/30DC SA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3enywa31c5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:09:10 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22AAR2Yx015768
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:09:10 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3enywa31br-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:09:09 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22AB3uA6032442;
 Thu, 10 Mar 2022 11:09:08 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 3epysw9h3b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:09:08 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22AB96Rr46662124
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 11:09:06 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE18D11C069;
 Thu, 10 Mar 2022 11:09:05 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 740EE11C066;
 Thu, 10 Mar 2022 11:09:05 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 10 Mar 2022 11:09:05 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/9] dump: Introduce dump_is_64bit() helper function
Date: Thu, 10 Mar 2022 11:08:51 +0000
Message-Id: <20220310110854.2701-7-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220310110854.2701-1-frankja@linux.ibm.com>
References: <20220310110854.2701-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Yz85ua-QQFymzqgC6Hm1Jh1VvAg7NbP_
X-Proofpoint-ORIG-GUID: Y4hRCkcAxxxizE16r8FZxJklyoTnVCNY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-10_03,2022-03-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=809 phishscore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2203100059
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

Checking d_class in dump_info leads to lengthy conditionals so let's
shorten things a bit by introducing a helper function.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 dump/dump.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 12b3a1a83e..8fcd23571f 100644
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
@@ -1007,7 +1012,7 @@ out:
 
 static void write_dump_header(DumpState *s, Error **errp)
 {
-    if (s->dump_info.d_class == ELFCLASS32) {
+    if (!dump_is_64bit(s)) {
         create_header32(s, errp);
     } else {
         create_header64(s, errp);
@@ -1697,7 +1702,7 @@ static void dump_init(DumpState *s, int fd, bool has_format,
         uint32_t size;
         uint16_t format;
 
-        note_head_size = s->dump_info.d_class == ELFCLASS32 ?
+        note_head_size = !dump_is_64bit(s) ?
             sizeof(Elf32_Nhdr) : sizeof(Elf64_Nhdr);
 
         format = le16_to_cpu(vmci->vmcoreinfo.guest_format);
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


