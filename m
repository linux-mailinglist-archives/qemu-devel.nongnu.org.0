Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D2F6A3ABC
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 06:44:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWW83-0003Wq-6P; Mon, 27 Feb 2023 00:32:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6B-0003vf-Bu
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:30:55 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW67-0000R8-QP
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:30:53 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 y15-20020a17090aa40f00b00237ad8ee3a0so5050753pjp.2
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wgLKFnmS08d59nAAlckVp6By00CbIN6BRDR8pm/wMZM=;
 b=Rc5wkiC60elXeII7D5+yhFRTzXxrw6UvleBK0owGn73pxuYYMemetzMAGfbubA6wDJ
 iIll/MfsbyezrQcA54YqlxaLkuKsiSynujEzTvOe+55gjyjf8VzLm3T8GfQ+1DK0ilnC
 DFWgvds0meDwoNfqQ4ZBI98VdXQOT1w7YPRFrS4xVHMsOP66fMCopPJfKoOfZ5jln3ca
 Ma2snNgCc5U8Wc4yopRaM0MSKX6WqINTm87esxvrP1MOQrvjV3prTlOnxzNdXFS3IT52
 NTOjYFIYGbp6ttCPU3xUNxseZqbdVIXArRo4j4gvj2BUaWBeNZdpJjeUFa6Gf30hOwF3
 fvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wgLKFnmS08d59nAAlckVp6By00CbIN6BRDR8pm/wMZM=;
 b=3XGUHbk+rEdkvTOofRtJmCaj8QpH/oiwD8zZxhtChbR2NLL1HRYxTm+Fovt1Hax9ib
 jlCmBo9cwtLxINrCyHpK9If037O701PZMWRTVsbfWnQrfudJXgikOtwoB+OQ4GTH/bQM
 QdZhjvq/2qpxU4Tu5aQz9mW4ta5OPg6TedJK77KydAHQ2qeuePsS9Q8pQgHbd63lYaFt
 4XO4U4hrSw0F7XfOMRARuuhmvvdUQF9PyDqYAjeHTJN4tiH9mYop9OUSk2CBZlcRCOJz
 zBEaHE85Py9QR5f5z7fERSM/rOtEWQQYcmini71+HsSwpoErDXOsQE1kYQKmKKAzm2a5
 S75A==
X-Gm-Message-State: AO0yUKWQn0vWYReUOmbg5SwQwSUYwIE7FoPzLWyv36RtedX0I1plCYUI
 eWynMs1wqqdEr9Fh7tuXcy9eTQceY5Y63EgCD44=
X-Google-Smtp-Source: AK7set/VtMNpFNbvYaFOktA04bJgXsxQeyoEm5N9gxgh1uo6JhaBcz6Bbwd5BtsJK/4wHh1+J+huNA==
X-Received: by 2002:a17:90b:4b12:b0:237:39b1:7c88 with SMTP id
 lx18-20020a17090b4b1200b0023739b17c88mr20135903pjb.35.1677475850995; 
 Sun, 26 Feb 2023 21:30:50 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a520400b002369e16b276sm5172926pjh.32.2023.02.26.21.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:30:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 57/76] target/s390x: Use tcg_constant_i32 for
 fpinst_extract_m34
Date: Sun, 26 Feb 2023 19:24:46 -1000
Message-Id: <20230227052505.352889-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
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

Return a constant or NULL, which means the free may be
removed from all callers of fpinst_extract_m34.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 26 +-------------------------
 1 file changed, 1 insertion(+), 25 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index f2f2ea06eb..811049ea28 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1790,7 +1790,7 @@ static TCGv_i32 fpinst_extract_m34(DisasContext *s, bool m3_with_fpe,
         return NULL;
     }
 
-    return tcg_const_i32(deposit32(m3, 4, 4, m4));
+    return tcg_constant_i32(deposit32(m3, 4, 4, m4));
 }
 
 static DisasJumpType op_cfeb(DisasContext *s, DisasOps *o)
@@ -1801,7 +1801,6 @@ static DisasJumpType op_cfeb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_cfeb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -1814,7 +1813,6 @@ static DisasJumpType op_cfdb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_cfdb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -1827,7 +1825,6 @@ static DisasJumpType op_cfxb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_cfxb(o->out, cpu_env, o->in2_128, m34);
-    tcg_temp_free_i32(m34);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -1840,7 +1837,6 @@ static DisasJumpType op_cgeb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_cgeb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -1853,7 +1849,6 @@ static DisasJumpType op_cgdb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_cgdb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -1866,7 +1861,6 @@ static DisasJumpType op_cgxb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_cgxb(o->out, cpu_env, o->in2_128, m34);
-    tcg_temp_free_i32(m34);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -1879,7 +1873,6 @@ static DisasJumpType op_clfeb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_clfeb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -1892,7 +1885,6 @@ static DisasJumpType op_clfdb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_clfdb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -1905,7 +1897,6 @@ static DisasJumpType op_clfxb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_clfxb(o->out, cpu_env, o->in2_128, m34);
-    tcg_temp_free_i32(m34);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -1918,7 +1909,6 @@ static DisasJumpType op_clgeb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_clgeb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -1931,7 +1921,6 @@ static DisasJumpType op_clgdb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_clgdb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -1944,7 +1933,6 @@ static DisasJumpType op_clgxb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_clgxb(o->out, cpu_env, o->in2_128, m34);
-    tcg_temp_free_i32(m34);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -1957,7 +1945,6 @@ static DisasJumpType op_cegb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_cegb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     return DISAS_NEXT;
 }
 
@@ -1969,7 +1956,6 @@ static DisasJumpType op_cdgb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_cdgb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     return DISAS_NEXT;
 }
 
@@ -1981,7 +1967,6 @@ static DisasJumpType op_cxgb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_cxgb(o->out_128, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     return DISAS_NEXT;
 }
 
@@ -1993,7 +1978,6 @@ static DisasJumpType op_celgb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_celgb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     return DISAS_NEXT;
 }
 
@@ -2005,7 +1989,6 @@ static DisasJumpType op_cdlgb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_cdlgb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     return DISAS_NEXT;
 }
 
@@ -2017,7 +2000,6 @@ static DisasJumpType op_cxlgb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_cxlgb(o->out_128, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     return DISAS_NEXT;
 }
 
@@ -2486,7 +2468,6 @@ static DisasJumpType op_fieb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_fieb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     return DISAS_NEXT;
 }
 
@@ -2498,7 +2479,6 @@ static DisasJumpType op_fidb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_fidb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     return DISAS_NEXT;
 }
 
@@ -2510,7 +2490,6 @@ static DisasJumpType op_fixb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_fixb(o->out_128, cpu_env, o->in2_128, m34);
-    tcg_temp_free_i32(m34);
     return DISAS_NEXT;
 }
 
@@ -2785,7 +2764,6 @@ static DisasJumpType op_ledb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_ledb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     return DISAS_NEXT;
 }
 
@@ -2797,7 +2775,6 @@ static DisasJumpType op_ldxb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_ldxb(o->out, cpu_env, o->in2_128, m34);
-    tcg_temp_free_i32(m34);
     return DISAS_NEXT;
 }
 
@@ -2809,7 +2786,6 @@ static DisasJumpType op_lexb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_lexb(o->out, cpu_env, o->in2_128, m34);
-    tcg_temp_free_i32(m34);
     return DISAS_NEXT;
 }
 
-- 
2.34.1


