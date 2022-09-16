Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8701A5BAFEA
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 17:11:43 +0200 (CEST)
Received: from localhost ([::1]:38810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZD0I-00061V-0q
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 11:11:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1oZCvN-0000ft-VR
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 11:06:38 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131]:37826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1oZCvL-0004Ry-Bw
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 11:06:37 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28GE3IiL002546
 for <qemu-devel@nongnu.org>; Fri, 16 Sep 2022 15:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=qcppdkim1; bh=JKKVwlqC1ay6udOECamg4afpxkjfuGabtGbtRJkR97I=;
 b=F6Y+xkFjDil43kZ3RxDV7owlEh5bAK8hKjQyRzyfP1hTK81d3r0dwDFR8sqXsmpfg/Os
 0yKeawxWrgzREUwjZtorbxfi00tR7d7M/D76nJcSbPZnR7cU2hUl11Q68JtzAtwI2Nk0
 V8Oa+KXdlB1FnHt7zSY7jDIZdDObz7eiSnkeU6cVDlc+lggTIMRvWSbPjvVmJLMluWWp
 uRFv3LuvNI2xq+6MpmseB+TqG7F1P98e1slt5k78vzkbxrabXHJbQlYPozh4gVDZBKpj
 AuLi/l/pGAwXsZc3wpi6d5Lb/GNbkIiLkGunHmKjQhtawyVizNNU6N9i72jWtXa7s3t0 Ig== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jm9m1bcc2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 16 Sep 2022 15:06:31 +0000
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 28GF2bZ4006090
 for <qemu-devel@nongnu.org>; Fri, 16 Sep 2022 15:06:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 3jk8x6ttj0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 16 Sep 2022 15:06:30 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28GF4YUM009305
 for <qemu-devel@nongnu.org>; Fri, 16 Sep 2022 15:06:30 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-mathbern-lv.qualcomm.com
 [10.47.235.147])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 28GF6T4m011151
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Sep 2022 15:06:29 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 4229910)
 id 843C54D3C; Fri, 16 Sep 2022 12:06:29 -0300 (-03)
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, bcain@quicinc.com
Subject: [PATCH] Hexagon (tests/tcg/hexagon): add fmin/fmax tests for signed
 zero
Date: Fri, 16 Sep 2022 12:06:27 -0300
Message-Id: <1dca69ceb766924b7664b5b78ce930e3a9abe7dc.1663340756.git.quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: HOGYS1sm22BE3RJ4lUmRGHNX8sRZQ7Cc
X-Proofpoint-GUID: HOGYS1sm22BE3RJ4lUmRGHNX8sRZQ7Cc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_09,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 mlxlogscore=525 spamscore=0 mlxscore=0
 phishscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209160112
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=mathbern@qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
---
 tests/tcg/hexagon/usr.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/tcg/hexagon/usr.c b/tests/tcg/hexagon/usr.c
index a531511cec..fb4514989c 100644
--- a/tests/tcg/hexagon/usr.c
+++ b/tests/tcg/hexagon/usr.c
@@ -86,6 +86,7 @@ const uint32_t SF_QNaN_neg =         0xffc00000;
 const uint32_t SF_SNaN_neg =         0xffb00000;
 const uint32_t SF_HEX_NaN =          0xffffffff;
 const uint32_t SF_zero =             0x00000000;
+const uint32_t SF_zero_neg =         0x80000000;
 const uint32_t SF_one =              0x3f800000;
 const uint32_t SF_one_recip =        0x3f7f0001;         /* 0.9960...  */
 const uint32_t SF_one_invsqrta =     0x3f7f0000;         /* 0.99609375 */
@@ -100,6 +101,7 @@ const uint64_t DF_QNaN_neg =         0xfff8000000000000ULL;
 const uint64_t DF_SNaN_neg =         0xfff7000000000000ULL;
 const uint64_t DF_HEX_NaN =          0xffffffffffffffffULL;
 const uint64_t DF_zero =             0x0000000000000000ULL;
+const uint64_t DF_zero_neg =         0x8000000000000000ULL;
 const uint64_t DF_any =              0x3f80000000000000ULL;
 const uint64_t DF_one =              0x3ff0000000000000ULL;
 const uint64_t DF_one_hh =           0x3ff001ff80000000ULL;     /* 1.00048... */
