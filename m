Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC2F388EA1
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 15:07:26 +0200 (CEST)
Received: from localhost ([::1]:39386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljLv3-00041P-Ge
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 09:07:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLgj-0000lA-Nx; Wed, 19 May 2021 08:52:38 -0400
Received: from ozlabs.org ([203.11.71.1]:43821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLgc-0001CL-56; Wed, 19 May 2021 08:52:36 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlXnZ6R5rz9srX; Wed, 19 May 2021 22:52:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621428722;
 bh=qMEAHsr2WHQalqtGq4i848OIW4/tU01hxdcKTj/dkKc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YM3AfXi1fgWUq9SbRIfitqcrT+7ZIdNRpvYz8u7ofbp3D/0WUiFFF57s7Ct23V8ve
 /vzfDX00FiWa4ez56LOfcB0PTo1sFVRKzRhbVep6HlJBjJKdG0PbiANovldeE5aEnL
 BOtKHAtnq2+TSdGcoi0XVhHuCd7BIafbJKO6gkLk=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 13/48] target/ppc: updated vscr manipulation in machine.c
Date: Wed, 19 May 2021 22:51:13 +1000
Message-Id: <20210519125148.27720-14-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519125148.27720-1-david@gibson.dropbear.id.au>
References: <20210519125148.27720-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>

Updated the code in machine.c to use the generic ppc_{store,get}_vscr
instead of helper style functions, so it can build without TCG

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Message-Id: <20210512140813.112884-7-bruno.larsen@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
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
2.31.1


