Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E57D658A77
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 09:23:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAoAP-0006Ce-PB; Thu, 29 Dec 2022 03:21:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mthiyaga@quicinc.com>)
 id 1pAoAO-0006CR-16
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 03:21:32 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mthiyaga@quicinc.com>)
 id 1pAoAI-0003dY-DJ
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 03:21:31 -0500
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BT7Tp6b019827
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 08:21:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=GC4IOal/s9YVFlwBGPDQJHlpZuGhhb49QYJb04XVljQ=;
 b=TWd03ikeUV7jIBTNbcK/4RZdVsOj4FepHcMCaugkeNYPrvv/TAsoR8t2hoSkKhOxA0C6
 xR8hpHRp9UMU1EyqfGojm/65mEj2BYg1hf/0JW3JjURCRU7yrO1NEYL1rSRauuChs8Fj
 POiit6HCO83fAIOfRJ0eCdv0HZAWj1YPzGv6nVdVDNHaJCUSvYEgLReflu+33Gi4B2r6
 /v/GJQHQxjGLk1EPvTOq915bBPf9HP1ebJkG2RGu6aVJbJMaCxRi255wIyx93Bjw7arl
 fPEbmU+/ZEBZp+Yvh/PNj68SUUq/EX2v9az8RxJ0J4O1n185pI2xnd3X06Y/bovkxAw6 bg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mrar2tsvg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 08:21:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BT8LNGh020355
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 08:21:23 GMT
Received: from mthiyaga-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 29 Dec 2022 00:21:20 -0800
From: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
To: <qemu-devel@nongnu.org>, <tsimpson@quicinc.com>
CC: <bcain@quicinc.com>, <quic_mathbern@quicinc.com>, Mukilan Thiyagarajan
 <quic_mthiyaga@quicinc.com>
Subject: [PATCH v2] tests/tcg/hexagon: fix underspecifed asm constraints
Date: Thu, 29 Dec 2022 13:48:36 +0530
Message-ID: <20221229081836.12130-1-quic_mthiyaga@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: IP2rPYUvL4fKinmtqpAwcqygm5oe6KzJ
X-Proofpoint-GUID: IP2rPYUvL4fKinmtqpAwcqygm5oe6KzJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-29_04,2022-12-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212290069
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=quic_mthiyaga@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

There are two test cases where the inline asm doesn't
have the correct constraints causing them to fail.

In misc.c, the 'result' output needs the early clobber
modifier since the rest of the inputs are read after
assignment to the output register.

In mem_noshuf.c, the register r7 is written to but
not specified in the clobber list.

Signed-off-by: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
---
 tests/tcg/hexagon/mem_noshuf.c | 2 +-
 tests/tcg/hexagon/misc.c       | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/tcg/hexagon/mem_noshuf.c b/tests/tcg/hexagon/mem_noshuf.c
index 0f4064e700..210b2f1208 100644
--- a/tests/tcg/hexagon/mem_noshuf.c
+++ b/tests/tcg/hexagon/mem_noshuf.c
@@ -144,7 +144,7 @@ static inline long long pred_ld_sd_pi(int pred, long long *p, long long *q,
                  "}:mem_noshuf\n"
                  : "=&r"(ret)
                  : "r"(p), "r"(q), "r"(x), "r"(y), "r"(pred)
-                 : "p0", "memory");
+                 : "r7", "p0", "memory");
     return ret;
 }
 
diff --git a/tests/tcg/hexagon/misc.c b/tests/tcg/hexagon/misc.c
index f0b1947fb3..e73ab57334 100644
--- a/tests/tcg/hexagon/misc.c
+++ b/tests/tcg/hexagon/misc.c
@@ -186,10 +186,10 @@ static int L2_ploadrifnew_pi(void *p, int pred)
   int result;
   asm volatile("%0 = #31\n\t"
                "{\n\t"
-               "    p0 = cmp.eq(%1, #1)\n\t"
-               "    if (!p0.new) %0 = memw(%2++#4)\n\t"
+               "    p0 = cmp.eq(%2, #1)\n\t"
+               "    if (!p0.new) %0 = memw(%1++#4)\n\t"
                "}\n\t"
-               : "=r"(result) : "r"(pred), "r"(p)
+               : "=&r"(result), "+r"(p) : "r"(pred)
                : "p0");
   return result;
 }
-- 
2.17.1


