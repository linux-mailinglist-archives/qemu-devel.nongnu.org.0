Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 460C94404D6
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 23:19:48 +0200 (CEST)
Received: from localhost ([::1]:46392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgZHu-0004G0-H6
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 17:19:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mgYV0-00008S-Pc; Fri, 29 Oct 2021 16:29:14 -0400
Received: from [201.28.113.2] (port=31431 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mgYUy-0002mo-QR; Fri, 29 Oct 2021 16:29:14 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 29 Oct 2021 17:26:34 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 51DDD800B36;
 Fri, 29 Oct 2021 17:26:34 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 27/34] target/ppc: added the instructions PLXVP and PSTXVP
Date: Fri, 29 Oct 2021 17:24:18 -0300
Message-Id: <20211029202424.175401-28-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029202424.175401-1-matheus.ferst@eldorado.org.br>
References: <20211029202424.175401-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 29 Oct 2021 20:26:34.0824 (UTC)
 FILETIME=[447B3480:01D7CD03]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: lucas.castro@eldorado.org.br, richard.henderson@linaro.org, groug@kaod.org,
 luis.pires@eldorado.org.br, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.castro@eldorado.org.br>

Implemented the instructions plxvp and pstxvp using decodetree

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.castro@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn64.decode            | 9 +++++++++
 target/ppc/translate/vsx-impl.c.inc | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index 093439b370..880ac3edc7 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -27,6 +27,11 @@
                 ..... rt:6 ra:5 ................         \
                 &PLS_D si=%pls_si
 
+%rt_tsxp        21:1 22:4 !function=times_2
+@8LS_D_TSXP     ...... .. . .. r:1 .. .................. \
+                ...... ..... ra:5 ................       \
+                &PLS_D si=%pls_si rt=%rt_tsxp
+
 ### Fixed-Point Load Instructions
 
 PLBZ            000001 10 0--.-- .................. \
@@ -147,3 +152,7 @@ PLXV            000001 00 0--.-- .................. \
                 11001 ...... ..... ................     @8LS_D_TSX
 PSTXV           000001 00 0--.-- .................. \
                 11011 ...... ..... ................     @8LS_D_TSX
+PLXVP           000001 00 0--.-- .................. \
+                111010 ..... ..... ................     @8LS_D_TSXP
+PSTXVP          000001 00 0--.-- .................. \
+                111110 ..... ..... ................     @8LS_D_TSXP
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index bbf437536e..3606acdb2e 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2057,6 +2057,8 @@ TRANS(STXVPX, do_lstxv_X, true, true)
 TRANS(LXVPX, do_lstxv_X, false, true)
 TRANS64(PSTXV, do_lstxv_PLS_D, true, false)
 TRANS64(PLXV, do_lstxv_PLS_D, false, false)
+TRANS64(PSTXVP, do_lstxv_PLS_D, true, true)
+TRANS64(PLXVP, do_lstxv_PLS_D, false, true)
 
 #undef GEN_XX2FORM
 #undef GEN_XX3FORM
-- 
2.25.1


