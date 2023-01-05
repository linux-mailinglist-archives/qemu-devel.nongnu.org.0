Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAF265F07C
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 16:51:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDSW4-0006bK-6i; Thu, 05 Jan 2023 10:50:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1pDSVq-0006a1-7G
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 10:50:40 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1pDSVo-0004my-Dm
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 10:50:37 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 305EKioT009815
 for <qemu-devel@nongnu.org>; Thu, 5 Jan 2023 15:50:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=pNyWd1oUpCIloSgTblcBu657MJ1hZQm2i2tSRg5NTRM=;
 b=O3FrkHSpsqkWUW6owMUSxrhj59kmXz4HxstP2s8eNIuDvAIUc84XiK2qbMSovSGoHYOG
 YqVTYf/hLfNLB5ZTxOS+MvfFOhbNtxQCjVxVBF+bhwusFeoNoFKjRFQRN8bROQvvKd8B
 9tD3ayrKThnyYL/Pr5U/KAMeQOjXNTCy4xNNZbH3C1VHFBw6OHGVQdCe0EHCU97qPNL2
 1qfVnHuwWYl7qR9hj9h21yfreOnMx0KWWJc6bfBR9IWkzgBwJBMpNT6EzV+W9Yvapgo/
 KQBjXTU3BK7JKiZHgpROy2/ij2/7rOTINOx1gg8r1EiH8m2xoL1Gu/BOEOW3Q9HMKIUl Vw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mx07wtbjg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 15:50:34 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 305FNYpm012848
 for <qemu-devel@nongnu.org>; Thu, 5 Jan 2023 15:50:34 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mx07wtbhv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 15:50:34 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3051Rc0M000986;
 Thu, 5 Jan 2023 15:50:32 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3mtcq6n3qd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 15:50:31 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 305FoMvu44171718
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Jan 2023 15:50:22 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 47C0A2005A;
 Thu,  5 Jan 2023 15:50:22 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CDCCB2004D;
 Thu,  5 Jan 2023 15:50:21 +0000 (GMT)
Received: from p-imbrenda.ibmuc.com (unknown [9.171.26.82])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  5 Jan 2023 15:50:21 +0000 (GMT)
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: david@redhat.com, thuth@redhat.com, borntraeger@de.ibm.com,
 frankja@linux.ibm.com, pasic@linux.ibm.com, nrb@linux.ibm.com,
 nsg@linux.ibm.com, seiden@linux.ibm.com
Subject: [PATCH v2 2/2] s390x/pv: Add support for asynchronous teardown for
 reboot
Date: Thu,  5 Jan 2023 16:50:19 +0100
Message-Id: <20230105155019.72200-3-imbrenda@linux.ibm.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105155019.72200-1-imbrenda@linux.ibm.com>
References: <20230105155019.72200-1-imbrenda@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NeKxr_w7B4zWy7MQMJpxhs7uuWP_nxWP
X-Proofpoint-ORIG-GUID: WaPMGR5-Ez1YrN2mMmSuInFiVt5f9KKn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_06,2023-01-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=807 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301050122
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=imbrenda@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patch adds support for the asynchronous teardown for reboot for
protected VMs.

When attempting to tear down a protected VM, try to use the new
asynchronous interface first. If that fails, fall back to the classic
synchronous one.

The asynchronous interface involves invoking the new
KVM_PV_ASYNC_DISABLE_PREPARE command for the KVM_S390_PV_COMMAND ioctl.

This will prepare the current protected VM for asynchronous teardown.
Once the protected VM is prepared for teardown, execution can continue
immediately.

Once the protected VM has been prepared, a new thread is started to
actually perform the teardown. The new thread uses the new
KVM_PV_ASYNC_DISABLE command for the KVM_S390_PV_COMMAND ioctl. The
previously prepared protected VM is torn down in the new thread.

Once KVM_PV_ASYNC_DISABLE is invoked, it is possible to use
KVM_PV_ASYNC_DISABLE_PREPARE again. If a protected VM has already been
prepared and its cleanup has not started, it will not be possible to
prepare a new VM. In that case the classic synchronous teardown has to
be performed.

