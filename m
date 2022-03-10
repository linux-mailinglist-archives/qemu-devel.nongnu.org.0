Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D8A4D4596
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:21:50 +0100 (CET)
Received: from localhost ([::1]:44264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSGrd-0004Iy-DJ
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:21:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nSGmd-0004Gf-P3
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:16:40 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:21676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nSGma-0005ss-EM
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:16:39 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22A9rTkM020348
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=U9JnNx1uTnbFfa6MKCnSb9q4Qkq9Crn3IUq0j/zg4k8=;
 b=C7wH798pPQHw+xxUiypfJ6dpiqsbY/RKKqC/L8k/xUFwtUKspPOhjBAYhtf5yPDlbaFK
 Lak1OvDlOLi6IhRYaraNpskjOgv1hTJ7dGEy40vlNnK40q1HxyPhGsfnI0/5yRw38GP3
 iX2tq81SAfyqXVlup6lieuAPtYsh90IK9RlgK6EJjpwM7k8ozbtLB8QnFTbZFHcwqFKK
 Oqk/KTELo3Agfeg3QdAcf83iBwTqAj12GFRmEgQ0rt3bDu4ULqgowFoBltFIJ6eEOxiK
 L1DIUwtufuVbfSYpkrR0Jfv+Hp7erql27sfWXkDLfOqLtxQ2Yn1vzJlQ1JOD/p4MRMF4 3A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eqf3n1jkx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:16:35 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22AAh9uu015973
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:16:34 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eqf3n1jkb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:16:34 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22ABD9kQ029529;
 Thu, 10 Mar 2022 11:16:32 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 3ep8c3v5dw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:16:32 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22ABGUVQ44892670
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 11:16:30 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B9FA74C04E;
 Thu, 10 Mar 2022 11:16:29 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3CE7F4C044;
 Thu, 10 Mar 2022 11:16:29 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 10 Mar 2022 11:16:29 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] dump: Allocate header
Date: Thu, 10 Mar 2022 11:16:04 +0000
Message-Id: <20220310111608.3362-2-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220310111608.3362-1-frankja@linux.ibm.com>
References: <20220310111608.3362-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: gslLjjUCrDBvCBRAYciMIhPF9ng3yYuj
X-Proofpoint-GUID: 1pNZcH3hNWjcmyjB9DQ1Jo2di6jMAfy8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-10_03,2022-03-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203100059
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
Cc: marcandre.lureau@redhat.com, mhartmay@linux.ibm.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allocating the header lets us write it at a later time and hence also
allows us to change section and segment table offsets until we
finally write it.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 dump/dump.c           | 115 ++++++++++++++++++++++--------------------
 include/sysemu/dump.h |   1 +
 2 files changed, 62 insertions(+), 54 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index ae8ec527de..88343d7486 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -99,6 +99,7 @@ static int dump_cleanup(DumpState *s)
     memory_mapping_list_free(&s->list);
     close(s->fd);
     g_free(s->guest_note);
