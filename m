Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 197B860096B
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 10:56:05 +0200 (CEST)
Received: from localhost ([::1]:51174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okLum-0004EG-2o
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 04:56:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1okLf0-0007u9-Eu; Mon, 17 Oct 2022 04:39:46 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:59710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1okLes-0003fA-IZ; Mon, 17 Oct 2022 04:39:43 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29H8WNq4036220;
 Mon, 17 Oct 2022 08:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=/IDzQIhXAkq3jrBq1ANyf9Nm05KksKODJ+RHgaKOnA4=;
 b=MV36BE/XpgclJUj9Ak4NjR5vbtLmwz8UlJ1bHSlfApuWdvh8LxqgD/sjTFoQNPj5C8Sn
 yRgeAUm01PlnuHlAOAdDwAMO6E8P/VoGJwgUwdKERzJoy2itVm1Z9IWNejPNyYKpW50L
 Kb72IWKZOdANWSCgZXm3xzUuhMEdoNUYo4/GTZg0HV3ubEi/FVRACbSLgq1oZ41pe2aK
 ceiaUbyqHdfCC78vcryyX4Gf3SiJLI5whPsGeZbvwuJFWLZmnvBbtauIdrqUBXOiI7uY
 GT18sR14SvHgcVZNZHdtAqf5DX7YUA8LcYdDX0LmChyp/ro2O4f02J7zLn+JSGp92jbk Eg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k86ug9ghg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 08:39:36 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29H5sXwj024564;
 Mon, 17 Oct 2022 08:39:36 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k86ug9gfd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 08:39:36 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29H8bPGH026457;
 Mon, 17 Oct 2022 08:39:31 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3k7mg92n4p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 08:39:31 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 29H8e0p645351184
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Oct 2022 08:40:00 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F1DEA4057;
 Mon, 17 Oct 2022 08:39:28 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D6A2A404D;
 Mon, 17 Oct 2022 08:39:27 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 17 Oct 2022 08:39:27 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com, scgl@linux.ibm.com
Subject: [PATCH v6 02/10] dump: Write ELF section headers right after ELF
 header
Date: Mon, 17 Oct 2022 08:38:14 +0000
Message-Id: <20221017083822.43118-3-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017083822.43118-1-frankja@linux.ibm.com>
References: <20221017083822.43118-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SjKdR6-n8_rMvllPYjxwdbultqMNu5ce
X-Proofpoint-ORIG-GUID: BW_W5EJtQwz4R_ybBopnJ-Tml4iExY0w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-17_07,2022-10-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=919 phishscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 mlxscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210170049
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Let's start bundling the writes of the headers and of the data so we
have a clear ordering between them. Since the ELF header uses offsets
to the headers we can freely order them.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 dump/dump.c | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index e7a3b54ebe..b168a25321 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -583,6 +583,8 @@ static void dump_begin(DumpState *s, Error **errp)
      *   --------------
      *   |  elf header |
      *   --------------
+     *   |  sctn_hdr   |
+     *   --------------
      *   |  PT_NOTE    |
      *   --------------
      *   |  PT_LOAD    |
@@ -591,8 +593,6 @@ static void dump_begin(DumpState *s, Error **errp)
      *   --------------
      *   |  PT_LOAD    |
      *   --------------
-     *   |  sec_hdr    |
-     *   --------------
      *   |  elf note   |
      *   --------------
      *   |  memory     |
@@ -608,6 +608,12 @@ static void dump_begin(DumpState *s, Error **errp)
         return;
     }
 
+    /* write section headers to vmcore */
+    write_elf_section_headers(s, errp);
+    if (*errp) {
+        return;
+    }
+
     /* write PT_NOTE to vmcore */
     write_elf_phdr_note(s, errp);
     if (*errp) {
@@ -620,12 +626,6 @@ static void dump_begin(DumpState *s, Error **errp)
         return;
     }
 
-    /* write section headers to vmcore */
-    write_elf_section_headers(s, errp);
-    if (*errp) {
-        return;
-    }
-
     /* write notes to vmcore */
     write_elf_notes(s, errp);
 }
@@ -1868,16 +1868,13 @@ static void dump_init(DumpState *s, int fd, bool has_format,
     }
 
     if (dump_is_64bit(s)) {
-        s->phdr_offset = sizeof(Elf64_Ehdr);
-        s->shdr_offset = s->phdr_offset + sizeof(Elf64_Phdr) * s->phdr_num;
-        s->note_offset = s->shdr_offset + sizeof(Elf64_Shdr) * s->shdr_num;
-        s->memory_offset = s->note_offset + s->note_size;
+        s->shdr_offset = sizeof(Elf64_Ehdr);
+        s->phdr_offset = s->shdr_offset + sizeof(Elf64_Shdr) * s->shdr_num;
+        s->note_offset = s->phdr_offset + sizeof(Elf64_Phdr) * s->phdr_num;
     } else {
-
-        s->phdr_offset = sizeof(Elf32_Ehdr);
-        s->shdr_offset = s->phdr_offset + sizeof(Elf32_Phdr) * s->phdr_num;
-        s->note_offset = s->shdr_offset + sizeof(Elf32_Shdr) * s->shdr_num;
-        s->memory_offset = s->note_offset + s->note_size;
+        s->shdr_offset = sizeof(Elf32_Ehdr);
+        s->phdr_offset = s->shdr_offset + sizeof(Elf32_Shdr) * s->shdr_num;
+        s->note_offset = s->phdr_offset + sizeof(Elf32_Phdr) * s->phdr_num;
     }
 
     return;
-- 
2.34.1


