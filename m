Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EE1596E91
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 14:42:02 +0200 (CEST)
Received: from localhost ([::1]:36084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOIMz-0004om-CW
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 08:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oOIKK-0002zO-PN
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 08:39:17 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:62734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oOIKI-00073C-Nm
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 08:39:16 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27HBarWY026167;
 Wed, 17 Aug 2022 12:39:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=BBqwqMoWI+GH8k6zfSdmpHTLp7kl+HxOF4A2Dc9Bs00=;
 b=gjTj4B0gkhF2zGEJVjhm3YK98irMQJtWC0WNn9TmhwieYWvCIMPN9kNSYyE1PltPnqHl
 HqxemAPbUrJJEVGBjl9I3ce1kxNTufkZJyeeXAiZigFB0u+TFU9uPgC9sz/Ti0BG7JR+
 PJ0ZwpUjdMdO+VDUlabA1m9sPFN2c1wk9imLoY9BRQCwLduQQ6iYHQ3Kwma0d920FpC/
 V/7d6nWU0LgYvxrttJ+dOqaHnvKiaqL41HiJCn+Ph2quDeVdeyNZAcHR37mjwjfmaEwl
 HjZmUjQjIhULGGer/Bcb6V+Wd80FSbT8PEkcE2bBrCI1OsuTOcc23DAnv8pMO5Ott8q/ fQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j0ya7299p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Aug 2022 12:39:11 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27HCYFIW005636;
 Wed, 17 Aug 2022 12:39:11 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j0ya72984-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Aug 2022 12:39:11 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27HCbHvc023705;
 Wed, 17 Aug 2022 12:39:09 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 3hx37j3c9a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Aug 2022 12:39:08 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 27HCdPrc18612506
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Aug 2022 12:39:25 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7621611C04A;
 Wed, 17 Aug 2022 12:39:06 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1EA6711C050;
 Wed, 17 Aug 2022 12:39:06 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.21.185])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 17 Aug 2022 12:39:06 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH] linux-user/s390x: Save/restore fpc when handling a signal
Date: Wed, 17 Aug 2022 14:39:02 +0200
Message-Id: <20220817123902.585623-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IFJ9Zen3ivmy0Kc6i8bMDcqw9GY1Drfm
X-Proofpoint-ORIG-GUID: K2CoTGZ2C9HomlXhfJl_QCXQjJsSUL1W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-17_08,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 clxscore=1015 mlxscore=0 priorityscore=1501
 mlxlogscore=949 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208170049
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Linux kernel does this in fpregs_store() and fpregs_load(), so
qemu-user should do this as well.

Found by running valgrind's none/tests/s390x/test_sig.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 linux-user/s390x/signal.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index 4979c4b017..f72165576f 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -146,6 +146,7 @@ static void save_sigregs(CPUS390XState *env, target_sigregs *sregs)
      * We have to store the fp registers to current->thread.fp_regs
      * to merge them with the emulated registers.
      */
+    __put_user(env->fpc, &sregs->fpregs.fpc);
     for (i = 0; i < 16; i++) {
         __put_user(*get_freg(env, i), &sregs->fpregs.fprs[i]);
     }
@@ -331,6 +332,7 @@ static void restore_sigregs(CPUS390XState *env, target_sigregs *sc)
     for (i = 0; i < 16; i++) {
         __get_user(env->aregs[i], &sc->regs.acrs[i]);
     }
+    __get_user(env->fpc, &sc->fpregs.fpc);
     for (i = 0; i < 16; i++) {
         __get_user(*get_freg(env, i), &sc->fpregs.fprs[i]);
     }
-- 
2.37.1


