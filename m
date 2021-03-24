Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7D0348111
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 19:59:52 +0100 (CET)
Received: from localhost ([::1]:54056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP8jP-0008Ht-Jh
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 14:59:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <krebbel@linux.ibm.com>)
 id 1lP8bU-0000t3-1f; Wed, 24 Mar 2021 14:51:41 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:14924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <krebbel@linux.ibm.com>)
 id 1lP8bS-0004Fg-CW; Wed, 24 Mar 2021 14:51:39 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12OIXApP082171; Wed, 24 Mar 2021 14:51:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=MgeyTmytqb04yTkJKNfxfw9IlY9mjmm5dATlu+ylkn8=;
 b=W6MU94T8zNRmUqX1iC6jv8Q2fY9Hv1e4KjDC0OvpFVYfLrJ66UBx4HIHNpTEONYpgXS+
 mR0+vvKfpiVlAX69hbb4WVf/ZNTn2iXdUKygmjgHnUCuDJA2qtx/af8cogs3TtiFl3Pp
 jXbMSw+Oh540OtKM1FoIo92Mg4Gm50P7sHFY/gdjf5HLdA5thze7lFnQwXBC/z3MF2Ni
 9xEUBkwcWpXTRruEuV/1MkZvChGXJSgTDh4Ttrwt2sIkNWn6ugoeQ6P0MPXgU6zBnqUK
 PePjiFQWU9uLlqR1YO1cS7nrOuTHqBwGKdugpSc7JHzFNrmz0TWvCaKz2c45zNp4ze+G 1A== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37gamu0ma3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Mar 2021 14:51:35 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12OIkxJL031375;
 Wed, 24 Mar 2021 18:51:33 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 37d99rcmg8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Mar 2021 18:51:32 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12OIpUVA11927902
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Mar 2021 18:51:30 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 910F3A407C;
 Wed, 24 Mar 2021 18:51:29 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5194DA4067;
 Wed, 24 Mar 2021 18:51:29 +0000 (GMT)
Received: from li-23497a81-5215-11cb-9bae-a81330ecc14b.ibm.com.com (unknown
 [9.171.8.85])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 24 Mar 2021 18:51:29 +0000 (GMT)
From: Andreas Krebbel <krebbel@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] linux-user/s390x: Use the guest pointer for the sigreturn
 stub
Date: Wed, 24 Mar 2021 19:51:28 +0100
Message-Id: <20210324185128.63971-1-krebbel@linux.ibm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-24_13:2021-03-24,
 2021-03-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103240133
Received-SPF: pass client-ip=148.163.156.1; envelope-from=krebbel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, richard.henderson@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When setting up the pointer for the sigreturn stub in the return
address register (r14) we currently use the host frame address instead
of the guest frame address.

Note: This only caused problems if Qemu has been built with
--disable-pie (as it is in distros nowadays). Otherwise guest_base
defaults to 0 hiding the actual problem.

Signed-off-by: Andreas Krebbel <krebbel@linux.ibm.com>
---
 linux-user/s390x/signal.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index ecfa2a14a9..7107c5fb53 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -211,9 +211,10 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     /* Set up to return from userspace.  If provided, use a stub
        already in userspace.  */
     if (ka->sa_flags & TARGET_SA_RESTORER) {
-        env->regs[14] = (unsigned long) ka->sa_restorer | PSW_ADDR_AMODE;
+        env->regs[14] = ka->sa_restorer | PSW_ADDR_AMODE;
     } else {
-        env->regs[14] = (unsigned long) frame->retcode | PSW_ADDR_AMODE;
+        env->regs[14] = (frame_addr + offsetof(typeof(*frame), retcode))
+                        | PSW_ADDR_AMODE;
         __put_user(S390_SYSCALL_OPCODE | TARGET_NR_rt_sigreturn,
                    (uint16_t *)(frame->retcode));
     }
-- 
2.30.2


