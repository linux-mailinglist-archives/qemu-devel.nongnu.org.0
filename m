Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 819116A3AEB
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 06:52:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWW6H-0004Iw-Rb; Mon, 27 Feb 2023 00:31:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW5X-00037A-Qq
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:30:17 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW5W-0000N0-4p
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:30:15 -0500
Received: by mail-pl1-x630.google.com with SMTP id i10so5518416plr.9
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RUHY2yKH2nPTR6QE7c2gu4MGXp/9B0MeleLyAh2d26U=;
 b=oHVcueKiZMddjDB6fdk2r6swLMT9dSXuFthEBzBtUYbDqoqmBWeAAYmffyV0rENqhB
 C2vUtGHjR45c7rODKjVENrYWReQq3/MuOrxlE262a8md7FnG4Nzl8R+mEHl02AuJN85P
 y9wCj8/Th/4sE3GN7gjNaO6h3kubz0FVWzwHdjQhl8FfOvDVja0ZJge7v/1G5uRYEs63
 dJa3eHesukTsBr3GtNcwMQv0UY/vQ+xr21byICAdhsjDTYZZbUlBIBzwMzeJceDoZG7y
 OxAEiJWTK2zkUMMYor/zstFBDFnT2/lKB6okteSOIthZzqBOyUYTwTC4cKzl+zf4IFuS
 zhwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RUHY2yKH2nPTR6QE7c2gu4MGXp/9B0MeleLyAh2d26U=;
 b=gQRRsVA9ZZo9402S+VMcOgtLbnDfh0EXbAznOIanmB9+BqbJejS8eE5IyW/ACE18fQ
 rSvS5DRoXqHXxs8UBrfHVuF+XCdapqQdeGJBazyUZ6MALa8sQLTX/zB77kVIFXlDh0gg
 LO8Lp8opMPkshKuGpsLZNkUacLQbEcLFCovTQYZHEWcT9zm5B6GT7T76n4ahEMoIW2kM
 s7A5qdyzgEW7Gqe/wvK/DCeEH4GsleEpJOeQgiOf5VSrhyOkJSyrfsM2pnbKciyrduzD
 IA9VsNIyW1lraBwpMFm3TsjujK1wjOrW8snaGKuiQO4vfjJfiZILHVIgNWvbmfUh9b+k
 7DIA==
X-Gm-Message-State: AO0yUKXWk50ay9ASsZwZWpnOglwGN6hyVqXoizX06K6qdXeLVxCuqJOw
 trEeP+unTOVshrLeE2BuZNMILZh6gIhghnuVPCA=
X-Google-Smtp-Source: AK7set95dVZcASTB5ux/w+uI2tS77eQvhHenxle241fX6nDiXof1g8v2j+8KNp+mQNTlqB2bTAXr0w==
X-Received: by 2002:a17:90b:390f:b0:231:24c1:8028 with SMTP id
 ob15-20020a17090b390f00b0023124c18028mr27646334pjb.29.1677475812671; 
 Sun, 26 Feb 2023 21:30:12 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a520400b002369e16b276sm5172926pjh.32.2023.02.26.21.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:30:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 44/76] target/mips: Drop tcg_temp_free from tx79_translate.c
Date: Sun, 26 Feb 2023 19:24:33 -1000
Message-Id: <20230227052505.352889-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


