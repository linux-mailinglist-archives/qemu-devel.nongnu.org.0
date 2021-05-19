Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C532388EC4
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 15:16:17 +0200 (CEST)
Received: from localhost ([::1]:37782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljM3c-0004uM-96
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 09:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLgw-00014S-4g; Wed, 19 May 2021 08:52:50 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:53981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLgt-0001Hm-D5; Wed, 19 May 2021 08:52:49 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlXnh0Wt6z9t14; Wed, 19 May 2021 22:52:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621428728;
 bh=lZBgIw0SlgXOfbn5GD7Ll+G4Zu67hb55WBfuEMoa71E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I4ex2exfdJz3uhBdR0wbGN2RTsvRF494MjllljKBiEwBz7BfzZ64JN1CFrXgb4+PV
 kDVun5PgIbCCf6Rbx16p2TfHTCqgLaBmhsibqDtXHNik84RxSatPolHXa5HtcToQet
 jpKAopfL7YSI58/VE/1gBvMie1grH1xHHIqcyN/A=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 23/48] target/ppc: Replace POWERPC_EXCP_SYNC with DISAS_EXIT
Date: Wed, 19 May 2021 22:51:23 +1000
Message-Id: <20210519125148.27720-24-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519125148.27720-1-david@gibson.dropbear.id.au>
References: <20210519125148.27720-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Bruno Larsen <bruno.larsen@eldorado.org.br>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Remove the synthetic "exception" after no more uses.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20210512185441.3619828-9-matheus.ferst@eldorado.org.br>
Reviewed-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu.h       |  1 -
 target/ppc/translate.c | 27 +++++++++------------------
 2 files changed, 9 insertions(+), 19 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index f43ceec5cb..99ee1e09b2 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -135,7 +135,6 @@ enum {
     POWERPC_EXCP_STOP         = 0x200, /* stop translation                   */
     POWERPC_EXCP_BRANCH       = 0x201, /* branch instruction                 */
     /* QEMU exceptions: special cases we want to stop translation            */
-    POWERPC_EXCP_SYNC         = 0x202, /* context synchronizing instruction  */
     POWERPC_EXCP_SYSCALL_USER = 0x203, /* System call in user mode only      */
 };
 
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index c879b47dc6..047d872c6b 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -362,14 +362,6 @@ static inline void gen_stop_exception(DisasContext *ctx)
     ctx->exception = POWERPC_EXCP_STOP;
 }
 
-#ifndef CONFIG_USER_ONLY
-/* No need to update nip here, as execution flow will change */
-static inline void gen_sync_exception(DisasContext *ctx)
-{
-    ctx->exception = POWERPC_EXCP_SYNC;
-}
-#endif
-
 /*****************************************************************************/
 /* SPR READ/WRITE CALLBACKS */
 
@@ -5032,7 +5024,7 @@ static void gen_rfi(DisasContext *ctx)
     }
     gen_update_cfar(ctx, ctx->cia);
     gen_helper_rfi(cpu_env);
-    gen_sync_exception(ctx);
+    ctx->base.is_jmp = DISAS_EXIT;
 #endif
 }
 
@@ -5049,7 +5041,7 @@ static void gen_rfid(DisasContext *ctx)
     }
     gen_update_cfar(ctx, ctx->cia);
     gen_helper_rfid(cpu_env);
-    gen_sync_exception(ctx);
+    ctx->base.is_jmp = DISAS_EXIT;
 #endif
 }
 
@@ -5066,7 +5058,7 @@ static void gen_rfscv(DisasContext *ctx)
     }
     gen_update_cfar(ctx, ctx->cia);
     gen_helper_rfscv(cpu_env);
-    gen_sync_exception(ctx);
+    ctx->base.is_jmp = DISAS_EXIT;
 #endif
 }
 #endif
@@ -5079,7 +5071,7 @@ static void gen_hrfid(DisasContext *ctx)
     /* Restore CPU state */
     CHK_HV;
     gen_helper_hrfid(cpu_env);
-    gen_sync_exception(ctx);
+    ctx->base.is_jmp = DISAS_EXIT;
 #endif
 }
 #endif
@@ -6920,7 +6912,7 @@ static void gen_rfsvc(DisasContext *ctx)
     CHK_SV;
 
     gen_helper_rfsvc(cpu_env);
-    gen_sync_exception(ctx);
+    ctx->base.is_jmp = DISAS_EXIT;
 #endif /* defined(CONFIG_USER_ONLY) */
 }
 
@@ -7300,7 +7292,7 @@ static void gen_rfci_40x(DisasContext *ctx)
     CHK_SV;
     /* Restore CPU state */
     gen_helper_40x_rfci(cpu_env);
-    gen_sync_exception(ctx);
+    ctx->base.is_jmp = DISAS_EXIT;
 #endif /* defined(CONFIG_USER_ONLY) */
 }
 
@@ -7312,7 +7304,7 @@ static void gen_rfci(DisasContext *ctx)
     CHK_SV;
     /* Restore CPU state */
     gen_helper_rfci(cpu_env);
-    gen_sync_exception(ctx);
+    ctx->base.is_jmp = DISAS_EXIT;
 #endif /* defined(CONFIG_USER_ONLY) */
 }
 
@@ -7327,7 +7319,7 @@ static void gen_rfdi(DisasContext *ctx)
     CHK_SV;
     /* Restore CPU state */
     gen_helper_rfdi(cpu_env);
-    gen_sync_exception(ctx);
+    ctx->base.is_jmp = DISAS_EXIT;
 #endif /* defined(CONFIG_USER_ONLY) */
 }
 
@@ -7340,7 +7332,7 @@ static void gen_rfmci(DisasContext *ctx)
     CHK_SV;
     /* Restore CPU state */
     gen_helper_rfmci(cpu_env);
-    gen_sync_exception(ctx);
+    ctx->base.is_jmp = DISAS_EXIT;
 #endif /* defined(CONFIG_USER_ONLY) */
 }
 
@@ -9238,7 +9230,6 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
         case POWERPC_EXCP_BRANCH:
             ctx->base.is_jmp = DISAS_NORETURN;
             break;
-        case POWERPC_EXCP_SYNC:
         case POWERPC_EXCP_STOP:
             ctx->base.is_jmp = DISAS_EXIT;
             break;
-- 
2.31.1


