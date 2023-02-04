Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5560E68AB3F
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:35:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOLUM-0005Fe-56; Sat, 04 Feb 2023 11:34:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLUL-0005FN-5W
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:34:05 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLUJ-0002aq-69
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:34:04 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 hv11-20020a17090ae40b00b002307b580d7eso4088516pjb.3
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 08:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U/HSkpGEvHbItuZnMKBTZy7j63PzLUxQ950pxrJaTtQ=;
 b=vq/pKfXI1ATHDZadV7NClm0Wz/oErX9bripgzXJLBIHfmqMpc6PevATdZ/AyD/mK16
 Bv9sQoo6N+Tx38jojkWnu3kKsAtwjqVbSs32R+3WeYUAF54kmV4tTenWNPigduiDGWvE
 hu2lubkNVd0/f/Q9U0xmfv8ot73kiBMgXYU6ZvhdP5y/91fuO4uBTzbqUhzGsyC9OOjS
 9HLvyzZiSn0/SgLCCuOakMu9a/tBJooi+aul+62XW6kZGKjif09+ZPaWRTNz9YtdtR/5
 UWzjBbrqUTQQZcU7sBbrLFsONRwbAd5hUjriGS20X/YBwjm0sOWESgNh6ZnoZpEWPWDP
 vEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U/HSkpGEvHbItuZnMKBTZy7j63PzLUxQ950pxrJaTtQ=;
 b=GEoFV7Gvz0HrMcGfqvgJCJVAdeCilD0F+QqbQQUiNkYH19Vpd77xM6cDyvBXPgThVi
 /M51ibSxwbLOKjRroVtnGWPBOpq6HPJw+EKaaJOcxH14/jshkNna9GrZyxpwyLTiIktt
 AhV6yVVH35Qs0mmd1inFbp1qVODQPSDEujKOYL/2tngm3iZ1MoG0sLb9BY/dVIkuDDjL
 lOX5DRk6Nv45FznPHr0M2RsYRUb8F/eqwD6w6OZKqldzJ9rz7e88rAhMCRxah2hA+D0f
 ULmrXQ7+Ga+ywzIkAfOWGqCK+eLo6o+/Se7sjJkQgZdpSMZL3GmgmnnHFyWU0rqxniQv
 STrg==
X-Gm-Message-State: AO0yUKVPSR4nXngBPNz0fU9W3JOMAVF0WY+uLXXR5dSigEn4NkJ3DdC4
 ARuWLZnl/xnGEHiOp3bL1FFJTG8/AYs1mgDK
X-Google-Smtp-Source: AK7set+r3ADxQTiDFccn1OQOMMt/qGdyEZjxWSFhsUCFj5g56vd1CIwd57FkYu4tFjJx9Za/EJ45EQ==
X-Received: by 2002:a17:902:d154:b0:194:d609:e1ca with SMTP id
 t20-20020a170902d15400b00194d609e1camr11667013plt.54.1675528441941; 
 Sat, 04 Feb 2023 08:34:01 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a1709029a9300b00186b69157ecsm3660859plp.202.2023.02.04.08.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 08:34:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 31/40] target/s390x: Use Int128 for return from TRE
Date: Sat,  4 Feb 2023 06:33:01 -1000
Message-Id: <20230204163310.815536-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230204163310.815536-1-richard.henderson@linaro.org>
References: <20230204163310.815536-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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


