Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 486656543F8
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 16:10:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8NC6-0001BH-IW; Thu, 22 Dec 2022 10:09:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1p8NC2-0001B3-Go
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 10:09:10 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1p8NC0-00060z-OI
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 10:09:10 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BMF87SX008856
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 15:08:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=7tJKfepfeNnSXAB/P6wlxKARBESa2ZpZ44HoknPB7Fg=;
 b=p2s5hN0f1CEMIWf+gRIlJ50YLmMysrcg4lcaYB0XJ7DHrzmyjhwXSiJG7BSDwVgDT03u
 CN6ECqkBiql0Eeqe02F1ZtLtJAmi1OQw1dICsZH0kp5d8pnpVazJg919TK6WtiUFincV
 SyZk18A/+LIurwUxwjfSL97DYBW1LA4vO1RSu5Dr0nFZ+GnQSzCbup6l5wcwpbp3of9Z
 VBzoNfpGn8RJqU+ErPcrMhWJsGdKJg+4R87Pp9smmBWLhW1QaSTCtjXmvtmBQn1+kSz+
 RRc5+nHpjWGqaHOHZ/fshulNGeC66kVyYhRZeqwVJ8SsRN8gOL2PpQhpalyiCXk4d5sr HQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mms5p8mbj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 15:08:43 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BMF8QXg011691
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 15:08:26 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mms5p8jp2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Dec 2022 15:08:23 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BMCcnu1013948;
 Thu, 22 Dec 2022 15:04:27 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3mh6yw77uy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Dec 2022 15:04:27 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BMF4Nd246203176
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Dec 2022 15:04:23 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7717020043;
 Thu, 22 Dec 2022 15:04:23 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 02F6020049;
 Thu, 22 Dec 2022 15:04:23 +0000 (GMT)
Received: from p-imbrenda.ibmuc.com (unknown [9.171.22.213])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 22 Dec 2022 15:04:22 +0000 (GMT)
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: david@redhat.com, thuth@redhat.com, borntraeger@de.ibm.com,
 frankja@linux.ibm.com, pasic@linux.ibm.com, nrb@linux.ibm.com,
 nsg@linux.ibm.com, seiden@linux.ibm.com
Subject: [PATCH v1 2/2] s390x/pv: Add support for asynchronous teardown for
 reboot
Date: Thu, 22 Dec 2022 16:04:21 +0100
Message-Id: <20221222150421.35839-3-imbrenda@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221222150421.35839-1-imbrenda@linux.ibm.com>
References: <20221222150421.35839-1-imbrenda@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xmezCNKdWboG05tF3fFIVTzFlYNKdlZd
X-Proofpoint-ORIG-GUID: YYBkVq5M0hgEBehccNcvlViThd-enP2q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-22_08,2022-12-22_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 priorityscore=1501 adultscore=0 mlxlogscore=812 mlxscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212220131
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
index 8dfe92d8df..0b8345092b 100644
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
@@ -107,6 +108,33 @@ void s390_pv_vm_disable(void)
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
+    char tname[VCPU_THREAD_NAME_SIZE];
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
+    snprintf(tname, VCPU_THREAD_NAME_SIZE, "async_unpr/KVM");
+
+    qemu_thread_create(t, tname, s390_pv_do_unprot_async_fn, NULL,
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
2.38.1


