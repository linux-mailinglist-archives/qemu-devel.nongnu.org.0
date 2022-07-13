Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F393E5736E7
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 15:09:53 +0200 (CEST)
Received: from localhost ([::1]:48148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBc7k-00055O-HM
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 09:09:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oBc4y-00081s-Hp; Wed, 13 Jul 2022 09:07:00 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:39107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oBc4w-00069C-06; Wed, 13 Jul 2022 09:07:00 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26DCaAL0012641;
 Wed, 13 Jul 2022 13:06:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=FjW0cGQlPGuTURpPTSXaApInFRDxWt77p4d9SGV7AUQ=;
 b=rI40S7euTYiuwFERyjYPfKGtNVhaKwbuupDM/WXYQa4SrwagxwiKTohJRdfQ00P6oOI/
 pIkNgnRgYjuSIc3XqPJmxIpQzXN7KKc06hvKe3REdVN3UhsgMwCNIOlr/ETjRthZumTT
 odZ4iPM219XYymSmyr5w84V45MU343GQEADn8/CodpgpCJPqRbI/jlPx5tDPxnnk1raF
 RKdcqyU0TX+wu5pJqy8lhuQmtpi2oTcTmUhiiFdXYJlbNl4Ow3N4EHvTgaIeKUJP3zCN
 MIV/rgrgJ1HyNvjbkyhe1kdcp2/ggxLhmo30mwXx8S6f64Jf6WtPuUUjldnPWX5PnBdk Dw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h9w6aane7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 13:06:54 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26DBknUr014428;
 Wed, 13 Jul 2022 13:06:53 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h9w6aand1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 13:06:53 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26DCoIdh009090;
 Wed, 13 Jul 2022 13:06:51 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3h70xhwqaf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 13:06:51 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26DD6mqx25166246
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jul 2022 13:06:48 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7683AAE04D;
 Wed, 13 Jul 2022 13:06:48 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5ED94AE053;
 Wed, 13 Jul 2022 13:06:47 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 13 Jul 2022 13:06:47 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 richard.henderson@linaro.org
Subject: [PATCH v2 02/11] dump: Allocate header
Date: Wed, 13 Jul 2022 13:03:13 +0000
Message-Id: <20220713130322.25517-3-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220713130322.25517-1-frankja@linux.ibm.com>
References: <20220713130322.25517-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MiCdcJMybyml4xQoIObNDeDtsmKcDD8D
X-Proofpoint-ORIG-GUID: PpRxlzUFLe9jf1G4ZCrKKmQLXhGQYbWH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-13_01,2022-07-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207130053
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
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
index 6feba3cbfa..16d7474258 100644
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
+    /* Start to write stuff into files*/
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
index f3bf98c220..736f681d01 100644
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


