Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DF6435A06
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 06:32:23 +0200 (CEST)
Received: from localhost ([::1]:42890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdPkc-0008Ta-DM
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 00:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZT-0005VZ-Gi; Thu, 21 Oct 2021 00:20:51 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:57317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZR-0008Ke-0y; Thu, 21 Oct 2021 00:20:51 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HZZ5p4Qn7z4xdK; Thu, 21 Oct 2021 15:20:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1634790030;
 bh=H5Wt74EgdkSvi84g7VSNlT7vh3cArdE0/dndD+7soC8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X1tFS0pWfr5RpS0MgqlAd8FCT2LqpdM/TnMnSVxD3SAMTp2RsVQzk93TE9goQmgjf
 7b2AeJ4XT+72lhpRv6jjXHYw5ZtVL5DfTYwAFu414V2G9wdzsBSd2LBR1IBmq2OtOW
 H+B7zxNjVYJZk8C99jbOTElfEuvc7RIMp7wcqU54=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 11/25] linux-user: Fix XER access in ppc version of
 elf_core_copy_regs
Date: Thu, 21 Oct 2021 15:20:13 +1100
Message-Id: <20211021042027.345405-12-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211021042027.345405-1-david@gibson.dropbear.id.au>
References: <20211021042027.345405-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
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
 qemu-devel@nongnu.org, groug@kaod.org,
 Lucas Mateus Castro <lucas.araujo@eldorado.org.br>, qemu-ppc@nongnu.org,
 clg@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

env->xer doesn't hold some bits of XER, like OV and CA. To write the
complete register in the core dump we should read XER value with
cpu_read_xer.

Reported-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Fixes: da91a00f191f ("target-ppc: Split out SO, OV, CA fields from XER")
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20211014223234.127012-4-matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 linux-user/elfload.c | 2 +-
 target/ppc/cpu.c     | 2 +-
 target/ppc/cpu.h     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 2404d482ba..eb32f3e2cb 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -901,7 +901,7 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUPPCState *en
     (*regs)[33] = tswapreg(env->msr);
     (*regs)[35] = tswapreg(env->ctr);
     (*regs)[36] = tswapreg(env->lr);
-    (*regs)[37] = tswapreg(env->xer);
+    (*regs)[37] = tswapreg(cpu_read_xer(env));
 
     for (i = 0; i < ARRAY_SIZE(env->crf); i++) {
         ccr |= env->crf[i] << (32 - ((i + 1) * 4));
diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
index 7ad9bd6044..f933d9f2bd 100644
--- a/target/ppc/cpu.c
+++ b/target/ppc/cpu.c
@@ -27,7 +27,7 @@
 #include "helper_regs.h"
 #include "sysemu/tcg.h"
 
-target_ulong cpu_read_xer(CPUPPCState *env)
+target_ulong cpu_read_xer(const CPUPPCState *env)
 {
     if (is_isa300(env)) {
         return env->xer | (env->so << XER_SO) |
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index baa4e7c34d..c6fc0043a9 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2412,7 +2412,7 @@ enum {
 /*****************************************************************************/
 
 #define is_isa300(ctx) (!!(ctx->insns_flags2 & PPC2_ISA300))
-target_ulong cpu_read_xer(CPUPPCState *env);
+target_ulong cpu_read_xer(const CPUPPCState *env);
 void cpu_write_xer(CPUPPCState *env, target_ulong xer);
 
 /*
-- 
2.31.1


