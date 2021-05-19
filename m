Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD068388EBD
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 15:14:16 +0200 (CEST)
Received: from localhost ([::1]:60544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljM1f-0001Jj-PT
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 09:14:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLhL-0001ZM-VY; Wed, 19 May 2021 08:53:15 -0400
Received: from ozlabs.org ([203.11.71.1]:48587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLhJ-0001Md-B8; Wed, 19 May 2021 08:53:15 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlXnl0kzQz9t2p; Wed, 19 May 2021 22:52:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621428731;
 bh=divziH9AFXDw7ex4etOicidfNW5m4/0DV5hb25t7Qus=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gDO8iDTb0BQggLrNMQFboFEMBR6KxxP3VaQH9mBJOZrl2al1HINGj6DHTSESdFux/
 MldjbpDK8fgolUKYnVVUrfmg5V204/9bPkADUAtjoCBdhhpsiksZ0o1M895fhI2mVu
 iAfpo+5METdOvVWs2IuXC7s3/Hhp0YrEKebqdCQU=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 32/48] target/ppc: Use translator_loop_temp_check
Date: Wed, 19 May 2021 22:51:32 +1000
Message-Id: <20210519125148.27720-33-david@gibson.dropbear.id.au>
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Bruno Larsen <bruno.larsen@eldorado.org.br>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The special logging is unnecessary.  It will have been done
immediately before in the log file.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Message-Id: <20210517205025.3777947-9-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index e68152810e..ea200f9637 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -9091,11 +9091,7 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     handler->count++;
 #endif
 
-    if (tcg_check_temp_count()) {
-        qemu_log("Opcode %02x %02x %02x %02x (%08x) leaked "
-                 "temporaries\n", opc1(ctx->opcode), opc2(ctx->opcode),
-                 opc3(ctx->opcode), opc4(ctx->opcode), ctx->opcode);
-    }
+    translator_loop_temp_check(&ctx->base);
 }
 
 static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
-- 
2.31.1


