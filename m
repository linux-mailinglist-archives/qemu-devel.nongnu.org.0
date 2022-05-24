Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB1153318A
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 21:08:18 +0200 (CEST)
Received: from localhost ([::1]:53486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntZtB-00058b-HF
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 15:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1ntZoa-0001Wc-QC; Tue, 24 May 2022 15:03:32 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:33952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1ntZoX-0005mp-Up; Tue, 24 May 2022 15:03:32 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24OIotOB015922;
 Tue, 24 May 2022 19:03:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Hj+QDYKcD5HhNTVOhOc8oHAl3/ZVKIKF4QRNBFEWG8A=;
 b=ryKxCeZwFsjUalaVeS2KayoWdzertZHSugaNjSX6Ib/Xq5y29e6/CbvU5iGuXk6zepHJ
 iV+6q1vO/ces/I4CU9WhpZo3R2OmWUd2V+HH86UgDstgABg2s+JBDVCQnbLacTO4BCSt
 9nz6m+AuhybM3hDzUqKn9GApg4TINp8KIw27cG+yCzD5zz8bhSWTUHTNOv+8LsGididO
 YPja3TQex1txQ320tpD82mt+/OQMAFz1W1CooZ3dG1IvOVnsEZK4qeFYq/Sj9fgfnMOe
 oQ3HNfEhvM5cDxw9RQi8v4AEcTFhWpctJTJr2zWAHQc7pUGEavJD/di0fwyKNseDPsRI bw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g950j07rf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 May 2022 19:03:26 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24OIsc0r006577;
 Tue, 24 May 2022 19:03:26 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g950j07qy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 May 2022 19:03:26 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24OJ2ug3015882;
 Tue, 24 May 2022 19:03:25 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02dal.us.ibm.com with ESMTP id 3g93v80q5c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 May 2022 19:03:25 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24OJ3NVF6226750
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 19:03:23 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C1ED212405B;
 Tue, 24 May 2022 19:03:23 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E603D124053;
 Tue, 24 May 2022 19:03:20 +0000 (GMT)
Received: from li-c92d2ccc-254b-11b2-a85c-a700b5bfb098.ibm.com.com (unknown
 [9.163.3.233]) by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 24 May 2022 19:03:20 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: qemu-s390x@nongnu.org
Cc: alex.williamson@redhat.com, schnelle@linux.ibm.com, cohuck@redhat.com,
 thuth@redhat.com, farman@linux.ibm.com, pmorel@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com, mst@redhat.com, pbonzini@redhat.com,
 qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH v6 2/8] target/s390x: add zpci-interp to cpu models
Date: Tue, 24 May 2022 15:02:59 -0400
Message-Id: <20220524190305.140717-3-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220524190305.140717-1-mjrosato@linux.ibm.com>
References: <20220524190305.140717-1-mjrosato@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XCLXCe5Q1CZH4dxGWh_l3m7KROLyetYR
X-Proofpoint-GUID: YH3Hb8iop2MBNhX1Yp3xxTHpf79vlkTZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-24_09,2022-05-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2205240094
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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

The zpci-interp feature is used to specify whether zPCI interpretation is
to be used for this guest.

Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 hw/s390x/s390-virtio-ccw.c          | 1 +
 target/s390x/cpu_features_def.h.inc | 1 +
 target/s390x/gen-features.c         | 2 ++
 target/s390x/kvm/kvm.c              | 1 +
 4 files changed, 5 insertions(+)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 047cca0487..b33310a135 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -806,6 +806,7 @@ static void ccw_machine_7_0_instance_options(MachineState *machine)
     static const S390FeatInit qemu_cpu_feat = { S390_FEAT_LIST_QEMU_V7_0 };
 
     ccw_machine_7_1_instance_options(machine);
+    s390_cpudef_featoff_greater(14, 1, S390_FEAT_ZPCI_INTERP);
     s390_set_qemu_cpu_model(0x8561, 15, 1, qemu_cpu_feat);
 }
 
diff --git a/target/s390x/cpu_features_def.h.inc b/target/s390x/cpu_features_def.h.inc
index e86662bb3b..4ade3182aa 100644
--- a/target/s390x/cpu_features_def.h.inc
+++ b/target/s390x/cpu_features_def.h.inc
@@ -146,6 +146,7 @@ DEF_FEAT(SIE_CEI, "cei", SCLP_CPU, 43, "SIE: Conditional-external-interception f
 DEF_FEAT(DAT_ENH_2, "dateh2", MISC, 0, "DAT-enhancement facility 2")
 DEF_FEAT(CMM, "cmm", MISC, 0, "Collaborative-memory-management facility")
 DEF_FEAT(AP, "ap", MISC, 0, "AP instructions installed")
+DEF_FEAT(ZPCI_INTERP, "zpci-interp", MISC, 0, "zPCI interpretation")
 
 /* Features exposed via the PLO instruction. */
 DEF_FEAT(PLO_CL, "plo-cl", PLO, 0, "PLO Compare and load (32 bit in general registers)")
diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
index c03ec2c9a9..f991646c01 100644
--- a/target/s390x/gen-features.c
+++ b/target/s390x/gen-features.c
@@ -554,6 +554,7 @@ static uint16_t full_GEN14_GA1[] = {
     S390_FEAT_HPMA2,
     S390_FEAT_SIE_KSS,
     S390_FEAT_GROUP_MULTIPLE_EPOCH_PTFF,
+    S390_FEAT_ZPCI_INTERP,
 };
 
 #define full_GEN14_GA2 EmptyFeat
@@ -650,6 +651,7 @@ static uint16_t default_GEN14_GA1[] = {
     S390_FEAT_GROUP_MSA_EXT_8,
     S390_FEAT_MULTIPLE_EPOCH,
     S390_FEAT_GROUP_MULTIPLE_EPOCH_PTFF,
+    S390_FEAT_ZPCI_INTERP,
 };
 
 #define default_GEN14_GA2 EmptyFeat
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 53098bf541..314b0a9039 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -2293,6 +2293,7 @@ static int kvm_to_feat[][2] = {
     { KVM_S390_VM_CPU_FEAT_PFMFI, S390_FEAT_SIE_PFMFI},
     { KVM_S390_VM_CPU_FEAT_SIGPIF, S390_FEAT_SIE_SIGPIF},
     { KVM_S390_VM_CPU_FEAT_KSS, S390_FEAT_SIE_KSS},
+    { KVM_S390_VM_CPU_FEAT_ZPCI_INTERP, S390_FEAT_ZPCI_INTERP },
 };
 
 static int query_cpu_feat(S390FeatBitmap features)
-- 
2.27.0


