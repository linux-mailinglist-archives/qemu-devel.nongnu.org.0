Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB98B4597C1
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 23:35:27 +0100 (CET)
Received: from localhost ([::1]:47648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpHuI-0007Rh-HA
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 17:35:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walling@linux.ibm.com>)
 id 1mpHsW-0006iA-AG; Mon, 22 Nov 2021 17:33:36 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walling@linux.ibm.com>)
 id 1mpHsU-0004KO-4X; Mon, 22 Nov 2021 17:33:36 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AMMNMAC028486; 
 Mon, 22 Nov 2021 22:33:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=DMg5hW12Jymwq7ieESIl8yJIwWMrXPvTlSgqWa3dJBk=;
 b=mdU5oy3XkTUe/jHUKrVHnhOFzCRiQ2/Ce8mfUqiRoylxbYQxHZ6CCikp/OD+FGjaI0St
 UUOKHZ9AAo2w69+luMjYhZNLrLo2/N9ZIsWqKyTqRADuGqb/MudsreUxTiCmptZk6/dY
 6bA/IsBndYA5+oqyMJ2Z74Rmkd/WGzO42sMCZ6Qk3QWfk5yQwGoFp+2bWx/b9C406Fhv
 fAx6/Ayok67jgthN5qr/XpCL4BfQ9LVNLL0lGM/8Y8qYe3or/XmMsxOqYt38/MHnhy26
 6htP78m9bu0aZ6icEMG9RnUpZKvMOEFtU4DYilJw/BXUwMr0NdIWbBXCsVVysvme1KF0 JQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cgkxt842r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Nov 2021 22:33:30 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AMMNL22028454;
 Mon, 22 Nov 2021 22:33:30 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cgkxt842m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Nov 2021 22:33:30 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AMMWvK3013241;
 Mon, 22 Nov 2021 22:33:28 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma05wdc.us.ibm.com with ESMTP id 3cerna83aa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Nov 2021 22:33:28 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AMMXRA041615620
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Nov 2021 22:33:27 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 100A9BE089;
 Mon, 22 Nov 2021 22:33:27 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C339BE084;
 Mon, 22 Nov 2021 22:33:26 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.65.86.146])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 22 Nov 2021 22:33:25 +0000 (GMT)
From: Collin Walling <walling@linux.ibm.com>
To: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Subject: [RFC PATCH] s390: kvm: reduce frequency of CPU syncs of diag318 info
Date: Mon, 22 Nov 2021 17:33:07 -0500
Message-Id: <20211122223307.101790-1-walling@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Vh_1R-MdRbEZ1zy8psPnMa9XHkdbN1ov
X-Proofpoint-ORIG-GUID: scBUPGRP6gsOrNA-3imaJ-f07OPwZq6x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-22_08,2021-11-22_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111220112
Received-SPF: pass client-ip=148.163.156.1; envelope-from=walling@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: borntraeger@de.ibm.com, thuth@redhat.com, cohuck@redhat.com,
 frankja@linux.ibm.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DIAGNOSE 0318 is invoked only once during IPL. As such, the
diag318 info will only change once initially and during resets.
Let's only sync the register to convey the info to KVM if and
only if the diag318 info has changed. Only set the dirty bit
flag for diag318 whenever it must be updated.

The migration handler will invoke the set_diag318 helper on
post_load to ensure the info is set on the destination machine.

Signed-off-by: Collin Walling <walling@linux.ibm.com>
---
 target/s390x/kvm/kvm.c |  5 -----
 target/s390x/machine.c | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 6acf14d5ec..6a141399f7 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -599,11 +599,6 @@ int kvm_arch_put_registers(CPUState *cs, int level)
         cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_ETOKEN;
     }
 
-    if (can_sync_regs(cs, KVM_SYNC_DIAG318)) {
-        cs->kvm_run->s.regs.diag318 = env->diag318_info;
-        cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_DIAG318;
-    }
-
     /* Finally the prefix */
     if (can_sync_regs(cs, KVM_SYNC_PREFIX)) {
         cs->kvm_run->s.regs.prefix = env->psa;
diff --git a/target/s390x/machine.c b/target/s390x/machine.c
index 37a076858c..a5d113ce3a 100644
--- a/target/s390x/machine.c
+++ b/target/s390x/machine.c
@@ -234,6 +234,19 @@ const VMStateDescription vmstate_etoken = {
     }
 };
 
+static int diag318_post_load(void *opaque, int version_id)
+{
+    S390CPU *cpu = opaque;
+    CPUState *cs = CPU(cpu);
+    CPUS390XState *env = &S390_CPU(cs)->env;
+
+    if (kvm_enabled()) {
+        kvm_s390_set_diag318(cs, env->diag318_info);
+    }
+
+    return 0;
+}
+
 static bool diag318_needed(void *opaque)
 {
     return s390_has_feat(S390_FEAT_DIAG_318);
@@ -243,6 +256,7 @@ const VMStateDescription vmstate_diag318 = {
     .name = "cpu/diag318",
     .version_id = 1,
     .minimum_version_id = 1,
+    .post_load = diag318_post_load,
     .needed = diag318_needed,
     .fields = (VMStateField[]) {
         VMSTATE_UINT64(env.diag318_info, S390CPU),
-- 
2.31.1


