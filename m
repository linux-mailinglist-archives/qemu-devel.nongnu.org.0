Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C69657CF4
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 16:37:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAYUd-0003rQ-6G; Wed, 28 Dec 2022 10:37:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mthiyaga@quicinc.com>)
 id 1pAYUb-0003rE-2E
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 10:37:21 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mthiyaga@quicinc.com>)
 id 1pAYUZ-00071s-8H
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 10:37:20 -0500
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BSDaRIS004220
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 15:37:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=4BMgwYKaJZOCmIqRbnLpTuqLWkNLfpynADVP7LrG3Ak=;
 b=ELCLa8Y1hTG3lk60yMtNyEjISf9sHFVI1DqNxr3y129wzH/lWznesMgCDqKEaxEmGMQg
 /OdcvWS3XH9A5aMEUCkW8kq0Et+axTR6grua3NPi78EVabBQl7t3cVujs+YxbwQJ5OOO
 R88XGvaxYsouMzitffBaCbJGGZiv1pmoCUksWGf7QNmK67n02ZOKhyj5oMyxKmxdkqVk
 UE/u7I3lRmnLMgPc3TyicRwFdM45SrF1fVPcqTeVOuXLTdaoO3zKGqwXoEVxKEb+vc8Z
 RxV6l465zy1NCAZudHNGNSZNwzXjJ41n2iYYGAxajIPxF4D+XEF7VsEhBDEQferjnplg pw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mrctr9441-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 15:37:16 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BSFbFkS029693
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 15:37:15 GMT
Received: from mthiyaga-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 28 Dec 2022 07:37:13 -0800
From: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
To: <qemu-devel@nongnu.org>, <tsimpson@quicinc.com>
CC: <bcain@quicinc.com>, <quic_mathbern@quicinc.com>, Mukilan Thiyagarajan
 <quic_mthiyaga@quicinc.com>
Subject: [PATCH] tests/tcg/hexagon: fix underspecifed asm constraints
Date: Wed, 28 Dec 2022 21:06:57 +0530
Message-ID: <20221228153657.10210-1-quic_mthiyaga@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 2y_1ofmeQXtA2wrbltlV6BMDeJ2HBmuy
X-Proofpoint-ORIG-GUID: 2y_1ofmeQXtA2wrbltlV6BMDeJ2HBmuy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-28_12,2022-12-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212280134
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=quic_mthiyaga@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
have the correct constraints causing them to fail when
using certain clang versions/optimization levels.

In mem_noshuf.c, the register r7 is written to but
not specified in the clobber list.

In misc.c, the 'result' output needs the early clobber
modifier since the rest of the inputs are read after
assignment to the output register.

Signed-off-by: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
---
 tests/tcg/hexagon/mem_noshuf.c | 2 +-
 tests/tcg/hexagon/misc.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

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
index f0b1947fb3..9b1604d82f 100644
--- a/tests/tcg/hexagon/misc.c
+++ b/tests/tcg/hexagon/misc.c
@@ -189,7 +189,7 @@ static int L2_ploadrifnew_pi(void *p, int pred)
                "    p0 = cmp.eq(%1, #1)\n\t"
                "    if (!p0.new) %0 = memw(%2++#4)\n\t"
                "}\n\t"
-               : "=r"(result) : "r"(pred), "r"(p)
+               : "=&r"(result) : "r"(pred), "r"(p)
                : "p0");
   return result;
 }
-- 
2.17.1


