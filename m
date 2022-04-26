Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1BE510488
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 18:51:19 +0200 (CEST)
Received: from localhost ([::1]:52818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njOPF-0007qR-Fv
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 12:51:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5n-00031b-3H
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:14 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:42587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5i-0003rN-TY
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:08 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 l11-20020a17090a49cb00b001d923a9ca99so3009705pjm.1
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V1l7h7RzBXJQhj58kOo+BDunsheVJJvh/PuzYMuyeHU=;
 b=Qq+STMc5JCUKJIv5a2aYxYofetwrwWpI7t37aKvAbF6yXYE0wafF4bICdF40To3yga
 OXJbZ9isPOCPPZ8HQqdfCmlQXYALd9SuibbZKE0l4E+Dq8/KWjyWl5QADpG93vXMwDhn
 XqV0t+dOL6keizDBbMUbGdzFJgvP3jIJcGECbaAk4icU05JrXi3V+PA5/eZ+WilHOm68
 KRc4U2gwTFFRIcKcbnh0qJ/11YjpSa1COep6kPQlJO+TtWFGL9CpzWV21z2utohW3iJH
 MKlwmBr79El7lbUgpxA27IKye6jIcEPn1RJatpfekNtzyoTU0UiqYScYWBKib/d8PHEM
 qbVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V1l7h7RzBXJQhj58kOo+BDunsheVJJvh/PuzYMuyeHU=;
 b=iQYOmt9nbHcMkOQS3bmNebs/5ncGkeYkGCdoSlUzf/LN5qAdLEBp3fPwLvflZmicAS
 12tCgaOG2p2mH9qRAkA4FnSNAUYDiVZTUogjK0FgVAlRKVXewTM/uT1X4gIi6BQhGJh+
 Skg/+0oaUpjsJLAAOEBzm2m0RRn5aCeZQZGDqYDEga5NIwYOS4hkWh6JWbTYG8LV26S1
 LppH66UPYRvIQJ37p4qcTNWibfgVaSZx+7CEY0vVZrys6aurmjU+/IvuSsZojqtRQ9uf
 dJsjUq/D5Yj96q3TNV0Ml0xRuBYAlSzrG3yTEZVAYK1qkCXHMY6DnOvQ+Uh8CsR2emZm
 cYow==
X-Gm-Message-State: AOAM531yzdMd+E+K9ia95g5QzU0Jnv27dAklVpazgfYwRgQ6V4QVN9U9
 gy0RdPWCCHFjRfMGkiUerB8qh95OJZ1cfA==
X-Google-Smtp-Source: ABdhPJyaUN6LOFL0xTNEJWR3Dni2EEVnqD2Ki3ISJu7kFiZIhR5reRNC/dUdoJ+Wol5SAlzCeNzDRQ==
X-Received: by 2002:a17:902:8497:b0:154:9282:bc01 with SMTP id
 c23-20020a170902849700b001549282bc01mr24670200plo.33.1650990665419; 
 Tue, 26 Apr 2022 09:31:05 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:31:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/47] target/arm: Use tcg_constant in balance of
 translate-a64.c
Date: Tue, 26 Apr 2022 09:30:17 -0700
Message-Id: <20220426163043.100432-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Finish conversion of the file to tcg_constant_*.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 35dc21da8f..1163ba12a4 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -13893,7 +13893,7 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
         }
 
         if (is_scalar) {
-            tcg_res[1] = tcg_const_i64(0);
+            tcg_res[1] = tcg_constant_i64(0);
         }
 
         for (pass = 0; pass < 2; pass++) {
@@ -14297,7 +14297,7 @@ static void disas_crypto_four_reg(DisasContext *s, uint32_t insn)
         tcg_op2 = tcg_temp_new_i32();
         tcg_op3 = tcg_temp_new_i32();
         tcg_res = tcg_temp_new_i32();
-        tcg_zero = tcg_const_i32(0);
+        tcg_zero = tcg_constant_i32(0);
 
         read_vec_element_i32(s, tcg_op1, rn, 3, MO_32);
         read_vec_element_i32(s, tcg_op2, rm, 3, MO_32);
@@ -14317,7 +14317,6 @@ static void disas_crypto_four_reg(DisasContext *s, uint32_t insn)
         tcg_temp_free_i32(tcg_op2);
         tcg_temp_free_i32(tcg_op3);
         tcg_temp_free_i32(tcg_res);
-        tcg_temp_free_i32(tcg_zero);
     }
 }
 
@@ -14825,22 +14824,19 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             gen_helper_yield(cpu_env);
             break;
         case DISAS_WFI:
-        {
-            /* This is a special case because we don't want to just halt the CPU
-             * if trying to debug across a WFI.
+            /*
+             * This is a special case because we don't want to just halt
+             * the CPU if trying to debug across a WFI.
              */
-            TCGv_i32 tmp = tcg_const_i32(4);
-
             gen_a64_set_pc_im(dc->base.pc_next);
-            gen_helper_wfi(cpu_env, tmp);
-            tcg_temp_free_i32(tmp);
-            /* The helper doesn't necessarily throw an exception, but we
+            gen_helper_wfi(cpu_env, tcg_constant_i32(4));
+            /*
+             * The helper doesn't necessarily throw an exception, but we
              * must go back to the main loop to check for interrupts anyway.
              */
             tcg_gen_exit_tb(NULL, 0);
             break;
         }
-        }
     }
 }
 
-- 
2.34.1


