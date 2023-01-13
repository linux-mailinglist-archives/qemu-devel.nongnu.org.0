Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE636698D6
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 14:40:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKHR-0007sv-0h; Fri, 13 Jan 2023 08:39:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1pGKHO-0007sW-Pi
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:39:34 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1pGKHN-00053y-4o
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:39:34 -0500
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30DBngmY013048; Fri, 13 Jan 2023 13:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=qcppdkim1; bh=15CWfgi6i/JI2MSFAvREzJs/ObZcyQ2sUZI9Hbxq+PY=;
 b=atFKr6ISM4ecJHA7mXLv5Ad8jYBRf5WbAOFzGp2af8zYFwFmIiIgj0x3/dfJ27Sd1HBF
 PudyYPTLF3XPEbRSpf1b8pAyw26mFa7+SLLfBuYcOkU61AaAYNVNUYxQ1ftaODaxAsmT
 akViPO2ttF6JY7TvMA2I9I5knbcxIzxyE5e45b9p5ZX0Yrse+8xlG1SNGYTloATvasK9
 XIIJLmo2kNfQVMPNPNxmIBzRiebj2OW/f9aLtnSnDMcjrAb2+cz0fbfvaj1lAysH4cW9
 qIH28oklPM41LsJ6UrdIYbXzE0J+nk9R1C6a4RmmPnubkxgWcU84DoKloxyVt83nl4Mx Ww== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n2d753uyt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Jan 2023 13:39:28 +0000
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 30DDdSlJ004565; 
 Fri, 13 Jan 2023 13:39:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 3my1tm2rr3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Jan 2023 13:39:28 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30DDdSrI004557;
 Fri, 13 Jan 2023 13:39:28 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-mathbern-lv.qualcomm.com
 [10.47.235.147])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 30DDdR3N004556
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Jan 2023 13:39:28 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 4229910)
 id 689C95EA4; Fri, 13 Jan 2023 10:39:27 -0300 (-03)
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: qemu-devel@nongnu.org
Cc: Taylor Simpson <tsimpson@quicinc.com>, Brian Cain <bcain@quicinc.com>,
 richard.henderson@linaro.org
Subject: [PATCH 0/2] Hexagon: update and enforce hintjr slot constraints
Date: Fri, 13 Jan 2023 10:39:22 -0300
Message-Id: <cover.1673616964.git.quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: W9swtuYSSzS0crHujQPyU1u7u37vd_U3
X-Proofpoint-GUID: W9swtuYSSzS0crHujQPyU1u7u37vd_U3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-13_06,2023-01-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxlogscore=556 impostorscore=0
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301130090
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=mathbern@qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: 9
X-Spam_score: 0.9
X-Spam_bar: /
X-Spam_report: (0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

This small series basically fix an outdated hexagon slot rule for
instruction hintjr and makes the decode machinery more resilient against
any possible outdated slot constraints in the future.

Matheus Tavares Bernardino (2):
  Hexagon (iclass): update J4_hintjumpr slot constraints
  Hexagon (decode): look for pkts with multiple insns at the same slot

 target/hexagon/decode.c           | 30 +++++++++++++++++++++++++++---
 target/hexagon/iclass.c           |  4 +++-
 tests/tcg/hexagon/Makefile.target | 10 ++++++++++
 tests/tcg/hexagon/invalid_slots.c | 29 +++++++++++++++++++++++++++++
 4 files changed, 69 insertions(+), 4 deletions(-)
 create mode 100644 tests/tcg/hexagon/invalid_slots.c

-- 
2.37.2


