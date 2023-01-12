Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2F76679AA
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 16:42:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFzOI-00076E-59; Thu, 12 Jan 2023 10:21:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pFzNZ-0006cS-Gf
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 10:20:38 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pFzNW-0002L5-Om
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 10:20:32 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30CEh96C009935; Thu, 12 Jan 2023 15:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=X5etfHOiwKibgFoQjB60NfSFQTUQZ2gG5QH6yQwS94c=;
 b=FeRqyi6QUH4CtHKzH31v6rrn4iQMgpV4xufgIooN+bSJM7l2qknYFl2V81vGb+ClINmx
 zA0xfbNnI27X8h77EC/zZbpwhwhFY2FWPAjLEsPu9+sbxtUggN77zHGn3L1gfOZByaUK
 SjBz/EGc4XS25qANsrIPsaVRSyeO28BZP1cF4QSDrt91E6vIXBWWuq+4qSNI5/QRMWUX
 UTXTjRaqBZ0yyMKD4ulIMF3Rja+DQo0j4ya1sNpnJtLmdndQj/JDv9vkK9qB8REbhVIV
 vXo8QUn3DM7F4UL5roU1nKahpJL+yIeVSrZNVmjzF9rTv1pijTHU7GwgbGRlgoIz4I1W /Q== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n2m79s4hx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jan 2023 15:20:25 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30CCaQIX030620;
 Thu, 12 Jan 2023 15:20:24 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3n1kyx9x1f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jan 2023 15:20:24 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30CFKIt821168848
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Jan 2023 15:20:18 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1B6F20040;
 Thu, 12 Jan 2023 15:20:18 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5154C20043;
 Thu, 12 Jan 2023 15:20:18 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.69.153])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 12 Jan 2023 15:20:18 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-devel@nongnu.org, 
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 1/3] linux-user: Clean up when exiting due to a signal
Date: Thu, 12 Jan 2023 16:20:11 +0100
Message-Id: <20230112152013.125680-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230112152013.125680-1-iii@linux.ibm.com>
References: <20230112152013.125680-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MEhX2JZMIb8FwILevi53RB13xx66zJzw
X-Proofpoint-ORIG-GUID: MEhX2JZMIb8FwILevi53RB13xx66zJzw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-12_08,2023-01-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=805 bulkscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301120109
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

When exiting due to an exit() syscall, qemu-user calls
preexit_cleanup(), but this is currently not the case when exiting due
to a signal. This leads to various buffers not being flushed (e.g.,
for gprof, for gcov, and for the upcoming perf support).

Add the missing call.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/signal.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index 61c6fa3fcf1..098f3a787db 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -695,7 +695,7 @@ void cpu_loop_exit_sigbus(CPUState *cpu, target_ulong addr,
 
 /* abort execution with signal */
 static G_NORETURN
-void dump_core_and_abort(int target_sig)
+void dump_core_and_abort(CPUArchState *cpu_env, int target_sig)
 {
     CPUState *cpu = thread_cpu;
     CPUArchState *env = cpu->env_ptr;
@@ -724,6 +724,8 @@ void dump_core_and_abort(int target_sig)
             target_sig, strsignal(host_sig), "core dumped" );
     }
 
+    preexit_cleanup(cpu_env, 128 + target_sig);
+
     /* The proper exit code for dying from an uncaught signal is
      * -<signal>.  The kernel doesn't allow exit() or _exit() to pass
      * a negative value.  To get the proper exit code we need to
@@ -1058,12 +1060,12 @@ static void handle_pending_signal(CPUArchState *cpu_env, int sig,
                    sig != TARGET_SIGURG &&
                    sig != TARGET_SIGWINCH &&
                    sig != TARGET_SIGCONT) {
-            dump_core_and_abort(sig);
+            dump_core_and_abort(cpu_env, sig);
         }
     } else if (handler == TARGET_SIG_IGN) {
         /* ignore sig */
     } else if (handler == TARGET_SIG_ERR) {
-        dump_core_and_abort(sig);
+        dump_core_and_abort(cpu_env, sig);
     } else {
         /* compute the blocked signals during the handler execution */
         sigset_t *blocked_set;
-- 
2.39.0


