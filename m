Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E95147DB1
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jan 2020 11:03:21 +0100 (CET)
Received: from localhost ([::1]:39678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuvo8-00075o-1H
	for lists+qemu-devel@lfdr.de; Fri, 24 Jan 2020 05:03:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38034)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1iuvmk-0005fZ-9N
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 05:01:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1iuvmf-00063d-G9
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 05:01:54 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:27156)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1iuvmf-00061q-8e
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 05:01:49 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00O9vcMd081422
 for <qemu-devel@nongnu.org>; Fri, 24 Jan 2020 05:01:48 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xqmjt0hkc-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 24 Jan 2020 05:01:47 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Fri, 24 Jan 2020 10:01:45 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 24 Jan 2020 10:01:42 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 00OA0ote21758242
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Jan 2020 10:00:50 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5266C4204C;
 Fri, 24 Jan 2020 10:01:41 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B004642042;
 Fri, 24 Jan 2020 10:01:39 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.180.45])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 24 Jan 2020 10:01:39 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] s390x: sigp: Fix sense running reporting
Date: Fri, 24 Jan 2020 05:01:37 -0500
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20012410-0012-0000-0000-000003803E94
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20012410-0013-0000-0000-000021BC883F
Message-Id: <20200124100137.28656-1-frankja@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-24_02:2020-01-24,
 2020-01-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 spamscore=0 suspectscore=1 priorityscore=1501 mlxscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001240082
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

The logic was inversed and reported running if the cpu was stopped.
Let's fix that.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 target/s390x/sigp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/sigp.c b/target/s390x/sigp.c
index 727875bb4a..286c0d6c9c 100644
--- a/target/s390x/sigp.c
+++ b/target/s390x/sigp.c
@@ -347,7 +347,7 @@ static void sigp_sense_running(S390CPU *dst_cpu, SigpInfo *si)
     }
 
     /* If halted (which includes also STOPPED), it is not running */
-    if (CPU(dst_cpu)->halted) {
+    if (!CPU(dst_cpu)->halted) {
         si->cc = SIGP_CC_ORDER_CODE_ACCEPTED;
     } else {
         set_sigp_status(si, SIGP_STAT_NOT_RUNNING);
-- 
2.20.1


