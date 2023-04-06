Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC78B6DA149
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 21:31:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkVJV-00081a-5h; Thu, 06 Apr 2023 15:30:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1pkVJT-0007zj-3i
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 15:30:27 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1pkVJR-0002EN-55
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 15:30:26 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 336IltXL031287; Thu, 6 Apr 2023 19:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=4JPX1fLmwIPyNb9BPwjyB2T5lW+SGB1SJKcJ2nmV3aU=;
 b=AoGnArKwid3fKgEBXWAN4tUuIWWn1i7IgnuYiMLAxyYPwGkEWqhskThfxPdZ1dv4aAg8
 0Ajk01AV8A6e1C5qeOQGgiYUEoztHyAb7TGGmSeJg41+MZ92MCSqeaX1Knzumn4kq35E
 uI5DqmirysJ3ci7ojteCttQ1ubpYvtu5AUiYxqD9SddkBmSSdcg/PsoxIUEPIm9NZDi1
 BhVv17poPejJRTqo96fFBSJjAeMn60tbcrdNCVkvwcFs1/2okb+dHjbt0hdea5wAghb5
 m996ADy1yp+rZASXZjo2WgAvIoXO/SgZQuHVYeY9pQBvmbBwsf5jM0C3GYHpY/beJNnV cg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3psnp9a4cw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 19:30:20 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 336JUJpT012967
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 6 Apr 2023 19:30:19 GMT
Received: from NASANPPMTA02.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 6 Apr 2023 12:30:17 -0700
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: <bcain@quicinc.com>, <tsimpson@quicinc.com>, <alex.bennee@linaro.org>,
 <f4bug@amsat.org>, <peter.maydell@linaro.org>
Subject: [PATCH 0/7] Hexagon: add lldb support
Date: Thu, 6 Apr 2023 16:29:42 -0300
Message-ID: <cover.1680808943.git.quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: z7AKM0--xqQUi3pVqC6qaMObkebobjm1
X-Proofpoint-GUID: z7AKM0--xqQUi3pVqC6qaMObkebobjm1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-06_11,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=512
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0
 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 adultscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304060171
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=quic_mathbern@quicinc.com; helo=mx0b-0031df01.pphosted.com
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

This series allows hexagon programs to be debugged under qemu user-mode
through LLDB and qemu's gdbstub. LLDB implements the GDB remote serial
protocol, so most of the necessary changes are in the Hexagon part itself.
However, one fix is needed at the arch-independent side too. This comes
from [1], which is now incorporated in this series.

[1]: https://lore.kernel.org/qemu-devel/cover.1663677789.git.quic_mathbern@quicinc.com/

Brian Cain (3):
  gdbstub: add support for the qRegisterInfo query
  Hexagon: support qRegisterInfo at gdbstub
  Hexagon (gdbstub): fix p3:0 read and write via stub

Matheus Tavares Bernardino (2):
  gdbstub: only send stop-reply packets when allowed to
  gdbstub: add test for untimely stop-reply packets

Taylor Simpson (2):
  Hexagon (gdbstub): add HVX support
  Hexagon (linux-user/hexagon): handle breakpoints

 gdbstub/internals.h                           |   5 +
 include/hw/core/cpu.h                         |   4 +
 target/hexagon/gdb_qreginfo.h                 | 124 ++++++++++++++++++
 gdbstub/gdbstub.c                             |  64 +++++++--
 gdbstub/softmmu.c                             |  13 +-
 gdbstub/user.c                                |  17 ++-
 linux-user/hexagon/cpu_loop.c                 |  10 ++
 target/hexagon/cpu.c                          |   3 +
 target/hexagon/gdbstub.c                      |  76 +++++++++++
 tests/guest-debug/run-test.py                 |  16 ++-
 .../multiarch/system/Makefile.softmmu-target  |  16 ++-
 11 files changed, 326 insertions(+), 22 deletions(-)
 create mode 100644 target/hexagon/gdb_qreginfo.h

-- 
2.39.1


