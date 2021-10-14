Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC1842E449
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 00:38:31 +0200 (CEST)
Received: from localhost ([::1]:36174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb9Ms-0005Kz-4P
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 18:38:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mb9JP-0002HR-7l; Thu, 14 Oct 2021 18:34:55 -0400
Received: from [201.28.113.2] (port=23608 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mb9JN-0005Cp-Ni; Thu, 14 Oct 2021 18:34:54 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 14 Oct 2021 19:34:38 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id C4004800BB0;
 Thu, 14 Oct 2021 19:34:37 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 4/4] target/ppc: Fix XER access in monitor
Date: Thu, 14 Oct 2021 19:32:34 -0300
Message-Id: <20211014223234.127012-5-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211014223234.127012-1-matheus.ferst@eldorado.org.br>
References: <20211014223234.127012-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 14 Oct 2021 22:34:38.0220 (UTC)
 FILETIME=[ABF224C0:01D7C14B]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 richard.henderson@linaro.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

We can't read env->xer directly, as it does not contain some bits of
XER. Instead, we should have a callback that uses cpu_read_xer to read
the complete register.

Fixes: da91a00f191f ("target-ppc: Split out SO, OV, CA fields from XER")
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
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
2.25.1


