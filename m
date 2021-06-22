Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 966183B0E87
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 22:21:09 +0200 (CEST)
Received: from localhost ([::1]:36312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvmtQ-00071x-Kw
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 16:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lvmrw-0004sY-Ie; Tue, 22 Jun 2021 16:19:36 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:15376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lvmru-0003TR-HY; Tue, 22 Jun 2021 16:19:36 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15MK4GoA071190; Tue, 22 Jun 2021 16:19:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=BgvrBUCrH6bl2JrWgHm/P4kCR7kyw4vlqqC3reUyT8Q=;
 b=MzBPX06fdplyInvCmZ9KJBXqy/srgjQ+wHbl3CZpVzRrlZw0BV7pbXud5ecSxkzRm5zd
 hv6cBTdYRkUHGvLlCvgTBmj8MDxO61kZgtbmZkSy7ZW4FxkHshEPFV7ByDEGDRxbTSZT
 00vlgBI+pg9hvg8v0UJcKNSH0sTkLup6TvjyC21L0anZzbzZPN9WlV1F9yfQbBraDyZV
 oREV0qrOGpivZYL+bau9oyTl86p+cZVZCR0Vsd8IWreWGnJkd8QesJB7dvXIbTtR4Vng
 1pRz1s2R3i5rKqoZ3X40Wo+nmJAMzjmMPUJk75KZO03LvuGbJl/JQI/pfNrZKUZSYKtT mQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39bngra4yu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 16:19:30 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15MK4OAt072452;
 Tue, 22 Jun 2021 16:19:30 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39bngra4xu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 16:19:30 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15MKElNU031059;
 Tue, 22 Jun 2021 20:19:27 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3997uh9mkc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 20:19:27 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15MKJOXK14811566
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 20:19:24 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 46CE85205A;
 Tue, 22 Jun 2021 20:19:24 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 2F23F52057;
 Tue, 22 Jun 2021 20:19:24 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 25651)
 id E9284E0407; Tue, 22 Jun 2021 22:19:23 +0200 (CEST)
From: Christian Borntraeger <borntraeger@de.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH 1/1] s390x/cpumodel: add 3931 and 3932
Date: Tue, 22 Jun 2021 22:19:23 +0200
Message-Id: <20210622201923.150205-2-borntraeger@de.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622201923.150205-1-borntraeger@de.ibm.com>
References: <20210622201923.150205-1-borntraeger@de.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UwbzXAIYL4ceP0oNVAp4jdLDoFyVmel-
X-Proofpoint-GUID: m9FXyp3btruGFgN1Wqi7QMybI3QJzHNH
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-22_12:2021-06-22,
 2021-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106220121
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This defines 5 new facilities and the new 3931 and 3932 machines.
As before the name is not yet known and we do use gen16a and gen16b.
The new features are part of the full model.

The default model is still empty (same as z15) and will be added
in a separate patch at a later point in time.

Also add the dependencies of new facilities and as a fix for z15 add
a dependency from S390_FEAT_VECTOR_PACKED_DECIMAL_ENH to
S390_VECTOR_PACKED_DECIMAL.

Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
---
 target/s390x/cpu_features_def.h.inc |  5 +++++
 target/s390x/cpu_models.c           |  6 ++++++
 target/s390x/gen-features.c         | 14 ++++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/target/s390x/cpu_features_def.h.inc b/target/s390x/cpu_features_def.h.inc
