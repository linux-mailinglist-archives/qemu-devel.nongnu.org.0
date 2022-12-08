Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98314646C35
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 10:46:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3DT6-0002nS-1H; Thu, 08 Dec 2022 04:45:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1p3DSa-0002iW-01; Thu, 08 Dec 2022 04:44:56 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1p3DSX-00047P-7B; Thu, 08 Dec 2022 04:44:55 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B89gC2E040494; Thu, 8 Dec 2022 09:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=aU0MX7D/CuX0IIyBhXjo6etgY+kXRehqHWqtBY0Oamo=;
 b=C0QQClEE6bLjnadWp199gZ8R+OhtaDSMd4t9CY8CdSOanUkbPb6c8K8jIiqSjN0fcAOt
 D8iUWxRP2JqWpoZ77IcBLWXbEmhtFcMum1R/MkyqAnwDLKW+P06Hb2vTL+R8mkhtWtJH
 HBIhUS0lMwbaUHkTJqNoJXbRybyrtMfNRIjx/CUm//ItVkD8fzpBq2AgQPcKc/Fdpl4a
 oXBLZgXzXGt3BwDN6IT+Zp3RJLWSHo47yKNuvF+yc9PmV6lGJuTgQtMcuxqDQfpIxiKG
 H5piDpRPdMBPqJlFQe/eqFNQXqBQ6QGR/8Q5UgKTmLDhe8UcZeblGrhQI+gj1m4hLcqm 1A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mbdh2g1jb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Dec 2022 09:44:42 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B89hooH006265;
 Thu, 8 Dec 2022 09:44:42 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mbdh2g1h7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Dec 2022 09:44:41 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2B893GDg027261;
 Thu, 8 Dec 2022 09:44:39 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3m9ks4470x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Dec 2022 09:44:39 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2B89iZpZ38928740
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Dec 2022 09:44:35 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C7EDE20040;
 Thu,  8 Dec 2022 09:44:35 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 613E22004D;
 Thu,  8 Dec 2022 09:44:35 +0000 (GMT)
Received: from li-c6ac47cc-293c-11b2-a85c-d421c8e4747b.ibm.com (unknown
 [9.152.222.245])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  8 Dec 2022 09:44:35 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, scgl@linux.ibm.com, frankja@linux.ibm.com,
 berrange@redhat.com, clg@kaod.org
Subject: [PATCH v13 5/7] s390x/cpu_topology: interception of PTF instruction
Date: Thu,  8 Dec 2022 10:44:30 +0100
Message-Id: <20221208094432.9732-6-pmorel@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221208094432.9732-1-pmorel@linux.ibm.com>
References: <20221208094432.9732-1-pmorel@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: u5xiGOePMKdVhZOCa7HTJ6jG_OTxNSjQ
X-Proofpoint-ORIG-GUID: VifBaDXOP6kbKLy7zE_O5yS3EuxxeEgB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-08_04,2022-12-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 mlxlogscore=999 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212080077
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
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

When the host supports the CPU topology facility, the PTF
instruction with function code 2 is interpreted by the SIE,
provided that the userland hypervizor activates the interpretation
by using the KVM_CAP_S390_CPU_TOPOLOGY KVM extension.

The PTF instructions with function code 0 and 1 are intercepted
and must be emulated by the userland hypervizor.

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
Reviewed-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
---
 include/hw/s390x/s390-virtio-ccw.h |  6 ++++
 hw/s390x/cpu-topology.c            | 52 ++++++++++++++++++++++++++++++
 target/s390x/kvm/kvm.c             | 11 +++++++
 3 files changed, 69 insertions(+)

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
index 8a2fe041d4..a2a553e362 100644
--- a/hw/s390x/cpu-topology.c
+++ b/hw/s390x/cpu-topology.c
@@ -19,6 +19,58 @@
 #include "hw/s390x/s390-virtio-ccw.h"
 #include "hw/s390x/cpu-topology.h"
 #include "migration/vmstate.h"
+#include "target/s390x/cpu.h"
+#include "hw/s390x/s390-virtio-ccw.h"
+
+/*
+ * s390_handle_ptf:
+ *
+ * @register 1: contains the function code
+ *
+ * Function codes 0 and 1 handle the CPU polarization.
+ * We assume an horizontal topology, the only one supported currently
+ * by Linux, consequently we answer to function code 0, requesting
+ * horizontal polarization that it is already the current polarization
+ * and reject vertical polarization request without further explanation.
+ *
+ * Function code 2 is handling topology changes and is interpreted
+ * by the SIE.
+ */
+void s390_handle_ptf(S390CPU *cpu, uint8_t r1, uintptr_t ra)
+{
+    CPUS390XState *env = &cpu->env;
+    uint64_t reg = env->regs[r1];
+    uint8_t fc = reg & S390_TOPO_FC_MASK;
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
+    case 0:    /* Horizontal polarization is already set */
+        env->regs[r1] |= S390_PTF_REASON_DONE;
+        setcc(cpu, 2);
+        break;
+    case 1:    /* Vertical polarization is not supported */
+        env->regs[r1] |= S390_PTF_REASON_NONE;
+        setcc(cpu, 2);
+        break;
+    default:
+        /* Note that fc == 2 is interpreted by the SIE */
+        s390_program_interrupt(env, PGM_SPECIFICATION, ra);
+    }
+}
 
 /**
  * s390_has_topology
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 5b6383eab0..a79fdf1c79 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -97,6 +97,7 @@
 
 #define PRIV_B9_EQBS                    0x9c
 #define PRIV_B9_CLP                     0xa0
+#define PRIV_B9_PTF                     0xa2
 #define PRIV_B9_PCISTG                  0xd0
 #define PRIV_B9_PCILG                   0xd2
 #define PRIV_B9_RPCIT                   0xd3
@@ -1465,6 +1466,13 @@ static int kvm_mpcifc_service_call(S390CPU *cpu, struct kvm_run *run)
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
@@ -1482,6 +1490,9 @@ static int handle_b9(S390CPU *cpu, struct kvm_run *run, uint8_t ipa1)
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


