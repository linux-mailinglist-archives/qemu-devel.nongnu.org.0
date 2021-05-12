Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D53A437D3C8
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 21:16:57 +0200 (CEST)
Received: from localhost ([::1]:38166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lguLl-0002s4-Q1
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 15:16:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lgu1t-0005d3-9U; Wed, 12 May 2021 14:56:21 -0400
Received: from [201.28.113.2] (port=20812 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lgu1r-0007uU-RD; Wed, 12 May 2021 14:56:21 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 12 May 2021 15:56:00 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 3F9898000C2;
 Wed, 12 May 2021 15:56:00 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 04/31] target/ppc: Remove special case for POWERPC_SYSCALL
Date: Wed, 12 May 2021 15:54:14 -0300
Message-Id: <20210512185441.3619828-5-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 12 May 2021 18:56:00.0593 (UTC)
 FILETIME=[7333DC10:01D74760]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SUBJ_WIPE_DEBT=1.004 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, f4bug@amsat.org, luis.pires@eldorado.org.br,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Since POWERPC_SYSCALL is raised by gen_exception_err,
we will have also set DISAS_NORETURN.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/translate.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 616ffc1508..2303bf259a 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -9416,7 +9416,6 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     /* Check trace mode exceptions */
     if (unlikely(ctx->singlestep_enabled & CPU_SINGLE_STEP &&
                  (ctx->base.pc_next <= 0x100 || ctx->base.pc_next > 0xF00) &&
-                 ctx->exception != POWERPC_SYSCALL &&
                  ctx->exception != POWERPC_EXCP_TRAP &&
                  ctx->exception != POWERPC_EXCP_BRANCH &&
                  ctx->base.is_jmp != DISAS_NORETURN)) {
-- 
2.25.1


