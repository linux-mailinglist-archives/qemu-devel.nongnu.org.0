Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 346F93725A1
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 07:56:55 +0200 (CEST)
Received: from localhost ([::1]:51080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldo3C-0007YU-9t
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 01:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldnzq-00057z-Jw; Tue, 04 May 2021 01:53:26 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:49311 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldnzn-0004a3-Jh; Tue, 04 May 2021 01:53:26 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ8CK0MzZz9sWB; Tue,  4 May 2021 15:53:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620107597;
 bh=vah07RKjf90sFxm6WFtEddSHyy3538FGdU5PnH34764=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gWvivPjDv4vcoNWkNG9bunqtf75/jkyu56D4FZ95GKQol7cKzrVjZVwfpz301Uhda
 GEs4QPmvEq49yfBbPB3uFlhKdAcmKINiKA+wJJenm+dvkLJICSZdiTkGCA6DgwzMos
 NtHEsbM6Svoy5E4OqGWbqkuJioBCc8w5LLVfvntE=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 04/46] target/ppc: Properly sync cpu state with new msr in
 cpu_load_old
Date: Tue,  4 May 2021 15:52:30 +1000
Message-Id: <20210504055312.306823-5-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504055312.306823-1-david@gibson.dropbear.id.au>
References: <20210504055312.306823-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Match cpu_post_load in using ppc_store_msr to set all of
the cpu state implied by the value of msr.  Do not restore
hflags or hflags_nmsr, as we recompute them in ppc_store_msr.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210315184615.1985590-4-richard.henderson@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/machine.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index 283db1d28a..87d7bffb86 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -21,6 +21,7 @@ static int cpu_load_old(QEMUFile *f, void *opaque, int version_id)
     int32_t slb_nr;
 #endif
     target_ulong xer;
+    target_ulong msr;
 
     for (i = 0; i < 32; i++) {
         qemu_get_betls(f, &env->gpr[i]);
@@ -111,11 +112,19 @@ static int cpu_load_old(QEMUFile *f, void *opaque, int version_id)
     qemu_get_betls(f, &env->ivpr_mask);
     qemu_get_betls(f, &env->hreset_vector);
     qemu_get_betls(f, &env->nip);
-    qemu_get_betls(f, &env->hflags);
-    qemu_get_betls(f, &env->hflags_nmsr);
+    qemu_get_sbetl(f); /* Discard unused hflags */
+    qemu_get_sbetl(f); /* Discard unused hflags_nmsr */
     qemu_get_sbe32(f); /* Discard unused mmu_idx */
     qemu_get_sbe32(f); /* Discard unused power_mode */
 
+    /*
+     * Invalidate all supported msr bits except MSR_TGPR/MSR_HVB
+     * before restoring.  Note that this recomputes hflags and mem_idx.
+     */
+    msr = env->msr;
+    env->msr ^= env->msr_mask & ~((1ULL << MSR_TGPR) | MSR_HVB);
+    ppc_store_msr(env, msr);
+
     /* Recompute mmu indices */
     hreg_compute_mem_idx(env);
 
-- 
2.31.1


