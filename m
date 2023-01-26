Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B2267C3F3
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 05:43:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKu2q-0000Sx-If; Wed, 25 Jan 2023 23:39:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu2Z-0000I3-Qu
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:39:15 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu2X-0004Qk-JS
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:39:11 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 v6-20020a17090ad58600b00229eec90a7fso5407949pju.0
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 20:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SzDpq4p4TZ0OiGc3bd/AjIVDg1qF6XupmGP3awuLITw=;
 b=Y7Wca7xKXiCBCfqrKRyO4QrNg3zHaZBZWe/URAHNrBci9cF8b3eMhQ1vfMTVQlz6uN
 577KYUjoFX8bZ/BZ7/x9xUamWouyEoQEBz7yLlnqPJZ3Agwxd7sgZpoCg8uRJh1Uyacp
 tUukI0ZiIXrBue9Gpz9Pti1+4003uZeV7Qo9YAEbp7b6FXj/TiU49/BW0BgkmMfQGCVK
 EIJ55CwdYJPcEowJSA7kmoAJg5k3XUoGMKmd+FyqiPBUOKPwDuPol4RZOeH4VgNnKJcr
 VSE5fsqSqINPjOJoJFzSfHiOu10HBa5xCkQxlh8/o8rt4nGitFoffzYVkQf5yhpwUSp4
 mDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SzDpq4p4TZ0OiGc3bd/AjIVDg1qF6XupmGP3awuLITw=;
 b=6+6cgwNJkCGwhDl3460Ry/2nrnwF5QiRqwq9Lx5wZw0+BOKK1YVzjV+WgumZ/QMl4S
 c7bsuLhF58NSrkxW9IK8yx+6jefDsvWTkRS0LVcyvCVV7FcbZZAEb4bOQeFtzIGaaPdA
 pwEfMyDoUyz+qBF002kUBKl9z3x5hZXMunS6vrX1bAl7tZKmTQWBweQj5PsbZ/w3D6Wm
 nHB44aNCwEDopWZwWlYbliviZc5xW7pwu+q4MSJNXl/baWq46skS6OlYQfgR3xw7FArv
 wwmljIeI9kvXwGTBJLuZpKhcvRvFs+T2U4K4t6Ep2yXuFe/5YLmoS9k1Ltg2CbFNMfOu
 +/TQ==
X-Gm-Message-State: AO0yUKUCliwUXrA4UzU1sj2BYbnR9ZGqn8BOj/u5CyxYZh8A8PX74Yg2
 SvZXitMQRM5ImAZMIdxQtn5JQNwSkeM5A0G9vJw=
X-Google-Smtp-Source: AK7set/QmKF4setuZ7GT6PA6q2htOxfTSoiVzsuH0XicdR9kSaINDnuDiEpRkv0scjUf0eYMTp804A==
X-Received: by 2002:a17:90b:3891:b0:22b:ecec:aba6 with SMTP id
 mu17-20020a17090b389100b0022bececaba6mr8859159pjb.26.1674707948598; 
 Wed, 25 Jan 2023 20:39:08 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 s62-20020a17090a69c400b00228e56d375asm233376pjj.33.2023.01.25.20.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 20:39:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v5 26/36] target/s390x: Use Int128 for return from CLST
Date: Wed, 25 Jan 2023 18:38:14 -1000
Message-Id: <20230126043824.54819-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126043824.54819-1-richard.henderson@linaro.org>
References: <20230126043824.54819-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/helper.h         |  2 +-
 target/s390x/tcg/mem_helper.c | 11 ++++-------
 target/s390x/tcg/translate.c  |  8 ++++++--
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 593f3c8bee..25c2dd0b3c 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -16,7 +16,7 @@ DEF_HELPER_FLAGS_3(divs64, TCG_CALL_NO_WG, i128, env, s64, s64)
 DEF_HELPER_FLAGS_4(divu64, TCG_CALL_NO_WG, i128, env, i64, i64, i64)
 DEF_HELPER_3(srst, void, env, i32, i32)
 DEF_HELPER_3(srstu, void, env, i32, i32)
-DEF_HELPER_4(clst, i64, env, i64, i64, i64)
+DEF_HELPER_4(clst, i128, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(mvn, TCG_CALL_NO_WG, void, env, i32, i64, i64)
 DEF_HELPER_FLAGS_4(mvo, TCG_CALL_NO_WG, void, env, i32, i64, i64)
 DEF_HELPER_FLAGS_4(mvpg, TCG_CALL_NO_WG, i32, env, i64, i32, i32)
diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index cb82cd1c1d..9be42851d8 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -886,7 +886,7 @@ void HELPER(srstu)(CPUS390XState *env, uint32_t r1, uint32_t r2)
 }
 
 /* unsigned string compare (c is string terminator) */
-uint64_t HELPER(clst)(CPUS390XState *env, uint64_t c, uint64_t s1, uint64_t s2)
+Int128 HELPER(clst)(CPUS390XState *env, uint64_t c, uint64_t s1, uint64_t s2)
 {
     uintptr_t ra = GETPC();
     uint32_t len;
@@ -904,23 +904,20 @@ uint64_t HELPER(clst)(CPUS390XState *env, uint64_t c, uint64_t s1, uint64_t s2)
             if (v1 == c) {
                 /* Equal.  CC=0, and don't advance the registers.  */
                 env->cc_op = 0;
-                env->retxl = s2;
-                return s1;
+                return int128_make128(s2, s1);
             }
         } else {
             /* Unequal.  CC={1,2}, and advance the registers.  Note that
                the terminator need not be zero, but the string that contains
                the terminator is by definition "low".  */
             env->cc_op = (v1 == c ? 1 : v2 == c ? 2 : v1 < v2 ? 1 : 2);
-            env->retxl = s2 + len;
-            return s1 + len;
+            return int128_make128(s2 + len, s1 + len);
         }
     }
 
     /* CPU-determined bytes equal; advance the registers.  */
     env->cc_op = 3;
-    env->retxl = s2 + len;
-    return s1 + len;
+    return int128_make128(s2 + len, s1 + len);
 }
 
 /* move page */
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 6953b81de7..8397fe2bd8 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -2164,9 +2164,13 @@ static DisasJumpType op_clm(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_clst(DisasContext *s, DisasOps *o)
 {
-    gen_helper_clst(o->in1, cpu_env, regs[0], o->in1, o->in2);
+    TCGv_i128 pair = tcg_temp_new_i128();
+
+    gen_helper_clst(pair, cpu_env, regs[0], o->in1, o->in2);
+    tcg_gen_extr_i128_i64(o->in2, o->in1, pair);
+    tcg_temp_free_i128(pair);
+
     set_cc_static(s);
-    return_low128(o->in2);
     return DISAS_NEXT;
 }
 
-- 
2.34.1


