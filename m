Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F1F1940F4
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Mar 2020 15:06:27 +0100 (CET)
Received: from localhost ([::1]:52348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHT9O-0001wz-Cs
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 10:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33321)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1jHT8V-0001Sy-MR
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 10:05:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1jHT8U-0003Ir-JO
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 10:05:31 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53078)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1jHT8U-0003IP-Bb
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 10:05:30 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02QE4HRo058278
 for <qemu-devel@nongnu.org>; Thu, 26 Mar 2020 10:05:29 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywe7w0dkg-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 26 Mar 2020 10:05:26 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Thu, 26 Mar 2020 14:05:17 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 26 Mar 2020 14:05:14 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02QE4GDN47710564
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Mar 2020 14:04:16 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7CFA642052;
 Thu, 26 Mar 2020 14:05:18 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5EA484203F;
 Thu, 26 Mar 2020 14:05:17 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.87.190])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 26 Mar 2020 14:05:17 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] s390x: protvirt: Fix stray error_report_err in
 s390_machine_protect
Date: Thu, 26 Mar 2020 10:05:05 -0400
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20032614-0016-0000-0000-000002F8890B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032614-0017-0000-0000-0000335C354A
Message-Id: <20200326140505.2432-1-frankja@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-26_04:2020-03-26,
 2020-03-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=525
 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0 adultscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=3 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2003260104
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
Cc: borntraeger@de.ibm.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In case the protection of the machine fails at s390_pv_vm_enable(),
we'll currently report the local_error variable. Problem is that
there's no migration blocker error that we can report at this point so
the pointer is always NULL which leads to a SEGFAULT.

Let's remove the error report.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reported-by: Marc Hartmayer <mhartmay@linux.ibm.com>
Fixes: 520935eedf941da3 ("s390x: protvirt: Add migration blocker")
---
 hw/s390x/s390-virtio-ccw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 3cf19c99f3468b7d..855ecf370d6e82fa 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -358,7 +358,6 @@ static int s390_machine_protect(S390CcwMachineState *ms)
     rc = s390_pv_vm_enable();
     if (rc) {
         qemu_balloon_inhibit(false);
-        error_report_err(local_err);
         migrate_del_blocker(pv_mig_blocker);
         error_free_or_abort(&pv_mig_blocker);
         return rc;
-- 
2.25.1


