Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 839D034791D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 13:57:54 +0100 (CET)
Received: from localhost ([::1]:39158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP357-0004W3-5e
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 08:57:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <krebbel@linux.ibm.com>)
 id 1lOzEp-0005DY-As; Wed, 24 Mar 2021 04:51:39 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:18920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <krebbel@linux.ibm.com>)
 id 1lOzEn-00012S-EW; Wed, 24 Mar 2021 04:51:39 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12O8XFvD158976; Wed, 24 Mar 2021 04:51:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=FfrMxsp1M2oyhLOtBxYpE3gAVkADQPzA9LWqhQkqNCo=;
 b=ADR2xpKYASXKEoV5UhMVHx5dE0o1bzwcWxEXjw/IivnzqRdapJoAfQKSrltFxfvI8moe
 rGd8M9p0e3RBe50S27nxHVXwYd0C8Exba16i9zY3wde6/7Lx5U82Owe9/Gs4+lk2loyF
 N92OX+WrWaL32b4KfXy2OrcBO9XJlFmpK3MBGep8NyHAUD95u8c132TQgqnpbsowuLIU
 DlBlwiX2Bps+EXKoX+EXOI5DNw4toF2At6xU/saFCaHI6JJzQalT9wAnf8rWpvusEWh8
 LBdUoAbsFT0aRUuhUBsFa9PzibCTz8sYNDReLLtr88LnoJo8biq0HN+8j/xbBjWMbqWt hQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37fuq496x8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Mar 2021 04:51:34 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12O8XYI0160489;
 Wed, 24 Mar 2021 04:51:34 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37fuq496wb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Mar 2021 04:51:34 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12O8m6XV008333;
 Wed, 24 Mar 2021 08:51:32 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 37d9a6j5ct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Mar 2021 08:51:32 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 12O8pBfP32375232
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Mar 2021 08:51:11 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF5BF11C05E;
 Wed, 24 Mar 2021 08:51:29 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A50F111C04A;
 Wed, 24 Mar 2021 08:51:29 +0000 (GMT)
Received: from li-23497a81-5215-11cb-9bae-a81330ecc14b.ibm.com.com (unknown
 [9.171.94.33]) by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 24 Mar 2021 08:51:29 +0000 (GMT)
From: Andreas Krebbel <krebbel@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] linux-user/s390x: Apply h2g to address of sigreturn stub
Date: Wed, 24 Mar 2021 09:51:29 +0100
Message-Id: <20210324085129.29684-1-krebbel@linux.ibm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-24_05:2021-03-24,
 2021-03-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 adultscore=0 clxscore=1011 suspectscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103240067
Received-SPF: pass client-ip=148.163.158.5; envelope-from=krebbel@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 24 Mar 2021 08:50:04 -0400
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
Cc: qemu-s390x@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The sigreturn SVC is put onto the stack by the emulation code.  Hence
the address of it should not be subject to guest_base transformation
when fetching it.

The fix applies h2g to the address when writing it into the return
address register to nullify the transformation applied to it later.

Note: This only caused problems if Qemu has been built with
--disable-pie (as it is in distros nowadays). Otherwise guest_base
defaults to 0 hiding the actual problem.

Signed-off-by: Andreas Krebbel <krebbel@linux.ibm.com>
---
 linux-user/s390x/signal.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index ecfa2a14a9..1412376958 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -152,7 +152,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
         env->regs[14] = (unsigned long)
                 ka->sa_restorer | PSW_ADDR_AMODE;
     } else {
-        env->regs[14] = (frame_addr + offsetof(sigframe, retcode))
+        env->regs[14] = h2g(frame_addr + offsetof(sigframe, retcode))
                         | PSW_ADDR_AMODE;
         __put_user(S390_SYSCALL_OPCODE | TARGET_NR_sigreturn,
                    (uint16_t *)(frame->retcode));
@@ -213,7 +213,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     if (ka->sa_flags & TARGET_SA_RESTORER) {
         env->regs[14] = (unsigned long) ka->sa_restorer | PSW_ADDR_AMODE;
     } else {
-        env->regs[14] = (unsigned long) frame->retcode | PSW_ADDR_AMODE;
+        env->regs[14] = (unsigned long) h2g(frame->retcode) | PSW_ADDR_AMODE;
         __put_user(S390_SYSCALL_OPCODE | TARGET_NR_rt_sigreturn,
                    (uint16_t *)(frame->retcode));
     }
-- 
2.30.2


