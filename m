Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD336B2E46
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:12:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMaE-0004F0-OB; Thu, 09 Mar 2023 15:09:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMaC-00047L-KJ
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:48 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMaB-0001VQ-4L
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:48 -0500
Received: by mail-pl1-x636.google.com with SMTP id ky4so3237873plb.3
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392586;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GmSQ5EsnhiBz2/bI7UFdGFdPdrCS0Ujyapsg1y1C9MU=;
 b=grPFuEXCj+unqtb/PfBDpYkKvOLIPa+HdPSuLEzM3MOcyJFJqk0GcTR5XkBd8bTPD4
 ldd4/L9sJRLff9f5S4jQC6BHZcKkRjedTsMB4yTgRcsQ191gOKUn+ymZXyqWosbiDV/k
 TrJRG92FJZgSy9BFNBziHDTVWM8gitguBUEj/31sk8vvtRV5fDUMyC40IdtG6JPfEN1m
 4tCG1axrTJ5YvtyJxf7f43a6Bnmlz53Ax7VvHUXyTfg2l72F/AKLnw0MaPPhti1cTBPW
 2rXtj1IFC80WjsGMlXCHqvYeqNSTJzl9DjKD84uC4OBjaNEGMpsoiRmQrnGXcZr3IjgJ
 lwJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392586;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GmSQ5EsnhiBz2/bI7UFdGFdPdrCS0Ujyapsg1y1C9MU=;
 b=zPeXrMWsfv4o2loUErsvdekSkUzXWLDZ2gYqcn3YgWPCAsjG4qDem+toK4AfzrMZcZ
 l0afqXBi1VlamUFRoplHTnOZZZ2O34CDGReV8m/ugccwEN6q8w2Yk7vUsXCQX4ZX+ir5
 NDb4k7bF6OaHrhjgytdT4/h2/9ankTyi1uf11Y8T1o2fQW/VH8nXzEqkQMRjLwqvnVpf
 EM9PAJHyBdMGPRsa/TswzIG1NTEUiAQLGetYh0xKpwdyN6jBM9HuvJdOlLglW5/3FtRm
 TBBvHpFpEMYTFHU1h/UZp6gmeay+Ra3GDWmsWh9AzoHHS76Gp8nT7j3K7SLCcknCvDPc
 t/yg==
X-Gm-Message-State: AO0yUKXpv0UtUS4LBW4nFpe4VfHl4vroIE7RAGI+5jTK//VcFafTEp2d
 opcN+w2jx7QI0N6zRC6bTY5rCR41NPnzIGS7ow8=
X-Google-Smtp-Source: AK7set8g3In+zgcruTNns/sl1jXKXfGcQBIJyog32hvPvVFm1EE54INh5uOgH1X6rPu1aKm2DhOa+g==
X-Received: by 2002:a17:903:32d2:b0:199:1160:956c with SMTP id
 i18-20020a17090332d200b001991160956cmr22830401plr.31.1678392586396; 
 Thu, 09 Mar 2023 12:09:46 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170902aa4200b001991e4e0bdcsm43797plr.233.2023.03.09.12.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:09:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 61/91] tcg/sparc: Avoid tcg_const_tl in gen_edge
Date: Thu,  9 Mar 2023 12:05:20 -0800
Message-Id: <20230309200550.3878088-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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


