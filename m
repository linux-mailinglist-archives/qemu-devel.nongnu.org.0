Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA38A4CDCEF
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 19:49:51 +0100 (CET)
Received: from localhost ([::1]:36476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQCzu-0003TP-20
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 13:49:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nQC7N-000751-KB; Fri, 04 Mar 2022 12:53:29 -0500
Received: from [187.72.171.209] (port=8389 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nQC7M-0003AM-9n; Fri, 04 Mar 2022 12:53:29 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 4 Mar 2022 14:53:08 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id C40A6800502;
 Fri,  4 Mar 2022 14:53:07 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 7/7] target/ppc: Add missing helper_reset_fpstatus to
 helper_XVCVSPBF16
Date: Fri,  4 Mar 2022 14:51:56 -0300
Message-Id: <20220304175156.2012315-8-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304175156.2012315-1-matheus.ferst@eldorado.org.br>
References: <20220304175156.2012315-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 04 Mar 2022 17:53:08.0207 (UTC)
 FILETIME=[B4F56FF0:01D82FF0]
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
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 clg@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Víctor Colombo <victor.colombo@eldorado.org.br>

Fixes: 3909ff1fac ("target/ppc: Implement xvcvbf16spn and xvcvspbf16 instructions")
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/fpu_helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index cf5f8f20dd..06eb36f7b6 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2769,6 +2769,8 @@ void helper_XVCVSPBF16(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)
     ppc_vsr_t t = { };
     int i, status;
 
+    helper_reset_fpstatus(env);
+
     for (i = 0; i < 4; i++) {
         t.VsrH(2 * i + 1) = float32_to_bfloat16(xb->VsrW(i), &env->fp_status);
     }
-- 
2.25.1


