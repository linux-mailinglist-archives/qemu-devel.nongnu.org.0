Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 046B24CDC22
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 19:18:05 +0100 (CET)
Received: from localhost ([::1]:50648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQCV9-0007YC-Nl
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 13:18:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nQC7C-0006Sv-Bs; Fri, 04 Mar 2022 12:53:18 -0500
Received: from [187.72.171.209] (port=8389 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nQC7A-0003AM-H4; Fri, 04 Mar 2022 12:53:17 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 4 Mar 2022 14:53:06 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 36EBE8001C2;
 Fri,  4 Mar 2022 14:53:06 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 2/7] target/ppc: use ext32u and deposit in do_vx_vmulhw_i64
Date: Fri,  4 Mar 2022 14:51:51 -0300
Message-Id: <20220304175156.2012315-3-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304175156.2012315-1-matheus.ferst@eldorado.org.br>
References: <20220304175156.2012315-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 04 Mar 2022 17:53:06.0675 (UTC)
 FILETIME=[B40BAC30:01D82FF0]
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 clg@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Fixes: 29e9dfcf755e ("target/ppc: vmulh* instructions without helpers")
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/translate/vmx-impl.c.inc | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index c5d02d13fe..8ea1d2c96a 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -3162,19 +3162,16 @@ static void do_vx_vmulhw_i64(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b, bool sign)
 {
     TCGv_i64 hh, lh, temp;
 
-    uint64_t c;
     hh = tcg_temp_new_i64();
     lh = tcg_temp_new_i64();
     temp = tcg_temp_new_i64();
 
-    c = 0xFFFFFFFF;
-
     if (sign) {
         tcg_gen_ext32s_i64(lh, a);
         tcg_gen_ext32s_i64(temp, b);
     } else {
-        tcg_gen_andi_i64(lh, a, c);
-        tcg_gen_andi_i64(temp, b, c);
+        tcg_gen_ext32u_i64(lh, a);
+        tcg_gen_ext32u_i64(temp, b);
     }
     tcg_gen_mul_i64(lh, lh, temp);
 
@@ -3188,8 +3185,7 @@ static void do_vx_vmulhw_i64(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b, bool sign)
     tcg_gen_mul_i64(hh, hh, temp);
 
     tcg_gen_shri_i64(lh, lh, 32);
-    tcg_gen_andi_i64(hh, hh, c << 32);
-    tcg_gen_or_i64(t, hh, lh);
+    tcg_gen_deposit_i64(t, hh, lh, 0, 32);
 
     tcg_temp_free_i64(hh);
     tcg_temp_free_i64(lh);
-- 
2.25.1


