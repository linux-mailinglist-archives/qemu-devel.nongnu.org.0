Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA3C67C3F4
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 05:43:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKu2p-0000OC-LB; Wed, 25 Jan 2023 23:39:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu2f-0000JI-KV
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:39:17 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu2e-0004Vr-0y
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:39:17 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 t12-20020a17090aae0c00b00229f4cff534so5122838pjq.1
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 20:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U/HSkpGEvHbItuZnMKBTZy7j63PzLUxQ950pxrJaTtQ=;
 b=QaXqTAS9o+fR4MFnTRYPGLWs6wwx//ORSp1kVRon47YsKge7WS25ejmvTnf1pVC8p4
 85r7/O3Gq5/fcXuyafP70/TXbn1upjrz9mTu0HLe73V2HC2b1eA1PGlwyhIzoAF7hLEW
 4/3C2JpOdjqIQbzLvblaPMIqhzp8Fu5ubieM9/XvKR8beXnqcdh/XY7EN1jNDHk+H3b1
 arm9P3m3jud7otDUpbur1aDH/kNAfyiyp6E8P99uIYo951UChxC+KhiAiz8KXa9Gdg2G
 +w6751/uin+njkF4c/sCIiENqM0bsygcqQGEpaXWOSPWi6RAb7UHW2rCLuEHV+MN0Rv6
 2jgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U/HSkpGEvHbItuZnMKBTZy7j63PzLUxQ950pxrJaTtQ=;
 b=ghAH5MK6zXbwuyHR6eixlXdf9gysJP6FTVHItwq4zWcbKlMtr92m4E/FMdEZBQcpfD
 UB0C9Z7/zwmmeXdMcYYHmzGlRGmpJeWfi3r2ryFSk1wi7xg+poPAzy/nPqCeER/PDZiH
 7iDTdFRUeKelSR31hTJs7j/95ZSMwYPAn9ao/J5Ryz4BDOQdJ5wn3ETWTu/j3zitfeQT
 mW3MAv/gmtM0e4yNNyUmk3qPrHdGKGmhnFIEpGeWUDY5oe34RAV/4h3IOfKVXbOv/ibk
 VqlotEwW71/HzwZVciStoXofdg2BZjjSLfT74ZAlCM4a1kumVFKKx6xWpPsmVmj0oQWC
 1+dw==
X-Gm-Message-State: AO0yUKU490o5rv0orRoMB8PbQRBkwuP4VU6KNfgsZnzzESsIZxySEqkO
 z7HS6zbvEK4d+2VSwxe81gc8P1QAC4a4PT+y8rQ=
X-Google-Smtp-Source: AK7set80JPDW+ve6+ZBzYmUcL0OHcI7UWMaa4bS7YXv4Un6r6EgxOXVYEqh1KvZydwu+F/0NfsegHA==
X-Received: by 2002:a17:90b:4a8a:b0:225:f47d:b49f with SMTP id
 lp10-20020a17090b4a8a00b00225f47db49fmr725583pjb.39.1674707951836; 
 Wed, 25 Jan 2023 20:39:11 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 s62-20020a17090a69c400b00228e56d375asm233376pjj.33.2023.01.25.20.39.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 20:39:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 28/36] target/s390x: Use Int128 for return from TRE
Date: Wed, 25 Jan 2023 18:38:16 -1000
Message-Id: <20230126043824.54819-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126043824.54819-1-richard.henderson@linaro.org>
References: <20230126043824.54819-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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


