Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AD96F722C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 20:54:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pue5Q-0003ur-De; Thu, 04 May 2023 14:53:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1pue5M-0003tr-7D
 for qemu-devel@nongnu.org; Thu, 04 May 2023 14:53:48 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1pue5K-0004yn-Gh
 for qemu-devel@nongnu.org; Thu, 04 May 2023 14:53:47 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 344FxLC6023304; Thu, 4 May 2023 18:53:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=qcppdkim1;
 bh=8AgN9QChYC2sDfZnbc+EgAUVmjmOUXkGJ6PrUIlW/Fo=;
 b=OX0DnuqxMo5Yo5b79AtGvD26s6AbbWaZ19vtLsMc4MbObpJ8ys03jS5WeuyPDoZLnQTf
 se0wcZ9i6lAqaNqHqoTp2TqEpgGNm8aWCqOf+WipgrM4uZbWccgS8aqcaTIhWHYiQixP
 dT/kmnTP/zBih+GSGNp32H/lbyyyBBnwyFY+yDEUpR9FzhcPHAAiZPcYAYXaCnLmvjZq
 8MzmA6vN/RdKQe/I+pDgKsEZV31gU1Effz3Q9pi/DQjGsA35KuKOLgAMTZdum0W4g667
 sxAVaU8IPPBC2uVwnpMnABQ8DUDhOi4IzPJUvngaSO7gllztD6Igx2+XKlph9RkrVRVb XA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qc8kw9mng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 18:53:45 +0000
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 344IrE3m021211; 
 Thu, 4 May 2023 18:53:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 3qbe38us9g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 18:53:14 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 344IrDwr021202;
 Thu, 4 May 2023 18:53:14 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-mathbern-lv.qualcomm.com
 [10.47.235.147])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 344IrDk4021199
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 18:53:13 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 4229910)
 id 9269B70F4; Thu,  4 May 2023 15:53:13 -0300 (-03)
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: qemu-devel@nongnu.org
Cc: bcain@quicinc.com, tsimpson@quicinc.com, Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 2/2] Hexagon: append eflags to unknown cpu model string
Date: Thu,  4 May 2023 15:53:12 -0300
Message-Id: <8a8d013cc619b94fd4fb577ae6a8df26cedb972b.1683225804.git.quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <cover.1683225804.git.quic_mathbern@quicinc.com>
References: <cover.1683225804.git.quic_mathbern@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: WmT8MLhuISAnqC6eSll0oVUVPcXXJxUg
X-Proofpoint-ORIG-GUID: WmT8MLhuISAnqC6eSll0oVUVPcXXJxUg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-04_13,2023-05-04_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=469 malwarescore=0 phishscore=0
 adultscore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305040151
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=mathbern@qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Running qemu-hexagon with a binary that was compiled for an arch version
unknown by qemu can produce a somewhat confusing message:

  qemu-hexagon: unable to find CPU model 'unknown'

Let's give a bit more info by appending the eflags so that the message
becomes:

  qemu-hexagon: unable to find CPU model 'unknown (0x69)'

Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
---
 linux-user/hexagon/target_elf.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/linux-user/hexagon/target_elf.h b/linux-user/hexagon/target_elf.h
index b4e9f40527..f47e130537 100644
--- a/linux-user/hexagon/target_elf.h
+++ b/linux-user/hexagon/target_elf.h
@@ -20,6 +20,9 @@
 
 static inline const char *cpu_get_model(uint32_t eflags)
 {
+    static char buf[32];
+    int err;
+
     /* For now, treat anything newer than v5 as a v67 */
     /* FIXME - Disable instructions that are newer than the specified arch */
     if (eflags == 0x04 ||    /* v5  */
@@ -34,7 +37,9 @@ static inline const char *cpu_get_model(uint32_t eflags)
        ) {
         return "v67";
     }
-    return "unknown";
+
+    err = snprintf(buf, sizeof(buf), "unknown (0x%x)", eflags);
+    return err >= 0 && err < sizeof(buf) ? buf : "unknown";
 }
 
 #endif
-- 
2.37.2