index 7db3449e0434..c71caee74411 100644
--- a/target/s390x/cpu_features_def.h.inc
+++ b/target/s390x/cpu_features_def.h.inc
@@ -109,6 +109,11 @@ DEF_FEAT(VECTOR_PACKED_DECIMAL_ENH, "vxpdeh", STFL, 152, "Vector-Packed-Decimal-
 DEF_FEAT(MSA_EXT_9, "msa9-base", STFL, 155, "Message-security-assist-extension-9 facility (excluding subfunctions)")
 DEF_FEAT(ETOKEN, "etoken", STFL, 156, "Etoken facility")
 DEF_FEAT(UNPACK, "unpack", STFL, 161, "Unpack facility")
+DEF_FEAT(NNPA, "nnpa", STFL, 165, "NNPA facility")
+DEF_FEAT(VECTOR_PACKED_DECIMAL_ENH2, "vxpdeh2", STFL, 192, "Vector-Packed-Decimal-Enhancement facility 2")
+DEF_FEAT(BEAR, "bear", STFL, 193, "BEAR-enhancement facility")
+DEF_FEAT(RDP, "rdp", STFL, 194, "Reset-DAT-protection facility")
+DEF_FEAT(ACTIVITY, "activity", STFL, 196, "Processor-Activity-Instrumentation facility")
 
 /* Features exposed via SCLP SCCB Byte 80 - 98  (bit numbers relative to byte-80) */
 DEF_FEAT(SIE_GSLS, "gsls", SCLP_CONF_CHAR, 40, "SIE: Guest-storage-limit-suppression facility")
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 94090a6e223d..9699823b2074 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -88,6 +88,8 @@ static S390CPUDef s390_cpu_defs[] = {
     CPUDEF_INIT(0x3907, 14, 1, 47, 0x08000000U, "z14ZR1", "IBM z14 Model ZR1 GA1"),
     CPUDEF_INIT(0x8561, 15, 1, 47, 0x08000000U, "gen15a", "IBM z15 T01 GA1"),
     CPUDEF_INIT(0x8562, 15, 1, 47, 0x08000000U, "gen15b", "IBM z15 T02 GA1"),
+    CPUDEF_INIT(0x3931, 16, 1, 47, 0x08000000U, "gen16a", "IBM 3931 GA1"),
+    CPUDEF_INIT(0x3932, 16, 1, 47, 0x08000000U, "gen16b", "IBM 3932 GA1"),
 };
 
 #define QEMU_MAX_CPU_TYPE 0x3906
@@ -812,6 +814,8 @@ static void check_consistency(const S390CPUModel *model)
         { S390_FEAT_MSA_EXT_9, S390_FEAT_MSA_EXT_4 },
         { S390_FEAT_MULTIPLE_EPOCH, S390_FEAT_TOD_CLOCK_STEERING },
         { S390_FEAT_VECTOR_PACKED_DECIMAL, S390_FEAT_VECTOR },
+        { S390_FEAT_VECTOR_PACKED_DECIMAL_ENH, S390_FEAT_VECTOR_PACKED_DECIMAL },
+        { S390_FEAT_VECTOR_PACKED_DECIMAL_ENH2, S390_FEAT_VECTOR_PACKED_DECIMAL_ENH },
         { S390_FEAT_VECTOR_ENH, S390_FEAT_VECTOR },
         { S390_FEAT_INSTRUCTION_EXEC_PROT, S390_FEAT_SIDE_EFFECT_ACCESS_ESOP2 },
         { S390_FEAT_SIDE_EFFECT_ACCESS_ESOP2, S390_FEAT_ESOP },
@@ -843,6 +847,8 @@ static void check_consistency(const S390CPUModel *model)
         { S390_FEAT_PTFF_STOUE, S390_FEAT_MULTIPLE_EPOCH },
         { S390_FEAT_AP_QUEUE_INTERRUPT_CONTROL, S390_FEAT_AP },
         { S390_FEAT_DIAG_318, S390_FEAT_EXTENDED_LENGTH_SCCB },
+        { S390_FEAT_NNPA, S390_FEAT_VECTOR },
+        { S390_FEAT_RDP, S390_FEAT_LOCAL_TLB_CLEARING },
     };
     int i;
 
diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
index 242c95ede48a..a7396d3d5f30 100644
--- a/target/s390x/gen-features.c
+++ b/target/s390x/gen-features.c
@@ -424,6 +424,8 @@ static uint16_t base_GEN15_GA1[] = {
     S390_FEAT_MISC_INSTRUCTION_EXT3,
 };
 
+#define base_GEN16_GA1 EmptyFeat
+
 /* Full features (in order of release)
  * Automatically includes corresponding base features.
  * Full features are all features this hardware supports even if kvm/QEMU do not
@@ -567,6 +569,15 @@ static uint16_t full_GEN15_GA1[] = {
     S390_FEAT_UNPACK,
 };
 
+static uint16_t full_GEN16_GA1[] = {
+    S390_FEAT_NNPA,
+    S390_FEAT_VECTOR_PACKED_DECIMAL_ENH2,
+    S390_FEAT_BEAR,
+    S390_FEAT_RDP,
+    S390_FEAT_ACTIVITY,
+};
+
+
 /* Default features (in order of release)
  * Automatically includes corresponding base features.
  * Default features are all features this version of QEMU supports for this
@@ -652,6 +663,8 @@ static uint16_t default_GEN15_GA1[] = {
     S390_FEAT_ETOKEN,
 };
 
+#define default_GEN16_GA1 EmptyFeat
+
 /* QEMU (CPU model) features */
 
 static uint16_t qemu_V2_11[] = {
@@ -785,6 +798,7 @@ static CpuFeatDefSpec CpuFeatDef[] = {
     CPU_FEAT_INITIALIZER(GEN14_GA1),
     CPU_FEAT_INITIALIZER(GEN14_GA2),
     CPU_FEAT_INITIALIZER(GEN15_GA1),
+    CPU_FEAT_INITIALIZER(GEN16_GA1),
 };
 
 #define FEAT_GROUP_INITIALIZER(_name)                  \
-- 
2.31.1


