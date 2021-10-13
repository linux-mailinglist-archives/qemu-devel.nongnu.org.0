Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3182342B2F6
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 04:56:28 +0200 (CEST)
Received: from localhost ([::1]:45900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maURP-0001iG-88
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 22:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHm-0004jG-RB
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:30 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:35766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHk-0004wF-3s
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:30 -0400
Received: by mail-pg1-x536.google.com with SMTP id e7so901666pgk.2
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GDciQRPakuuX9DSUk6eQQR3ypkG2xXbHMYU5/kDhb4Y=;
 b=TRGieUJXKbCJs/I85N6IfysWm5eqa0mUvOvjIGnuQIQ31/zGMcr9dJ3uwbm9BFf66S
 wGc5LLJkiXH8sTXiAERtTDhIrY0pRJ5Hri+GHzc6C8EipHY6P0KS3AVj9/VGsOrjPQMN
 BqjO6kP4Z/1yZfXQ/7DgpBhFdLK13CzwSKwqFd1U/vHdFAVHW7ean75kDw4xCbB6L8Py
 hnM/l5E0VQihCkJiKGCLDYoZz4zOBUGmlkxSwf4edZlBdfR6Y5QSumCNiUXYCQFHpq1l
 0lMuVb78rCaA5axiRXT2dXsMZ7nl12vG/7uFHEF+0BiyIBvjLbFcZ5vD54f67MFAPDqv
 2Ykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GDciQRPakuuX9DSUk6eQQR3ypkG2xXbHMYU5/kDhb4Y=;
 b=MMWhdxkxM73FXvyEEiM5KgopL/HP7py8DXuv2KKp2Yp+WuccTQpQcYgiHtqRIp7s7m
 CMpveE4fuWQOlPIzyIpwBLeXP22B04eMvluF44B1VpnuvSQ8eu1McDHityMyj2yY4jnp
 jWcNHq6gnJpdH9xDWMzVrN0Jsu6pbQRYgGVV9WXUSvjg10rN9qYr2GACJ0WT2lNTVwCQ
 RbXwDJHOMgV389VG1zo4XO3F6zcFjcXxuEHKtHavtkwvFsEzJXSpFAPeWITn+QxFGehr
 gbH9XseETR1DjrTM1HFcO0TAHG9vq0PvmcbvkDHOWSUeDkAQCwtqI+5PGT/godvCj8eT
 NCug==
X-Gm-Message-State: AOAM530BM6AGUn8uxmlcXtplNEhNbKkjDOiRup1kUbzcg7qL8cf+0jRK
 ieUVaCKCHotgnB4GD23obrTjWT6CLc+heQ==
X-Google-Smtp-Source: ABdhPJy3YfvMJ+wV8QM/DTRMkXKI0ynL+oPdmmHy5wvDgn8tJVzwPZmGVsTRua8sjMkg1jrB2zh/TQ==
X-Received: by 2002:a63:470b:: with SMTP id u11mr25438098pga.441.1634093186769; 
 Tue, 12 Oct 2021 19:46:26 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id qe17sm4855014pjb.39.2021.10.12.19.46.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:46:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 17/48] target/arm: Use MO_128 for 16 byte atomics
Date: Tue, 12 Oct 2021 19:45:36 -0700
Message-Id: <20211013024607.731881-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: qemu-arm@nongnu.org
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index c5af779006..4cafd3c11a 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -560,7 +560,7 @@ uint64_t HELPER(paired_cmpxchg64_le_parallel)(CPUARMState *env, uint64_t addr,
     assert(HAVE_CMPXCHG128);
 
     mem_idx = cpu_mmu_index(env, false);
-    oi = make_memop_idx(MO_LEQ | MO_ALIGN_16, mem_idx);
+    oi = make_memop_idx(MO_LE | MO_128 | MO_ALIGN, mem_idx);
 
     cmpv = int128_make128(env->exclusive_val, env->exclusive_high);
     newv = int128_make128(new_lo, new_hi);
@@ -630,7 +630,7 @@ uint64_t HELPER(paired_cmpxchg64_be_parallel)(CPUARMState *env, uint64_t addr,
     assert(HAVE_CMPXCHG128);
 
     mem_idx = cpu_mmu_index(env, false);
-    oi = make_memop_idx(MO_BEQ | MO_ALIGN_16, mem_idx);
+    oi = make_memop_idx(MO_BE | MO_128 | MO_ALIGN, mem_idx);
 
     /*
      * High and low need to be switched here because this is not actually a
@@ -656,7 +656,7 @@ void HELPER(casp_le_parallel)(CPUARMState *env, uint32_t rs, uint64_t addr,
     assert(HAVE_CMPXCHG128);
 
     mem_idx = cpu_mmu_index(env, false);
-    oi = make_memop_idx(MO_LEQ | MO_ALIGN_16, mem_idx);
+    oi = make_memop_idx(MO_LE | MO_128 | MO_ALIGN, mem_idx);
 
     cmpv = int128_make128(env->xregs[rs], env->xregs[rs + 1]);
     newv = int128_make128(new_lo, new_hi);
@@ -677,7 +677,7 @@ void HELPER(casp_be_parallel)(CPUARMState *env, uint32_t rs, uint64_t addr,
     assert(HAVE_CMPXCHG128);
 
     mem_idx = cpu_mmu_index(env, false);
-    oi = make_memop_idx(MO_LEQ | MO_ALIGN_16, mem_idx);
+    oi = make_memop_idx(MO_LE | MO_128 | MO_ALIGN, mem_idx);
 
     cmpv = int128_make128(env->xregs[rs + 1], env->xregs[rs]);
     newv = int128_make128(new_lo, new_hi);
-- 
2.25.1


