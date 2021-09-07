Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 218ED4026E9
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 12:11:47 +0200 (CEST)
Received: from localhost ([::1]:36898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNY4w-000134-81
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 06:11:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mNY3n-0000E8-0g; Tue, 07 Sep 2021 06:10:35 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:6712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mNY3j-0000yw-SC; Tue, 07 Sep 2021 06:10:33 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 187A3l3q185693; Tue, 7 Sep 2021 06:10:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=XUqkUSOX37ZL93jdH72YJ0ZPzJyNn87kCFmMjEb2klc=;
 b=PphCY1qRT2SR9yN06W/Pvh3bcQIlZMFtAZmhXw9TsG3w0zm/VjhBBavM4rdap64wNZyY
 S37+mo2/Q7RIDKRlp2jaODXD+8OOroYopc0ClUdcb8lAKN6KrNDE4GWaHZfOQ2hxyZgW
 xRXgQj0aatA4E1UXNZ9usb03SsnsyETtjjGKHke38lzFUfHhXcHwDdGtg2rFzMpdTX4+
 Y3fNs9H6ZTv0E6beBUZHkKgLWPrko93i7B+aQA4isDdim/8NFtoPDsCQjafSutIp4HAB
 +p+EIjvy0xG8d8DnRlgSx552t7+vUt52BnUVfYhW5pHYkzELYD/Z35N24H5y4a4oDugG +g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ax46mk49e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 06:10:27 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 187A4Qik188800;
 Tue, 7 Sep 2021 06:10:27 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ax46mk48u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 06:10:27 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1879w3wN015364;
 Tue, 7 Sep 2021 10:10:25 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3av02jnmhp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 10:10:24 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 187AAK5i11993466
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Sep 2021 10:10:20 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4DED752052;
 Tue,  7 Sep 2021 10:10:20 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 3D8ED5204F;
 Tue,  7 Sep 2021 10:10:20 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 25651)
 id B03D6E0414; Tue,  7 Sep 2021 12:10:19 +0200 (CEST)
From: Christian Borntraeger <borntraeger@de.ibm.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2] s390x/cpumodel: Add more feature to gen16 default model
Date: Tue,  7 Sep 2021 10:10:17 +0000
Message-Id: <20210907101017.27126-1-borntraeger@de.ibm.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2_3tX1nnT1x32V3-eX1kEf4r8e21ai6K
X-Proofpoint-ORIG-GUID: VmpacU1jth-3OnY4oadiawmLbUEvhA7K
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-07_03:2021-09-07,
 2021-09-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 impostorscore=0 mlxscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2108310000 definitions=main-2109070067
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
index 4d25278cf20e..61aeccb163f7 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -803,6 +803,11 @@ DEFINE_CCW_MACHINE(6_2, "6.2", true);
 static void ccw_machine_6_1_instance_options(MachineState *machine)
 {
     ccw_machine_6_2_instance_options(machine);
+    s390_cpudef_featoff_greater(16, 1, S390_FEAT_NNPA);
+    s390_cpudef_featoff_greater(16, 1, S390_FEAT_VECTOR_PACKED_DECIMAL_ENH2);
+    s390_cpudef_featoff_greater(16, 1, S390_FEAT_BEAR_ENH);
+    s390_cpudef_featoff_greater(16, 1, S390_FEAT_RDP);
+    s390_cpudef_featoff_greater(16, 1, S390_FEAT_PAI);
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


