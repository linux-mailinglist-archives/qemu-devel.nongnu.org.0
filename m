Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A10E5103923
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Nov 2019 12:52:17 +0100 (CET)
Received: from localhost ([::1]:56860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXOWu-0001Wj-5N
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 06:52:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43528)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1iXOP5-0003Nh-2d
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 06:44:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1iXOP3-0003dP-Ol
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 06:44:10 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60904
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1iXOP3-0003ch-K6
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 06:44:09 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAKBg4gD174067
 for <qemu-devel@nongnu.org>; Wed, 20 Nov 2019 06:44:09 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wcf35wddy-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 20 Nov 2019 06:44:08 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Wed, 20 Nov 2019 11:44:06 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 20 Nov 2019 11:44:04 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id xAKBhPZ328115304
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Nov 2019 11:43:25 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A3924C046;
 Wed, 20 Nov 2019 11:44:03 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3EE94C040;
 Wed, 20 Nov 2019 11:44:01 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.152.224.205])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 20 Nov 2019 11:44:01 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/15] s390x: protvirt: Set guest IPL PSW
Date: Wed, 20 Nov 2019 06:43:31 -0500
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191120114334.2287-1-frankja@linux.ibm.com>
References: <20191120114334.2287-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19112011-4275-0000-0000-00000383E083
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19112011-4276-0000-0000-000038975983
Message-Id: <20191120114334.2287-13-frankja@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-20_03:2019-11-15,2019-11-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 suspectscore=1 mlxlogscore=999 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911200107
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
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
Cc: thuth@redhat.com, pmorel@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, mihajlov@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Handling of CPU reset and setting of the IPL psw from guest storage at
offset 0 is done by a Ultravisor call. Let's only fetch it if
necessary.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 hw/s390x/pv.c              | 5 +++++
 hw/s390x/pv.h              | 1 +
 hw/s390x/s390-virtio-ccw.c | 3 ++-
 linux-headers/linux/kvm.h  | 1 +
 target/s390x/cpu.c         | 9 ++++++++-
 5 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
index 0218070322..106252833f 100644
--- a/hw/s390x/pv.c
+++ b/hw/s390x/pv.c
@@ -88,6 +88,11 @@ int s390_pv_set_sec_parms(uint64_t origin, uint64_t length)
     return s390_pv_cmd(KVM_PV_VM_SET_SEC_PARMS, &args);
 }
 
+int s390_pv_set_ipl_psw(CPUState *cs)
+{
+    return s390_pv_cmd_vcpu(cs, KVM_PV_VCPU_SET_IPL_PSW, NULL);
+}
+
 /*
  * Called for each component in the SE type IPL parameter block 0.
  */
diff --git a/hw/s390x/pv.h b/hw/s390x/pv.h
index eb074e4bc9..e670c67270 100644
--- a/hw/s390x/pv.h
+++ b/hw/s390x/pv.h
@@ -18,6 +18,7 @@ int s390_pv_vm_destroy(void);
 int s390_pv_vcpu_destroy(CPUState *cs);
 int s390_pv_vcpu_create(CPUState *cs);
 int s390_pv_set_sec_parms(uint64_t origin, uint64_t length);
+int s390_pv_set_ipl_psw(CPUState *cs);
 int s390_pv_unpack(uint64_t addr, uint64_t size, uint64_t tweak);
 int s390_pv_perf_clear_reset(void);
 int s390_pv_verify(void);
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 6fd50b4c42..e020b92854 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -404,7 +404,8 @@ static void s390_machine_reset(MachineState *machine)
         s390_ipl_pv_unpack();
         /* Verify integrity */
         s390_pv_verify();
-        s390_cpu_set_state(S390_CPU_STATE_OPERATING, cpu);
+        env->pv = true;
+        run_on_cpu(cs, s390_do_cpu_load_normal, RUN_ON_CPU_NULL);
         break;
     default:
         g_assert_not_reached();
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index d031051601..b5c7552016 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -1476,6 +1476,7 @@ enum pv_cmd_id {
 	KVM_PV_VM_UNSHARE,
 	KVM_PV_VCPU_CREATE,
 	KVM_PV_VCPU_DESTROY,
+	KVM_PV_VCPU_SET_IPL_PSW,
 };
 
 struct kvm_pv_cmd {
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index ac04fdbba9..c004987a87 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -37,6 +37,7 @@
 #include "sysemu/hw_accel.h"
 #include "hw/qdev-properties.h"
 #ifndef CONFIG_USER_ONLY
+#include "hw/s390x/pv.h"
 #include "hw/boards.h"
 #include "sysemu/arch_init.h"
 #include "sysemu/sysemu.h"
@@ -76,7 +77,13 @@ static bool s390_cpu_has_work(CPUState *cs)
 static void s390_cpu_load_normal(CPUState *s)
 {
     S390CPU *cpu = S390_CPU(s);
-    cpu->env.psw.addr = ldl_phys(s->as, 4) & PSW_MASK_ESA_ADDR;
+    CPUS390XState *env = &cpu->env;
+
+    if (!env->pv) {
+        cpu->env.psw.addr = ldl_phys(s->as, 4) & PSW_MASK_ESA_ADDR;
+    } else {
+        s390_pv_set_ipl_psw(s);
+    }
     cpu->env.psw.mask = PSW_MASK_32 | PSW_MASK_64;
     s390_cpu_set_state(S390_CPU_STATE_OPERATING, cpu);
 }
-- 
2.20.1


