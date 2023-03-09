Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F7C6B2E4A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:12:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMaB-00045T-Q2; Thu, 09 Mar 2023 15:09:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMa9-00042H-5C
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:45 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMa7-0001ZB-H7
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:44 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 p3-20020a17090ad30300b0023a1cd5065fso3054140pju.0
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kyDPUGSbuCwhL3x+7jqoeSc7RPJbuWrbniQSOOD4ez4=;
 b=q7gh12tFPmWqvM1en0qu+ls7Xge5qJACdMEp+ehrxA+LY6IGZI3hHm/qChg6OOG37F
 f9OQKiwi8Dm+QsE9aHsYj5yY3pdsW4eXn17Kf56aB+mnNh13voMU6glxQ9TcOTv8O++W
 rxD4oMPLodJS2a4ZaT3gV4eES3vKWvZue2SzM8KMjjQo2Iqg0Hfm+9lsdTKrZF/0ONEb
 pdglCV7cXPnZaXWJyv+Wa2LM+odbgfDCqLIWHkets5q3KpKFoWC7CJOokKrUQV+qr7sR
 +iTsur7CundEaWuVPSLqzg6cPs+l0QTNXpqBO5b1bKNr4ifDamWxLkre6zlGwSN6HFzb
 6jHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kyDPUGSbuCwhL3x+7jqoeSc7RPJbuWrbniQSOOD4ez4=;
 b=3l1a0wmqpVjSO5Eb11cldLAeM0pF6u3aArgfkyTZ1RnmLw+8Ly7Fw2LiNwdhqRACtz
 +DsbgaMSqt8DFcl3AW/ezGXsdtTlcM5uXaI8VRpDnVBgI+KJvyWK4IEM2ms6JIn9hDhD
 clexkv1sTXrs0d7SuFlokEY7Aa5DX2Lzym9tqW265dHseu3cxUQHt280RXWexpYQASPZ
 EDkRXSx+R5JeWxSawfepkFdcTaipaFScrxejFM8RXTDuneG5YuMIpI000T6lr9D7Ey6j
 QPpDkamYGlUGmgMpfID1NpVnComhxiENxS70QUUtReGMPuTSgiK2BFyqwP9uYvibPd/J
 EQXQ==
X-Gm-Message-State: AO0yUKWVMdLHwORG3N8eplUU3l0bsVA6l8CECxo8FCtZ9QZ92/7TsqtY
 nTsPga3ueFJrRYJ7wcABu8YKXB853V1ULTyTnWs=
X-Google-Smtp-Source: AK7set9riALpUYVugZdLdwsnSoKm3CLIjELH1oL0vAvRy4xoKwdwkrhejnp1aJEHt7phtUzXgdeClg==
X-Received: by 2002:a17:902:d2d0:b0:19a:a520:b203 with SMTP id
 n16-20020a170902d2d000b0019aa520b203mr29840161plc.25.1678392582027; 
 Thu, 09 Mar 2023 12:09:42 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170902aa4200b001991e4e0bdcsm43797plr.233.2023.03.09.12.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:09:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 56/91] target/rx: Avoid tcg_const_i32 when new temp needed
Date: Thu,  9 Mar 2023 12:05:15 -0800
Message-Id: <20230309200550.3878088-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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


