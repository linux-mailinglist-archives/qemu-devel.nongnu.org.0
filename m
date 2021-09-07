Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F28402605
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 11:13:37 +0200 (CEST)
Received: from localhost ([::1]:36816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNXAe-0002pO-GL
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 05:13:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mNX8r-0000lQ-NU; Tue, 07 Sep 2021 05:11:45 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:58814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mNX8o-0002lM-SP; Tue, 07 Sep 2021 05:11:45 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 18794E9u112150; Tue, 7 Sep 2021 05:11:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=sNRILhrFuTtZdrI9mFAfp8qRKuTG6bK9tkxaCpDSul8=;
 b=p57bGYyolFgIqir4sBVXiXgL5xcJO18/Ay5v5wFCSQdd4kSCc/J5iSfpBVx+PEQ9tuW4
 NkWIyKeUZ7EXO0z0z6d2pW2qDc8T3wQo5F3P/mXllJek7+6a9pZZaQtLwVpbhreVcl4P
 nhApEqIGtEzjDUrLvPxXUJ7FUCe7HchWIYq7qScuJtdgsCACRqNt/IAy82Z+vSnZw3KB
 Ia0Wwj84OukXjxglqZIm/vA7eQqk0/gcQsfAmBa/ZB5EyCcaEYpkbSUIyqG8K/6sBqj9
 h9LzM6wi3RgNqkNBPmM+cQI7wOt5JQEzH+7UhDDy7vQ+UTLeKqvv72P6n6YjYyEcUeEV Pg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ax51y8d5p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 05:11:38 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18794sJV114364;
 Tue, 7 Sep 2021 05:11:38 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ax51y8d55-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 05:11:37 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 187923MY010403;
 Tue, 7 Sep 2021 09:11:35 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3av0e9ctqx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 09:11:35 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 18797FSn51708250
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Sep 2021 09:07:15 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0AC111C058;
 Tue,  7 Sep 2021 09:11:30 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A872911C04A;
 Tue,  7 Sep 2021 09:11:30 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue,  7 Sep 2021 09:11:30 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 25651)
 id BAA18E0414; Tue,  7 Sep 2021 11:11:29 +0200 (CEST)
From: Christian Borntraeger <borntraeger@de.ibm.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [PATCH] s390x/cpumodel: Add more feature to gen16 default model
Date: Tue,  7 Sep 2021 09:11:28 +0000
Message-Id: <20210907091128.25051-1-borntraeger@de.ibm.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6xWqWe01L54Q2NvDSml9CTIPcN66qf-o
X-Proofpoint-GUID: ExSoPEbPA8RTNH-dCsYMBrq9W7u-4iJr
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-07_03:2021-09-03,
 2021-09-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 phishscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109070056
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the new gen16 features to the default model and fence them for
machine version 6.1 and earlier.

Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
---
 hw/s390x/s390-virtio-ccw.c  | 5 +++++
 target/s390x/gen-features.c | 8 +++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 4d25278cf20e..72573ec66e84 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -803,6 +803,11 @@ DEFINE_CCW_MACHINE(6_2, "6.2", true);
 static void ccw_machine_6_1_instance_options(MachineState *machine)
 {
     ccw_machine_6_2_instance_options(machine);
+    s390_cpudef_featoff_greater(12, 1, S390_FEAT_NNPA);
+    s390_cpudef_featoff_greater(12, 1, S390_FEAT_VECTOR_PACKED_DECIMAL_ENH2);
+    s390_cpudef_featoff_greater(12, 1, S390_FEAT_BEAR_ENH);
+    s390_cpudef_featoff_greater(12, 1, S390_FEAT_RDP);
+    s390_cpudef_featoff_greater(12, 1, S390_FEAT_PAI);
 }
 
 static void ccw_machine_6_1_class_options(MachineClass *mc)
diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
index 7d85322d6814..7cb1a6ec10be 100644
--- a/target/s390x/gen-features.c
+++ b/target/s390x/gen-features.c
@@ -663,7 +663,13 @@ static uint16_t default_GEN15_GA1[] = {
     S390_FEAT_ETOKEN,
 };
 
-#define default_GEN16_GA1 EmptyFeat
+static uint16_t default_GEN16_GA1[] = {
+    S390_FEAT_NNPA,
+    S390_FEAT_VECTOR_PACKED_DECIMAL_ENH2,
+    S390_FEAT_BEAR_ENH,
+    S390_FEAT_RDP,
+    S390_FEAT_PAI,
+};
 
 /* QEMU (CPU model) features */
 
-- 
2.32.0


