Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E87243BC38A
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 23:07:14 +0200 (CEST)
Received: from localhost ([::1]:45584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Vo9-0004rZ-BU
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 17:07:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1m0Vlq-0000jN-7o; Mon, 05 Jul 2021 17:04:50 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:22426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1m0Vln-0002rS-A2; Mon, 05 Jul 2021 17:04:49 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 165L3kVn180921; Mon, 5 Jul 2021 17:04:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=itnAzu3AQM2OWoQBRIc00sO/drUn6+XzNkxQpU/+Zxo=;
 b=JgsK6C4+mqfKttc8gAOOzy1786aILGgrw6lmIPU25iL7Jcd8s6KHgtF+LcZMfTd8MqYH
 BVUJ4L+wnSYWiHVOHfNL2h5/8OqTSAiOLxkOKMupN05zjj6NTRQ30X5Cxkxfly7MqGRX
 kNYcuwesj6PSu8UGvajAE43LH6OtCkOXkAx24iNcqsHpNolMg6JnKF3KzDx10tKNIOKX
 SFJINIhU3ankhZzXa+nbe+gByQk3ZfEEfyXwHlrhpNwFst0qWCnEIyLHKc+q/jxo95VO
 XDeW3pDD6xd9UsQ9XQO3KW1A+eu0RZknb3KN3y1tQZrb7BtbhSPPkXjKfVEDqcrovubS +w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39m58y60hv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Jul 2021 17:04:45 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 165L4iZm183016;
 Mon, 5 Jul 2021 17:04:44 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39m58y60h7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Jul 2021 17:04:44 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 165L3RTb021403;
 Mon, 5 Jul 2021 21:04:42 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 39jfh8rxw4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Jul 2021 21:04:42 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 165L4cUw31392254
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 5 Jul 2021 21:04:38 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E25511C04C;
 Mon,  5 Jul 2021 21:04:38 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8586E11C058;
 Mon,  5 Jul 2021 21:04:37 +0000 (GMT)
Received: from vm.lan (unknown [9.145.62.121])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  5 Jul 2021 21:04:37 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v6 1/2] target/s390x: Fix SIGILL and SIGFPE psw.addr reporting
Date: Mon,  5 Jul 2021 23:04:33 +0200
Message-Id: <20210705210434.45824-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210705210434.45824-1-iii@linux.ibm.com>
References: <20210705210434.45824-1-iii@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xnJJm7pG7M6AfwnSdHR3L9KhH9j8VsCB
X-Proofpoint-ORIG-GUID: Uae3KkZhKEYx8VNZ3POnAbAC60IABKtx
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-05_11:2021-07-02,
 2021-07-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 clxscore=1015
 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107050113
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "jonathan . albrecht" <jonathan.albrecht@linux.vnet.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Ulrich Weigand <ulrich.weigand@de.ibm.com>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For SIGILL, SIGFPE and SIGTRAP the PSW must point after the
instruction, and at the instruction for other signals. Currently under
qemu-user for SIGFILL and SIGFPE it points at the instruction.

Fix by advancing psw.addr for these signals.

Buglink: https://gitlab.com/qemu-project/qemu/-/issues/319
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Co-developed-by: Ulrich Weigand <ulrich.weigand@de.ibm.com>
---
 linux-user/s390x/cpu_loop.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/linux-user/s390x/cpu_loop.c b/linux-user/s390x/cpu_loop.c
index 30568139df..6e7dfb290a 100644
--- a/linux-user/s390x/cpu_loop.c
+++ b/linux-user/s390x/cpu_loop.c
@@ -64,7 +64,13 @@ void cpu_loop(CPUS390XState *env)
         case EXCP_DEBUG:
             sig = TARGET_SIGTRAP;
             n = TARGET_TRAP_BRKPT;
-            goto do_signal_pc;
+            /*
+             * For SIGTRAP the PSW must point after the instruction, which it
+             * already does thanks to s390x_tr_tb_stop(). si_addr doesn't need
+             * to be filled.
+             */
+            addr = 0;
+            goto do_signal;
         case EXCP_PGM:
             n = env->int_pgm_code;
             switch (n) {
@@ -133,6 +139,10 @@ void cpu_loop(CPUS390XState *env)
 
         do_signal_pc:
             addr = env->psw.addr;
+            /*
+             * For SIGILL and SIGFPE the PSW must point after the instruction.
+             */
+            env->psw.addr += env->int_pgm_ilen;
         do_signal:
             info.si_signo = sig;
             info.si_errno = 0;
-- 
2.31.1