+    g_free(s->elf_header);
     s->guest_note = NULL;
     if (s->resume) {
         if (s->detached) {
@@ -127,63 +128,47 @@ static int fd_write_vmcore(const void *buf, size_t size, void *opaque)
     return 0;
 }
 
-static void write_elf64_header(DumpState *s, Error **errp)
+static void prepare_elf64_header(DumpState *s)
 {
-    uint16_t phnum = s->phdr_num >= PN_XNUM ? PN_XNUM : s->phdr_num;
-    Elf64_Ehdr elf_header;
-    int ret;
+    Elf64_Ehdr *elf_header = s->elf_header;
 
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
+    memcpy(elf_header, ELFMAG, SELFMAG);
+    elf_header->e_ident[EI_CLASS] = ELFCLASS64;
+    elf_header->e_ident[EI_DATA] = s->dump_info.d_endian;
+    elf_header->e_ident[EI_VERSION] = EV_CURRENT;
+    elf_header->e_type = cpu_to_dump16(s, ET_CORE);
+    elf_header->e_machine = cpu_to_dump16(s, s->dump_info.d_machine);
+    elf_header->e_version = cpu_to_dump32(s, EV_CURRENT);
+    elf_header->e_ehsize = cpu_to_dump16(s, sizeof(*elf_header));
+    elf_header->e_phoff = cpu_to_dump64(s, s->phdr_offset);
+    elf_header->e_phentsize = cpu_to_dump16(s, sizeof(Elf64_Phdr));
+    elf_header->e_phnum = cpu_to_dump16(s, s->phdr_num);
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
+static void prepare_elf32_header(DumpState *s)
 {
-    uint16_t phnum = s->phdr_num >= PN_XNUM ? PN_XNUM : s->phdr_num;
-    Elf32_Ehdr elf_header;
-    int ret;
+    Elf32_Ehdr *elf_header = s->elf_header;
 
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
+    memcpy(elf_header, ELFMAG, SELFMAG);
+    elf_header->e_ident[EI_CLASS] = ELFCLASS32;
+    elf_header->e_ident[EI_DATA] = s->dump_info.d_endian;
+    elf_header->e_ident[EI_VERSION] = EV_CURRENT;
+    elf_header->e_type = cpu_to_dump16(s, ET_CORE);
+    elf_header->e_machine = cpu_to_dump16(s, s->dump_info.d_machine);
+    elf_header->e_version = cpu_to_dump32(s, EV_CURRENT);
+    elf_header->e_ehsize = cpu_to_dump16(s, sizeof(*elf_header));
+    elf_header->e_phoff = cpu_to_dump32(s, s->phdr_offset);
+    elf_header->e_phentsize = cpu_to_dump16(s, sizeof(Elf32_Phdr));
+    elf_header->e_phnum = cpu_to_dump16(s, s->phdr_num);
     if (s->shdr_num) {
-        elf_header.e_shoff = cpu_to_dump32(s, s->shdr_offset);
-        elf_header.e_shentsize = cpu_to_dump16(s, sizeof(Elf32_Shdr));
-        elf_header.e_shnum = cpu_to_dump16(s, s->shdr_num);
-    }
-
-    ret = fd_write_vmcore(&elf_header, sizeof(elf_header), s);
-    if (ret < 0) {
-        error_setg_errno(errp, -ret, "dump: failed to write elf header");
+        elf_header->e_shoff = cpu_to_dump32(s, s->shdr_offset);
+        elf_header->e_shentsize = cpu_to_dump16(s, sizeof(Elf32_Shdr));
+        elf_header->e_shnum = cpu_to_dump16(s, s->shdr_num);
     }
 }
 
@@ -524,6 +509,26 @@ static void write_elf_notes(DumpState *s, Error **errp)
     }
 }
 
+static void prepare_elf_header(DumpState *s)
+{
+    if (dump_is_64bit(s)) {
+        prepare_elf64_header(s);
+    } else {
+        prepare_elf32_header(s);
+    }
+}
+
+static void write_elf_header(DumpState *s, Error **errp)
+{
+    size_t size = dump_is_64bit(s) ? sizeof(Elf64_Ehdr) : sizeof(Elf32_Ehdr);
+    int ret;
+
+    ret = fd_write_vmcore(s->elf_header, size, s);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "dump: failed to write elf header");
+    }
+}
+
 /* write elf header, PT_NOTE and elf note to vmcore. */
 static void dump_begin(DumpState *s, Error **errp)
 {
@@ -553,12 +558,11 @@ static void dump_begin(DumpState *s, Error **errp)
      * vmcore.
      */
 
-    /* write elf header to vmcore */
-    if (dump_is_64bit(s)) {
-        write_elf64_header(s, errp);
-    } else {
-        write_elf32_header(s, errp);
-    }
+    /* Write elf header to buffer */
+    prepare_elf_header(s);
+
+    /* Start to write stuff into files*/
+    write_elf_header(s, errp);
     if (*errp) {
         return;
     }
@@ -1683,6 +1687,9 @@ static void dump_init(DumpState *s, int fd, bool has_format,
         goto cleanup;
     }
 
+    s->elf_header = g_malloc0(dump_is_64bit(s) ?
+                              sizeof(Elf64_Ehdr) : sizeof(Elf32_Ehdr));
+
     /*
      * The goal of this block is to (a) update the previously guessed
      * phys_base, (b) copy the guest note out of the guest.
diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
index ffc2ea1072..9c4a83156b 100644
--- a/include/sysemu/dump.h
+++ b/include/sysemu/dump.h
@@ -172,6 +172,7 @@ typedef struct DumpState {
     int64_t begin;
     int64_t length;
 
+    void *elf_header;
     uint8_t *note_buf;          /* buffer for notes */
     size_t note_buf_offset;     /* the writing place in note_buf */
     uint32_t nr_cpus;           /* number of guest's cpu */
-- 
2.32.0


