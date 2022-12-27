Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB3A656C99
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Dec 2022 16:36:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pABzC-00051u-EC; Tue, 27 Dec 2022 10:35:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mthiyaga@quicinc.com>)
 id 1pABz6-000500-BT
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 10:35:24 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mthiyaga@quicinc.com>)
 id 1pABz4-0004He-MH
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 10:35:20 -0500
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BREmvqB018592; Tue, 27 Dec 2022 15:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=OTQnGbxTx+ISth19g2dBG7N+NBCr89QzwGbm2dTX33g=;
 b=FYy1eFn9RVdo+zRDpUtMyCLShR9/pGZUG6MMMqsKzNyJquhupA9kQqPqIc6lTqevkMxL
 NUM8ATiOPCryDWcR3ThqfDkNKhcXVlCp7O6uLAQut2QE1HA9ACdm3unR0gWMAXusPmKj
 D678DLtUeizzEz03f2bmuEa7IvOdMNcuRe2hyhCyP9XiQUBkQYoWlefMVym4QlB10UxX
 A2tVD4OsglQPtSJ0JGiIHXN/Vd/e7gyz9vaarsvajSQdroO5ud1uwC0cGEIoXx8R0Zwk
 oDzbPE16E2l47N5yLMicSYaqbU8g8TgxyFnQinSLCUBsPlfdTejsvSkRZrB9cCaXZ0FX HA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mnreg5ff6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Dec 2022 15:35:14 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BRFZDBL012674
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Dec 2022 15:35:13 GMT
Received: from mthiyaga-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 27 Dec 2022 07:35:10 -0800
From: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
To: <qemu-devel@nongnu.org>, <tsimpson@quicinc.com>, <laurent@vivier.eu>
CC: <bcain@quicinc.com>, <richard.henderson@linaro.org>,
 <alex.bennee@linaro.org>, Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
Subject: [PATCH 0/2] Hexagon: fix signal context save & restore bug
Date: Tue, 27 Dec 2022 21:04:45 +0530
Message-ID: <20221227153447.2729-1-quic_mthiyaga@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: N-bwc7gS-glf-F4r9SVo4fNX8-Phi9Ih
X-Proofpoint-ORIG-GUID: N-bwc7gS-glf-F4r9SVo4fNX8-Phi9Ih
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-27_11,2022-12-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 mlxlogscore=867 spamscore=0 clxscore=1011 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212270127
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=quic_mthiyaga@quicinc.com; helo=mx0b-0031df01.pphosted.com
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


