Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F00A56630F4
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:09:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEyRg-0002uz-I8; Mon, 09 Jan 2023 15:08:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRa-0002py-Ud
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:31 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRX-0007PB-Dy
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:29 -0500
Received: by mail-pj1-x1034.google.com with SMTP id bj3so6725377pjb.0
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q3WKZKXeAQ7VZHzrf3EHfWYZVMYgOXzqitJC4yCe2aA=;
 b=jOT09j4bfc3x1wmz2yZkBmPL/D4LW0KmspYq3esnmUm1KCJT/QOrxsgME+qDw++qpq
 x0MbGzCzbZMdCdVdKqnRrGqUz1gvGR4GbYTWIXRAbgL02867FD3JDP9c3QYMHE7XHOfz
 D1ioNLGvqTO7GcpiiHL8Z3hU9jXSwtn3z6zMneVqOoulRgFCBAfnY29E9cDzObRpDR5a
 kXv3WST29MJb5yKvL06KqNnvbDTfcujib+ETNg2fdSwlvkPQcof6IaFIEgYFo/UEh0wr
 xmwckZtkl8VCR/ht82d7iFdm0VucAqyDgfcL2Q/rxyr0rpM1/5Kfw0MyfBhdU//L8XdK
 eAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q3WKZKXeAQ7VZHzrf3EHfWYZVMYgOXzqitJC4yCe2aA=;
 b=wsIgRmDTcyGTT2kxwWI/7HZeTttQQYYi1OhE4WjtLEo8mqUqNEshF74sHskal1G+Ed
 POH4pm1BoIPxmrzwL/iSMJaXv0EZjRCn/5Ra8n/keWV39yc5c1rFhJw2I8XGePNzJSBi
 t6gx23xO/FJVt8/A20seQbcQbdE8Aiu4iX0PQhsL0dFD1m+CW2c4afcqCEEAqnDz8LJP
 38hbWj5TcdkO0fXTvm8nphyMv9CCPpnxr6jobzPT+jAMoclTjUssCs1FjIhhoWYGxMRq
 sYCVV3kj3bMTrPucIQ1CFuNO1xXjMzlityovXghiZb947H/Zw0zF/odO6udHFYhyPUEd
 GxsQ==
X-Gm-Message-State: AFqh2kqKFsksxSEtul2DS7Hp9JRWn5xS0L+dDzOLDxPqipnvY2zLPm6D
 2tk8ruK8rrsy26FDOwRv4GaekAvqdiTTZTz/
X-Google-Smtp-Source: AMrXdXtQaZV4hW8GyEWbW52Sd768i50NHijJdYF8+AVQiYby6AYj35Si9Hf7HEoBU/HOQZfRQIn8sw==
X-Received: by 2002:a17:90a:5b05:b0:225:d190:f16c with SMTP id
 o5-20020a17090a5b0500b00225d190f16cmr55871705pji.21.1673294905318; 
 Mon, 09 Jan 2023 12:08:25 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:158e:facf:7a46:ba9f])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a17090a384200b0022727d4af8dsm577574pjf.48.2023.01.09.12.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 12:08:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 03/27] target/s390x: Use tcg_constant_i32 for
 fpinst_extract_m34
Date: Mon,  9 Jan 2023 12:07:55 -0800
Message-Id: <20230109200819.3916395-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109200819.3916395-1-richard.henderson@linaro.org>
References: <20230109200819.3916395-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

Return a constant or NULL, which means the free may be
removed from all callers of fpinst_extract_m34.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 26 +-------------------------
 1 file changed, 1 insertion(+), 25 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 2fa052249f..83805085a9 100644
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


