Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B407963C69C
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 18:42:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p04cm-00071V-Lm; Tue, 29 Nov 2022 12:42:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1p04ck-000710-En; Tue, 29 Nov 2022 12:42:26 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1p04ci-0000Ds-9E; Tue, 29 Nov 2022 12:42:26 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ATGxEcD006304; Tue, 29 Nov 2022 17:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=LL2J36UY3mJeGg2Fa/gGwxTjR1gkmCl9uO7odaGmziI=;
 b=iClaMJl0kbJy8y7voYHKq7V6Q+15G4ikCGaH2WEiV4p/fo5s0Rb6P9+LpvULoq+vcBIs
 8F1UHL33oRYQeOu0h9J1130y5qUykFyJqgdZj5+LWbUE3rB6unfECOYYVFenq54z+RHE
 DLt9xbiKYkYzxlbwxav1oxmg8NprI0vwtbyFL3YTEO2ZKMW6rnbxMZ7B8rpduTG5dLtB
 j5GBG1nOIXwORrS0Tdvg8YWUAjuc94vBPadknOHCpU8JOxIMm7J1sk/Lv72VsWr6QdVt
 cEE2jJF0WcbqiJ+MSVwTZQsXQEWSvy2aZhkMI8cK2lcips7uycBJV9QZb9vzUTPIzq97 xQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5k6q7qvf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Nov 2022 17:42:18 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2ATH0Pn5013204;
 Tue, 29 Nov 2022 17:42:17 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5k6q7quk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Nov 2022 17:42:17 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2ATHZuKM027968;
 Tue, 29 Nov 2022 17:42:15 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3m3ae9cf51-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Nov 2022 17:42:15 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2ATHgCjt63766990
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Nov 2022 17:42:12 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9BABA404D;
 Tue, 29 Nov 2022 17:42:11 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2284A4040;
 Tue, 29 Nov 2022 17:42:10 +0000 (GMT)
Received: from li-c6ac47cc-293c-11b2-a85c-d421c8e4747b.ibm.com.com (unknown
 [9.171.89.107])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 29 Nov 2022 17:42:10 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, scgl@linux.ibm.com, frankja@linux.ibm.com,
 berrange@redhat.com, clg@kaod.org
Subject: [PATCH v12 3/7] s390x/cpu_topology: resetting the
 Topology-Change-Report
Date: Tue, 29 Nov 2022 18:42:02 +0100
Message-Id: <20221129174206.84882-4-pmorel@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221129174206.84882-1-pmorel@linux.ibm.com>
References: <20221129174206.84882-1-pmorel@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JPPPnQ9bKvQ6ZvComxAZ-m456y50-oxj
X-Proofpoint-GUID: 4vL3Slv-XgOv5U66UVIhxsEf21iGsE_Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_11,2022-11-29_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211290097
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

During a subsystem reset the Topology-Change-Report is cleared
by the machine.
Let's ask KVM to clear the Modified Topology Change Report (MTCR)
 bit of the SCA in the case of a subsystem reset.

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
Reviewed-by: Nico Boehr <nrb@linux.ibm.com>
Reviewed-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
---
 target/s390x/cpu.h           |  1 +
 target/s390x/kvm/kvm_s390x.h |  1 +
 hw/s390x/cpu-topology.c      | 12 ++++++++++++
 hw/s390x/s390-virtio-ccw.c   |  1 +
 target/s390x/cpu-sysemu.c    | 13 +++++++++++++
 target/s390x/kvm/kvm.c       | 17 +++++++++++++++++
 6 files changed, 45 insertions(+)

diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index dd878ac916..2bd3d417e4 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -854,6 +854,7 @@ void s390_enable_css_support(S390CPU *cpu);
 void s390_do_cpu_set_diag318(CPUState *cs, run_on_cpu_data arg);
 int s390_assign_subch_ioeventfd(EventNotifier *notifier, uint32_t sch_id,
                                 int vq, bool assign);
+void s390_cpu_topology_reset(void);
 #ifndef CONFIG_USER_ONLY
 unsigned int s390_cpu_set_state(uint8_t cpu_state, S390CPU *cpu);
 #else
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
index bbf97cd66a..b1082a4b88 100644
--- a/hw/s390x/cpu-topology.c
+++ b/hw/s390x/cpu-topology.c
@@ -56,6 +56,17 @@ static Property s390_topology_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
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
@@ -71,6 +82,7 @@ static void topology_class_init(ObjectClass *oc, void *data)
     dc->unrealize = s390_topology_unrealize;
     device_class_set_props(dc, s390_topology_properties);
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    dc->reset = s390_topology_reset;
 }
 
 static const TypeInfo cpu_topology_info = {
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 4be07959fd..f29e383d23 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -125,6 +125,7 @@ static const char *const reset_dev_types[] = {
     "s390-flic",
     "diag288",
     TYPE_S390_PCI_HOST_BRIDGE,
+    TYPE_S390_CPU_TOPOLOGY,
 };
 
 static void subsystem_reset(void)
diff --git a/target/s390x/cpu-sysemu.c b/target/s390x/cpu-sysemu.c
index 948e4bd3e0..e27864c5f5 100644
--- a/target/s390x/cpu-sysemu.c
+++ b/target/s390x/cpu-sysemu.c
@@ -306,3 +306,16 @@ void s390_do_cpu_set_diag318(CPUState *cs, run_on_cpu_data arg)
         kvm_s390_set_diag318(cs, arg.host_ulong);
     }
 }
+
+void s390_cpu_topology_reset(void)
+{
+    int ret;
+
+    if (kvm_enabled()) {
+        ret = kvm_s390_topology_set_mtcr(0);
+        if (ret) {
+            error_report("Failed to set Modified Topology Change Report: %s",
+                         strerror(-ret));
+        }
+    }
+}
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 7dc96f3663..5b6383eab0 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -2593,6 +2593,23 @@ int kvm_s390_get_zpci_op(void)
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


