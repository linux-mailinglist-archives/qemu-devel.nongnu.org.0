Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C38083AE18A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 03:48:36 +0200 (CEST)
Received: from localhost ([::1]:48310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv93D-0006fg-RY
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 21:48:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8qD-00045B-DI
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:35:09 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:38604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8pw-0005Dj-Iz
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:35:09 -0400
Received: by mail-pg1-x529.google.com with SMTP id h4so1303296pgp.5
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 18:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O6AUcaQKGYp2fnjEQWNm+lyORkEWoJzEefRINwnH5dY=;
 b=u3xxZLScRlSx0Ro0I4YZJHaWX2MDKXN2uW7NENwfTZJofE1oDD1iwRRdEtsMD/5F6K
 aynU7r+1RTs63pw7s6vnwzvhRQYlijyW+x3clSgpHWzM14py2b5Sdly7She0wgnCVH1C
 O6Tt6dD0ajTcgPi9DKrTlpNoI8Fgo43VnPOpMZXEDw7mghtBe1iV1rO2aoU9AZl3Us2R
 4BZkJaxLYAvvkTOx3B3ZV5qkuWpQaAi56ExDZmbdZxnkybQQ/CzCgqDWKrUVmCMRkIXl
 1SiptWZp5IuGOPSiXHPz+M0JdCEn87lilNgrRWJRiDvrNrcCd7KJoy+NduzN+EQo+Uq1
 6mmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O6AUcaQKGYp2fnjEQWNm+lyORkEWoJzEefRINwnH5dY=;
 b=ENO6BHVqCpJmTHEqlxn2SfMPdnGlBrO6+xiTnQEv3bh8qNEu6hav+CcjJ8O+La9ZQU
 Xhkv2PvB0IbJiSXwNaci3aYQOoCsE8z5Ri5xgLNneioQI5/XYuRcwUc35p/3809WG/fJ
 nNtUqHCuhtun5wmh6MuekhRtL3bpzA4QYEzPwVgjMOfHGXE3yMhjB93t/hAPP2+Tr47Q
 Mtai/+Okh7W3ZoLFVwjJcLCDdKqkNk2wWsFTGC3SwS6jMcQ2v+87OMDRi3n94nIo+n0/
 iS3aKFp4D5XYMDSFiFV2e1T3tbQI09N+06eKW+hEFpucOV4Jo2NdoX5Iq1EcWlUm3OMt
 Z36Q==
X-Gm-Message-State: AOAM5324BOQGItk/1VJnbgQT+qyvG0dGlDemd0/LrTa4Ohv9iV72jEv1
 mYeU870/5dC7TrpnMMqlp0ibs8wL5k69gg==
X-Google-Smtp-Source: ABdhPJyCiF/MCYb4UxvuuNFNQogMfa8yO/+vQm3xZChwByl5pzc63fYIuTj4d722Twi/Ym+cAIosmQ==
X-Received: by 2002:a63:ff20:: with SMTP id k32mr21772363pgi.82.1624239291358; 
 Sun, 20 Jun 2021 18:34:51 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id s27sm1495628pfg.169.2021.06.20.18.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 18:34:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/26] target/riscv: Use translator_use_goto_tb
Date: Sun, 20 Jun 2021 18:34:31 -0700
Message-Id: <20210621013439.1791385-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621013439.1791385-1-richard.henderson@linaro.org>
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just use translator_use_goto_tb directly at the one call site,
rather than maintaining a local wrapper.

Cc: qemu-riscv@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index c6e8739614..ecd3764338 100644
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


