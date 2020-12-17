Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9077A2DD414
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 16:24:46 +0100 (CET)
Received: from localhost ([::1]:60754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpv93-0000IY-Lc
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 10:24:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kpukK-0002ql-AN; Thu, 17 Dec 2020 09:59:13 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:19746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kpukG-0007AY-Jw; Thu, 17 Dec 2020 09:59:11 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BHEVhpC049461; Thu, 17 Dec 2020 09:59:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=QEIR9pogHombf8rr59M2NB/yM19mYZSwKConFwUYMG0=;
 b=fpbf1x2KvXtSQrAODGuXcWZzL5GhwXxlJwO8AiIygvrfiux5B6lNeBYjhFy1Tw9u3wqb
 v6u1UW/Jv2nWsHw5AunV5/zUWjwj0AXMR21Lfow5+8FXkXVtU24RZFDrcGnmT9+ueLcy
 C0m5nmmy5g21rgQ/wfYLT6FsjvbjQANiz8wnm1U4OIuux33aHUE2cJbxBC8EIFAl+5Fc
 kbX4meNzKcn0gKmJNrqQ6/cDHr3M8HMgBB+IjogIfE/CdcFe7U3D3W6uZuLeG4BS1Jrz
 bFyqPxccmGCLSGs0jN+7bzVRj9Hm4nJdGgSg5cB4pPFt87GHPfbTPTfRJjEfFsqhreHO kw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35g93agur6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Dec 2020 09:59:06 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BHEW7ck050689;
 Thu, 17 Dec 2020 09:59:05 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35g93aguqa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Dec 2020 09:59:05 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BHEwN09028293;
 Thu, 17 Dec 2020 14:59:03 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04wdc.us.ibm.com with ESMTP id 35cng9g9t1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Dec 2020 14:59:03 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BHEx2Q821561752
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Dec 2020 14:59:02 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E0326E053;
 Thu, 17 Dec 2020 14:59:02 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F4186E04C;
 Thu, 17 Dec 2020 14:59:01 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.211.143.229])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 17 Dec 2020 14:59:00 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: cohuck@redhat.com, thuth@redhat.com
Subject: [PATCH 1/2] s390x/pci: fix pcistb length
Date: Thu, 17 Dec 2020 09:58:55 -0500
Message-Id: <1608217136-5690-2-git-send-email-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1608217136-5690-1-git-send-email-mjrosato@linux.ibm.com>
References: <1608217136-5690-1-git-send-email-mjrosato@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-17_09:2020-12-15,
 2020-12-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 suspectscore=0 spamscore=0 mlxlogscore=982 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012170099
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: pmorel@linux.ibm.com, david@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In pcistb_service_call, we are grabbing 8 bits from a guest register to
indicate the length of the store operation -- but per the architecture
the length is actually defined by 13 bits of the guest register.

Fixes: 863f6f52b7 ("s390: implement pci instructions")
Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
---
 hw/s390x/s390-pci-inst.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index d9e1e29..e230293 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -755,7 +755,7 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, uint8_t r3, uint64_t gaddr,
     int i;
     uint32_t fh;
     uint8_t pcias;
-    uint8_t len;
+    uint16_t len;
     uint8_t buffer[128];
 
     if (env->psw.mask & PSW_MASK_PSTATE) {
@@ -765,7 +765,7 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, uint8_t r3, uint64_t gaddr,
 
     fh = env->regs[r1] >> 32;
     pcias = (env->regs[r1] >> 16) & 0xf;
-    len = env->regs[r1] & 0xff;
+    len = env->regs[r1] & 0x1fff;
     offset = env->regs[r3];
 
     if (!(fh & FH_MASK_ENABLE)) {
-- 
1.8.3.1


