Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D41B06AED71
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:04:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbaY-00064H-8S; Tue, 07 Mar 2023 12:59:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbaV-00060y-0S
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:58:59 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbaR-0000Ai-UW
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:58:58 -0500
Received: by mail-pl1-x631.google.com with SMTP id a9so14975026plh.11
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678211932;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1NRwUghpZO73BVX8UYr3AFNQqLtG8WJKwj6F3WpUYAs=;
 b=Maksmw6HZ2bTkBh/Hps0fJFB8JgjLcQZ5jsbBd+nGgCRe9PS7cVbm00CJYvOpzGVYU
 szVlRKBpbAaupkTqq+tVQOkBvC5C5NVq2njIZseqks30MGOWH/xnXj5yQur94GfmGVTa
 moZgyU81dOEhu26+pV/X6qWjs4EDQvlRH9udGAwEo3MGvV39lBhqzOyZ7PP0BvnEsjab
 YQfjze2Wq+GOTeC7qLh4B5uLvOY7Tj0y4Wdz1bj8B9/JRYUtuuGQRWrhCrZv5mb5gPVj
 QSfWaAWpu5pcy1yUAG/suCaBwRYmPQoYJMHfbb1374DX6PsW02NC4O98nuACX0qSMV1K
 YYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678211932;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1NRwUghpZO73BVX8UYr3AFNQqLtG8WJKwj6F3WpUYAs=;
 b=BFDbxt3rDXdmcutOemwWN5R4zYsLGkcjh5bnTLioWEIsEcwz4BDCzGh8xyyL3bbqhM
 NfJI8feSyyYwnehp+jDyXgQMzwB0b9wxxh7VS14HmvicRZMo8a05BNKfbspMUZL3zmvj
 Cc/aDNvjtS8+TX+zuGJlRfmJedGsvgssbALReDR97/slbd58K6/LAaCEsdQdRpRhjDcD
 f2RkfEohPtFSL96QBSISe9RNYnjA2Q2JyvdLNhxmRCqFkCgCMaYBil9RLXk0MUH0Vqsg
 oid68ldSBAqbhYsDjvbmerqvAmJorgxpqFuNeFwY5ykQ0phFPPLPU/rjZIaIHo0Q9yrE
 aLmA==
X-Gm-Message-State: AO0yUKVPzBlrcsbpE/TFpVy/puOqIChYnAVNS8I6cazaySp7xNtOi/0l
 5M/aDZM3IZKGkjDBKYoHpJ2CrHW+B5Eu3jFdFXU=
X-Google-Smtp-Source: AK7set9tGdcSToSz3gxpRShJzhO6Ha/lr5Op1AdXoxhJ7UiiDCDdND3AGzK9Ph5/OJxbZbe+Mwa9sg==
X-Received: by 2002:a17:902:e54a:b0:19d:1834:92b9 with SMTP id
 n10-20020a170902e54a00b0019d183492b9mr16755976plf.56.1678211931858; 
 Tue, 07 Mar 2023 09:58:51 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a170902830600b00198e397994bsm8661802plb.136.2023.03.07.09.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:58:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 03/67] target/mips: Drop tcg_temp_free from mxu_translate.c
Date: Tue,  7 Mar 2023 09:57:44 -0800
Message-Id: <20230307175848.2508955-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 target/mips/tcg/mxu_translate.c | 51 ---------------------------------
 1 file changed, 51 deletions(-)

diff --git a/target/mips/tcg/mxu_translate.c b/target/mips/tcg/mxu_translate.c
index f52244e1b2..8703b0cef4 100644
--- a/target/mips/tcg/mxu_translate.c
+++ b/target/mips/tcg/mxu_translate.c
@@ -513,8 +513,6 @@ static void gen_mxu_s32i2m(DisasContext *ctx)
     } else if (XRa == 16) {
         gen_store_mxu_cr(t0);
     }
