Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69972581AC9
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 22:14:09 +0200 (CEST)
Received: from localhost ([::1]:52144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGQwS-00047m-GQ
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 16:14:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1oGQg1-00023y-35; Tue, 26 Jul 2022 15:57:09 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:8854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1oGQfz-0007Hm-6J; Tue, 26 Jul 2022 15:57:08 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26QJs3Xr004262;
 Tue, 26 Jul 2022 19:57:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=uPgi82Drif+3cwvWk15HIHzg6ihS286bFOjMDYCXYYk=;
 b=iQyoA8fcHtL6jVnscmVmKxAZ3cYn4v61Q6foDEoqnzksrXBRniL0n/gzUy5seXUrDgdV
 vSvp05E1AkgiHtUblmKLSt9tgUnYSS/SH9GUCBjoyBMdu2RoV5YyJsciz7BW1lV8A4PN
 ejSSyjNI4Lt2BccSTx6nr3TgdvLviYKWTdkH4XQGa/unzMx+1En8FUcGQtinpeYZNrUY
 k9396tjEAAgmW0FLNNy8mgehJHMr4RvdurknioMYXjfSz4lYu8cHCwRDBDY6AbOiNSv6
 FYLfap457Lm3sABZevH5s1KjwIOw+JCW61mr8sJymMf7kBhFIzQW50CJw9Ucyk5hYEnc Ow== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hjpu201ym-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 19:57:01 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26QJusfJ016049;
 Tue, 26 Jul 2022 19:57:01 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hjpu201xu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 19:57:00 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26QJqFFt016724;
 Tue, 26 Jul 2022 19:56:58 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 3hg95yb4xs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 19:56:58 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 26QJsukY22479316
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 19:54:56 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 996F64C044;
 Tue, 26 Jul 2022 19:56:55 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8668B4C040;
 Tue, 26 Jul 2022 19:56:55 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 26 Jul 2022 19:56:55 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 25651)
 id 3538EE01EA; Tue, 26 Jul 2022 21:48:53 +0200 (CEST)
From: Christian Borntraeger <borntraeger@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH] s390x/cpumodel: add stfl197
 processor-activity-instrumentation extension 1
Date: Tue, 26 Jul 2022 21:48:52 +0200
Message-Id: <20220726194852.171039-1-borntraeger@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: a9EB9pXOgjJTZHzsiOMo9F73aP7z81sV
X-Proofpoint-ORIG-GUID: 9DS0qMs1WXT_H53haMd7t1022Y2Gbhp4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_06,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207260075
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
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

Add stfle 197 (processor-activity-instrumentation extension 1) to the
gen16 default model and fence it off for 7.0 and older.

Signed-off-by: Christian Borntraeger <borntraeger@linux.ibm.com>
---
 hw/s390x/s390-virtio-ccw.c          | 1 +
 target/s390x/cpu_features_def.h.inc | 1 +
 target/s390x/gen-features.c         | 2 ++
 3 files changed, 4 insertions(+)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index cc3097bfee80..6268aa5d0888 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -806,6 +806,7 @@ static void ccw_machine_7_0_instance_options(MachineState *machine)
     static const S390FeatInit qemu_cpu_feat = { S390_FEAT_LIST_QEMU_V7_0 };
 
     ccw_machine_7_1_instance_options(machine);
+    s390_cpudef_featoff_greater(16, 1, S390_FEAT_PAIE);
     s390_set_qemu_cpu_model(0x8561, 15, 1, qemu_cpu_feat);
 }
 
diff --git a/target/s390x/cpu_features_def.h.inc b/target/s390x/cpu_features_def.h.inc
index 3603e5fb12c6..e3cfe637354b 100644
--- a/target/s390x/cpu_features_def.h.inc
+++ b/target/s390x/cpu_features_def.h.inc
@@ -114,6 +114,7 @@ DEF_FEAT(VECTOR_PACKED_DECIMAL_ENH2, "vxpdeh2", STFL, 192, "Vector-Packed-Decima
 DEF_FEAT(BEAR_ENH, "beareh", STFL, 193, "BEAR-enhancement facility")
 DEF_FEAT(RDP, "rdp", STFL, 194, "Reset-DAT-protection facility")
 DEF_FEAT(PAI, "pai", STFL, 196, "Processor-Activity-Instrumentation facility")
+DEF_FEAT(PAIE, "paie", STFL, 197, "Processor-Activity-Instrumentation extension-1")
 
 /* Features exposed via SCLP SCCB Byte 80 - 98  (bit numbers relative to byte-80) */
 DEF_FEAT(SIE_GSLS, "gsls", SCLP_CONF_CHAR, 40, "SIE: Guest-storage-limit-suppression facility")
diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
index ad140184b903..1558c5262616 100644
--- a/target/s390x/gen-features.c
+++ b/target/s390x/gen-features.c
@@ -575,6 +575,7 @@ static uint16_t full_GEN16_GA1[] = {
     S390_FEAT_BEAR_ENH,
     S390_FEAT_RDP,
     S390_FEAT_PAI,
+    S390_FEAT_PAIE,
 };
 
 
@@ -669,6 +670,7 @@ static uint16_t default_GEN16_GA1[] = {
     S390_FEAT_BEAR_ENH,
     S390_FEAT_RDP,
     S390_FEAT_PAI,
+    S390_FEAT_PAIE,
 };
 
 /* QEMU (CPU model) features */
-- 
2.36.1


