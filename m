Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5E842E44C
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 00:38:46 +0200 (CEST)
Received: from localhost ([::1]:36748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb9N8-0005iu-0S
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 18:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mb9JM-00029T-HD; Thu, 14 Oct 2021 18:34:52 -0400
Received: from [201.28.113.2] (port=23608 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mb9JL-0005Cp-2s; Thu, 14 Oct 2021 18:34:52 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 14 Oct 2021 19:34:37 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 68CEA8014D6;
 Thu, 14 Oct 2021 19:34:37 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 3/4] linux-user: Fix XER access in ppc version of
 elf_core_copy_regs
Date: Thu, 14 Oct 2021 19:32:33 -0300
Message-Id: <20211014223234.127012-4-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211014223234.127012-1-matheus.ferst@eldorado.org.br>
References: <20211014223234.127012-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 14 Oct 2021 22:34:37.0907 (UTC)
 FILETIME=[ABC26230:01D7C14B]
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
Cc: richard.henderson@linaro.org, laurent@vivier.eu, groug@kaod.org,
 Lucas Mateus Castro <lucas.araujo@eldorado.org.br>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

env->xer doesn't hold some bits of XER, like OV and CA. To write the
complete register in the core dump we should read XER value with
cpu_read_xer.

Reported-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Fixes: da91a00f191f ("target-ppc: Split out SO, OV, CA fields from XER")
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 linux-user/elfload.c | 2 +-
 target/ppc/cpu.c     | 2 +-
 target/ppc/cpu.h     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 01e9a833fb..e760786a98 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -896,7 +896,7 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUPPCState *en
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
index 500205229c..67a143941f 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2418,7 +2418,7 @@ enum {
 /*****************************************************************************/
 
 #define is_isa300(ctx) (!!(ctx->insns_flags2 & PPC2_ISA300))
-target_ulong cpu_read_xer(CPUPPCState *env);
+target_ulong cpu_read_xer(const CPUPPCState *env);
 void cpu_write_xer(CPUPPCState *env, target_ulong xer);
 
 /*
-- 
2.25.1


