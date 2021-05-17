Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DEF386C6F
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 23:41:48 +0200 (CEST)
Received: from localhost ([::1]:37020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1likzi-00086B-Dq
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 17:41:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pc@us.ibm.com>)
 id 1likyu-0007IL-4U; Mon, 17 May 2021 17:40:56 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:63546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pc@us.ibm.com>)
 id 1likyr-0007CU-Ni; Mon, 17 May 2021 17:40:55 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14HLXUGn166414; Mon, 17 May 2021 17:40:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=aHFQHOPTVPSJ0k6mNQMVIKzjQnHFeYuBqjdVGs2eMz8=;
 b=DQ0OL4N22ApKs50LKVpDz4hbRLXG9TRBkQ19ymYn2oAj2WhenKwypes74MMJauQv1pPM
 8w/xPKH69E6EVNmkSxvGWn5oT1ZiukA2hD39sLlor2u+Og55C84a21aH+yJv8H08ioAu
 5RV4y0MtRG/4RDBtX+W0gq+ucOTb/5sd18yewdiSq1FysMUOmq51I5mOlQaR+V3DyGbg
 q8000QnC6RNloVyULJ03gjYB8mFLvkbLm8PUr7eTfoGPeE7S2YG9hwOA5utCGuxgIIvM
 2mVF1Q37BqHPiliiqlK69UTIWfZA674j60iSQsE/7UEhzsZj9PFCV2kofitcPvYw8vS6 HQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38kwk7cpq8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 May 2021 17:40:46 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14HLYDJK167482;
 Mon, 17 May 2021 17:40:45 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38kwk7cpq2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 May 2021 17:40:45 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14HLQumY005005;
 Mon, 17 May 2021 21:40:45 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 38j5x96us0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 May 2021 21:40:45 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14HLeido24969698
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 May 2021 21:40:44 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 457CAB206A;
 Mon, 17 May 2021 21:40:44 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 19C4FB205F;
 Mon, 17 May 2021 21:40:44 +0000 (GMT)
Received: from localhost (unknown [9.85.176.192])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 17 May 2021 21:40:43 +0000 (GMT)
From: "Paul A. Clarke" <pc@us.ibm.com>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: [PATCH] Fix `lxvdsx` (issue #212)
Date: Mon, 17 May 2021 16:40:32 -0500
Message-Id: <20210517214032.156187-1-pc@us.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dhAL6wyMuVxBVL6ApYPlqbqg8RLhDq_0
X-Proofpoint-GUID: qEgegHhP2OfQ4nj6ON3oObw7OBY6hGR6
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-17_09:2021-05-17,
 2021-05-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0
 malwarescore=0 clxscore=1011 spamscore=0 bulkscore=0 priorityscore=1501
 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105170151
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pc@us.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Giuseppe Musacchio <thatlemon@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

`lxvdsx` is byte-swapping the data it loads, which it should not
do.  Fix it.

Fixes #212.

Fixes: bcb0b7b1a1c05707304f80ca6f523d557816f85c
Signed-off-by:  Paul A. Clarke <pc@us.ibm.com
---
 target/ppc/translate/vsx-impl.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index b817d31260bb..46f97c029ca8 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -162,7 +162,7 @@ static void gen_lxvdsx(DisasContext *ctx)
     gen_addr_reg_index(ctx, EA);
 
     data = tcg_temp_new_i64();
-    tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, MO_TEQ);
+    tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, MO_LEQ);
     tcg_gen_gvec_dup_i64(MO_Q, vsr_full_offset(xT(ctx->opcode)), 16, 16, data);
 
     tcg_temp_free(EA);
-- 
2.27.0


