Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9436593362
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 18:41:31 +0200 (CEST)
Received: from localhost ([::1]:59486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNd9e-0006pZ-I2
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 12:41:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oNcpv-0007Jk-L8; Mon, 15 Aug 2022 12:21:11 -0400
Received: from [200.168.210.66] (port=25068 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oNcpu-0005gw-67; Mon, 15 Aug 2022 12:21:07 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 15 Aug 2022 13:20:44 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id D3DDB800186;
 Mon, 15 Aug 2022 13:20:43 -0300 (-03)
From: Matheus Ferst <matheus.ferst@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [RFC PATCH 04/13] target/ppc: prepare to split ppc_interrupt_pending
 by excp_model
Date: Mon, 15 Aug 2022 13:20:10 -0300
Message-Id: <20220815162020.2420093-5-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220815162020.2420093-1-matheus.ferst@eldorado.org.br>
References: <20220815162020.2420093-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 15 Aug 2022 16:20:44.0108 (UTC)
 FILETIME=[F82A10C0:01D8B0C2]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Rename the method to ppc_interrupt_pending_legacy and create a new
ppc_interrupt_pending that will call the appropriate interrupt masking
method based on env->excp_model.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/excp_helper.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 8690017c70..59981efd16 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1678,7 +1678,7 @@ void ppc_cpu_do_interrupt(CPUState *cs)
     powerpc_excp(cpu, cs->exception_index);
 }
 
-static int ppc_pending_interrupt(CPUPPCState *env)
+static int ppc_pending_interrupt_legacy(CPUPPCState *env)
 {
     bool async_deliver;
 
@@ -1790,6 +1790,14 @@ static int ppc_pending_interrupt(CPUPPCState *env)
     return 0;
 }
 
+static int ppc_pending_interrupt(CPUPPCState *env)
+{
+    switch (env->excp_model) {
+    default:
+        return ppc_pending_interrupt_legacy(env);
+    }
+}
+
 static void ppc_hw_interrupt(CPUPPCState *env, int pending_interrupt)
 {
     PowerPCCPU *cpu = env_archcpu(env);
-- 
2.25.1


