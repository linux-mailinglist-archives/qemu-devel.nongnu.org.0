Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 298AC2DBD71
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 10:22:12 +0100 (CET)
Received: from localhost ([::1]:39126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpT0d-0006Tc-9J
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 04:22:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@linux.ibm.com>)
 id 1kpSqU-0005MK-0v; Wed, 16 Dec 2020 04:11:43 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:59456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@linux.ibm.com>)
 id 1kpSqJ-0007QH-C5; Wed, 16 Dec 2020 04:11:41 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BG92SAf028557; Wed, 16 Dec 2020 04:11:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=oj9eaO3I877bdEB502k3p/9XtE2KcXY8aiPkw3cYas4=;
 b=I/LfIjyzFlqFvFlSh42/BIyFUckIl3Nty8NvBR8/V+C9muhPd6YwF+bMuC6yyOl84Aat
 sL4K6kq5AVm710tGDvM5cRZHrc8qfWAMxLUNQBgMT421RW1XUCrLzxcftU+G1dH+Of3d
 gPpyPvtJcGRvjc54Kt0USzuFhJrnHobDZ7PPE3rvWC1HxyUxVsDYnW+8tHpQk4IsuynQ
 bJVyfuGRsqFt1IukpXDP1i2JdYGU32dLwULCWXRVdDArRMZ+X6nEvMzoCQ4atWXJkwpW
 jvyi//q0C3ax5f8UW0yOy96O4FrKGaauoJWlemziZloUA46KLVCtNEfVOAzZMKQRzoMq /w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35fdvg2pre-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 04:11:23 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BG92hkc029411;
 Wed, 16 Dec 2020 04:11:22 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35fdvg2pqm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 04:11:22 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BG96pSE026017;
 Wed, 16 Dec 2020 09:11:22 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 35cng9p2e9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 09:11:21 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BG9BK8m23396622
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Dec 2020 09:11:20 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B1737805F;
 Wed, 16 Dec 2020 09:11:20 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54F4B7805C;
 Wed, 16 Dec 2020 09:11:14 +0000 (GMT)
Received: from pub.ltc.br.ibm.com (unknown [9.85.141.22])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 16 Dec 2020 09:11:13 +0000 (GMT)
From: Gustavo Romero <gromero@linux.ibm.com>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 6/7] target/ppc: Add support for prefixed load/store FP
 instructions
Date: Wed, 16 Dec 2020 06:08:03 -0300
Message-Id: <20201216090804.58640-7-gromero@linux.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201216090804.58640-1-gromero@linux.ibm.com>
References: <20201216090804.58640-1-gromero@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-16_02:2020-12-15,
 2020-12-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012160055
Received-SPF: pass client-ip=148.163.156.1; envelope-from=gromero@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: peter.maydell@linaro.org, gromero@linux.ibm.com,
 gustavo.romero@protonmail.com, Michael Roth <mdroth@linux.vnet.ibm.com>,
 mroth@lamentation.net, clg@kaod.org, david@gibson.dropbear.id.au,
 alex.bennee@linaro.org, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michael Roth <mdroth@linux.vnet.ibm.com>

This commit adds support for the following load/store instructions for FP
registers:

  plf, plfd
  pstfs, pstfd

Signed-off-by: Michael Roth <mroth@lamentation.net>
Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
---
 target/ppc/translate/fp-impl.c.inc | 48 ++++++++++++++++++++++++++++++
 target/ppc/translate/fp-ops.c.inc  |  6 ++++
 2 files changed, 54 insertions(+)

diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index 9f7868ee28..1eec98de0f 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -874,6 +874,28 @@ static void glue(gen_, name)(DisasContext *ctx)                               \
     tcg_temp_free_i64(t0);                                                    \
 }
 
