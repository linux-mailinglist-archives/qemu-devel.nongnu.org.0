Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F996E9479
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 14:33:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppTSS-0006ff-Vm; Thu, 20 Apr 2023 08:32:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1ppTSQ-0006dj-L9
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:32:14 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1ppTSL-0002tQ-Ag
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:32:14 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33KAq5nj015089; Thu, 20 Apr 2023 12:32:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=l+PakLmISjH8ZXiG9fvj+CGW8xYCbPmP0sFZ3X9jV8g=;
 b=Be394gwlS3O18r+2D+UkLIPlm5mOWYp5igeYCj8rUdyfNymYHHQAmIfIq5gW/1Aqsg1f
 FYHDbSyzbgjSQ0groY+niOrOTxjLljqxpXKSoZdGpWuepbhtJar0Nrv6tB4621l7mV+B
 +3ydMeD7C5ekkNIwWCoRQpX8O46k7OrjPDgVSfgjPvc+vMFMQ2yxMkN2rr9kkQ0wOvvw
 qBJYBNvxHZH9RvzyD6fx0sOY7AsKadEfJShm9SrU03p8hkgtcF9ScRLBch/u7yuwC+Tp
 fIaM5an5Ok9wMqSTMSrBQ1LsojBA43SCty8CeCoF390Om85acPBPjkGXvgemvpFsfrPv rQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q2qv3hsr6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 12:32:07 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33KCW6iu028249
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 12:32:06 GMT
Received: from NASANPPMTA03.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 20 Apr 2023 05:32:02 -0700
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: <alex.bennee@linaro.org>, <bcain@quicinc.com>, <f4bug@amsat.org>,
 <peter.maydell@linaro.org>, <tsimpson@quicinc.com>, Laurent Vivier
 <laurent@vivier.eu>
Subject: [PATCH v2 RESEND 7/7] Hexagon (linux-user/hexagon): handle breakpoints
Date: Thu, 20 Apr 2023 09:31:28 -0300
Message-ID: <26f1f1cc2c23fe4669326cabe5615188be9afc06.1681993775.git.quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1681993775.git.quic_mathbern@quicinc.com>
References: <cover.1681993775.git.quic_mathbern@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 9N78YQlwxsHgN2ZE5AQERQTjE7SptwiF
X-Proofpoint-ORIG-GUID: 9N78YQlwxsHgN2ZE5AQERQTjE7SptwiF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-20_08,2023-04-20_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 mlxlogscore=724 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304200101
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=quic_mathbern@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Taylor Simpson <tsimpson@quicinc.com>

This enables LLDB to work with hexagon linux-user mode through the GDB
remote protocol.

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
---
 linux-user/hexagon/cpu_loop.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/linux-user/hexagon/cpu_loop.c b/linux-user/hexagon/cpu_loop.c
index b84e25bf71..00c12bbb55 100644
--- a/linux-user/hexagon/cpu_loop.c
+++ b/linux-user/hexagon/cpu_loop.c
@@ -33,6 +33,7 @@ void cpu_loop(CPUHexagonState *env)
     target_ulong ret;
 
     for (;;) {
+        target_siginfo_t info;
         cpu_exec_start(cs);
         trapnr = cpu_exec(cs);
         cpu_exec_end(cs);
@@ -63,6 +64,15 @@ void cpu_loop(CPUHexagonState *env)
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
             break;
+        case EXCP_DEBUG:
+            info = (target_siginfo_t) {
+                .si_signo = TARGET_SIGTRAP,
+                .si_errno = 0,
+                .si_code = TARGET_TRAP_BRKPT,
+                ._sifields._sigfault._addr = 0
+            };
+            queue_signal(env, info.si_signo, QEMU_SI_KILL, &info);
+            break;
         default:
             EXCP_DUMP(env, "\nqemu: unhandled CPU exception %#x - aborting\n",
                      trapnr);
-- 
2.39.1


