Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7836E656C98
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Dec 2022 16:36:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pABzF-000530-1w; Tue, 27 Dec 2022 10:35:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mthiyaga@quicinc.com>)
 id 1pABzC-000523-FI
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 10:35:26 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mthiyaga@quicinc.com>)
 id 1pABzA-0004K7-AK
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 10:35:26 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BRFZIKP001988; Tue, 27 Dec 2022 15:35:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=B+YHJ79GrgaXhWNoOECC9cd3Wig+oq5sR0q2cyQuZfc=;
 b=WyVg7KPUX0nbSE/8CqLs9sB9rC2H28FodX77n5KwYln1qkoQoOSYk4lWIEegIbH/g/Ap
 PXYtwprLzHyfWHxBnuSogSyAkxKNz+y4oNBPoyQJOIvKq4XQ+NDTotpBlQhQ34eRv//R
 8P3NYxzF5Ep8ULXlxHZx1KseVydC2WXqWye1nV+8eUZtw0kIFK8HsR/SdmiNPGSKoX6S
 HXODmZocIN28Q8W/i0yDCLc84yA6/UyOLBi59bq/QMdbgG+um1iuiquQvRxYnfvqfovP
 Rgjn6n/MbJzBJOHBYL+ADV7F1DmqjoK9Ps5zU/acrw7tjyWrL+1n/73SrV5jTjY0kQdx Lw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mntkvctx3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Dec 2022 15:35:18 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BRFZHH4027088
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Dec 2022 15:35:17 GMT
Received: from mthiyaga-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 27 Dec 2022 07:35:14 -0800
From: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
To: <qemu-devel@nongnu.org>, <tsimpson@quicinc.com>, <laurent@vivier.eu>
CC: <bcain@quicinc.com>, <richard.henderson@linaro.org>,
 <alex.bennee@linaro.org>, Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
Subject: [PATCH 1/2] linux-user/hexagon: fix signal context save & restore
Date: Tue, 27 Dec 2022 21:04:46 +0530
Message-ID: <20221227153447.2729-2-quic_mthiyaga@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221227153447.2729-1-quic_mthiyaga@quicinc.com>
References: <20221227153447.2729-1-quic_mthiyaga@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ltkvlxMBPH88aUlrz3cP6l3z9VqBUpDy
X-Proofpoint-ORIG-GUID: ltkvlxMBPH88aUlrz3cP6l3z9VqBUpDy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-27_11,2022-12-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 mlxscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212270127
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

This patch fixes the issue originally reported in
this thread:

https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg01102.html

The root cause of the issue is a bug in the hexagon specific
logic for saving & restoring context during signal delivery.
The CPU state has two different representations for the
predicate registers. The current logic saves & restores only
the aliased HEX_REG_P3_O register, which is part of env->gpr[]
field in the CPU state, but not the individual byte-level
predicate registers (pO, p1, p2, p3) backed by env->pred[].

Since all predicated instructions refer only to the
indiviual registers, switching to and back from a signal handler
can clobber these registers if the signal handler writes to them
causing the normal application code to behave unpredictably when
context is restored.

In the reported issue with the 'signals' test, since the updated
hexagon toolchain had built musl with -O2, the functions called
from non_trivial_free were inlined. This meant that the code
emitted reused predicate P0 computed in the entry translation
block of the function non_trivial_free in one of the child TB
as part of an assertion. Since P0 is clobbered by the signal
handler in the signals test, the assertion in non_trivial_free
fails incorectly. Since musl for hexagon implements the 'abort'
function by deliberately writing to memory via null pointer,
this causes the test to fail with segmentation fault.

This patch modifies the signal context save & restore logic
to include the individual p0, p1, p2, p3 and excludes the
32b p3_0 register since its value is derived from the former
registers. It also adds a new test case that reliabily
reproduces the issue for all four predicate registers.

Buglink: https://github.com/quic/toolchain_for_hexagon/issues/6
Signed-off-by: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
---
 linux-user/hexagon/signal.c        | 17 +++---
 tests/tcg/hexagon/Makefile.target  |  1 +
 tests/tcg/hexagon/signal_context.c | 84 ++++++++++++++++++++++++++++++
 3 files changed, 96 insertions(+), 6 deletions(-)
 create mode 100644 tests/tcg/hexagon/signal_context.c

