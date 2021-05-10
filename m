Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD78378C53
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 14:36:37 +0200 (CEST)
Received: from localhost ([::1]:43958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg59I-000056-6Q
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 08:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4z5-0005tq-0l
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:26:03 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4z3-0003E5-62
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:26:02 -0400
Received: by mail-wr1-x42a.google.com with SMTP id v12so16410937wrq.6
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 05:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9vWwmItMfiJpiaUNbqSiAbeORN9VsWlu2JR+tQ7wf/s=;
 b=L7GIEp7xKpTDgxif6xZU5+L7nBOJJ/zAEEzJw2AXhOub8w4JY4BBCg48mmTMxayJsT
 8Xgeq6hxvPnF0uxRP642rGVIEYAwF0Zs9UVw1/GwfDOJy6bE2LVANsa5+2KxiN8vloXX
 2KLkfoj+dIOXZSiTfomEfI0pG3pjNEkED5UNMf2U2wnL5ovAyVfry34ilKdEMQgqe2Be
 k0ykKSant6gz6x3xkhkYdTgFofbIaLSIcacD78fVIAt02D9phd+6QkAct39bgA7UN5sx
 lMFKa2Wm38oG3863FTFu6r4n2ho13D/4QsMR42RyUwQSJRAShHYHlENEtSpMQLlfqNiK
 bh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9vWwmItMfiJpiaUNbqSiAbeORN9VsWlu2JR+tQ7wf/s=;
 b=omSTusacsIC96Z2yrZfd1++K+sJrMKwOInS8orq1TRDRGgs7N5+DxQyii/XKvLhR0G
 /DlQlVOQaygZyngyVlWEd5yIaMxOIN5Y7MDze79U0jMRiHDboeTt2ZugKnH/Exynmak5
 XGRpdimOBWmlonXWxXRYi1xphJAN8asB5Kmnl3b1DnBKC4FeU3+DFbVRu08cP9UwmFmQ
 SWKhiz8zbq81/+vG9M4FNO8VzL03Ek3njo0GFlMy4Q9UA2UcaFiJFqwWnfx+H8ptEoxQ
 2qR8B0jFGG4A4TRSbzb8w/x+beDAyKyVsej/c06QhPwEFG2BkLkX+6JGn1bcEaZ6smqU
 qWrQ==
X-Gm-Message-State: AOAM531HR2dI9I1Z+HgHtCNTSavSF3UfjkEFIkE2KBr2W25cfa0s2h1e
 X9XE45B+WkMuyEEzbvsavZ0AeP1v4fxF3Q==
X-Google-Smtp-Source: ABdhPJwKJBhYPcx6YljICxEzJBrVZMEWH4rXJKLp3YVX9vrKL1ZgH1nR4XGAPwK6synVlmv1pY6MwQ==
X-Received: by 2002:a5d:6088:: with SMTP id w8mr29639823wrt.424.1620649559861; 
 Mon, 10 May 2021 05:25:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d9sm22749897wrp.47.2021.05.10.05.25.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 05:25:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/26] target/arm: Move NeonGenThreeOpEnvFn typedef to
 translate.h
Date: Mon, 10 May 2021 13:25:36 +0100
Message-Id: <20210510122548.28638-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210510122548.28638-1-peter.maydell@linaro.org>
References: <20210510122548.28638-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

Move the NeonGenThreeOpEnvFn typedef to translate.h together
with the other similar typedefs.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210430132740.10391-12-peter.maydell@linaro.org
---
 target/arm/translate.h | 2 ++
 target/arm/translate.c | 3 ---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 8130a3be29d..12c28b0d32c 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -409,6 +409,8 @@ typedef void NeonGenOneOpFn(TCGv_i32, TCGv_i32);
 typedef void NeonGenOneOpEnvFn(TCGv_i32, TCGv_ptr, TCGv_i32);
 typedef void NeonGenTwoOpFn(TCGv_i32, TCGv_i32, TCGv_i32);
 typedef void NeonGenTwoOpEnvFn(TCGv_i32, TCGv_ptr, TCGv_i32, TCGv_i32);
+typedef void NeonGenThreeOpEnvFn(TCGv_i32, TCGv_env, TCGv_i32,
+                                 TCGv_i32, TCGv_i32);
 typedef void NeonGenTwo64OpFn(TCGv_i64, TCGv_i64, TCGv_i64);
 typedef void NeonGenTwo64OpEnvFn(TCGv_i64, TCGv_ptr, TCGv_i64, TCGv_i64);
 typedef void NeonGenNarrowFn(TCGv_i32, TCGv_i64);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 58cb3e8aafe..7ff0425c752 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -66,9 +66,6 @@ static const char * const regnames[] =
     { "r0", "r1", "r2", "r3", "r4", "r5", "r6", "r7",
       "r8", "r9", "r10", "r11", "r12", "r13", "r14", "pc" };
 
-/* Function prototypes for gen_ functions calling Neon helpers.  */
-typedef void NeonGenThreeOpEnvFn(TCGv_i32, TCGv_env, TCGv_i32,
-                                 TCGv_i32, TCGv_i32);
 
 /* initialize TCG globals.  */
 void arm_translate_init(void)
-- 
2.20.1


