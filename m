Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C3B3725B1
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 08:11:37 +0200 (CEST)
Received: from localhost ([::1]:48616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldoHO-00028c-JZ
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 02:11:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldnzu-0005Az-Jq; Tue, 04 May 2021 01:53:30 -0400
Received: from ozlabs.org ([203.11.71.1]:43605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldnzr-0004fR-Sg; Tue, 04 May 2021 01:53:29 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ8CK1C7zz9sWM; Tue,  4 May 2021 15:53:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620107597;
 bh=f78B5YbYtAyXCQJDJDaRmnQ7EsORe8dS0KxqvyuLBfg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R3Ifb37U8NK2cclA6WdrEjotocnKgNAKpykhY8qla+Gf47AQfzZZrpjHDTDAuijtK
 kvx2aKZcENs49C8oUJKKNh5Va35UXEpiki2O20ywnDnBULPZEwIkrE5Wc3jpHmO/xA
 navL+yZGTu1zhbOQQFjkUG2nlowxXDaX2mfftOUs=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 05/46] target/ppc: Do not call hreg_compute_mem_idx after
 ppc_store_msr
Date: Tue,  4 May 2021 15:52:31 +1000
Message-Id: <20210504055312.306823-6-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504055312.306823-1-david@gibson.dropbear.id.au>
References: <20210504055312.306823-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

In ppc_store_msr we call hreg_compute_hflags, which itself
calls hreg_compute_mem_idx.  Rely on ppc_store_msr to update
everything required by the msr update.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210315184615.1985590-5-richard.henderson@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/machine.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index 87d7bffb86..f6eeda9642 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -125,9 +125,6 @@ static int cpu_load_old(QEMUFile *f, void *opaque, int version_id)
     env->msr ^= env->msr_mask & ~((1ULL << MSR_TGPR) | MSR_HVB);
     ppc_store_msr(env, msr);
 
-    /* Recompute mmu indices */
-    hreg_compute_mem_idx(env);
-
     return 0;
 }
 
@@ -418,14 +415,12 @@ static int cpu_post_load(void *opaque, int version_id)
 
     /*
      * Invalidate all supported msr bits except MSR_TGPR/MSR_HVB
-     * before restoring
+     * before restoring.  Note that this recomputes hflags and mem_idx.
      */
     msr = env->msr;
     env->msr ^= env->msr_mask & ~((1ULL << MSR_TGPR) | MSR_HVB);
     ppc_store_msr(env, msr);
 
-    hreg_compute_mem_idx(env);
-
     return 0;
 }
 
-- 
2.31.1


