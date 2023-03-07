Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C21A36AED14
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:01:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbaV-00060u-HN; Tue, 07 Mar 2023 12:58:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbaT-0005zP-EH
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:58:57 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbaO-0000Ab-Fd
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:58:57 -0500
Received: by mail-pl1-x633.google.com with SMTP id n6so15013497plf.5
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678211931;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qIOLxV5UuG1peSvKZRbUdqNaPhsBQ4C8h/h+ls7Lut4=;
 b=vWc6UqlRW+OiCnhEdw+eMbFEck2NTf+Z2NLHYP6iZKN95l0wND6/zfqnRVFQEGG/7G
 YLbHlYCw09MQ/W13doI1nEVMURe9QXF+Qg6vlR7W0Mdd3K0aDAL1DZP4SdtMbj3dg9w1
 FHwgq7vmzVsh+Qo1i6llt5pb9SsCDW8iejSCCdg7qTnSo8szbl+cK3TFGGeGiWsTmEMP
 ImBpROLAw1yRJpALvcdnZpNtl+AhZYUWvj2K2rZ+IFbJbluCCyUleZxbbOVnA8RLPpSe
 +ntWF1OKxiPnPJUHqLgRkm+d29y6x6/qvT0Ojak7GSgmR0jJgV0JV8ixHJTN5F/qikED
 ItAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678211931;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qIOLxV5UuG1peSvKZRbUdqNaPhsBQ4C8h/h+ls7Lut4=;
 b=BCXQSklauwv9r2SpTWY5K1K0Zgdl5evAJUl7fHb/MHZ3Jlta7HzHYuoUykfVlb2J/9
 gzfq7Fmfm2rI1fgIxRE03Nu4ESLF2xOujgBa5rwsNCMDfm9bn4HEfGgv/eixmOQFLXUA
 wTWYHpd1QgWMGDfNApk/MwRXs7pomEBwoZ8fLLzafsvvt6Ji+ihU+f7I6ItcRpRG8+He
 4FeA2FvLccsc/YThTnCLtbJxiavLaplU8GVc++eYbH8wqtSfIuMCB0c+mlZkLzbxz5DJ
 SIqdsmrRMx2ec2OAhVuLI8nr2XmyfbUB9hELJTpWvyNFZDijX8W0h655ZzdaEV4beKA3
 ty4g==
X-Gm-Message-State: AO0yUKV58eKCbvHAJkEri1WXs7f8ZuWf9StxYVzV8crjOQFTVx+BIUmr
 d/8SZVzXaz2j8lnj4r4/bCi1+lakPCwMAbhHlHc=
X-Google-Smtp-Source: AK7set8Id7F3iUC/F4/D98XbF7Zvqji+DOwKKYhUxoGumDSXFpNWa2rI/cxx7s7NzTgkNNzkfp+eDg==
X-Received: by 2002:a17:902:f54b:b0:19c:f16c:5cb4 with SMTP id
 h11-20020a170902f54b00b0019cf16c5cb4mr20537784plf.1.1678211931011; 
 Tue, 07 Mar 2023 09:58:51 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a170902830600b00198e397994bsm8661802plb.136.2023.03.07.09.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:58:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 02/67] target/mips: Drop tcg_temp_free from msa_translate.c
Date: Tue,  7 Mar 2023 09:57:43 -0800
Message-Id: <20230307175848.2508955-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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


