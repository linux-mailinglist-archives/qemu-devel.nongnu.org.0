Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BED704C35BA
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 20:20:14 +0100 (CET)
Received: from localhost ([::1]:52034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNJev-00086i-EG
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 14:20:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nNJKF-0005v4-BA; Thu, 24 Feb 2022 13:58:51 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:59284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nNJKD-0006SD-9M; Thu, 24 Feb 2022 13:58:51 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21OHq2ep030326; 
 Thu, 24 Feb 2022 18:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=hB7YXwzh4Tx+sRdVNmT/eGf3ri1RtthXBaISHOCZab0=;
 b=iVEtodhpc7rPAaSghL3tHgtVSI8Cnetp+9PFDaYUlm9yuLwcNK5+zbZ1f3635UVy1ib0
 cVSfATVA+2iu2Kn4gAkafLo3IwL0R5khFhtfrZAsoXFih5AhV8eguLvKQYzWXDUAlB+X
 uQlOIGZWVecTGG+RqKSMbEIp5RiA3zrs2G1n38OVRwDrIeIF6Qvy/AXTmtoXb3loAn6L
 sh/rmh5/e6Mav6xFOaEhwUqP5ZRh639HOqRVwO/L95Xm7PHftzkufHdIzuCaJpf8TSss
 C86wYqabnovLsGsb+R59C85eA6IM/8LN9NA3Ne7zqTpvCItgXzdjYSCdqZMDReQKko05 vw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eds79wum3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Feb 2022 18:58:37 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21OIfQLS008800;
 Thu, 24 Feb 2022 18:58:36 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eds79wukr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Feb 2022 18:58:36 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21OIcaw6016649;
 Thu, 24 Feb 2022 18:58:36 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 3ear6bw928-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Feb 2022 18:58:35 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21OIwY6g29819292
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Feb 2022 18:58:34 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A7A8C6065;
 Thu, 24 Feb 2022 18:58:34 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 804B3C605F;
 Thu, 24 Feb 2022 18:58:32 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.135.43])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 24 Feb 2022 18:58:32 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 4/4] spapr: Add KVM-on-TCG migration support
Date: Thu, 24 Feb 2022 15:58:17 -0300
Message-Id: <20220224185817.2207228-5-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220224185817.2207228-1-farosas@linux.ibm.com>
References: <20220224185817.2207228-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: n3GCtEqbhqQSRzhkmoAej0M0o3bgYk0K
X-Proofpoint-ORIG-GUID: IW7OpOQKknPGTNBdPVcS8J_koaZMwxl3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-24_03,2022-02-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202240104
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: aik@ozlabs.ru, danielhb413@gmail.com, npiggin@gmail.com,
 qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds migration support for TCG pseries machines running a KVM-HV
guest.

The state that needs to be migrated is:

- the nested PTCR value;
- the in_nested flag;
- the nested_tb_offset.
- the saved host CPUPPCState structure;

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

---
(this migrates just fine with L2 running stress and 1 VCPU in L1. With
32 VCPUs in L1 there's crashes which I still don't understand. They might
be related to L1 migration being flaky right now)
---
 hw/ppc/spapr.c          | 19 +++++++++++
 hw/ppc/spapr_cpu_core.c | 76 +++++++++++++++++++++++++++++++++++++++++
 target/ppc/machine.c    | 44 ++++++++++++++++++++++++
 3 files changed, 139 insertions(+)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index f0b75b22bb..6e87c515db 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1934,6 +1934,13 @@ static bool spapr_patb_entry_needed(void *opaque)
     return !!spapr->patb_entry;
 }
 
+static bool spapr_nested_ptcr_needed(void *opaque)
+{
+    SpaprMachineState *spapr = opaque;
+
+    return !!spapr->nested_ptcr;
+}
+
 static const VMStateDescription vmstate_spapr_patb_entry = {
     .name = "spapr_patb_entry",
     .version_id = 1,
@@ -1945,6 +1952,17 @@ static const VMStateDescription vmstate_spapr_patb_entry = {
     },
 };
 
