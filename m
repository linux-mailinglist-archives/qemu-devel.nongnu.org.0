Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66ACA347D1F
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 16:57:30 +0100 (CET)
Received: from localhost ([::1]:40096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP5su-0002Ro-Ue
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 11:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <krebbel@linux.ibm.com>)
 id 1lP5rA-0001Vx-NV; Wed, 24 Mar 2021 11:55:40 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:29858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <krebbel@linux.ibm.com>)
 id 1lP5r8-0007j5-Pj; Wed, 24 Mar 2021 11:55:40 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12OFqpxL109999; Wed, 24 Mar 2021 11:55:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=SXePBzNvIx/Yb7/MnpOqDUxCWmjiyaQ9GP7V/r3s5dw=;
 b=NZ6Zq3a4jycaX66eNZiNDw6LUptl9LoM4Vyam5fims9DT34/kZghqk+jpYg9gNZhhUFK
 LqkA98Ivn8YUC9HvHI4HnluXPw5SxXEHM2ElfxqynyGhinEP48aDOznTvtRD+wbrDhAh
 jyEhcBOc8ST23nJ3scf73dZNQ29fCLfKa3p42SYbZf3kF79WtWuPsGX6vz2xDBu+WhJy
 j4gYVhZThMSzTXlohgMQWPbuL19Wd84iEoywKGI+XjjjThYtMldhIhTqIPWut+tNCq2g
 49Gk2FJ8HbhY38Fx03fjR+c1KjmVsVLWbhoB5giqeRPfR2uwA35PQsGqhH9f0TTdXMWc 3w== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37g8f402mb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Mar 2021 11:55:35 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12OFr6bQ023462;
 Wed, 24 Mar 2021 15:55:33 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 37d9d8tc0b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Mar 2021 15:55:33 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12OFtV0n37552564
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Mar 2021 15:55:31 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 05142A405B;
 Wed, 24 Mar 2021 15:55:31 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A6168A4054;
 Wed, 24 Mar 2021 15:55:30 +0000 (GMT)
Received: from li-23497a81-5215-11cb-9bae-a81330ecc14b.ibm.com.com (unknown
 [9.171.8.85])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 24 Mar 2021 15:55:30 +0000 (GMT)
From: Andreas Krebbel <krebbel@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] linux-user/s390x: Use the guest pointer for the sigreturn
 stub
Date: Wed, 24 Mar 2021 16:55:30 +0100
Message-Id: <20210324155530.52239-1-krebbel@linux.ibm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <be03acc3-8e9f-4715-6936-68013c49b920@vivier.eu>
References: <be03acc3-8e9f-4715-6936-68013c49b920@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-24_13:2021-03-24,
 2021-03-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 clxscore=1011 mlxlogscore=990 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103240116
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
address register (r14) we have to use the guest frame pointer instead
of the host frame pointer.

Note: This only caused problems if Qemu has been built with
--disable-pie (as it is in distros nowadays). Otherwise guest_base
defaults to 0 hiding the actual problem.

Signed-off-by: Andreas Krebbel <krebbel@linux.ibm.com>
---
 linux-user/s390x/signal.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index ecfa2a14a9..e9bf865074 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -213,7 +213,8 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     if (ka->sa_flags & TARGET_SA_RESTORER) {
         env->regs[14] = (unsigned long) ka->sa_restorer | PSW_ADDR_AMODE;
     } else {
-        env->regs[14] = (unsigned long) frame->retcode | PSW_ADDR_AMODE;
+        env->regs[14] = (target_ulong) (frame_addr + offsetof(rt_sigframe, retcode))
+                        | PSW_ADDR_AMODE;
         __put_user(S390_SYSCALL_OPCODE | TARGET_NR_rt_sigreturn,
                    (uint16_t *)(frame->retcode));
     }
-- 
2.30.2


