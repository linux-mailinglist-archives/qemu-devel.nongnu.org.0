Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 156FC3B88F5
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 21:05:06 +0200 (CEST)
Received: from localhost ([::1]:60280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfW8-0000m2-5x
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 15:05:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0t-0005Xg-JU
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:43 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:36505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0q-000269-Nl
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:43 -0400
Received: by mail-pg1-x52b.google.com with SMTP id e33so3206977pgm.3
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q7Ia+ie6XOcjpcC/dD6Ub5PbrcGQ/yV9nqv+RZL1T9E=;
 b=GdyoU+pDjgC5vaOIFMPFPUzeA4XDK1U2IbSm0CjZKckHXgoDFxl87b2v5PfcFyMzGv
 p4GEg5P117AM8ysRPeVnZKuLTOoynPSxIjylJYdkdobwd40J8ApFLpdCvyCSL5fQcUV4
 8siXASKGrDvwMb3tU6YJvPsdkK7UC3hwLFKklvaDYyYUun7PVrYV4by1oQEfED5V74hy
 1lgmOfm3qMJQG4q2qHtcAEDztAFx+BwX/kFDV00zIeS/SE34N0OisOl44IAwVwVTckP8
 PcKYdpxBLwGRBMi/LBN0K6ePDsjcSQHVoa7rJ2VVcSTtTsZyhvvyar8U1oWjNCLIFegp
 qBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q7Ia+ie6XOcjpcC/dD6Ub5PbrcGQ/yV9nqv+RZL1T9E=;
 b=S6eySFVe33ItExAzEgMGOrf/IyhN7d5VWtQigYbkVTPz9N/V1hRiT9rHMQ6gz6jzWn
 IMrZCb17XyCwYIUKCjnSAqPjRqQf5reHlrnG0zxFKsWInI6fzs9xpuPvzGGSRxX/uwi1
 SYYd4Zq0pUzA6k4/hS5urEZJ4oqjQAgpPwrfhZX8icvKlWsZ70LrgTUdVOCnFfR+rDTS
 wcu3Kl5VhRvtm2JEMTDki0zwWaRNWJ8QU/n7ot8maCIQtnbzcgdQapkhIiYfrluPKGNY
 vIlkR1xicpLExIraTakpxnLZU4TlYMtks321xFc8tRz/d9oqMXz6awGBw606pCyT2Yt/
 Uikw==
X-Gm-Message-State: AOAM533xN0rTVIWtr0vshNbucpIoacnpWnBPOjW69p6S1Da5OVit/5zq
 hWpa4iECHg1cvSsh2XQThOA5bS0dcEwZrQ==
X-Google-Smtp-Source: ABdhPJxH/gRyFC0/w0iiIBZAYCZdinxvdFfiCKOWQR8ASl80QZNawjR5pkAZZyM10k6WhuqDQUWWgg==
X-Received: by 2002:aa7:8d5a:0:b029:302:e2cb:6d79 with SMTP id
 s26-20020aa78d5a0000b0290302e2cb6d79mr36886657pfe.71.1625077959472; 
 Wed, 30 Jun 2021 11:32:39 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m18sm23909517pff.88.2021.06.30.11.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 11:32:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/28] target/riscv: Use translator_use_goto_tb
Date: Wed, 30 Jun 2021 11:32:18 -0700
Message-Id: <20210630183226.3290849-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630183226.3290849-1-richard.henderson@linaro.org>
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
Cc: Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just use translator_use_goto_tb directly at the one call site,
rather than maintaining a local wrapper.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 62a7d7e4c7..deda0c8a44 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -168,29 +168,11 @@ static void gen_exception_inst_addr_mis(DisasContext *ctx)
     generate_exception_mtval(ctx, RISCV_EXCP_INST_ADDR_MIS);
 }
 
-static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
-{
-    if (unlikely(ctx->base.singlestep_enabled)) {
-        return false;
-    }
-
-#ifndef CONFIG_USER_ONLY
-    return (ctx->base.tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
-}
-
 static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
 {
-    if (use_goto_tb(ctx, dest)) {
-        /* chaining is only allowed when the jump is to the same page */
+    if (translator_use_goto_tb(&ctx->base, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_tl(cpu_pc, dest);
-
-        /* No need to check for single stepping here as use_goto_tb() will
-         * return false in case of single stepping.
-         */
         tcg_gen_exit_tb(ctx->base.tb, n);
     } else {
         tcg_gen_movi_tl(cpu_pc, dest);
-- 
2.25.1


