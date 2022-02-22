Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 722744BFF70
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 17:57:05 +0100 (CET)
Received: from localhost ([::1]:57800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMYTI-0003DU-6i
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 11:57:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMWPD-0001rB-UU; Tue, 22 Feb 2022 09:44:43 -0500
Received: from [187.72.171.209] (port=14718 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMWPB-0006Am-UT; Tue, 22 Feb 2022 09:44:43 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 22 Feb 2022 11:37:50 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 374C380047A;
 Tue, 22 Feb 2022 11:37:50 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 43/47] target/ppc: Implement xs{max,min}cqp
Date: Tue, 22 Feb 2022 11:36:41 -0300
Message-Id: <20220222143646.1268606-44-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 22 Feb 2022 14:37:50.0619 (UTC)
 FILETIME=[C499E6B0:01D827F9]
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

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/fpu_helper.c             | 2 ++
 target/ppc/helper.h                 | 2 ++
 target/ppc/insn32.decode            | 3 +++
 target/ppc/translate/vsx-impl.c.inc | 2 ++
 4 files changed, 9 insertions(+)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index f6eb8bf2d8..7773333bd7 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2565,6 +2565,8 @@ void helper_##name(CPUPPCState *env,                                          \
 
 VSX_MAX_MINC(XSMAXCDP, maxnum, float64, VsrD(0));
 VSX_MAX_MINC(XSMINCDP, minnum, float64, VsrD(0));
+VSX_MAX_MINC(XSMAXCQP, maxnum, float128, f128);
+VSX_MAX_MINC(XSMINCQP, minnum, float128, f128);
 
 #define VSX_MAX_MINJ(name, max)                                               \
 void helper_##name(CPUPPCState *env,                                          \
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 3a1cb9abf5..d3af130dc2 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -379,6 +379,8 @@ DEF_HELPER_4(XSMAXCDP, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(XSMINCDP, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(XSMAXJDP, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(XSMINJDP, void, env, vsr, vsr, vsr)
+DEF_HELPER_4(XSMAXCQP, void, env, vsr, vsr, vsr)
+DEF_HELPER_4(XSMINCQP, void, env, vsr, vsr, vsr)
 DEF_HELPER_3(xscvdphp, void, env, vsr, vsr)
 DEF_HELPER_4(xscvdpqp, void, env, i32, vsr, vsr)
 DEF_HELPER_3(xscvdpsp, void, env, vsr, vsr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index a6e3855958..892d4bfd84 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -662,6 +662,9 @@ XSMAXCDP        111100 ..... ..... ..... 10000000 ...   @XX3
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
index 730f073cf5..0546dc736e 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2529,6 +2529,8 @@ static bool do_xscmpqp(DisasContext *ctx, arg_X *a,
 TRANS(XSCMPEQQP, do_xscmpqp, gen_helper_XSCMPEQQP)
 TRANS(XSCMPGEQP, do_xscmpqp, gen_helper_XSCMPGEQP)
 TRANS(XSCMPGTQP, do_xscmpqp, gen_helper_XSCMPGTQP)
+TRANS(XSMAXCQP, do_xscmpqp, gen_helper_XSMAXCQP)
+TRANS(XSMINCQP, do_xscmpqp, gen_helper_XSMINCQP)
 
 #undef GEN_XX2FORM
 #undef GEN_XX3FORM
-- 
2.25.1