-
-    tcg_temp_free(t0);
 }
 
 /*
@@ -537,8 +535,6 @@ static void gen_mxu_s32m2i(DisasContext *ctx)
     }
 
     gen_store_gpr(t0, Rb);
-
-    tcg_temp_free(t0);
 }
 
 /*
@@ -613,9 +609,6 @@ static void gen_mxu_s8ldd(DisasContext *ctx)
     }
 
     gen_store_mxu_gpr(t0, XRa);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 /*
@@ -664,11 +657,6 @@ static void gen_mxu_d16mul(DisasContext *ctx)
     }
     gen_store_mxu_gpr(t3, XRa);
     gen_store_mxu_gpr(t2, XRd);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
-    tcg_temp_free(t3);
 }
 
 /*
@@ -741,11 +729,6 @@ static void gen_mxu_d16mac(DisasContext *ctx)
     }
     gen_store_mxu_gpr(t3, XRa);
     gen_store_mxu_gpr(t2, XRd);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
-    tcg_temp_free(t3);
 }
 
 /*
@@ -821,15 +804,6 @@ static void gen_mxu_q8mul_q8mulsu(DisasContext *ctx)
 
     gen_store_mxu_gpr(t0, XRd);
     gen_store_mxu_gpr(t1, XRa);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
-    tcg_temp_free(t3);
-    tcg_temp_free(t4);
-    tcg_temp_free(t5);
-    tcg_temp_free(t6);
-    tcg_temp_free(t7);
 }
 
 /*
@@ -860,9 +834,6 @@ static void gen_mxu_s32ldd_s32lddr(DisasContext *ctx)
     tcg_gen_qemu_ld_tl(t1, t1, ctx->mem_idx, MO_TESL ^ (sel * MO_BSWAP));
 
     gen_store_mxu_gpr(t1, XRa);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 
@@ -1125,9 +1096,6 @@ static void gen_mxu_D16MAX_D16MIN(DisasContext *ctx)
         tcg_gen_shri_i32(t0, t0, 16);
         /* finally update the destination */
         tcg_gen_or_i32(mxu_gpr[XRa - 1], mxu_gpr[XRa - 1], t0);
-
-        tcg_temp_free(t1);
-        tcg_temp_free(t0);
     } else if (unlikely(XRb == XRc)) {
         /* both operands same -> just set destination to one of them */
         tcg_gen_mov_i32(mxu_gpr[XRa - 1], mxu_gpr[XRb - 1]);
@@ -1161,9 +1129,6 @@ static void gen_mxu_D16MAX_D16MIN(DisasContext *ctx)
         tcg_gen_shri_i32(t0, t0, 16);
         /* finally update the destination */
         tcg_gen_or_i32(mxu_gpr[XRa - 1], mxu_gpr[XRa - 1], t0);
-
-        tcg_temp_free(t1);
-        tcg_temp_free(t0);
     }
 }
 
@@ -1226,9 +1191,6 @@ static void gen_mxu_Q8MAX_Q8MIN(DisasContext *ctx)
             /* finally update the destination */
             tcg_gen_or_i32(mxu_gpr[XRa - 1], mxu_gpr[XRa - 1], t0);
         }
-
-        tcg_temp_free(t1);
-        tcg_temp_free(t0);
     } else if (unlikely(XRb == XRc)) {
         /* both operands same -> just set destination to one of them */
         tcg_gen_mov_i32(mxu_gpr[XRa - 1], mxu_gpr[XRb - 1]);
@@ -1266,9 +1228,6 @@ static void gen_mxu_Q8MAX_Q8MIN(DisasContext *ctx)
             /* finally update the destination */
             tcg_gen_or_i32(mxu_gpr[XRa - 1], mxu_gpr[XRa - 1], t0);
         }
-
-        tcg_temp_free(t1);
-        tcg_temp_free(t0);
     }
 }
 
@@ -1384,9 +1343,6 @@ static void gen_mxu_S32ALNI(DisasContext *ctx)
                 tcg_gen_shri_i32(t1, t1, 24);
 
                 tcg_gen_or_i32(mxu_gpr[XRa - 1], t0, t1);
-
-                tcg_temp_free(t1);
-                tcg_temp_free(t0);
             }
             break;
         case MXU_OPTN3_PTN2:
@@ -1410,9 +1366,6 @@ static void gen_mxu_S32ALNI(DisasContext *ctx)
                 tcg_gen_shri_i32(t1, t1, 16);
 
                 tcg_gen_or_i32(mxu_gpr[XRa - 1], t0, t1);
-
-                tcg_temp_free(t1);
-                tcg_temp_free(t0);
             }
             break;
         case MXU_OPTN3_PTN3:
@@ -1436,9 +1389,6 @@ static void gen_mxu_S32ALNI(DisasContext *ctx)
                 tcg_gen_shri_i32(t1, t1, 8);
 
                 tcg_gen_or_i32(mxu_gpr[XRa - 1], t0, t1);
-
-                tcg_temp_free(t1);
-                tcg_temp_free(t0);
             }
             break;
         case MXU_OPTN3_PTN4:
@@ -1598,7 +1548,6 @@ bool decode_ase_mxu(DisasContext *ctx, uint32_t insn)
         }
 
         gen_set_label(l_exit);
-        tcg_temp_free(t_mxu_cr);
     }
 
     return true;
-- 
2.34.1


