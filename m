Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4663975DE
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 16:57:27 +0200 (CEST)
Received: from localhost ([::1]:56422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo5pe-0004W2-Fr
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 10:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1lo5oU-0003AM-6i
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 10:56:14 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:52894
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1lo5oO-0007Xx-6b
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 10:56:13 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 151EWpl9162140; Tue, 1 Jun 2021 10:56:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ag0NQqdOJs/acIuSGcMmE1KbFrZ2MoXZlgd7Ov7ZNhg=;
 b=HW0fStW6KBCnLHWNRT+XvkXCIjDgPyUashlrylF1Q/HpOORH3D23Zt8hnRDnDifsV4nY
 5osJBDT9hrZ8gShMuYb/xjvs7tVNUPnM4gj+5iNAcInp+8IKUM8Bhl4QZnYZ+geLKKyV
 BHvptRhWat+R9Na9berSPhvJyb1qXIYj/ucVrcVMyJwZLLXd+zrHW0QByZQ4JylRfkEs
 fHOwQ6rkydaQ7drLdjWiSv/0sSEttWFfekMHl2xO9PjFvbs6ym8GDm8D53a+V8ZFSeHq
 aV8G69KNm65ViF5JJL9vQX2SD4wmBGjXInjV1OjPtML3S8tY3Jj6NEs6+p/HCAmME2IU mA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38wntdauby-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jun 2021 10:56:06 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 151Esa9i032530;
 Tue, 1 Jun 2021 14:56:05 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 38ud889t06-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jun 2021 14:56:05 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 151EtWI636962778
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Jun 2021 14:55:32 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B6B9AE055;
 Tue,  1 Jun 2021 14:56:02 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1BA38AE053;
 Tue,  1 Jun 2021 14:56:02 +0000 (GMT)
Received: from vm.lan (unknown [9.145.39.144])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  1 Jun 2021 14:56:02 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 1/2] linux-user: Let sigaction query SIGKILL/SIGSTOP
Date: Tue,  1 Jun 2021 16:55:59 +0200
Message-Id: <20210601145600.3131040-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210601145600.3131040-1-iii@linux.ibm.com>
References: <20210601145600.3131040-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7ujH6G9RE4jZ3Zit6oJeRUdJ2Jh7sZrO
X-Proofpoint-GUID: 7ujH6G9RE4jZ3Zit6oJeRUdJ2Jh7sZrO
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-01_07:2021-06-01,
 2021-06-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106010098
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The kernel allows doing this, so let's allow this in qemu as well.
Valgrind relies on this.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 linux-user/signal.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index 9016896dcd..bc3431708f 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -851,7 +851,11 @@ int do_sigaction(int sig, const struct target_sigaction *act,
 
     trace_signal_do_sigaction_guest(sig, TARGET_NSIG);
 
-    if (sig < 1 || sig > TARGET_NSIG || sig == TARGET_SIGKILL || sig == TARGET_SIGSTOP) {
+    if (sig < 1 || sig > TARGET_NSIG) {
+        return -TARGET_EINVAL;
+    }
+
+    if (act && (sig == TARGET_SIGKILL || sig == TARGET_SIGSTOP)) {
         return -TARGET_EINVAL;
     }
 
-- 
2.31.1


