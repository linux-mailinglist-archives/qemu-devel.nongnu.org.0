Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8600247D42
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 06:21:39 +0200 (CEST)
Received: from localhost ([::1]:56448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7t7y-0000m9-Ds
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 00:21:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k7t62-00078P-Fr; Tue, 18 Aug 2020 00:19:38 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:53465 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k7t5z-0006Jb-Vu; Tue, 18 Aug 2020 00:19:38 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BVyNY4sbGz9sTS; Tue, 18 Aug 2020 14:19:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1597724365;
 bh=RdJV2yot/UhGOzirSJUvUVouMlVvWvMKUQfAb4Kr/jU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FoxhWpfgq7wClbD+HYuraY5TmpdZzGG8ASeMnjViM5ZLF1h50M3xmltV/7jonFdbN
 ilihjRKI7/QlcB1vt3mL2mqEgvR9qmyF2eWQjOOh0TdBrcrGJocqIFJKK+ngGGXsto
 FQ0gTbEc9DgQ6bI9qCVb+4AKpAWzt/Zc5Es8RBKY=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 01/40] target/ppc: Fix TCG leak with the evmwsmiaa instruction
Date: Tue, 18 Aug 2020 14:18:43 +1000
Message-Id: <20200818041922.251708-2-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200818041922.251708-1-david@gibson.dropbear.id.au>
References: <20200818041922.251708-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
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
 qemu-devel@nongnu.org,
 Matthieu Bucchianeri <matthieu.bucchianeri@leostella.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matthieu Bucchianeri <matthieu.bucchianeri@leostella.com>

Fix double-call to tcg_temp_new_i64(), where a temp is allocated both at
declaration time and further down the implementation of gen_evmwsmiaa().

Note that gen_evmwsmia() and gen_evmwsmiaa() are still not implemented
correctly, as they invoke gen_evmwsmi() which may return early, but the
return is not propagated. This will be fixed in my patch for bug #1888918.

Signed-off-by: Matthieu Bucchianeri <matthieu.bucchianeri@leostella.com>
Message-Id: <20200727172114.31415-1-matthieu.bucchianeri@leostella.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate/spe-impl.inc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/translate/spe-impl.inc.c b/target/ppc/translate/spe-impl.inc.c
index 36b4d5654d..42a0d1cffb 100644
--- a/target/ppc/translate/spe-impl.inc.c
+++ b/target/ppc/translate/spe-impl.inc.c
@@ -531,8 +531,8 @@ static inline void gen_evmwsmia(DisasContext *ctx)
 
 static inline void gen_evmwsmiaa(DisasContext *ctx)
 {
-    TCGv_i64 acc = tcg_temp_new_i64();
-    TCGv_i64 tmp = tcg_temp_new_i64();
+    TCGv_i64 acc;
+    TCGv_i64 tmp;
 
     gen_evmwsmi(ctx);           /* rD := rA * rB */
 
-- 
2.26.2


