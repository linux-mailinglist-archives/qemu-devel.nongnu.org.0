Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D51435A17
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 06:47:31 +0200 (CEST)
Received: from localhost ([::1]:32824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdPzH-00048y-1d
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 00:47:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZU-0005Vp-0V; Thu, 21 Oct 2021 00:20:52 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:46087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZQ-0008Kc-Vp; Thu, 21 Oct 2021 00:20:51 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HZZ5p4JlCz4xdJ; Thu, 21 Oct 2021 15:20:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1634790030;
 bh=kooPAKvQTL7fXizs+uuV9S0mY1ZC0Zi1/jhDB97fBHg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=orzFeUrwyXlz86CJXbmOKEGMjRdPf8l+0AiiQxu/FEqOoCTfBNDG0kvOH7Z2pTtJQ
 LwKeGlwyd/dhLzrY9yU5CB5rNuflhMezeaZlecbnsv3Ib5E7ToVWOEydyF3C0JWkq7
 S+K3RtICiMguP04v8pCFe1zSUPWYV0qhtZavoPfs=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 10/25] target/ppc: Fix XER access in gdbstub
Date: Thu, 21 Oct 2021 15:20:12 +1100
Message-Id: <20211021042027.345405-11-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211021042027.345405-1-david@gibson.dropbear.id.au>
References: <20211021042027.345405-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
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
Cc: danielhb413@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

The value of XER is split in multiple fields of CPUPPCState, like
env->xer and env->so. To get/set the whole register from gdb, we should
use cpu_read_xer/cpu_write_xer.

Fixes: da91a00f191f ("target-ppc: Split out SO, OV, CA fields from XER")
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20211014223234.127012-3-matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/gdbstub.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index 1808a150e4..105c2f7dd1 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -159,7 +159,7 @@ int ppc_cpu_gdb_read_register(CPUState *cs, GByteArray *buf, int n)
             gdb_get_regl(buf, env->ctr);
             break;
         case 69:
-            gdb_get_reg32(buf, env->xer);
+            gdb_get_reg32(buf, cpu_read_xer(env));
             break;
         case 70:
             gdb_get_reg32(buf, env->fpscr);
@@ -217,7 +217,7 @@ int ppc_cpu_gdb_read_register_apple(CPUState *cs, GByteArray *buf, int n)
             gdb_get_reg64(buf, env->ctr);
             break;
         case 69 + 32:
-            gdb_get_reg32(buf, env->xer);
+            gdb_get_reg32(buf, cpu_read_xer(env));
             break;
         case 70 + 32:
             gdb_get_reg64(buf, env->fpscr);
@@ -269,7 +269,7 @@ int ppc_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
             env->ctr = ldtul_p(mem_buf);
             break;
         case 69:
-            env->xer = ldl_p(mem_buf);
+            cpu_write_xer(env, ldl_p(mem_buf));
             break;
         case 70:
             /* fpscr */
@@ -319,7 +319,7 @@ int ppc_cpu_gdb_write_register_apple(CPUState *cs, uint8_t *mem_buf, int n)
             env->ctr = ldq_p(mem_buf);
             break;
         case 69 + 32:
-            env->xer = ldl_p(mem_buf);
+            cpu_write_xer(env, ldl_p(mem_buf));
             break;
         case 70 + 32:
             /* fpscr */
-- 
2.31.1


