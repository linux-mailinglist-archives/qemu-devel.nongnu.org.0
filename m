Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B5C625510
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 09:17:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otP6S-0001LV-HC; Fri, 11 Nov 2022 03:09:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otP5r-0001Bm-W5
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 03:09:05 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otP5p-0002G5-Ac
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 03:08:54 -0500
Received: by mail-pl1-x62e.google.com with SMTP id io19so3664634plb.8
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 00:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H3YsRy3ZwI85kWlA87JDjfHJRRUDh64hGrBlDWv3Vgw=;
 b=kWKOlYgmHNhzfcgA8XGD6RWnLiWXbx/W4N4S1/VRruytZzldzS/Sk77T8sUtCjfhiv
 Y8NebJxgbz7E1E6AqJDmfynQNfAewjKKsJWF6MjJkCQyZfLGb+GBgsad8qPmFXIYbmtx
 HHPMkMLdDA3HWE3vVrzwDMY/SQCmZQwXCCYjuqpLt/nc68+Tn1EBsqXjL2sfibDaq8Dj
 VrG7YpoPpRBrqbIedE2nNs5pQJWNNbzZuNh5YtsfPS7lKb+DfWxYjvqbcIYGFYW+Gs9y
 ZsWyPzn95FgKC/UYlziLdjDBorheRpDq/ADW8X7sY6CUpvQhQlgZ6Im2U4BW4jMKj4c8
 H35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H3YsRy3ZwI85kWlA87JDjfHJRRUDh64hGrBlDWv3Vgw=;
 b=Wusfhdtv1XQCgXTLAulD64y6Rcb1xaat64HnWS5f4B4t7smVA8vjrSd5aphyhFHh6/
 OEi9ZL+kf7kOT8TbpRwMfI0juNXWusak1sB9z/NNYIrFJY5x01WETFKHgKXDvoISJm+e
 /LaGLNVSMBZe2h1oSumCFh2LtH5g+3Gg6eWDkKI7R5RDdUxSJHSPPNIwI4dx7qFbWmF4
 qfd96ly9+RNTu2KbJlq7pZpdMZdYrITWLqMVRGJWee8YubM82L/FaYszDQRkNm4UPOMM
 MEc4LbXmETl+p0G9g2QrupLLPDAn18coPHJV8xOksz9q913RMvA/+7CJkR18vUo/rRmf
 KGPg==
X-Gm-Message-State: ANoB5pnfZ+2TQaKlDEniUiZHMpsZd1JHxD50YItNw+4CJJxXk4P2nMSz
 /xRQXbKKL+sL/57COBbowTPShmh0aNrK+WDK
X-Google-Smtp-Source: AA0mqf544KFgOYieyfoS2ConOt6mtLn5bJ8xwRkF9OuxY7GYD83uEf5ApZduDVocXDfo0ABqy4JH7Q==
X-Received: by 2002:a17:90a:cf90:b0:213:2263:6728 with SMTP id
 i16-20020a17090acf9000b0021322636728mr691353pju.141.1668154130063; 
 Fri, 11 Nov 2022 00:08:50 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a170902c3c400b00186a2dd3ffdsm1046341plj.15.2022.11.11.00.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 00:08:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: iii@linux.ibm.com, david@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH for-8.0 v2 08/13] target/s390x: Use Int128 for return from TRE
Date: Fri, 11 Nov 2022 18:08:15 +1000
Message-Id: <20221111080820.2132412-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111080820.2132412-1-richard.henderson@linaro.org>
References: <20221111080820.2132412-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/helper.h         | 2 +-
 target/s390x/tcg/mem_helper.c | 7 +++----
 target/s390x/tcg/translate.c  | 7 +++++--
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 16045b6dbe..aaea177246 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -99,7 +99,7 @@ DEF_HELPER_FLAGS_4(unpka, TCG_CALL_NO_WG, i32, env, i64, i32, i64)
 DEF_HELPER_FLAGS_4(unpku, TCG_CALL_NO_WG, i32, env, i64, i32, i64)
 DEF_HELPER_FLAGS_3(tp, TCG_CALL_NO_WG, i32, env, i64, i32)
 DEF_HELPER_FLAGS_4(tr, TCG_CALL_NO_WG, void, env, i32, i64, i64)
-DEF_HELPER_4(tre, i64, env, i64, i64, i64)
+DEF_HELPER_4(tre, i128, env, i64, i64, i64)
 DEF_HELPER_4(trt, i32, env, i32, i64, i64)
 DEF_HELPER_4(trtr, i32, env, i32, i64, i64)
 DEF_HELPER_5(trXX, i32, env, i32, i32, i32, i32)
diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index bb6714aee4..caf8c408ef 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -1632,8 +1632,8 @@ void HELPER(tr)(CPUS390XState *env, uint32_t len, uint64_t array,
     do_helper_tr(env, len, array, trans, GETPC());
 }
 
-uint64_t HELPER(tre)(CPUS390XState *env, uint64_t array,
-                     uint64_t len, uint64_t trans)
+Int128 HELPER(tre)(CPUS390XState *env, uint64_t array,
+                   uint64_t len, uint64_t trans)
 {
     uintptr_t ra = GETPC();
     uint8_t end = env->regs[0] & 0xff;
@@ -1668,8 +1668,7 @@ uint64_t HELPER(tre)(CPUS390XState *env, uint64_t array,
     }
 
     env->cc_op = cc;
-    env->retxl = len - i;
-    return array + i;
+    return int128_make128(len - i, array + i);
 }
 
 static inline uint32_t do_helper_trt(CPUS390XState *env, int len,
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 112ec35160..4ad951a46f 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -4903,8 +4903,11 @@ static DisasJumpType op_tr(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_tre(DisasContext *s, DisasOps *o)
 {
-    gen_helper_tre(o->out, cpu_env, o->out, o->out2, o->in2);
-    return_low128(o->out2);
+    TCGv_i128 pair = tcg_temp_new_i128();
+
+    gen_helper_tre(pair, cpu_env, o->out, o->out2, o->in2);
+    tcg_gen_extr_i128_i64(o->out2, o->out, pair);
+    tcg_temp_free_i128(pair);
     set_cc_static(s);
     return DISAS_NEXT;
 }
-- 
2.34.1


