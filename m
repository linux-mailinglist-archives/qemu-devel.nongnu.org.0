Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 030E8658AE3
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 10:21:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAp5s-0000bJ-Ma; Thu, 29 Dec 2022 04:20:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mthiyaga@quicinc.com>)
 id 1pAp5T-0000ZH-4r
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:20:31 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mthiyaga@quicinc.com>)
 id 1pAp5R-00019N-5L
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:20:30 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BT8l25g027200; Thu, 29 Dec 2022 09:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=fSJ3HDiGnsOhEhRc/jZnJsK1QEcEj9IIbGceC94MdPc=;
 b=Vu4RduVP8lcF/r85ETOmwwmdYMV2dbmv4uoeBkS7aUazP87gDw64c+ihuQ/6SaMW0U5C
 gKt1hmoe7kAppLs11eu27jqmLiZE29KZ6Gs3xe14UrzvAtFT7tyNEicfXxe8yPotLbUK
 NexAIvde0lFXRJAAs2RMUTbdXsAFb8aisNWL+bLdAGEHmMDzuUAL7TWPzDdIcTjqu/XD
 6y4vfPRYSF14UG6s02JLj0G8vfb/IHHlT97NaUUlLtFUz90d7Edu6uPwVFe/+GlR55Xv
 BvlRL31NQnzylIY57T4IpEzg5a9VnWqDPJ/FRzNs4idHBsPrl4Sm3d1f67hUp49owhSW 3Q== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mrp0yst5r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Dec 2022 09:20:25 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BT9KPRU009797
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Dec 2022 09:20:25 GMT
Received: from mthiyaga-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 29 Dec 2022 01:20:22 -0800
From: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
To: <qemu-devel@nongnu.org>, <tsimpson@quicinc.com>, <laurent@vivier.eu>
CC: <bcain@quicinc.com>, <richard.henderson@linaro.org>,
 <alex.bennee@linaro.org>, Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
Subject: [PATCH v2 0/2] Hexagon: fix signal context save & restore bug
Date: Thu, 29 Dec 2022 14:50:04 +0530
Message-ID: <20221229092006.10709-1-quic_mthiyaga@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: gWA2302xWuhNLApbyYVDCvv928XcAsx7
X-Proofpoint-ORIG-GUID: gWA2302xWuhNLApbyYVDCvv928XcAsx7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-29_04,2022-12-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=871 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212290077
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

This patchset is to fix the issue discovered in this thread
when hexagon toolchain was upgraded to a newer version.

https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg01102.html

Investigation revealed that the bug was not in the
toolchain as suspected in the above thread, but in the
hexagon specific logic in linux-user for saving & restoring
thread context during signal delivery.

The first patch contains the fix for the issue along with a
test case and the second patch contains the change to rename
the enum for HEX_REG_P3_0 register, to provide some warning
to new code that it is an aliased version of the
individual predicate registers.

- Mukilan

*** Changes in v2 ***
Addressed the following review comments:
1) Fixed year in copyright line of signal_context.c
2) Moved variable decls to top of function in signal_context.c
3) Added PASS/FAIL output to signal_context.c test case

Mukilan Thiyagarajan (2):
  linux-user/hexagon: fix signal context save & restore
  target/hexagon: rename aliased register HEX_REG_P3_0

 linux-user/hexagon/signal.c        | 17 +++---
 target/hexagon/cpu.c               |  6 +--
 target/hexagon/genptr.c            | 12 ++---
 target/hexagon/hex_regs.h          |  2 +-
 tests/tcg/hexagon/Makefile.target  |  1 +
 tests/tcg/hexagon/signal_context.c | 84 ++++++++++++++++++++++++++++++
 6 files changed, 106 insertions(+), 16 deletions(-)
 create mode 100644 tests/tcg/hexagon/signal_context.c

-- 
2.17.1


