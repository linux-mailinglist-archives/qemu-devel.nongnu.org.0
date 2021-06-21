Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6A93AE171
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 03:39:19 +0200 (CEST)
Received: from localhost ([::1]:48198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv8uE-0003yZ-RK
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 21:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8q2-0003sx-Ky
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:35:00 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:34752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8pu-0005CB-0k
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:34:58 -0400
Received: by mail-pf1-x431.google.com with SMTP id g6so12427360pfq.1
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 18:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lDoRcLaC7/1E4QoRTMLY4EqhrZiViuK6qiqJLkoqpZM=;
 b=H6QBidGwrGYXr/4GpMfmLe4fynoP8jjiU6a0oWcXUaQnE145byLrV3YSN/NeGJlrkC
 nIo03mdJZqD90AlhK3eN5iiiP1LZAbCZyzZO8C1msnYH7UC0o08Zibx4IA0xE5Vr5bKL
 OGTpW6vwe4eeTYnXULxYpXD/amjln51VtpnE3pvndS6ElSTomPHTyOaxGnqrUv6NUlfR
 RO+nAW6MgEa1kHE1E2DDv8j6N4DNvDKOpmWgGfDBFJ8YHG5LHhFAtAA90vailn6kByQr
 qgI2YNfLrz4wRbsZrN0bc1ItOrzfzDMmtr8e5bLaVrCkxO5pOqyipDwaDn6tdRYD8xUF
 2HVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lDoRcLaC7/1E4QoRTMLY4EqhrZiViuK6qiqJLkoqpZM=;
 b=hYjL6M1aUQQd84t+51Vg9rL6Oac1afxXJDe00DSjfUJ8YLovyuGMQzuuemswe3p48N
 NZ50RlOJjwCh6xgPAF8MexLdweN8gYKCkNSfR9POolSgG0OCOREJDMnIE5ZhpIqaPl9Q
 zffTKKlRwomDr3yST91uV0gzUn7yVHPnSJWI1tRQs8ch/E888Vs2WcInJnFnrZXFFmG+
 whaMwLsTowdIjABTnm7B5rmnueiXr/7xTBmijVoTgsuKRCqJMyuMIIzQvuAYeSNVQnNw
 H02HBjnpMIJYQaD9H0WnbX9zR4lZo1Z12G/YbFHJfwpVoqkKFYu5sHzF/r/x8+le5T5t
 BnMg==
X-Gm-Message-State: AOAM530yaQ3TkS7UTAz5O2uYaiK/Dhlft3KlFJAs/7jdYLaRWtHYcYDQ
 BtWUX3qVthq6EJFoEoLxtcsMigHISNAIrg==
X-Google-Smtp-Source: ABdhPJyCHkibWk0NhXsBmA5AA3qznjpmDA/ABSe/Q/F4YeNaNuy3fuY8N/egbNDVYPQlX42O2Lla2Q==
X-Received: by 2002:a63:471f:: with SMTP id u31mr21575144pga.85.1624239287875; 
 Sun, 20 Jun 2021 18:34:47 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id s27sm1495628pfg.169.2021.06.20.18.34.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 18:34:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/26] target/microblaze: Use translator_use_goto_tb
Date: Sun, 20 Jun 2021 18:34:25 -0700
Message-Id: <20210621013439.1791385-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621013439.1791385-1-richard.henderson@linaro.org>
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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


