Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8306B2E2D
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:09:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMWX-0003mZ-V0; Thu, 09 Mar 2023 15:06:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWU-0003lX-1s
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:05:59 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWR-0000gT-VL
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:05:57 -0500
Received: by mail-pj1-x102f.google.com with SMTP id nn12so3131511pjb.5
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392354;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qIOLxV5UuG1peSvKZRbUdqNaPhsBQ4C8h/h+ls7Lut4=;
 b=hDcfoY9cn/XlhcJeoJSWsnJ6AFY9Y7yIwDwFc0JrRFAaLCmSbEJrM6ZN2a70PsmMRH
 IPPgD7q04Nr2m2VR94KIJUZcPSA5YBQBi4EZylIo4JhTSP0eP26P2dpYzKQ2gfW0CuZg
 VtylF5GYj0NsFhhM7gsYZP1equelp2VOZjUrwYYiplr3CHWKyDk776JPNEpOBWeWuCvE
 Dy/Ih53AiS1sMFUUSKukrU1eCOgCYGB2lN/OxFmI6qlvf7V9kU/H3Np6MYO0Eobd5B5x
 6hu5EpSqCw+o81BB3hhOIIqadTFaP3e/S+1O9W9DVNSoaO+LOJsenut6Q08rXl0AJOsI
 f9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392354;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qIOLxV5UuG1peSvKZRbUdqNaPhsBQ4C8h/h+ls7Lut4=;
 b=FA7jWSWlni7N2KTEOoQ8oSRsLldi7BuCO8OPdMl3KyF0avGvdNdx8eb/ovOyO1fzKm
 8/63FuJUKxTxZcefmpy/uB7++jDMBzDFq1i08hX2jN7ACjzhQ5vxCHQK6GTkFtuHQIGh
 ADNtCmk+n7ieg07qm5DlfY4X8u3U1u5jxKWed5WE3SwL97N97xYYUATPtRSD1UB4bOgo
 B1f9fgc3Shoistb+X+7biG4uMptaIaJdNHtL/Wg+M0J/19PWYnvst9Uynr75/PAwDpU8
 OPS2My20eqiqp5zviHend5B43kR9TFto+ZP0kTo6LWfi2ImNCNwHQ4riNIs1lOZ8n0/L
 3U7w==
X-Gm-Message-State: AO0yUKXxTOySwVaGC2g9Lvk6x3NsXjkKYNvrYw6/VNiLpDnMpsk86IKg
 PX8gGAYWyrRtOdq1yV9g+DkhfchwxON3CW4AJbc=
X-Google-Smtp-Source: AK7set/PzzCYhY5VeEhVvZCZ/uJ50J25WgzrSLePICul88AAUmdcxaWARslp9GuxqOetqsFuHPISgQ==
X-Received: by 2002:a17:90b:1804:b0:233:af77:c075 with SMTP id
 lw4-20020a17090b180400b00233af77c075mr23890339pjb.36.1678392354528; 
 Thu, 09 Mar 2023 12:05:54 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a17090ad15400b002340f58e19bsm308083pjw.45.2023.03.09.12.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:05:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 02/91] target/mips: Drop tcg_temp_free from msa_translate.c
Date: Thu,  9 Mar 2023 12:04:21 -0800
Message-Id: <20230309200550.3878088-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
 target/mips/tcg/msa_translate.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 1bcdbb1121..220cd3b048 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -217,8 +217,6 @@ static void gen_check_zero_element(TCGv tresult, uint8_t df, uint8_t wt,
     /* if some bit is non-zero then some element is zero */
     tcg_gen_setcondi_i64(cond, t0, t0, 0);
     tcg_gen_trunc_i64_tl(tresult, t0);
-    tcg_temp_free_i64(t0);
-    tcg_temp_free_i64(t1);
 }
 
 static bool gen_msa_BxZ_V(DisasContext *ctx, int wt, int sa, TCGCond cond)
@@ -237,7 +235,6 @@ static bool gen_msa_BxZ_V(DisasContext *ctx, int wt, int sa, TCGCond cond)
     tcg_gen_or_i64(t0, msa_wr_d[wt << 1], msa_wr_d[(wt << 1) + 1]);
     tcg_gen_setcondi_i64(cond, t0, t0, 0);
     tcg_gen_trunc_i64_tl(bcond, t0);
-    tcg_temp_free_i64(t0);
 
     ctx->btarget = ctx->base.pc_next + (sa << 2) + 4;
 
@@ -545,8 +542,6 @@ static bool trans_CTCMSA(DisasContext *ctx, arg_msa_elm *a)
     gen_load_gpr(telm, a->ws);
     gen_helper_msa_ctcmsa(cpu_env, telm, tcg_constant_i32(a->wd));
 
-    tcg_temp_free(telm);
-
     return true;
 }
 
@@ -563,8 +558,6 @@ static bool trans_CFCMSA(DisasContext *ctx, arg_msa_elm *a)
     gen_helper_msa_cfcmsa(telm, cpu_env, tcg_constant_i32(a->ws));
     gen_store_gpr(telm, a->wd);
 
-    tcg_temp_free(telm);
-
     return true;
 }
 
@@ -782,8 +775,6 @@ static bool trans_msa_ldst(DisasContext *ctx, arg_msa_i *a,
     gen_base_offset_addr(ctx, taddr, a->ws, a->sa << a->df);
     gen_msa_ldst(cpu_env, tcg_constant_i32(a->wd), taddr);
 
-    tcg_temp_free(taddr);
-
     return true;
 }
 
-- 
2.34.1


