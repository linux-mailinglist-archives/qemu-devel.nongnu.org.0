Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 034F6283CF3
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Oct 2020 18:59:16 +0200 (CEST)
Received: from localhost ([::1]:44164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPTpT-0001OQ-4L
	for lists+qemu-devel@lfdr.de; Mon, 05 Oct 2020 12:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kPTii-0003IQ-Kh; Mon, 05 Oct 2020 12:52:16 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:13754
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kPTig-0001dc-RN; Mon, 05 Oct 2020 12:52:16 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 095GhEV9124946; Mon, 5 Oct 2020 12:52:02 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34078er857-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Oct 2020 12:52:02 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 095GasDl013719;
 Mon, 5 Oct 2020 16:52:00 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 33xgx7s7h5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Oct 2020 16:52:00 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 095GpwuH19988746
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 5 Oct 2020 16:51:58 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5CAE04203F;
 Mon,  5 Oct 2020 16:51:58 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F29CE42047;
 Mon,  5 Oct 2020 16:51:57 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  5 Oct 2020 16:51:57 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-2-207.uk.ibm.com [9.145.2.207])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 49B6D220155;
 Mon,  5 Oct 2020 18:51:57 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH v2 1/6] spapr/xive: Introduce a StoreEOI capability
Date: Mon,  5 Oct 2020 18:51:42 +0200
Message-Id: <20201005165147.526426-2-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201005165147.526426-1-clg@kaod.org>
References: <20201005165147.526426-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-05_11:2020-10-05,
 2020-10-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=842
 impostorscore=0 phishscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1034 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010050117
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/05 12:52:05
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 Gustavo Romero <gromero@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When an interrupt has been handled, the OS notifies the interrupt
controller with an EOI sequence. On the XIVE interrupt controller
(POWER9 and POWER10), this can be done with a load or a store
operation on the ESB interrupt management page of the interrupt. The
StoreEOI operation has less latency and improves interrupt handling
performance but it was deactivated during the POWER9 DD2.0 time-frame
because of ordering issues. POWER9 systems use the LoadEOI instead.
POWER10 has fixed the issue with a special load command which enforces
Load-after-Store ordering and StoreEOI can be safely used.

