Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5DB576899
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 22:58:35 +0200 (CEST)
Received: from localhost ([::1]:60602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCSOQ-0002xS-U3
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 16:58:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oCSL6-0005eu-VK; Fri, 15 Jul 2022 16:55:11 -0400
Received: from [200.168.210.66] (port=55753 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oCSL5-00083Z-Ex; Fri, 15 Jul 2022 16:55:08 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 15 Jul 2022 17:54:53 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 507E9800181;
 Fri, 15 Jul 2022 17:54:53 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br, cohuck@redhat.com, farosas@linux.ibm.com
Subject: [PATCH v4 3/3] target/ppc: Implement hashstp and hashchkp
Date: Fri, 15 Jul 2022 17:54:39 -0300
Message-Id: <20220715205439.161110-4-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220715205439.161110-1-victor.colombo@eldorado.org.br>
References: <20220715205439.161110-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 15 Jul 2022 20:54:53.0761 (UTC)
 FILETIME=[221DAB10:01D8988D]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
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

Implementation for instructions hashstp and hashchkp, the privileged
versions of hashst and hashchk, which were added in Power ISA 3.1B.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 target/ppc/excp_helper.c                   | 2 ++
 target/ppc/helper.h                        | 2 ++
 target/ppc/insn32.decode                   | 2 ++
 target/ppc/translate/fixedpoint-impl.c.inc | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index fa5a737e22..847eff9213 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -2255,6 +2255,8 @@ void helper_##op(CPUPPCState *env, target_ulong ea, target_ulong ra,          \
 
 HELPER_HASH(HASHST, env->spr[SPR_HASHKEYR], true)
 HELPER_HASH(HASHCHK, env->spr[SPR_HASHKEYR], false)
+HELPER_HASH(HASHSTP, env->spr[SPR_HASHPKEYR], true)
+HELPER_HASH(HASHCHKP, env->spr[SPR_HASHPKEYR], false)
 
 #if !defined(CONFIG_USER_ONLY)
 
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 5817af632b..122b2e9359 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -6,6 +6,8 @@ DEF_HELPER_FLAGS_4(td, TCG_CALL_NO_WG, void, env, tl, tl, i32)
 #endif
 DEF_HELPER_4(HASHST, void, env, tl, tl, tl)
 DEF_HELPER_4(HASHCHK, void, env, tl, tl, tl)
+DEF_HELPER_4(HASHSTP, void, env, tl, tl, tl)
+DEF_HELPER_4(HASHCHKP, void, env, tl, tl, tl)
 #if !defined(CONFIG_USER_ONLY)
 DEF_HELPER_2(store_msr, void, env, tl)
 DEF_HELPER_1(rfi, void, env)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 544514565c..da08960fca 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -330,6 +330,8 @@ PEXTD           011111 ..... ..... ..... 0010111100 -   @X
 
 HASHST          011111 ..... ..... ..... 1011010010 .   @X_DW
 HASHCHK         011111 ..... ..... ..... 1011110010 .   @X_DW
+HASHSTP         011111 ..... ..... ..... 1010010010 .   @X_DW
+HASHCHKP        011111 ..... ..... ..... 1010110010 .   @X_DW
 
 ## BCD Assist
 
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index 41c06de8a2..1ba56cbed5 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -572,3 +572,5 @@ static bool do_hash(DisasContext *ctx, arg_X *a, bool priv,
 
 TRANS(HASHST, do_hash, false, gen_helper_HASHST)
 TRANS(HASHCHK, do_hash, false, gen_helper_HASHCHK)
+TRANS(HASHSTP, do_hash, true, gen_helper_HASHSTP)
+TRANS(HASHCHKP, do_hash, true, gen_helper_HASHCHKP)
-- 
2.25.1


