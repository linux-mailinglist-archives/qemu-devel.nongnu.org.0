Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E52D54C8DAE
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 15:28:09 +0100 (CET)
Received: from localhost ([::1]:56342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP3U1-0001Pr-0i
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 09:28:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nP3Oe-0002lD-AC
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 09:22:37 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:54670
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nP3Ob-0007Ll-2w
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 09:22:36 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 221Cpa5l013930
 for <qemu-devel@nongnu.org>; Tue, 1 Mar 2022 14:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=MwmefBwBISwgZgaq6W6wOW4IcMImSK3fFClqr+h3B4w=;
 b=hHxIkIODwbKGxbACChwxfbqx7GpsqbrBHZt/TwF1tCMd1pLVHWP/hOorF7jIibxmU7oX
 uIuRc23Yg5Nm1J8KKaBio/Ob098y4YrST0ZyMSeidrBHsc9Fx9NYTZKy44Zg4znawztO
 Pr9SVz9Sw/lS1/hwnBG0TK2ftPeSWfYwmrBpmOWwZg8f2dnQQHIh/ItFZLQGDN26rslk
 ophoJcUJFBLBXRMcuNrZqFs+y0OLNRlT8f1oqqHCM1vriuixQuvn+H1kBH6m7XaBx8d8
 2OlZF/a9mv38E1+tZbmITl21zDIbYd/LYCMlmY8AE/BZ+bEUv8RVx1mwXnWSym9faDvt QQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ehkv5j7ta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 14:22:32 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 221DkYas020326
 for <qemu-devel@nongnu.org>; Tue, 1 Mar 2022 14:22:31 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ehkv5j7sy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 14:22:31 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 221EJQEb014250;
 Tue, 1 Mar 2022 14:22:30 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 3efbu92tm3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 14:22:29 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 221EMR3C24904030
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Mar 2022 14:22:27 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D4E511C054;
 Tue,  1 Mar 2022 14:22:27 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9F6BA11C04A;
 Tue,  1 Mar 2022 14:22:26 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  1 Mar 2022 14:22:26 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/7] dump: Consolidate phdr note writes
Date: Tue,  1 Mar 2022 14:22:11 +0000
Message-Id: <20220301142213.28568-6-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220301142213.28568-1-frankja@linux.ibm.com>
References: <20220301142213.28568-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: oGdhM9Sl46JZG7MA_VE1cJw7PMF9qzRJ
X-Proofpoint-GUID: 2DIBGC74YDge6jq9OGI4k1vJmCKiNwdH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-01_07,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 mlxlogscore=642
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203010077
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
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

There's no need to have two write functions. Let's rather have two
functions that set the data for elf 32/64 and then write it in a
common function.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 dump/dump.c | 96 ++++++++++++++++++++++++++---------------------------
 1 file changed, 48 insertions(+), 48 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index bb152bddff..88c2dbb466 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -231,24 +231,15 @@ static void write_elf32_load(DumpState *s, MemoryMapping *memory_mapping,
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
@@ -296,24 +287,15 @@ static void write_elf64_notes(WriteCoreDumpFunction f, DumpState *s,
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
@@ -343,6 +325,31 @@ static void write_elf32_notes(WriteCoreDumpFunction f, DumpState *s,
     write_guest_note(f, s, errp);
 }
 
+static void write_elf_phdr_note(DumpState *s, Error **errp)
+{
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
@@ -540,14 +547,14 @@ static void dump_begin(DumpState *s, Error **errp)
         return;
     }
 
-    if (dump_is_64bit(s)) {
-        /* write PT_NOTE to vmcore */
-        write_elf64_note(s, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
-            return;
-        }
+    /* write PT_NOTE to vmcore */
+    write_elf_phdr_note(s, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
 
+    if (dump_is_64bit(s)) {
         /* write all PT_LOAD to vmcore */
         write_elf_loads(s, &local_err);
         if (local_err) {
@@ -571,13 +578,6 @@ static void dump_begin(DumpState *s, Error **errp)
             return;
         }
     } else {
-        /* write PT_NOTE to vmcore */
-        write_elf32_note(s, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
-            return;
-        }
-
         /* write all PT_LOAD to vmcore */
         write_elf_loads(s, &local_err);
         if (local_err) {
-- 
2.32.0


