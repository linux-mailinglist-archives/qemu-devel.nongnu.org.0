Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEFF370FCC
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 01:28:31 +0200 (CEST)
Received: from localhost ([::1]:60788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldLVm-0003oW-5s
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 19:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMU-0008Dp-Gz
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:18:54 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:42879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMQ-0002qn-6m
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:18:54 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so2309720pjv.1
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4cZuoxcwQ6eXvc/QAg7Oih5qEjK3cLKB2wBaiFUenJA=;
 b=FTNlv1ZEPxIHdsw9/PcT6g8lFQtXzm4QImZKOKke+yIyO2Bjg+5jUivJHk9Qj9i0+K
 kifhEzWHyBYHzD/YR35ZMXfFKEVoiYGyDqP77uU067im+RfO4P8IBpqQgZuHIxHUhNVb
 OuB3wCDa6c/jWjw8wmV5yBVNjThlJN/yLQTbWORcWNRdDjanwiuqAvsVn1CtOZA0RGEd
 Mt7usMGanvItBxlBr2YO6d6C065+kMj8N296699Ovj26DM9c67spfSpooe6ajOyZcjn2
 kQb/OcliLttwiXxU1gyJuPXOiNtAQdrfvaGjliFNU9642E1qcIGDDJD3B7xNJOa+Zexw
 MNKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4cZuoxcwQ6eXvc/QAg7Oih5qEjK3cLKB2wBaiFUenJA=;
 b=E+AtAoFo5SCI7QoC1ZLT5zH2UbNnMoqSeW9uA5HtJhuSxdJ1cr8MPELbONoa35zB+x
 KHyJNaksZ5r45Fa9R44OKvpPmj9SXPa6CUTcbITLfpwZQLvPHGSL0pqxJvwNS6+szNpJ
 z8pVUH66f+4db+Io+dyj1K+nhmkoJHPSWap2hUJvvC4T7zeKPnZ4Vjb5T6iq1ttFeuW+
 R65MguNRfj2bLk//ZyboAh3n4U6moTrnhOOACt9GbhHYoTS7lRTWUa2agmni137CsPOS
 OezCwIz2CuGz2OpCpgOdx+dGfdeuXro52Vr8/SPvcelA/6fHagRkJSc0NRBUGMvS0Wrd
 PZwA==
X-Gm-Message-State: AOAM530zAtxWO7vlAekFJsd/vY6stzBQwkbFVhLkLqS86D0uftFM+rXB
 EvPpV+pckW7KJk+Qq8o4RPd394+++DwH4A==
X-Google-Smtp-Source: ABdhPJw+kRIj3qFV4bgY3mHMA0/nLrH3avNIg9P0YmdAFEsP3Bl05V5r7sSxwcTDaZ1fK0NptvQqHg==
X-Received: by 2002:a17:90b:2390:: with SMTP id
 mr16mr11196668pjb.133.1619997528983; 
 Sun, 02 May 2021 16:18:48 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id k17sm7146236pfa.68.2021.05.02.16.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:18:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/28] tcg: Remove error return from
 tcg_region_initial_alloc__locked
Date: Sun,  2 May 2021 16:18:20 -0700
Message-Id: <20210502231844.1977630-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502231844.1977630-1-richard.henderson@linaro.org>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

All callers immediately assert on error, so move the assert
into the function itself.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 795a71ff25..8b57e93ca2 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -723,9 +723,10 @@ static bool tcg_region_alloc(TCGContext *s)
  * Perform a context's first region allocation.
  * This function does _not_ increment region.agg_size_full.
  */
-static inline bool tcg_region_initial_alloc__locked(TCGContext *s)
+static void tcg_region_initial_alloc__locked(TCGContext *s)
 {
-    return tcg_region_alloc__locked(s);
+    bool err = tcg_region_alloc__locked(s);
+    g_assert(!err);
 }
 
 /* Call from a safe-work context */
@@ -740,9 +741,7 @@ void tcg_region_reset_all(void)
 
     for (i = 0; i < n_ctxs; i++) {
         TCGContext *s = qatomic_read(&tcg_ctxs[i]);
-        bool err = tcg_region_initial_alloc__locked(s);
-
-        g_assert(!err);
+        tcg_region_initial_alloc__locked(s);
     }
     qemu_mutex_unlock(&region.lock);
 
@@ -879,11 +878,7 @@ void tcg_region_init(void)
 
     /* In user-mode we support only one ctx, so do the initial allocation now */
 #ifdef CONFIG_USER_ONLY
-    {
-        bool err = tcg_region_initial_alloc__locked(tcg_ctx);
-
-        g_assert(!err);
-    }
+    tcg_region_initial_alloc__locked(tcg_ctx);
 #endif
 }
 
@@ -945,7 +940,6 @@ void tcg_register_thread(void)
     MachineState *ms = MACHINE(qdev_get_machine());
     TCGContext *s = g_malloc(sizeof(*s));
     unsigned int i, n;
-    bool err;
 
     *s = tcg_init_ctx;
 
@@ -969,8 +963,7 @@ void tcg_register_thread(void)
 
     tcg_ctx = s;
     qemu_mutex_lock(&region.lock);
-    err = tcg_region_initial_alloc__locked(tcg_ctx);
-    g_assert(!err);
+    tcg_region_initial_alloc__locked(s);
     qemu_mutex_unlock(&region.lock);
 }
 #endif /* !CONFIG_USER_ONLY */
-- 
2.25.1


