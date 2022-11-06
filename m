Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DDF61E698
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 22:31:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ornCi-0005Om-VL; Sun, 06 Nov 2022 16:29:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ornCe-0005Oa-GP
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 16:29:16 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ornCc-0004HE-WA
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 16:29:16 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 e7-20020a17090a77c700b00216928a3917so7942612pjs.4
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 13:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FPCwCw8NIdnDIzeLfwT3RMHDD1OYAbg9lFHMIclkLr0=;
 b=xsxD81F3co6t1744wLuAImhxF2P5jUTDyzKXYmVBhkWuwPk7ZeY0U4pz/wKoiHOpij
 PN5cvRZzBOM759ndi6WHEnnsG9m+mFcZAp9XKoZOxyg9CZpcsAbscjlxyDWsdfflmbhd
 vrdGxAq8xV4pirYmPgN0omw5baUYhqM3+ggXAfkLCe28Rgtn8Y5IQgU0xvM7dLwbGz4p
 YIPYawy/N3MvYT5NGA7YmQ/2AKGIfVkBIGCDVtjSzTLmrXfeMtKEO9mDmz5mfJkYJjWb
 hG9vmN7XHMSkvdllMTtpGJAWLDHLUkVPOi9KfMd8r949trMldEIIzoWgdaHWyjt/VBdY
 ehaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FPCwCw8NIdnDIzeLfwT3RMHDD1OYAbg9lFHMIclkLr0=;
 b=I5y99v7POB2KGMtzj/FeX00B1NebL4TbdrdytJGikEUl5JIDPHgdaKxQz31qxQT90b
 wHxzqGkCD5ov5X5xPEfr7ueHBtKNCjv4TJ8S5Z2DJNCFCJkWQqGh/jaCxr4ffiTcf2Ki
 wPwRFr/72yeXtB1Nq2Xq6S1QDEPAm1T4yuoxAPsZO4KWJFlU9Oa9fCSZVY1m+cAjHqv2
 8hslEOI4a4l3YqBDRSgyETPxPeWQzgh2j5fcNIty3Js5e1YCZELoblC9xUN+R1C7L5mf
 T7rpMuKqY+I0T45D0jdTAjhMBZZjvFOfdY1yTRFDHubu/uQaO7UIeSQ4QFWpOf5PeQLQ
 qE6A==
X-Gm-Message-State: ACrzQf3y6lFkwfwfzKgwMHx1bALWa24rzT9/uu2DcPgU+GAh/a7qSZGH
 /ayuh0JZQr/XbMYVgchcMoTCeaaTExrLpnPi
X-Google-Smtp-Source: AMsMyM6XeHRcLN5k6WaTMWaVU9mEZK7Q8Sib1oCSF8SaHf0Vf5i2gkfaYBUOUeVqf7at7MrXO00mjw==
X-Received: by 2002:a17:902:f60b:b0:178:6a49:d4e3 with SMTP id
 n11-20020a170902f60b00b001786a49d4e3mr47640232plg.75.1667770153660; 
 Sun, 06 Nov 2022 13:29:13 -0800 (PST)
Received: from localhost.localdomain ([2001:8003:d918:7a00:f28:fa55:3b51:3624])
 by smtp.gmail.com with ESMTPSA id
 20-20020a621914000000b00563ce1905f4sm2998746pfz.5.2022.11.06.13.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 13:29:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: balaton@eik.bme.hu,
	philmd@linaro.org,
	sw@weilnetz.de
Subject: [PATCH v2 5/6] tcg: Move TCG_TARGET_HAS_direct_jump init to
 tb_gen_code
Date: Mon,  7 Nov 2022 08:28:51 +1100
Message-Id: <20221106212852.152384-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221106212852.152384-1-richard.henderson@linaro.org>
References: <20221106212852.152384-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 10 ----------
 tcg/tcg.c                 | 12 ++++++++++++
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 921944a5ab..9ee21f7f52 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -821,16 +821,6 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     trace_translate_block(tb, pc, tb->tc.ptr);
 
     /* generate machine code */
-    tb->jmp_reset_offset[0] = TB_JMP_RESET_OFFSET_INVALID;
-    tb->jmp_reset_offset[1] = TB_JMP_RESET_OFFSET_INVALID;
-    tcg_ctx->tb_jmp_reset_offset = tb->jmp_reset_offset;
-    if (TCG_TARGET_HAS_direct_jump) {
-        tcg_ctx->tb_jmp_insn_offset = tb->jmp_target_arg;
-        tcg_ctx->tb_jmp_target_addr = NULL;
-    } else {
-        tcg_ctx->tb_jmp_insn_offset = NULL;
-        tcg_ctx->tb_jmp_target_addr = tb->jmp_target_arg;
-    }
 
 #ifdef CONFIG_PROFILER
     qatomic_set(&prof->tb_count, prof->tb_count + 1);
diff --git a/tcg/tcg.c b/tcg/tcg.c
index b43b6a7981..436fcf6ebd 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -4228,6 +4228,18 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start)
     }
 #endif
 
+    /* Initialize goto_tb jump offsets. */
+    tb->jmp_reset_offset[0] = TB_JMP_RESET_OFFSET_INVALID;
+    tb->jmp_reset_offset[1] = TB_JMP_RESET_OFFSET_INVALID;
+    tcg_ctx->tb_jmp_reset_offset = tb->jmp_reset_offset;
+    if (TCG_TARGET_HAS_direct_jump) {
+        tcg_ctx->tb_jmp_insn_offset = tb->jmp_target_arg;
+        tcg_ctx->tb_jmp_target_addr = NULL;
+    } else {
+        tcg_ctx->tb_jmp_insn_offset = NULL;
+        tcg_ctx->tb_jmp_target_addr = tb->jmp_target_arg;
+    }
+
     tcg_reg_alloc_start(s);
 
     /*
-- 
2.34.1


