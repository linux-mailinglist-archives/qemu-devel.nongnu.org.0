Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E96A7370FD5
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 01:30:41 +0200 (CEST)
Received: from localhost ([::1]:39666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldLXt-0006gY-1X
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 19:30:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMr-0008T0-SE
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:19:17 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:46057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMi-00030Z-80
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:19:17 -0400
Received: by mail-pl1-x62c.google.com with SMTP id p17so1846662plf.12
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pRV7mqfMaKb7/SwKxjrezlXdNmvbN1KHw2x4aibLFRI=;
 b=LGoDDHlBUINnmZ/r7a4AdBl7Rwi4Su7NL7d5vWZtSpdGH8R/fyqO+3Alrp5WfMAJvQ
 abONDHENv5r6AXGF8MwSOF+S1pHcRnilYvJceJ5PZWXMtriayhe0RyY4YsKM1suijQvr
 /PPQum04pIIdJTcqDIqBYi1A7HNKyKLibCChPeubLW1vajLNmuzGdbViw353EKKg7RLg
 E+aMyA6phtImcRAKbmOcsYFQxq/lFL+xJKkZNQ1hEw1QG+n0qUDiPMKBM26skqGF4ui+
 fGQ9XNRgJw7DUkYskaWoWcOt0qpAIaaCfKDlZd2yJI8iGBZTVi6vBYIgll4rtvd5AhAF
 cwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pRV7mqfMaKb7/SwKxjrezlXdNmvbN1KHw2x4aibLFRI=;
 b=ahgBfRF7NKEzz4aZl8b2hWSqE0tY4bRCzwM9whoUQxBx4S0Johlamlc6mhDuGLSPRw
 /LEZ8pFotsy52slKMxArgheKLxksbSoncUz17Fp+33wqBbHJgIphmHpv6O+lw0MxjER9
 2olKMJODrB83DbXS45657+ATThj044Zzi93J92pexnmu2zdb6TsmzvReh/4D7FSuro+M
 FAq47RbrQnpUwkX07K8pFxooLwkvExa5y3kxbkZhwj04iRVI1hIaasEZD1ZnQHlVmaA1
 CLcSoNIHuBIbvoqEp5Nlg6OIGEcYzlyM1OERIUyrewNo2xAJ32byZqIZnGZ3Bz08/e+5
 ewgw==
X-Gm-Message-State: AOAM531JGy0XkIX1syHZq9/+QPaQ3+pBr3YuAGhs5KmvhLc6f5vNr+x+
 Np9y5/8RcsXM6Cw27pn3/YIYHnedDbpsZw==
X-Google-Smtp-Source: ABdhPJxPXDc251sCewm1tK19PRcweRqFUM1OqEe2ReRyyY+qC+HZa45H7p5nuww6RaenaKIplVBxUA==
X-Received: by 2002:a17:902:dac2:b029:ec:7fcb:1088 with SMTP id
 q2-20020a170902dac2b02900ec7fcb1088mr17509675plx.65.1619997547008; 
 Sun, 02 May 2021 16:19:07 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id k17sm7146236pfa.68.2021.05.02.16.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:19:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 28/28] tcg: Move tcg_init_ctx and tcg_ctx from accel/tcg/
Date: Sun,  2 May 2021 16:18:44 -0700
Message-Id: <20210502231844.1977630-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502231844.1977630-1-richard.henderson@linaro.org>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These variables belong to the jit side, not the user side.

Since tcg_init_ctx is no longer used outside of tcg/, move
the declaration to tcg/internal.h.

Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h         | 1 -
 tcg/internal.h            | 1 +
 accel/tcg/translate-all.c | 3 ---
 tcg/tcg.c                 | 3 +++
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index a19deb529f..eef8857cca 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -690,7 +690,6 @@ static inline bool temp_readonly(TCGTemp *ts)
     return ts->kind >= TEMP_FIXED;
 }
 
-extern TCGContext tcg_init_ctx;
 extern __thread TCGContext *tcg_ctx;
 extern const void *tcg_code_gen_epilogue;
 extern uintptr_t tcg_splitwx_diff;
diff --git a/tcg/internal.h b/tcg/internal.h
index f9906523da..181f86507a 100644
--- a/tcg/internal.h
+++ b/tcg/internal.h
@@ -27,6 +27,7 @@
 
 #define TCG_HIGHWATER 1024
 
+extern TCGContext tcg_init_ctx;
 extern TCGContext **tcg_ctxs;
 extern unsigned int tcg_cur_ctxs;
 extern unsigned int tcg_max_ctxs;
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 0c818c3618..25f5be1c4f 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -218,9 +218,6 @@ static int v_l2_levels;
 
 static void *l1_map[V_L1_MAX_SIZE];
 
-/* code generation context */
-TCGContext tcg_init_ctx;
-__thread TCGContext *tcg_ctx;
 TBContext tb_ctx;
 
 static void page_table_config_init(void)
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 212df31622..e4e2985276 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -152,6 +152,9 @@ static int tcg_target_const_match(tcg_target_long val, TCGType type,
 static int tcg_out_ldst_finalize(TCGContext *s);
 #endif
 
+TCGContext tcg_init_ctx;
+__thread TCGContext *tcg_ctx;
+
 TCGContext **tcg_ctxs;
 unsigned int tcg_cur_ctxs;
 unsigned int tcg_max_ctxs;
-- 
2.25.1


