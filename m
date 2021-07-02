Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3160B3BA2E2
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 17:45:36 +0200 (CEST)
Received: from localhost ([::1]:56332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzLMF-00006K-8J
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 11:45:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lzLKQ-0006I4-1g; Fri, 02 Jul 2021 11:43:42 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:35646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lzLKN-0003EG-Cf; Fri, 02 Jul 2021 11:43:41 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 162Fa9Qi119915; Fri, 2 Jul 2021 11:43:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=9/blspux+xrthQW95zXNiiM4Vv0+BjVHDCssVuNdHVQ=;
 b=e8IpRESKA0Kz3T5/4pWYmVCKs8kxyIa/rHZpu1+ATtl0tbW7psYPUOcAn0PlNsekpJW7
 OW47wkTl1hb2lOqZlxaouiJkInFDEJHsRgjqI12fzX/tQPJDhCYbU/uBeoMPc62AZi9k
 b5kEU24LNPcKxbD2khy6kgnril8Uxj7Yy7ZGpTELkDkDjXv7FulirrXOre9EXIZtAfoJ
 DQWVRLoD1dOkPpeyEVlnrYheED3zVaGi2GReqTbmUqDip96JPeZFeOstlNnbLwiESkzc
 WOiC/dh+Wf8mFK4ydLZOUdiwIYXCOOgeGwUUrqkVb+aGqMEiAARTDeDGfVNrxENjac4T zg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39j53gh1n1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Jul 2021 11:43:29 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 162Fbes6030478;
 Fri, 2 Jul 2021 15:43:28 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma02dal.us.ibm.com with ESMTP id 39duvgdp8c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Jul 2021 15:43:28 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 162FhQMI28508598
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 2 Jul 2021 15:43:27 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D60B6BE056;
 Fri,  2 Jul 2021 15:43:26 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 90D0ABE053;
 Fri,  2 Jul 2021 15:43:25 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.44.184])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  2 Jul 2021 15:43:25 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] target/ppc: Fix compilation with DUMP_PAGE_TABLES debug
 option
Date: Fri,  2 Jul 2021 12:43:18 -0300
Message-Id: <20210702154319.1895048-2-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210702154319.1895048-1-farosas@linux.ibm.com>
References: <20210702154319.1895048-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AdwO4MYZexykAUX7MOXlbzr0naJT5Yex
X-Proofpoint-ORIG-GUID: AdwO4MYZexykAUX7MOXlbzr0naJT5Yex
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-02_08:2021-07-02,
 2021-07-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107020086
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
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
Cc: qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

../target/ppc/mmu_helper.c: In function 'get_segment_6xx_tlb':
../target/ppc/mmu_helper.c:514:46: error: passing argument 1 of
'ppc_hash32_hpt_mask' from incompatible pointer type [-Werror=incompatible-pointer-types]

  514 |                          ppc_hash32_hpt_mask(env) + 0x80);
      |                                              ^~~
      |                                              |
      |                                              CPUPPCState *

Fixes: 36778660d7 ("target/ppc: Eliminate htab_base and htab_mask variables")
Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/mmu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 1ecb36e85a..ff2c6bdd8c 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -511,7 +511,7 @@ static int get_segment_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
 
                 qemu_log("Page table: " TARGET_FMT_plx " len " TARGET_FMT_plx
                          "\n", ppc_hash32_hpt_base(cpu),
-                         ppc_hash32_hpt_mask(env) + 0x80);
+                         ppc_hash32_hpt_mask(cpu) + 0x80);
                 for (curaddr = ppc_hash32_hpt_base(cpu);
                      curaddr < (ppc_hash32_hpt_base(cpu)
                                 + ppc_hash32_hpt_mask(cpu) + 0x80);
-- 
2.29.2


