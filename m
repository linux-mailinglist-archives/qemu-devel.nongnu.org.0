Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DED607174
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 09:51:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmoo-0003ME-Hl
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:51:50 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmVP-0004eF-9W
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:31:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmUo-00045H-Sv
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:31:12 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmUd-0007wC-O5
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:31:09 -0400
Received: by mail-pl1-x62b.google.com with SMTP id u6so1578328plq.12
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bAtzgdU7L/h5a6rHaYiOh11g4q1pSh2uetwfhS3WVvE=;
 b=nUL161r0AlMYNo9oM/rzcR6cTEDQyP1lZk9g9SoNPx9vSkLMb6US/RE0yg8P8ETJPn
 utbGH2jZNdmdL2kZAwIvwq4/KcdNovfZ1PILuwTn3FsbCznh59+IAWYY6Die8DCxAWvb
 bVm+o+auC5FPhYY8BtjJaV2jQO3ysY5kz5BhfAIT/zhGYk78cCdnUt0v224M2Zel/rqy
 eqbkb3ABzRZcxETmgekTQyYUJONcYtMdUaN6DnMusSIrT4ZTCRFbTaQuFuRAm6mG2K2+
 jMGeg6vxA2Nstx2ExA1geI72YxX+8BCJGFMhcVqz5+7ZDOJXghF6E7RvgbCSfA0W5TYY
 HCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bAtzgdU7L/h5a6rHaYiOh11g4q1pSh2uetwfhS3WVvE=;
 b=pxzO2wE1/+hZhsvG64dvaRI56psnrd62nHyIV/ZYd4YVu/8Nwr6fKCiadXzZJPg3EF
 aM8HpJk0WyULAmEdJRoY7db8b7vXBnHMrYptDPpsuII9osGuXZfbJYbfLF+WnXDc1b5c
 3j7I5EkhWqjzk8r6IqN6ljYi7r4tmCR11VIqsIcf1vcvkXS3uOpf1GEcBmWVfX05XzZu
 gJfmMb8xoAghj7xOygM411g8u7dgp4iiCcJRT2RUH6ibzPZQ6Gf//JaRlqwL+Nv66u76
 hGhMRev9twCvnHUiWhxpWXwmqeKc2yYcAURePvQeI7xKNqDAAMiEBL66Qw9Ox8YVY5w+
 IrXA==
X-Gm-Message-State: ACrzQf16sH+q/iKaelRo4whbz727VDNRioaaRPw2RAFEoU85kQ3Ghqfi
 0qIClTN9hNCUkD1gqbuanbHrndvwch3kR3fP
X-Google-Smtp-Source: AMsMyM7i6KK7fGtnjl+3ZsGTGoQxFS73Cq2lVr6Hsv2rjpRqYLY4K5d1MxHA1aAxlIVcFT6JPcYzrw==
X-Received: by 2002:a17:903:1110:b0:178:9f67:b543 with SMTP id
 n16-20020a170903111000b001789f67b543mr17879776plh.131.1666337458132; 
 Fri, 21 Oct 2022 00:30:58 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a17090a6d8900b002008d0e5cb5sm1042721pjk.47.2022.10.21.00.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:30:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH 5/9] target/s390x: Use Int128 for return from TRE
Date: Fri, 21 Oct 2022 17:30:02 +1000
Message-Id: <20221021073006.2398819-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021073006.2398819-1-richard.henderson@linaro.org>
References: <20221021073006.2398819-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
index 224046551f..8dc4f4b5ec 100644
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


