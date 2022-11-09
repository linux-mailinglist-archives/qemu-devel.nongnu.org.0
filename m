Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C18A622455
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 08:03:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osf6g-0006ez-1y; Wed, 09 Nov 2022 02:02:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1osf6a-0006cS-PE
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 02:02:36 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1osf6Y-0002Ee-Re
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 02:02:36 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 e7-20020a17090a77c700b00216928a3917so991102pjs.4
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 23:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FPCwCw8NIdnDIzeLfwT3RMHDD1OYAbg9lFHMIclkLr0=;
 b=S0IX/GQz57Ov1GzWNEM1mP4DgoxQx2b/+8j0COusPABm9qwM7d56ZXpKI7cYjCuPRt
 L6p+MKguGJ2IBUiWtsO1TXfxuH24MrRrKnDyF0Wacs5h9P+N6yazZjuJlw7lUSqRTh+B
 MtxduwFMygtY1WqSFjYgaepVNCqfHEVb4UHvjadTru1MHlD5usUXFM8puyptI96z6Eoh
 786BHYnRFXSmbj3cfq1UgWDKbgBODEnEYciY9qy1Bc7bZjckr9nhGuVV+jtJfaZe5EUN
 WqWpF+jTSJhMAjNNieH2XeygSu0vaoVvUv6Lq+FGu+8jzu3y3UG+ExNh/aHF26JY1+j8
 h4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FPCwCw8NIdnDIzeLfwT3RMHDD1OYAbg9lFHMIclkLr0=;
 b=kw49iNU0rsrYHcW/pbK5UyPURQc/lz/DQlpmCpXF0NM95VxlKPEYm/VPgLCdop7uiS
 4qsM/wWWG23/G1Gr6JrUibNtafJKpdBibmnAUgFNGuubrEO2KPOUKXsMi3O5kO0xJb3U
 Hy1fnpQmF4fKsb0JO38X9JwQ/ZeU7SwO704Oi+hHlhc0tS4I4qy+ukDqcTUaqPBEvhrW
 eQb6DK7SIVYziuTofooHXKNL4pYKnU0GObqwXj0uhmib5Edfaua4jM9whjBhJaecGqZC
 f0eYcI0WTQdZ/iErwHs05ZLGOlv1Dw8dc1JpL2HTZm/HXPjUETAsl32oAtJdjIYtMCUR
 dYjQ==
X-Gm-Message-State: ACrzQf3JsMitP0T6r8RjXR+YMI5k5v1abHnk1NXt+rgVU859BlfoeXk+
 TijDzszV6QV8ibkhoR3VrlxlHJpA1fidbVH1
X-Google-Smtp-Source: AMsMyM4xeOz2XJXN8ceo1UeA6U8DrDlawHOzoTVTafyJKsc+szQi31nE/0sfZ0cWVU7/HCMVICTm/g==
X-Received: by 2002:a17:90a:b011:b0:213:473e:6fe1 with SMTP id
 x17-20020a17090ab01100b00213473e6fe1mr61559377pjq.229.1667977352863; 
 Tue, 08 Nov 2022 23:02:32 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-855d-0172-a1c2-6464.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:855d:172:a1c2:6464])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a1709026e0800b0017bb38e4588sm8158784plk.135.2022.11.08.23.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 23:02:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 1/2] tcg: Move TCG_TARGET_HAS_direct_jump init to tb_gen_code
Date: Wed,  9 Nov 2022 18:02:23 +1100
Message-Id: <20221109070224.13073-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109070224.13073-1-richard.henderson@linaro.org>
References: <20221109070224.13073-1-richard.henderson@linaro.org>
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


