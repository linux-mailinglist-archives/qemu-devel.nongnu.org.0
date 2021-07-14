Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 116903C8944
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 19:02:30 +0200 (CEST)
Received: from localhost ([::1]:56650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3iHF-00085L-4T
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 13:02:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m3i8a-0007T3-On; Wed, 14 Jul 2021 12:53:32 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:7398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m3i8Y-00011S-FC; Wed, 14 Jul 2021 12:53:32 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16EGXxiX022447; Wed, 14 Jul 2021 12:53:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=UK9QrVvhn621HnBP7VYmqUA9xmcGXIry50KqANT1L7c=;
 b=OQjGechF+h5c/TDm3REcrrAujzSVm8pVykpI1fIupgt5s0+LEZmFEZ+rnxFqGMQ4u/pf
 If/ziw7KL8OAmft3SSkE3C6C1ouIITMLgTfzcvnALUPR8/xtqQyKeBSfiGMnfXAZmF0j
 kuem0UhS8lTBRvD+6tVdwFqnpFxpsw3xDeZfCMjaTdSzYDHUpelEtSsF7TpCQ8/uqhfc
 jb75liNzFWHXhAYOtwHZuSH/kKlgSCmoIZR3vnUzmy+NDoo1sKEmXlVKhSPB1oZ28DWT
 WrAt0hQ2Dw0p8zN9cBNd2Oz8tjHp12ve2OeJXxL0kNQ4IgEfJLRhLdmNvzP1wAF5cHuq hA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39sc8ka4hh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jul 2021 12:53:28 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16EGZ2FF027156;
 Wed, 14 Jul 2021 12:53:27 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39sc8ka4gu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jul 2021 12:53:27 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16EGr0l2029040;
 Wed, 14 Jul 2021 16:53:25 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 39q2th9vng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jul 2021 16:53:25 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16EGrMXt28508642
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jul 2021 16:53:22 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6456BA405B;
 Wed, 14 Jul 2021 16:53:22 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CCDFFA4067;
 Wed, 14 Jul 2021 16:53:21 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.181.132])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 14 Jul 2021 16:53:21 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-s390x@nongnu.org
Subject: [PATCH v1 6/9] s390x: kvm: topology: interception of PTF instruction
Date: Wed, 14 Jul 2021 18:53:13 +0200
Message-Id: <1626281596-31061-7-git-send-email-pmorel@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1626281596-31061-1-git-send-email-pmorel@linux.ibm.com>
References: <1626281596-31061-1-git-send-email-pmorel@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hI7W9dEWZW3IYqRWqeZ-TzEJ7GzmEtkt
X-Proofpoint-ORIG-GUID: a95Eezg3r1SCFsXbArSfe8SNI3TQG6gX
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-14_10:2021-07-14,
 2021-07-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107140099
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: thuth@redhat.com, ehabkost@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, armbru@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, pbonzini@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Interception of the PTF instruction depending on the new
KVM_CAP_S390_CPU_TOPOLOGY KVM extension.

A global value is used to remember if a Topology change occured since
the last interception of a PTF instruction with function code 0.

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
---
 hw/s390x/cpu-topology.c            | 19 +++++++++++
 include/hw/s390x/cpu-topology.h    |  8 +++++
 include/hw/s390x/s390-virtio-ccw.h |  1 +
 target/s390x/cpu.c                 |  4 +++
 target/s390x/cpu.h                 |  1 +
 target/s390x/kvm/kvm.c             | 52 ++++++++++++++++++++++++++++++
 6 files changed, 85 insertions(+)

diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
index 1224137f56..5e1cac9529 100644
--- a/hw/s390x/cpu-topology.c
+++ b/hw/s390x/cpu-topology.c
@@ -19,12 +19,25 @@
 #include "qemu/typedefs.h"
 #include "hw/s390x/s390-virtio-ccw.h"
 
+int s390_topology_changed(void)
+{
+    const MachineState *ms = MACHINE(qdev_get_machine());
+    S390CcwMachineState *s390ms = S390_CCW_MACHINE(ms);
+
+    if (s390ms->topology_changed) {
+        s390ms->topology_changed = 0;
+        return 1;
+    }
+    return 0;
+}
+
 static S390TopologyCores *s390_create_cores(S390TopologySocket *socket,
                                             int origin)
 {
     DeviceState *dev;
     S390TopologyCores *cores;
     const MachineState *ms = MACHINE(qdev_get_machine());
+    S390CcwMachineState *s390ms = S390_CCW_MACHINE(ms);
 
     if (socket->bus->num_children >= ms->smp.cores) {
         return NULL;
@@ -36,6 +49,7 @@ static S390TopologyCores *s390_create_cores(S390TopologySocket *socket,
     cores = S390_TOPOLOGY_CORES(dev);
     cores->origin = origin;
     socket->cnt += 1;
+    s390ms->topology_changed = 1;
 
     return cores;
 }
@@ -45,6 +59,7 @@ static S390TopologySocket *s390_create_socket(S390TopologyBook *book, int id)
     DeviceState *dev;
     S390TopologySocket *socket;
     const MachineState *ms = MACHINE(qdev_get_machine());
+    S390CcwMachineState *s390ms = S390_CCW_MACHINE(ms);
 
     if (book->bus->num_children >= ms->smp.sockets) {
         return NULL;
@@ -56,6 +71,7 @@ static S390TopologySocket *s390_create_socket(S390TopologyBook *book, int id)
     socket = S390_TOPOLOGY_SOCKET(dev);
     socket->socket_id = id;
     book->cnt++;
+    s390ms->topology_changed = 1;
 
     return socket;
 }
@@ -77,6 +93,7 @@ static S390TopologyBook *s390_create_book(S390TopologyDrawer *drawer, int id)
     book = S390_TOPOLOGY_BOOK(dev);
     book->book_id = id;
     drawer->cnt++;
+    s390ms->topology_changed = 1;
 
     return book;
 }
@@ -98,6 +115,7 @@ static S390TopologyDrawer *s390_create_drawer(S390TopologyNode *node, int id)
     drawer = S390_TOPOLOGY_DRAWER(dev);
     drawer->drawer_id = id;
     node->cnt++;
+    s390ms->topology_changed = 1;
 
     return drawer;
 }
