Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D52006FDC05
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 12:56:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwhU5-0003Bo-0o; Wed, 10 May 2023 06:55:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1pwhU1-00039N-9R; Wed, 10 May 2023 06:55:45 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1pwhTz-0004mn-Ab; Wed, 10 May 2023 06:55:45 -0400
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34AAhuRc025798; Wed, 10 May 2023 10:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=bCrsr2mtykTlqoOVuD1INjPU7Y5hkKRSQKQM6JHLK74=;
 b=U1FcXGu6gp3dIQ1AAwQkYC7pV/+0PSjiq4wfKTgE7E30BDKjjEk/5MWRPAWd8zebKDSl
 Yq7Y+83x13f0sSAlogYBS7QMblPiv9Ai6q9BdwS1+fAgHGsV0C0ELrYOt4aqr/NeBLB1
 5RFa81N5mTdw1a/1INSQh/yMItVoOPtr3kGLuJjGAhyJHbBG2k2pHkGpRpy6xV4gpPcS
 NKL4XAC93CkKmCPotCZg++L9EW7aAvoBrV4FTavlDfoaIOPG63NvwQHvd4a4IbdP593U
 x8OW2PKGzyxJtSVTsRItUxH1Zs1azBnenZZpXlyV4HwZ/AsJ9IF6Oi/NGGPUfvZohNKN eg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qg95qs7by-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 10:55:38 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34AAsWF3001588;
 Wed, 10 May 2023 10:55:37 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qg95qs7bc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 10:55:37 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34A0WOeS022152;
 Wed, 10 May 2023 10:55:35 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3qf84e90vp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 10:55:35 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 34AAtWqU1507896
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 May 2023 10:55:32 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3FC8620040;
 Wed, 10 May 2023 10:55:32 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A27D2004E;
 Wed, 10 May 2023 10:55:32 +0000 (GMT)
Received: from p-imbrenda.boeblingen.de.ibm.com (unknown [9.152.224.56])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 10 May 2023 10:55:31 +0000 (GMT)
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, borntraeger@de.ibm.com, nsg@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com, pasic@linux.ibm.com,
 mhartmay@linux.ibm.com, thuth@redhat.com
Subject: [PATCH v2 1/1] s390x/pv: Fix spurious warning with asynchronous
 teardown
Date: Wed, 10 May 2023 12:55:31 +0200
Message-Id: <20230510105531.30623-2-imbrenda@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230510105531.30623-1-imbrenda@linux.ibm.com>
References: <20230510105531.30623-1-imbrenda@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8VGD7oY-tndvNh0Um-vcAmvLZOOVFO6p
X-Proofpoint-ORIG-GUID: 4FO6tBXv-nfhCd9aySDsMGq-FZVcHrKC
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305100083
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=imbrenda@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Kernel commit 292a7d6fca33 ("KVM: s390: pv: fix asynchronous teardown
for small VMs") causes the KVM_PV_ASYNC_CLEANUP_PREPARE ioctl to fail
if the VM is not larger than 2GiB. QEMU would attempt it and fail,
print an error message, and then proceed with a normal teardown.

Avoid attempting to use asynchronous teardown altogether when the VM is
not larger than 2 GiB. This will avoid triggering the error message and
also avoid pointless overhead; normal teardown is fast enough for small
VMs.

Reported-by: Marc Hartmayer <mhartmay@linux.ibm.com>
Fixes: c3a073c610 ("s390x/pv: Add support for asynchronous teardown for reboot")
Link: https://lore.kernel.org/all/20230421085036.52511-2-imbrenda@linux.ibm.com/
Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
---
 hw/s390x/pv.c              | 10 ++++++++--
 hw/s390x/s390-virtio-ccw.c |  2 +-
 include/hw/s390x/pv.h      |  2 +-
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
index 49ea38236c..b63f3784c6 100644
--- a/hw/s390x/pv.c
+++ b/hw/s390x/pv.c
@@ -13,6 +13,7 @@
 
 #include <linux/kvm.h>
 
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "sysemu/kvm.h"
@@ -115,7 +116,7 @@ static void *s390_pv_do_unprot_async_fn(void *p)
      return NULL;
 }
 
-bool s390_pv_vm_try_disable_async(void)
+bool s390_pv_vm_try_disable_async(S390CcwMachineState *ms)
 {
     /*
      * t is only needed to create the thread; once qemu_thread_create
@@ -123,7 +124,12 @@ bool s390_pv_vm_try_disable_async(void)
      */
     QemuThread t;
 
-    if (!kvm_check_extension(kvm_state, KVM_CAP_S390_PROTECTED_ASYNC_DISABLE)) {
+    /*
+     * If the feature is not present or if the VM is not larger than 2 GiB,
+     * KVM_PV_ASYNC_CLEANUP_PREPARE fill fail; no point in attempting it.
+     */
+    if ((MACHINE(ms)->maxram_size <= 2 * GiB) ||
+        !kvm_check_extension(kvm_state, KVM_CAP_S390_PROTECTED_ASYNC_DISABLE)) {
         return false;
     }
     if (s390_pv_cmd(KVM_PV_ASYNC_CLEANUP_PREPARE, NULL) != 0) {
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index e6f2c62625..2516b89b32 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -330,7 +330,7 @@ static inline void s390_do_cpu_ipl(CPUState *cs, run_on_cpu_data arg)
 
 static void s390_machine_unprotect(S390CcwMachineState *ms)
 {
-    if (!s390_pv_vm_try_disable_async()) {
+    if (!s390_pv_vm_try_disable_async(ms)) {
         s390_pv_vm_disable();
     }
     ms->pv = false;
diff --git a/include/hw/s390x/pv.h b/include/hw/s390x/pv.h
index 966306a9db..6766557fb7 100644
--- a/include/hw/s390x/pv.h
+++ b/include/hw/s390x/pv.h
@@ -41,7 +41,7 @@ static inline bool s390_is_pv(void)
 int s390_pv_query_info(void);
 int s390_pv_vm_enable(void);
 void s390_pv_vm_disable(void);
-bool s390_pv_vm_try_disable_async(void);
+bool s390_pv_vm_try_disable_async(S390CcwMachineState *ms);
 int s390_pv_set_sec_parms(uint64_t origin, uint64_t length);
 int s390_pv_unpack(uint64_t addr, uint64_t size, uint64_t tweak);
 void s390_pv_prep_reset(void);
-- 
2.40.1


