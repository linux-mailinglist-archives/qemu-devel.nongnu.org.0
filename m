Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D033B8F0B
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 10:45:57 +0200 (CEST)
Received: from localhost ([::1]:45382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lysKa-0001qQ-4t
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 04:45:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lysIh-0008Er-LX; Thu, 01 Jul 2021 04:43:59 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:37548
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lysIf-0005pi-LQ; Thu, 01 Jul 2021 04:43:59 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1618YBbF070804; Thu, 1 Jul 2021 04:43:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=zhYplTQ8ssklJs0v0d4C3qonyvSJrAjQT1nO+EPO6lo=;
 b=bHguKcP/0aPBFtjYg0f8hJCUwTr+vYQnmFjP83JH+6RFOuaJwTHWWlnq4ZCG15TM6eo7
 a/MhyvKzOGJ84nb7MudUN+D0MXSLu8JKP7442o+v2NkvcpNvx8aDF0eBFcntNIPeyyaW
 TON0scXVJ7xvEF/gB+uMPkE1QbEebApN+y+CwJv7JIPZd4Mn8SyrcpcScQWWToDDw1Y8
 bL3dVoud4nOVslCNVRCoI2oJZG++N6MushITpTqUj3/gZC/BEggkBVIfjuU1n8Kf3VqF
 QaNyiuBHNoXIdlr/jV14TOyBD/epIE0C2U2EtXysNjf2Yxl/fDm9o2ZYBm7Fn3pTXaN0 2w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39h5mq7mxe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 04:43:55 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1618Yv2n073053;
 Thu, 1 Jul 2021 04:43:55 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39h5mq7mwb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 04:43:54 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1618buAQ024794;
 Thu, 1 Jul 2021 08:43:52 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 39duv8h6x9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 08:43:52 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1618hn9I24510838
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Jul 2021 08:43:49 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 746C1A4051;
 Thu,  1 Jul 2021 08:43:49 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F9D9A4070;
 Thu,  1 Jul 2021 08:43:49 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  1 Jul 2021 08:43:49 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 25651)
 id E9238E07E8; Thu,  1 Jul 2021 10:43:48 +0200 (CEST)
From: Christian Borntraeger <borntraeger@de.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH fixup] s390x: fixup for "s390x/cpumodel: add 3931 and 3932"
Date: Thu,  1 Jul 2021 10:43:48 +0200
Message-Id: <20210701084348.26556-1-borntraeger@de.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622201923.150205-1-borntraeger@de.ibm.com>
References: <20210622201923.150205-1-borntraeger@de.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Nt8oquzKMvBAHnIpnmKcQu-wArsakrRs
X-Proofpoint-GUID: GD4M5R2stcub3jofB_ccjEMSLh0syd5Y
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_01:2021-06-30,
 2021-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 mlxscore=0 impostorscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107010058
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

as discussed we want to change some facility names. Please merge

Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
---
 target/s390x/cpu_features_def.h.inc | 4 ++--
 target/s390x/gen-features.c         | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/s390x/cpu_features_def.h.inc b/target/s390x/cpu_features_def.h.inc
index 6f92b155c3b1..33c67e36cf79 100644
--- a/target/s390x/cpu_features_def.h.inc
+++ b/target/s390x/cpu_features_def.h.inc
@@ -111,9 +111,9 @@ DEF_FEAT(ETOKEN, "etoken", STFL, 156, "Etoken facility")
 DEF_FEAT(UNPACK, "unpack", STFL, 161, "Unpack facility")
 DEF_FEAT(NNPA, "nnpa", STFL, 165, "NNPA facility")
 DEF_FEAT(VECTOR_PACKED_DECIMAL_ENH2, "vxpdeh2", STFL, 192, "Vector-Packed-Decimal-Enhancement facility 2")
-DEF_FEAT(BEAR, "bear", STFL, 193, "BEAR-enhancement facility ")
+DEF_FEAT(BEAR_ENH, "beareh", STFL, 193, "BEAR-enhancement facility ")
 DEF_FEAT(RDP, "rdp", STFL, 194, "Reset-DAT-protection facility ")
-DEF_FEAT(ACTIVITY, "activity", STFL, 196, "Processor-Activity-Instrumentation facility ")
+DEF_FEAT(PAI, "pai", STFL, 196, "Processor-Activity-Instrumentation facility ")
 
 /* Features exposed via SCLP SCCB Byte 80 - 98  (bit numbers relative to byte-80) */
 DEF_FEAT(SIE_GSLS, "gsls", SCLP_CONF_CHAR, 40, "SIE: Guest-storage-limit-suppression facility")
diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
index a7396d3d5f30..7d85322d6814 100644
--- a/target/s390x/gen-features.c
+++ b/target/s390x/gen-features.c
@@ -572,9 +572,9 @@ static uint16_t full_GEN15_GA1[] = {
 static uint16_t full_GEN16_GA1[] = {
     S390_FEAT_NNPA,
     S390_FEAT_VECTOR_PACKED_DECIMAL_ENH2,
-    S390_FEAT_BEAR,
+    S390_FEAT_BEAR_ENH,
     S390_FEAT_RDP,
-    S390_FEAT_ACTIVITY,
+    S390_FEAT_PAI,
 };
 
 
-- 
2.31.1


