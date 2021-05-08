Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3ED376E5A
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:04:20 +0200 (CEST)
Received: from localhost ([::1]:53322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCKJ-0004s3-6e
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:04:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4o-0004BJ-WC
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:22 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:54055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4i-0003Yq-Oa
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:18 -0400
Received: by mail-pj1-x102f.google.com with SMTP id p17so6206406pjz.3
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZkAPsJpFKYLwHKnqQJYxgfiNUgUoOxofSZa6fTNKj+E=;
 b=b73ETn1ljStaXoeH3oWYISHItx2sRYf/rAzjBU7RxjwJsWFc3O4g+GInCiFUHSdXFX
 zbEo6aO1xr7kzVmDp/1DSH56L0cIT2DKE1GbDzjk5Hq3LWizAc0XdrL9+lxzS/pZYG8w
 reuhKe5o8Z9NGj1XL4GVaEClMeaYcVOG5LLYQFQ1Gc+gjJ92eqNjkDtnEmB9dAFRUqaE
 EL2ZGieARAS5O4EdMqXVvVzQSjhQHo6IjZTfIRiHQgFecL2IMQcZR4vKphCBzy4qAB3r
 DkpbbHi+pn18A2uM+3dnMQB1GBvl0IirtWHyWBWyxGKe0PgWqCkEUCCqDoZATWrRTBFR
 nC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZkAPsJpFKYLwHKnqQJYxgfiNUgUoOxofSZa6fTNKj+E=;
 b=rFR+MGd8Ik9mPfIl7GYXmKL5WGN1R7wx5GTAkDNzB+5rARJytBwZODINH0nfwiizUc
 vEMLaBLtP9ZV/+hqXLCYgZ9PxgvmpPcsJIQYwQt5ANutc4BaZi0k85ebEuBUGzJHqxoI
 ds5VqUqsQQQDo/GIgwcscPphMZ6N17N+XxY68vO6JCT4lnkjKKpsfHVWCrDQ1YVPtCyH
 7Km2amcYukrsJLFsrPAvhkMHdNENEVmIpb7PczgGqwRecHBuF0RFqCZ/tYfPRJKZDR3g
 dFv55GXG1FOWlIjJvPPEvVkOtAHFj5O6hWvqUBGjRiniG3lY8c62T8PW2ZxF/nAaLZ5f
 zLyw==
X-Gm-Message-State: AOAM530ZBry6/WwuX91fugxGG245yDzD/nXKeMD7xR80/19p3OkbNLjM
 vnDb8ZGD6V0MSDjoyZk4m6+X3RAurguB7w==
X-Google-Smtp-Source: ABdhPJzCGVz0PADwhRdlH3Yf+DOTCfeug1HfeZ2W9VKabxZ/x9XqBjTdRM6zzIb78M3YXtVfMQ+VpQ==
X-Received: by 2002:a17:90a:1c02:: with SMTP id
 s2mr13256859pjs.17.1620438491557; 
 Fri, 07 May 2021 18:48:11 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t4sm5819681pfq.165.2021.05.07.18.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:48:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/72] softfloat: fix return_nan vs default_nan_mode
Date: Fri,  7 May 2021 18:47:02 -0700
Message-Id: <20210508014802.892561-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: alex.bennee@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not call parts_silence_nan when default_nan_mode is in
effect.  This will avoid an assert in a later patch.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index b694e38522..6589f00b23 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -892,21 +892,16 @@ static float64 float64_round_pack_canonical(FloatParts p, float_status *s)
 
 static FloatParts return_nan(FloatParts a, float_status *s)
 {
-    switch (a.cls) {
-    case float_class_snan:
+    g_assert(is_nan(a.cls));
+    if (is_snan(a.cls)) {
         float_raise(float_flag_invalid, s);
-        a = parts_silence_nan(a, s);
-        /* fall through */
-    case float_class_qnan:
-        if (s->default_nan_mode) {
-            return parts_default_nan(s);
+        if (!s->default_nan_mode) {
+            return parts_silence_nan(a, s);
         }
-        break;
-
-    default:
-        g_assert_not_reached();
+    } else if (!s->default_nan_mode) {
+        return a;
     }
-    return a;
+    return parts_default_nan(s);
 }
 
 static FloatParts pick_nan(FloatParts a, FloatParts b, float_status *s)
-- 
2.25.1


