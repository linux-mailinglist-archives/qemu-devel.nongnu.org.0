Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CB740F73E
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 14:08:54 +0200 (CEST)
Received: from localhost ([::1]:36504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRCfk-0002we-EH
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 08:08:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mRCe4-0001VU-Nv; Fri, 17 Sep 2021 08:07:08 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:4062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mRCe0-0005ea-7i; Fri, 17 Sep 2021 08:07:08 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18HBDvT4002866; 
 Fri, 17 Sep 2021 08:07:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=ZgTfM7xudK910Oe2/b23jWLKMN8urtJm1aideuCul5A=;
 b=D3Ut9g5AVN6fByv/Tvb80v0s9M9/CYhrAD5LaGccY0JIdQnKzT31f1FyD+Vmq+UCwKjN
 rTg/VrxRCk3a4uY/ZFH2jMsApFCSTPmV3kY2JsBvM/vbikJf6rAwHSu8tPo20tW6U+qB
 zF0u4tXBkm0bHIs6M0D/OJgE4rLYTCXwBFeRI49vsdIScxFfV+uGKGoJVwaly2RHyd3l
 PXFs40EHKTR5WL1mtRdUOlkzAyj6BZPQYDSE+ILBPJjIBZgNYrW2GVvs0cU7lUj8cWiu
 sYk6aUURKjHUN/kCNM1AiqZ7DGlWoEoR1uMKqvM7ouv5F9il5d7gHGKW0wpA/KPbdJ8e dA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b4mfv0svd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Sep 2021 08:07:01 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18HBwBOj022045;
 Fri, 17 Sep 2021 08:07:01 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b4mfv0suk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Sep 2021 08:07:01 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18HC3wf3011087;
 Fri, 17 Sep 2021 12:06:59 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 3b0m3av46a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Sep 2021 12:06:59 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18HC6tAk47579524
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Sep 2021 12:06:55 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9530111C082;
 Fri, 17 Sep 2021 12:06:55 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1158411C04A;
 Fri, 17 Sep 2021 12:06:55 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.70.78])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 17 Sep 2021 12:06:54 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-s390x@nongnu.org
Subject: [PATCH 1/1] s390x:clp: implementing CLP immediate commands
Date: Fri, 17 Sep 2021 14:06:53 +0200
Message-Id: <1631880413-20655-2-git-send-email-pmorel@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1631880413-20655-1-git-send-email-pmorel@linux.ibm.com>
References: <1631880413-20655-1-git-send-email-pmorel@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tylTsEdqjGgtsW4-UNaJ8fGFRnQ3EImR
X-Proofpoint-ORIG-GUID: 7VPAZcdbjuMekXQDJEaL12j_zNTFp9_5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-17_05,2021-09-17_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 mlxlogscore=992 priorityscore=1501 spamscore=0 mlxscore=0 malwarescore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109170077
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
Cc: thuth@redhat.com, mjrosato@linux.ibm.com, david@redhat.com,
 farman@linux.ibm.com, cohuck@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CLP immediate commands allow to query the Logical Processor
available on the machine and to check for a specific one.

Let's add these commands.

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
---
 hw/s390x/s390-pci-inst.c         | 33 ++++++++++++++++++++++++++++++++
 include/hw/s390x/s390-pci-inst.h |  5 +++++
 target/s390x/kvm/kvm.c           |  6 ++++++
 3 files changed, 44 insertions(+)

diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 1c8ad91175..9fd0669591 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -156,6 +156,39 @@ out:
     return rc;
 }
 
+int clp_immediate_cmd(S390CPU *cpu, uint8_t r1, uint8_t r2, uint8_t i3,
+                      uintptr_t ra)
+{
+    CPUS390XState *env = &cpu->env;
+
+    switch (r2) {
+    case 0: /* Command Check */
+        switch (i3 & 0x07) {
+        case CLP_LPS_PCI: /* PCI */
+            if (!s390_has_feat(S390_FEAT_ZPCI)) {
+                setcc(cpu, 3);
+                return 0;
+            }
+            /* fallthrough */
+        case CLP_LPS_BASE: /* Base LP */
+            setcc(cpu, 0);
+            return 0;
+        }
+        setcc(cpu, 3);
+        return 0;
+    case 1: /* Command Query */
+        env->regs[r1] = CLP_QUERY_LP_BASE;
+        if (s390_has_feat(S390_FEAT_ZPCI)) {
+            env->regs[r1] |= CLP_QUERY_LP_BASE >> CLP_LPS_PCI;
+        }
+        setcc(cpu, 0);
+        return 0;
+    }
+
+    s390_program_interrupt(env, PGM_SPECIFICATION, ra);
+    return 0;
+}
+
 int clp_service_call(S390CPU *cpu, uint8_t r2, uintptr_t ra)
 {
     ClpReqHdr *reqh;
diff --git a/include/hw/s390x/s390-pci-inst.h b/include/hw/s390x/s390-pci-inst.h
index a55c448aad..07721b08da 100644
--- a/include/hw/s390x/s390-pci-inst.h
+++ b/include/hw/s390x/s390-pci-inst.h
@@ -101,6 +101,11 @@ typedef struct ZpciFib {
 int pci_dereg_irqs(S390PCIBusDevice *pbdev);
 void pci_dereg_ioat(S390PCIIOMMU *iommu);
 int clp_service_call(S390CPU *cpu, uint8_t r2, uintptr_t ra);
+#define CLP_LPS_BASE 0
+#define CLP_LPS_PCI  2
+#define CLP_QUERY_LP_BASE (1UL << 63)
+int clp_immediate_cmd(S390CPU *cpu, uint8_t r1, uint8_t r2, uint8_t i3,
+                      uintptr_t ra);
 int pcilg_service_call(S390CPU *cpu, uint8_t r1, uint8_t r2, uintptr_t ra);
 int pcistg_service_call(S390CPU *cpu, uint8_t r1, uint8_t r2, uintptr_t ra);
 int rpcit_service_call(S390CPU *cpu, uint8_t r1, uint8_t r2, uintptr_t ra);
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 0a5f2aced2..af1316372d 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -1345,7 +1345,13 @@ static uint64_t get_base_disp_rsy(S390CPU *cpu, struct kvm_run *run,
 
 static int kvm_clp_service_call(S390CPU *cpu, struct kvm_run *run)
 {
+    uint8_t r1 = (run->s390_sieic.ipb & 0x00f00000) >> 20;
     uint8_t r2 = (run->s390_sieic.ipb & 0x000f0000) >> 16;
+    uint8_t i3 = (run->s390_sieic.ipb & 0xff000000) >> 24;
+
+    if (i3 & 0x80) {
+        return clp_immediate_cmd(cpu, r1, r2, i3, RA_IGNORED);
+    }
 
     if (s390_has_feat(S390_FEAT_ZPCI)) {
         return clp_service_call(cpu, r2, RA_IGNORED);
-- 
2.25.1


