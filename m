Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EC252A457
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 16:09:32 +0200 (CEST)
Received: from localhost ([::1]:37964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqxtD-0006bL-Bi
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 10:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nqwUP-0003Pv-AI; Tue, 17 May 2022 08:39:49 -0400
Received: from [187.72.171.209] (port=50866 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nqwUN-0003z4-2x; Tue, 17 May 2022 08:39:48 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 17 May 2022 09:39:31 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id CD652800603;
 Tue, 17 May 2022 09:39:30 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH 02/12] target/ppc: use TCG_CALL_NO_RWG in vector helpers
 without env
Date: Tue, 17 May 2022 09:39:19 -0300
Message-Id: <20220517123929.284511-3-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220517123929.284511-1-matheus.ferst@eldorado.org.br>
References: <20220517123929.284511-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 17 May 2022 12:39:31.0079 (UTC)
 FILETIME=[27A51170:01D869EB]
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

Helpers of vector instructions without cpu_env as an argument do not
access globals.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/helper.h | 162 ++++++++++++++++++++++----------------------
 1 file changed, 81 insertions(+), 81 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 44eb6b7b7c..da740ad9af 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -133,15 +133,15 @@ DEF_HELPER_FLAGS_1(ftsqrt, TCG_CALL_NO_RWG_SE, i32, i64)
 #define dh_ctype_vsr ppc_vsr_t *
 #define dh_typecode_vsr dh_typecode_ptr
 
-DEF_HELPER_3(vavgub, void, avr, avr, avr)
-DEF_HELPER_3(vavguh, void, avr, avr, avr)
-DEF_HELPER_3(vavguw, void, avr, avr, avr)
-DEF_HELPER_3(vabsdub, void, avr, avr, avr)
-DEF_HELPER_3(vabsduh, void, avr, avr, avr)
-DEF_HELPER_3(vabsduw, void, avr, avr, avr)
-DEF_HELPER_3(vavgsb, void, avr, avr, avr)
-DEF_HELPER_3(vavgsh, void, avr, avr, avr)
-DEF_HELPER_3(vavgsw, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vavgub, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vavguh, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vavguw, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vabsdub, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vabsduh, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vabsduw, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vavgsb, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vavgsh, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vavgsw, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_4(vcmpeqfp, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpgefp, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpgtfp, void, env, avr, avr, avr)
@@ -153,12 +153,12 @@ DEF_HELPER_4(vcmpeqfp_dot, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpgefp_dot, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpgtfp_dot, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpbfp_dot, void, env, avr, avr, avr)
-DEF_HELPER_3(vmrglb, void, avr, avr, avr)
-DEF_HELPER_3(vmrglh, void, avr, avr, avr)
-DEF_HELPER_3(vmrglw, void, avr, avr, avr)
-DEF_HELPER_3(vmrghb, void, avr, avr, avr)
-DEF_HELPER_3(vmrghh, void, avr, avr, avr)
-DEF_HELPER_3(vmrghw, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vmrglb, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vmrglh, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vmrglw, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vmrghb, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vmrghh, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vmrghw, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VMULESB, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VMULESH, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VMULESW, TCG_CALL_NO_RWG, void, avr, avr, avr)
@@ -171,15 +171,15 @@ DEF_HELPER_FLAGS_3(VMULOSW, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VMULOUB, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VMULOUH, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VMULOUW, TCG_CALL_NO_RWG, void, avr, avr, avr)
-DEF_HELPER_3(vslo, void, avr, avr, avr)
-DEF_HELPER_3(vsro, void, avr, avr, avr)
-DEF_HELPER_3(vsrv, void, avr, avr, avr)
-DEF_HELPER_3(vslv, void, avr, avr, avr)
-DEF_HELPER_3(vaddcuw, void, avr, avr, avr)
-DEF_HELPER_2(vprtybw, void, avr, avr)
-DEF_HELPER_2(vprtybd, void, avr, avr)
-DEF_HELPER_2(vprtybq, void, avr, avr)
-DEF_HELPER_3(vsubcuw, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vslo, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vsro, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vsrv, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vslv, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vaddcuw, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_2(vprtybw, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_2(vprtybd, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_2(vprtybq, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_3(vsubcuw, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_5(vaddsbs, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i32)
 DEF_HELPER_FLAGS_5(vaddshs, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i32)
 DEF_HELPER_FLAGS_5(vaddsws, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i32)
@@ -192,19 +192,19 @@ DEF_HELPER_FLAGS_5(vadduws, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i32)
 DEF_HELPER_FLAGS_5(vsububs, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i32)
 DEF_HELPER_FLAGS_5(vsubuhs, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i32)
 DEF_HELPER_FLAGS_5(vsubuws, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i32)
-DEF_HELPER_3(vadduqm, void, avr, avr, avr)
-DEF_HELPER_4(vaddecuq, void, avr, avr, avr, avr)
-DEF_HELPER_4(vaddeuqm, void, avr, avr, avr, avr)
-DEF_HELPER_3(vaddcuq, void, avr, avr, avr)
-DEF_HELPER_3(vsubuqm, void, avr, avr, avr)
-DEF_HELPER_4(vsubecuq, void, avr, avr, avr, avr)
-DEF_HELPER_4(vsubeuqm, void, avr, avr, avr, avr)
-DEF_HELPER_3(vsubcuq, void, avr, avr, avr)
-DEF_HELPER_4(vsldoi, void, avr, avr, avr, i32)
-DEF_HELPER_3(vextractub, void, avr, avr, i32)
-DEF_HELPER_3(vextractuh, void, avr, avr, i32)
-DEF_HELPER_3(vextractuw, void, avr, avr, i32)
-DEF_HELPER_3(vextractd, void, avr, avr, i32)
+DEF_HELPER_FLAGS_3(vadduqm, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_4(vaddecuq, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
+DEF_HELPER_FLAGS_4(vaddeuqm, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vaddcuq, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vsubuqm, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_4(vsubecuq, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
+DEF_HELPER_FLAGS_4(vsubeuqm, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vsubcuq, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_4(vsldoi, TCG_CALL_NO_RWG, void, avr, avr, avr, i32)
+DEF_HELPER_FLAGS_3(vextractub, TCG_CALL_NO_RWG, void, avr, avr, i32)
+DEF_HELPER_FLAGS_3(vextractuh, TCG_CALL_NO_RWG, void, avr, avr, i32)
+DEF_HELPER_FLAGS_3(vextractuw, TCG_CALL_NO_RWG, void, avr, avr, i32)
+DEF_HELPER_FLAGS_3(vextractd, TCG_CALL_NO_RWG, void, avr, avr, i32)
 DEF_HELPER_4(VINSBLX, void, env, avr, i64, tl)
 DEF_HELPER_4(VINSHLX, void, env, avr, i64, tl)
 DEF_HELPER_4(VINSWLX, void, env, avr, i64, tl)
@@ -213,16 +213,16 @@ DEF_HELPER_FLAGS_2(VSTRIBL, TCG_CALL_NO_RWG, i32, avr, avr)
 DEF_HELPER_FLAGS_2(VSTRIBR, TCG_CALL_NO_RWG, i32, avr, avr)
 DEF_HELPER_FLAGS_2(VSTRIHL, TCG_CALL_NO_RWG, i32, avr, avr)
 DEF_HELPER_FLAGS_2(VSTRIHR, TCG_CALL_NO_RWG, i32, avr, avr)
-DEF_HELPER_2(vnegw, void, avr, avr)
-DEF_HELPER_2(vnegd, void, avr, avr)
-DEF_HELPER_2(vupkhpx, void, avr, avr)
-DEF_HELPER_2(vupklpx, void, avr, avr)
-DEF_HELPER_2(vupkhsb, void, avr, avr)
-DEF_HELPER_2(vupkhsh, void, avr, avr)
-DEF_HELPER_2(vupkhsw, void, avr, avr)
-DEF_HELPER_2(vupklsb, void, avr, avr)
-DEF_HELPER_2(vupklsh, void, avr, avr)
-DEF_HELPER_2(vupklsw, void, avr, avr)
+DEF_HELPER_FLAGS_2(vnegw, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_2(vnegd, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_2(vupkhpx, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_2(vupklpx, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_2(vupkhsb, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_2(vupkhsh, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_2(vupkhsw, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_2(vupklsb, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_2(vupklsh, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_2(vupklsw, TCG_CALL_NO_RWG, void, avr, avr)
 DEF_HELPER_5(vmsumubm, void, env, avr, avr, avr, avr)
 DEF_HELPER_5(vmsummbm, void, env, avr, avr, avr, avr)
 DEF_HELPER_FLAGS_4(VPERM, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
@@ -239,14 +239,14 @@ DEF_HELPER_4(vpkudus, void, env, avr, avr, avr)
 DEF_HELPER_4(vpkuhum, void, env, avr, avr, avr)
 DEF_HELPER_4(vpkuwum, void, env, avr, avr, avr)
 DEF_HELPER_4(vpkudum, void, env, avr, avr, avr)
-DEF_HELPER_3(vpkpx, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vpkpx, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_5(vmhaddshs, void, env, avr, avr, avr, avr)
 DEF_HELPER_5(vmhraddshs, void, env, avr, avr, avr, avr)
 DEF_HELPER_5(vmsumuhm, void, env, avr, avr, avr, avr)
 DEF_HELPER_5(vmsumuhs, void, env, avr, avr, avr, avr)
 DEF_HELPER_5(vmsumshm, void, env, avr, avr, avr, avr)
 DEF_HELPER_5(vmsumshs, void, env, avr, avr, avr, avr)
-DEF_HELPER_4(vmladduhm, void, avr, avr, avr, avr)
+DEF_HELPER_FLAGS_4(vmladduhm, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
 DEF_HELPER_FLAGS_2(mtvscr, TCG_CALL_NO_RWG, void, env, i32)
 DEF_HELPER_FLAGS_1(mfvscr, TCG_CALL_NO_RWG, i32, env)
 DEF_HELPER_3(lvebx, void, env, avr, tl)
@@ -289,43 +289,43 @@ DEF_HELPER_4(vcfsx, void, env, avr, avr, i32)
 DEF_HELPER_4(vctuxs, void, env, avr, avr, i32)
 DEF_HELPER_4(vctsxs, void, env, avr, avr, i32)
 
-DEF_HELPER_2(vclzb, void, avr, avr)
-DEF_HELPER_2(vclzh, void, avr, avr)
-DEF_HELPER_2(vctzb, void, avr, avr)
-DEF_HELPER_2(vctzh, void, avr, avr)
-DEF_HELPER_2(vctzw, void, avr, avr)
-DEF_HELPER_2(vctzd, void, avr, avr)
-DEF_HELPER_2(vpopcntb, void, avr, avr)
-DEF_HELPER_2(vpopcnth, void, avr, avr)
-DEF_HELPER_2(vpopcntw, void, avr, avr)
-DEF_HELPER_2(vpopcntd, void, avr, avr)
-DEF_HELPER_1(vclzlsbb, tl, avr)
-DEF_HELPER_1(vctzlsbb, tl, avr)
-DEF_HELPER_3(vbpermd, void, avr, avr, avr)
-DEF_HELPER_3(vbpermq, void, avr, avr, avr)
-DEF_HELPER_3(vpmsumb, void, avr, avr, avr)
-DEF_HELPER_3(vpmsumh, void, avr, avr, avr)
-DEF_HELPER_3(vpmsumw, void, avr, avr, avr)
-DEF_HELPER_3(vpmsumd, void, avr, avr, avr)
-DEF_HELPER_2(vextublx, tl, tl, avr)
-DEF_HELPER_2(vextuhlx, tl, tl, avr)
-DEF_HELPER_2(vextuwlx, tl, tl, avr)
-DEF_HELPER_2(vextubrx, tl, tl, avr)
-DEF_HELPER_2(vextuhrx, tl, tl, avr)
-DEF_HELPER_2(vextuwrx, tl, tl, avr)
+DEF_HELPER_FLAGS_2(vclzb, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_2(vclzh, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_2(vctzb, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_2(vctzh, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_2(vctzw, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_2(vctzd, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_2(vpopcntb, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_2(vpopcnth, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_2(vpopcntw, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_2(vpopcntd, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_1(vclzlsbb, TCG_CALL_NO_RWG, tl, avr)
+DEF_HELPER_FLAGS_1(vctzlsbb, TCG_CALL_NO_RWG, tl, avr)
+DEF_HELPER_FLAGS_3(vbpermd, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vbpermq, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vpmsumb, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vpmsumh, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vpmsumw, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vpmsumd, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_2(vextublx, TCG_CALL_NO_RWG, tl, tl, avr)
+DEF_HELPER_FLAGS_2(vextuhlx, TCG_CALL_NO_RWG, tl, tl, avr)
+DEF_HELPER_FLAGS_2(vextuwlx, TCG_CALL_NO_RWG, tl, tl, avr)
+DEF_HELPER_FLAGS_2(vextubrx, TCG_CALL_NO_RWG, tl, tl, avr)
+DEF_HELPER_FLAGS_2(vextuhrx, TCG_CALL_NO_RWG, tl, tl, avr)
+DEF_HELPER_FLAGS_2(vextuwrx, TCG_CALL_NO_RWG, tl, tl, avr)
 DEF_HELPER_5(VEXTDUBVLX, void, env, avr, avr, avr, tl)
 DEF_HELPER_5(VEXTDUHVLX, void, env, avr, avr, avr, tl)
 DEF_HELPER_5(VEXTDUWVLX, void, env, avr, avr, avr, tl)
 DEF_HELPER_5(VEXTDDVLX, void, env, avr, avr, avr, tl)
 
-DEF_HELPER_2(vsbox, void, avr, avr)
-DEF_HELPER_3(vcipher, void, avr, avr, avr)
-DEF_HELPER_3(vcipherlast, void, avr, avr, avr)
-DEF_HELPER_3(vncipher, void, avr, avr, avr)
-DEF_HELPER_3(vncipherlast, void, avr, avr, avr)
-DEF_HELPER_3(vshasigmaw, void, avr, avr, i32)
-DEF_HELPER_3(vshasigmad, void, avr, avr, i32)
-DEF_HELPER_4(vpermxor, void, avr, avr, avr, avr)
+DEF_HELPER_FLAGS_2(vsbox, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_3(vcipher, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vcipherlast, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vncipher, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vncipherlast, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vshasigmaw, TCG_CALL_NO_RWG, void, avr, avr, i32)
+DEF_HELPER_FLAGS_3(vshasigmad, TCG_CALL_NO_RWG, void, avr, avr, i32)
+DEF_HELPER_FLAGS_4(vpermxor, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
 
 DEF_HELPER_4(bcdadd, i32, avr, avr, avr, i32)
 DEF_HELPER_4(bcdsub, i32, avr, avr, avr, i32)
-- 
2.25.1


