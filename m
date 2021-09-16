Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B12D340DBCF
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 15:53:45 +0200 (CEST)
Received: from localhost ([::1]:42370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQrpg-0006Qq-NY
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 09:53:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mQrnE-0003X9-W3; Thu, 16 Sep 2021 09:51:13 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:41464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mQrnB-0006GY-Mm; Thu, 16 Sep 2021 09:51:12 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18GBxSkd021191;
 Thu, 16 Sep 2021 09:51:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=SvnJ+x5KP6BN+9WZkQJ4hf0UCAkqjOEEP9ClR/W/P5o=;
 b=MmzY8GrbbDF605xK1C7rGs4bD82gUdLQO2/X6lxbGNb197thM2vI3J0X+CaAhqB3ohYB
 6hlN8K4roZH7xacOGLvO2eybmSoFCRKY2cRF4sEsPHZyoPZA3Cia4wV5iXTO1tIDt170
 DA1YozwHzwyAyXNSJedYvc64fWtRhOnvZOXJNETIfz/o5/As7ViLVbYWK/x8Wn8J7gYG
 ch+Vdt577Z7uQq4/oEmgfnjUXolMUryaVNukwcdZ9gE4gLdx5CGpys6gX4llgsSlFupK
 77/Dco4laqhTMtB/GcxWBTU7oolimWxkmW+76kcBmYvB3v+PzqAStbAnYWKs1248avQj mA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b453s3c7k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Sep 2021 09:51:04 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18GDnFFR015462;
 Thu, 16 Sep 2021 09:51:03 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b453s3c61-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Sep 2021 09:51:03 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18GDkupY025414;
 Thu, 16 Sep 2021 13:51:01 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3b0m3a375f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Sep 2021 13:51:01 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 18GDkORh57999764
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Sep 2021 13:46:24 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 72E5942042;
 Thu, 16 Sep 2021 13:50:57 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0794642041;
 Thu, 16 Sep 2021 13:50:57 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.190.206])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 16 Sep 2021 13:50:56 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-s390x@nongnu.org
Subject: [PATCH v3 2/4] s390x: kvm: topology: interception of PTF instruction
Date: Thu, 16 Sep 2021 15:50:52 +0200
Message-Id: <1631800254-25762-3-git-send-email-pmorel@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1631800254-25762-1-git-send-email-pmorel@linux.ibm.com>
References: <1631800254-25762-1-git-send-email-pmorel@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UdFO8AzXPXIA6iOyshlM8v8CFJVxQ0bR
X-Proofpoint-ORIG-GUID: fFN2YAfWgTFyrVWvRIuzR6LCyMfaRUTP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 spamscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109160073
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the host supports the CPU topology facility, the PTF
instruction with function code 2 is interpreted by the SIE,
provided that the userland hypervizor activates the interpretation
by using the KVM_CAP_S390_CPU_TOPOLOGY KVM extension.

The PTF instructions with function code 0 and 1 are intercepted
and must be emulated by the userland hypervizor.

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
---
 hw/s390x/s390-virtio-ccw.c         | 36 ++++++++++++++++++++++++++++++
 include/hw/s390x/s390-virtio-ccw.h |  6 +++++
 target/s390x/kvm/kvm.c             | 15 +++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 61aeccb163..894f013139 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -404,6 +404,42 @@ static void s390_pv_prepare_reset(S390CcwMachineState *ms)
     s390_pv_prep_reset();
 }
 
