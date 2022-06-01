Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E938C53A58A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 14:56:43 +0200 (CEST)
Received: from localhost ([::1]:36438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwNty-0007ty-Gb
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 08:56:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nwNrV-0006wJ-JM; Wed, 01 Jun 2022 08:54:09 -0400
Received: from [187.72.171.209] (port=1454 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nwNrT-0002Yx-Ro; Wed, 01 Jun 2022 08:54:09 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 1 Jun 2022 09:54:00 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id CCD8780006A;
 Wed,  1 Jun 2022 09:53:59 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH] target/ppc: fix vbpermd in big endian hosts
Date: Wed,  1 Jun 2022 09:53:55 -0300
Message-Id: <20220601125355.1266165-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 01 Jun 2022 12:54:00.0056 (UTC)
 FILETIME=[A9CAAF80:01D875B6]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

The extract64 arguments are not endian dependent as they are only used
for bitwise operations. The current behavior in little-endian hosts is
correct; since the indexes in VRB are in PowerISA-ordering, we should
always invert the value before calling extract64. Also, using the VsrD
macro, we can have a single EXTRACT_BIT definition for big and
little-endian with the correct behavior.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
Found this bug while refactoring VECTOR_FOR_INORDER_I uses. The
complete patch series will also use Vsr[DB] instead of VBPERM[DQ]_INDEX,
but it will need more testing. For now, we're just changing what is
necessary to fix the instruction.
---
 target/ppc/int_helper.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 105b626d1b..4c5d3f03f8 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1307,14 +1307,13 @@ XXGENPCV(XXGENPCVDM, 8)
 #define VBPERMQ_INDEX(avr, i) ((avr)->u8[(i)])
 #define VBPERMD_INDEX(i) (i)
 #define VBPERMQ_DW(index) (((index) & 0x40) != 0)
-#define EXTRACT_BIT(avr, i, index) (extract64((avr)->u64[i], index, 1))
 #else
 #define VBPERMQ_INDEX(avr, i) ((avr)->u8[15 - (i)])
 #define VBPERMD_INDEX(i) (1 - i)
 #define VBPERMQ_DW(index) (((index) & 0x40) == 0)
-#define EXTRACT_BIT(avr, i, index) \
-        (extract64((avr)->u64[1 - i], 63 - index, 1))
 #endif
+#define EXTRACT_BIT(avr, i, index) \
+        (extract64((avr)->VsrD(i), 63 - index, 1))
 
 void helper_vbpermd(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
-- 
2.25.1


