Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E62487DA1
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 21:23:50 +0100 (CET)
Received: from localhost ([::1]:58012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5vm9-0007dr-VG
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 15:23:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1n5uWN-0000t1-KG; Fri, 07 Jan 2022 14:03:27 -0500
Received: from [201.28.113.2] (port=23059 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1n5uWM-0000Db-2W; Fri, 07 Jan 2022 14:03:27 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 7 Jan 2022 15:57:46 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id D60608001D1;
 Fri,  7 Jan 2022 15:57:45 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 36/37] target/ppc: Implement xs{max,min}cqp
Date: Fri,  7 Jan 2022 15:56:52 -0300
Message-Id: <20220107185653.1609775-37-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107185653.1609775-1-matheus.ferst@eldorado.org.br>
References: <20220107185653.1609775-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 07 Jan 2022 18:57:46.0232 (UTC)
 FILETIME=[754F1780:01D803F8]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Victor Colombo <victor.colombo@eldorado.org.br>, clg@kaod.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Victor Colombo <victor.colombo@eldorado.org.br>

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/fpu_helper.c             | 2 ++
 target/ppc/helper.h                 | 2 ++
 target/ppc/insn32.decode            | 3 +++
 target/ppc/translate/vsx-impl.c.inc | 2 ++
 4 files changed, 9 insertions(+)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 4c5fcaca7a..0e938f7ab9 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2566,6 +2566,8 @@ void helper_##name(CPUPPCState *env,                                          \
 
 VSX_MAX_MINC(XSMAXCDP, maxnum, float64, VsrD(0));
 VSX_MAX_MINC(XSMINCDP, minnum, float64, VsrD(0));
+VSX_MAX_MINC(XSMAXCQP, maxnum, float128, f128);
+VSX_MAX_MINC(XSMINCQP, minnum, float128, f128);
 
 #define VSX_MAX_MINJ(name, max)                                               \
 void helper_##name(CPUPPCState *env,                                          \
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 690ba1387e..68b367a0d6 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -385,6 +385,8 @@ DEF_HELPER_4(XSMAXCDP, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(XSMINCDP, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(XSMAXJDP, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(XSMINJDP, void, env, vsr, vsr, vsr)
+DEF_HELPER_4(XSMAXCQP, void, env, vsr, vsr, vsr)
+DEF_HELPER_4(XSMINCQP, void, env, vsr, vsr, vsr)
 DEF_HELPER_3(xscvdphp, void, env, vsr, vsr)
 DEF_HELPER_4(xscvdpqp, void, env, i32, vsr, vsr)
 DEF_HELPER_3(xscvdpsp, void, env, vsr, vsr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 35bee046da..a31600a6c9 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -602,6 +602,9 @@ XSMAXCDP        111100 ..... ..... ..... 10000000 ...   @XX3
 XSMINCDP        111100 ..... ..... ..... 10001000 ...   @XX3
 XSMAXJDP        111100 ..... ..... ..... 10010000 ...   @XX3
 XSMINJDP        111100 ..... ..... ..... 10011000 ...   @XX3
+XSMAXCQP        111111 ..... ..... ..... 1010100100 -   @X
+XSMINCQP        111111 ..... ..... ..... 1011100100 -   @X
+
 XSCMPEQDP       111100 ..... ..... ..... 00000011 ...   @XX3
 XSCMPGEDP       111100 ..... ..... ..... 00010011 ...   @XX3
 XSCMPGTDP       111100 ..... ..... ..... 00001011 ...   @XX3
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index a4b7de5f49..63031b037c 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2490,6 +2490,8 @@ static bool do_xscmpqp(DisasContext *ctx, arg_X *a,
 TRANS(XSCMPEQQP, do_xscmpqp, gen_helper_XSCMPEQQP)
 TRANS(XSCMPGEQP, do_xscmpqp, gen_helper_XSCMPGEQP)
 TRANS(XSCMPGTQP, do_xscmpqp, gen_helper_XSCMPGTQP)
+TRANS(XSMAXCQP, do_xscmpqp, gen_helper_XSMAXCQP)
+TRANS(XSMINCQP, do_xscmpqp, gen_helper_XSMINCQP)
 
 #undef GEN_XX2FORM
 #undef GEN_XX3FORM
-- 
2.25.1


