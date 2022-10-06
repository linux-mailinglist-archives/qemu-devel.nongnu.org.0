Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D755F5FCC
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 05:55:12 +0200 (CEST)
Received: from localhost ([::1]:37214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogHyY-0007Xz-RD
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 23:55:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoD-0003yH-49
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:29 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:50933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoB-0003rF-13
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:28 -0400
Received: by mail-pj1-x102d.google.com with SMTP id lx7so727086pjb.0
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ABxrHaemEgEBryBPI7lzAsrUFAZ463uCXMLd90cVMa8=;
 b=LN/nCiEHMNaF5jLiiP8Dx4asxKXs/Q9LZMNCHxg/AeNl2mpfh9L8X6vuwX3X3BgthO
 Ie/lqh2J1RxRUdsB/E5rWPZ9xegoUwJGL239AvbSjH5Mvfg3ODltqv3FVyFdVVN1slPI
 YtG7JXcSUl3nXio+ExfdWr2PGySjXFcieDWMf7JUmP/5ELCaaPawVmaek0FZuOTbQJ6N
 zYMN6PXkIjrrx4hhWSlCd6ON8efa85oKzbDof/2HTF5sG8RODzgcxagxJG/iJHUwJ169
 PJNc+9+S51HwilVOoyDn07FnB3R5ecn5Ev3VqFtI1EaF0ARJlerokuSWm9EXB2qkeR6O
 9n7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ABxrHaemEgEBryBPI7lzAsrUFAZ463uCXMLd90cVMa8=;
 b=nABK7c3rMN/vV18S9REVwkDDoVLd0APIoK00X+gaVKFafZZEgdisXdLRnXXCrqtiJU
 BJ60CN9dk2jsvtStJVLBvmkpHdz001u6JhS8t+3wmRDdHNvJ2tascXaTJSxtNWYh2dcv
 ReZcFO/tG5h6L7KjRMeynz3+BD+MetryK2Eb9FfAgUn9kp7yKakKO78EmWy33SodqSnG
 1dADDLFwnRFZh3IWnzw24b6bHaAORjunKJgpRSaA9v1aomr2QrXps4ZQy21b5/tzP9jI
 HNgtJg2YT62VNtTlHxx5yhPtGkzYiZ4oBa/buc+iO0vvjYFnFcqlT/l0nt6rUI1X0lTI
 fhSg==
X-Gm-Message-State: ACrzQf0Mza/MLF+aWV5dXBS79u76CTlo46AABeJfuLq3Bscc3DTBpv6p
 8kADIcWobltGO4KprxZ7WwKklSyITsm5HQ==
X-Google-Smtp-Source: AMsMyM6jjvAo+bo5wFTjfhDGSbp2iPTFN5m1YSoC0FNvDbJWdvL+gn+WHdwDG+AVG2YC7ExtSnKe4w==
X-Received: by 2002:a17:902:da8a:b0:179:e022:5f6 with SMTP id
 j10-20020a170902da8a00b00179e02205f6mr2795461plx.80.1665027866168; 
 Wed, 05 Oct 2022 20:44:26 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a17090ad0c600b00205f4f7a3b3sm1905086pjw.21.2022.10.05.20.44.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:44:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH 03/26] target/s390x: Use tcg_constant_i32 for
 fpinst_extract_m34
Date: Wed,  5 Oct 2022 20:43:58 -0700
Message-Id: <20221006034421.1179141-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006034421.1179141-1-richard.henderson@linaro.org>
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Return a constant or NULL, which means the free may be
removed from all callers of fpinst_extract_m34.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 26 +-------------------------
 1 file changed, 1 insertion(+), 25 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index ec43bd7a1f..f8cfddc181 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1775,7 +1775,7 @@ static TCGv_i32 fpinst_extract_m34(DisasContext *s, bool m3_with_fpe,
         return NULL;
     }
 
