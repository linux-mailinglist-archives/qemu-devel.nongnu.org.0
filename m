Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9BC6AEDAB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:06:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbaY-00064Q-Dq; Tue, 07 Mar 2023 12:59:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbaU-00060o-Tp
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:58:58 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbaS-0000D8-Ru
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:58:58 -0500
Received: by mail-pl1-x62a.google.com with SMTP id a9so14975224plh.11
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678211935;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Axp9uynrvpeAYKsp59LS4V2qfdQNlIwcXSTLepZ7I4I=;
 b=MerWf5rXEdFuLlECUOBoopyw2WDoFOJzz76VE7psvzaGggeWnRLQiIk0Gv3lQftaC+
 BY5mhNXNc2X0Xrdk+bxvippn8UIOBcrkEJSpIviz2epyBanUghSrtaVLxE/ywrHFbC/F
 a2LqFdtlA4EopdkKIODx5kslAmVl1p7FH1tC34ECZUyk16LKiGVKuEplUHNJVwANpt3Q
 4etRWsX4agFk1UB2PsCun5BwJexQGrd0hylgaKq8BFBuzECLycWFhVKjKaS/c6NeYu5u
 /4J7+/s7Kfe4uw+HfdzwOyWHCHKK+gKm3rX5HFx2+ReZzN5Hh4yv6ZE06IV7ScjzVAE4
 oGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678211935;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Axp9uynrvpeAYKsp59LS4V2qfdQNlIwcXSTLepZ7I4I=;
 b=Zb2zcsq01U21DJGcPP7UxDvD09JuvyMIK/m92LoCpDfPct9fsG/2ErGQs14kRbr2Pj
 5SMXCSw/OXKHKya2tfYR4ON4hPxt2GWwSLRh6j3jCNMYZpgDXOBoXRJ0L4NjnwGkeXwB
 zc/PrthroHCPhxGLHb+shORlvHMWueNAuj3r1aWjpqNNvldSuRMgCfhXGmgBIS8E1guz
 tUTeuPtQZIe2FTgFd+tijTesnbRZ1t05xkUv/PfrU29RVkZUWtaMRzYVjlBpsBFSEE6g
 cmdyt6vWWgUSzYh7Mf1C3ZxTEWuV/s8dTMWqlYRj3Sy2IWQM+cAwZRR74Q0ZIhSGHDfX
 2Eyw==
X-Gm-Message-State: AO0yUKVFhCF6c162iw0w2wsVtSmi3fUacO8b1TtJBLQzyqbWEV33lC5D
 N1r3PoNQ9b5GT35JJ8i8N842aR1EG4O/RRVOjCM=
X-Google-Smtp-Source: AK7set8tWN59LpFqOlt6QxHFkhaZI7bbwXAzANjCC3rYj9SL+hMHsn2Yay9wHEuGgG+n84WD4Dnapw==
X-Received: by 2002:a17:902:bc4c:b0:19e:6224:c1cc with SMTP id
 t12-20020a170902bc4c00b0019e6224c1ccmr15310036plz.63.1678211935195; 
 Tue, 07 Mar 2023 09:58:55 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a170902830600b00198e397994bsm8661802plb.136.2023.03.07.09.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:58:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 07/67] target/mips: Drop tcg_temp_free from tx79_translate.c
Date: Tue,  7 Mar 2023 09:57:48 -0800
Message-Id: <20230307175848.2508955-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
 target/mips/tcg/tx79_translate.c | 41 --------------------------------
 1 file changed, 41 deletions(-)

diff --git a/target/mips/tcg/tx79_translate.c b/target/mips/tcg/tx79_translate.c
index 4e479c2d10..d46bc73972 100644
--- a/target/mips/tcg/tx79_translate.c
+++ b/target/mips/tcg/tx79_translate.c
@@ -138,10 +138,6 @@ static bool trans_parallel_arith(DisasContext *ctx, arg_r *a,
     gen_load_gpr_hi(ax, a->rs);
     gen_load_gpr_hi(bx, a->rt);
     gen_logic_i64(cpu_gpr_hi[a->rd], ax, bx);
-
-    tcg_temp_free(bx);
-    tcg_temp_free(ax);
-
     return true;
 }
 
