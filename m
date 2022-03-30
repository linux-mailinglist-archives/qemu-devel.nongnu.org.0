Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 056D64EC4F4
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 14:51:51 +0200 (CEST)
Received: from localhost ([::1]:57172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZXni-0006gQ-1w
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 08:51:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nZXZW-0006Xp-Gv
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 08:37:10 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:28994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nZXZU-0003Oi-As
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 08:37:10 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22UAg4i8009870; 
 Wed, 30 Mar 2022 12:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=uc/60VnmIhmn8zwJuhVcpJY/A2MZIP+QnuB4GprNaaM=;
 b=eHbCW0x99xSdS7jdHhUszev/OCukFY8r0/1tmhtU52dpRQqJHfa8K0kDlVt6bfChp2df
 hBMyTdJE2o+caejq5W7D28lv2TXbvvAMASCnNiGeK8lPu0a6cYddvuLa6e3qtn49iopa
 ci5MY47HQHdZ3bGMe0H6OUFHa6Gbifb110O9ejYJzDpf8kRb5Re/naNYBAzNNxTkIO8P
 NrKafnOS45vgGNNmFnAqizn9cCXSQidnBQEENei+COvLLDMFelJ8lszf7Dt45HpdamJs
 jUUAEQ/gpnSnDUfQRRl0uLagMZLS0a1WIjIz0zHEg+aA606dF2XGJq24Nfi0064LM7R8 iA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f40t8wdtk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 12:37:05 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22UCDf0e031988;
 Wed, 30 Mar 2022 12:37:05 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f40t8wdsq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 12:37:05 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22UCMY13030982;
 Wed, 30 Mar 2022 12:37:02 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3f1tf90js6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 12:37:02 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22UCb0xa43843968
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 12:37:00 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F07D5204F;
 Wed, 30 Mar 2022 12:37:00 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 0239B5204E;
 Wed, 30 Mar 2022 12:36:59 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 7/9] dump: Consolidate phdr note writes
Date: Wed, 30 Mar 2022 12:36:01 +0000
Message-Id: <20220330123603.107120-8-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220330123603.107120-1-frankja@linux.ibm.com>
References: <20220330123603.107120-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fVxTtrygZZ7wB4n-8N_ZSw_Qnr0Hlecj
X-Proofpoint-GUID: oKSlfGffj5a0wLu0GD6Ec85ahP4ADZIP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-30_04,2022-03-30_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 spamscore=0 mlxlogscore=768 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203300063
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
Cc: marcandre.lureau@redhat.com, richard.henderson@linaro.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's no need to have two write functions. Let's rather have two
functions that set the data for elf 32/64 and then write it in a
common function.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 dump/dump.c | 94 +++++++++++++++++++++++++++--------------------------
 1 file changed, 48 insertions(+), 46 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index a7cf112d8f..365798f5a1 100644
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


