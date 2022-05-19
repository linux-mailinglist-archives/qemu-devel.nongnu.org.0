Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D0B52DE65
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 22:29:04 +0200 (CEST)
Received: from localhost ([::1]:40304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrmlb-0005hD-3N
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 16:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nrmdV-00043t-G0; Thu, 19 May 2022 16:20:41 -0400
Received: from [187.72.171.209] (port=43855 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nrmdT-00074v-TT; Thu, 19 May 2022 16:20:41 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 19 May 2022 17:18:46 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 11ECD800C32;
 Thu, 19 May 2022 17:18:46 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH v2 03/12] target/ppc: use TCG_CALL_NO_RWG in BCD helpers
Date: Thu, 19 May 2022 17:18:13 -0300
Message-Id: <20220519201822.465229-4-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519201822.465229-1-matheus.ferst@eldorado.org.br>
References: <20220519201822.465229-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 19 May 2022 20:18:46.0262 (UTC)
 FILETIME=[A4A3D160:01D86BBD]
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

Helpers of BCD instructions only access the VSRs supplied by the
TCGv_ptr arguments, no globals are accessed.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/helper.h | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index a5d066ff2d..11e41af020 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -327,21 +327,21 @@ DEF_HELPER_FLAGS_3(vshasigmaw, TCG_CALL_NO_RWG, void, avr, avr, i32)
 DEF_HELPER_FLAGS_3(vshasigmad, TCG_CALL_NO_RWG, void, avr, avr, i32)
 DEF_HELPER_FLAGS_4(vpermxor, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
 
-DEF_HELPER_4(bcdadd, i32, avr, avr, avr, i32)
-DEF_HELPER_4(bcdsub, i32, avr, avr, avr, i32)
-DEF_HELPER_3(bcdcfn, i32, avr, avr, i32)
-DEF_HELPER_3(bcdctn, i32, avr, avr, i32)
-DEF_HELPER_3(bcdcfz, i32, avr, avr, i32)
-DEF_HELPER_3(bcdctz, i32, avr, avr, i32)
-DEF_HELPER_3(bcdcfsq, i32, avr, avr, i32)
-DEF_HELPER_3(bcdctsq, i32, avr, avr, i32)
-DEF_HELPER_4(bcdcpsgn, i32, avr, avr, avr, i32)
-DEF_HELPER_3(bcdsetsgn, i32, avr, avr, i32)
-DEF_HELPER_4(bcds, i32, avr, avr, avr, i32)
-DEF_HELPER_4(bcdus, i32, avr, avr, avr, i32)
-DEF_HELPER_4(bcdsr, i32, avr, avr, avr, i32)
-DEF_HELPER_4(bcdtrunc, i32, avr, avr, avr, i32)
-DEF_HELPER_4(bcdutrunc, i32, avr, avr, avr, i32)
+DEF_HELPER_FLAGS_4(bcdadd, TCG_CALL_NO_RWG, i32, avr, avr, avr, i32)
+DEF_HELPER_FLAGS_4(bcdsub, TCG_CALL_NO_RWG, i32, avr, avr, avr, i32)
+DEF_HELPER_FLAGS_3(bcdcfn, TCG_CALL_NO_RWG, i32, avr, avr, i32)
+DEF_HELPER_FLAGS_3(bcdctn, TCG_CALL_NO_RWG, i32, avr, avr, i32)
+DEF_HELPER_FLAGS_3(bcdcfz, TCG_CALL_NO_RWG, i32, avr, avr, i32)
+DEF_HELPER_FLAGS_3(bcdctz, TCG_CALL_NO_RWG, i32, avr, avr, i32)
+DEF_HELPER_FLAGS_3(bcdcfsq, TCG_CALL_NO_RWG, i32, avr, avr, i32)
+DEF_HELPER_FLAGS_3(bcdctsq, TCG_CALL_NO_RWG, i32, avr, avr, i32)
+DEF_HELPER_FLAGS_4(bcdcpsgn, TCG_CALL_NO_RWG, i32, avr, avr, avr, i32)
+DEF_HELPER_FLAGS_3(bcdsetsgn, TCG_CALL_NO_RWG, i32, avr, avr, i32)
+DEF_HELPER_FLAGS_4(bcds, TCG_CALL_NO_RWG, i32, avr, avr, avr, i32)
+DEF_HELPER_FLAGS_4(bcdus, TCG_CALL_NO_RWG, i32, avr, avr, avr, i32)
+DEF_HELPER_FLAGS_4(bcdsr, TCG_CALL_NO_RWG, i32, avr, avr, avr, i32)
+DEF_HELPER_FLAGS_4(bcdtrunc, TCG_CALL_NO_RWG, i32, avr, avr, avr, i32)
+DEF_HELPER_FLAGS_4(bcdutrunc, TCG_CALL_NO_RWG, i32, avr, avr, avr, i32)
 
 DEF_HELPER_4(xsadddp, void, env, vsr, vsr, vsr)
 DEF_HELPER_5(xsaddqp, void, env, i32, vsr, vsr, vsr)
-- 
2.25.1


