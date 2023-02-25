Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B546A27FF
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:00:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqPU-0000Oy-BX; Sat, 25 Feb 2023 04:00:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPR-0000OS-M9
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:01 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPQ-0004pk-4i
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:01 -0500
Received: by mail-pj1-x1033.google.com with SMTP id y2so1393718pjg.3
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 00:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XU8chpWpCvoR0LbgkNVM0m0xLd7d7yoa5DmO6k+5Uys=;
 b=GgoEsvJSMZTe9dbbA/yKWxjEYIhMIKA3wmJsrllL7XhwU9CFhdB4sIgIJJbkM3apOf
 Xg/uIbVp0IWqGGAFYYbRHx8NyF+bo4SVRzPfNESKd7jVoWwrwJCF2y/h2Bnb+kicnLNf
 tgzlvyx71scF33sjLKfsO8g9VFyQYwkO13LemgZnMN+d5ZyvDZFY3DgHXyLAFTZjGkea
 6VEk14ESqmZpZSFcLC0xPRJP80e2RkyE3+najUyDrsoefnRkMfxJ/920aAb7UHwBu3Om
 ZOFzWtPZmNSB/DpyMxIDfSvITIjQACi57K76qdmdQwXDig8Gb9TLSXgNhpreXsE4asv2
 xp8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XU8chpWpCvoR0LbgkNVM0m0xLd7d7yoa5DmO6k+5Uys=;
 b=x2M45POPT5qHvFDXP7IE084Qsvlwq1xyKBqYPkadmYmTXHNjKa127i2L14h2D6xQlZ
 Eyn60/ZlbhT4L8L4ay6z7NLIvixSgJYoCuPkBLjsaZjI6tgV+eakMd6a0F+iX19jIBs5
 zzG0xO/dxXoq9izCMhZ3DDtn70LRCzijIoQS1+ZEbY1XkTzPWhyRe+Z6ajWlWoZzknCm
 RVNPxX7tgYTJPGoQaqfC05SHiYep5XE0oDM4n1CgmGK9vfCeknb4iUoBMyeknnzQj1nE
 y435lED41KGW0JL3JTtp0Udx+Ugd+Y1AqmizlyDl0s3ACzp2Vh7BYkonXlBVdt6mSbAu
 8Pzw==
X-Gm-Message-State: AO0yUKUwJJoDGd8zVkhbLix6Dw1TN+xo7+iLR9B/FRL+hOU2fSoKuev4
 wzzCR3D3rpwjW1x6XEKFtN+sq9pygGctCBiosLE=
X-Google-Smtp-Source: AK7set/9DrAKGzPlIWUTvfNgBovpy1rTyNddT5Mny1MoCBB84fNqEwiJ5ExABWqiV25nQD1baBd+VQ==
X-Received: by 2002:a05:6a20:3ca6:b0:cc:8e18:420f with SMTP id
 b38-20020a056a203ca600b000cc8e18420fmr4495554pzj.35.1677315598614; 
 Sat, 25 Feb 2023 00:59:58 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a639251000000b00502ecb91940sm715546pgn.55.2023.02.25.00.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 00:59:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 06/30] tcg: Use noinline for major tcg_gen_code subroutines
Date: Fri, 24 Feb 2023 22:59:21 -1000
Message-Id: <20230225085945.1798188-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225085945.1798188-1-richard.henderson@linaro.org>
References: <20230225085945.1798188-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

This makes it easier to assign blame with perf.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index bf2af8b0fe..7ee935701a 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2636,7 +2636,8 @@ TCGOp *tcg_op_insert_after(TCGContext *s, TCGOp *old_op,
 }
 
 /* Reachable analysis : remove unreachable code.  */
-static void reachable_code_pass(TCGContext *s)
+static void __attribute__((noinline))
+reachable_code_pass(TCGContext *s)
 {
     TCGOp *op, *op_next, *op_prev;
     bool dead = false;
@@ -2860,7 +2861,8 @@ static void la_cross_call(TCGContext *s, int nt)
 /* Liveness analysis : update the opc_arg_life array to tell if a
    given input arguments is dead. Instructions updating dead
    temporaries are removed. */
-static void liveness_pass_1(TCGContext *s)
+static void __attribute__((noinline))
+liveness_pass_1(TCGContext *s)
 {
     int nb_globals = s->nb_globals;
     int nb_temps = s->nb_temps;
@@ -3200,7 +3202,8 @@ static void liveness_pass_1(TCGContext *s)
 }
 
 /* Liveness analysis: Convert indirect regs to direct temporaries.  */
-static bool liveness_pass_2(TCGContext *s)
+static bool __attribute__((noinline))
+liveness_pass_2(TCGContext *s)
 {
     int nb_globals = s->nb_globals;
     int nb_temps, i;
-- 
2.34.1


