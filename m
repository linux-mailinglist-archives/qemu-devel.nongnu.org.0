Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AFE5104D8
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 19:04:13 +0200 (CEST)
Received: from localhost ([::1]:55702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njObk-0003pA-9i
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 13:04:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO90-0002Oo-3q
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:34:30 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:41742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO8y-0004Mq-Dv
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:34:29 -0400
Received: by mail-pl1-x630.google.com with SMTP id s14so30701123plk.8
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xpgOAMY6yJE94kKOgo2N7OR1UFD6TR7BUSB7+hLMRTs=;
 b=fSdcABSnvQRXssmPFcWRNnLXTCpQUJuQnBIouHCm1LcPB/mN5DZEBj5hAbw/JFoBAT
 L0rrMi4tIuwVAHp0vyTMkhb3qjtim2seIJTc/ka+Ujyubn4b90imJEMUEFLlmEcH7KJI
 rjgE/7qx+d7aKlavg6O6aZDfw4trQqxgpYJ8+OWzHSQCKZ56qKA/mEaG+gHPjOC8K0yV
 HVU2Wb+ZgA0XbcShNVvjmrzQc5Uk4AWmFSeUjoz3Ycn2ZQ3z1fD4o6Kbs+2cFb1opgMp
 mtf/foD+mWQAGb7/5uOSXq7kZE8DV6fwWXl2zxUfhedpVm/lb5Wh/vCSK2xdTQWuRV/i
 f0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xpgOAMY6yJE94kKOgo2N7OR1UFD6TR7BUSB7+hLMRTs=;
 b=rR1wghVtTQR4qRhIYjqc1sn0+fmklaT6TyGbyWkSUYlkkDd+sJauF6qj9NnD+Ipbd8
 MhtM3Kh5xHGGzAPpFKvq4HEzkreI4alEwNzLvxjyzCfaO3JPetYF4OM56BqAYh0DG7r0
 etM2YsomWEjceiFtDAat4ixTaJ1DJ4Y7olGzPl3AnFfFLiuIp/YSgR4q7z7Q2pZO92jb
 oWD3mQi7x58nPOFWuEjvMZ062cHCB9hRJCkb2ZWTAMafafSTBlqgGpEtoBDN9xKKUnMb
 CrYUFN5GRpYn8Fn1bCfulwWW4rPuYTsKtx2yTtC5h/utKj8/KjIhGTpoRv27QE7DdNxg
 9xHA==
X-Gm-Message-State: AOAM531X+XXvfnzEnOaHU78x4bWFzv+5GNjIcjehVLKkM9rv2CtkKT8B
 G3mU3JT2wAIL+SMintmulRfB9nmX2OJBqQ==
X-Google-Smtp-Source: ABdhPJwLN5hmE17eoHaGw2GPGJPt0U4ZJlDs9WdJl+NN6FCAhZCSvayBKpkXoFpsa2mNkxNqrZ4T8Q==
X-Received: by 2002:a17:90a:c388:b0:1d9:6336:2d7a with SMTP id
 h8-20020a17090ac38800b001d963362d7amr14111525pjt.244.1650990866237; 
 Tue, 26 Apr 2022 09:34:26 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a17090acb8d00b001d953eb2412sm1132834pju.19.2022.04.26.09.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:34:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 44/47] target/arm: Use tcg_constant in do_zzi_{sat, ool},
 do_fp_imm
Date: Tue, 26 Apr 2022 09:30:40 -0700
Message-Id: <20220426163043.100432-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 92339a19e3..a684d489d2 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3853,9 +3853,8 @@ static bool do_zzi_sat(DisasContext *s, arg_rri_esz *a, bool u, bool d)
         return false;
     }
     if (sve_access_check(s)) {
-        TCGv_i64 val = tcg_const_i64(a->imm);
-        do_sat_addsub_vec(s, a->esz, a->rd, a->rn, val, u, d);
-        tcg_temp_free_i64(val);
+        do_sat_addsub_vec(s, a->esz, a->rd, a->rn,
+                          tcg_constant_i64(a->imm), u, d);
     }
     return true;
 }
@@ -3884,12 +3883,9 @@ static bool do_zzi_ool(DisasContext *s, arg_rri_esz *a, gen_helper_gvec_2i *fn)
 {
     if (sve_access_check(s)) {
         unsigned vsz = vec_full_reg_size(s);
-        TCGv_i64 c = tcg_const_i64(a->imm);
-
         tcg_gen_gvec_2i_ool(vec_full_reg_offset(s, a->rd),
                             vec_full_reg_offset(s, a->rn),
-                            c, vsz, vsz, 0, fn);
-        tcg_temp_free_i64(c);
+                            tcg_constant_i64(a->imm), vsz, vsz, 0, fn);
     }
     return true;
 }
@@ -4520,9 +4516,8 @@ static void do_fp_scalar(DisasContext *s, int zd, int zn, int pg, bool is_fp16,
 static void do_fp_imm(DisasContext *s, arg_rpri_esz *a, uint64_t imm,
                       gen_helper_sve_fp2scalar *fn)
 {
-    TCGv_i64 temp = tcg_const_i64(imm);
-    do_fp_scalar(s, a->rd, a->rn, a->pg, a->esz == MO_16, temp, fn);
-    tcg_temp_free_i64(temp);
+    do_fp_scalar(s, a->rd, a->rn, a->pg, a->esz == MO_16,
+                 tcg_constant_i64(imm), fn);
 }
 
 #define DO_FP_IMM(NAME, name, const0, const1) \
-- 
2.34.1


