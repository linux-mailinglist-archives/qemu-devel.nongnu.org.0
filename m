Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF18A6DC183
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Apr 2023 23:25:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plcWC-00044X-BY; Sun, 09 Apr 2023 17:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=exYW=AA=kaod.org=clg@ozlabs.org>)
 id 1plcWA-00044L-LN
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 17:24:10 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=exYW=AA=kaod.org=clg@ozlabs.org>)
 id 1plcW8-0005Ki-8A
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 17:24:10 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4PvlTp1VF3z4xG7;
 Mon, 10 Apr 2023 07:23:58 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PvlTl4NKYz4xFv;
 Mon, 10 Apr 2023 07:23:55 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 1/1] target/ppc: Fix temp usage in gen_op_arith_modw
Date: Sun,  9 Apr 2023 23:23:47 +0200
Message-Id: <20230409212347.16028-2-clg@kaod.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230409212347.16028-1-clg@kaod.org>
References: <20230409212347.16028-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=exYW=AA=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

Fix a crash writing to 't3', which is now a constant.
Instead, write the result of the remu to 't0'.

Fixes: 7058ff5231a ("target/ppc: Avoid tcg_const_* in translate.c")
Reported-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Anton Johansson <anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
[ clg: amend commit log s/t1/t0/ ]
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 target/ppc/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 9d05357d03..f603f1a939 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -1807,8 +1807,8 @@ static inline void gen_op_arith_modw(DisasContext *ctx, TCGv ret, TCGv arg1,
         TCGv_i32 t2 = tcg_constant_i32(1);
         TCGv_i32 t3 = tcg_constant_i32(0);
         tcg_gen_movcond_i32(TCG_COND_EQ, t1, t1, t3, t2, t1);
-        tcg_gen_remu_i32(t3, t0, t1);
-        tcg_gen_extu_i32_tl(ret, t3);
+        tcg_gen_remu_i32(t0, t0, t1);
+        tcg_gen_extu_i32_tl(ret, t0);
     }
 }
 
-- 
2.39.2


