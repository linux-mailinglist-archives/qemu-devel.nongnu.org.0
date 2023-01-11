Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BBB66513A
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 02:48:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFQD5-0001Vy-Nx; Tue, 10 Jan 2023 20:47:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pFQD4-0001Vm-Es
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 20:47:22 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pFQD2-00037Z-R0
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 20:47:22 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30B1iovD010095; Wed, 11 Jan 2023 01:47:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=+0fLkdUwP4rbbE0m1qNppTiM9uvi7HAiYtIXgZutLbU=;
 b=jlyfvM5m/Vg3eLVAgK0cycgT5IJNpxnzLESTFRoS8P/nLbziBeFbTzdrX5v7I84lDVYz
 n1Wnh2ya4MkXi/EuamnltK3iO+PkTWfqM1ht4YQVTtUpFp9Kb+Korlxtkk9aiAmp1TWf
 ZQQ84xR3qVZCgcAZvMWf1XGVy4pI9za1BhIkYt/Wthkb3eoWHpHb+2fqm/bJuofw2xvW
 SC/fvO1KBCIU+Qwc1cLeGRufb3+hiT+JlWU8sSZ0V9Sczf20M0XK8hd5D4d1nEgIEPxH
 H/E/0q9rVAIjmnMYsdWfaeCn/N2ewh0wxO4ONJy4sT6fzVjqvVP5uky1x2Jj2krAM9oo 7A== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n1kqm8168-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jan 2023 01:47:17 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30B1bEfd004531;
 Wed, 11 Jan 2023 01:47:14 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3n1kkyr0gt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jan 2023 01:47:14 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30B1lB6c44958206
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Jan 2023 01:47:11 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21E3F20043;
 Wed, 11 Jan 2023 01:47:11 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B81D820040;
 Wed, 11 Jan 2023 01:47:10 +0000 (GMT)
Received: from heavy.lan (unknown [9.179.23.250])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 11 Jan 2023 01:47:10 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-devel@nongnu.org, 
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 1/3] linux-user: Clean up when exiting due to a signal
Date: Wed, 11 Jan 2023 02:47:03 +0100
Message-Id: <20230111014705.2275040-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111014705.2275040-1-iii@linux.ibm.com>
References: <20230111014705.2275040-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 05UeaX87ZC6Zp9ZCbEzRSCxcIo_709wi
X-Proofpoint-GUID: 05UeaX87ZC6Zp9ZCbEzRSCxcIo_709wi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-10_10,2023-01-10_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=790 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301110008
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

When exiting due to an exit() syscall, qemu-user calls
preexit_cleanup(), but this is currently not the case when exiting due
to a signal. This leads to various buffers not being flushed (e.g.,
for gprof, for gcov, and for the upcoming perf support).

Add the missing call.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
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


