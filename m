Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B011814865D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jan 2020 14:49:47 +0100 (CET)
Received: from localhost ([::1]:42570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuzLG-0007zz-Np
	for lists+qemu-devel@lfdr.de; Fri, 24 Jan 2020 08:49:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37708)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1iuzK9-0007X5-T0
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 08:48:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1iuzK8-0008Ng-J6
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 08:48:37 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60836)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1iuzK8-0008Mr-Bx
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 08:48:36 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00ODmTKF088028
 for <qemu-devel@nongnu.org>; Fri, 24 Jan 2020 08:48:35 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xqmjtey12-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 24 Jan 2020 08:48:33 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Fri, 24 Jan 2020 13:48:26 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 24 Jan 2020 13:48:23 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00ODmMBo39321708
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Jan 2020 13:48:22 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 535EDA4054;
 Fri, 24 Jan 2020 13:48:22 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8AB31A405C;
 Fri, 24 Jan 2020 13:48:20 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.180.45])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 24 Jan 2020 13:48:20 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] s390x: sigp: Fix sense running reporting
Date: Fri, 24 Jan 2020 08:48:18 -0500
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20012413-4275-0000-0000-0000039A8CFE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20012413-4276-0000-0000-000038AE9D87
Message-Id: <20200124134818.9981-1-frankja@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-24_04:2020-01-24,
 2020-01-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 phishscore=0 adultscore=0 spamscore=0 mlxlogscore=999 suspectscore=1
 mlxscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001240115
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: borntraeger@de.ibm.com, thuth@redhat.com, cohuck@redhat.com,
 qemu-s390x@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The logic was inverted and reported running if the cpu was stopped.
Let's fix that.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Fixes: d1b468bc8869 ("s390x/tcg: implement SIGP SENSE RUNNING STATUS")
Reviewed-by: David Hildenbrand <david@redhat.com>
---

Switched the actions instead of the condition so the comment still
applies.

---
 target/s390x/sigp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/s390x/sigp.c b/target/s390x/sigp.c
index 727875bb4a..c604f17710 100644
--- a/target/s390x/sigp.c
+++ b/target/s390x/sigp.c
@@ -348,9 +348,9 @@ static void sigp_sense_running(S390CPU *dst_cpu, SigpInfo *si)
 
     /* If halted (which includes also STOPPED), it is not running */
     if (CPU(dst_cpu)->halted) {
-        si->cc = SIGP_CC_ORDER_CODE_ACCEPTED;
-    } else {
         set_sigp_status(si, SIGP_STAT_NOT_RUNNING);
+    } else {
+        si->cc = SIGP_CC_ORDER_CODE_ACCEPTED;
     }
 }
 
-- 
2.20.1


