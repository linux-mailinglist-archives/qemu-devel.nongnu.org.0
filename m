Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF474C8DCB
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 15:32:53 +0100 (CET)
Received: from localhost ([::1]:38832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP3YZ-0000LR-Rw
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 09:32:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nP3Oc-0002kR-S3
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 09:22:34 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:30752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nP3Ob-0007Lc-2W
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 09:22:34 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 221DkddZ020119
 for <qemu-devel@nongnu.org>; Tue, 1 Mar 2022 14:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=n6ym++9e3LIqur/Z77FCizgmO+QF5RvXmMmGz755F2Y=;
 b=ndbcIgIdFP+PCRDNh/fQFqv+tPI1g058RfLN3vGmf8FeA3UICLFo9nQeH7kX8EafKyx9
 OgHMo0NBXL39CKHG7vVU9GulbljeWtULZFfeBPJ6AksT79bp252HwNylPzUdtcpdy4R9
 ExY1wUOwS4Zu+V2Ad1bR6TtKTa82Rdh4haaTnfNfKCiM3/rhNVcVSclVdL8t9edv5Mfm
 3MMlWc29X7YVw0EmfoH5rmJy5nfMY72NZjsixCZuC2atzXwANrju2rdG7ROTFlcbLsIc
 JFyRJ/o0zChdy19iFfsvsNglgfpEcmsvANSrftu0K9LSgM0AiX5MH2hQtLVbRjOJVkP9 Hw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ehmnygwuh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 14:22:31 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 221Dm1L7023694
 for <qemu-devel@nongnu.org>; Tue, 1 Mar 2022 14:22:31 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ehmnygwty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 14:22:31 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 221EJUSS011242;
 Tue, 1 Mar 2022 14:22:28 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3egbj171fj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 14:22:28 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 221EBXK747907072
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Mar 2022 14:11:33 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 515E811C04A;
 Tue,  1 Mar 2022 14:22:26 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7588D11C054;
 Tue,  1 Mar 2022 14:22:25 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  1 Mar 2022 14:22:25 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/7] dump: Introduce dump_is_64bit() helper function
Date: Tue,  1 Mar 2022 14:22:10 +0000
Message-Id: <20220301142213.28568-5-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220301142213.28568-1-frankja@linux.ibm.com>
References: <20220301142213.28568-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EOmwK3WwYea2gg80BWsDZhWiwn6DVX2A
X-Proofpoint-ORIG-GUID: ojJ16Xv-myseojBDx5gPnp8hTiuxKc_w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-01_07,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 mlxlogscore=843 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 mlxscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2203010077
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
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

Checking d_class in dump_info leads to lengthy conditionals so let's
shorten things a bit by introducing a helper function.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 dump/dump.c           | 14 +++++++-------
 include/sysemu/dump.h |  6 ++++++
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 242f83db95..bb152bddff 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -481,7 +481,7 @@ static void write_elf_loads(DumpState *s, Error **errp)
         get_offset_range(memory_mapping->phys_addr,
                          memory_mapping->length,
                          s, &offset, &filesz);
-        if (s->dump_info.d_class == ELFCLASS64) {
+        if (dump_is_64bit(s)) {
             write_elf64_load(s, memory_mapping, phdr_index++, offset,
                              filesz, &local_err);
         } else {
@@ -530,7 +530,7 @@ static void dump_begin(DumpState *s, Error **errp)
      */
 
     /* write elf header to vmcore */
-    if (s->dump_info.d_class == ELFCLASS64) {
+    if (dump_is_64bit(s)) {
         write_elf64_header(s, &local_err);
     } else {
         write_elf32_header(s, &local_err);
@@ -540,7 +540,7 @@ static void dump_begin(DumpState *s, Error **errp)
         return;
     }
 
-    if (s->dump_info.d_class == ELFCLASS64) {
+    if (dump_is_64bit(s)) {
         /* write PT_NOTE to vmcore */
         write_elf64_note(s, &local_err);
         if (local_err) {
@@ -761,7 +761,7 @@ static void get_note_sizes(DumpState *s, const void *note,
     uint64_t name_sz;
     uint64_t desc_sz;
 
-    if (s->dump_info.d_class == ELFCLASS64) {
+    if (dump_is_64bit(s)) {
         const Elf64_Nhdr *hdr = note;
         note_head_sz = sizeof(Elf64_Nhdr);
         name_sz = tswap64(hdr->n_namesz);
@@ -1023,7 +1023,7 @@ out:
 
 static void write_dump_header(DumpState *s, Error **errp)
 {
-    if (s->dump_info.d_class == ELFCLASS32) {
+    if (!dump_is_64bit(s)) {
         create_header32(s, errp);
     } else {
         create_header64(s, errp);
@@ -1716,7 +1716,7 @@ static void dump_init(DumpState *s, int fd, bool has_format,
         uint32_t size;
         uint16_t format;
 
-        note_head_size = s->dump_info.d_class == ELFCLASS32 ?
+        note_head_size = !dump_is_64bit(s) ?
             sizeof(Elf32_Nhdr) : sizeof(Elf64_Nhdr);
 
         format = le16_to_cpu(vmci->vmcoreinfo.guest_format);
@@ -1821,7 +1821,7 @@ static void dump_init(DumpState *s, int fd, bool has_format,
         }
     }
 
-    if (s->dump_info.d_class == ELFCLASS64) {
+    if (dump_is_64bit(s)) {
         s->phdr_offset = sizeof(Elf64_Ehdr);
         s->shdr_offset = s->phdr_offset + sizeof(Elf64_Phdr) * s->phdr_num;
         s->note_offset = s->shdr_offset + sizeof(Elf64_Shdr) * s->shdr_num;
diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
index ffc2ea1072..078b3d57a1 100644
--- a/include/sysemu/dump.h
+++ b/include/sysemu/dump.h
@@ -203,4 +203,10 @@ typedef struct DumpState {
 uint16_t cpu_to_dump16(DumpState *s, uint16_t val);
 uint32_t cpu_to_dump32(DumpState *s, uint32_t val);
 uint64_t cpu_to_dump64(DumpState *s, uint64_t val);
+
+static inline bool dump_is_64bit(DumpState *s)
+{
+    return s->dump_info.d_class == ELFCLASS64;
+}
+
 #endif
-- 
2.32.0


