Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 910BD4606B8
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Nov 2021 15:13:22 +0100 (CET)
Received: from localhost ([::1]:51926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrKvh-0002BO-7F
	for lists+qemu-devel@lfdr.de; Sun, 28 Nov 2021 09:13:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mrKgj-0005vm-Qh; Sun, 28 Nov 2021 08:57:57 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:34278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mrKgh-0004eJ-5d; Sun, 28 Nov 2021 08:57:53 -0500
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 9D04240291;
 Sun, 28 Nov 2021 14:57:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1638107867;
 bh=YzmsrreUvLP0sRCYbZs6n4p+IgPxW/b5EsoH0fjVkCk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JWpwhhOFKSLkhmzXHQAHFjztr6UZ1KkQ1qA0gKMwejZk589dcUssg5WwNixCo5rko
 xRb+aRoHcUnQgEMtRrkBA4IgCImEwnAmPEUy4F1lmPFIPVSZXuSl8R4TgGDf8cJRJA
 XpENsI+FEDxtM3YfzOMTFo8vcBF6sy0DnmZ7R26Pnsce4a+vCJlxd4TJ3Sz89wqfAR
 ibhaAFoHlm3tsR1UaLowxEqST7Kp5V73yGOFzGWHSZ0iuWchx5vZE8uDXqJq+lbOJG
 KcTB3Bf3gAee4AfUzjEhIWy0YryyPNWEnUy3I9KfmuZK4dgGXlDBTKYO6LqZE8Nfr7
 WQMZC1bJeLdMA==
Received: from smtps.univ-grenoble-alpes.fr (smtps3.u-ga.fr [195.83.24.62])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 858A660066;
 Sun, 28 Nov 2021 14:57:47 +0100 (CET)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 5700E40069;
 Sun, 28 Nov 2021 14:57:47 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 04/18] target/riscv: additional macros to check instruction
 support
Date: Sun, 28 Nov 2021 14:57:05 +0100
Message-Id: <20211128135719.50444-5-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211128135719.50444-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20211128135719.50444-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 195.83.24.62
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
2.34.0


