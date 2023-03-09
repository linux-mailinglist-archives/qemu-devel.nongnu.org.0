Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 842716B2E1E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:07:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMWZ-0003n6-Me; Thu, 09 Mar 2023 15:06:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWS-0003l8-Md
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:05:56 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWR-0000gK-30
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:05:56 -0500
Received: by mail-pj1-x102d.google.com with SMTP id y2so3141208pjg.3
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392353;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O3i+Mexp4O2SP7HT510R19KtQ+j1lC3CLmFPBL5XCWk=;
 b=D1rEPHoKjjIB/lLvsyxbg156zGwzJCLSs6kPHKlQoZeLpGojVUoufguBhdlYjSAF5P
 rVTTnZ4W1Qlfb/aaix1yitqXLQEvcj99yICiSZ+H+E/okCmqGEevBiSO7+r2nYVSotCe
 52imKO8ZpDAB1bvES8wkKtQqfkqqjWUYNPsqI+epDJLWLNBxmvD6r+O+JW3GmiWpNf+J
 uP59MgTU44yAeJ2IbUAzDeIKbUHFPJyW99/U9W442XcvCCOoMzX6Z2Zkveihqz1hwDYV
 r5RL2wAm8OtgsC2Xm68ak2slJu57t4XSemgdhx07CNIomxWtGy2D03GNJHyho1TbXflm
 GsZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392353;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O3i+Mexp4O2SP7HT510R19KtQ+j1lC3CLmFPBL5XCWk=;
 b=Hfus/ifpY6ehp5J6pYCCwgvFEFx92dQFqf2OpFZenUi7LfbhfK9LEzERVl2hTmFHoA
 IW0vUNLktBU4gvylqXMy8dfr+MsqOdT44DNqTP9ZsxsxPvKq/B3PvTcq/FtY+r/uU8cr
 yf368p1mS8nACGRxaYZwnRenbOir1R+KU/GrwGjCOjG+7oRNkroGxGIftm7/M7D6GAf+
 7gr8oQmWdBCDUGQ9Nlo4bDwFmMv1NsOuXaDYltXGfz5EaqkbX8n1mP7xDF+91Jr8nfTg
 q8ZKfN+GecNv/iXdmyPylQTxYi2BmY+QahuT5mBut7+s3wysmtU3SuS4Ndl3T2hMx+mK
 Wqig==
X-Gm-Message-State: AO0yUKXeLWs5iLi0+lSEcYBvL88mD+WV5y9isRh8SdX7HO7Xzv1VRb6h
 dKihSaaoKAeumTROzK5cS4ICBCsAV6xmXtmX1cs=
X-Google-Smtp-Source: AK7set9msBICVwKIwYVgFKYnfTYf3BvVxRpszx8asH+M478tHDqyIzInQAEnExEHBzjN+WalfyEQ2A==
X-Received: by 2002:a17:90b:380d:b0:234:bf0:86b9 with SMTP id
 mq13-20020a17090b380d00b002340bf086b9mr23786178pjb.25.1678392353374; 
 Thu, 09 Mar 2023 12:05:53 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a17090ad15400b002340f58e19bsm308083pjw.45.2023.03.09.12.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:05:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 01/91] target/mips: Drop tcg_temp_free from
 micromips_translate.c.inc
Date: Thu,  9 Mar 2023 12:04:20 -0800
Message-Id: <20230309200550.3878088-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Translators are no longer required to free tcg temporaries.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/micromips_translate.c.inc | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/target/mips/tcg/micromips_translate.c.inc b/target/mips/tcg/micromips_translate.c.inc
index 632895cc9e..23f80d4315 100644
--- a/target/mips/tcg/micromips_translate.c.inc
+++ b/target/mips/tcg/micromips_translate.c.inc
@@ -724,9 +724,6 @@ static void gen_ldst_multiple(DisasContext *ctx, uint32_t opc, int reglist,
         break;
 #endif
     }
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free_i32(t2);
 }
 
 
@@ -1018,8 +1015,6 @@ static void gen_ldst_pair(DisasContext *ctx, uint32_t opc, int rd,
         break;
 #endif
     }
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 static void gen_pool32axf(CPUMIPSState *env, DisasContext *ctx, int rt, int rs)
@@ -1067,7 +1062,6 @@ static void gen_pool32axf(CPUMIPSState *env, DisasContext *ctx, int rt, int rs)
 
             gen_load_gpr(t0, rt);
             gen_mtc0(ctx, t0, rs, (ctx->opcode >> 11) & 0x7);
-            tcg_temp_free(t0);
         }
         break;
 #endif
@@ -1276,7 +1270,6 @@ static void gen_pool32axf(CPUMIPSState *env, DisasContext *ctx, int rt, int rs)
                  * mode.
                  */
                 ctx->base.is_jmp = DISAS_STOP;
-                tcg_temp_free(t0);
             }
             break;
         case EI:
@@ -1293,7 +1286,6 @@ static void gen_pool32axf(CPUMIPSState *env, DisasContext *ctx, int rt, int rs)
                  */
                 gen_save_pc(ctx->base.pc_next + 4);
                 ctx->base.is_jmp = DISAS_EXIT;
-                tcg_temp_free(t0);
             }
             break;
         default:
-- 
2.34.1


