Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C21A1396331
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 17:07:21 +0200 (CEST)
Received: from localhost ([::1]:56684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnjVg-0005Le-PM
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 11:07:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lnjMR-0007VN-Qh; Mon, 31 May 2021 10:57:47 -0400
Received: from [201.28.113.2] (port=60167 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lnjMQ-0001Ug-9K; Mon, 31 May 2021 10:57:47 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 31 May 2021 11:57:33 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id EF153801481;
 Mon, 31 May 2021 11:57:32 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/4] target/ppc: removed GEN_OPCODE decision tree
Date: Mon, 31 May 2021 11:56:28 -0300
Message-Id: <20210531145629.21300-4-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210531145629.21300-1-bruno.larsen@eldorado.org.br>
References: <20210531145629.21300-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 31 May 2021 14:57:33.0149 (UTC)
 FILETIME=[492668D0:01D7562D]
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org,
 luis.pires@eldorado.org.br, Greg Kurz <groug@kaod.org>,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

since both, PPC_DO_STATISTICS and PPC_DUMP_CPU, are obsoleted as
target/ppc moves to decodetree, we can remove this ifdef based decision
tree, and only have what is now the standard option for the macro.

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


