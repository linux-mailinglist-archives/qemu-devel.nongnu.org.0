Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D846E16FED9
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 13:23:45 +0100 (CET)
Received: from localhost ([::1]:43480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6vj6-0007Qk-UQ
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 07:23:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53322)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1j6vgQ-0002Lt-Uo
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 07:20:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1j6vgP-0007s4-P0
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 07:20:58 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:52198)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1j6vgP-0007qP-HR
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 07:20:57 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01QCJJ6Y021601
 for <qemu-devel@nongnu.org>; Wed, 26 Feb 2020 07:20:56 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ydqbsjhk7-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 26 Feb 2020 07:20:56 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Wed, 26 Feb 2020 12:20:54 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 26 Feb 2020 12:20:52 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01QCKpJn57344252
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Feb 2020 12:20:51 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A5E6011C064;
 Wed, 26 Feb 2020 12:20:51 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EABDC11C05B;
 Wed, 26 Feb 2020 12:20:50 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.152.224.212])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 26 Feb 2020 12:20:50 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 07/18] s390x: protvirt: Inhibit balloon when switching to
 protected mode
Date: Wed, 26 Feb 2020 07:20:27 -0500
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200226122038.61481-1-frankja@linux.ibm.com>
References: <20200226122038.61481-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20022612-0020-0000-0000-000003ADC035
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022612-0021-0000-0000-00002205DAF8
Message-Id: <20200226122038.61481-8-frankja@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-26_04:2020-02-26,
 2020-02-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=1 adultscore=0 mlxscore=0 mlxlogscore=856
 clxscore=1015 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2001150001 definitions=main-2002260092
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

Ballooning in protected VMs can only be done when the guest shares the
pages it gives to the host. Hence, until we have a solution for this
in the guest kernel, we inhibit ballooning when switching into
protected mode and reverse that once we move out of it.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 hw/s390x/s390-virtio-ccw.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 9983165b05..0f4455d1df 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -41,6 +41,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/s390x/tod.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/balloon.h"
 #include "hw/s390x/pv.h"
 #include "migration/blocker.h"
 
@@ -336,6 +337,7 @@ static void s390_machine_unprotect(S390CcwMachineState *ms)
         ms->pv = false;
     }
     migrate_del_blocker(pv_mig_blocker);
+    qemu_balloon_inhibit(false);
 }
 
 static int s390_machine_protect(S390CcwMachineState *ms)
@@ -344,6 +346,7 @@ static int s390_machine_protect(S390CcwMachineState *ms)
     CPUState *t;
     int rc;
 
+    qemu_balloon_inhibit(true);
     if (!pv_mig_blocker) {
         error_setg(&pv_mig_blocker,
                    "protected VMs are currently not migrateable.");
-- 
2.20.1