The new StoreEOI capability adds StoreEOI support to the flags
returned by the hcall H_INT_GET_SOURCE_INFO. When the machine is using
an emulated interrupt controller, TCG or without kernel IRQ chip,
there are no limitations and activating StoreEOI is not an issue.
However, when running with a kernel IRQ chip, some verification needs
to be done on the host. This is done through the DT, which tells us
that firmware has configured the HW for StoreEOI, but a new KVM
capability would be cleaner.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/spapr.h |  4 +++-
 target/ppc/kvm_ppc.h   |  6 ++++++
 hw/ppc/spapr.c         |  1 +
 hw/ppc/spapr_caps.c    | 30 ++++++++++++++++++++++++++++++
 target/ppc/kvm.c       | 18 ++++++++++++++++++
 5 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index bba8736269f4..b701c14b4e09 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -74,8 +74,10 @@ typedef enum {
 #define SPAPR_CAP_CCF_ASSIST            0x09
 /* Implements PAPR FWNMI option */
 #define SPAPR_CAP_FWNMI                 0x0A
+/* Implements XIVE StoreEOI feature */
+#define SPAPR_CAP_STOREEOI              0x0B
 /* Num Caps */
-#define SPAPR_CAP_NUM                   (SPAPR_CAP_FWNMI + 1)
+#define SPAPR_CAP_NUM                   (SPAPR_CAP_STOREEOI + 1)
=20
 /*
  * Capability Values
diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
index 72e05f1cd2fc..c5a487dbba13 100644
--- a/target/ppc/kvm_ppc.h
+++ b/target/ppc/kvm_ppc.h
@@ -64,6 +64,7 @@ bool kvmppc_has_cap_htm(void);
 bool kvmppc_has_cap_mmu_radix(void);
 bool kvmppc_has_cap_mmu_hash_v3(void);
 bool kvmppc_has_cap_xive(void);
+bool kvmppc_has_cap_xive_storeeoi(void);
 int kvmppc_get_cap_safe_cache(void);
 int kvmppc_get_cap_safe_bounds_check(void);
 int kvmppc_get_cap_safe_indirect_branch(void);
@@ -346,6 +347,11 @@ static inline bool kvmppc_has_cap_xive(void)
     return false;
 }
=20
+static inline bool kvmppc_has_cap_xive_storeeoi(void)
+{
+    return false;
+}
+
 static inline int kvmppc_get_cap_safe_cache(void)
 {
     return 0;
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 4256794f3bed..e83de0580142 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4447,6 +4447,7 @@ static void spapr_machine_class_init(ObjectClass *o=
c, void *data)
     smc->default_caps.caps[SPAPR_CAP_LARGE_DECREMENTER] =3D SPAPR_CAP_ON=
;
     smc->default_caps.caps[SPAPR_CAP_CCF_ASSIST] =3D SPAPR_CAP_ON;
     smc->default_caps.caps[SPAPR_CAP_FWNMI] =3D SPAPR_CAP_ON;
+    smc->default_caps.caps[SPAPR_CAP_STOREEOI] =3D SPAPR_CAP_OFF;
     spapr_caps_add_properties(smc);
     smc->irq =3D &spapr_irq_dual;
     smc->dr_phb_enabled =3D true;
diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
index 9341e9782a3f..57c62c22e4cc 100644
--- a/hw/ppc/spapr_caps.c
+++ b/hw/ppc/spapr_caps.c
@@ -524,6 +524,26 @@ static void cap_fwnmi_apply(SpaprMachineState *spapr=
, uint8_t val,
     }
 }
=20
+static void cap_storeeoi_apply(SpaprMachineState *spapr, uint8_t val,
+                               Error **errp)
+{
+    ERRP_GUARD();
+    MachineState *machine =3D MACHINE(spapr);
+    bool kvm_storeeoi =3D kvmppc_has_cap_xive_storeeoi();
+
+    if (!val) {
+        return; /* Disabled by default */
+    }
+
+    /* Check host support when the KVM device is in use */
+    if (kvm_irqchip_in_kernel()) {
+        if (!kvm_storeeoi) {
+            error_setg(errp, "StoreEOI not supported by KVM");
+            return;
+        }
+    }
+}
+
 SpaprCapabilityInfo capability_table[SPAPR_CAP_NUM] =3D {
     [SPAPR_CAP_HTM] =3D {
         .name =3D "htm",
@@ -632,6 +652,15 @@ SpaprCapabilityInfo capability_table[SPAPR_CAP_NUM] =
=3D {
         .type =3D "bool",
         .apply =3D cap_fwnmi_apply,
     },
+    [SPAPR_CAP_STOREEOI] =3D {
+        .name =3D "storeeoi",
+        .description =3D "Implements XIVE StoreEOI feature",
+        .index =3D SPAPR_CAP_STOREEOI,
+        .get =3D spapr_cap_get_bool,
+        .set =3D spapr_cap_set_bool,
+        .type =3D "bool",
+        .apply =3D cap_storeeoi_apply,
+    },
 };
=20
 static SpaprCapabilities default_caps_with_cpu(SpaprMachineState *spapr,
@@ -772,6 +801,7 @@ SPAPR_CAP_MIG_STATE(nested_kvm_hv, SPAPR_CAP_NESTED_K=
VM_HV);
 SPAPR_CAP_MIG_STATE(large_decr, SPAPR_CAP_LARGE_DECREMENTER);
 SPAPR_CAP_MIG_STATE(ccf_assist, SPAPR_CAP_CCF_ASSIST);
 SPAPR_CAP_MIG_STATE(fwnmi, SPAPR_CAP_FWNMI);
+SPAPR_CAP_MIG_STATE(storeeoi, SPAPR_CAP_STOREEOI);
=20
 void spapr_caps_init(SpaprMachineState *spapr)
 {
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index d85ba8ffe00b..9ad637151070 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -2448,6 +2448,24 @@ bool kvmppc_has_cap_xive(void)
     return cap_xive;
 }
=20
+/*
+ * TODO: Introduce a new KVM capability
+ */
+bool kvmppc_has_cap_xive_storeeoi(void)
+{
+    static const char *compat =3D "ibm,opal-xive-pe";
+    void *host_fdt;
+    int xive_node;
+
+    host_fdt =3D load_device_tree_from_sysfs();
+    xive_node =3D fdt_node_offset_by_compatible(host_fdt, -1, compat);
+    if (xive_node < 0) {
+        return false;
+    }
+
+    return !!fdt_getprop(host_fdt, xive_node, "store-eoi-support", NULL)=
;
+}
+
 static void kvmppc_get_cpu_characteristics(KVMState *s)
 {
     struct kvm_ppc_cpu_char c;
--=20
2.25.4


