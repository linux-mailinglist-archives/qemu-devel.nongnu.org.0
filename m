Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE324399C88
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:27:26 +0200 (CEST)
Received: from localhost ([::1]:55770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loihJ-0007mJ-S9
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:27:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loid0-0006DU-Er; Thu, 03 Jun 2021 04:22:58 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:49395 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loicx-0008Tr-PL; Thu, 03 Jun 2021 04:22:58 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fwf5l6SBJz9sXb; Thu,  3 Jun 2021 18:22:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622708555;
 bh=c98nJZ4c64o65mzlMjbL0PuZ3N/AVk0rWT8H+x6cjsg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oPlDoLSVJWP0+nEqtb0eLCS6ln97FtmA1I09VQ56v7tYknlc2cRZCeNwkQ4Q2Rg5W
 5RGxEr7zIaaIhF5m71qRNF0XXKeaHkUg42Rxp5ak92Dx2SZ8YQHrHjF78dV2Ez+GDc
 bcEyCfMLWTyn/1tmN2yMcV9h0UTkFfPOpDMLAXQ0=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 12/42] target/ppc: used ternary operator when registering MAS
Date: Thu,  3 Jun 2021 18:22:01 +1000
Message-Id: <20210603082231.601214-13-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603082231.601214-1-david@gibson.dropbear.id.au>
References: <20210603082231.601214-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>

The write calback decision when registering the MAS SPR has been turned
into a ternary operation, rather than an if-then-else block.

This was done because when building without TCG, even though the
compiler will optimize away the pointers to spr_write_generic*, it
doesn't optimize away the decision and assignment to the local pointer,
creating compiler errors. This cleanup looked better than using ifdefs,
so  we decided to with it.

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210525115355.8254-2-bruno.larsen@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu_init.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 310dfbd26a..a32893fde8 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -1205,15 +1205,12 @@ static void register_BookE206_sprs(CPUPPCState *env, uint32_t mas_mask,
     /* TLB assist registers */
     /* XXX : not implemented */
     for (i = 0; i < 8; i++) {
-        void (*uea_write)(DisasContext *ctx, int sprn, int gprn) =
-            &spr_write_generic32;
-        if (i == 2 && (mas_mask & (1 << i)) && (env->insns_flags & PPC_64B)) {
-            uea_write = &spr_write_generic;
-        }
         if (mas_mask & (1 << i)) {
             spr_register(env, mas_sprn[i], mas_names[i],
                          SPR_NOACCESS, SPR_NOACCESS,
-                         &spr_read_generic, uea_write,
+                         &spr_read_generic,
+                         (i == 2 && (env->insns_flags & PPC_64B))
+                         ? &spr_write_generic : &spr_write_generic32,
                          0x00000000);
         }
     }
-- 
2.31.1


