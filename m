Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E18F32A8DA
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 19:08:20 +0100 (CET)
Received: from localhost ([::1]:58406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH9RT-0000mp-Jk
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 13:08:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9Hd-0003Eq-In
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:58:09 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:42732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9Hb-0007ca-TO
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:58:09 -0500
Received: by mail-pg1-x52b.google.com with SMTP id o38so14331973pgm.9
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 09:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fjh8f4OqF602Y2BfCtcg6Y74/rLBbqgNaPqxsRG9w20=;
 b=VzrxgKWOViuBKQKGkIlPzkJLCBfD+EdWJTRdw0kmX79g3AMLMuEpoP91IK3Rou7Zo1
 AS8kv3iSFmPondD0vcu0bwskO061+atc6b8QCLjcJ2GLR0lqVKiQzQgq0sqUWxJByvbc
 5jgGNABW4rMxi/UuaYARK3j/TS9ahf6VXKzsC0hPrslQLS5uW1yVgZTJiVnEonqtlSnR
 f9StyO6rXpUXUANxsq/lLbXq6rHQmsD1k86bwlarI8vkIWHGpiJ6CR1BF3zha1SSbJ/w
 wREs15yTJQdU04MZlX2ZsJWMYv0+k3fqNyxL1vbwIU/2Nd4fKCUDD8BbFDA+bRzGfm5Z
 SDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fjh8f4OqF602Y2BfCtcg6Y74/rLBbqgNaPqxsRG9w20=;
 b=eUNa6dK5A/SO+ZRPXvhQc1EntrAvjG20hp+Y/baxRXPBgtr9nYHUPaeOzipnN1UAdQ
 aDJsSa3j2BLFzjFK+JoL5AiXc/P3x5yK6SYoeXjALu+jZg17HYZk2FraKh52msFnKd4f
 G3Y9WKRymPpQOcinZf3BrCaLqB3Oh5hdFgRHT1fCfeignLIeIN6rhTqWf5AyY26fsw59
 1UHAhv9K8cHbmxnd642unTkuMR0TBacTrg0GtNtB99oDhPpNC1a8AsdaEo3KyeXRc6GE
 DtTBOzi33QpH0JPR+X85gfeZ9r9HEhZwqcJ1U2b7mhGjHBCr8cTgF7oBGr8lqZ+1Rm9s
 4iUQ==
X-Gm-Message-State: AOAM530b0oXA+uWUZFrvAevzqimv2O8t7Ia2DPhcuc+qx3KCyCw3j3iv
 FhH/GAdmA/WykjwxpXzrXUhRnbUjR3sV6Q==
X-Google-Smtp-Source: ABdhPJwxAfpH9AxCUAgLn+O9plKAbffkkgCiCRw/xWQw3TKKCIIT7tM1iAQ0GWX8XT6ARpz/kJAdRw==
X-Received: by 2002:a62:e209:0:b029:1ed:c415:3a86 with SMTP id
 a9-20020a62e2090000b02901edc4153a86mr4433900pfi.19.1614707886740; 
 Tue, 02 Mar 2021 09:58:06 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id gf20sm4232234pjb.39.2021.03.02.09.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 09:58:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/27] tcg/tci: Merge mov, not and neg operations
Date: Tue,  2 Mar 2021 09:57:36 -0800
Message-Id: <20210302175741.1079851-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302175741.1079851-1-richard.henderson@linaro.org>
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 29 +++++------------------------
 1 file changed, 5 insertions(+), 24 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 66f2962d6e..3ccd30c39c 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -387,7 +387,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg(regs, t0, tci_compare64(t1, t2, condition));
             break;
 #endif
-        case INDEX_op_mov_i32:
+        CASE_32_64(mov)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1);
@@ -649,26 +649,21 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg(regs, t0, bswap32(t1));
             break;
 #endif
-#if TCG_TARGET_HAS_not_i32
-        case INDEX_op_not_i32:
+#if TCG_TARGET_HAS_not_i32 || TCG_TARGET_HAS_not_i64
+        CASE_32_64(not)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, ~t1);
             break;
 #endif
-#if TCG_TARGET_HAS_neg_i32
-        case INDEX_op_neg_i32:
+#if TCG_TARGET_HAS_neg_i32 || TCG_TARGET_HAS_neg_i64
+        CASE_32_64(neg)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, -t1);
             break;
 #endif
 #if TCG_TARGET_REG_BITS == 64
-        case INDEX_op_mov_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
-            break;
         case INDEX_op_tci_movi_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_i64(&tb_ptr);
@@ -802,20 +797,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg(regs, t0, bswap64(t1));
             break;
 #endif
-#if TCG_TARGET_HAS_not_i64
-        case INDEX_op_not_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, ~t1);
-            break;
-#endif
-#if TCG_TARGET_HAS_neg_i64
-        case INDEX_op_neg_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, -t1);
-            break;
-#endif
 #endif /* TCG_TARGET_REG_BITS == 64 */
 
             /* QEMU specific operations. */
-- 
2.25.1


