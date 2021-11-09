Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6242F44A758
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 08:07:22 +0100 (CET)
Received: from localhost ([::1]:58364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkLE1-0002ZH-H1
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 02:07:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK4g-0005e2-Mu; Tue, 09 Nov 2021 00:53:38 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=50899
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK4f-0006tj-1N; Tue, 09 Nov 2021 00:53:38 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HpHDp4dkbz4xfG; Tue,  9 Nov 2021 16:52:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636437130;
 bh=IY6IAlCdlC2wt8FHggSUt40r8tRr7HW/qHwxmqSNyuY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RbcwJZdTuEHSJkeFt/icq6D9UurCwUMGKJ/PZy2iepJrN+0Sn/jsxR7o99OidXoKD
 CfFEZqZrejdf4JymGr1aZjL7GsN5jscvPluf9EDuXVAEUIG45ZKVESTy+NUUgjAUxt
 FjNkWfbh+hI0kSiOgGt6fOahfa1/gsAdJLvOouyM=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 groug@kaod.org
Subject: [PULL 37/54] target/ppc: Introduce REQUIRE_VSX macro
Date: Tue,  9 Nov 2021 16:51:47 +1100
Message-Id: <20211109055204.230765-38-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211109055204.230765-1-david@gibson.dropbear.id.au>
References: <20211109055204.230765-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Luis Pires <luis.pires@eldorado.org.br>, qemu-ppc@nongnu.org,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>

Introduce the macro to centralize checking if the VSX facility is
enabled and handle it correctly.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20211104123719.323713-11-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index fc9d35a7a8..e88b613093 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7354,6 +7354,14 @@ static int times_16(DisasContext *ctx, int x)
         }                                               \
     } while (0)
 
+#define REQUIRE_VSX(CTX)                                \
+    do {                                                \
+        if (unlikely(!(CTX)->vsx_enabled)) {            \
+            gen_exception((CTX), POWERPC_EXCP_VSXU);    \
+            return true;                                \
+        }                                               \
+    } while (0)
+
 #define REQUIRE_FPU(ctx)                                \
     do {                                                \
         if (unlikely(!(ctx)->fpu_enabled)) {            \
-- 
2.33.1


