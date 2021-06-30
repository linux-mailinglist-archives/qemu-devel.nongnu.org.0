Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B95AF3B88AE
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 20:46:45 +0200 (CEST)
Received: from localhost ([::1]:38242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfES-0008Tl-NR
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 14:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0k-00055w-3e
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:34 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:40455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0i-0001yp-6y
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:33 -0400
Received: by mail-pf1-x42a.google.com with SMTP id j199so2860730pfd.7
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dZ0tLrfANOVxMWpkjlBjlY0SUk5qXlMLl88Ghw1NubI=;
 b=RwZsGG2QOkBMwGuAF4pYiDvR00hb7nSQlTyO5J0n0/xrlu9I26UWxigbt00OV7pP8g
 NZYOWJEACf3gdSQxeQ48qT4o0uh0yCaK+WOY9EO9A7yNIwqtWQZ5g0G2HBxDqh+nNPx+
 F98eg+fWFFCPGyL5fzwZk0kZFhSOl0YluRKi7eWHmOS6lMwdRQSsrqxjojLtxF1R2q5L
 nHxJtF5PAn3rd0ZVvVW+3VoqJRe86XqzekLa3XNsEPgfB5PJ23Vv7qjuduK8uAHET1yb
 sZWZH+NGoYCJFX/u+/kJ5opJp7A3qXx6pLdSuVBLJh5eV0SI4K4cGbGrWhGcGnpwH+f6
 0yaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dZ0tLrfANOVxMWpkjlBjlY0SUk5qXlMLl88Ghw1NubI=;
 b=FgEHZYEc3ti408lZ2BoKW0xWoLUzFY9XM2VO/QYfARqGmL6D5yRcQ52xmAyvUKoDoP
 LieKY46Krlk4rcBzEq00gKLa5aQmeWYtGowVs0L9VxCK5oy3FGONrZEygdUPzHLs4FqK
 4W3Y40bNj+W13hiDndCGiK2YUPQT5HSN9c5X9NjLl2sB9yo5elcrLb53eGg7BiLeVLw+
 VPuDeopiu7k0C+yzru6WcUJNXlkmHF16nl249pH7OxOmms6bmGpTcnQW8ZcWnxagaZH/
 y64uGmkaSD424WmtsUuwCKMES0dBIWTmyMksct43WrD5SVsKJ84+PebHuhrV24kZutX2
 dTow==
X-Gm-Message-State: AOAM532oFoi4TLdN26QLL9F8jYX1WlAmiduuc7acJzlSIuRyU7xssv6I
 N0jS8562Bcu4qYsLidBypXIKUiYfUovxXA==
X-Google-Smtp-Source: ABdhPJxEr4KGH9s7GuAfKZEcLUER01Vqy1LpFOR1Mn7Zw/ZgjkKYU/NSLAoXkD+I54b/CYYFoi6pqA==
X-Received: by 2002:a62:3344:0:b029:24c:735c:4546 with SMTP id
 z65-20020a6233440000b029024c735c4546mr37827189pfz.1.1625077950953; 
 Wed, 30 Jun 2021 11:32:30 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m18sm23909517pff.88.2021.06.30.11.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 11:32:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/28] target/arm: Use gen_jmp for ISB and SB
Date: Wed, 30 Jun 2021 11:32:03 -0700
Message-Id: <20210630183226.3290849-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630183226.3290849-1-richard.henderson@linaro.org>
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using gen_goto_tb directly misses the single-step check.

Cc: qemu-arm@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index a0c6cfa902..8cd31feeaa 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8582,7 +8582,7 @@ static bool trans_ISB(DisasContext *s, arg_ISB *a)
      * self-modifying code correctly and also to take
      * any pending interrupts immediately.
      */
-    gen_goto_tb(s, 0, s->base.pc_next);
+    gen_jmp(s, s->base.pc_next);
     return true;
 }
 
@@ -8596,7 +8596,7 @@ static bool trans_SB(DisasContext *s, arg_SB *a)
      * for TCG; MB and end the TB instead.
      */
     tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
-    gen_goto_tb(s, 0, s->base.pc_next);
+    gen_jmp(s, s->base.pc_next);
     return true;
 }
 
-- 
2.25.1


