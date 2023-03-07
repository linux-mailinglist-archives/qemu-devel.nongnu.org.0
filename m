Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 390986AED4D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:03:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbe8-0003ku-Q8; Tue, 07 Mar 2023 13:02:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbe5-0003Mf-SO
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:41 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbe4-00018p-9O
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:41 -0500
Received: by mail-pg1-x531.google.com with SMTP id 16so8097082pge.11
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678212159;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GmSQ5EsnhiBz2/bI7UFdGFdPdrCS0Ujyapsg1y1C9MU=;
 b=bgqfJkmv8NYvoRawcdA60xm8ui/RX5EZLcgQaW84lQKergz3T53hZ/E5zFbaJmvLpH
 tvee6214B2oxvUgJImPCH/pqUbe0rjh2H8UTBmeXIJj7TaQPrI+uLSAEqP/rDnuHZv2B
 nVGxeZRbQfSIy1zzFSkzu+ZZkXUEgVPpWB5egdr+fAtITFB2nfKXmZ60EhC/FZ+3ksXs
 s6gD9fWOCZ5mEQt9J2XpJvORHjLhCYNj/SRJS5llIciKT+cCgN1FYQtLIiCTgTnvKfgB
 YVbJht40Gj13ISK+TY5/5YjzQLCcqgJti9J4yYAgpmJF/HB5/Le+BSLXJqswHtif4vUI
 PKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678212159;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GmSQ5EsnhiBz2/bI7UFdGFdPdrCS0Ujyapsg1y1C9MU=;
 b=mI1zCaPCq/poJbI7uoi2zOz65/8jovHGlPyIC/4od7h57FXI2JuSYb8RcXYe/iS8o5
 31ZH20klR1Y3kILtuc71siyo8fwIc8gIj1ZDxEuiW/z4YtNjbC2eCaojw3aitmOfdOAD
 3P5UX96nIQdOz1udhwYfKIsnR4aDnCZHW9dEy1gg3mh9MEtxfQNMg9FzHuO3xw+aG2pH
 eTpCXcoS8Wnwao4KorR3hfqoXqUvori5Aj1bl1ZpJkXfyFLB/02d8JIhf+i/hcEQtUwN
 mvyNU2caBu7EkU7ApbmZt33ZLrM9aXlDuqfIHvQiJ4/lIIuCRHjqy9ouyzq3O/niZNIY
 25Lg==
X-Gm-Message-State: AO0yUKVkmVxNcdUIZ5StyYMRJOW3WJvCdn579wPqbmYDdgdFKuZi2OW8
 fv7+SF9+pcjuqLiK2Tdh9Ltw55GTZKD+yblr6SM=
X-Google-Smtp-Source: AK7set/CHf0ZQSRXAnOZjqc8036sGbC8o3FQIzhXOO7OwT0KZLGogycA1yQXSQ6QWSWTeixe/L0bsQ==
X-Received: by 2002:aa7:97a2:0:b0:5a8:ea06:662 with SMTP id
 d2-20020aa797a2000000b005a8ea060662mr13755950pfq.20.1678212158839; 
 Tue, 07 Mar 2023 10:02:38 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a63e544000000b00502fd70b0bdsm8080441pgj.52.2023.03.07.10.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:02:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 61/67] tcg/sparc: Avoid tcg_const_tl in gen_edge
Date: Tue,  7 Mar 2023 09:58:42 -0800
Message-Id: <20230307175848.2508955-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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

Push tcg_constant_tl into the shift argument directly.
Since t1 no longer exists as a temp, replace with lo1,
whose last use was just above.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/translate.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 5ee293326c..137bdc5159 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -2838,7 +2838,7 @@ static inline void gen_load_trap_state_at_tl(TCGv_ptr r_tsptr, TCGv_env cpu_env)
 static void gen_edge(DisasContext *dc, TCGv dst, TCGv s1, TCGv s2,
                      int width, bool cc, bool left)
 {
-    TCGv lo1, lo2, t1, t2;
+    TCGv lo1, lo2;
     uint64_t amask, tabl, tabr;
     int shift, imask, omask;
 
@@ -2905,10 +2905,8 @@ static void gen_edge(DisasContext *dc, TCGv dst, TCGv s1, TCGv s2,
     tcg_gen_shli_tl(lo1, lo1, shift);
     tcg_gen_shli_tl(lo2, lo2, shift);
 
-    t1 = tcg_const_tl(tabl);
-    t2 = tcg_const_tl(tabr);
-    tcg_gen_shr_tl(lo1, t1, lo1);
-    tcg_gen_shr_tl(lo2, t2, lo2);
+    tcg_gen_shr_tl(lo1, tcg_constant_tl(tabl), lo1);
+    tcg_gen_shr_tl(lo2, tcg_constant_tl(tabr), lo2);
     tcg_gen_andi_tl(dst, lo1, omask);
     tcg_gen_andi_tl(lo2, lo2, omask);
 
@@ -2927,9 +2925,9 @@ static void gen_edge(DisasContext *dc, TCGv dst, TCGv s1, TCGv s2,
         lo2 |= -(s1 == s2)
         dst &= lo2
     */
-    tcg_gen_setcond_tl(TCG_COND_EQ, t1, s1, s2);
-    tcg_gen_neg_tl(t1, t1);
-    tcg_gen_or_tl(lo2, lo2, t1);
+    tcg_gen_setcond_tl(TCG_COND_EQ, lo1, s1, s2);
+    tcg_gen_neg_tl(lo1, lo1);
+    tcg_gen_or_tl(lo2, lo2, lo1);
     tcg_gen_and_tl(dst, dst, lo2);
 }
 
-- 
2.34.1