+#define GEN_PLDF(name, ldop, opc, type)                                       \
+static void glue(gen_, p##name)(DisasContext *ctx)                            \
+{                                                                             \
+    TCGv EA;                                                                  \
+    TCGv_i64 t0;                                                              \
+    if (unlikely(!ctx->fpu_enabled)) {                                        \
+        gen_exception(ctx, POWERPC_EXCP_FPU);                                 \
+        return;                                                               \
+    }                                                                         \
+    gen_set_access_type(ctx, ACCESS_FLOAT);                                   \
+    EA = tcg_temp_new();                                                      \
+    t0 = tcg_temp_new_i64();                                                  \
+    if (gen_addr_imm34_index(ctx, EA)) {                                      \
+        goto out;                                                             \
+    }                                                                         \
+    gen_qemu_##ldop(ctx, t0, EA);                                             \
+    set_fpr(rD(ctx->opcode), t0);                                             \
+out:                                                                          \
+    tcg_temp_free(EA);                                                        \
+    tcg_temp_free_i64(t0);                                                    \
+}
+
 #define GEN_LDUF(name, ldop, opc, type)                                       \
 static void glue(gen_, name##u)(DisasContext *ctx)                            \
 {                                                                             \
@@ -943,6 +965,7 @@ static void glue(gen_, name##x)(DisasContext *ctx)                            \
 
 #define GEN_LDFS(name, ldop, op, type)                                        \
 GEN_LDF(name, ldop, op | 0x20, type);                                         \
+GEN_PLDF(name, ldop, op | 0x20, type);                                        \
 GEN_LDUF(name, ldop, op | 0x21, type);                                        \
 GEN_LDUXF(name, ldop, op | 0x01, type);                                       \
 GEN_LDXF(name, ldop, 0x17, op | 0x00, type)
@@ -1109,6 +1132,28 @@ static void glue(gen_, name)(DisasContext *ctx)                               \
     tcg_temp_free_i64(t0);                                                    \
 }
 
+#define GEN_PSTF(name, stop, opc, type)                                       \
+static void glue(gen_, p##name)(DisasContext *ctx)                               \
+{                                                                             \
+    TCGv EA;                                                                  \
+    TCGv_i64 t0;                                                              \
+    if (unlikely(!ctx->fpu_enabled)) {                                        \
+        gen_exception(ctx, POWERPC_EXCP_FPU);                                 \
+        return;                                                               \
+    }                                                                         \
+    gen_set_access_type(ctx, ACCESS_FLOAT);                                   \
+    EA = tcg_temp_new();                                                      \
+    t0 = tcg_temp_new_i64();                                                  \
+    if (gen_addr_imm34_index(ctx, EA)) {                                      \
+        goto out;                                                             \
+    }                                                                         \
+    get_fpr(t0, rS(ctx->opcode));                                             \
+    gen_qemu_##stop(ctx, t0, EA);                                             \
+out:                                                                          \
+    tcg_temp_free(EA);                                                        \
+    tcg_temp_free_i64(t0);                                                    \
+}
+
 #define GEN_STUF(name, stop, opc, type)                                       \
 static void glue(gen_, name##u)(DisasContext *ctx)                            \
 {                                                                             \
@@ -1178,6 +1223,7 @@ static void glue(gen_, name##x)(DisasContext *ctx)                            \
 
 #define GEN_STFS(name, stop, op, type)                                        \
 GEN_STF(name, stop, op | 0x20, type);                                         \
+GEN_PSTF(name, stop, op | 0x20, type);                                        \
 GEN_STUF(name, stop, op | 0x21, type);                                        \
 GEN_STUXF(name, stop, op | 0x01, type);                                       \
 GEN_STXF(name, stop, 0x17, op | 0x00, type)
@@ -1483,12 +1529,14 @@ static void gen_stfqx(DisasContext *ctx)
 #undef GEN_FLOAT_BS
 
 #undef GEN_LDF
+#undef GEN_PLDF
 #undef GEN_LDUF
 #undef GEN_LDUXF
 #undef GEN_LDXF
 #undef GEN_LDFS
 
 #undef GEN_STF
+#undef GEN_PSTF
 #undef GEN_STUF
 #undef GEN_STUXF
 #undef GEN_STXF
diff --git a/target/ppc/translate/fp-ops.c.inc b/target/ppc/translate/fp-ops.c.inc
index 88fab65628..fed0db8f65 100644
--- a/target/ppc/translate/fp-ops.c.inc
+++ b/target/ppc/translate/fp-ops.c.inc
@@ -52,6 +52,8 @@ GEN_FLOAT_B(rim, 0x08, 0x0F, 1, PPC_FLOAT_EXT),
 
 #define GEN_LDF(name, ldop, opc, type)                                        \
 GEN_HANDLER(name, opc, 0xFF, 0xFF, 0x00000000, type),
+#define GEN_PLDF(name, ldop, opc, type)                                       \
+GEN_HANDLER_E_PREFIXED_M(p##name, opc, 0xFF, 0xFF, 0x0, PPC_64B, PPC2_ISA310),
 #define GEN_LDUF(name, ldop, opc, type)                                       \
 GEN_HANDLER(name##u, opc, 0xFF, 0xFF, 0x00000000, type),
 #define GEN_LDUXF(name, ldop, opc, type)                                      \
@@ -60,6 +62,7 @@ GEN_HANDLER(name##ux, 0x1F, 0x17, opc, 0x00000001, type),
 GEN_HANDLER(name##x, 0x1F, opc2, opc3, 0x00000001, type),
 #define GEN_LDFS(name, ldop, op, type)                                        \
 GEN_LDF(name, ldop, op | 0x20, type)                                          \
+GEN_PLDF(name, ldop, op | 0x20, type)                                         \
 GEN_LDUF(name, ldop, op | 0x21, type)                                         \
 GEN_LDUXF(name, ldop, op | 0x01, type)                                        \
 GEN_LDXF(name, ldop, 0x17, op | 0x00, type)
@@ -73,6 +76,8 @@ GEN_HANDLER_E(lfdpx, 0x1F, 0x17, 0x18, 0x00200001, PPC_NONE, PPC2_ISA205),
 
 #define GEN_STF(name, stop, opc, type)                                        \
 GEN_HANDLER(name, opc, 0xFF, 0xFF, 0x00000000, type),
+#define GEN_PSTF(name, ldop, opc, type)                                       \
+GEN_HANDLER_E_PREFIXED_M(p##name, opc, 0xFF, 0xFF, 0x0, PPC_64B, PPC2_ISA310),
 #define GEN_STUF(name, stop, opc, type)                                       \
 GEN_HANDLER(name##u, opc, 0xFF, 0xFF, 0x00000000, type),
 #define GEN_STUXF(name, stop, opc, type)                                      \
@@ -81,6 +86,7 @@ GEN_HANDLER(name##ux, 0x1F, 0x17, opc, 0x00000001, type),
 GEN_HANDLER(name##x, 0x1F, opc2, opc3, 0x00000001, type),
 #define GEN_STFS(name, stop, op, type)                                        \
 GEN_STF(name, stop, op | 0x20, type)                                          \
+GEN_PSTF(name, stop, op | 0x20, type)                                         \
 GEN_STUF(name, stop, op | 0x21, type)                                         \
 GEN_STUXF(name, stop, op | 0x01, type)                                        \
 GEN_STXF(name, stop, 0x17, op | 0x00, type)
-- 
2.17.1


