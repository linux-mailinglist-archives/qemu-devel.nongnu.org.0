Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CA16BB641
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 15:37:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcSE4-0004Rm-J3; Wed, 15 Mar 2023 10:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pcSE1-0004PA-S3; Wed, 15 Mar 2023 10:35:34 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pcSE0-0007ZX-39; Wed, 15 Mar 2023 10:35:33 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32FE9k1J032291; Wed, 15 Mar 2023 14:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=zjXhEv9Sg2xvVQInV2f91C7+gxt99fWJ58I2gvUYAUA=;
 b=hwfXNu3HH8KfTMvrCZRveNbO9W0QFDyof15AmI/LxA4iS9TGb4p08SPBKS/9Zb5VJfzc
 97BXa1hqb2pyKo7zcahXEMYSYTcIknXLKapoFLXbdMK0+xGMfxwdHgLbfBJTDz488j0c
 4dx4jUfOlq0Ae2ky1LyTMPB5MpajdPhlkI2SKmr24x5UCoitEUcdWnLlcABsbQVOx7mL
 PnoeGOCLQqmr0/FaXUFKSRIhm2ZP31M0NWqbmkH9jmWjtjf0R8xpoTOM/03Hqp3Y9XZ/
 M4JLFzwR4uJD+1fxaznpfYC3GK7FV/EIZfZJPt0xjdmEvqVItRMhXlVosATBOJbGqxjR WQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pbf4qsg56-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 14:35:21 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32FEZF1s018605;
 Wed, 15 Mar 2023 14:35:21 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pbf4qsg4a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 14:35:20 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32EN5tnL001285;
 Wed, 15 Mar 2023 14:35:18 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3pb29rrreq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 14:35:18 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32FEZElb27459848
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Mar 2023 14:35:14 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AFA4820043;
 Wed, 15 Mar 2023 14:35:14 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 578EC2004D;
 Wed, 15 Mar 2023 14:35:13 +0000 (GMT)
Received: from li-c6ac47cc-293c-11b2-a85c-d421c8e4747b.ibm.com.com (unknown
 [9.171.95.209]) by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 15 Mar 2023 14:35:13 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, nsg@linux.ibm.com, frankja@linux.ibm.com,
 berrange@redhat.com, clg@kaod.org
Subject: [PATCH v18 06/17] s390x/cpu topology: interception of PTF instruction
Date: Wed, 15 Mar 2023 15:34:51 +0100
Message-Id: <20230315143502.135750-7-pmorel@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230315143502.135750-1-pmorel@linux.ibm.com>
References: <20230315143502.135750-1-pmorel@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pOcDnjAwFlGYAfMASjRlFT_Jp72vIpf1
X-Proofpoint-ORIG-GUID: ECcSmWwxfxy99Ax4YtkUaMB4WPRSRUQb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-15_08,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2302240000 definitions=main-2303150122
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

When the host supports the CPU topology facility, the PTF
instruction with function code 2 is interpreted by the SIE,
provided that the userland hypervisor activates the interpretation
by using the KVM_CAP_S390_CPU_TOPOLOGY KVM extension.

The PTF instructions with function code 0 and 1 are intercepted
and must be emulated by the userland hypervisor.

During RESET all CPU of the configuration are placed in
horizontal polarity.

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
---
 include/hw/s390x/s390-virtio-ccw.h |  6 ++
 hw/s390x/cpu-topology.c            | 93 +++++++++++++++++++++++++++---
 target/s390x/kvm/kvm.c             | 11 ++++
 3 files changed, 101 insertions(+), 9 deletions(-)

diff --git a/include/hw/s390x/s390-virtio-ccw.h b/include/hw/s390x/s390-virtio-ccw.h
index 9bba21a916..c1d46e78af 100644
--- a/include/hw/s390x/s390-virtio-ccw.h
+++ b/include/hw/s390x/s390-virtio-ccw.h
@@ -30,6 +30,12 @@ struct S390CcwMachineState {
     uint8_t loadparm[8];
 };
 
+#define S390_PTF_REASON_NONE (0x00 << 8)
+#define S390_PTF_REASON_DONE (0x01 << 8)
+#define S390_PTF_REASON_BUSY (0x02 << 8)
+#define S390_TOPO_FC_MASK 0xffUL
+void s390_handle_ptf(S390CPU *cpu, uint8_t r1, uintptr_t ra);
+
 struct S390CcwMachineClass {
     /*< private >*/
     MachineClass parent_class;
diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
index 45462b01fe..2cce866fc7 100644
--- a/hw/s390x/cpu-topology.c
+++ b/hw/s390x/cpu-topology.c
@@ -87,6 +87,87 @@ static void s390_topology_init(MachineState *ms)
     QTAILQ_INSERT_HEAD(&s390_topology.list, entry, next);
 }
 
