Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD436A3A5E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 06:28:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWW2e-00028b-Kg; Mon, 27 Feb 2023 00:27:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW2Q-0000Ze-C3
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:27:02 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW2L-0007he-QI
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:27:00 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 me6-20020a17090b17c600b0023816b0c7ceso913952pjb.2
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+mYb7riWV9KcKnyuvmf5HGj/XCuu4SlQJaHS4dBhBKA=;
 b=iBEb0dehBGg22Tu70J3uchC3rNbPpQ01VA4aWW/aGL2c2389JIjYPVdqsb33DC/18N
 1r1hnZQeS1OmW1yfjdwsUJxVdB7/HFfdjk0R80RcgF64ADk2XhiqJKom/fQFDxKvR19S
 U6soW4H98jgS9PiDmcGa9Wb0SrUl9aKljcsYOrtlLi9USthCC7lodbmsSNdyDPJUJp6m
 me1k24K3eqiRc6Hp6av/lGZ5TZDNOWfqAgBp6DnhbRQSSvTvLIqp0lwf8ctvKjZiW4Tu
 0JnFnaOO7ZiW9zA1rNd5MMf+X+j4tVKm3sBxEbgqQZkqwO83EUIjbpZHQ4bW1IlIK0j/
 DGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+mYb7riWV9KcKnyuvmf5HGj/XCuu4SlQJaHS4dBhBKA=;
 b=LIx5IKIY/XMVqmUzDhh8k58lGZy4+K8uMDOhzktfX5glSI0FcrDIyMaAK0/PDClccg
 SkGX5354RPyJCiVaZGMc0etg1uKCGEmnlhFnuzmmjhtUx1N882ujR7mjng03HAZ0/dYP
 1njHk8os5vFvt5aQBroJFaq19bcPtSWoIkXmc88pHFKisaM/KWOL5nc0ZmH5bQvNJuiU
 HNJhN9uTZEwu7Nl97EjyqXLpHL5h/I1TDZSQjAQn4ssOLygTffrDtsHwQfus89ky3QHP
 z+Pr8mfcbQ8e0ic0v2uWwnlZaFrlz5NgrUoFnpxqCFhmOTzaHcWRjvdQkuUvze7ze6rP
 1uRA==
X-Gm-Message-State: AO0yUKW3hPb/HPLByA1yi3q2YSHaGC/t5CT2920YqsfomuVP4BzvWgC+
 gStulcm1gPSi7bw2JHT2TddTfgl77cHsC1I6RBM=
X-Google-Smtp-Source: AK7set/P2pI/4HCsxe0TDA7l6prEI85C6wO6VNbLin6c2/nTj0YDisYE3w4jebFWVT/gWgHHEUDsRg==
X-Received: by 2002:a17:903:2948:b0:19c:dbce:dce4 with SMTP id
 li8-20020a170903294800b0019cdbcedce4mr8280933plb.15.1677475616702; 
 Sun, 26 Feb 2023 21:26:56 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a837be977sm3513341plh.271.2023.02.26.21.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:26:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 39/76] target/mips: Drop tcg_temp_free from msa_translate.c
Date: Sun, 26 Feb 2023 19:24:28 -1000
Message-Id: <20230227052505.352889-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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


