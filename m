Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23744393546
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 20:11:04 +0200 (CEST)
Received: from localhost ([::1]:49924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmKTH-0005Bh-6F
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 14:11:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lmKQV-0003WO-HX; Thu, 27 May 2021 14:08:11 -0400
Received: from [201.28.113.2] (port=34917 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lmKQT-00026T-QP; Thu, 27 May 2021 14:08:11 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 27 May 2021 15:08:03 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 5E03C8013E1;
 Thu, 27 May 2021 15:08:03 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] target/ppc: removed GEN_OPCODE decision tree
Date: Thu, 27 May 2021 15:08:00 -0300
Message-Id: <20210527180801.40513-2-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210527180801.40513-1-bruno.larsen@eldorado.org.br>
References: <20210527180801.40513-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 27 May 2021 18:08:03.0511 (UTC)
 FILETIME=[3C863C70:01D75323]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org, groug@kaod.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

since both, PPC_DO_STATISTICS and PPC_DUMP_CPU, are obsoleted as
target/ppc moves to decodetree, we can remove this ifdef based decision
tree, and only have what is now the standard option for the macro.

Suggested-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
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
2.17.1


