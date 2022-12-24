Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F666655BE9
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 01:10:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9EOs-0002Pz-DZ; Sat, 24 Dec 2022 18:58:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOb-0002MV-PV
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:41 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOa-0006Jk-3K
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:41 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 v13-20020a17090a6b0d00b00219c3be9830so7980936pjj.4
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 15:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YysLimCJ4D81VkYcj5AOVk4+aaIq43s9xyiLUf2Ez/I=;
 b=oklMrQiKiZtqTDMHBbEkbkjCZyzFNQluP2d/XAULyKELdebxNL4RoCaFxAz2gJ6y7M
 I5EnSD0FBN6zXZjYrLzScKTm1mDIj3bu66ar1Hquu+TaYziXtel4ULuGI5dlPNuqhlw9
 6bPoXFhEN3WJHUJG0iAUUHUZPcLfSPrxCNDVLhF+X32e94cbnV8zxNnRoUD/OsLVmFF5
 n0VTDzAG1oITnR1kPBiYXw0uSMm6P9dwYvK8GANggtx7tYsxrwywh9Pap3Gg/itRuxr3
 Y0sGI94oPXCXGAWeuXNOFWHKlsfLiUbvsVbOGiuFDKSGMvxOin2/PVhRrDcqHVkNxRdc
 Oe+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YysLimCJ4D81VkYcj5AOVk4+aaIq43s9xyiLUf2Ez/I=;
 b=Xe9/hvZSQVjn+8tRb3HUR6PB5ZaP1kf9bDige/r69uv5ifvzrWRswnkJt3zlia/fl4
 S1rP2CxK2uWSHHfxn2JeY4F+av+3yu5GLHeAomhFr36p28l9VC5Tl7KD+nS1U/1OxLQA
 Q8Qpj+fysYowsY0LtPFunNHYeUib5gHlUSiCUUg8KRZxtgk90Bw29dP0RzuAShPi3G6e
 q5NLpn3pevdbyb/bbIv68+4h+Xu77MUpR5otGJCuv+5SJePGYmlRuIVzyJlCF0k9J1zU
 IukpceftWSwkWNXKH43SYyNIuCQdC45h2KtMF8qJrjYQJBAei8ucYs7AAJVgnx85Cbwa
 YZLg==
X-Gm-Message-State: AFqh2krgw3NhGhWCcw5Wn2URzWrVl2OgaQG+zbL0ELFL9ffsIxBzDQAS
 W2bwtaJYmm+GG7L9LZK3DQFCmqD76EMk2YzG
X-Google-Smtp-Source: AMrXdXtMUoloCSrm0SaNrWeCOdq3/LSGp4qrCWcrklLBsCKkEEu0d6IMr4up83rQVNa5Ga06WvNIKA==
X-Received: by 2002:a17:902:ba93:b0:191:2c85:189f with SMTP id
 k19-20020a170902ba9300b001912c85189fmr14399202pls.69.1671926258805; 
 Sat, 24 Dec 2022 15:57:38 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 cp12-20020a170902e78c00b00187022627d7sm4599716plb.36.2022.12.24.15.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 15:57:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH v5 17/43] tcg: Remove check_regs
Date: Sat, 24 Dec 2022 15:56:54 -0800
Message-Id: <20221224235720.842093-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224235720.842093-1-richard.henderson@linaro.org>
References: <20221224235720.842093-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

We now check the consistency of reg_to_temp[] with each update,
so the utility of checking consistency at the end of each
opcode is minimal.  In addition, the form of this check is
quite expensive, consuming 10% of a checking-enabled build.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 76 -------------------------------------------------------
 1 file changed, 76 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index a1ae761a58..c330d114bc 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2900,79 +2900,6 @@ static bool liveness_pass_2(TCGContext *s)
     return changes;
 }
 
-#ifdef CONFIG_DEBUG_TCG
-static void dump_regs(TCGContext *s)
-{
-    TCGTemp *ts;
-    int i;
-    char buf[64];
-
-    for(i = 0; i < s->nb_temps; i++) {
-        ts = &s->temps[i];
-        printf("  %10s: ", tcg_get_arg_str_ptr(s, buf, sizeof(buf), ts));
-        switch(ts->val_type) {
-        case TEMP_VAL_REG:
-            printf("%s", tcg_target_reg_names[ts->reg]);
-            break;
-        case TEMP_VAL_MEM:
-            printf("%d(%s)", (int)ts->mem_offset,
-                   tcg_target_reg_names[ts->mem_base->reg]);
-            break;
-        case TEMP_VAL_CONST:
-            printf("$0x%" PRIx64, ts->val);
-            break;
-        case TEMP_VAL_DEAD:
-            printf("D");
-            break;
-        default:
-            printf("???");
-            break;
-        }
-        printf("\n");
-    }
-
-    for(i = 0; i < TCG_TARGET_NB_REGS; i++) {
-        if (s->reg_to_temp[i] != NULL) {
-            printf("%s: %s\n",
-                   tcg_target_reg_names[i],
-                   tcg_get_arg_str_ptr(s, buf, sizeof(buf), s->reg_to_temp[i]));
-        }
-    }
-}
-
-static void check_regs(TCGContext *s)
-{
-    int reg;
-    int k;
-    TCGTemp *ts;
-    char buf[64];
-
-    for (reg = 0; reg < TCG_TARGET_NB_REGS; reg++) {
-        ts = s->reg_to_temp[reg];
-        if (ts != NULL) {
-            if (ts->val_type != TEMP_VAL_REG || ts->reg != reg) {
-                printf("Inconsistency for register %s:\n",
-                       tcg_target_reg_names[reg]);
-                goto fail;
-            }
-        }
-    }
-    for (k = 0; k < s->nb_temps; k++) {
-        ts = &s->temps[k];
-        if (ts->val_type == TEMP_VAL_REG
-            && ts->kind != TEMP_FIXED
-            && s->reg_to_temp[ts->reg] != ts) {
-            printf("Inconsistency for temp %s:\n",
-                   tcg_get_arg_str_ptr(s, buf, sizeof(buf), ts));
-        fail:
-            printf("reg state:\n");
-            dump_regs(s);
-            tcg_abort();
-        }
-    }
-}
-#endif
-
 static void temp_allocate_frame(TCGContext *s, TCGTemp *ts)
 {
     intptr_t off, size, align;
@@ -4297,9 +4224,6 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start)
             tcg_reg_alloc_op(s, op);
             break;
         }
-#ifdef CONFIG_DEBUG_TCG
-        check_regs(s);
-#endif
         /* Test for (pending) buffer overflow.  The assumption is that any
            one operation beginning below the high water mark cannot overrun
            the buffer completely.  Thus we can test for overflow after
-- 
2.34.1


