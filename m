Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F036AF0F0
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:37:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZc9d-0003cU-2C; Tue, 07 Mar 2023 13:35:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9a-0003b0-T1
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:14 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9Z-0007kC-BA
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:14 -0500
Received: by mail-pj1-x1031.google.com with SMTP id x34so14180532pjj.0
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678214112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qxgDTYXHfeCSjrJ315R2/sC0Bf/gryvtVm2qasIqXas=;
 b=JBlSMtO0Q6li5r8PqzhUVH1ygRixH0eXpzeSeCzBMbIF8uUGzgrCnjEEh727j5pKZV
 ENNCp81svbBhzZWq+atvYgrvVKOS5aAE4u1Afrg7HTsdRHElW2dmhu5Fj+BlxoZi0ZRD
 xhkDalDVrxLyZN35XzEwcm5JFx7sF0Jc93LneyyZgETDb+Z1Id8hUNWd9LhuEZpooLX6
 lMH4XoAnW9AMjJFvH1UigS4BSM/wSf390edrK3whT43iO+HOymIf3urJyGlDJorVHq5S
 VOIGSslzlKtyVLiyMyy0v2cmLbrSQSfZXK327VATRO/i7xWDowk2Cm9Vh0trHJQl+6rm
 G24w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678214112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qxgDTYXHfeCSjrJ315R2/sC0Bf/gryvtVm2qasIqXas=;
 b=1WzL/rsyNvpigFXOJ3bQHnbZoRasRh95zKepCpsPxIWKR5ze7DcylTFKdzAfHF1f1N
 gA2Cur/GUZs3yKL+mBjaEq3ijy9aP5kJYTHdpeUf9MmaRgu9epMbCDKj7uaiS+gjKIBj
 RkZLoaPV0K1HZkvHVS38xjU2ZYZbE/yJHaVX9Nmk9jKSH1FwPMCvxmDxHZGUQkSYxFES
 PYO4HOLEA3gKo575P+o2tXLg+BopbwUU3s6NDEabyyJdrh0jCXfPQ/iVt+bHxXnC/orK
 Jyf46odqOf9srBe+xPg3UldtuvQs6VLdxtbPwI3IrqE/QbgtjkNpdeVI/fm5jUsFRVrE
 tO2Q==
X-Gm-Message-State: AO0yUKWKcZxH6jryLlAjT+uSlFFMtrAu6SfQu3bFSi+Hs0y5nQwbA8/q
 oaDGZUbe+UnZ+Lgx+zmD0sZPvxmA4K3cA2NgNUk=
X-Google-Smtp-Source: AK7set+ACBq+Sg4XOfoxdJmnYlYYZ7QHvI6lZzLWFrQ4IumNNZt+zwyfdG3s6fHZ+csIfsnlvZKSdg==
X-Received: by 2002:a17:90a:6485:b0:237:461c:b44d with SMTP id
 h5-20020a17090a648500b00237461cb44dmr15703734pjj.46.1678214112102; 
 Tue, 07 Mar 2023 10:35:12 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a17090a1b0100b0022c0a05229fsm7757940pjq.41.2023.03.07.10.35.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:35:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 10/25] target/arm: Avoid tcg_const_ptr in
 handle_vec_simd_sqshrn
Date: Tue,  7 Mar 2023 10:34:48 -0800
Message-Id: <20230307183503.2512684-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307183503.2512684-1-richard.henderson@linaro.org>
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
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

It is easy enough to use mov instead of or-with-zero
and relying on the optimizer to fold away the or.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 2ad7c48901..082a8b82dd 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8459,7 +8459,7 @@ static void handle_vec_simd_sqshrn(DisasContext *s, bool is_scalar, bool is_q,
     tcg_rn = tcg_temp_new_i64();
     tcg_rd = tcg_temp_new_i64();
     tcg_rd_narrowed = tcg_temp_new_i32();
-    tcg_final = tcg_const_i64(0);
+    tcg_final = tcg_temp_new_i64();
 
     if (round) {
         tcg_round = tcg_constant_i64(1ULL << (shift - 1));
@@ -8473,7 +8473,11 @@ static void handle_vec_simd_sqshrn(DisasContext *s, bool is_scalar, bool is_q,
                                 false, is_u_shift, size+1, shift);
         narrowfn(tcg_rd_narrowed, cpu_env, tcg_rd);
         tcg_gen_extu_i32_i64(tcg_rd, tcg_rd_narrowed);
-        tcg_gen_deposit_i64(tcg_final, tcg_final, tcg_rd, esize * i, esize);
+        if (i == 0) {
+            tcg_gen_mov_i64(tcg_final, tcg_rd);
+        } else {
+            tcg_gen_deposit_i64(tcg_final, tcg_final, tcg_rd, esize * i, esize);
+        }
     }
 
     if (!is_q) {
-- 
2.34.1


