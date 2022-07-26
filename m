Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8F558101E
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 11:41:51 +0200 (CEST)
Received: from localhost ([::1]:58486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGH4Y-00012f-Bv
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 05:41:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oGGn9-0004RU-B5; Tue, 26 Jul 2022 05:23:51 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:20634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oGGn7-0005ZY-HT; Tue, 26 Jul 2022 05:23:51 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26Q8rQao003152;
 Tue, 26 Jul 2022 09:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=1NwRgihiRrIpxJ8jBCRc20a5b2DsmxGeplnbjIIPNf4=;
 b=A8AjxOUGOzYTX0Ibbt6X4qdHsNezKH/n5LWv6D9DXU9IbdRYFFt6Td9ZzisLcDJza0Ay
 Dkchxdpjzflewh8gFk7F8EXOo/mjJRPtpBLTDGvjl58TXOilsPkB+hcQpQ6MIIX5pcKx
 JuaB8SjwB9SqUK7emiohjG8LDqL6a1t2v5SeJ5cY9TmG+kwwRNfRK5ljy0JSA0VE0Q/q
 ma8/Ct6TTc2s2bF4oD5AXPW5MbXEcBj+OF2rBL0/u+ubwSliBXrda1AsTikxOKkyuHK4
 vRd73tCAxKZhPdAvmYMoPuPqEQ33/GUDrG1WEwCvP2uKtzWSKavkcMdjqhekqo88vyi6 Rg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hjd59gtme-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 09:23:47 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26Q8t2ev007553;
 Tue, 26 Jul 2022 09:23:47 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hjd59gtke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 09:23:47 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26Q9Lsgl008172;
 Tue, 26 Jul 2022 09:23:44 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3hg97tbjff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 09:23:44 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 26Q9LhUG23920982
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 09:21:43 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3D7FA405B;
 Tue, 26 Jul 2022 09:23:41 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C2641A4054;
 Tue, 26 Jul 2022 09:23:40 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 26 Jul 2022 09:23:40 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com, scgl@linux.ibm.com
Subject: [PATCH v4 10/17] dump: Swap segment and section header locations
Date: Tue, 26 Jul 2022 09:22:41 +0000
Message-Id: <20220726092248.128336-11-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220726092248.128336-1-frankja@linux.ibm.com>
References: <20220726092248.128336-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dQZxqR_Anh1f1lOMwg22QNvfe6TJuTMH
X-Proofpoint-ORIG-GUID: CraD5GXH0PssiNB3L6FfYiibOjyVOP7W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_02,2022-07-25_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207260033
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

For the upcoming string table and arch section support we need to
modify the elf layout a bit. Instead of the segments, i.e. the guest's
memory contents, beeing the last area the section data will live at
the end of the file. This will allow us to write the section data
after all guest memory has been dumped which is important for the s390
PV dump support.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 dump/dump.c           | 21 ++++++++++++---------
 include/sysemu/dump.h |  1 +
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index a6bb7bfa21..3cf846d0a0 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -588,6 +588,9 @@ static void dump_begin(DumpState *s, Error **errp)
      *   --------------
      *   |  memory     |
      *   --------------
+     *   |  sectn data |
+     *   --------------
+
      *
      * we only know where the memory is saved after we write elf note into
      * vmcore.
@@ -1852,18 +1855,18 @@ static void dump_init(DumpState *s, int fd, bool has_format,
         }
     }
 
+    tmp = (s->phdr_num == PN_XNUM) ? s->sh_info : s->phdr_num;
     if (dump_is_64bit(s)) {
-        s->phdr_offset = sizeof(Elf64_Ehdr);
-        s->shdr_offset = s->phdr_offset + sizeof(Elf64_Phdr) * s->phdr_num;
-        s->note_offset = s->shdr_offset + sizeof(Elf64_Shdr) * s->shdr_num;
-        s->memory_offset = s->note_offset + s->note_size;
+        s->shdr_offset = sizeof(Elf64_Ehdr);
+        s->phdr_offset = s->shdr_offset + sizeof(Elf64_Shdr) * s->shdr_num;
+        s->note_offset = s->phdr_offset + sizeof(Elf64_Phdr) * tmp;
     } else {
-
-        s->phdr_offset = sizeof(Elf32_Ehdr);
-        s->shdr_offset = s->phdr_offset + sizeof(Elf32_Phdr) * s->phdr_num;
-        s->note_offset = s->shdr_offset + sizeof(Elf32_Shdr) * s->shdr_num;
-        s->memory_offset = s->note_offset + s->note_size;
+        s->shdr_offset = sizeof(Elf32_Ehdr);
+        s->phdr_offset = s->shdr_offset + sizeof(Elf32_Shdr) * s->shdr_num;
+        s->note_offset = s->phdr_offset + sizeof(Elf32_Phdr) * tmp;
     }
+    s->memory_offset = s->note_offset + s->note_size;
+    s->section_offset = s->memory_offset + s->total_size;
 
     return;
 
diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
index 3937afe0f9..696e6c67d6 100644
--- a/include/sysemu/dump.h
+++ b/include/sysemu/dump.h
@@ -172,6 +172,7 @@ typedef struct DumpState {
     hwaddr shdr_offset;
     hwaddr phdr_offset;
     hwaddr note_offset;
+    hwaddr section_offset;
 
     void *elf_header;
     void *elf_section_hdrs;
-- 
2.34.1


