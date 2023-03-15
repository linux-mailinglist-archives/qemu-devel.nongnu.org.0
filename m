Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 478236BB632
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 15:36:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcSDv-0004MX-J9; Wed, 15 Mar 2023 10:35:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pcSDs-0004L8-Pm; Wed, 15 Mar 2023 10:35:24 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pcSDq-0007Vs-KC; Wed, 15 Mar 2023 10:35:24 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32FDtUGe023159; Wed, 15 Mar 2023 14:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=nh4UkelZCZgKn56/i8Mm3XOFEFRLGgInyMowtH3ITEU=;
 b=dDBs2U4pWWKfWNKsYl4xRgnnAZyJZFAhhI33dXtNjfOf937RRv/tddbinLRcVOHbBKZR
 wzC/S6mzPO/kBkjq7jbpgFzxh7s4Wmb2NK2RR+h/O9H1jb3T/rIcgrQOk0Q7BoeBAvsM
 gsFomdr/7tWIrpYcN2xB5K5z1Oj2Y0poxmmyhVuBj5JauXDC5DVUI96pUgXSjrDVQ69b
 M141W98L7nm6LU3khHm+i4/omxXBI11Zq3amTYYU5ftmvSQPamlwWRrDQmoBtBNybtJq
 EdIyiQgFJ+oefO6lq7vlWdNl0PiyZIbXy4SOgBq2lrXVk3DSoU7hJAIk+WWkw/pjYTKv zA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pbfavh7e2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 14:35:19 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32FDuhUo030910;
 Wed, 15 Mar 2023 14:35:19 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pbfavh7d1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 14:35:19 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32EN7YDN003737;
 Wed, 15 Mar 2023 14:35:16 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3pb29t0r2r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 14:35:16 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32FEZD2B43712994
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Mar 2023 14:35:13 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C7FF20040;
 Wed, 15 Mar 2023 14:35:13 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D76E62004E;
 Wed, 15 Mar 2023 14:35:11 +0000 (GMT)
Received: from li-c6ac47cc-293c-11b2-a85c-d421c8e4747b.ibm.com.com (unknown
 [9.171.95.209]) by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 15 Mar 2023 14:35:11 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, nsg@linux.ibm.com, frankja@linux.ibm.com,
 berrange@redhat.com, clg@kaod.org
Subject: [PATCH v18 05/17] s390x/cpu topology: resetting the
 Topology-Change-Report
Date: Wed, 15 Mar 2023 15:34:50 +0100
Message-Id: <20230315143502.135750-6-pmorel@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230315143502.135750-1-pmorel@linux.ibm.com>
References: <20230315143502.135750-1-pmorel@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pPPruMTw1psU2S0G2hmGAs85Eo84TKPN
X-Proofpoint-ORIG-GUID: AFDJkWKPQA9pzdHd63Ce5vhzwLlzjqQK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-15_07,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2302240000
 definitions=main-2303150118
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

During a subsystem reset the Topology-Change-Report is cleared
by the machine.
Let's ask KVM to clear the Modified Topology Change Report (MTCR)
bit of the SCA in the case of a subsystem reset.

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/s390x/cpu-topology.h |  1 +
 target/s390x/cpu.h              |  1 +
 target/s390x/kvm/kvm_s390x.h    |  1 +
 hw/s390x/cpu-topology.c         | 11 +++++++++++
 hw/s390x/s390-virtio-ccw.c      |  3 +++
 target/s390x/cpu-sysemu.c       | 13 +++++++++++++
 target/s390x/kvm/kvm.c          | 17 +++++++++++++++++
 7 files changed, 47 insertions(+)

