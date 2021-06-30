Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 775C23B88C8
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 20:53:47 +0200 (CEST)
Received: from localhost ([::1]:56672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfLG-00047z-HS
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 14:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0p-0005IS-M9
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:39 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:33529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0n-00023N-6G
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:39 -0400
Received: by mail-pf1-x435.google.com with SMTP id s14so3383803pfg.0
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lDoRcLaC7/1E4QoRTMLY4EqhrZiViuK6qiqJLkoqpZM=;
 b=xrF/rEgIZ8k3GoWRFbCJDS34TAkZPl/yEBkbSTjTBDYPIvkS7kO5UwjbJoX3wh/42i
 yzmepRrLiOEvIphmiYaPPNNYmhkrdXpjCEH4JnI8nyQuvrtaDjlmPan5rh40cG5RZZWK
 36qSeraJ3+ed2WLjRm8S2y8JzWuNg4PqcOGSPZ1duRy0kQbHJEUPJCJsdynGgTHAnWe4
 p0ZsLiX3a5rkRn8MOTFeI7KePgc2W4R/7G7WI/4XvnTky/Lq4hM8gapomPQMW6BKybsh
 z7fxehJkcDK0LrPgXkR8b3++tFVlTbRJaa9Jp0Mz8xjlFpm1kHPFIBuub175MUmQsSYP
 qK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lDoRcLaC7/1E4QoRTMLY4EqhrZiViuK6qiqJLkoqpZM=;
 b=Y1ct/R9s0Pbq/QhK7/hDPOWxJ5JiHttg6QefCUzJ5oPm5cKXExc7NyncYGejXuvoG5
 LalZp76UP5WhuW3Q4cZ9EGmtFUfDmfA9yEYYQgDTD6Y1pIXbQU6yGPExnQF6HAoiIzzt
 g0VO0tFssqo0XoUfp0MDMT08u/A7MYpHrYPEJPYU5KztiqyBSAryesbQjdb39kboJ8/K
 HUOX0zhh3IEmLryU74Qdt4/ZecCfRdrb/jLvkLESGrUHknilfahRYOtLB9rcm3gVVr+3
 frnTpPKgNbBtXu6jSnwmyJRdfHFu9TenhcRBg+uiC4mvNfM5cHYWrl57aOTkcVKlHQ/v
 YGVA==
X-Gm-Message-State: AOAM530TXkrhMfhXpiurYCWnZTT+RN4V96zWBxCMUNOWUDhXD29KRkdu
 QZPGVgo09QW2xnrqaXsL+HUdsu/V16TecA==
X-Google-Smtp-Source: ABdhPJwH2zm3FqA+kDgWW70vrV1ti7kxWzO+gJThOcaJR5XzVZ5+VRY/ePPpRjW2XO2Hii+uob7wlQ==
X-Received: by 2002:aa7:828f:0:b029:200:6e27:8c8f with SMTP id
 s15-20020aa7828f0000b02902006e278c8fmr37139676pfm.44.1625077955986; 
 Wed, 30 Jun 2021 11:32:35 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m18sm23909517pff.88.2021.06.30.11.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 11:32:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/28] target/microblaze: Use translator_use_goto_tb
Date: Wed, 30 Jun 2021 11:32:12 -0700
Message-Id: <20210630183226.3290849-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630183226.3290849-1-richard.henderson@linaro.org>
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just use translator_use_goto_tb directly at the one call site,
rather than maintaining a local wrapper.

Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/translate.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index c1b13f4c7d..b753f080e7 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -125,15 +125,6 @@ static void gen_raise_hw_excp(DisasContext *dc, uint32_t esr_ec)
     gen_raise_exception_sync(dc, EXCP_HW_EXCP);
 }
 
-static inline bool use_goto_tb(DisasContext *dc, target_ulong dest)
-{
-#ifndef CONFIG_USER_ONLY
-    return (dc->base.pc_first & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
-}
-
 static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
 {
     if (dc->base.singlestep_enabled) {
@@ -141,7 +132,7 @@ static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
         tcg_gen_movi_i32(cpu_pc, dest);
         gen_helper_raise_exception(cpu_env, tmp);
         tcg_temp_free_i32(tmp);
-    } else if (use_goto_tb(dc, dest)) {
+    } else if (translator_use_goto_tb(&dc->base, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_i32(cpu_pc, dest);
         tcg_gen_exit_tb(dc->base.tb, n);
-- 
2.25.1


