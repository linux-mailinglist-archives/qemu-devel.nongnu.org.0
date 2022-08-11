Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2B958FCC2
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 14:48:51 +0200 (CEST)
Received: from localhost ([::1]:44604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM7cI-0002nC-QU
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 08:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oM73z-0004qN-9R; Thu, 11 Aug 2022 08:13:23 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:30268
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oM73x-0000H1-Ga; Thu, 11 Aug 2022 08:13:23 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27BC6uAp013326;
 Thu, 11 Aug 2022 12:13:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=BmRHsuK+vYdz7sIyEAMStl14GEV0COINJxpq96tfLFc=;
 b=qQr9ApNjpQqx0R0JX5uhRvT/jTTMI562anGhhPV7pPKjOhD5IUIRjFFDxD66tARdWfIn
 LocCxQ1s4sL4q6s9HXzzp4FlV8E2nXIFesv9ReX8cPBql8o1sJ2LjdX+O5gK5eHXne1f
 cDqn+S7ObjmgmXImr+SdT5iesfD8qNe47z641KjPSxwD/unfU6RC5aI4ROn1V8klR39p
 OTIoJds1wpzOJq8nfaiMtK4fPXbCk75FgxGI5PKsvgI8YRELxOn5gRlehJL99khpKsFb
 AziJAdP/55LJdlXV8nJ25vEWJUslCBq0zX6fqTi9i0ME+FRNTDRtkJwn7ZhiFIyBHGOh qw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hw1dp0q69-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:13:18 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27BC7SQZ018283;
 Thu, 11 Aug 2022 12:12:53 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hw1dp0p57-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:12:53 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27BC6liZ020663;
 Thu, 11 Aug 2022 12:12:13 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06fra.de.ibm.com with ESMTP id 3hvdjurtx9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:12:12 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27BCC9QM32506298
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 12:12:09 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B775AE04D;
 Thu, 11 Aug 2022 12:12:09 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A57CAE045;
 Thu, 11 Aug 2022 12:12:08 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 11 Aug 2022 12:12:08 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com, scgl@linux.ibm.com
Subject: [PATCH v5 08/18] dump: Rename write_elf*_phdr_note to
 prepare_elf*_phdr_note
Date: Thu, 11 Aug 2022 12:11:01 +0000
Message-Id: <20220811121111.9878-9-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220811121111.9878-1-frankja@linux.ibm.com>
References: <20220811121111.9878-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oJS_vsc1IhB4cQukAAcawbd7tml7rITt
X-Proofpoint-ORIG-GUID: yoGD-4piZ8qBuoGg_wP7U4wFXysc0cda
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_05,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 mlxlogscore=993
 clxscore=1015 mlxscore=0 phishscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208110037
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

The functions in question do not actually write to the file descriptor
they set up a buffer which is later written to the fd.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 dump/dump.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 8a2a97a85e..a905316fe5 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -260,7 +260,7 @@ static void write_elf32_load(DumpState *s, MemoryMapping *memory_mapping,
     }
 }
 
-static void write_elf64_phdr_note(DumpState *s, Elf64_Phdr *phdr)
+static void prepare_elf64_phdr_note(DumpState *s, Elf64_Phdr *phdr)
 {
     memset(phdr, 0, sizeof(*phdr));
     phdr->p_type = cpu_to_dump32(s, PT_NOTE);
@@ -316,7 +316,7 @@ static void write_elf64_notes(WriteCoreDumpFunction f, DumpState *s,
     write_guest_note(f, s, errp);
 }
 
-static void write_elf32_phdr_note(DumpState *s, Elf32_Phdr *phdr)
+static void prepare_elf32_phdr_note(DumpState *s, Elf32_Phdr *phdr)
 {
     memset(phdr, 0, sizeof(*phdr));
     phdr->p_type = cpu_to_dump32(s, PT_NOTE);
@@ -364,11 +364,11 @@ static void write_elf_phdr_note(DumpState *s, Error **errp)
     int ret;
 
     if (dump_is_64bit(s)) {
-        write_elf64_phdr_note(s, &phdr64);
+        prepare_elf64_phdr_note(s, &phdr64);
         size = sizeof(phdr64);
         phdr = &phdr64;
     } else {
-        write_elf32_phdr_note(s, &phdr32);
+        prepare_elf32_phdr_note(s, &phdr32);
         size = sizeof(phdr32);
         phdr = &phdr32;
     }
-- 
2.34.1


