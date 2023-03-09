Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FF66B2E2B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:09:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMWa-0003qa-On; Thu, 09 Mar 2023 15:06:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWX-0003mh-Is
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:01 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWV-0000hZ-UY
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:01 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 ce8-20020a17090aff0800b0023a61cff2c6so6659679pjb.0
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392358;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Axp9uynrvpeAYKsp59LS4V2qfdQNlIwcXSTLepZ7I4I=;
 b=j1pYvH6yxbu6FFbvNScJlpRQCI6m55RjncKebM5yE2Oi07XKJPUDLIQdZ/0PPbbjPW
 IkgTPhAxg4edNjcKbLW13VpGKeIdEcuSp5UGFKGsJG2zFXu0MfyBEkYuVP/xqz8lyBPB
 b7gR/cTysQnfVvHY/bTo8Mcoah9h+zAELZiuhmRhzmvK8htMlDQCWhN4O/x5KvRJKNz8
 TGOQ0peYxVMkPgNGUHZkJQ02XbjRs17PYoyi3vZu1kfyd1T1hX8nUMeXzR2q53b+e7K3
 cVxPFrSMIgBwvPpSReBd3Mh92QublgbGSDjWAS42XE9/9/RY2X5Mf1ztfEtWCp92afnA
 HCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392358;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Axp9uynrvpeAYKsp59LS4V2qfdQNlIwcXSTLepZ7I4I=;
 b=q9EXABtnaH7WITW7+ym/XV0JpY4SpwYQrK75n4tJyd2fjYNlaJu9ZW6o+Qzn/VfGh5
 5kTMkg8xMzzFrlotAesg1qHSD8sMBYr/xdcGzbKALw0tu0PpGDLDK5u9Cd3RyzBHYoPB
 PL/8W94/nr/P/44aR7ZQ8xXsAYqUTzoarA5YNIjX1DDauVyYi3rN8WcicZgY+6SZjxeB
 GnxXQWEjicS9pTCY2fXEBLGKHHjPiNVvLRS9MPoOSD7d7x61cJ0odBvoXze/cf/J4zys
 dcahx9Fsx8J9DRwgJYeUsijzkR0JPfYy//qkp3qbvUET41nAezN58cYrXOt2uU5RwBC6
 imKQ==
X-Gm-Message-State: AO0yUKVip7soS6OVYEVfoz9S4NFM0MORq8Z7FIkI+xdpuNXcfOcn9NJc
 pMJ0A4RPYB5zL9k5KgjgN+VstKPjtaywZYrkasY=
X-Google-Smtp-Source: AK7set9wdnGaBfcSUKOiZU8whodw6VbzRIYuICsHdiTqgz6WXFtuCMSd64QWTl4NXoXdUmmJdNjo1g==
X-Received: by 2002:a17:90a:f2cc:b0:237:98eb:c98b with SMTP id
 gt12-20020a17090af2cc00b0023798ebc98bmr23392776pjb.25.1678392358494; 
 Thu, 09 Mar 2023 12:05:58 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a17090ad15400b002340f58e19bsm308083pjw.45.2023.03.09.12.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:05:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 07/91] target/mips: Drop tcg_temp_free from tx79_translate.c
Date: Thu,  9 Mar 2023 12:04:26 -0800
Message-Id: <20230309200550.3878088-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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


