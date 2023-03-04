Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EB26AABDC
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 19:22:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYWTR-0006P9-VF; Sat, 04 Mar 2023 13:19:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYWTN-0006NU-Sq
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 13:19:11 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYWTL-0003M5-K1
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 13:19:08 -0500
Received: by mail-pg1-x541.google.com with SMTP id bn17so3285631pgb.10
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 10:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677953944;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NMAbXRT3XuWjgVWXzFHUDpgAHu3JgPZi8PcGKw6ji90=;
 b=vlDpSUncoFqQiSouoT/JIjKV3PzWX4zW6935bPJei3yjMKv7+6qimUY/0J7upXLfZX
 Et7C9+KRLZdyWsU2anfqSaraN3Odce15ssIb5mfoUpMTTCVL0gUK1ZSmxNM/5WYkRLN3
 +Xv1uPvCoJWnmhkLn3kf3iwh0w2IAYmBiLm7/aoxZUVO39/5/9HWDyghOM/ajeoWzI8K
 tVSM1IgRuP+AKU8y9QmEB/3Su9Du/IdkWyD5SWcDYMqF7f9izWYLwuXcdi+CcxkDOV9g
 K2Mka5spWYSNhUY3KzJ0LltQZZG0EGq/QwNc+s6PBoq8aP6jmzcnGWtiRp6yd/hKugrT
 jGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677953944;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NMAbXRT3XuWjgVWXzFHUDpgAHu3JgPZi8PcGKw6ji90=;
 b=pi6LUtg7IDULvylQWx/SG1iwOsH+faKfve8o7HISUCh1f9IdrVhmutbbWKSJSbtAPk
 qvei9Y8Ev9JiV4B2O+NIX4rp2JRA1yubLIXjaTKlxHvrn5rybvet7YgD09owBgMTt9tG
 vr19QAJ2FSVAn8kV5oeApqgDj9zU2Q9SvXVvGVc0FwFjj+7LDZooBDR4OV7BpXLKPZw/
 ZAsVlrbyuEH2oDcq5yh4wwC3Z8O/G39vHTuRQXgKUTmVixp7dRLe57+taznMOuVMhEfI
 1lh3uaMTw2h3Y9npVij0UCplUjGUqRhhLXHPbh+FB9Of4M2KTKZF7eEHSLGeNbFlyfKA
 GFcQ==
X-Gm-Message-State: AO0yUKUR+LcZgMbXQyP+d2AMI5u03fB2J16EiXHbpX9Qui6PBX81+Fon
 Nhz2bU/zGtxNMMUwrLzlNdnAxZjQKwpt3B8ijLtdBVCy
X-Google-Smtp-Source: AK7set8IU0tpFXPSVioZVPr+ofzsjDwUM4JiHzhwp/h5fuIus4jOfanN+MkXs9UNoQMgEgOh6mjH4Q==
X-Received: by 2002:a62:1c07:0:b0:5a8:a467:f975 with SMTP id
 c7-20020a621c07000000b005a8a467f975mr5696714pfc.17.1677953944019; 
 Sat, 04 Mar 2023 10:19:04 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:62b1:64d8:8207:f04e])
 by smtp.gmail.com with ESMTPSA id
 25-20020aa79259000000b005d866d184b5sm3529668pfp.46.2023.03.04.10.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 10:19:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PATCH v3 02/20] target/mips: Drop tcg_temp_free from
 micromips_translate.c.inc
Date: Sat,  4 Mar 2023 10:18:42 -0800
Message-Id: <20230304181900.1097116-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230304181900.1097116-1-richard.henderson@linaro.org>
References: <20230304181900.1097116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
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


