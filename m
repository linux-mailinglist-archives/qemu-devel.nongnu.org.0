Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E8F388ED6
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 15:18:58 +0200 (CEST)
Received: from localhost ([::1]:46218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljM6D-0002R0-Kl
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 09:18:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLh7-0001K6-M8; Wed, 19 May 2021 08:53:02 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:34641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLgz-0001MS-5J; Wed, 19 May 2021 08:52:54 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlXnk4TYPz9t2b; Wed, 19 May 2021 22:52:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621428730;
 bh=zpsVKsxnnsx7gNVqFu7VaZXETBUW1ZEzg+RP1HiSQ60=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VFUvbgYMwi077GBmHek974H6xexwWteRL5gbHtKL2ld0r/QiLtVTxx6XWo2eHrXSE
 RuQAvtzPRiy3SIJ7f/nIjfUwO8xIMoTEEGZwuNSrINB/XFJ3gGb37yAvrh6fmgx7oq
 yGN5Q1d07qXjLnTxQO00DdcGvHP0ykPhakFhdd+g=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 30/48] target/ppc: Tidy exception vs exit_tb
Date: Wed, 19 May 2021 22:51:30 +1000
Message-Id: <20210519125148.27720-31-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519125148.27720-1-david@gibson.dropbear.id.au>
References: <20210519125148.27720-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: richard.henderson@linaro.org, David Gibson <david@gibson.dropbear.id.au>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

We do not need to emit an exit_tb after an exception,
as the latter will exit via longjmp.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20210517205025.3777947-7-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 05e3c0417a..e68152810e 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -4648,8 +4648,9 @@ static void gen_lookup_and_goto_ptr(DisasContext *ctx)
         } else if (sse & (CPU_SINGLE_STEP | CPU_BRANCH_STEP)) {
             uint32_t excp = gen_prep_dbgex(ctx);
             gen_exception(ctx, excp);
+        } else {
+            tcg_gen_exit_tb(NULL, 0);
         }
-        tcg_gen_exit_tb(NULL, 0);
     } else {
         tcg_gen_lookup_and_goto_ptr();
     }
-- 
2.31.1