diff --git a/linux-user/hexagon/signal.c b/linux-user/hexagon/signal.c
index ad4e3822d5..60fa7e1bce 100644
--- a/linux-user/hexagon/signal.c
+++ b/linux-user/hexagon/signal.c
@@ -39,15 +39,12 @@ struct target_sigcontext {
     target_ulong m0;
     target_ulong m1;
     target_ulong usr;
-    target_ulong p3_0;
     target_ulong gp;
     target_ulong ugp;
     target_ulong pc;
     target_ulong cause;
     target_ulong badva;
-    target_ulong pad1;
-    target_ulong pad2;
-    target_ulong pad3;
+    target_ulong pred[NUM_PREGS];
 };
 
 struct target_ucontext {
@@ -118,10 +115,14 @@ static void setup_sigcontext(struct target_sigcontext *sc, CPUHexagonState *env)
     __put_user(env->gpr[HEX_REG_M0], &sc->m0);
     __put_user(env->gpr[HEX_REG_M1], &sc->m1);
     __put_user(env->gpr[HEX_REG_USR], &sc->usr);
-    __put_user(env->gpr[HEX_REG_P3_0], &sc->p3_0);
     __put_user(env->gpr[HEX_REG_GP], &sc->gp);
     __put_user(env->gpr[HEX_REG_UGP], &sc->ugp);
     __put_user(env->gpr[HEX_REG_PC], &sc->pc);
+
+    int i;
+    for (i = 0; i < NUM_PREGS; i++) {
+        __put_user(env->pred[i], &(sc->pred[i]));
+    }
 }
 
 static void setup_ucontext(struct target_ucontext *uc,
@@ -230,10 +231,14 @@ static void restore_sigcontext(CPUHexagonState *env,
     __get_user(env->gpr[HEX_REG_M0], &sc->m0);
     __get_user(env->gpr[HEX_REG_M1], &sc->m1);
     __get_user(env->gpr[HEX_REG_USR], &sc->usr);
-    __get_user(env->gpr[HEX_REG_P3_0], &sc->p3_0);
     __get_user(env->gpr[HEX_REG_GP], &sc->gp);
     __get_user(env->gpr[HEX_REG_UGP], &sc->ugp);
     __get_user(env->gpr[HEX_REG_PC], &sc->pc);
+
+    int i;
+    for (i = 0; i < NUM_PREGS; i++) {
+        __get_user(env->pred[i], &(sc->pred[i]));
+    }
 }
 
 static void restore_ucontext(CPUHexagonState *env, struct target_ucontext *uc)
diff --git a/tests/tcg/hexagon/Makefile.target b/tests/tcg/hexagon/Makefile.target
index 9ee1faa1e1..f1378d86a9 100644
--- a/tests/tcg/hexagon/Makefile.target
+++ b/tests/tcg/hexagon/Makefile.target
@@ -43,6 +43,7 @@ HEX_TESTS += load_align
 HEX_TESTS += atomics
 HEX_TESTS += fpstuff
 HEX_TESTS += overflow
+HEX_TESTS += signal_context
 
 HEX_TESTS += test_abs
 HEX_TESTS += test_bitcnt
diff --git a/tests/tcg/hexagon/signal_context.c b/tests/tcg/hexagon/signal_context.c
new file mode 100644
index 0000000000..297e6915a4
--- /dev/null
+++ b/tests/tcg/hexagon/signal_context.c
@@ -0,0 +1,84 @@
+/*
+ *  Copyright(c) 2019-2022 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <stdio.h>
+#include <signal.h>
+#include <time.h>
+
+void sig_user(int sig, siginfo_t *info, void *puc)
+{
+    asm("r7 = #0\n\t"
+        "p0 = r7\n\t"
+        "p1 = r7\n\t"
+        "p2 = r7\n\t"
+        "p3 = r7\n\t"
+        : : : "r7", "p0", "p1", "p2", "p3");
+}
+
+int main()
+{
+
+    struct sigaction act;
+    struct itimerspec it;
+    timer_t tid;
+    struct sigevent sev;
+    act.sa_sigaction = sig_user;
+    sigemptyset(&act.sa_mask);
+    act.sa_flags = SA_SIGINFO;
+    sigaction(SIGUSR1, &act, NULL);
+    sev.sigev_notify = SIGEV_SIGNAL;
+    sev.sigev_signo = SIGUSR1;
+    sev.sigev_value.sival_ptr = &tid;
+    timer_create(CLOCK_REALTIME, &sev, &tid);
+    it.it_interval.tv_sec = 0;
+    it.it_interval.tv_nsec = 100000;
+    it.it_value.tv_sec = 0;
+    it.it_value.tv_nsec = 100000;
+    timer_settime(tid, 0, &it, NULL);
+
+    int err = 0;
+    unsigned int i = 100000;
+
+    asm("loop0(1f, %1)\n\t"
+        "1: r8 = #0xff\n\t"
+        "   p0 = r8\n\t"
+        "   p1 = r8\n\t"
+        "   p2 = r8\n\t"
+        "   p3 = r8\n\t"
+        "   jump 3f\n\t"
+        "2: memb(%0) = #1\n\t"
+        "   jump 4f\n\t"
+        "3:\n\t"
+        "   r8 = p0\n\t"
+        "   p0 = cmp.eq(r8, #0xff)\n\t"
+        "   if (!p0) jump 2b\n\t"
+        "   r8 = p1\n\t"
+        "   p0 = cmp.eq(r8, #0xff)\n\t"
+        "   if (!p0) jump 2b\n\t"
+        "   r8 = p2\n\t"
+        "   p0 = cmp.eq(r8, #0xff)\n\t"
+        "   if (!p0) jump 2b\n\t"
+        "   r8 = p3\n\t"
+        "   p0 = cmp.eq(r8, #0xff)\n\t"
+        "   if (!p0) jump 2b\n\t"
+        "4: {}: endloop0\n\t"
+        :
+        : "r"(&err), "r"(i)
+        : "memory", "r8", "p0", "p1", "p2", "p3");
+
+    return err;
+}
-- 
2.17.1


