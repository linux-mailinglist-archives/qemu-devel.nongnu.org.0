Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7ECC44C7
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Oct 2019 02:10:37 +0200 (CEST)
Received: from localhost ([::1]:49580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFSDz-0001Le-W8
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 20:10:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39471)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mdroth@linux.vnet.ibm.com>) id 1iFRrv-0001Mw-K0
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 19:47:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mdroth@linux.vnet.ibm.com>) id 1iFRrt-0001k7-BR
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 19:47:47 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:25498
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mdroth@linux.vnet.ibm.com>)
 id 1iFRrl-0001Qr-Tv; Tue, 01 Oct 2019 19:47:38 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x91NlPOW179355; Tue, 1 Oct 2019 19:47:30 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vcdgpncr7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Oct 2019 19:47:29 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x91NjlT3023573;
 Tue, 1 Oct 2019 23:47:29 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma05wdc.us.ibm.com with ESMTP id 2v9y577gxh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Oct 2019 23:47:29 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x91NlRnn4129426
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Oct 2019 23:47:27 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B94672805A;
 Tue,  1 Oct 2019 23:47:27 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CFA328058;
 Tue,  1 Oct 2019 23:47:27 +0000 (GMT)
Received: from localhost (unknown [9.53.179.213])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  1 Oct 2019 23:47:27 +0000 (GMT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 30/97] target/ppc: Fix lxvw4x, lxvh8x and lxvb16x
Date: Tue,  1 Oct 2019 18:45:09 -0500
Message-Id: <20191001234616.7825-31-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191001234616.7825-1-mdroth@linux.vnet.ibm.com>
References: <20191001234616.7825-1-mdroth@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-01_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=955 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910010203
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
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
Cc: Anton Blanchard <anton@ozlabs.org>, qemu-stable@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anton Blanchard <anton@ozlabs.org>

During the conversion these instructions were incorrectly treated as
stores. We need to use set_cpu_vsr* and not get_cpu_vsr*.

Fixes: 8b3b2d75c7c0 ("introduce get_cpu_vsr{l,h}() and set_cpu_vsr{l,h}() helpers for VSR register access")
Signed-off-by: Anton Blanchard <anton@ozlabs.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-Id: <20190524065345.25591-1-mark.cave-ayland@ilande.co.uk>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
(upstream commit 2a1224359008e23b051b7b45be4789afa0269f8c)
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 target/ppc/translate/vsx-impl.inc.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/target/ppc/translate/vsx-impl.inc.c b/target/ppc/translate/vsx-impl.inc.c
index 7778d5d651..9e59e2a309 100644
--- a/target/ppc/translate/vsx-impl.inc.c
+++ b/target/ppc/translate/vsx-impl.inc.c
@@ -102,8 +102,7 @@ static void gen_lxvw4x(DisasContext *ctx)
     }
     xth = tcg_temp_new_i64();
     xtl = tcg_temp_new_i64();
-    get_cpu_vsrh(xth, xT(ctx->opcode));
-    get_cpu_vsrl(xtl, xT(ctx->opcode));
+
     gen_set_access_type(ctx, ACCESS_INT);
     EA = tcg_temp_new();
 
@@ -126,6 +125,8 @@ static void gen_lxvw4x(DisasContext *ctx)
         tcg_gen_addi_tl(EA, EA, 8);
         tcg_gen_qemu_ld_i64(xtl, EA, ctx->mem_idx, MO_BEQ);
     }
+    set_cpu_vsrh(xT(ctx->opcode), xth);
+    set_cpu_vsrl(xT(ctx->opcode), xtl);
     tcg_temp_free(EA);
     tcg_temp_free_i64(xth);
     tcg_temp_free_i64(xtl);
@@ -185,8 +186,6 @@ static void gen_lxvh8x(DisasContext *ctx)
     }
     xth = tcg_temp_new_i64();
     xtl = tcg_temp_new_i64();
-    get_cpu_vsrh(xth, xT(ctx->opcode));
-    get_cpu_vsrl(xtl, xT(ctx->opcode));
     gen_set_access_type(ctx, ACCESS_INT);
 
     EA = tcg_temp_new();
@@ -197,6 +196,8 @@ static void gen_lxvh8x(DisasContext *ctx)
     if (ctx->le_mode) {
         gen_bswap16x8(xth, xtl, xth, xtl);
     }
+    set_cpu_vsrh(xT(ctx->opcode), xth);
+    set_cpu_vsrl(xT(ctx->opcode), xtl);
     tcg_temp_free(EA);
     tcg_temp_free_i64(xth);
     tcg_temp_free_i64(xtl);
@@ -214,14 +215,14 @@ static void gen_lxvb16x(DisasContext *ctx)
     }
     xth = tcg_temp_new_i64();
     xtl = tcg_temp_new_i64();
-    get_cpu_vsrh(xth, xT(ctx->opcode));
-    get_cpu_vsrl(xtl, xT(ctx->opcode));
     gen_set_access_type(ctx, ACCESS_INT);
     EA = tcg_temp_new();
     gen_addr_reg_index(ctx, EA);
     tcg_gen_qemu_ld_i64(xth, EA, ctx->mem_idx, MO_BEQ);
     tcg_gen_addi_tl(EA, EA, 8);
     tcg_gen_qemu_ld_i64(xtl, EA, ctx->mem_idx, MO_BEQ);
+    set_cpu_vsrh(xT(ctx->opcode), xth);
+    set_cpu_vsrl(xT(ctx->opcode), xtl);
     tcg_temp_free(EA);
     tcg_temp_free_i64(xth);
     tcg_temp_free_i64(xtl);
-- 
2.17.1


