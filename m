Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE7F2D9283
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 06:15:46 +0100 (CET)
Received: from localhost ([::1]:38932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kogD3-0003uZ-Uq
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 00:15:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofwy-0005wE-7L; Sun, 13 Dec 2020 23:59:08 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:52949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofwt-0004ta-1L; Sun, 13 Dec 2020 23:59:06 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CvTft4kGVz9sWg; Mon, 14 Dec 2020 15:58:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607921894;
 bh=KXt5m26LRHcKPaeVzJr7A69rPQVXxzcMgxfXZnq3Izs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZJVSdc2rFB6YgPqkkGkrlucCCZhyEZ2UsnkNIktZrkyYemABKsJYQvaFYucO7Gh4L
 dz8Qv5u92DlVB0Zx4UR5ygOAakF4kEgnQRMWdX2Y7tlLwm1TobhKZfbwEdWkX+dEm9
 lE+GUcwbYyd15lTQolw8GCZ5omKoXDSQIH9ReyKg=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 25/30] ppc/translate: Use POWERPC_MMU_64 to detect 64-bit MMU
 models
Date: Mon, 14 Dec 2020 15:58:02 +1100
Message-Id: <20201214045807.41003-26-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214045807.41003-1-david@gibson.dropbear.id.au>
References: <20201214045807.41003-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
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
Cc: Stephane Duverger <stephane.duverger@free.fr>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stephane Duverger <stephane.duverger@free.fr>

The ppc_tr_init_disas_context() function currently checks whether the
MMU is 64-bit by ANDing its model type with POWERPC_MMU_64B. This is
wrong : POWERPC_MMU_64B isn't a mask, it is the generic MMU model for
pre-PowerISA-2.03 64-bit CPUs (ie. PowerPC 970 in QEMU).

Use POWERPC_MMU_64 instead of POWERPC_MMU_64B. This should fix a
potential bug with some 32-bit CPUs for which 'need_access_type'
was mis-computed because (POWERPC_MMU_32B & POWERPC_MMU_64B)
happens to be equal to 1. The end result being a crash in
ppc_hash32_direct_store() because the access type isn't set:

        cpu_abort(cs, "ERROR: instruction should not need "
                 "address translation\n");

This doesn't change anything for 'lazy_tlb_flush' since POWERPC_MMU_32B
is checked first.

Fixes: 5f2a6254522b ("ppc: Don't set access_type on all load/stores on hash64")
Signed-off-by: Stephane Duverger <stephane.duverger@free.fr>
[groug: - extended patch to address another misuse of POWERPC_MMU_64B
        - updated title and changelog accordingly]
Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20201209173536.1437351-2-groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 54cac0e6a7..e68dd65ad3 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7892,7 +7892,7 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->insns_flags = env->insns_flags;
     ctx->insns_flags2 = env->insns_flags2;
     ctx->access_type = -1;
-    ctx->need_access_type = !(env->mmu_model & POWERPC_MMU_64B);
+    ctx->need_access_type = !(env->mmu_model & POWERPC_MMU_64);
     ctx->le_mode = !!(env->hflags & (1 << MSR_LE));
     ctx->default_tcg_memop_mask = ctx->le_mode ? MO_LE : MO_BE;
     ctx->flags = env->flags;
@@ -7902,7 +7902,7 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 #endif
     ctx->lazy_tlb_flush = env->mmu_model == POWERPC_MMU_32B
         || env->mmu_model == POWERPC_MMU_601
-        || (env->mmu_model & POWERPC_MMU_64B);
+        || env->mmu_model & POWERPC_MMU_64;
 
     ctx->fpu_enabled = !!msr_fp;
     if ((env->flags & POWERPC_FLAG_SPE) && msr_spe) {
-- 
2.29.2