The synchronous teardown will now also clean up any prepared VMs whose
asynchronous teardown has not been initiated yet.

This considerably speeds up the reboot of a protected VM; for large VMs
especially, it could take a long time to perform a reboot with the
traditional synchronous teardown, while with this patch it is almost
immediate.

Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
---
 hw/s390x/pv.c              | 25 +++++++++++++++++++++++++
 hw/s390x/s390-virtio-ccw.c |  5 ++++-
 include/hw/s390x/pv.h      |  2 ++
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
index 8dfe92d8df..3d1c529eb5 100644
--- a/hw/s390x/pv.c
+++ b/hw/s390x/pv.c
@@ -16,6 +16,7 @@
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "sysemu/kvm.h"
+#include "sysemu/cpus.h"
 #include "qom/object_interfaces.h"
 #include "exec/confidential-guest-support.h"
 #include "hw/s390x/ipl.h"
@@ -107,6 +108,30 @@ void s390_pv_vm_disable(void)
      s390_pv_cmd_exit(KVM_PV_DISABLE, NULL);
 }
 
+static void *s390_pv_do_unprot_async_fn(void *p)
+{
+     s390_pv_cmd_exit(KVM_PV_ASYNC_CLEANUP_PERFORM, NULL);
+     return NULL;
+}
+
+bool s390_pv_vm_try_disable_async(void)
+{
+    QemuThread *t;
+
+    if (!kvm_check_extension(kvm_state, KVM_CAP_S390_PROTECTED_ASYNC_DISABLE)) {
+        return false;
+    }
+    if (s390_pv_cmd(KVM_PV_ASYNC_CLEANUP_PREPARE, NULL) != 0) {
+        return false;
+    }
+
+    t = g_malloc0(sizeof(QemuThread));
+    qemu_thread_create(t, "async_cleanup", s390_pv_do_unprot_async_fn, NULL,
+                       QEMU_THREAD_DETACHED);
+
+    return true;
+}
+
 int s390_pv_set_sec_parms(uint64_t origin, uint64_t length)
 {
     struct kvm_s390_pv_sec_parm args = {
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index f22f61b8b6..503f212a31 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -41,6 +41,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/s390x/tod.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/cpus.h"
 #include "hw/s390x/pv.h"
 #include "migration/blocker.h"
 #include "qapi/visitor.h"
@@ -329,7 +330,9 @@ static inline void s390_do_cpu_ipl(CPUState *cs, run_on_cpu_data arg)
 
 static void s390_machine_unprotect(S390CcwMachineState *ms)
 {
-    s390_pv_vm_disable();
+    if (!s390_pv_vm_try_disable_async()) {
+        s390_pv_vm_disable();
+    }
     ms->pv = false;
     migrate_del_blocker(pv_mig_blocker);
     error_free_or_abort(&pv_mig_blocker);
diff --git a/include/hw/s390x/pv.h b/include/hw/s390x/pv.h
index 9360aa1091..966306a9db 100644
--- a/include/hw/s390x/pv.h
+++ b/include/hw/s390x/pv.h
@@ -41,6 +41,7 @@ static inline bool s390_is_pv(void)
 int s390_pv_query_info(void);
 int s390_pv_vm_enable(void);
 void s390_pv_vm_disable(void);
+bool s390_pv_vm_try_disable_async(void);
 int s390_pv_set_sec_parms(uint64_t origin, uint64_t length);
 int s390_pv_unpack(uint64_t addr, uint64_t size, uint64_t tweak);
 void s390_pv_prep_reset(void);
@@ -60,6 +61,7 @@ static inline bool s390_is_pv(void) { return false; }
 static inline int s390_pv_query_info(void) { return 0; }
 static inline int s390_pv_vm_enable(void) { return 0; }
 static inline void s390_pv_vm_disable(void) {}
+static inline bool s390_pv_vm_try_disable_async(void) { return false; }
 static inline int s390_pv_set_sec_parms(uint64_t origin, uint64_t length) { return 0; }
 static inline int s390_pv_unpack(uint64_t addr, uint64_t size, uint64_t tweak) { return 0; }
 static inline void s390_pv_prep_reset(void) {}
-- 
2.39.0


