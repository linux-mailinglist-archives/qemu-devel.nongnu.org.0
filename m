Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF040399CC5
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:40:37 +0200 (CEST)
Received: from localhost ([::1]:49196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loiu4-0007I3-U6
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:40:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loid8-0006kf-WC; Thu, 03 Jun 2021 04:23:09 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:35139 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loid7-00009x-1Q; Thu, 03 Jun 2021 04:23:06 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fwf5n1SKFz9t0G; Thu,  3 Jun 2021 18:22:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622708557;
 bh=htJwkmdEBbsymybJehM454Yf26ExzUBMxLyreHSRH2I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l/sRccCTc8ByhO0/mzCSyVliU8ZK+i4PsYJiHv+PcrA0YVhBurkB6du9HJnTYVbuz
 cIf1rf0TVKmOg8GE2GslJ5d0A7XA1WFh1vj4s8BQheYz4l9h/2TK1x3hfvm96Fpttz
 dVwwYJiafwrG+WtyZUsbVXjkJ6+q30yd1Xou7Y7k=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 22/42] target/ppc: removed GEN_OPCODE decision tree
Date: Thu,  3 Jun 2021 18:22:11 +1000
Message-Id: <20210603082231.601214-23-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603082231.601214-1-david@gibson.dropbear.id.au>
References: <20210603082231.601214-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>

since both, PPC_DO_STATISTICS and PPC_DUMP_CPU, are obsoleted as
target/ppc moves to decodetree, we can remove this ifdef based decision
tree, and only have what is now the standard option for the macro.

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Message-Id: <20210531145629.21300-4-bruno.larsen@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate.c | 79 ------------------------------------------
 1 file changed, 79 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 5c56e33c3c..4b66563998 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -1341,7 +1341,6 @@ typedef struct opcode_t {
 /*****************************************************************************/
 /* PowerPC instructions table                                                */
 
-#if defined(DO_PPC_STATISTICS)
 #define GEN_OPCODE(name, op1, op2, op3, invl, _typ, _typ2)                    \
 {                                                                             \
     .opc1 = op1,                                                              \
@@ -1353,7 +1352,6 @@ typedef struct opcode_t {
         .type = _typ,                                                         \
         .type2 = _typ2,                                                       \
         .handler = &gen_##name,                                               \
-        .oname = stringify(name),                                             \
     },                                                                        \
     .oname = stringify(name),                                                 \
 }
@@ -1369,7 +1367,6 @@ typedef struct opcode_t {
         .type = _typ,                                                         \
         .type2 = _typ2,                                                       \
         .handler = &gen_##name,                                               \
-        .oname = stringify(name),                                             \
     },                                                                        \
     .oname = stringify(name),                                                 \
 }
@@ -1384,7 +1381,6 @@ typedef struct opcode_t {
         .type = _typ,                                                         \
         .type2 = _typ2,                                                       \
         .handler = &gen_##name,                                               \
-        .oname = onam,                                                        \
     },                                                                        \
     .oname = onam,                                                            \
 }
@@ -1399,7 +1395,6 @@ typedef struct opcode_t {
         .type = _typ,                                                         \
         .type2 = _typ2,                                                       \
         .handler = &gen_##name,                                               \
-        .oname = stringify(name),                                             \
     },                                                                        \
     .oname = stringify(name),                                                 \
 }
@@ -1414,83 +1409,9 @@ typedef struct opcode_t {
         .type = _typ,                                                         \
         .type2 = _typ2,                                                       \
         .handler = &gen_##name,                                               \
-        .oname = onam,                                                        \
     },                                                                        \
     .oname = onam,                                                            \
 }
-#else
-#define GEN_OPCODE(name, op1, op2, op3, invl, _typ, _typ2)                    \
-{                                                                             \
-    .opc1 = op1,                                                              \
-    .opc2 = op2,                                                              \
-    .opc3 = op3,                                                              \
-    .opc4 = 0xff,                                                             \
-    .handler = {                                                              \
-        .inval1  = invl,                                                      \
-        .type = _typ,                                                         \
-        .type2 = _typ2,                                                       \
-        .handler = &gen_##name,                                               \
-    },                                                                        \
-    .oname = stringify(name),                                                 \
-}
-#define GEN_OPCODE_DUAL(name, op1, op2, op3, invl1, invl2, _typ, _typ2)       \
-{                                                                             \
-    .opc1 = op1,                                                              \
-    .opc2 = op2,                                                              \
-    .opc3 = op3,                                                              \
-    .opc4 = 0xff,                                                             \
-    .handler = {                                                              \
-        .inval1  = invl1,                                                     \
-        .inval2  = invl2,                                                     \
-        .type = _typ,                                                         \
-        .type2 = _typ2,                                                       \
-        .handler = &gen_##name,                                               \
-    },                                                                        \
-    .oname = stringify(name),                                                 \
-}
-#define GEN_OPCODE2(name, onam, op1, op2, op3, invl, _typ, _typ2)             \
-{                                                                             \
-    .opc1 = op1,                                                              \
-    .opc2 = op2,                                                              \
-    .opc3 = op3,                                                              \
-    .opc4 = 0xff,                                                             \
-    .handler = {                                                              \
-        .inval1  = invl,                                                      \
-        .type = _typ,                                                         \
-        .type2 = _typ2,                                                       \
-        .handler = &gen_##name,                                               \
-    },                                                                        \
-    .oname = onam,                                                            \
-}
-#define GEN_OPCODE3(name, op1, op2, op3, op4, invl, _typ, _typ2)              \
-{                                                                             \
-    .opc1 = op1,                                                              \
-    .opc2 = op2,                                                              \
-    .opc3 = op3,                                                              \
-    .opc4 = op4,                                                              \
-    .handler = {                                                              \
-        .inval1  = invl,                                                      \
-        .type = _typ,                                                         \
-        .type2 = _typ2,                                                       \
-        .handler = &gen_##name,                                               \
-    },                                                                        \
-    .oname = stringify(name),                                                 \
-}
-#define GEN_OPCODE4(name, onam, op1, op2, op3, op4, invl, _typ, _typ2)        \
-{                                                                             \
-    .opc1 = op1,                                                              \
-    .opc2 = op2,                                                              \
-    .opc3 = op3,                                                              \
-    .opc4 = op4,                                                              \
-    .handler = {                                                              \
-        .inval1  = invl,                                                      \
-        .type = _typ,                                                         \
-        .type2 = _typ2,                                                       \
-        .handler = &gen_##name,                                               \
-    },                                                                        \
-    .oname = onam,                                                            \
-}
-#endif
 
 /* Invalid instruction */
 static void gen_invalid(DisasContext *ctx)
-- 
2.31.1


