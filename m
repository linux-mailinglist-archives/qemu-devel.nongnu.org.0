Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0850B5AA96D
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 10:07:24 +0200 (CEST)
Received: from localhost ([::1]:53026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU1hz-0001Hu-0K
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 04:07:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1oU1Wr-0005og-78; Fri, 02 Sep 2022 03:55:53 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1oU1Wn-0002yJ-Bt; Fri, 02 Sep 2022 03:55:52 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2827lK6F035120;
 Fri, 2 Sep 2022 07:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Y0lkfCIDyqvgKJzGlfYA03hOJVPU46sJjLkBsk5BaYY=;
 b=q1FSHwXkFpH/6FVFcKk2fF/Wq7gHpGJWN+Zd1XwZYPrTb5UwCwxoeWcu0BtPd9V+sRLu
 UiVms+m9LvxnRuDL80WMCyhAp0vKKB69ftGgaLU8z0K2juo4Yi1woS9O0BFfeEiegwBh
 I9sUL4nFyFNpMAYcHkm/UiP+WEEMwz9+jf6Blpdp00FKBSB/uvI226k+IrjaRqFGqrrI
 9bX3k5LrwLB8MROLSS6XSy9me/1FEQp+rJEhTS18j2Bxq+6fYLOD94rrtlcMVQr8jJBm
 JSszfxb59A75w4pbhCFcaWFLkdxQcIXlbV3Xi85ilt32j3Uk0EyJPUELPLuMOkfIJcpU wA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jbdrgr9vc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Sep 2022 07:55:44 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2827lfbw036536;
 Fri, 2 Sep 2022 07:55:43 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jbdrgr9ut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Sep 2022 07:55:43 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2827pSlV027630;
 Fri, 2 Sep 2022 07:55:42 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 3j7aw8wqws-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Sep 2022 07:55:41 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2827tcHq28836210
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 2 Sep 2022 07:55:39 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D85C711C052;
 Fri,  2 Sep 2022 07:55:38 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1351411C04C;
 Fri,  2 Sep 2022 07:55:38 +0000 (GMT)
Received: from li-c6ac47cc-293c-11b2-a85c-d421c8e4747b.ibm.com.com (unknown
 [9.171.69.137])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  2 Sep 2022 07:55:37 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com
Subject: [PATCH v9 06/10] s390x/cpu_topology: resetting the
 Topology-Change-Report
Date: Fri,  2 Sep 2022 09:55:27 +0200
Message-Id: <20220902075531.188916-7-pmorel@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220902075531.188916-1-pmorel@linux.ibm.com>
References: <20220902075531.188916-1-pmorel@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: m4NMB07Xs1_X7YRhmMBVscERh49V0KFk
X-Proofpoint-ORIG-GUID: hkyFdsd9vxkLRl9R0keFgE0iSIiLMzXY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_12,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209020034
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

During a subsystem reset the Topology-Change-Report is cleared
by the machine.
Let's ask KVM to clear the Modified Topology Change Report (MTCR)
 bit of the SCA in the case of a subsystem reset.

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
---
 hw/s390x/cpu-topology.c      | 12 ++++++++++++
 hw/s390x/s390-virtio-ccw.c   |  1 +
 target/s390x/cpu-sysemu.c    |  7 +++++++
 target/s390x/cpu.h           |  1 +
 target/s390x/kvm/kvm.c       | 23 +++++++++++++++++++++++
 target/s390x/kvm/kvm_s390x.h |  1 +
 6 files changed, 45 insertions(+)

diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
index bb9ae63483..6098d6ea1f 100644
--- a/hw/s390x/cpu-topology.c
+++ b/hw/s390x/cpu-topology.c
@@ -121,6 +121,17 @@ static void s390_topology_realize(DeviceState *dev, Error **errp)
     qemu_mutex_init(&topo->topo_mutex);
 }
 
