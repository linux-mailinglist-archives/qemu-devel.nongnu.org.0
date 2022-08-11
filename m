Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB4458FC2E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 14:28:55 +0200 (CEST)
Received: from localhost ([::1]:43390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM7J0-0005bm-Ha
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 08:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oM73x-0004ji-Ez; Thu, 11 Aug 2022 08:13:21 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:16794
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oM73v-0000Gm-Oc; Thu, 11 Aug 2022 08:13:21 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27BC6tUM013304;
 Thu, 11 Aug 2022 12:13:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=E9z6NiDh7/Z0jTHNH62yeKL9ArSR03i7hp8bzrfANxI=;
 b=l0dJDktQpZlVz4YSpYNXPaWpuzJ/++T4dHbK64XFspBg45Gk6tEJwdM0By8859UI4kqV
 1Igl3L8sXtac/MQn+WLs6XyjJJsw+BDLBBdeBJYYIBr1MydlH/uZFbAb+uJz5Jui6DZW
 YmTR0btfXLF2qneLj/yjQQMtWbTtdY9BizcL9kpMxr5dudR+SEJBQTRRC0nOGscHXzNc
 8ukI1PAg/UlRbjnKSG3oNGZOpOntHO4CpJUaLrKzXy9LYzIGj9zq1cKSEzR5xRAnB0om
 1Y0NLC+CQI1P16JhdO7X0Ki3lMGdq7t4tqwDhDacFxcvBJenIJMgxnQn7nArQJFc/bzf lw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hw1dp0q5y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:13:18 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27BC7kRb021948;
 Thu, 11 Aug 2022 12:12:53 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hw1dp0pas-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:12:52 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27BC7E7G014863;
 Thu, 11 Aug 2022 12:12:16 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3huwvg20m0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:12:16 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27BCCDcB10224064
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 12:12:13 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F48AAE04D;
 Thu, 11 Aug 2022 12:12:13 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E324AE045;
 Thu, 11 Aug 2022 12:12:12 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 11 Aug 2022 12:12:12 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com, scgl@linux.ibm.com
Subject: [PATCH v5 11/18] dump: Swap segment and section header locations
Date: Thu, 11 Aug 2022 12:11:04 +0000
Message-Id: <20220811121111.9878-12-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220811121111.9878-1-frankja@linux.ibm.com>
References: <20220811121111.9878-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UYZpVHYXsv9IUzHwRAV4P5MkI5vjiExe
X-Proofpoint-ORIG-GUID: SXc7SnftbE_bua0HuEnAZIurEm_rvFxm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_05,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 mlxlogscore=999
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

For the upcoming string table and arch section support we need to
modify the elf layout a bit. Instead of the segments, i.e. the guest's
memory contents, being the last area the section data will live at
the end of the file. This will allow us to write the section data
after all guest memory has been dumped which is important for the s390
PV dump support.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 dump/dump.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 0051c71d08..31eb20108c 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -595,6 +595,9 @@ static void dump_begin(DumpState *s, Error **errp)
      *   --------------
      *   |  memory     |
      *   --------------
+     *   |  sectn data |
+     *   --------------
+
      *
      * we only know where the memory is saved after we write elf note into
      * vmcore.
@@ -1842,17 +1845,16 @@ static void dump_init(DumpState *s, int fd, bool has_format,
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
+    s->memory_offset = s->note_offset + s->note_size;
+    s->section_offset = s->memory_offset + s->total_size;
 
     return;
 
-- 
2.34.1


