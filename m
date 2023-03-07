Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB196AED2F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:02:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbaU-000602-L3; Tue, 07 Mar 2023 12:58:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbaS-0005yG-L1
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:58:56 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbaN-0000AP-JS
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:58:52 -0500
Received: by mail-pl1-x634.google.com with SMTP id y11so15038030plg.1
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678211930;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O3i+Mexp4O2SP7HT510R19KtQ+j1lC3CLmFPBL5XCWk=;
 b=xYLd84HL5mPPZF76/iwhuHGRYlVDgNabTb7FV2Oi6BZUX/AwDsG28JLs96YtXI5gGl
 WPAOKE+rF7IWOS2MZkfVwOenClSEy/DYwUfvv3wZ3l7dacFeN2X38UYinIuMX1i2Pl6U
 Af7A4gWXz/HOfLf1jcUzOw7W41eFJBYShU9yGRfAsnTHOjTIm3iydVU0R/qZQfCeHJ0w
 rDr1lItnUgZPIRUOcNaNmLvtLlqYL61a1r1eeAtTfILyXISVe8GCKE9m5vlqnAkn1bZW
 uzDRL6lIB8LtgRfDprti5AHQcf2Ll11VlKZ2p0YLwku5lvbYUS5pZz7Q2Ohwj2ca22F2
 7zBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678211930;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O3i+Mexp4O2SP7HT510R19KtQ+j1lC3CLmFPBL5XCWk=;
 b=4cpRTnh99vToiEdX1JRXK2FE2MRqL+LlfgKTV8+H+ysv1yLeetUn9Xgyxd8HFX/2am
 KNJQyDkycWp7+dWYl/dmHBc5GxrkwD8mc0KUO9PGRPM7i0vVQCDBe3BjD5gmn79fIyNC
 wTeRTpZ6QuYf5N7Oczhxzg28kxbWLQPGHSl1kHVJq4U2om8hK8QIh5IAXZSipvoCE8VD
 hl5uDEGchanUX2m7sBlr8FEr9bX87TxSHXBlkAjbVV+KW8od9bnD95Jp2SGXxb1WvVOi
 p1EyaWU2XbmXdVKa/fhQF0wk0F3YGPi45OxX/viMVxLfAK2pOsPO6h7KygkxIsgXs2GY
 t7cA==
X-Gm-Message-State: AO0yUKVCnBGuUsFN5PsrDpRExKkQ41Dfgt4f/Xeh306Ak6K6arcp4EQM
 s2nODoOuemJRpd0t62ToT0s6jrXrG0XxVKGl1Sk=
X-Google-Smtp-Source: AK7set+eaooj1Vw7/esOIQeAlGRf8DdeW2xqoBDeA3lxUUiUkczJ9ZKf+6+JeQEqDH5/Pvo0mSpNWg==
X-Received: by 2002:a17:902:e542:b0:19c:faaf:b9c8 with SMTP id
 n2-20020a170902e54200b0019cfaafb9c8mr18545228plf.39.1678211930102; 
 Tue, 07 Mar 2023 09:58:50 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a170902830600b00198e397994bsm8661802plb.136.2023.03.07.09.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:58:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 01/67] target/mips: Drop tcg_temp_free from
 micromips_translate.c.inc
Date: Tue,  7 Mar 2023 09:57:42 -0800
Message-Id: <20230307175848.2508955-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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


