Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 925D355BA8E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 16:42:44 +0200 (CEST)
Received: from localhost ([::1]:35894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5pwo-0007e7-5X
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 10:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1o5pjH-0000VA-TD; Mon, 27 Jun 2022 10:28:43 -0400
Received: from [200.168.210.66] (port=27402 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1o5pjG-0002K1-D2; Mon, 27 Jun 2022 10:28:43 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 27 Jun 2022 11:11:12 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 985DF8001D4;
 Mon, 27 Jun 2022 11:11:12 -0300 (-03)
From: Matheus Ferst <matheus.ferst@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, farosas@linux.ibm.com, laurent@vivier.eu,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH 6/6] target/ppc: fix exception error code in
 spr_write_excp_vector
Date: Mon, 27 Jun 2022 11:11:04 -0300
Message-Id: <20220627141104.669152-7-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627141104.669152-1-matheus.ferst@eldorado.org.br>
References: <20220627141104.669152-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 27 Jun 2022 14:11:12.0895 (UTC)
 FILETIME=[C1EB50F0:01D88A2F]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
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

The 'error' argument of gen_inval_exception will be or-ed with
POWERPC_EXCP_INVAL, so it should always be a constant prefixed with
POWERPC_EXCP_INVAL_. No functional change is intended,
spr_write_excp_vector is only used by register_BookE_sprs, and
powerpc_excp_booke ignores the lower 4 bits of the error code on
POWERPC_EXCP_INVAL exceptions.

Also, take the opportunity to replace printf with qemu_log_mask.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/translate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 30dd524959..da11472877 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -907,9 +907,9 @@ void spr_write_excp_vector(DisasContext *ctx, int sprn, int gprn)
     } else if (sprn >= SPR_BOOKE_IVOR38 && sprn <= SPR_BOOKE_IVOR42) {
         sprn_offs = sprn - SPR_BOOKE_IVOR38 + 38;
     } else {
-        printf("Trying to write an unknown exception vector %d %03x\n",
-               sprn, sprn);
-        gen_inval_exception(ctx, POWERPC_EXCP_PRIV_REG);
+        qemu_log_mask(LOG_GUEST_ERROR, "Trying to write an unknown exception"
+                      " vector 0x%03x\n", sprn);
+        gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);
         return;
     }
 
-- 
2.25.1


