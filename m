Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E46F33AF96F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 01:33:02 +0200 (CEST)
Received: from localhost ([::1]:45946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvTPZ-0006xW-LM
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 19:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTCB-0001Hc-U3
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:11 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:50707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTC5-00061h-N6
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:11 -0400
Received: by mail-pj1-x1029.google.com with SMTP id g4so10911004pjk.0
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 16:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jZ+vu44B3MA2rQDPHlYV5+XUBqzkPAnWuZi1J6wYDao=;
 b=fvRUQUExehKyuom6BcYiv/jXENph20unEftdPqTkJmY+tQU7NAi6QvQ44OJK9bD80P
 QlpaCWgryZ2oTJawcFuHda1/S4TzN3l3GtSKlkP2ozzsPlTa0URHc9H+IbaQmWsWJQjT
 IAhNtqap03MdzfC40jcfD39+02U9we9dT8yspRK/y3AOCACawEQowHWLlArXb3Jw0RIl
 4Ak0oBvygSjDgnFzx2Sy2Fi4gmawuux1czF+DhwL80APXqUS812D7Evow7N7vuxoyBwJ
 z27QSgImPDeH3pHegrb5w6zZGCBBNcHW+5tbNXq1o96L+UfUfcestqPvLMKGPTI7GhGX
 epAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jZ+vu44B3MA2rQDPHlYV5+XUBqzkPAnWuZi1J6wYDao=;
 b=qI6khg2ASkpAMCtkxycxu5eroYYxqUCm3pEFf1YaYu7dIV7feAZbJVvk9/Yjc9gemG
 kb2A2SvMI9aNdvuX3yoQSmbtueSQscBUUxFY/W/xoduTK5JPOy2Q8o88ZQAH15WqEavf
 jMwgybNktjqlLYMXUQt6tU1fRs30bwGNtOyYXsGUdjiqlqbd0vtmJMdVRsdqgIBtGZ44
 ACvAwaMovanrg8ZL2VK00pcP0Z7FHj7G+AUixCaRReaB8JHL/ly9yCcWVzLd865HxtnQ
 wtk6ojCQ4GRPvnHN6Xg7vmfF4fwx4b5XfkF+d97Zu1DrDBBNx0qk9t5FUWvcLwRGlW9q
 uhQw==
X-Gm-Message-State: AOAM531GPVx45YGE+Tis3ronK1NpDO7ZhdkCA8HtehxyjDze52tctAT4
 laSj7JHc+moaObe4GzHFaIuDo9/t1kISFg==
X-Google-Smtp-Source: ABdhPJy7AerozvLhPkfpGImcfdSnDfNS4Z9m/OlGf74LoP0sFSqCSTN2XvcGRyg4DXRwxCvndWk7sA==
X-Received: by 2002:a17:90a:5408:: with SMTP id
 z8mr672061pjh.144.1624317544360; 
 Mon, 21 Jun 2021 16:19:04 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 135sm14429952pgf.20.2021.06.21.16.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 16:19:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/29] target/arm: Improve REV32
Date: Mon, 21 Jun 2021 16:18:41 -0700
Message-Id: <20210621231849.1871164-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621231849.1871164-1-richard.henderson@linaro.org>
References: <20210621231849.1871164-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For the sf version, we are performing two 32-bit bswaps
in either half of the register.  This is equivalent to
performing one 64-bit bswap followed by a rotate.

For the non-sf version, we can remove TCG_BSWAP_IZ
and the preceding zero-extension.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index f2641a37ba..304fd3d370 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -5430,22 +5430,13 @@ static void handle_rev32(DisasContext *s, unsigned int sf,
                          unsigned int rn, unsigned int rd)
 {
     TCGv_i64 tcg_rd = cpu_reg(s, rd);
+    TCGv_i64 tcg_rn = cpu_reg(s, rn);
 
     if (sf) {
-        TCGv_i64 tcg_tmp = tcg_temp_new_i64();
-        TCGv_i64 tcg_rn = read_cpu_reg(s, rn, sf);
-
-        /* bswap32_i64 requires zero high word */
-        tcg_gen_ext32u_i64(tcg_tmp, tcg_rn);
-        tcg_gen_bswap32_i64(tcg_rd, tcg_tmp, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
-        tcg_gen_shri_i64(tcg_tmp, tcg_rn, 32);
-        tcg_gen_bswap32_i64(tcg_tmp, tcg_tmp, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
-        tcg_gen_concat32_i64(tcg_rd, tcg_rd, tcg_tmp);
-
-        tcg_temp_free_i64(tcg_tmp);
+        tcg_gen_bswap64_i64(tcg_rd, tcg_rn);
+        tcg_gen_rotri_i64(tcg_rd, tcg_rd, 32);
     } else {
-        tcg_gen_ext32u_i64(tcg_rd, cpu_reg(s, rn));
-        tcg_gen_bswap32_i64(tcg_rd, tcg_rd, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
+        tcg_gen_bswap32_i64(tcg_rd, tcg_rn, TCG_BSWAP_OZ);
     }
 }
 
-- 
2.25.1


