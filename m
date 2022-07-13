Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0894573C89
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 20:30:20 +0200 (CEST)
Received: from localhost ([::1]:34258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBh7q-0005cj-WD
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 14:30:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oBh4Z-0001QW-Js; Wed, 13 Jul 2022 14:26:55 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:43014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oBh4X-0000hf-W1; Wed, 13 Jul 2022 14:26:55 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26DILmtd002936;
 Wed, 13 Jul 2022 18:26:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=uJG/ZRPl0WAxCGMiamfLRUzzMyc3SxL9MwDNy8cz4UM=;
 b=TkQvtXgC3KM9iROQcGAKxoPbN/x9RxlM04TX4NcGIhcyYHdusILBtlvprrInSYF/Wbrb
 6b+QsvAWOIKEI6qaW985+oP6vgk91jBITlK0VNTFEH1TKtJA3BMrVBqyCUrGycAsTGf3
 dYdcK4Q4m4opA/CjkLojewOQEH1i0qOCznlfyAg8I79QOuVautkhE9oEhfVb0XNgic/v
 4DOAeVEwYCR5Zb+LLhFxPss94FlJuu7HdWGE3mOx1ojI6Y8zvWZeHK8gxVpIAp768g0v
 hlKBT+DBVlePm+qZsuMiv7uiCeo+B03jyMhkPMV9AfV+kA9ztSH7kyVanZY8HcbyxTZ8 Pg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ha38w821h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 18:26:43 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26DIPQip012630;
 Wed, 13 Jul 2022 18:26:42 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ha38w820p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 18:26:42 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26DHvGCg024498;
 Wed, 13 Jul 2022 18:26:40 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 3h71a8nakn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 18:26:39 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26DIQax69502980
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jul 2022 18:26:36 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1FD242042;
 Wed, 13 Jul 2022 18:26:36 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 05F7242041;
 Wed, 13 Jul 2022 18:26:36 +0000 (GMT)
Received: from heavy.lan (unknown [9.171.47.149])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 13 Jul 2022 18:26:35 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 2/3] target/s390x: fix NaN propagation rules
Date: Wed, 13 Jul 2022 20:26:11 +0200
Message-Id: <20220713182612.3780050-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220713182612.3780050-1-iii@linux.ibm.com>
References: <20220713182612.3780050-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LvwN3HPYyD1uZXPr-0snEdX02IVlKvMq
X-Proofpoint-GUID: 1eJrw6Qura3OddZ3lHoldxXXjPV0-XCu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-13_07,2022-07-13_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=959
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207130073
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

s390x has the same NaN propagation rules as ARM, and not as x86.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
---
 fpu/softfloat-specialize.c.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 943e3301d2..a43ff5e02e 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -390,7 +390,8 @@ bool float32_is_signaling_nan(float32 a_, float_status *status)
 static int pickNaN(FloatClass a_cls, FloatClass b_cls,
                    bool aIsLargerSignificand, float_status *status)
 {
-#if defined(TARGET_ARM) || defined(TARGET_MIPS) || defined(TARGET_HPPA)
+#if defined(TARGET_ARM) || defined(TARGET_MIPS) || defined(TARGET_HPPA) || \
+    defined(TARGET_S390X)
     /* ARM mandated NaN propagation rules (see FPProcessNaNs()), take
      * the first of:
      *  1. A if it is signaling
-- 
2.35.3


