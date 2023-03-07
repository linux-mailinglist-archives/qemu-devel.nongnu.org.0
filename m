Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB1E6AED76
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:04:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbe3-00031v-VZ; Tue, 07 Mar 2023 13:02:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbe1-0002gG-Gb
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:37 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbdz-00017c-SP
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:37 -0500
Received: by mail-pl1-x62d.google.com with SMTP id y11so15051616plg.1
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678212154;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kyDPUGSbuCwhL3x+7jqoeSc7RPJbuWrbniQSOOD4ez4=;
 b=DJ3Zmy9XGVJyxnRo6juqEEGAV1RU9MK6goiYek7YOGP0AoGQG047B+hTzLkH1BOW5H
 CJ+MUkzYCF+MtG3zzZFYrLIwJMATvcQOAnCtmgt/HDEwCTUtO1DuqsXc5xMKl5UTlHYY
 NzXJ5u0mE3q60Ka6sfPpJHdt4Xt+jf5JBhDuRwGd2G4qZ+9Pa+tljFfh7RrfJtflkr+4
 TwsOqwix4ufvmHQzgx9TZtGIvv4HiQ18B+Z/yC+Jolz/UNgJDRtVButIuMMh4EOzh/+u
 EKt5QCKnAMOcCbBdkO1/94jH5h8sdKeKB+Btrb6HLvy8BBCrcw5rkwUnoq0mSX36leDW
 1Z3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678212154;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kyDPUGSbuCwhL3x+7jqoeSc7RPJbuWrbniQSOOD4ez4=;
 b=7vmI7MUKl1LxCjSN8CJ5rhVHSjmTb4uxr+EL5q8tC5inFTo3evYy7uTZMq1pIS6gzV
 ZDVX7tPcZ8NixW1BacNNRc3y/O+1HUJbSaL7gWT4IV/V0Xa2WtIaTP3V+1jq5xZLjNEh
 CqHf9Kl1ivyWCAxjXPJNnrYQ0iqqSKgQyaKTx6z1gAMeCcAmyFlAePZh7+V1vFWEmo2F
 v4O4SRzrsdUlnuJKGnWj/XfylaCfLGSJOE/Efyji6HZ1wJODuhS/cZhkdWWxbAcTSuZY
 BG1gQou761AtFG7DZ7F94PBoQoufiLdUpmXTzAJnLq2C+z1rhk677kvshvXfuVWsk1bL
 ovaQ==
X-Gm-Message-State: AO0yUKXz9Wm0p9dehJXbFSJdAzlL7rio3xyLXx4ArrrEDixFTFEfRPY8
 eElHAiq65S5X8S8A1AUrOOA0b3M27N+y80FyVa0=
X-Google-Smtp-Source: AK7set84wvlrlw37d1oGuf39sttpsxFLn3X07OYGEY99bXHMbKBI+lus6XwgLlilZxvkC969sHKgjQ==
X-Received: by 2002:a05:6a20:7290:b0:b8:a0e1:2739 with SMTP id
 o16-20020a056a20729000b000b8a0e12739mr16287774pzk.3.1678212154467; 
 Tue, 07 Mar 2023 10:02:34 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a63e544000000b00502fd70b0bdsm8080441pgj.52.2023.03.07.10.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:02:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 56/67] target/rx: Avoid tcg_const_i32 when new temp needed
Date: Tue,  7 Mar 2023 09:58:37 -0800
Message-Id: <20230307175848.2508955-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

These three cases use a constant as first input, and
then overwrite the temp in the output.  Separate them.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/translate.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/rx/translate.c b/target/rx/translate.c
index c47aa26893..6b218d5d5e 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -1313,10 +1313,10 @@ static bool trans_SHLL_rr(DisasContext *ctx, arg_SHLL_rr *a)
     done = gen_new_label();
     /* if (cpu_regs[a->rs]) { */
     tcg_gen_brcondi_i32(TCG_COND_EQ, cpu_regs[a->rs], 0, noshift);
-    count = tcg_const_i32(32);
+    count = tcg_temp_new();
     tmp = tcg_temp_new();
     tcg_gen_andi_i32(tmp, cpu_regs[a->rs], 31);
-    tcg_gen_sub_i32(count, count, tmp);
+    tcg_gen_sub_i32(count, tcg_constant_i32(32), tmp);
     tcg_gen_sar_i32(cpu_psw_c, cpu_regs[a->rd], count);
     tcg_gen_shl_i32(cpu_regs[a->rd], cpu_regs[a->rd], tmp);
     tcg_gen_setcondi_i32(TCG_COND_EQ, cpu_psw_o, cpu_psw_c, 0);
@@ -1979,10 +1979,10 @@ static inline void rx_bnotr(TCGv reg, TCGv mask)
                                         cat3(arg_, name, _rr) * a)      \
     {                                                                   \
         TCGv mask, b;                                                   \
-        mask = tcg_const_i32(1);                                        \
+        mask = tcg_temp_new();                                          \
         b = tcg_temp_new();                                             \
         tcg_gen_andi_i32(b, cpu_regs[a->rs], 31);                       \
-        tcg_gen_shl_i32(mask, mask, b);                                 \
+        tcg_gen_shl_i32(mask, tcg_constant_i32(1), b);                  \
         cat3(rx_, op, r)(cpu_regs[a->rd], mask);                        \
         return true;                                                    \
     }                                                                   \
@@ -1990,10 +1990,10 @@ static inline void rx_bnotr(TCGv reg, TCGv mask)
                                         cat3(arg_, name, _rm) * a)      \
     {                                                                   \
         TCGv mask, mem, addr, b;                                        \
-        mask = tcg_const_i32(1);                                        \
+        mask = tcg_temp_new();                                          \
         b = tcg_temp_new();                                             \
         tcg_gen_andi_i32(b, cpu_regs[a->rd], 7);                        \
-        tcg_gen_shl_i32(mask, mask, b);                                 \
+        tcg_gen_shl_i32(mask, tcg_constant_i32(1), b);                  \
         mem = tcg_temp_new();                                           \
         addr = rx_index_addr(ctx, mem, a->ld, MO_8, a->rs);             \
         cat3(rx_, op, m)(addr, mask);                                   \
-- 
2.34.1


