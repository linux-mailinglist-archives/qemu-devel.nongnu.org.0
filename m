Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD454681D3B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:51:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMc21-0002b6-RE; Mon, 30 Jan 2023 16:49:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMc1x-0002SX-Hj
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:49:37 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMc1v-0005iO-Qd
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:49:37 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 cl23-20020a17090af69700b0022c745bfdc3so5893870pjb.3
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 13:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U/HSkpGEvHbItuZnMKBTZy7j63PzLUxQ950pxrJaTtQ=;
 b=zeyVAWT99Vjdp2kMVjKiJaJJv939sW2kwkCiw8Pm0aLqs4Ee6YVAvgDuMKqPd2rEaY
 2zbUXaAw6R6wh65r78WiwRfb0g04w1AUPoexnwQiZNkOTbNPz8fHAOfyIOYKy3TlCIo0
 Wi7uEXpkSa/z+N9rZlATZX460DoPIBO0qkv0aPGcljB1t9FO/FCKTWwRwArmdWDa0+ew
 KARCIvzFiFbENNVw+n5rdM8cQgZibWrbRzAJqZaVSsTGUk8NaNF6G33RnsIn9rwLjxJP
 bgDw+2HaK2b6uL3ACNIHldv8Q2K3psPW40iT7z3h6DU7kpW3ahxDf6vBqTBtrVNh8fif
 KDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U/HSkpGEvHbItuZnMKBTZy7j63PzLUxQ950pxrJaTtQ=;
 b=RnYMSkV3t0WFV/1ZR80FY3YlBAJaE8zcuhm4cqmdjvKPTClCG6rG1gauUX58ws4na0
 kot70Wr9iWFPp4t7ZYTEg0i9g8WOb+gniTVxduSo+9mV0R5f61MX0pQl7wNUY47Sa+YV
 lDbjiwDaD3+PuHiKTykCgVJV4aBRHqYkmija8JQotIQlQ1iNnJAatJP8c/WltLKw4nTF
 p++sUNadL32ILrvScKAjxRm3J2uTorm95O3MB8j2yeCBc+XmeNACmxnI2YVWoXffrLx0
 pAMagMUfl9KAl4guTPcsfvlkIPQfQhv4O/80YCT2RKdW2yDGanqTjAnaKb4sWblZisql
 RoSw==
X-Gm-Message-State: AO0yUKXJfNnXOf7hxEej07k2FnWgUsItkGTWVTcvhTMHviDVWQrhxtUG
 dQxFNo6L5+GB187kHF2eM1NAJZxxMGVKL4EG
X-Google-Smtp-Source: AK7set8CfGlvI+xSuzngEJ5yh9tlTOFpVk7BjX0gJHqNlKb/L+Cgj74B16k22anwIGnUiJcbIfNDMg==
X-Received: by 2002:a17:90a:10:b0:22c:7604:c43c with SMTP id
 16-20020a17090a001000b0022c7604c43cmr9664704pja.45.1675115373773; 
 Mon, 30 Jan 2023 13:49:33 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a17090ad14400b00219220edf0dsm7451215pjw.48.2023.01.30.13.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 13:49:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, philmd@linaro.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v6 28/36] target/s390x: Use Int128 for return from TRE
Date: Mon, 30 Jan 2023 11:48:36 -1000
Message-Id: <20230130214844.1158612-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130214844.1158612-1-richard.henderson@linaro.org>
References: <20230130214844.1158612-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
index 03b29efa3e..b4170a4256 100644
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
index b0b403e23a..49969abda7 100644
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
index 1a7aa9e4ae..f3e4b70ed9 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -4905,8 +4905,11 @@ static DisasJumpType op_tr(DisasContext *s, DisasOps *o)
 
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


