Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC346969AC
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 17:33:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRyD0-0006Y0-KA; Tue, 14 Feb 2023 11:31:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1pRyCe-0006N6-C0; Tue, 14 Feb 2023 11:30:58 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1pRyCc-0001zy-D9; Tue, 14 Feb 2023 11:30:48 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31EFnZYH011046; Tue, 14 Feb 2023 16:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=8OaOik1jLAnmnMjWrB6meCZfUGv1uew8P6BEBbmOjaQ=;
 b=pfMYEPiy3HWICfsS1g8vwWlC9isjXijVTKEIeKYvjBOLFZyw1jpjHnu8gZ1kk9K7yM+H
 IlKT/AkhXnzXdz8t45FwDwmnVVKSTh2/1FPbmwNXI20kSeIxAQiwJTdz7+Bi00GJUdWB
 3OJSnYsDsuQY5CXXfHnFWxo7amGsGoLGxQQDudswzXO9Hq/07zWgYYgBpu3fRw1mLs6S
 1ANgGQEUckCoHZuSDgniOUOLyD8DA4K7ESoRGJ30IIV6HpyoWxPqJ68hx9+JM0/+UYx7
 ZUapnGIOP5/fw18iTeYRJNkIeB+Jgwv0VvY84zv7SXF0Cc7gApaWSJbN7elJfiOgtVX1 2Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nrd9j9893-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Feb 2023 16:30:42 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31EFpN6G016128;
 Tue, 14 Feb 2023 16:30:42 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nrd9j987t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Feb 2023 16:30:42 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31EFGum8027208;
 Tue, 14 Feb 2023 16:30:40 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3np2n6b52h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Feb 2023 16:30:40 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31EGUaDD40304980
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Feb 2023 16:30:36 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C81F720043;
 Tue, 14 Feb 2023 16:30:36 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8FF4620049;
 Tue, 14 Feb 2023 16:30:36 +0000 (GMT)
Received: from p-imbrenda.boeblingen.de.ibm.com (unknown [9.152.224.56])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 14 Feb 2023 16:30:36 +0000 (GMT)
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, david@redhat.com, thuth@redhat.com,
 borntraeger@de.ibm.com, frankja@linux.ibm.com, pasic@linux.ibm.com,
 nrb@linux.ibm.com, nsg@linux.ibm.com, seiden@linux.ibm.com
Subject: [PATCH v3 2/2] s390x/pv: Add support for asynchronous teardown for
 reboot
Date: Tue, 14 Feb 2023 17:30:35 +0100
Message-Id: <20230214163035.44104-3-imbrenda@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214163035.44104-1-imbrenda@linux.ibm.com>
References: <20230214163035.44104-1-imbrenda@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 411cSmBCKWbW_Iloh3VcjggZsoWdYraw
X-Proofpoint-GUID: euYmmgoX-83S7oBK43a9tShq1dP8KPQO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_11,2023-02-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302140137
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=imbrenda@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 hw/s390x/pv.c              | 28 ++++++++++++++++++++++++++++
 hw/s390x/s390-virtio-ccw.c |  5 ++++-
 include/hw/s390x/pv.h      |  2 ++
 3 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
index 8a1c71436b..49ea38236c 100644
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
@@ -108,6 +109,33 @@ void s390_pv_vm_disable(void)
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
+    /*
+     * t is only needed to create the thread; once qemu_thread_create
+     * returns, it can safely be discarded.
+     */
+    QemuThread t;
+
+    if (!kvm_check_extension(kvm_state, KVM_CAP_S390_PROTECTED_ASYNC_DISABLE)) {
+        return false;
+    }
+    if (s390_pv_cmd(KVM_PV_ASYNC_CLEANUP_PREPARE, NULL) != 0) {
+        return false;
+    }
+
+    qemu_thread_create(&t, "async_cleanup", s390_pv_do_unprot_async_fn, NULL,
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
2.39.1


