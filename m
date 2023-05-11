Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC3F6FEDBB
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:16:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1Lg-0007LV-Ef; Thu, 11 May 2023 04:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1Lc-0007IW-NM
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:08:24 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1La-0001xO-V2
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:08:24 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-966287b0f72so1059260166b.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683792501; x=1686384501;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yv5GDSNkMoJwJa++KtzHV6S4Ef0nvuMaGkkgYlahBCM=;
 b=wu/pzBi0Jv+OdI3TcDJmlM5N1CoH3oRfVmQOHu/S9o19XsP1Yi1pOgmSvqHzsuOh0p
 wqm0O5abCCNpncGQGFS3RVPcahIShqIq6JDz8t3SKvE8HVehYqjEFnFuiXQbPXOVZy8c
 N4TZOj5J7pd/varIXqbJcJMt1/hOGtaa0Ghgq08Mzt9uxa41wJNqZ0BSSvsNRGVGA9Su
 bOa2pryzVHo9L6hllv6qiapFcJkbKbrhu+CcBSq2zkX9+/tS+MjWbDlyOBRy53eIJPG3
 Nx+TC0DTxVc1oFuqFHrNO7b1KghwSWOhKwumuPHjT06dCourVI8sx3BiCvNBlO/tM/XA
 2y8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683792501; x=1686384501;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yv5GDSNkMoJwJa++KtzHV6S4Ef0nvuMaGkkgYlahBCM=;
 b=EKPQe9Xwa11JEAQ2yWoozfvLPQwKG6+RjpmnGj9Ia9hLXBvFFYnKqkLEFsi7tuMyGA
 28cWrKKQfSjbM30ym1wan/q4BD8GRtpSjqrHp9vzIj1rfuu0+a00Vh26NWYQOqq46t78
 JmFAVAQG0E4gLHpmMCKQBbhWgLdIPLL4pna0D1N7r0SL8aX7bNlK6WZkOcts7cCJBWzO
 TI4S+K7oir8lHmV2rmcYe8zsO7UA8MPEPRd8UC5A4Byg3QZMPO5owZnOOhmmTuSB4upM
 smTt+XTKn/z5gZV5yAvlZzbqA83eK7Gi1bESyL/47e6K0QC2w3nLys8mvEJPSKGIte67
 0Mqw==
X-Gm-Message-State: AC+VfDyqdDiKgr1P0OWAuknD8e98Dx43deux04KdRSuKeyBvIybYoJ1i
 Vacbd6igKtSAnYMwzgeOVjSTDD9kJaTTvR5aprAA2A==
X-Google-Smtp-Source: ACHHUZ7xUyK8kNjfVI/EAdr9plBxjSKtCPqLBEQOl7F4u2VI8NYI64/Bo+2Hzg87gj81d8GKLkWHuw==
X-Received: by 2002:a17:906:fe04:b0:966:1984:9d21 with SMTP id
 wy4-20020a170906fe0400b0096619849d21mr14355840ejb.9.1683792501383; 
 Thu, 11 May 2023 01:08:21 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ci18-20020a170907267200b00959c6cb82basm3635225ejc.105.2023.05.11.01.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:08:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 47/53] target/sh4: Remove TARGET_ALIGNED_ONLY
Date: Thu, 11 May 2023 09:04:44 +0100
Message-Id: <20230511080450.860923-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511080450.860923-1-richard.henderson@linaro.org>
References: <20230511080450.860923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x630.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configs/targets/sh4-linux-user.mak   | 1 -
 configs/targets/sh4-softmmu.mak      | 1 -
 configs/targets/sh4eb-linux-user.mak | 1 -
 configs/targets/sh4eb-softmmu.mak    | 1 -
 4 files changed, 4 deletions(-)

diff --git a/configs/targets/sh4-linux-user.mak b/configs/targets/sh4-linux-user.mak
index 0152d6621e..9908887566 100644
--- a/configs/targets/sh4-linux-user.mak
+++ b/configs/targets/sh4-linux-user.mak
@@ -1,5 +1,4 @@
 TARGET_ARCH=sh4
 TARGET_SYSTBL_ABI=common
 TARGET_SYSTBL=syscall.tbl
-TARGET_ALIGNED_ONLY=y
 TARGET_HAS_BFLT=y
diff --git a/configs/targets/sh4-softmmu.mak b/configs/targets/sh4-softmmu.mak
index 95896376c4..f9d62d91e4 100644
--- a/configs/targets/sh4-softmmu.mak
+++ b/configs/targets/sh4-softmmu.mak
@@ -1,2 +1 @@
 TARGET_ARCH=sh4
-TARGET_ALIGNED_ONLY=y
diff --git a/configs/targets/sh4eb-linux-user.mak b/configs/targets/sh4eb-linux-user.mak
index 6724165efe..9db6b3609c 100644
--- a/configs/targets/sh4eb-linux-user.mak
+++ b/configs/targets/sh4eb-linux-user.mak
@@ -1,6 +1,5 @@
 TARGET_ARCH=sh4
 TARGET_SYSTBL_ABI=common
 TARGET_SYSTBL=syscall.tbl
-TARGET_ALIGNED_ONLY=y
 TARGET_BIG_ENDIAN=y
 TARGET_HAS_BFLT=y
diff --git a/configs/targets/sh4eb-softmmu.mak b/configs/targets/sh4eb-softmmu.mak
index dc8b30bf7a..226b1fc698 100644
--- a/configs/targets/sh4eb-softmmu.mak
+++ b/configs/targets/sh4eb-softmmu.mak
@@ -1,3 +1,2 @@
 TARGET_ARCH=sh4
-TARGET_ALIGNED_ONLY=y
 TARGET_BIG_ENDIAN=y
-- 
2.34.1


