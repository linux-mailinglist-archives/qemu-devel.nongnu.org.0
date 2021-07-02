Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 889423BA550
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 23:54:51 +0200 (CEST)
Received: from localhost ([::1]:45708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzR7Z-0003tK-DI
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 17:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lzR5n-0001PO-NA; Fri, 02 Jul 2021 17:52:59 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:18114
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lzR5l-0001uy-PB; Fri, 02 Jul 2021 17:52:59 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 162LWXVm174964; Fri, 2 Jul 2021 17:52:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=9/blspux+xrthQW95zXNiiM4Vv0+BjVHDCssVuNdHVQ=;
 b=F8nHegH1GbGdi7kdEGMvSxMag91Rf1a6hDZ0AZ0I8zXnQS832IzM4xfZgwLxs0yqL899
 K+fWGUJ/Wl/AGg/x8OZFJubyn9NKT/3a++ZICbCGXFyqkdr0wvA9w2xmh5QVII7UrSVF
 M5H33IkCo9XbU5mNXWsGrdPK49G0yqr7tbrzyUuoGa1zzpSGsbapYMDSE5LgfaNy39yT
 g9JK0cyIVSvrSvDvB268alv3LgMt9kwZNyoI4vcf24Q2UfjjSibgHCgEeCWRyr2JqXY5
 4lpJAZwGLnwmJ5f9/6lwy2mmeJkDoPpPHCbQMBpkLoDTgNxHAS2R7Uzfgqj+WOyEbPtW tQ== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39j5hv7jxp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Jul 2021 17:52:45 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 162LfnK2002938;
 Fri, 2 Jul 2021 21:52:44 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 39hchk43e4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Jul 2021 21:52:44 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 162LqhIE45613452
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 2 Jul 2021 21:52:43 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EA4BBE053;
 Fri,  2 Jul 2021 21:52:43 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5ADEBE051;
 Fri,  2 Jul 2021 21:52:41 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.44.184])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  2 Jul 2021 21:52:41 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] target/ppc: Fix compilation with DUMP_PAGE_TABLES debug
 option
Date: Fri,  2 Jul 2021 18:52:33 -0300
Message-Id: <20210702215235.1941771-2-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210702215235.1941771-1-farosas@linux.ibm.com>
References: <20210702215235.1941771-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: gUR3Tb3yvnPivw2Fft1hSdcEwMDIx85P
X-Proofpoint-GUID: gUR3Tb3yvnPivw2Fft1hSdcEwMDIx85P
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-02_10:2021-07-02,
 2021-07-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 mlxlogscore=962 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107020110
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