@@ -210,6 +228,7 @@ void s390_topology_new_cpu(int core_id)
     bit = 63 - (core_id - origin);
     set_bit(bit, &cores->mask);
     cores->origin = origin;
+    s390ms->topology_changed = 1;
 }
 
 /*
diff --git a/include/hw/s390x/cpu-topology.h b/include/hw/s390x/cpu-topology.h
index 64424cb457..549a3e9a19 100644
--- a/include/hw/s390x/cpu-topology.h
+++ b/include/hw/s390x/cpu-topology.h
@@ -12,6 +12,7 @@
 
 #include "hw/qdev-core.h"
 #include "qom/object.h"
+#include "include/hw/sysbus.h"
 
 #define S390_TOPOLOGY_CPU_TYPE    0x03
 
@@ -88,4 +89,11 @@ S390TopologyNode *s390_get_topology(void);
 void s390_topology_setup(MachineState *ms);
 void s390_topology_new_cpu(int core_id);
 
+#define S390_PTF_REASON_NONE (0x00 << 8)
+#define S390_PTF_REASON_DONE (0x01 << 8)
+#define S390_PTF_REASON_BUSY (0x02 << 8)
+extern int s390_topology_changed(void);
+
+#define S390_TOPO_FC_MASK 0xffUL
+
 #endif
diff --git a/include/hw/s390x/s390-virtio-ccw.h b/include/hw/s390x/s390-virtio-ccw.h
index fb3c3a50ce..a091468c79 100644
--- a/include/hw/s390x/s390-virtio-ccw.h
+++ b/include/hw/s390x/s390-virtio-ccw.h
@@ -30,6 +30,7 @@ struct S390CcwMachineState {
     uint8_t loadparm[8];
     int drawers;
     int books;
+    int topology_changed;
 };
 
 struct S390CcwMachineClass {
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 7b7b05f1d3..ac7b161190 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -35,6 +35,7 @@
 #include "fpu/softfloat-helpers.h"
 #include "disas/capstone.h"
 #include "sysemu/tcg.h"
+#include "hw/s390x/cpu-topology.h"
 
 #define CR0_RESET       0xE0UL
 #define CR14_RESET      0xC2000000UL;
@@ -154,6 +155,9 @@ static void s390_cpu_reset(CPUState *s, cpu_reset_type type)
 
         env->pfault_token = -1UL;
         env->bpbc = false;
+#if !defined(CONFIG_USER_ONLY)
+        s390_topology_changed();
+#endif
         break;
     default:
         g_assert_not_reached();
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index d573ba205e..4eacd06c59 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -901,4 +901,5 @@ typedef S390CPU ArchCPU;
 
 #include "exec/cpu-all.h"
 
+int s390_handle_ptf(S390CPU *cpu, uint8_t r1, uintptr_t ra);
 #endif
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index d78261c089..7c3594d793 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -98,6 +98,7 @@
 
 #define PRIV_B9_EQBS                    0x9c
 #define PRIV_B9_CLP                     0xa0
+#define PRIV_B9_PTF                     0xa2
 #define PRIV_B9_PCISTG                  0xd0
 #define PRIV_B9_PCILG                   0xd2
 #define PRIV_B9_RPCIT                   0xd3
@@ -1453,6 +1454,54 @@ static int kvm_mpcifc_service_call(S390CPU *cpu, struct kvm_run *run)
     }
 }
 
+int s390_handle_ptf(S390CPU *cpu, uint8_t r1, uintptr_t ra)
+{
+    CPUS390XState *env = &cpu->env;
+    uint64_t reg = env->regs[r1];
+    uint8_t fc = reg & S390_TOPO_FC_MASK;
+
+    if (!s390_has_feat(S390_FEAT_CONFIGURATION_TOPOLOGY)) {
+        s390_program_interrupt(env, PGM_OPERAND, ra);
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
+        env->regs[r1] = S390_PTF_REASON_DONE;
+        return 2;
+    case 1:    /* Vertical polarization is not supported */
+        env->regs[r1] = S390_PTF_REASON_NONE;
+        return 2;
+    case 2:    /* Report if a topology change report is pending */
+        return s390_topology_changed();
+    default:
+        s390_program_interrupt(env, PGM_SPECIFICATION, ra);
+        break;
+    }
+
+    return 0;
+}
+
+static int kvm_handle_ptf(S390CPU *cpu, struct kvm_run *run)
+{
+    uint8_t r1 = (run->s390_sieic.ipb >> 20) & 0x0f;
+    uint8_t ret;
+
+    ret = s390_handle_ptf(cpu, r1, RA_IGNORED);
+    setcc(cpu, ret);
+    return 0;
+}
+
 static int handle_b9(S390CPU *cpu, struct kvm_run *run, uint8_t ipa1)
 {
     int r = 0;
@@ -1470,6 +1519,9 @@ static int handle_b9(S390CPU *cpu, struct kvm_run *run, uint8_t ipa1)
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