+static const VMStateDescription vmstate_spapr_nested_ptcr = {
+    .name = "spapr_nested_ptcr",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = spapr_nested_ptcr_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(nested_ptcr, SpaprMachineState),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
 static bool spapr_irq_map_needed(void *opaque)
 {
     SpaprMachineState *spapr = opaque;
@@ -2069,6 +2087,7 @@ static const VMStateDescription vmstate_spapr = {
         &vmstate_spapr_cap_fwnmi,
         &vmstate_spapr_fwnmi,
         &vmstate_spapr_cap_rpt_invalidate,
+        &vmstate_spapr_nested_ptcr,
         NULL
     }
 };
diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index efda7730f1..3ec13c0660 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -25,6 +25,7 @@
 #include "sysemu/reset.h"
 #include "sysemu/hw_accel.h"
 #include "qemu/error-report.h"
+#include "migration/cpu.h"
 
 static void spapr_reset_vcpu(PowerPCCPU *cpu)
 {
@@ -174,6 +175,80 @@ static const VMStateDescription vmstate_spapr_cpu_vpa = {
     }
 };
 
+static bool nested_needed(void *opaque)
+{
+    SpaprCpuState *spapr_cpu = opaque;
+
+    return spapr_cpu->in_nested;
+}
+
+static int nested_state_pre_save(void *opaque)
+{
+    CPUPPCState *env = opaque;
+
+    env->spr[SPR_LR] = env->lr;
+    env->spr[SPR_CTR] = env->ctr;
+    env->spr[SPR_XER] = cpu_read_xer(env);
+    env->spr[SPR_CFAR] = env->cfar;
+
+    return 0;
+}
+
+static int nested_state_post_load(void *opaque, int version_id)
+{
+    CPUPPCState *env = opaque;
+
+    env->lr = env->spr[SPR_LR];
+    env->ctr = env->spr[SPR_CTR];
+    cpu_write_xer(env, env->spr[SPR_XER]);
+    env->cfar = env->spr[SPR_CFAR];
+
+    return 0;
+}
+
+static const VMStateDescription vmstate_nested_host_state = {
+    .name = "spapr_nested_host_state",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .pre_save = nested_state_pre_save,
+    .post_load = nested_state_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINTTL_ARRAY(gpr, CPUPPCState, 32),
+        VMSTATE_UINTTL_ARRAY(spr, CPUPPCState, 1024),
+        VMSTATE_UINT32_ARRAY(crf, CPUPPCState, 8),
+        VMSTATE_UINTTL(nip, CPUPPCState),
+        VMSTATE_UINTTL(msr, CPUPPCState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static int nested_cpu_pre_load(void *opaque)
+{
+    SpaprCpuState *spapr_cpu = opaque;
+
+    spapr_cpu->nested_host_state = g_try_malloc(sizeof(CPUPPCState));
+    if (!spapr_cpu->nested_host_state) {
+        return -1;
+    }
+
+    return 0;
+}
+
+static const VMStateDescription vmstate_spapr_cpu_nested = {
+    .name = "spapr_cpu/nested",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = nested_needed,
+    .pre_load = nested_cpu_pre_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_BOOL(in_nested, SpaprCpuState),
+        VMSTATE_INT64(nested_tb_offset, SpaprCpuState),
+        VMSTATE_STRUCT_POINTER_V(nested_host_state, SpaprCpuState, 1,
+                                 vmstate_nested_host_state, CPUPPCState),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
 static const VMStateDescription vmstate_spapr_cpu_state = {
     .name = "spapr_cpu",
     .version_id = 1,
@@ -184,6 +259,7 @@ static const VMStateDescription vmstate_spapr_cpu_state = {
     },
     .subsections = (const VMStateDescription * []) {
         &vmstate_spapr_cpu_vpa,
+        &vmstate_spapr_cpu_nested,
         NULL
     }
 };
diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index 7ee1984500..ae09b1bcfe 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -10,6 +10,7 @@
 #include "kvm_ppc.h"
 #include "power8-pmu.h"
 #include "hw/ppc/ppc.h"
+#include "hw/ppc/spapr_cpu_core.h"
 
 static void post_load_update_msr(CPUPPCState *env)
 {
@@ -679,6 +680,48 @@ static const VMStateDescription vmstate_tb_env = {
     }
 };
 
+static const VMStateDescription vmstate_hdecr = {
+    .name = "cpu/hdecr",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(hdecr_next, ppc_tb_t),
+        VMSTATE_TIMER_PTR(hdecr_timer, ppc_tb_t),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static bool nested_needed(void *opaque)
+{
+    PowerPCCPU *cpu = opaque;
+    SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
+
+    return spapr_cpu->in_nested;
+}
+
+static int nested_pre_load(void *opaque)
+{
+    PowerPCCPU *cpu = opaque;
+    CPUPPCState *env = &cpu->env;
+
+    cpu_ppc_hdecr_init(env);
+
+    return 0;
+}
+
+static const VMStateDescription vmstate_nested = {
+    .name = "cpu/nested-guest",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = nested_needed,
+    .pre_load = nested_pre_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_STRUCT_POINTER_V(env.tb_env, PowerPCCPU, 1,
+                                 vmstate_hdecr, ppc_tb_t),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 const VMStateDescription vmstate_ppc_cpu = {
     .name = "cpu",
     .version_id = 5,
@@ -734,6 +777,7 @@ const VMStateDescription vmstate_ppc_cpu = {
         &vmstate_tlbemb,
         &vmstate_tlbmas,
         &vmstate_compat,
+        &vmstate_nested,
         NULL
     }
 };
-- 
2.34.1


