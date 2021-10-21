Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAA5435A05
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 06:31:33 +0200 (CEST)
Received: from localhost ([::1]:42136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdPjo-0007z6-1V
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 00:31:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZV-0005Wj-BJ; Thu, 21 Oct 2021 00:20:54 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:41495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZS-0008QH-CB; Thu, 21 Oct 2021 00:20:53 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HZZ5p4hDkz4xdL; Thu, 21 Oct 2021 15:20:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1634790030;
 bh=Zh48uUNm2Lk9WPLLs7UhrlW3DSAtrrHbWQvPx6mtoIY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gXIyFShXGUuAUn2xS70ncw+2AWTevklbBIHbUfhAhKfxg6JTfMPcjMFXDBHuQLLQV
 ObB6JnVt/T6GxzpAysdSNjQ3PYRnBHWe8JaSaTGUf3b30vd758LDllKz87CeAx/kqL
 YP/ibBueb2YwdrI/33avPhFWBlT64vGI8N229Qww=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 12/25] target/ppc: Fix XER access in monitor
Date: Thu, 21 Oct 2021 15:20:14 +1100
Message-Id: <20211021042027.345405-13-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211021042027.345405-1-david@gibson.dropbear.id.au>
References: <20211021042027.345405-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
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
Cc: danielhb413@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

We can't read env->xer directly, as it does not contain some bits of
XER. Instead, we should have a callback that uses cpu_read_xer to read
the complete register.

Fixes: da91a00f191f ("target-ppc: Split out SO, OV, CA fields from XER")
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20211014223234.127012-5-matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/monitor.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/ppc/monitor.c b/target/ppc/monitor.c
index a475108b2d..0b805ef6e9 100644
--- a/target/ppc/monitor.c
+++ b/target/ppc/monitor.c
@@ -44,6 +44,13 @@ static target_long monitor_get_ccr(Monitor *mon, const struct MonitorDef *md,
     return u;
 }
 
+static target_long monitor_get_xer(Monitor *mon, const struct MonitorDef *md,
+                                   int val)
+{
+    CPUArchState *env = mon_get_cpu_env(mon);
+    return cpu_read_xer(env);
+}
+
 static target_long monitor_get_decr(Monitor *mon, const struct MonitorDef *md,
                                     int val)
 {
@@ -85,7 +92,7 @@ const MonitorDef monitor_defs[] = {
     { "decr", 0, &monitor_get_decr, },
     { "ccr|cr", 0, &monitor_get_ccr, },
     /* Machine state register */
-    { "xer", offsetof(CPUPPCState, xer) },
+    { "xer", 0, &monitor_get_xer },
     { "msr", offsetof(CPUPPCState, msr) },
     { "tbu", 0, &monitor_get_tbu, },
     { "tbl", 0, &monitor_get_tbl, },
-- 
2.31.1


