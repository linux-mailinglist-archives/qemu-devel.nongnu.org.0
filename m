Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C67017DEA9
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Mar 2020 12:25:26 +0100 (CET)
Received: from localhost ([::1]:41054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBGXF-0005GC-K1
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 07:25:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47860)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1jBGUP-0008VR-Rd
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 07:22:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1jBGUO-0004bD-Nf
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 07:22:29 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:34150)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1jBGUO-0004aP-Ez
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 07:22:28 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 029BKh8Q193551
 for <qemu-devel@nongnu.org>; Mon, 9 Mar 2020 07:22:27 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ym850hwqr-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 09 Mar 2020 07:22:27 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Mon, 9 Mar 2020 11:22:22 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 9 Mar 2020 11:22:19 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 029BMIeK16253108
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Mar 2020 11:22:18 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C2614C050;
 Mon,  9 Mar 2020 11:22:18 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6A1F4C046;
 Mon,  9 Mar 2020 11:22:17 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.152.224.87])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  9 Mar 2020 11:22:17 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 03/15] s390x: protvirt: Add migration blocker
Date: Mon,  9 Mar 2020 07:21:54 -0400
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200309112206.20261-1-frankja@linux.ibm.com>
References: <20200309112206.20261-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20030911-0012-0000-0000-0000038E8E75
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030911-0013-0000-0000-000021CB560C
Message-Id: <20200309112206.20261-4-frankja@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-09_02:2020-03-08,
 2020-03-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 suspectscore=3 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003090080
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

Migration is not yet supported.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 hw/s390x/s390-virtio-ccw.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index f718cfc591..4bb38704ff 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -43,6 +43,9 @@
 #include "sysemu/sysemu.h"
 #include "hw/s390x/pv.h"
 #include <linux/kvm.h>
+#include "migration/blocker.h"
+
+static Error *pv_mig_blocker;
 
 S390CPU *s390_cpu_addr2state(uint16_t cpu_addr)
 {
@@ -331,16 +334,33 @@ static void s390_machine_unprotect(S390CcwMachineState *ms)
         }
         ms->pv = false;
     }
+    migrate_del_blocker(pv_mig_blocker);
+    error_free(pv_mig_blocker);
+    pv_mig_blocker = NULL;
 }
 
 static int s390_machine_protect(S390CcwMachineState *ms)
 {
+    static Error *local_err;
     CPUState *t;
     int rc;
 
+    error_setg(&pv_mig_blocker,
+               "protected VMs are currently not migrateable.");
+    rc = migrate_add_blocker(pv_mig_blocker, &local_err);
+    if (local_err) {
+        error_report_err(local_err);
+        error_free(pv_mig_blocker);
+        pv_mig_blocker = NULL;
+        return rc;
+    }
+
     /* Create SE VM */
     rc = s390_pv_vm_enable();
     if (rc) {
+        error_report_err(local_err);
+        error_free(pv_mig_blocker);
+        pv_mig_blocker = NULL;
         return rc;
     }
 
@@ -470,11 +490,13 @@ static void s390_machine_reset(MachineState *machine)
 
         if (s390_machine_protect(ms)) {
             s390_machine_inject_pv_error(cs);
-            s390_cpu_set_state(S390_CPU_STATE_OPERATING, cpu);
-            return;
+            goto pv_err;
         }
 
         run_on_cpu(cs, s390_do_cpu_load_normal, RUN_ON_CPU_NULL);
+pv_err:
+        /* Continue after the diag308 so the guest knows something went wrong. */
+        s390_cpu_set_state(S390_CPU_STATE_OPERATING, cpu);
         break;
     default:
         g_assert_not_reached();
-- 
2.20.1