+int s390_handle_ptf(S390CPU *cpu, uint8_t r1, uintptr_t ra)
+{
+    CPUS390XState *env = &cpu->env;
+    uint64_t reg = env->regs[r1];
+    uint8_t fc = reg & S390_TOPO_FC_MASK;
+
+    if (!s390_has_feat(S390_FEAT_CONFIGURATION_TOPOLOGY)) {
+        s390_program_interrupt(env, PGM_OPERATION, ra);
+        return 0;
+    }
+
+    if (env->psw.mask & PSW_MASK_PSTATE) {
+        s390_program_interrupt(env, PGM_PRIVILEGED, ra);
+        return 0;
+    }
+
+    if (reg & ~S390_TOPO_FC_MASK) {
+        s390_program_interrupt(env, PGM_SPECIFICATION, ra);
+        return 0;
+    }
+
+    switch (fc) {
+    case 0:    /* Horizontal polarization is already set */
+        env->regs[r1] |= S390_PTF_REASON_DONE;
+        return 2;
+    case 1:    /* Vertical polarization is not supported */
+        env->regs[r1] |= S390_PTF_REASON_NONE;
+        return 2;
+    default:
+        /* Note that fc == 2 is interpreted by the SIE */
+        s390_program_interrupt(env, PGM_SPECIFICATION, ra);
+    }
+
+    return 0;
+}
+
 static void s390_machine_reset(MachineState *machine)
 {
     S390CcwMachineState *ms = S390_CCW_MACHINE(machine);
diff --git a/include/hw/s390x/s390-virtio-ccw.h b/include/hw/s390x/s390-virtio-ccw.h
index 3331990e02..ac4b4a92e7 100644
--- a/include/hw/s390x/s390-virtio-ccw.h
+++ b/include/hw/s390x/s390-virtio-ccw.h
@@ -30,6 +30,12 @@ struct S390CcwMachineState {
     uint8_t loadparm[8];
 };
 
+#define S390_PTF_REASON_NONE (0x00 << 8)
+#define S390_PTF_REASON_DONE (0x01 << 8)
+#define S390_PTF_REASON_BUSY (0x02 << 8)
+#define S390_TOPO_FC_MASK 0xffUL
+int s390_handle_ptf(S390CPU *cpu, uint8_t r1, uintptr_t ra);
+
 struct S390CcwMachineClass {
     /*< private >*/
     MachineClass parent_class;
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 5b1fdb55c4..dd036961fe 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -97,6 +97,7 @@
 
 #define PRIV_B9_EQBS                    0x9c
 #define PRIV_B9_CLP                     0xa0
+#define PRIV_B9_PTF                     0xa2
 #define PRIV_B9_PCISTG                  0xd0
 #define PRIV_B9_PCILG                   0xd2
 #define PRIV_B9_RPCIT                   0xd3
@@ -362,6 +363,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     kvm_vm_enable_cap(s, KVM_CAP_S390_USER_SIGP, 0);
     kvm_vm_enable_cap(s, KVM_CAP_S390_VECTOR_REGISTERS, 0);
     kvm_vm_enable_cap(s, KVM_CAP_S390_USER_STSI, 0);
+    kvm_vm_enable_cap(s, KVM_CAP_S390_CPU_TOPOLOGY, 0);
     if (ri_allowed()) {
         if (kvm_vm_enable_cap(s, KVM_CAP_S390_RI, 0) == 0) {
             cap_ri = 1;
@@ -1452,6 +1454,16 @@ static int kvm_mpcifc_service_call(S390CPU *cpu, struct kvm_run *run)
     }
 }
 
+static int kvm_handle_ptf(S390CPU *cpu, struct kvm_run *run)
+{
+    uint8_t r1 = (run->s390_sieic.ipb >> 20) & 0x0f;
+    int ret;
+
+    ret = s390_handle_ptf(cpu, r1, RA_IGNORED);
+    setcc(cpu, ret);
+    return 0;
+}
+
 static int handle_b9(S390CPU *cpu, struct kvm_run *run, uint8_t ipa1)
 {
     int r = 0;
@@ -1469,6 +1481,9 @@ static int handle_b9(S390CPU *cpu, struct kvm_run *run, uint8_t ipa1)
     case PRIV_B9_RPCIT:
         r = kvm_rpcit_service_call(cpu, run);
         break;
+    case PRIV_B9_PTF:
+        r = kvm_handle_ptf(cpu, run);
+        break;
     case PRIV_B9_EQBS:
         /* just inject exception */
         r = -1;
-- 
2.25.1


