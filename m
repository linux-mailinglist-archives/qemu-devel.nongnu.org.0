Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D216AED94
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:05:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbaY-00064v-Ui; Tue, 07 Mar 2023 12:59:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbaU-00060k-Mn
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:58:58 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbaR-0000Cq-Uf
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:58:58 -0500
Received: by mail-pj1-x1030.google.com with SMTP id y2so14026010pjg.3
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678211933;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pY1TUb+G/BtfexTgidsHKfcaqjVC/yh2llEERSh6exc=;
 b=RNe1sruNb3n38EqdylaAHa6oLIIJkEhLdfp/lf6VbEr4B5olFszg/ZwAopKZLqs2Rr
 6VStQJoLOeIdAwamqd6Kc9bUBEr66UEcvd+Hvpsvyvy56LItXLJgPAmPrIHHoYqB4upW
 LKPVN2Ta9S+2FupZd7la0B7DRnlMEuUJktLZKH65v50px51LrUQurqAAGSkd8Nc12VEv
 cLzsPgmcgtX303KdJm9SvW2ULE4J74tig2jZ2Uh7UY+EVRVpd/IdX78QToGYTfJoo2np
 nhH+lIBT80WKGCPKRDUAnXz8Z0Isgb1kMbQqF+6ZuJ+AMuvukdNLgatGY0mUtypktEB8
 4E0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678211933;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pY1TUb+G/BtfexTgidsHKfcaqjVC/yh2llEERSh6exc=;
 b=bfz6vNOR5MdmpnQS/HOeWo3MNeatOzewccPDEsOf/BzqJinyhdNYgYe0x9zdR8q0hS
 fxpXIxWTN5X16pHJUds5rPjTSOyAVGXgZE8bmU9c8OvlNl1OCbACeupNifegT4bPJkrq
 zon5me5r1M2tTiVxhXuEuny1zPWWV3jndUYouyi14R9LmNOTwF72+izEfrwn5fRlXB7s
 qF1xLSNCHYU5tUzvMmR8qSjgYIGkusd23Ii8d+81Fw7e3EGfFkjCTnj8as2hhRgDcTFS
 tR9Wyhob9Tn0J8v5gWiBZLdD0MSA5az3Ow7BNJ0KwlhWuPzokqR4wqfRkufCEf2/AuoO
 V83g==
X-Gm-Message-State: AO0yUKVel7LXfIR8tFZL1FOIUf2rOlIBJ+2SBmw4UoKdBQML0DexWg0N
 T344p3Gnz+gpL+Y4FP8iEsaAzf6LjgJG+OHPftU=
X-Google-Smtp-Source: AK7set+uZro5DpJnFYm4NB5MLf/Ggd8cz0Eh03ZrvB0baBTpl+qcm8Ux00BVQrc7UlQet68QSjEhLA==
X-Received: by 2002:a17:902:f684:b0:19e:68b0:b06a with SMTP id
 l4-20020a170902f68400b0019e68b0b06amr19575700plg.50.1678211933426; 
 Tue, 07 Mar 2023 09:58:53 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a170902830600b00198e397994bsm8661802plb.136.2023.03.07.09.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:58:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 05/67] target/mips: Drop tcg_temp_free from octeon_translate.c
Date: Tue,  7 Mar 2023 09:57:46 -0800
Message-Id: <20230307175848.2508955-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
 target/mips/tcg/octeon_translate.c | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/target/mips/tcg/octeon_translate.c b/target/mips/tcg/octeon_translate.c
index 6a207d2e7e..103c304d10 100644
--- a/target/mips/tcg/octeon_translate.c
+++ b/target/mips/tcg/octeon_translate.c
@@ -40,8 +40,6 @@ static bool trans_BBIT(DisasContext *ctx, arg_BBIT *a)
     ctx->hflags |= MIPS_HFLAG_BC;
     ctx->btarget = ctx->base.pc_next + 4 + a->offset * 4;
     ctx->hflags |= MIPS_HFLAG_BDS32;
-
-    tcg_temp_free(t0);
     return true;
 }
 
@@ -61,10 +59,6 @@ static bool trans_BADDU(DisasContext *ctx, arg_BADDU *a)
 
     tcg_gen_add_tl(t0, t0, t1);
     tcg_gen_andi_i64(cpu_gpr[a->rd], t0, 0xff);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-
     return true;
 }
 
@@ -83,10 +77,6 @@ static bool trans_DMUL(DisasContext *ctx, arg_DMUL *a)
     gen_load_gpr(t1, a->rt);
 
     tcg_gen_mul_i64(cpu_gpr[a->rd], t0, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-
     return true;
 }
 
@@ -103,8 +93,6 @@ static bool trans_EXTS(DisasContext *ctx, arg_EXTS *a)
     gen_load_gpr(t0, a->rs);
     tcg_gen_sextract_tl(t0, t0, a->p, a->lenm1 + 1);
     gen_store_gpr(t0, a->rt);
-    tcg_temp_free(t0);
-
     return true;
 }
 
@@ -121,8 +109,6 @@ static bool trans_CINS(DisasContext *ctx, arg_CINS *a)
     gen_load_gpr(t0, a->rs);
     tcg_gen_deposit_z_tl(t0, t0, a->p, a->lenm1 + 1);
     gen_store_gpr(t0, a->rt);
-    tcg_temp_free(t0);
-
     return true;
 }
 
@@ -142,8 +128,6 @@ static bool trans_POP(DisasContext *ctx, arg_POP *a)
     }
     tcg_gen_ctpop_tl(t0, t0);
     gen_store_gpr(t0, a->rd);
-    tcg_temp_free(t0);
-
     return true;
 }
 
@@ -167,10 +151,6 @@ static bool trans_SEQNE(DisasContext *ctx, arg_SEQNE *a)
     } else {
         tcg_gen_setcond_tl(TCG_COND_EQ, cpu_gpr[a->rd], t1, t0);
     }
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-
     return true;
 }
 
@@ -194,8 +174,5 @@ static bool trans_SEQNEI(DisasContext *ctx, arg_SEQNEI *a)
     } else {
         tcg_gen_setcondi_tl(TCG_COND_EQ, cpu_gpr[a->rt], t0, imm);
     }
-
-    tcg_temp_free(t0);
-
     return true;
 }
-- 
2.34.1


