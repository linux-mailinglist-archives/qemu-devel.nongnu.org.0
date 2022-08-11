Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5924658FC93
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 14:42:37 +0200 (CEST)
Received: from localhost ([::1]:35838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM7WG-00046p-Et
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 08:42:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oM73t-0004V5-MC; Thu, 11 Aug 2022 08:13:17 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:38462
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oM73k-0000EX-E7; Thu, 11 Aug 2022 08:13:17 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27BC6uFk013321;
 Thu, 11 Aug 2022 12:13:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=Aitbrq1jm5v21G3dTZuymjyR3xxwPkrwhJpxxY2sPy4=;
 b=mwV+jEleesYmtDq2hy/T1Q3iwwZQUD3f50FEv4TShvKfJLE6DFExEkBWlg9Hns2tUofP
 zRB4kzUx3zgmyb3vOr3fS1EbnIYrscDmHx1a2z5byc4uc1dbhOa5gOvZjN1tESUhOPyS
 E1hBcQEX0gElpp4Ocf5uWbYk6PQOGD2WlsElmnPy8gd8O7G4l4AWHKanfJVGurjbECvH
 a/OnnJpnYpbbxphOxc12djXTzWPB0g231PQuYfkpJaqrsAF6OpSqL0qsRAeQbixKSBJt
 znix2XZ+7boPy26zbLhzU1rdHBkG1OZO01xoGt3bSHJmO7l4LezivGIujQNaSV1K1e3X zg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hw1dp0q2h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:13:06 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27BC7E7c016704;
 Thu, 11 Aug 2022 12:12:48 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hw1dp0ny9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:12:48 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27BC6Uxx015048;
 Thu, 11 Aug 2022 12:12:10 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 3huww0sr4h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:12:09 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 27BCCOAU19136966
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 12:12:24 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF170AE04D;
 Thu, 11 Aug 2022 12:12:06 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD5E7AE045;
 Thu, 11 Aug 2022 12:12:05 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 11 Aug 2022 12:12:05 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com, scgl@linux.ibm.com
Subject: [PATCH v5 06/18] dump: Rework dump_calculate_size function
Date: Thu, 11 Aug 2022 12:10:59 +0000
Message-Id: <20220811121111.9878-7-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220811121111.9878-1-frankja@linux.ibm.com>
References: <20220811121111.9878-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Om9Ux27BprWUSFI6MyQAMSXWG7OI1Ja_
X-Proofpoint-ORIG-GUID: GL8026nuAaMvaSOAFCKoQIOzNu0L8_So
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

dump_calculate_size() sums up all the sizes of the guest memory
blocks. Since we already have a function that calculates the size of a
single memory block (dump_get_memblock_size()) we can simply iterate
over the blocks and use the function instead of calculating the size
ourselves.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 dump/dump.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index b043337bc7..d82cc46d7d 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -1548,25 +1548,19 @@ bool qemu_system_dump_in_progress(void)
     return (qatomic_read(&state->status) == DUMP_STATUS_ACTIVE);
 }
 
-/* calculate total size of memory to be dumped (taking filter into
- * acoount.) */
+/*
+ * calculate total size of memory to be dumped (taking filter into
+ * account.)
+ */
 static int64_t dump_calculate_size(DumpState *s)
 {
     GuestPhysBlock *block;
-    int64_t size = 0, total = 0, left = 0, right = 0;
+    int64_t total = 0;
 
     QTAILQ_FOREACH(block, &s->guest_phys_blocks.head, next) {
-        if (dump_has_filter(s)) {
-            /* calculate the overlapped region. */
-            left = MAX(s->filter_area_begin, block->target_start);
-            right = MIN(s->filter_area_begin + s->filter_area_length, block->target_end);
-            size = right - left;
-            size = size > 0 ? size : 0;
-        } else {
-            /* count the whole region in */
-            size = (block->target_end - block->target_start);
-        }
-        total += size;
+        total += dump_filtered_memblock_size(block,
+                                             s->filter_area_begin,
+                                             s->filter_area_length);
     }
 
     return total;
-- 
2.34.1


