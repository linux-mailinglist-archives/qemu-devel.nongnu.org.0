Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6183F51CB
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 22:12:39 +0200 (CEST)
Received: from localhost ([::1]:41508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIGJC-0000bi-MA
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 16:12:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG33-0006li-La
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:55:57 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:40492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2s-0003DP-PY
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:55:57 -0400
Received: by mail-pf1-x42f.google.com with SMTP id y190so16336066pfg.7
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 12:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=erW/Z4JYuVhr9ybl+97WBWpdvdUJXOnO/CYzIxcKmVA=;
 b=noZpCMBBnP5pxyOs01BTsfeMFKRBxHpi8ps2+LH62gTAUfLBPuvwX82NWIUyh7tq7V
 0xAC60E9doOD6b0dfzli9aoosxY1bAkLT0fukNc/qavDHNDu5yEaRgyI/SmYOJpMechu
 8ykcDloMOFblU/gcnLbYD6jgmO092K3eqD9tJDJg2bZiTY1mv8N05Z6J0r9+iYjBbC/G
 R0K0d6we8vN9Y/Z6rqgr6YiG4wzLcVEyv7Xt0ZllNZJddM91un54iGZ7dJZiITCrYkFg
 xOmyG8AH3Sf9kSATLg6sEUnA2pXjJUpguz0trFde7Yf+hNjXVNHy0XbugQm3C1Eu9wKP
 6myQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=erW/Z4JYuVhr9ybl+97WBWpdvdUJXOnO/CYzIxcKmVA=;
 b=Q9rDnCBw5DZlBEoEF4tBMzZtRT3dJYfvtlfEkAfXBSR649cXmOJzZkJDiw4Lq5CsJb
 CdQFZ4wC1tIQFSEkWboj3kApEcFb7OVKkji+jZ0Bx/BFo6q2OshJL7uSCU1DD1QUX+lz
 ARX6BYnFGVbmb0WVSNw6rvQY9W14mzSbud0QRMFHuFYjxTOXW9o/4K53+ykoHo9PiZee
 YNOqq2/CTp4eSKAHX/khQSWurAbxnW/O9AGtfvrtqqc8urtdXY6JEUYaB+MLDVeiiwZq
 Vyq3xhfRBg4HH7l2/G83xMDAcUTAfWZKsDJocN9+7eAKNepEFX18muGXTwJ3LqnLF0Kj
 cFlA==
X-Gm-Message-State: AOAM531aUe+JdqvWI9wq1qVzZCmuh/a5Sca0a3Q/p5fgi2f4doLz/TaY
 ojVPi7jva82R44wWyiM0YSqLX04kY9+Xcw==
X-Google-Smtp-Source: ABdhPJwkJwYllxx+m1xBsBIo2Hr/6cZnxHjQ20+2H2yb8v64awT71T3SR+3ZxSV94xpLmICOyQU7Ng==
X-Received: by 2002:a62:7f0d:0:b0:3e1:bce4:1a25 with SMTP id
 a13-20020a627f0d000000b003e1bce41a25mr35710942pfd.0.1629748544975; 
 Mon, 23 Aug 2021 12:55:44 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v15sm16685078pff.105.2021.08.23.12.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 12:55:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 20/24] target/riscv: Use gen_shift_imm_fn for slli_uw
Date: Mon, 23 Aug 2021 12:55:25 -0700
Message-Id: <20210823195529.560295-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823195529.560295-1-richard.henderson@linaro.org>
References: <20210823195529.560295-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Always use tcg_gen_deposit_z_tl; the special case for
shamt >= 32 is handled there.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvb.c.inc | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index b97c3ca5da..b72e76255c 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -635,21 +635,14 @@ static bool trans_add_uw(DisasContext *ctx, arg_add_uw *a)
     return gen_arith(ctx, a, EXT_NONE, gen_add_uw);
 }
 
+static void gen_slli_uw(TCGv dest, TCGv src, target_long shamt)
+{
+    tcg_gen_deposit_z_tl(dest, src, shamt, MIN(32, TARGET_LONG_BITS - shamt));
+}
+
 static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-
-    TCGv source1 = tcg_temp_new();
-    gen_get_gpr(ctx, source1, a->rs1);
-
-    if (a->shamt < 32) {
-        tcg_gen_deposit_z_tl(source1, source1, a->shamt, 32);
-    } else {
-        tcg_gen_shli_tl(source1, source1, a->shamt);
-    }
-
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    return true;
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_slli_uw);
 }
-- 
2.25.1


