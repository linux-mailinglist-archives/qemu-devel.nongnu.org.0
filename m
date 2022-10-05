Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC565F546B
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 14:29:13 +0200 (CEST)
Received: from localhost ([::1]:52030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og3WS-0004kL-Hh
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 08:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1og3Me-00088v-Iz; Wed, 05 Oct 2022 08:19:04 -0400
Received: from [200.168.210.66] (port=33285 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1og3Ma-0001Vc-25; Wed, 05 Oct 2022 08:19:03 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 5 Oct 2022 09:18:52 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 75A438002A8;
 Wed,  5 Oct 2022 09:18:51 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br, matheus.ferst@eldorado.org.br,
 lucas.araujo@eldorado.org.br, leandro.lupori@eldorado.org.br,
 lucas.coutinho@eldorado.org.br
Subject: [PATCH] target/ppc: Fix xvcmp* clearing FI bit
Date: Wed,  5 Oct 2022 09:15:51 -0300
Message-Id: <20221005121551.27957-1-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 05 Oct 2022 12:18:52.0078 (UTC)
 FILETIME=[A16344E0:01D8D8B4]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vector instructions in general are not supposed to change the FI bit.
However, xvcmp* instructions are calling gen_helper_float_check_status,
which is leading to a cleared FI flag where it should be kept
unchanged.
As helper_float_check_status only affects inexact, overflow and
underflow, and the xvcmp* instructions don't change these flags, this
issue can be fixed by removing the call to helper_float_check_status.
By doing this, the FI bit in FPSCR will be preserved as expected.

Fixes: 00084a25adf ("target/ppc: introduce separate VSX_CMP macro for xvcmp* instructions")
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 target/ppc/translate/vsx-impl.c.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 7acdbceec4..e6e5c45ffd 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -810,7 +810,6 @@ static void gen_##name(DisasContext *ctx)                                     \
         gen_helper_##name(ignored, cpu_env, xt, xa, xb);                      \
         tcg_temp_free_i32(ignored);                                           \
     }                                                                         \
-    gen_helper_float_check_status(cpu_env);                                   \
     tcg_temp_free_ptr(xt);                                                    \
     tcg_temp_free_ptr(xa);                                                    \
     tcg_temp_free_ptr(xb);                                                    \
-- 
2.25.1


