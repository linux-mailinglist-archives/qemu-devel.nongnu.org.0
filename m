Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A1836F36F
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 03:18:39 +0200 (CEST)
Received: from localhost ([::1]:38724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcHni-0005c8-5m
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 21:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHlH-0002wY-Ie
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:07 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:45747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHl3-0007Xq-Vu
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:07 -0400
Received: by mail-pl1-x631.google.com with SMTP id p17so9834096plf.12
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 18:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hkrMHzJK4SVIKgtdf6kvvk43VF91B4o41R73Fwa1Qt8=;
 b=X59sB5PMrEzb1bus/gQ7jkZTMKicuHOscoMOFHIC5VkLkIFSPb7zF0y9ONdmh7sKa4
 RF2e9Kx4V0l47lJZfsm6UJVNMorVYNA6/IrZ/1JfV1rWE1gyyiLQGow2rUrsKkTNVva8
 0BS4ohQ6tqXigWSMEgxl0TzrKRXbNeoKEwQeXJB0hu9O3e4p8dzlOIOoVjCIs5LzeFPl
 XPWrNk1ywu1/KD4oSupENF4kQaBFhkYjvqbrKeoMpJlp/9RR+eN/TlfaprWBm1MSzjFy
 TuY4OJ1bM3Mp3+/27L8JAtyH5JbmIHEYYWpmfiFqH5Ty35rRqUJ9f+lkDNPLYlE+lhtf
 9C8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hkrMHzJK4SVIKgtdf6kvvk43VF91B4o41R73Fwa1Qt8=;
 b=gZxLYCWFpvXLAQZgxsl7GAGGb3ANtZjPqaeX/8BAgbjIrH5TsorXw8EjL6xfEV+CvT
 GegbGwNuXGj4zoI8BvXx/6aBiEBKBZ4aWb7yiXyTELawqJ+Mam+kRPCu9zTNE2OXAIC3
 cxQM1cbf77WDtiaJczau9cOdOd5l+vDbRng8aPT/fwwnEd8PDm+aiyFrP3mJwnJ0W6Ry
 sbmbLCj/L4I57YwzKNDj65HInoTIdO5u2FhGeqOOk+P2gxN3iMgefRo34K0YJdBe+b+J
 YxD75JgSsp1AiETI2jlHbItaoRMQjkn7BRkb9rI9kAKbfFlbtaEawafYrTQH3CrrZMBk
 uQTA==
X-Gm-Message-State: AOAM533N2K28RCpMLHi16LQZjo5PvHV9XL9KSqZg4VTfC4X2ONhRYK6+
 0/MXblx/Oea55QaBUHiuvKe56zxoos3IVg==
X-Google-Smtp-Source: ABdhPJz1ZJZfXd8tfRvBstcs8PLdaiXApH5SKRTl1mi+zf0e8yLvp2uc/ZpIntPHfXZQM43WBzLEiw==
X-Received: by 2002:a17:902:e802:b029:ec:f326:8e1c with SMTP id
 u2-20020a170902e802b02900ecf3268e1cmr2491570plg.73.1619745352619; 
 Thu, 29 Apr 2021 18:15:52 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 1sm161277pjx.46.2021.04.29.18.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 18:15:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/30] target/ppc: Replace POWERPC_EXCP_SYNC with DISAS_EXIT
Date: Thu, 29 Apr 2021 18:15:25 -0700
Message-Id: <20210430011543.1017113-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430011543.1017113-1-richard.henderson@linaro.org>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: f4bug@amsat.org, luis.pires@eldorado.org.br, qemu-ppc@nongnu.org,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove the synthetic "exception" after no more uses.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu.h       |  1 -
 target/ppc/translate.c | 27 +++++++++------------------
 2 files changed, 9 insertions(+), 19 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index e73416da68..cf10117065 100644
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
index 7dbdf3d047..d22d6e5b85 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -360,14 +360,6 @@ static inline void gen_stop_exception(DisasContext *ctx)
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
 #define GEN_HANDLER(name, opc1, opc2, opc3, inval, type)                      \
 GEN_OPCODE(name, opc1, opc2, opc3, inval, type, PPC_NONE)
 
@@ -4008,7 +4000,7 @@ static void gen_rfi(DisasContext *ctx)
     }
     gen_update_cfar(ctx, ctx->cia);
     gen_helper_rfi(cpu_env);
-    gen_sync_exception(ctx);
+    ctx->base.is_jmp = DISAS_EXIT;
 #endif
 }
 
@@ -4025,7 +4017,7 @@ static void gen_rfid(DisasContext *ctx)
     }
     gen_update_cfar(ctx, ctx->cia);
     gen_helper_rfid(cpu_env);
-    gen_sync_exception(ctx);
+    ctx->base.is_jmp = DISAS_EXIT;
 #endif
 }
 
@@ -4042,7 +4034,7 @@ static void gen_rfscv(DisasContext *ctx)
     }
     gen_update_cfar(ctx, ctx->cia);
     gen_helper_rfscv(cpu_env);
-    gen_sync_exception(ctx);
+    ctx->base.is_jmp = DISAS_EXIT;
 #endif
 }
 #endif
@@ -4055,7 +4047,7 @@ static void gen_hrfid(DisasContext *ctx)
     /* Restore CPU state */
     CHK_HV;
     gen_helper_hrfid(cpu_env);
-    gen_sync_exception(ctx);
+    ctx->base.is_jmp = DISAS_EXIT;
 #endif
 }
 #endif
@@ -5941,7 +5933,7 @@ static void gen_rfsvc(DisasContext *ctx)
     CHK_SV;
 
     gen_helper_rfsvc(cpu_env);
-    gen_sync_exception(ctx);
+    ctx->base.is_jmp = DISAS_EXIT;
 #endif /* defined(CONFIG_USER_ONLY) */
 }
 
@@ -6321,7 +6313,7 @@ static void gen_rfci_40x(DisasContext *ctx)
     CHK_SV;
     /* Restore CPU state */
     gen_helper_40x_rfci(cpu_env);
-    gen_sync_exception(ctx);
+    ctx->base.is_jmp = DISAS_EXIT;
 #endif /* defined(CONFIG_USER_ONLY) */
 }
 
@@ -6333,7 +6325,7 @@ static void gen_rfci(DisasContext *ctx)
     CHK_SV;
     /* Restore CPU state */
     gen_helper_rfci(cpu_env);
-    gen_sync_exception(ctx);
+    ctx->base.is_jmp = DISAS_EXIT;
 #endif /* defined(CONFIG_USER_ONLY) */
 }
 
@@ -6348,7 +6340,7 @@ static void gen_rfdi(DisasContext *ctx)
     CHK_SV;
     /* Restore CPU state */
     gen_helper_rfdi(cpu_env);
-    gen_sync_exception(ctx);
+    ctx->base.is_jmp = DISAS_EXIT;
 #endif /* defined(CONFIG_USER_ONLY) */
 }
 
@@ -6361,7 +6353,7 @@ static void gen_rfmci(DisasContext *ctx)
     CHK_SV;
     /* Restore CPU state */
     gen_helper_rfmci(cpu_env);
-    gen_sync_exception(ctx);
+    ctx->base.is_jmp = DISAS_EXIT;
 #endif /* defined(CONFIG_USER_ONLY) */
 }
 
@@ -8092,7 +8084,6 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
         case POWERPC_EXCP_BRANCH:
             ctx->base.is_jmp = DISAS_NORETURN;
             break;
-        case POWERPC_EXCP_SYNC:
         case POWERPC_EXCP_STOP:
             ctx->base.is_jmp = DISAS_EXIT;
             break;
-- 
2.25.1


