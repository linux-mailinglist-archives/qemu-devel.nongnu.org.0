Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBF946D36B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 13:37:25 +0100 (CET)
Received: from localhost ([::1]:55250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muwCK-0004ue-Us
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 07:37:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1muw7z-0007FH-Il; Wed, 08 Dec 2021 07:32:55 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:41792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1muw7x-0005i3-0k; Wed, 08 Dec 2021 07:32:55 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B8CJHto024840; 
 Wed, 8 Dec 2021 12:32:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=2lfXhwD2z9c50b60XdTWXXrhov1aDi2H+JXMI8vnmnE=;
 b=VhSDzDrKak9riI+MmQOD+PM55OiF8BLbkW6XrNOd1RRpLp1PuauBYKLPcof4S1EoQWGp
 GjBEXdjy22/aZ8U1ux9+dcfvAEMCrvg09y8Fc6Hrf8VyRBmJfwiXNkFzElc2Nx2/mH+h
 QmTBw8QwpKOq62lY/XPTP252zWTjJkkGcVycZRnGYHbVaP17Iy7yFSieWwjcxt5rbbJ/
 vQpqewCnqSdhjCOsI/3iMLmnhNRLjptU9n7pOSa09zJu4Q6stWoRZEZDQjxhmtp1UEQp
 Ts814eb5ZZzdYHX8z432eiUc6NZkI5PT0JYRWYeWLjvoXzq9qkjNnERa9D7KzgPEyIkU DQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ctvkp07p4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 12:32:45 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B8CNcIV007743;
 Wed, 8 Dec 2021 12:32:45 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ctvkp07nu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 12:32:45 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B8CWVgT008185;
 Wed, 8 Dec 2021 12:32:44 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma01wdc.us.ibm.com with ESMTP id 3cqyyb0w0w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 12:32:44 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B8CWhxE33685944
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Dec 2021 12:32:43 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7762678060;
 Wed,  8 Dec 2021 12:32:43 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E31617805F;
 Wed,  8 Dec 2021 12:32:41 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.43.72])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  8 Dec 2021 12:32:41 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] target/ppc: Set 601v exception model id
Date: Wed,  8 Dec 2021 09:30:29 -0300
Message-Id: <20211208123029.2052625-4-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211208123029.2052625-1-farosas@linux.ibm.com>
References: <20211208123029.2052625-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qtQiUN1808GMMiuabvRbTZ79vKgl641a
X-Proofpoint-ORIG-GUID: 5i7Sl0-L9fsE5PkRXFnyvwJm_kettd1M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-08_04,2021-12-08_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 mlxscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=908
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112080080
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The exception model id for 601v has been removed without mention
why. I assume it was inadvertent and restore it here.

Fixes: b632a148b6 ("target-ppc: Use QOM method dispatch for MMU fault handling")
Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu_init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 8100b89033..0e1682ddd9 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -4607,6 +4607,7 @@ POWERPC_FAMILY(601v)(ObjectClass *oc, void *data)
                     (1ull << MSR_IR) |
                     (1ull << MSR_DR);
     pcc->mmu_model = POWERPC_MMU_601;
+    pcc->excp_model = POWERPC_EXCP_601;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_601;
     pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_RTC_CLK | POWERPC_FLAG_HID0_LE;
-- 
2.33.1


