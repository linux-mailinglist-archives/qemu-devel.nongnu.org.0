Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 772514CDC7A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 19:29:44 +0100 (CET)
Received: from localhost ([::1]:45644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQCgR-0006tA-7I
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 13:29:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nQC7G-0006hN-GN; Fri, 04 Mar 2022 12:53:22 -0500
Received: from [187.72.171.209] (port=8389 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nQC7F-0003AM-5o; Fri, 04 Mar 2022 12:53:22 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 4 Mar 2022 14:53:07 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id CE1E08001C2;
 Fri,  4 Mar 2022 14:53:06 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 4/7] target/ppc: use andc in vrlqmi
Date: Fri,  4 Mar 2022 14:51:53 -0300
Message-Id: <20220304175156.2012315-5-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304175156.2012315-1-matheus.ferst@eldorado.org.br>
References: <20220304175156.2012315-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 04 Mar 2022 17:53:07.0254 (UTC)
 FILETIME=[B4640560:01D82FF0]
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

Fixes: 7e5947df6e94 ("target/ppc: implement vrlqmi")
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/translate/vmx-impl.c.inc | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 8108e59d4d..6101bca3fd 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1157,10 +1157,8 @@ static bool do_vector_rotl_quad(DisasContext *ctx, arg_VX *a, bool mask,
         if (insert) {
             get_avr64(n, a->vrt, true);
             get_avr64(vrb, a->vrt, false);
-            tcg_gen_not_i64(ah, ah);
-            tcg_gen_not_i64(al, al);
-            tcg_gen_and_i64(n, n, ah);
-            tcg_gen_and_i64(vrb, vrb, al);
+            tcg_gen_andc_i64(n, n, ah);
+            tcg_gen_andc_i64(vrb, vrb, al);
             tcg_gen_or_i64(t0, t0, n);
             tcg_gen_or_i64(t1, t1, vrb);
         }
-- 
2.25.1


