Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A7E392183
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 22:32:23 +0200 (CEST)
Received: from localhost ([::1]:57668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm0CT-00071K-1u
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 16:32:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lm02U-0007Lx-4l; Wed, 26 May 2021 16:22:05 -0400
Received: from [201.28.113.2] (port=2123 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lm02S-00019i-Nr; Wed, 26 May 2021 16:22:01 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 26 May 2021 17:21:07 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 42AE58013CA;
 Wed, 26 May 2021 17:21:07 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] target/ppc: fixed GEN_OPCODE behavior when PPC_DUMP_CPU
 is set
Date: Wed, 26 May 2021 17:21:00 -0300
Message-Id: <20210526202104.127910-2-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
References: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 26 May 2021 20:21:07.0400 (UTC)
 FILETIME=[A8E14480:01D7526C]
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

Before this patch, when PPC_DUMP_CPU is set, oname is added to
opc_handler_t, but GEN_OPCODE* wouldn't set it unless DO_PPC_STATISTICS
was set as well.

This patch changes it so those changes would happen when PPC_DUMP_CPU is
set, but not statistics, because the latter is being removed.

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---
 target/ppc/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index ea200f9637..6c0f424d81 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -1345,7 +1345,7 @@ typedef struct opcode_t {
 /*****************************************************************************/
 /* PowerPC instructions table                                                */
 
-#if defined(DO_PPC_STATISTICS)
+#if defined(PPC_DUMP_CPU)
 #define GEN_OPCODE(name, op1, op2, op3, invl, _typ, _typ2)                    \
 {                                                                             \
     .opc1 = op1,                                                              \
-- 
2.17.1


