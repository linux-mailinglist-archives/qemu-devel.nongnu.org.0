Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB9356BCFE
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 17:42:49 +0200 (CEST)
Received: from localhost ([::1]:59848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9q80-0001sL-78
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 11:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pji-0004Qp-6c
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:17:43 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:44605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pjg-0002TY-O5
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:17:41 -0400
Received: by mail-pg1-x52f.google.com with SMTP id bf13so9557417pgb.11
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7xmxavNGvmm3BzQ45g11tA0Bzd0iytuo9+dpLfOmZxs=;
 b=x6TsdGOq+pJSy3Sv1oOiPuAdAk81edD6bTj3pIxWtxymtapX6SauSgmVUdKhrtc5SO
 2BJqW3A3WtGm0C4k4qR9Yk5ApsbT4PAjIRDeOW3o4FAz5zU0I1mczJ2hPKQAnqgSi1uq
 U0DoffeHctHe8K8tI+FBe7zhE7/O82Hf52hAELkO7Kd7DdOes2VbF2jT3Lfx6mDWsz3E
 TI8Ghl+tfKXcXSbeK/Iw5WLuSR1TFFu58qfxRT0LWuev1c+lE0bcwH++gPs90fTqCS7l
 QNpLX8q7x2DQsT5zEkZxoAe8IQ/lgTQRDphCUk8N/iDbhvMrpMu0Ae4yNYBxLoMbkgT4
 2ykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7xmxavNGvmm3BzQ45g11tA0Bzd0iytuo9+dpLfOmZxs=;
 b=b+D+4Zf4QC9pODV1Qo3rUQ/kcfQC7DRa67GLHLGBg2a/XzjMZNWf7cgV/e9D9o/Aoo
 ksux5PTEHQ10lcGM1HSH9lQMuSTutxRWaJK6PgtGGrEuX5XfiPngZgp4biRt0kZSAtVV
 3nt9cvOdt3mLVYcgVWq9g3Jw1tI6kND8/7TONQXn3a9+J7lJIxkIORiQiWwNvnu7pJRV
 sKbSKifLNGUfti6QVPqWzuWIbmai+4OOzGCo7IvP2pi3hoQjFIO9LSnvzMqiWCWqhVyY
 QwgPir8AArJhSDInY09sxyO1cUD/hYpLVtH4bPTdkMkJWm2QxzfQdjwidMd1aWTykxcP
 jclw==
X-Gm-Message-State: AJIora+2dwlQEjjZtc2EU13POPDLAn9aXzw1ybK/gwRADsnRDjp9Whpg
 j/kfpn6AuEHv4cFZIDBKy5VYZdueQh7w3lsh
X-Google-Smtp-Source: AGRyM1sCzI3EnEkVTbCTAK9Q123TnSKN0mjhI5IG+b3BF46StRpVBEd6vKEfNIr+s8Ry2ai5l2xnNA==
X-Received: by 2002:a05:6a00:1908:b0:525:5dad:cb1c with SMTP id
 y8-20020a056a00190800b005255dadcb1cmr4480822pfi.47.1657293459914; 
 Fri, 08 Jul 2022 08:17:39 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:17:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 38/45] linux-user/aarch64: Verify extra record lock
 succeeded
Date: Fri,  8 Jul 2022 20:45:33 +0530
Message-Id: <20220708151540.18136-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/signal.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 8fbe98d72f..9ff79da4be 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -340,6 +340,9 @@ static int target_restore_sigframe(CPUARMState *env,
             __get_user(extra_size,
                        &((struct target_extra_context *)ctx)->size);
             extra = lock_user(VERIFY_READ, extra_datap, extra_size, 0);
+            if (!extra) {
+                return 1;
+            }
             break;
 
         default:
-- 
2.34.1


