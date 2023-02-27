Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FF06A4728
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 17:38:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWgVY-00030l-5f; Mon, 27 Feb 2023 11:37:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1pWgVV-0002j4-Rw; Mon, 27 Feb 2023 11:37:45 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1pWgVT-00062f-Tf; Mon, 27 Feb 2023 11:37:45 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31RG0Hlw016059; Mon, 27 Feb 2023 16:37:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2022-7-12;
 bh=MY/Hp75oUkJeqqko38o6PiXQ5XHBs3q3+IV+XABHZfc=;
 b=GXSalOoF8uocW+TddR2P43MxG08tv0aO36NITY4RLAD8OH9Dd70OyfXJY3sT554FAOpT
 OD9YBKemyDUHWMmR2VIeuWv8AHi1MqrUdEYvFuwRO1U/OCmlvnPahrM0KoKp+FhXvTPi
 UBODvnZ1GBl0kDe1gS22LXoQFTbPmv+U72/YvBYFgbWbkF12lhH5V9WsugYoM2z24C23
 vSIGwcwanPIr2/RAXSQfmmaO09byUG1wfiQ3YKIThtSGAvuWiYQSbgEUYEtnBr8JPVDR
 Qp8HcEED0eAAks2SOl6H5SUvqVvOf0R7TUcxOP9gWeO34I9HxYkqlBJHF43i0LsVtqJ7 PA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nyb9ac1ap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Feb 2023 16:37:38 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31RFbEkh015909; Mon, 27 Feb 2023 16:37:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ny8s5sy54-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Feb 2023 16:37:36 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31RGbMkM006629;
 Mon, 27 Feb 2023 16:37:36 GMT
Received: from mlluis-mac.uk.oracle.com (dhcp-10-175-167-110.vpn.oracle.com
 [10.175.167.110])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3ny8s5sxr5-5; Mon, 27 Feb 2023 16:37:35 +0000
From: Miguel Luis <miguel.luis@oracle.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Haibo Xu <haibo.xu@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Marc Zyngier <maz@kernel.org>
Cc: Miguel Luis <miguel.luis@oracle.com>
Subject: [RFC PATCH 4/5] target/arm: enable feature ARM_FEATURE_EL2 if EL2 is
 supported
Date: Mon, 27 Feb 2023 15:37:17 -0100
Message-Id: <20230227163718.62003-5-miguel.luis@oracle.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230227163718.62003-1-miguel.luis@oracle.com>
References: <20230227163718.62003-1-miguel.luis@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-27_13,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 adultscore=0
 mlxlogscore=848 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302270129
X-Proofpoint-GUID: cC2HwgQEuHnTm-r5vJdjVQCFKpTzDoOY
X-Proofpoint-ORIG-GUID: cC2HwgQEuHnTm-r5vJdjVQCFKpTzDoOY
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=miguel.luis@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Haibo Xu <haibo.xu@linaro.org>

KVM_CAP_ARM_EL2 must be supported by the cpu to enable ARM_FEATURE_EL2.
EL2 bits on ID_AA64PFR0 state unsupported on the value 0b0000.

Ref: https://lore.kernel.org/qemu-devel/b7c2626e6c720ccc43e57197dff3dac72d613640.1616052890.git.haibo.xu@linaro.org/

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
[Miguel Luis: use of ID_AA64PFR0 for cpu features]
Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
---
 target/arm/cpu.h   |  2 +-
 target/arm/kvm64.c | 16 ++++++++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9aeed3c848..de2a88b43e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3961,7 +3961,7 @@ static inline bool isar_feature_aa64_aa32_el1(const ARMISARegisters *id)
 
 static inline bool isar_feature_aa64_aa32_el2(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, EL2) >= 2;
+    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, EL2) != 0;
 }
 
 static inline bool isar_feature_aa64_ras(const ARMISARegisters *id)
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index be8144a2b5..f7ebd731aa 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -505,6 +505,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
      */
     int fdarray[3];
     bool sve_supported;
+    bool el2_supported;
     bool pmu_supported = false;
     uint64_t features = 0;
     int err;
@@ -535,6 +536,14 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         init.features[0] |= 1 << KVM_ARM_VCPU_SVE;
     }
 
+    /*
+     * Ask for EL2 if supported.
+     */
+    el2_supported = kvm_arm_el2_supported();
+    if (el2_supported) {
+        init.features[0] |= 1 << KVM_ARM_VCPU_HAS_EL2;
+    }
+
     /*
      * Ask for Pointer Authentication if supported, so that we get
      * the unsanitized field values for AA64ISAR1_EL1.
@@ -714,6 +723,10 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     features |= 1ULL << ARM_FEATURE_PMU;
     features |= 1ULL << ARM_FEATURE_GENERIC_TIMER;
 
+    if (el2_supported) {
+        features |= 1ULL << ARM_FEATURE_EL2;
+    }
+
     ahcf->features = features;
 
     return true;
@@ -881,6 +894,9 @@ int kvm_arch_init_vcpu(CPUState *cs)
         assert(kvm_arm_sve_supported());
         cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_SVE;
     }
+    if (cpu_isar_feature(aa64_aa32_el2, cpu)) {
+        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_HAS_EL2;
+    }
     if (cpu_isar_feature(aa64_pauth, cpu)) {
         cpu->kvm_init_features[0] |= (1 << KVM_ARM_VCPU_PTRAUTH_ADDRESS |
                                       1 << KVM_ARM_VCPU_PTRAUTH_GENERIC);
-- 
2.39.2


