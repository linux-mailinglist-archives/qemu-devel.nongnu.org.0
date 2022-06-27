Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 419E455BA86
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 16:33:29 +0200 (CEST)
Received: from localhost ([::1]:46786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5pns-00040N-8e
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 10:33:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1o5pj6-0008TP-EG; Mon, 27 Jun 2022 10:28:32 -0400
Received: from [200.168.210.66] (port=27402 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1o5pj3-0002K1-0a; Mon, 27 Jun 2022 10:28:32 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 27 Jun 2022 11:11:12 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id AA51F8001D4;
 Mon, 27 Jun 2022 11:11:11 -0300 (-03)
From: Matheus Ferst <matheus.ferst@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, farosas@linux.ibm.com, laurent@vivier.eu,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH 2/6] target/ppc: fix exception error value in slbfee
Date: Mon, 27 Jun 2022 11:11:00 -0300
Message-Id: <20220627141104.669152-3-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627141104.669152-1-matheus.ferst@eldorado.org.br>
References: <20220627141104.669152-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 27 Jun 2022 14:11:12.0036 (UTC)
 FILETIME=[C1683E40:01D88A2F]
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

Testing on a POWER9 DD2.3, we observed that the Linux kernel delivers a
signal with si_code ILL_PRVOPC (5) when a userspace application tries to
use slbfee. To obtain this behavior on linux-user, we should use
POWERPC_EXCP_PRIV with POWERPC_EXCP_PRIV_OPC.

No functional change is intended for softmmu targets as
gen_hvpriv_exception uses the same 'exception' argument
(POWERPC_EXCP_HV_EMU) for raise_exception_*, and the powerpc_excp_*
methods do not use lower bits of the exception error code when handling
POWERPC_EXCP_{INVAL,PRIV}.

Reported-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 55f34eb490..d7e5670c20 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -5386,12 +5386,12 @@ static void gen_slbmfev(DisasContext *ctx)
 static void gen_slbfee_(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    gen_inval_exception(ctx, POWERPC_EXCP_PRIV_REG);
+    gen_hvpriv_exception(ctx, POWERPC_EXCP_PRIV_OPC);
 #else
     TCGLabel *l1, *l2;
 
     if (unlikely(ctx->pr)) {
-        gen_inval_exception(ctx, POWERPC_EXCP_PRIV_REG);
+        gen_hvpriv_exception(ctx, POWERPC_EXCP_PRIV_OPC);
         return;
     }
     gen_helper_find_slb_vsid(cpu_gpr[rS(ctx->opcode)], cpu_env,
-- 
2.25.1


