Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C51F4489F12
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 19:19:40 +0100 (CET)
Received: from localhost ([::1]:47056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6zGd-0005Ep-Tv
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 13:19:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n6zDJ-0000ZE-2v; Mon, 10 Jan 2022 13:16:16 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:59916
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n6zDH-0002WQ-NC; Mon, 10 Jan 2022 13:16:12 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20AHZmoR018600; 
 Mon, 10 Jan 2022 18:16:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=SJgLZ70UtZbOtmSTItllmiElfK1OYxAQK4PWTzajQg8=;
 b=XsHHmNhBslfd7C6NjxLvwAPIhvhKibrg6IbDZrm63WgDfzgbhE1w+Pdq3PxAfkXJ0PN9
 0vUqKToVJ4D0k0hQYi5o2I8sA6Bu2tP9u2YbpAQxL7taGiYCPCgaEnwTOV8qNhzMJ72x
 fFItQbD5luCCEpY+ybYIAHaIiQkXKw7Q0m85Bo4gMTIN+xZJV86FWXWcaLTjIEjRnGiB
 zGOeK2COBimnAotYMOOHRA12zVSLvthlx+QH/X0YuYy27cpNX2FhSW2WYn9SyY3Nzs5e
 qPFBbqxhEWLSSrPLvDEMcwUcfUc11QTGNDEmMFcGSOgzBbo+AcZlDxvY0qg7LJclIp3J mg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dfm04sw33-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 18:16:00 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20AHq4ZI016686;
 Mon, 10 Jan 2022 18:15:59 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dfm04sw2r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 18:15:59 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20AI84De003144;
 Mon, 10 Jan 2022 18:15:59 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03wdc.us.ibm.com with ESMTP id 3df289tkx2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 18:15:59 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20AIFwdL20054290
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jan 2022 18:15:58 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 512857806A;
 Mon, 10 Jan 2022 18:15:58 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7762C78060;
 Mon, 10 Jan 2022 18:15:56 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.79.41])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 10 Jan 2022 18:15:56 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/8] target/ppc: 405: Add missing exception handlers
Date: Mon, 10 Jan 2022 15:15:40 -0300
Message-Id: <20220110181546.4131853-3-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110181546.4131853-1-farosas@linux.ibm.com>
References: <20220110181546.4131853-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cYIOUF0BA93WEh4h5M_olaqiv-Or0g7V
X-Proofpoint-ORIG-GUID: v9yjadCKN-Xx27nuunFcE7EKoXzCcVpv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_07,2022-01-10_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201100124
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu_init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index a50ddaeaae..9097948e67 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -1951,7 +1951,9 @@ static void init_excp_4xx_softmmu(CPUPPCState *env)
     env->excp_vectors[POWERPC_EXCP_EXTERNAL] = 0x00000500;
     env->excp_vectors[POWERPC_EXCP_ALIGN]    = 0x00000600;
     env->excp_vectors[POWERPC_EXCP_PROGRAM]  = 0x00000700;
+    env->excp_vectors[POWERPC_EXCP_FPU]      = 0x00000800;
     env->excp_vectors[POWERPC_EXCP_SYSCALL]  = 0x00000C00;
+    env->excp_vectors[POWERPC_EXCP_APU]      = 0x00000F20;
     env->excp_vectors[POWERPC_EXCP_PIT]      = 0x00001000;
     env->excp_vectors[POWERPC_EXCP_FIT]      = 0x00001010;
     env->excp_vectors[POWERPC_EXCP_WDT]      = 0x00001020;
-- 
2.33.1


