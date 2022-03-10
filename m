Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF814D4582
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:17:58 +0100 (CET)
Received: from localhost ([::1]:32776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSGnt-00054n-BL
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:17:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nSGfT-0007Ht-KS
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:09:15 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nSGfQ-0004eR-2o
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:09:15 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22AAFPC5011045
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=AXpqr565e4vBBEV0/zJIx/jFY80xvyCw3TZZK5liE+M=;
 b=mjHJVIec5UcvkndBwVjpfCGrJtPXlwzw/cO94ScWyRAhEIubNvHnWTUcyh+pIdoO1E8A
 wzt1AMgz8hCVnxKewyLKsj/MzY9nV1aRXBPP1QiOkeRP4U3Ihi7P6Qeknmdw6y6LoWvs
 AHamV+Sg5W+OKnA+7VYVJu1DNbnCZeHXBG0m4xoLVcCgB/x+hDpZelmfiAoiWvsF5Oua
 Yd0Fo6BQCcOv0lBWpjnygW5ohqYApXs3R+zQAvC4GkfidCOv05uF9qsvD6jLXq4Nw4fx
 SnWa6lo06lllGoG8tSA5wwecRJcpKzw2iekkf4PiLW3O3zAoMaZvGH1wbagjlsOxan8G PA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3enywa31ce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:09:11 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22AAXGQx036164
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:09:10 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3enywa31bx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:09:10 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22AB3itY031973;
 Thu, 10 Mar 2022 11:09:09 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 3epysw9h3d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:09:08 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22AB96Sc33423790
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 11:09:06 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A7E511C06C;
 Thu, 10 Mar 2022 11:09:06 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1034411C066;
 Thu, 10 Mar 2022 11:09:06 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 10 Mar 2022 11:09:05 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/9] dump: Consolidate phdr note writes
Date: Thu, 10 Mar 2022 11:08:52 +0000
Message-Id: <20220310110854.2701-8-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220310110854.2701-1-frankja@linux.ibm.com>
References: <20220310110854.2701-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dQz101VxhRZYk6WLlLo0o9ArNuX76hdE
X-Proofpoint-ORIG-GUID: T63A-o5u-5HYVWf6Kbc6-e85E3x0b04C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-10_03,2022-03-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=662 phishscore=0
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

There's no need to have two write functions. Let's rather have two
functions that set the data for elf 32/64 and then write it in a
common function.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 dump/dump.c | 94 +++++++++++++++++++++++++++--------------------------
 1 file changed, 48 insertions(+), 46 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 8fcd23571f..1294673444 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -236,24 +236,15 @@ static void write_elf32_load(DumpState *s, MemoryMapping *memory_mapping,
     }
 }
 
-static void write_elf64_note(DumpState *s, Error **errp)
+static void write_elf64_phdr_note(DumpState *s, Elf64_Phdr *phdr)
 {
-    Elf64_Phdr phdr;
-    int ret;
-
-    memset(&phdr, 0, sizeof(Elf64_Phdr));
-    phdr.p_type = cpu_to_dump32(s, PT_NOTE);
-    phdr.p_offset = cpu_to_dump64(s, s->note_offset);
-    phdr.p_paddr = 0;
-    phdr.p_filesz = cpu_to_dump64(s, s->note_size);
-    phdr.p_memsz = cpu_to_dump64(s, s->note_size);
-    phdr.p_vaddr = 0;
-
-    ret = fd_write_vmcore(&phdr, sizeof(Elf64_Phdr), s);
-    if (ret < 0) {
-        error_setg_errno(errp, -ret,
-                         "dump: failed to write program header table");
-    }
+    memset(phdr, 0, sizeof(*phdr));
+    phdr->p_type = cpu_to_dump32(s, PT_NOTE);
+    phdr->p_offset = cpu_to_dump64(s, s->note_offset);
+    phdr->p_paddr = 0;
+    phdr->p_filesz = cpu_to_dump64(s, s->note_size);
+    phdr->p_memsz = cpu_to_dump64(s, s->note_size);
+    phdr->p_vaddr = 0;
 }
 
 static inline int cpu_index(CPUState *cpu)