diff --git a/include/hw/s390x/cpu-topology.h b/include/hw/s390x/cpu-topology.h
index 7a1dd6b136..fa42236dfa 100644
--- a/include/hw/s390x/cpu-topology.h
+++ b/include/hw/s390x/cpu-topology.h
@@ -60,6 +60,7 @@ static inline void s390_topology_setup_cpu(MachineState *ms,
 
 extern S390Topology s390_topology;
 int s390_socket_nb(S390CPU *cpu);
+void s390_topology_reset(void);
 
 static inline int s390_std_socket(int n, CpuTopology *smp)
 {
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 61210303e4..9842c36c80 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -642,6 +642,7 @@ typedef struct SysIBTl_cpu {
 QEMU_BUILD_BUG_ON(sizeof(SysIBTl_cpu) != 16);
 
 void insert_stsi_15_1_x(S390CPU *cpu, int sel2, uint64_t addr, uint8_t ar);
+void s390_cpu_topology_set_changed(bool changed);
 
 /* MMU defines */
 #define ASCE_ORIGIN           (~0xfffULL) /* segment table origin             */
diff --git a/target/s390x/kvm/kvm_s390x.h b/target/s390x/kvm/kvm_s390x.h
index f9785564d0..649dae5948 100644
--- a/target/s390x/kvm/kvm_s390x.h
+++ b/target/s390x/kvm/kvm_s390x.h
@@ -47,5 +47,6 @@ void kvm_s390_crypto_reset(void);
 void kvm_s390_restart_interrupt(S390CPU *cpu);
 void kvm_s390_stop_interrupt(S390CPU *cpu);
 void kvm_s390_set_diag318(CPUState *cs, uint64_t diag318_info);
+int kvm_s390_topology_set_mtcr(uint64_t attr);
 
 #endif /* KVM_S390X_H */
diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
index 36c8c687b8..45462b01fe 100644
--- a/hw/s390x/cpu-topology.c
+++ b/hw/s390x/cpu-topology.c
@@ -87,6 +87,17 @@ static void s390_topology_init(MachineState *ms)
     QTAILQ_INSERT_HEAD(&s390_topology.list, entry, next);
 }
 
+/**
+ * s390_topology_reset:
+ *
+ * Generic reset for CPU topology, calls s390_topology_reset()
+ * to reset the kernel Modified Topology Change Record.
+ */
+void s390_topology_reset(void)
+{
+    s390_cpu_topology_set_changed(false);
+}
+
 /**
  * s390_topology_cpu_default:
  * @cpu: pointer to a S390CPU
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 9df60ac447..7e6d88e23c 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -123,6 +123,9 @@ static void subsystem_reset(void)
             device_cold_reset(dev);
         }
     }
+    if (s390_has_topology()) {
+        s390_topology_reset();
+    }
 }
 
 static int virtio_ccw_hcall_notify(const uint64_t *args)
diff --git a/target/s390x/cpu-sysemu.c b/target/s390x/cpu-sysemu.c
index 948e4bd3e0..9d41acfe1a 100644
--- a/target/s390x/cpu-sysemu.c
+++ b/target/s390x/cpu-sysemu.c
@@ -306,3 +306,16 @@ void s390_do_cpu_set_diag318(CPUState *cs, run_on_cpu_data arg)
         kvm_s390_set_diag318(cs, arg.host_ulong);
     }
 }
+
+void s390_cpu_topology_set_changed(bool changed)
+{
+    int ret;
+
+    if (kvm_enabled()) {
+        ret = kvm_s390_topology_set_mtcr(changed);
+        if (ret) {
+            error_report("Failed to set Modified Topology Change Report: %s",
+                         strerror(-ret));
+        }
+    }
+}
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 5ea358cbb0..bc953151ce 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -2592,6 +2592,23 @@ int kvm_s390_get_zpci_op(void)
     return cap_zpci_op;
 }
 
+int kvm_s390_topology_set_mtcr(uint64_t attr)
+{
+    struct kvm_device_attr attribute = {
+        .group = KVM_S390_VM_CPU_TOPOLOGY,
+        .attr  = attr,
+    };
+
+    if (!s390_has_feat(S390_FEAT_CONFIGURATION_TOPOLOGY)) {
+        return 0;
+    }
+    if (!kvm_vm_check_attr(kvm_state, KVM_S390_VM_CPU_TOPOLOGY, attr)) {
+        return -ENOTSUP;
+    }
+
+    return kvm_vm_ioctl(kvm_state, KVM_SET_DEVICE_ATTR, &attribute);
+}
+
 void kvm_arch_accel_class_init(ObjectClass *oc)
 {
 }
-- 
2.31.1


