Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B9E381ED8
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 14:43:19 +0200 (CEST)
Received: from localhost ([::1]:45528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liG74-00050S-Fg
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 08:43:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFzQ-0007hf-SD
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:29 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:41852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFz1-0007np-Er
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:20 -0400
Received: by mail-qk1-x72a.google.com with SMTP id l129so3299053qke.8
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WtVnyNXfkFjXiL/rrreOZ74P1ptL2lcGNEOLA4QHWTg=;
 b=wCT2pHv9FB0oj7kMK0bLL4dntBFUoPoRMFxTwjAruDmGtmOqONqOJ/mGA4+lVBZE7N
 3/TQiBQhSgJBvVjAXaigHgD5bDv6f0YzaVwtGzBY4WKJWp9oejGfQo1OXevqI3qoXrrm
 emxKX7U6RGVjRN02H4qmt0BpMuVWV1AhIr08gheDTWU7Rd/qJg8CvNyVHc2FjKa4pu3e
 tcOjO/n3gWkbTKowHJZ3CsZZFLLd+3OZj6tOh3L6BWEZetr3326skB1oqhKDRt1t/TZK
 c5YXf+o9Xf6A55URrgxMjbSSf/m8a25baaYLQRS1ARaNk+o+9Yzq5EwRIHMUk+UDKOAi
 q1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WtVnyNXfkFjXiL/rrreOZ74P1ptL2lcGNEOLA4QHWTg=;
 b=BK758dkJxZY/EQ20c4QoDo3bdfjOEzH5Msxw3KIn88dDn3ce60rqdym8ovPvHSB7K7
 9d33K3pSslTmU63IgNoEkr+vtfC/2j1n10mrmCwM81FPFbibSUuP2+Nrr60JHt0kcsLu
 PaxrEOtmrB0WgipFTHhQ6/3JNwCPqG922tiUUiLqvFynnUHy+2Cwp6CV3W1ncVvYoW6C
 xR6g3ga+8bZHwuaUzWpTrZTVsTgD8WoDGF74OiM2XzMwowRoEDwxPSp2V838wM9B42gI
 W7ljvkGUBoNNPSQz0bHa7byCk++i/zSwSJDdY0EmnqGZfuqynAImWB4zz0viMdR+mEv+
 sE1A==
X-Gm-Message-State: AOAM532bHix1VRybibIaR6ZywB2wfNWIQnyf7tykkKAxVtFjw01LEWil
 jfxH4KFyw2JzV2WD6WNih15Vok5t7anutFIfEoE=
X-Google-Smtp-Source: ABdhPJwb43TxZz8X5FZ10gB6HCf5Lo8Ax2GCjzOzMdFfefp9EZswP8I1aSrziXKpdQDenxC734p4Ng==
X-Received: by 2002:a05:620a:167a:: with SMTP id
 d26mr20707395qko.293.1621168493708; 
 Sun, 16 May 2021 05:34:53 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id s5sm8500553qkg.88.2021.05.16.05.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:34:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/46] softfloat: Rearrange FloatParts64
Date: Sun, 16 May 2021 07:34:10 -0500
Message-Id: <20210516123431.718318-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516123431.718318-1-richard.henderson@linaro.org>
References: <20210516123431.718318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72a.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Shuffle the fraction to the end, otherwise sort by size.
Add frac_hi and frac_lo members to alias frac.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 2123453d40..ee609540aa 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -511,10 +511,20 @@ static inline __attribute__((unused)) bool is_qnan(FloatClass c)
  */
 
 typedef struct {
-    uint64_t frac;
-    int32_t  exp;
     FloatClass cls;
     bool sign;
+    int32_t exp;
+    union {
+        /* Routines that know the structure may reference the singular name. */
+        uint64_t frac;
+        /*
+         * Routines expanded with multiple structures reference "hi" and "lo"
+         * depending on the operation.  In FloatParts64, "hi" and "lo" are
+         * both the same word and aliased here.
+         */
+        uint64_t frac_hi;
+        uint64_t frac_lo;
+    };
 } FloatParts64;
 
 #define DECOMPOSED_BINARY_POINT    63
-- 
2.25.1


