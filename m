Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9D96B2E36
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:10:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMWe-000467-65; Thu, 09 Mar 2023 15:06:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWV-0003m6-U6
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:01 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWU-0000hB-92
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:05:59 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so2986513pja.5
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392357;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pY1TUb+G/BtfexTgidsHKfcaqjVC/yh2llEERSh6exc=;
 b=lTASy6VJmiQwigIhxMyWreFUrQj0+TD+1jeIplIKWzluoeVkIwh1uaMibuK0/NhBpi
 ePHWY5AyUjTN5CWeytEDeOZ2IoAatO2dhc0LYx4MYp6E/+ykXQRQB+6fUvcj/tFApYHW
 ru4pdAQx6JHiGVp5DVHBVcfpMlajzz0/bwnLKDdTuyeaT/HR+TBKFXW4AAEP3P1wlni5
 btujFXxFRDuZN9W4nZQ+2MY8FKFOz8XIQC4MSkiW//BNqVE4JfO15TDaKWiBrGvBxRKu
 VRfaJBEsb1wf+N6p+Uze9dt77FpVMAFGaN2njHF7Xo4G9NyDidoaEBk5rQkTMrLxAvdP
 f29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392357;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pY1TUb+G/BtfexTgidsHKfcaqjVC/yh2llEERSh6exc=;
 b=wcsBzra8eELDcA99aEP0Lv4XossOYdx+JQ/F2ZM172phTnu9A2QVSuX9yffo33byNj
 bGQXMFFZXfBT6pldIpLt3NLlsTanSQ/g3ecy8cUcyiV/VIDr2u54v08M/LLYML2oJkYV
 0hnuMgWWDWAtZDyPBEOukycmBgf89zB3HoXPY7AeiGXMxlH916tkH1EwjFJiVmlHHugT
 Wb9Dzc+AzG0IR+hz7QpHafmn2S6dphjP/CLN3U49H7wsmY2JH33RIi7+Z3TbfB4LeQNY
 /uw/NAz87tDl4YxIXLI3V9VhfybTKIpPfN6KIqLnmZmfr+XXktTnKEWqXxg3S/JKCgi4
 KPpQ==
X-Gm-Message-State: AO0yUKXsiZj7l0TlxAwCw+76QvTNAHV9i51KFlUI9+ui4sPaDKRgKFFq
 hXOCNEg4di10MRnBwfvD0H8wroctRqgA+EvNN7g=
X-Google-Smtp-Source: AK7set8ARorpFmUhvfR77btfwN+my6/bGgax5EJ2FChWWvhs49XX9yex5liFtBGZrugN+jXJuZDo3g==
X-Received: by 2002:a17:90b:38c6:b0:233:f990:d646 with SMTP id
 nn6-20020a17090b38c600b00233f990d646mr23405500pjb.35.1678392356921; 
 Thu, 09 Mar 2023 12:05:56 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a17090ad15400b002340f58e19bsm308083pjw.45.2023.03.09.12.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:05:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 05/91] target/mips: Drop tcg_temp_free from
 octeon_translate.c
Date: Thu,  9 Mar 2023 12:04:24 -0800
Message-Id: <20230309200550.3878088-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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


