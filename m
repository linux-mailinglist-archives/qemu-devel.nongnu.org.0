Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F5937BFE6
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 16:26:45 +0200 (CEST)
Received: from localhost ([::1]:41366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgpoy-0008BN-KN
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 10:26:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lgpY1-0004aq-A5; Wed, 12 May 2021 10:09:16 -0400
Received: from [201.28.113.2] (port=48830 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lgpXz-00081F-3R; Wed, 12 May 2021 10:09:12 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 12 May 2021 11:08:39 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 2828980139F;
 Wed, 12 May 2021 11:08:39 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/11] target/ppc: updated vscr manipulation in machine.c
Date: Wed, 12 May 2021 11:08:08 -0300
Message-Id: <20210512140813.112884-7-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 12 May 2021 14:08:39.0306 (UTC)
 FILETIME=[4E983EA0:01D74738]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org,
 luis.pires@eldorado.org.br, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Updated the code in machine.c to use the generic ppc_{store,get}_vscr
instead of helper style functions, so it can build without TCG

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---
 target/ppc/machine.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index e5bffbe365..93972df58e 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -8,7 +8,6 @@
 #include "qapi/error.h"
 #include "qemu/main-loop.h"
 #include "kvm_ppc.h"
-#include "exec/helper-proto.h"
 
 static void post_load_update_msr(CPUPPCState *env)
 {
@@ -107,7 +106,7 @@ static int cpu_load_old(QEMUFile *f, void *opaque, int version_id)
         ppc_store_sdr1(env, sdr1);
     }
     qemu_get_be32s(f, &vscr);
-    helper_mtvscr(env, vscr);
+    ppc_store_vscr(env, vscr);
     qemu_get_be64s(f, &env->spe_acc);
     qemu_get_be32s(f, &env->spe_fscr);
     qemu_get_betls(f, &env->msr_mask);
@@ -456,7 +455,7 @@ static int get_vscr(QEMUFile *f, void *opaque, size_t size,
                     const VMStateField *field)
 {
     PowerPCCPU *cpu = opaque;
-    helper_mtvscr(&cpu->env, qemu_get_be32(f));
+    ppc_store_vscr(&cpu->env, qemu_get_be32(f));
     return 0;
 }
 
@@ -464,7 +463,7 @@ static int put_vscr(QEMUFile *f, void *opaque, size_t size,
                     const VMStateField *field, JSONWriter *vmdesc)
 {
     PowerPCCPU *cpu = opaque;
-    qemu_put_be32(f, helper_mfvscr(&cpu->env));
+    qemu_put_be32(f, ppc_get_vscr(&cpu->env));
     return 0;
 }
 
-- 
2.17.1