@@ -301,24 +292,15 @@ static void write_elf64_notes(WriteCoreDumpFunction f, DumpState *s,
     write_guest_note(f, s, errp);
 }
 
-static void write_elf32_note(DumpState *s, Error **errp)
+static void write_elf32_phdr_note(DumpState *s, Elf32_Phdr *phdr)
 {
-    Elf32_Phdr phdr;
-    int ret;
-
-    memset(&phdr, 0, sizeof(Elf32_Phdr));
-    phdr.p_type = cpu_to_dump32(s, PT_NOTE);
-    phdr.p_offset = cpu_to_dump32(s, s->note_offset);
-    phdr.p_paddr = 0;
-    phdr.p_filesz = cpu_to_dump32(s, s->note_size);
-    phdr.p_memsz = cpu_to_dump32(s, s->note_size);
-    phdr.p_vaddr = 0;
-
-    ret = fd_write_vmcore(&phdr, sizeof(Elf32_Phdr), s);
-    if (ret < 0) {
-        error_setg_errno(errp, -ret,
-                         "dump: failed to write program header table");
-    }
+    memset(phdr, 0, sizeof(*phdr));
+    phdr->p_type = cpu_to_dump32(s, PT_NOTE);
+    phdr->p_offset = cpu_to_dump32(s, s->note_offset);
+    phdr->p_paddr = 0;
+    phdr->p_filesz = cpu_to_dump32(s, s->note_size);
+    phdr->p_memsz = cpu_to_dump32(s, s->note_size);
+    phdr->p_vaddr = 0;
 }
 
 static void write_elf32_notes(WriteCoreDumpFunction f, DumpState *s,
@@ -348,6 +330,32 @@ static void write_elf32_notes(WriteCoreDumpFunction f, DumpState *s,
     write_guest_note(f, s, errp);
 }
 
+static void write_elf_phdr_note(DumpState *s, Error **errp)
+{
+    ERRP_GUARD();
+    Elf32_Phdr phdr32;
+    Elf64_Phdr phdr64;
+    void *phdr;
+    size_t size;
+    int ret;
+
+    if (dump_is_64bit(s)) {
+        write_elf64_phdr_note(s, &phdr64);
+        size = sizeof(phdr64);
+        phdr = &phdr64;
+    } else {
+        write_elf32_phdr_note(s, &phdr32);
+        size = sizeof(phdr32);
+        phdr = &phdr32;
+    }
+
+    ret = fd_write_vmcore(phdr, size, s);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret,
+                         "dump: failed to write program header table");
+    }
+}
+
 static void write_elf_section(DumpState *s, int type, Error **errp)
 {
     Elf32_Shdr shdr32;
@@ -541,13 +549,13 @@ static void dump_begin(DumpState *s, Error **errp)
         return;
     }
 
-    if (dump_is_64bit(s)) {
-        /* write PT_NOTE to vmcore */
-        write_elf64_note(s, errp);
-        if (*errp) {
-            return;
-        }
+    /* write PT_NOTE to vmcore */
+    write_elf_phdr_note(s, errp);
+    if (*errp) {
+        return;
+    }
 
+    if (dump_is_64bit(s)) {
         /* write all PT_LOAD to vmcore */
         write_elf_loads(s, errp);
         if (*errp) {
@@ -568,12 +576,6 @@ static void dump_begin(DumpState *s, Error **errp)
             return;
         }
     } else {
-        /* write PT_NOTE to vmcore */
-        write_elf32_note(s, errp);
-        if (*errp) {
-            return;
-        }
-
         /* write all PT_LOAD to vmcore */
         write_elf_loads(s, errp);
         if (*errp) {
-- 
2.32.0


