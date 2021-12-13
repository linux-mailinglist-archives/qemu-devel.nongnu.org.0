Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFF6473207
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 17:41:18 +0100 (CET)
Received: from localhost ([::1]:50256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwoO5-0005cg-C8
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 11:41:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mwoLe-0002xa-IG; Mon, 13 Dec 2021 11:38:46 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:46304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mwoLc-0003Xn-Gi; Mon, 13 Dec 2021 11:38:46 -0500
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 4D8D94034D;
 Mon, 13 Dec 2021 17:38:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1639413520;
 bh=VEu66ZfC7VzbkVKvz68XN6w+dvnIWvN/uEOLlhcRHlg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e1cDV1OMs1Y5wtUAVOO3jwz3bx4h7zoMZydtrgfuIqgOJ8JVklRZMdq/d2NIwfgFy
 gBogMrDgOa+N5XQ0d1+dGQL7QLy8AmSNq7Vm8Jr51yiunVrg1PwiMM1h4Av8MT7vT3
 t81TfiT/LVrWaEiifDCffrasFr7jNH6Aw9gGIIVrk+hRFdYNFb9/fk6z4Hl1PP0awC
 g1r3soz2L0N/PBeVLqTi+nFbvGnI3jV05Q5hja4V7ZwG4ZqNuOWofkkFOI2e33XOWY
 rhYHIX0EgGeMVKzvLJTq9eo/uA17432B46lRMlrGbxJ5WNHRYpnZ1Nr82y17SZ3jb9
 ZP5+cHIvv1g6g==
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 3889E6006B;
 Mon, 13 Dec 2021 17:38:40 +0100 (CET)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 086E014005C;
 Mon, 13 Dec 2021 17:38:40 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 04/18] target/riscv: additional macros to check instruction
 support
Date: Mon, 13 Dec 2021 17:38:20 +0100
Message-Id: <20211213163834.170504-5-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211213163834.170504-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20211213163834.170504-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (42)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: bin.meng@windriver.com, richard.henderson@linaro.org,
 alistair.francis@wdc.com, fabien.portas@grenoble-inp.org, palmer@dabbelt.com,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Given that the 128-bit version of the riscv spec adds new instructions, and
that some instructions that were previously only available in 64-bit mode
are now available for both 64-bit and 128-bit, we added new macros to check
for the processor mode during translation.
Although RV128 is a superset of RV64, we keep for now the RV64 only tests
for extensions other than RVI and RVM.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 1d57bc97b5..2718ff15a1 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -368,10 +368,22 @@ EX_SH(12)
     }                              \
 } while (0)
 
-#define REQUIRE_64BIT(ctx) do {    \
-    if (get_xl(ctx) < MXL_RV64) {  \
-        return false;              \
-    }                              \
+#define REQUIRE_64BIT(ctx) do {     \
+    if (get_xl(ctx) != MXL_RV64) {  \
+        return false;               \
+    }                               \
+} while (0)
+
+#define REQUIRE_128BIT(ctx) do {    \
+    if (get_xl(ctx) != MXL_RV128) { \
+        return false;               \
+    }                               \
+} while (0)
+
+#define REQUIRE_64_OR_128BIT(ctx) do { \
+    if (get_xl(ctx) == MXL_RV32) {     \
+        return false;                  \
+    }                                  \
 } while (0)
 
 static int ex_rvc_register(DisasContext *ctx, int reg)
-- 
2.34.1