-    return tcg_const_i32(deposit32(m3, 4, 4, m4));
+    return tcg_constant_i32(deposit32(m3, 4, 4, m4));
 }
 
 static DisasJumpType op_cfeb(DisasContext *s, DisasOps *o)
@@ -1786,7 +1786,6 @@ static DisasJumpType op_cfeb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_cfeb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -1799,7 +1798,6 @@ static DisasJumpType op_cfdb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_cfdb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -1812,7 +1810,6 @@ static DisasJumpType op_cfxb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_cfxb(o->out, cpu_env, o->in1, o->in2, m34);
-    tcg_temp_free_i32(m34);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -1825,7 +1822,6 @@ static DisasJumpType op_cgeb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_cgeb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -1838,7 +1834,6 @@ static DisasJumpType op_cgdb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_cgdb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -1851,7 +1846,6 @@ static DisasJumpType op_cgxb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_cgxb(o->out, cpu_env, o->in1, o->in2, m34);
-    tcg_temp_free_i32(m34);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -1864,7 +1858,6 @@ static DisasJumpType op_clfeb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_clfeb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -1877,7 +1870,6 @@ static DisasJumpType op_clfdb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_clfdb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -1890,7 +1882,6 @@ static DisasJumpType op_clfxb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_clfxb(o->out, cpu_env, o->in1, o->in2, m34);
-    tcg_temp_free_i32(m34);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -1903,7 +1894,6 @@ static DisasJumpType op_clgeb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_clgeb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -1916,7 +1906,6 @@ static DisasJumpType op_clgdb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_clgdb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -1929,7 +1918,6 @@ static DisasJumpType op_clgxb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_clgxb(o->out, cpu_env, o->in1, o->in2, m34);
-    tcg_temp_free_i32(m34);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -1942,7 +1930,6 @@ static DisasJumpType op_cegb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_cegb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     return DISAS_NEXT;
 }
 
@@ -1954,7 +1941,6 @@ static DisasJumpType op_cdgb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_cdgb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     return DISAS_NEXT;
 }
 
@@ -1966,7 +1952,6 @@ static DisasJumpType op_cxgb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_cxgb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     return_low128(o->out2);
     return DISAS_NEXT;
 }
@@ -1979,7 +1964,6 @@ static DisasJumpType op_celgb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_celgb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     return DISAS_NEXT;
 }
 
@@ -1991,7 +1975,6 @@ static DisasJumpType op_cdlgb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_cdlgb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     return DISAS_NEXT;
 }
 
@@ -2003,7 +1986,6 @@ static DisasJumpType op_cxlgb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_cxlgb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     return_low128(o->out2);
     return DISAS_NEXT;
 }
@@ -2466,7 +2448,6 @@ static DisasJumpType op_fieb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_fieb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     return DISAS_NEXT;
 }
 
@@ -2478,7 +2459,6 @@ static DisasJumpType op_fidb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_fidb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     return DISAS_NEXT;
 }
 
@@ -2491,7 +2471,6 @@ static DisasJumpType op_fixb(DisasContext *s, DisasOps *o)
     }
     gen_helper_fixb(o->out, cpu_env, o->in1, o->in2, m34);
     return_low128(o->out2);
-    tcg_temp_free_i32(m34);
     return DISAS_NEXT;
 }
 
@@ -2766,7 +2745,6 @@ static DisasJumpType op_ledb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_ledb(o->out, cpu_env, o->in2, m34);
-    tcg_temp_free_i32(m34);
     return DISAS_NEXT;
 }
 
@@ -2778,7 +2756,6 @@ static DisasJumpType op_ldxb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_ldxb(o->out, cpu_env, o->in1, o->in2, m34);
-    tcg_temp_free_i32(m34);
     return DISAS_NEXT;
 }
 
@@ -2790,7 +2767,6 @@ static DisasJumpType op_lexb(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     gen_helper_lexb(o->out, cpu_env, o->in1, o->in2, m34);
-    tcg_temp_free_i32(m34);
     return DISAS_NEXT;
 }
 
-- 
2.34.1