@@ -273,15 +269,6 @@ static bool trans_parallel_compare(DisasContext *ctx, arg_r *a,
         tcg_gen_movcond_i64(cond, t2, t1, t0, c1, c0);
         tcg_gen_deposit_i64(cpu_gpr_hi[a->rd], cpu_gpr_hi[a->rd], t2, wlen * i, wlen);
     }
-
-    tcg_temp_free(t2);
-    tcg_temp_free(t1);
-    tcg_temp_free(t0);
-    tcg_temp_free(bx);
-    tcg_temp_free(ax);
-    tcg_temp_free(c1);
-    tcg_temp_free(c0);
-
     return true;
 }
 
@@ -362,10 +349,6 @@ static bool trans_LQ(DisasContext *ctx, arg_i *a)
     tcg_gen_addi_i64(addr, addr, 8);
     tcg_gen_qemu_ld_i64(t0, addr, ctx->mem_idx, MO_TEUQ);
     gen_store_gpr_hi(t0, a->rt);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(addr);
-
     return true;
 }
 
@@ -389,10 +372,6 @@ static bool trans_SQ(DisasContext *ctx, arg_i *a)
     tcg_gen_addi_i64(addr, addr, 8);
     gen_load_gpr_hi(t0, a->rt);
     tcg_gen_qemu_st_i64(t0, addr, ctx->mem_idx, MO_TEUQ);
-
-    tcg_temp_free(addr);
-    tcg_temp_free(t0);
-
     return true;
 }
 
@@ -458,11 +437,6 @@ static bool trans_PPACW(DisasContext *ctx, arg_r *a)
 
     gen_load_gpr_hi(t0, a->rs); /* a1 */
     tcg_gen_deposit_i64(cpu_gpr_hi[a->rd], a0, t0, 32, 32);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(b0);
-    tcg_temp_free(a0);
-
     return true;
 }
 
@@ -506,10 +480,6 @@ static bool trans_PEXTLx(DisasContext *ctx, arg_r *a, unsigned wlen)
         tcg_gen_shri_i64(bx, bx, wlen);
         tcg_gen_shri_i64(ax, ax, wlen);
     }
-
-    tcg_temp_free(bx);
-    tcg_temp_free(ax);
-
     return true;
 }
 
@@ -541,10 +511,6 @@ static bool trans_PEXTLW(DisasContext *ctx, arg_r *a)
     gen_load_gpr(ax, a->rs);
     gen_load_gpr(bx, a->rt);
     gen_pextw(cpu_gpr[a->rd], cpu_gpr_hi[a->rd], ax, bx);
-
-    tcg_temp_free(bx);
-    tcg_temp_free(ax);
-
     return true;
 }
 
@@ -564,10 +530,6 @@ static bool trans_PEXTUW(DisasContext *ctx, arg_r *a)
     gen_load_gpr_hi(ax, a->rs);
     gen_load_gpr_hi(bx, a->rt);
     gen_pextw(cpu_gpr[a->rd], cpu_gpr_hi[a->rd], ax, bx);
-
-    tcg_temp_free(bx);
-    tcg_temp_free(ax);
-
     return true;
 }
 
@@ -678,8 +640,5 @@ static bool trans_PROT3W(DisasContext *ctx, arg_r *a)
 
     tcg_gen_deposit_i64(cpu_gpr[a->rd], cpu_gpr[a->rt], ax, 0, 32);
     tcg_gen_rotri_i64(cpu_gpr[a->rd], cpu_gpr[a->rd], 32);
-
-    tcg_temp_free(ax);
-
     return true;
 }
-- 
2.34.1