+/**
+ * s390_topology_reset:
+ * @dev: the device
+ *
+ * Calls the sysemu topology reset
+ */
+static void s390_topology_reset(DeviceState *dev)
+{
+    s390_cpu_topology_reset();
+}
+
 /**
  * topology_class_init:
  * @oc: Object class
@@ -134,6 +145,7 @@ static void topology_class_init(ObjectClass *oc, void *data)
 
     dc->realize = s390_topology_realize;
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    dc->reset = s390_topology_reset;
 }
 
 static const TypeInfo cpu_topology_info = {
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 3f28e28d47..1fa98740de 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -104,6 +104,7 @@ static const char *const reset_dev_types[] = {
     "s390-flic",
     "diag288",
     TYPE_S390_PCI_HOST_BRIDGE,
+    TYPE_S390_CPU_TOPOLOGY,
 };
 
 static void subsystem_reset(void)
diff --git a/target/s390x/cpu-sysemu.c b/target/s390x/cpu-sysemu.c
index 948e4bd3e0..707c0b658c 100644
--- a/target/s390x/cpu-sysemu.c
+++ b/target/s390x/cpu-sysemu.c
@@ -306,3 +306,10 @@ void s390_do_cpu_set_diag318(CPUState *cs, run_on_cpu_data arg)
         kvm_s390_set_diag318(cs, arg.host_ulong);
     }
 }
+
+void s390_cpu_topology_reset(void)
+{
+    if (kvm_enabled()) {
+        kvm_s390_topology_set_mtcr(0);
+    }
+}
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index c61fe9b563..cff5cc0415 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -826,6 +826,7 @@ void s390_enable_css_support(S390CPU *cpu);
 void s390_do_cpu_set_diag318(CPUState *cs, run_on_cpu_data arg);
 int s390_assign_subch_ioeventfd(EventNotifier *notifier, uint32_t sch_id,
                                 int vq, bool assign);
+void s390_cpu_topology_reset(void);
 #ifndef CONFIG_USER_ONLY
 unsigned int s390_cpu_set_state(uint8_t cpu_state, S390CPU *cpu);
 #else
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index f96630440b..9c994d27d5 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -2585,3 +2585,26 @@ int kvm_s390_get_zpci_op(void)
 {
     return cap_zpci_op;
 }
+
+int kvm_s390_topology_set_mtcr(uint64_t attr)
+{
+    struct kvm_device_attr attribute = {
+        .group = KVM_S390_VM_CPU_TOPOLOGY,
+        .attr  = attr,
+    };
+    int ret;
+
+    if (!s390_has_feat(S390_FEAT_CONFIGURATION_TOPOLOGY)) {
+        return -EFAULT;
+    }
+    if (!kvm_vm_check_attr(kvm_state, KVM_S390_VM_CPU_TOPOLOGY, attr)) {
+        return -ENOENT;
+    }
+
+    ret = kvm_vm_ioctl(kvm_state, KVM_SET_DEVICE_ATTR, &attribute);
+    if (ret) {
+        error_report("Failed to set cpu topology attribute %lu: %s",
+                     attr, strerror(-ret));
+    }
+    return ret;
+}
diff --git a/target/s390x/kvm/kvm_s390x.h b/target/s390x/kvm/kvm_s390x.h
index aaae8570de..a13c8fb9a3 100644
--- a/target/s390x/kvm/kvm_s390x.h
+++ b/target/s390x/kvm/kvm_s390x.h
@@ -46,5 +46,6 @@ void kvm_s390_crypto_reset(void);
 void kvm_s390_restart_interrupt(S390CPU *cpu);
 void kvm_s390_stop_interrupt(S390CPU *cpu);
 void kvm_s390_set_diag318(CPUState *cs, uint64_t diag318_info);
+int kvm_s390_topology_set_mtcr(uint64_t attr);
 
 #endif /* KVM_S390X_H */
-- 
2.31.1