@@ -933,6 +935,8 @@ int main()
     TEST_R_OP_RR(sfmin,  SF_QNaN,     SF_one,         SF_one,       USR_CLEAR);
     TEST_R_OP_RR(sfmin,  SF_SNaN,     SF_QNaN,        SF_HEX_NaN,   USR_FPINVF);
     TEST_R_OP_RR(sfmin,  SF_QNaN,     SF_SNaN,        SF_HEX_NaN,   USR_FPINVF);
+    TEST_R_OP_RR(sfmin,  SF_zero,     SF_zero_neg,    SF_zero_neg,  USR_CLEAR);
+    TEST_R_OP_RR(sfmin,  SF_zero_neg, SF_zero,        SF_zero_neg,  USR_CLEAR);
 
     TEST_R_OP_RR(sfmax,  SF_one,      SF_small_neg,   SF_one,       USR_CLEAR);
     TEST_R_OP_RR(sfmax,  SF_one,      SF_SNaN,        SF_one,       USR_FPINVF);
@@ -941,6 +945,8 @@ int main()
     TEST_R_OP_RR(sfmax,  SF_QNaN,     SF_one,         SF_one,       USR_CLEAR);
     TEST_R_OP_RR(sfmax,  SF_SNaN,     SF_QNaN,        SF_HEX_NaN,   USR_FPINVF);
     TEST_R_OP_RR(sfmax,  SF_QNaN,     SF_SNaN,        SF_HEX_NaN,   USR_FPINVF);
+    TEST_R_OP_RR(sfmax,  SF_zero,     SF_zero_neg,    SF_zero,      USR_CLEAR);
+    TEST_R_OP_RR(sfmax,  SF_zero_neg, SF_zero,        SF_zero,      USR_CLEAR);
 
     TEST_R_OP_RR(sfadd,  SF_one,      SF_QNaN,        SF_HEX_NaN,   USR_CLEAR);
     TEST_R_OP_RR(sfadd,  SF_one,      SF_SNaN,        SF_HEX_NaN,   USR_FPINVF);
@@ -1003,6 +1009,8 @@ int main()
     TEST_P_OP_PP(dfmin,  DF_QNaN,   DF_any,          DF_any,        USR_CLEAR);
     TEST_P_OP_PP(dfmin,  DF_SNaN,   DF_QNaN,         DF_HEX_NaN,    USR_FPINVF);
     TEST_P_OP_PP(dfmin,  DF_QNaN,   DF_SNaN,         DF_HEX_NaN,    USR_FPINVF);
+    TEST_P_OP_PP(dfmin,  DF_zero,   DF_zero_neg,     DF_zero_neg,   USR_CLEAR);
+    TEST_P_OP_PP(dfmin,  DF_zero_neg, DF_zero,       DF_zero_neg,   USR_CLEAR);
 
     TEST_P_OP_PP(dfmax,  DF_any,    DF_small_neg,    DF_any,        USR_CLEAR);
     TEST_P_OP_PP(dfmax,  DF_any,    DF_SNaN,         DF_any,        USR_FPINVF);
@@ -1011,6 +1019,8 @@ int main()
     TEST_P_OP_PP(dfmax,  DF_QNaN,   DF_any,          DF_any,        USR_CLEAR);
     TEST_P_OP_PP(dfmax,  DF_SNaN,   DF_QNaN,         DF_HEX_NaN,    USR_FPINVF);
     TEST_P_OP_PP(dfmax,  DF_QNaN,   DF_SNaN,         DF_HEX_NaN,    USR_FPINVF);
+    TEST_P_OP_PP(dfmax,  DF_zero,   DF_zero_neg,     DF_zero,       USR_CLEAR);
+    TEST_P_OP_PP(dfmax,  DF_zero_neg, DF_zero,       DF_zero,       USR_CLEAR);
 
     TEST_XP_OP_PP(dfmpyhh, DF_one,   DF_one,  DF_one,   DF_one_hh,  USR_CLEAR);
     TEST_XP_OP_PP(dfmpyhh, DF_zero,  DF_any,  DF_QNaN,  DF_HEX_NaN, USR_CLEAR);
-- 
2.37.2


