Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A38368AB40
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:35:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOLUJ-0005Eg-Hw; Sat, 04 Feb 2023 11:34:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLUH-0005EX-Ok
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:34:01 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLUG-0002aW-65
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:34:01 -0500
Received: by mail-pl1-x629.google.com with SMTP id be8so8158738plb.7
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 08:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SzDpq4p4TZ0OiGc3bd/AjIVDg1qF6XupmGP3awuLITw=;
 b=rgJY4Pyqi0S2RB3QWJDHOi6Ps6O1w1cYH5T5poQuqINWYy7MuLbrFnYYg4zYNNa366
 SRYp1ROpFcthY2diZui9gFw5E//d69s97WpIpJ/SuMwDQJpXHiSm1mcH5NZkeS51UJlI
 O8n5Lje0cXWCRHHRr8P9z22ygvB/cdLpUQgq49l42GKEO9SNunlr87ph3sVDgG4BRHSM
 7iz4sUWuNPbyg43B0lEG98sc/UI67jpcFGEKpIvzLYNh0WDLwqm31TGEBXPbajBo2Z6e
 KTx3f1zO60OeaH6r2GUcWYXi3pATTM7Gb8RvkuJ6gNgRgiO9HlLFZvUQzcHkFtOE2shE
 EuWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SzDpq4p4TZ0OiGc3bd/AjIVDg1qF6XupmGP3awuLITw=;
 b=Pn7rhKrT0Xq5nonuJ1jzC8lZNxKnipDuJjdnNAgNxwIBUi05ZJExX07iIL/navZDS3
 /HpZrOhPL7+dUMM4FkehJJOpa1v7DtVp1DZjbTXITa/uCI+2LtfFVjxyUDyez/JIr9ej
 sLIjn4aVTGhLpQ7q+kqxd4hakc4N56hl8HuIHAAtHqYJfbhYD/o/xFbHExpj2W4i0+ND
 O7zI2QK0Qg87tQyxiiY8y8iiQKvS1OXXo+GS//aN3xRV/uxRayPQPpsx4GP86CDq/9WQ
 et6Is4BMhIF8l02vQfVZyXCzus43mCVBo9NA+A7u+2Sqa1FJDzG+ZNfCPv1IQQEri8gX
 IhNQ==
X-Gm-Message-State: AO0yUKWcNt1dD26PSU2lMTUphD/l1deu8qPtJF61YSTCDt1bYGttDFJw
 pz2VUID5frih42sg7aveGoObT76vf2bSjS2h
X-Google-Smtp-Source: AK7set+tQJkNojYhsv5iTPQ3BFgmLwqVs7MQeYKxwUkQrwNBSA3HTU43E2b9P8CWaajNPaVnedgPzw==
X-Received: by 2002:a17:902:e5cb:b0:196:86c2:ee60 with SMTP id
 u11-20020a170902e5cb00b0019686c2ee60mr18674891plf.15.1675528438866; 
 Sat, 04 Feb 2023 08:33:58 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a1709029a9300b00186b69157ecsm3660859plp.202.2023.02.04.08.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 08:33:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 29/40] target/s390x: Use Int128 for return from CLST
Date: Sat,  4 Feb 2023 06:32:59 -1000
Message-Id: <20230204163310.815536-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230204163310.815536-1-richard.henderson@linaro.org>
References: <20230204163310.815536-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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


