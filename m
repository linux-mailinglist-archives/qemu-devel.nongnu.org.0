Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8071C3AE154
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 03:36:40 +0200 (CEST)
Received: from localhost ([::1]:39644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv8rf-0006fC-Au
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 21:36:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8pv-0003jv-M8
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:34:51 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:45824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8ps-0005BB-DF
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:34:51 -0400
Received: by mail-pg1-x533.google.com with SMTP id y14so1402908pgs.12
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 18:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cH+sdopDqg3AA/XmKjvzj97BFIKh2FfG1/i/yI9Y2V4=;
 b=zk4xhm4feVb+xK3F4e11ZLuwU7VudoskD1fKArb/lYaaXA3eyYQ3Iy6zcdnWp8n69a
 33rVAamHYpZ3h+fgIWZVnPL7LtqP8mmpZeLEFYO/MesIn8TatVl7aB2n9yM2sNZwcaU2
 9eXgKEnfY4tGibFDF/kGZXZ0opDUxX7wueoCBTAQViN8Pj5E7n/PRrzEOwWqdmlseVDy
 6DT5C5ilXVE/MvWHViRjlR7yAtmhQOaB+8OKUbfVL5nLHEkgj62VwnrT97q1vecbBgB9
 l8ISh1bz52wxYM/0CSbqdKffT02J0mEfN2mGYQhhjhA7L7TK61yx/1MdQdoONiAsRWZe
 6d9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cH+sdopDqg3AA/XmKjvzj97BFIKh2FfG1/i/yI9Y2V4=;
 b=mumcvV7srwwKE2cBEQSk9NhpEPKwhAw+BTh3OdNBo6bBkkeWoIWlr3YG4usIKZ3jlJ
 rUkp1HZpbeqZMnZoAxrANpUux9Ak1uH5pq0f6QgrQ2bvcCq2xHMG51jTGoY1m8/wjoUv
 P9FzVrwI5CGB0pK2+9C3NwpNOHdsS9wsm8fkSYAe0SZtp609kk5igYcjqOKkjAkfHP0g
 wkMvGpz8i+16GNc+AzYZecX0rtSPM/m5uh7/eKNOL2a04QCD+TooWMK60MQvWKzrSkcI
 7zXbdqYIrHbeSjjPZRwLJu0TxYIXgmXlWg9J2Ysh8k4x3lNJoj7tRcKapLI6dqjOiNaO
 OQRg==
X-Gm-Message-State: AOAM533C9YhtJZve6wkI7vIhLIwrQH2xEk/S3NeULbC6/xnPR8j0frgU
 Ciyqy04QywkD7rhbQ3xwrsmAE7qACaw1vw==
X-Google-Smtp-Source: ABdhPJzJxptMwBtF0caquzPKlUuKVXWKFbI3xmd1zjpEz9PhafHgLPta7hf6hC6hPbFYnEWKCRAn8Q==
X-Received: by 2002:a63:b60c:: with SMTP id j12mr21757569pgf.393.1624239286198; 
 Sun, 20 Jun 2021 18:34:46 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id s27sm1495628pfg.169.2021.06.20.18.34.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 18:34:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/26] target/hppa: Use translator_use_goto_tb
Date: Sun, 20 Jun 2021 18:34:22 -0700
Message-Id: <20210621013439.1791385-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621013439.1791385-1-richard.henderson@linaro.org>
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/translate.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index 64af1e0d5c..952cfe09a6 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -817,10 +817,7 @@ static bool gen_illegal(DisasContext *ctx)
 
 static bool use_goto_tb(DisasContext *ctx, target_ureg dest)
 {
-    /* Suppress goto_tb for page crossing, IO, or single-steping.  */
-    return !(((ctx->base.pc_first ^ dest) & TARGET_PAGE_MASK)
-             || (tb_cflags(ctx->base.tb) & CF_LAST_IO)
-             || ctx->base.singlestep_enabled);
+    return translator_use_goto_tb(&ctx->base, dest);
 }
 
 /* If the next insn is to be nullified, and it's on the same page,
-- 
2.25.1


