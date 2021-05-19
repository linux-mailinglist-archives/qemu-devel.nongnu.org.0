Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 704E6388EED
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 15:21:57 +0200 (CEST)
Received: from localhost ([::1]:56146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljM96-0001Qd-3Q
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 09:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLhT-00024o-KV; Wed, 19 May 2021 08:53:23 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:37051 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLhR-0001QI-PY; Wed, 19 May 2021 08:53:23 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlXnl3B0Nz9t54; Wed, 19 May 2021 22:52:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621428731;
 bh=qwKkUYFI6sXNY2suksdVxhLPy9WNi4td68Fm9XQnLIQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kRrGBPKl7d+yaZOvhwGKDFB12Fu8DhU0MfgEVRauSEc5xw0JDsz6nZHa3Y+PjohBB
 i9v51UUA1oaRbFPnbXbBj41xD6vkjQbMv93JgnWjyUxpSEAGIZJ89K63apJHm6Lr1S
 oC2g0wGZCa9lJEazRIySSZbGeX2Isjd5KciTCDe0=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 33/48] target/ppc: Fix load endianness for lxvwsx/lxvdsx
Date: Wed, 19 May 2021 22:51:33 +1000
Message-Id: <20210519125148.27720-34-david@gibson.dropbear.id.au>
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
Cc: Giuseppe Musacchio <thatlemon@gmail.com>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, "Paul A . Clarke" <pc@us.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Giuseppe Musacchio <thatlemon@gmail.com>

TARGET_WORDS_BIGENDIAN may not match the machine endianness if that's a
runtime-configurable parameter.

Fixes: bcb0b7b1a1c05707304f80ca6f523d557816f85c
Fixes: afae37d98ae991c0792c867dbd9f32f988044318
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/212

Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
Message-Id: <20210518133020.58927-1-thatlemon@gmail.com>
Tested-by: Paul A. Clarke <pc@us.ibm.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate/vsx-impl.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index b817d31260..57a7f73bba 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -139,7 +139,7 @@ static void gen_lxvwsx(DisasContext *ctx)
     gen_addr_reg_index(ctx, EA);
 
     data = tcg_temp_new_i32();
-    tcg_gen_qemu_ld_i32(data, EA, ctx->mem_idx, MO_TEUL);
+    tcg_gen_qemu_ld_i32(data, EA, ctx->mem_idx, DEF_MEMOP(MO_UL));
     tcg_gen_gvec_dup_i32(MO_UL, vsr_full_offset(xT(ctx->opcode)), 16, 16, data);
 
     tcg_temp_free(EA);
@@ -162,7 +162,7 @@ static void gen_lxvdsx(DisasContext *ctx)
     gen_addr_reg_index(ctx, EA);
 
     data = tcg_temp_new_i64();
-    tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, MO_TEQ);
+    tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, DEF_MEMOP(MO_Q));
     tcg_gen_gvec_dup_i64(MO_Q, vsr_full_offset(xT(ctx->opcode)), 16, 16, data);
 
     tcg_temp_free(EA);
-- 
2.31.1


