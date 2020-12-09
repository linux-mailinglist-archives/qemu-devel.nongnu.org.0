Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC15F2D4C06
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 21:39:38 +0100 (CET)
Received: from localhost ([::1]:35854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn6FN-00053o-MQ
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 15:39:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kn6Ar-0000A4-8l; Wed, 09 Dec 2020 15:34:57 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:6248
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kn6Ah-0005ne-Ub; Wed, 09 Dec 2020 15:34:57 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B9KWb99148320; Wed, 9 Dec 2020 15:34:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=LdsjPsU4tgFdv/ZBL9VRZ8B2P8HQBWn5e1Ra9CERVHg=;
 b=sNxRs7V/CIujT7DbxAnWsw9rL7ON8vA9w5MgcN4/oVf1MGr8lO+bRge82ZWPZskc2aax
 BWiYxMVtsuiQOuJHI8Pbi+xfzoiht12rldF1Ikz8rgckf4lvzp+7FEyN4dCjbrsdnJj9
 jcVXJOtQR9nggNOujzhjUEYnTVF2bE7zY4UMQsHBx3F9Ht9jirsXRP1hwR67ChtQSxwj
 +Yh5ADu64BlJtN9UOqqEpbZoZlkWHHHuKtWf3mFhtTI3LjFqHiyuwTs0plQ5FysJ3w2P
 ZmJp/yyxbEjijoTYRd6bNZA/O9t3HBCPZ52hlAAxiCwVXGIoqLPf75Kf/tDqeynIVLaR fQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35awxt7c1u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 15:34:42 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B9KYZ5l160883;
 Wed, 9 Dec 2020 15:34:41 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35awxt7c1b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 15:34:41 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B9KWbgQ023421;
 Wed, 9 Dec 2020 20:34:41 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03dal.us.ibm.com with ESMTP id 3581u9jswm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 20:34:41 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B9KYen326280210
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Dec 2020 20:34:40 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D723124058;
 Wed,  9 Dec 2020 20:34:40 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BBEE812405E;
 Wed,  9 Dec 2020 20:34:37 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.163.37.122])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  9 Dec 2020 20:34:37 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: cohuck@redhat.com, thuth@redhat.com
Subject: [RFC 3/8] s390x/pci: fix pcistb length
Date: Wed,  9 Dec 2020 15:34:21 -0500
Message-Id: <1607546066-2240-4-git-send-email-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1607546066-2240-1-git-send-email-mjrosato@linux.ibm.com>
References: <1607546066-2240-1-git-send-email-mjrosato@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-09_16:2020-12-09,
 2020-12-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=812 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012090140
Received-SPF: pass client-ip=148.163.158.5;
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
Cc: pmorel@linux.ibm.com, david@redhat.com, schnelle@linux.ibm.com,
 richard.henderson@linaro.org, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, alex.williamson@redhat.com,
 mst@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In pcistb_service_call, we are grabbing 8 bits from a guest register to
indicate the length of the store operation -- but per the architecture
the length is actually defined by 13 bits of the guest register.

Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
---
 hw/s390x/s390-pci-inst.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 70bfd91..db86f12 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -750,7 +750,7 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, uint8_t r3, uint64_t gaddr,
     int i;
     uint32_t fh;
     uint8_t pcias;
-    uint8_t len;
+    uint16_t len;
     uint8_t buffer[128];
 
     if (env->psw.mask & PSW_MASK_PSTATE) {
@@ -760,7 +760,7 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, uint8_t r3, uint64_t gaddr,
 
     fh = env->regs[r1] >> 32;
     pcias = (env->regs[r1] >> 16) & 0xf;
-    len = env->regs[r1] & 0xff;
+    len = env->regs[r1] & 0x1fff;
     offset = env->regs[r3];
 
     if (!(fh & FH_MASK_ENABLE)) {
-- 
1.8.3.1