+/**
+ * s390_topology_set_cpus_entitlement:
+ *
+ * On hotplug or when changing CPU attributes the shadow_entitlement
+ * is set to hold the entitlement used on a vertical polarization.
+ * When polarization is horizontal, the entitlement is horizontal too.
+ */
+static void s390_topology_set_cpus_entitlement(void)
+{
+    CPUState *cs;
+
+    CPU_FOREACH(cs) {
+        CPUS390XState *env = &S390_CPU(cs)->env;
+
+        if (s390_topology.polarization == S390_CPU_POLARIZATION_HORIZONTAL) {
+            env->entitlement = S390_CPU_ENTITLEMENT_HORIZONTAL;
+        } else if (env->entitlement == S390_CPU_ENTITLEMENT_HORIZONTAL) {
+            if (env->dedicated) {
+                env->entitlement = S390_CPU_ENTITLEMENT_HIGH;
+            } else {
+                env->entitlement = env->shadow_entitlement;
+            }
+        }
+    }
+}
+
+/*
+ * s390_handle_ptf:
+ *
+ * @register 1: contains the function code
+ *
+ * Function codes 0 (horizontal) and 1 (vertical) define the CPU
+ * polarization requested by the guest.
+ *
+ * Verify that the polarization really need to change and call
+ * s390_topology_set_cpus_entitlement() specifying the requested polarization
+ * to set for all CPUs.
+ *
+ * Function code 2 is handling topology changes and is interpreted
+ * by the SIE.
+ */
+void s390_handle_ptf(S390CPU *cpu, uint8_t r1, uintptr_t ra)
+{
+    CPUS390XState *env = &cpu->env;
+    uint64_t reg = env->regs[r1];
+    int fc = reg & S390_TOPO_FC_MASK;
+
+    if (!s390_has_feat(S390_FEAT_CONFIGURATION_TOPOLOGY)) {
+        s390_program_interrupt(env, PGM_OPERATION, ra);
+        return;
+    }
+
+    if (env->psw.mask & PSW_MASK_PSTATE) {
+        s390_program_interrupt(env, PGM_PRIVILEGED, ra);
+        return;
+    }
+
+    if (reg & ~S390_TOPO_FC_MASK) {
+        s390_program_interrupt(env, PGM_SPECIFICATION, ra);
+        return;
+    }
+
+    switch (fc) {
+    case S390_CPU_POLARIZATION_VERTICAL:
+    case S390_CPU_POLARIZATION_HORIZONTAL:
+        if (s390_topology.polarization == fc) {
+            env->regs[r1] |= S390_PTF_REASON_DONE;
+            setcc(cpu, 2);
+        } else {
+            s390_topology.polarization = fc;
+            s390_topology_set_cpus_entitlement();
+            s390_cpu_topology_set_changed(true);
+            setcc(cpu, 0);
+        }
+        break;
+    default:
+        /* Note that fc == 2 is interpreted by the SIE */
+        s390_program_interrupt(env, PGM_SPECIFICATION, ra);
+    }
+}
+
 /**
  * s390_topology_reset:
  *
@@ -96,6 +177,8 @@ static void s390_topology_init(MachineState *ms)
 void s390_topology_reset(void)
 {
     s390_cpu_topology_set_changed(false);
+    s390_topology.polarization = S390_CPU_POLARIZATION_HORIZONTAL;
+    s390_topology_set_cpus_entitlement();
 }
 
 /**
@@ -258,15 +341,7 @@ static void s390_normalize_entitlement(S390CPU *cpu)
     }
 
     /* Set the effective entitlement according to polarization */
-    if (s390_topology.polarization == S390_CPU_POLARIZATION_HORIZONTAL) {
-        cpu->env.entitlement = S390_CPU_ENTITLEMENT_HORIZONTAL;
-    } else if (cpu->env.entitlement == S390_CPU_ENTITLEMENT_HORIZONTAL) {
-        if (cpu->env.dedicated) {
-            cpu->env.entitlement = S390_CPU_ENTITLEMENT_HIGH;
-        } else {
-            cpu->env.entitlement = S390_CPU_ENTITLEMENT_MEDIUM;
-        }
-    }
+    s390_topology_set_cpus_entitlement();
 }
 
 /**
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index bc953151ce..fb63be41b7 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -96,6 +96,7 @@
 
 #define PRIV_B9_EQBS                    0x9c
 #define PRIV_B9_CLP                     0xa0
+#define PRIV_B9_PTF                     0xa2
 #define PRIV_B9_PCISTG                  0xd0
 #define PRIV_B9_PCILG                   0xd2
 #define PRIV_B9_RPCIT                   0xd3
@@ -1464,6 +1465,13 @@ static int kvm_mpcifc_service_call(S390CPU *cpu, struct kvm_run *run)
     }
 }
 
+static void kvm_handle_ptf(S390CPU *cpu, struct kvm_run *run)
+{
+    uint8_t r1 = (run->s390_sieic.ipb >> 20) & 0x0f;
+
+    s390_handle_ptf(cpu, r1, RA_IGNORED);
+}
+
 static int handle_b9(S390CPU *cpu, struct kvm_run *run, uint8_t ipa1)
 {
     int r = 0;
@@ -1481,6 +1489,9 @@ static int handle_b9(S390CPU *cpu, struct kvm_run *run, uint8_t ipa1)
     case PRIV_B9_RPCIT:
         r = kvm_rpcit_service_call(cpu, run);
         break;
+    case PRIV_B9_PTF:
+        kvm_handle_ptf(cpu, run);
+        break;
     case PRIV_B9_EQBS:
         /* just inject exception */
         r = -1;
-- 
2.31.1


