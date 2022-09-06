Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E01F5AE623
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 13:04:19 +0200 (CEST)
Received: from localhost ([::1]:36784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVWNO-0000eA-GQ
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 07:04:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVeX-0003G0-MJ
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:17:57 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVeT-0005BA-VB
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:17:57 -0400
Received: by mail-wr1-x430.google.com with SMTP id b16so14691077wru.7
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ABxrHaemEgEBryBPI7lzAsrUFAZ463uCXMLd90cVMa8=;
 b=XBlomhDkCCLNyt0hYtmoeHiDwiLC7sU+N4CStTeXXY4flqrYrx+bDkF8EMr+ITWAew
 fw6qg4uKBPShVcYenGCal2wHmUWQ9yBtiKwKF2DLRUc8sdj198uHXAHOwDY5bIfJtQXT
 iIU/TLJql1zRZoNXHz2SuI/+LZMeJPXceTRODb0bx3XZOeK1HvFmXes8V6cofYuAmDwe
 mzyzJxchETxCp7CtUyaeHJySimO517R46+0PvPwJoRVWTDLt0kMpc8zzGvsQgfmOrAW7
 O5o+qozfq3fWwBM77ZGHimPKb4UQL03d3qg9DTQpgeeAdt7FPR58e+T7mEhqQ9hias1i
 QMmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ABxrHaemEgEBryBPI7lzAsrUFAZ463uCXMLd90cVMa8=;
 b=ZdTq6dJUy7P/dTAxe0V848eRA0kUW2VhExTjINzp6rOFORVq9z6Bbv7YD7JOQpaZcG
 +igeGEYiG6PCmQOQJBis4xNQ/0rVcAJb+d840K1b5xExx90D+7zfbcJL8LFHrC2ykHWW
 52Is5tRlXJScZqtCh1U3dlViJNwV/E/N7shgvxpzUlQoa6wtjz875WQyyp9hrdJ/w/qJ
 8Yx/eYFyxI2OId3pKntgB9vVFrNMowsutdwtTs06hJeKfWD7hk44L+5qnrWca5XTTZQb
 co2U4MsQSnBru2GQMvzJy/8IVcXHNU6sGeHTymdkm447QL/QYdI8eMwGhhanaehD7q/s
 iIzQ==
X-Gm-Message-State: ACgBeo0iH0HKsNQAhxWQjS3azpbPBi6yFrKxH+IpsHpRTZKcscnjbh/a
 lXwnNja1iqc6FltxLQQGibMPk1t97GWSJ96M
X-Google-Smtp-Source: AA6agR76z+5qj+G7NtM4hg8AtZIjTRwi0v0C3cUkQaGwCa4ArsJXf4ccxv55sTS0TwVZ6LzE6yyv4Q==
X-Received: by 2002:a05:6000:1446:b0:222:c466:58a0 with SMTP id
 v6-20020a056000144600b00222c46658a0mr27793385wrx.53.1662459471540; 
 Tue, 06 Sep 2022 03:17:51 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a05600c365000b003a62bc1735asm14094361wmq.9.2022.09.06.03.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:17:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH v1 03/26] target/s390x: Use tcg_constant_i32 for
 fpinst_extract_m34
Date: Tue,  6 Sep 2022 11:17:24 +0100
Message-Id: <20220906101747.344559-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906101747.344559-1-richard.henderson@linaro.org>
References: <20220906101747.344559-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


