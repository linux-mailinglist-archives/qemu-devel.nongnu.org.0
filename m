Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 522D316FEDA
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 13:23:51 +0100 (CET)
Received: from localhost ([::1]:43482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6vjC-0007gq-Ab
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 07:23:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53364)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1j6vgS-0002Ok-7P
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 07:21:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1j6vgR-0007x2-5P
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 07:21:00 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:19226)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1j6vgQ-0007uG-Tw
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 07:20:59 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01QCJsDk181771
 for <qemu-devel@nongnu.org>; Wed, 26 Feb 2020 07:20:58 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ydh913te1-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 26 Feb 2020 07:20:57 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Wed, 26 Feb 2020 12:20:53 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 26 Feb 2020 12:20:50 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01QCKngj57016432
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Feb 2020 12:20:49 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9180611C058;
 Wed, 26 Feb 2020 12:20:49 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD54E11C04C;
 Wed, 26 Feb 2020 12:20:48 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.152.224.212])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 26 Feb 2020 12:20:48 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 05/18] s390x: protvirt: Add migration blocker
Date: Wed, 26 Feb 2020 07:20:25 -0500
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200226122038.61481-1-frankja@linux.ibm.com>
References: <20200226122038.61481-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20022612-0012-0000-0000-0000038A6FF0
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022612-0013-0000-0000-000021C715D4
Message-Id: <20200226122038.61481-6-frankja@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-26_04:2020-02-26,
 2020-02-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 mlxlogscore=944 adultscore=0 bulkscore=0 mlxscore=0 suspectscore=1
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002260092
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
 hw/s390x/s390-virtio-ccw.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index e506dd65ed..79f472c309 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -42,6 +42,9 @@
 #include "hw/s390x/tod.h"
 #include "sysemu/sysemu.h"
 #include "hw/s390x/pv.h"
+#include "migration/blocker.h"
+
+static Error *pv_mig_blocker;
 
 S390CPU *s390_cpu_addr2state(uint16_t cpu_addr)
 {
@@ -325,18 +328,30 @@ static void s390_machine_unprotect(S390CcwMachineState *ms)
 {
     CPUState *t;
 
-    s390_pv_vm_disable();
-    CPU_FOREACH(t) {
-        S390_CPU(t)->env.pv = false;
+    if (ms->pv) {
+        s390_pv_vm_disable();
+        CPU_FOREACH(t) {
+            S390_CPU(t)->env.pv = false;
+        }
+        ms->pv = false;
     }
-    ms->pv = false;
 }
 
 static int s390_machine_protect(S390CcwMachineState *ms)
 {
+    static Error *local_err;
     CPUState *t;
     int rc;
 
+    if (!pv_mig_blocker) {
+        error_setg(&pv_mig_blocker,
+                   "protected VMs are currently not migrateable.");
+    }
+    migrate_add_blocker(pv_mig_blocker, &local_err);
+    if (local_err) {
+        goto out_err;
+    }
+
     /* Create SE VM */
     rc = s390_pv_vm_enable();
     if (rc) {
@@ -438,11 +453,12 @@ static void s390_machine_reset(MachineState *machine)
 
         if (s390_machine_protect(ms)) {
             s390_machine_inject_pv_error(cs);
-            s390_cpu_set_state(S390_CPU_STATE_OPERATING, cpu);
-            return;
+            goto pv_err;
         }
 
         run_on_cpu(cs, s390_do_cpu_load_normal, RUN_ON_CPU_NULL);
+pv_err:
+        s390_cpu_set_state(S390_CPU_STATE_OPERATING, cpu);
         break;
     default:
         g_assert_not_reached();
-- 
2.20.1


