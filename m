Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8EA57CBF5
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 15:31:48 +0200 (CEST)
Received: from localhost ([::1]:44134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEWHL-0004Gp-98
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 09:31:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oEW9V-0000GU-1d; Thu, 21 Jul 2022 09:23:41 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:19740
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oEW9T-0006WQ-5j; Thu, 21 Jul 2022 09:23:40 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26LDCVCV021493;
 Thu, 21 Jul 2022 13:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=D2x7T50IBy/XSdWOVW7WAMA6vT4JHh4z53KUOBlTs70=;
 b=PYA9KCKMC5uUYfvSUdPujFA5P+94oN2aNBI1+ojKMR1rb1sWZ7VnPjrvHQKknLVXgtWo
 mkvTaPwXVUGFHN4upTDZVWXlD0aayo7puSHki1hCbd7gBrsuhIWlHanaU67+dHP7R2cG
 OzF5sQ7EGHWATCS+ceiqBK7YtgwiVFFJMsFNGGK14gRw0xBV0htc+3qYm1h7eQuOBR7x
 n+QbwIS6xBcSrLibctJDflSSPC5eAX6lQ4m6Hxk4IbCjI2MTJR/DnVvxvnkvzVDmOLKc
 5ubly0EsX7qA+pW8dxMb1J9bXvFzCa2taGQy2qKL2QdBMAL+YLsCnFhRzsKc4zpLWyyv VQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hf6t4su7c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 13:23:37 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26LDCeNo022481;
 Thu, 21 Jul 2022 13:23:37 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hf6t4su6t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 13:23:36 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26LDNTOe031165;
 Thu, 21 Jul 2022 13:23:35 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3hbmy8xyj4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 13:23:35 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 26LDLhYH18088226
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jul 2022 13:21:43 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 074164C04A;
 Thu, 21 Jul 2022 13:23:32 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E22E14C040;
 Thu, 21 Jul 2022 13:23:30 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 21 Jul 2022 13:23:30 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com
Subject: [PATCH v3 04/14] dump: Allocate header
Date: Thu, 21 Jul 2022 13:22:46 +0000
Message-Id: <20220721132256.2171-5-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220721132256.2171-1-frankja@linux.ibm.com>
References: <20220721132256.2171-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 42Zzk3ELeMSxN-4bN-J4e21Ir-pIwukU
X-Proofpoint-GUID: mp_nPVvBLlk6NwJyAXDlUpJAMdI83x0z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-21_17,2022-07-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 bulkscore=0 adultscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207210053
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

Allocating the header lets us write it at a later time and hence also
allows us to change section and segment table offsets until we
finally write it.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 dump/dump.c           | 127 +++++++++++++++++++++---------------------
 include/sysemu/dump.h |   1 +
 2 files changed, 64 insertions(+), 64 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 5c9ed25c5a..2d04e06815 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -98,6 +98,7 @@ static int dump_cleanup(DumpState *s)
     memory_mapping_list_free(&s->list);
     close(s->fd);
     g_free(s->guest_note);
+    g_free(s->elf_header);
     s->guest_note = NULL;
     if (s->resume) {
         if (s->detached) {
@@ -126,73 +127,49 @@ static int fd_write_vmcore(const void *buf, size_t size, void *opaque)
     return 0;
 }
 
-static void write_elf64_header(DumpState *s, Error **errp)
+static void prepare_elf64_header(DumpState *s)
 {
-    /*
-     * phnum in the elf header is 16 bit, if we have more segments we
-     * set phnum to PN_XNUM and write the real number of segments to a
-     * special section.
-     */
-    uint16_t phnum = MIN(s->phdr_num, PN_XNUM);
-    Elf64_Ehdr elf_header;
-    int ret;
+    uint16_t phnum = s->phdr_num >= PN_XNUM ? PN_XNUM : s->phdr_num;
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
+static void prepare_elf32_header(DumpState *s)
 {
-    /*
-     * phnum in the elf header is 16 bit, if we have more segments we
-     * set phnum to PN_XNUM and write the real number of segments to a
-     * special section.
-     */
-    uint16_t phnum = MIN(s->phdr_num, PN_XNUM);
-    Elf32_Ehdr elf_header;
-    int ret;
+    uint16_t phnum = s->phdr_num >= PN_XNUM ? PN_XNUM : s->phdr_num;
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
+    elf_header->e_phnum = cpu_to_dump16(s, phnum);
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
 
@@ -528,6 +505,26 @@ static void write_elf_notes(DumpState *s, Error **errp)
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
@@ -557,12 +554,11 @@ static void dump_begin(DumpState *s, Error **errp)
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
+    /* Start to write stuff into file descriptor */
+    write_elf_header(s, errp);
     if (*errp) {
         return;
     }
@@ -1642,6 +1638,9 @@ static void dump_init(DumpState *s, int fd, bool has_format,
         goto cleanup;
     }
 
+    s->elf_header = g_malloc0(dump_is_64bit(s) ?
+                              sizeof(Elf64_Ehdr) : sizeof(Elf32_Ehdr));
+
     /*
      * The goal of this block is to (a) update the previously guessed
      * phys_base, (b) copy the guest note out of the guest.
diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
index 7025e50682..58f41bbf45 100644
--- a/include/sysemu/dump.h
+++ b/include/sysemu/dump.h
@@ -171,6 +171,7 @@ typedef struct DumpState {
     int64_t begin;             /* Start address of the chunk we want to dump */
     int64_t length;            /* Length of the dump we want to dump */
 
+    void *elf_header;
     uint8_t *note_buf;          /* buffer for notes */
     size_t note_buf_offset;     /* the writing place in note_buf */
     uint32_t nr_cpus;           /* number of guest's cpu */
-- 
2.34.1


