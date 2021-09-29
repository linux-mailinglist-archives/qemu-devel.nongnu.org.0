Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9501F41C5AA
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 15:30:06 +0200 (CEST)
Received: from localhost ([::1]:57282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVZev-0001N0-Bg
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 09:30:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZIC-0007E9-3R
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:36 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:45735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZIA-0006Jt-KT
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:35 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 e66-20020a9d2ac8000000b0054da8bdf2aeso540738otb.12
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 06:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WQzB7AxyjWRUXA4DYayXuevJtgVSORrMk8FiM91I24o=;
 b=cfR0Fbyhshx+JI65CP04Mr/1t5OQTwVeX5eOIHUfFAhoXlrrsWsRYvG2xJPlfJDwyv
 thg6Z6wbY7pA0F0TyigvWxmvImRLGgDMrSi3r7CU95Hi4iPiaIlA/y9J2hCHHSuQbBKz
 LshocQFt7zft4L13x2j2e6mYSDrTSXg12F+YBRozN4/iSFaTSXqNrOesZk0iX+Cm8idY
 c9T+FMD8wXLor/VX3hxh6eksJWKeK4s6/niVezrLeF/XDjTqW4dkWQd0ZopTEXRPse8Y
 O8NVyOHALU+UEG9dozOqvO33xkgytZD7gyzNatmbRsNszco7p+43YAA0GJu5eu4T5KAs
 lCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WQzB7AxyjWRUXA4DYayXuevJtgVSORrMk8FiM91I24o=;
 b=VjHxNqBALcNdIFGPt8Gu8mgrbvncXDvtJ/0rfLkDPnKpCk1K36DrmNmkK6qvfikMFh
 s0ASkKSuY/oaWPg18PMI+xfpMY7qMImn71elT12el7aRcoUaFMi1xt39NlB1ob/E+FZh
 rSc2bQ4c4rPL4uUZUL2rJfOWufyjNAzyoFJMMmD8pDq6ck7QSm8MT6gZzLXLvTL9VxAy
 FObpN2A5HA8FvZuXtHCKRvcDOyG05079nIOMRusn6J1ulywAedLCOKPN3zGBUJ4AwBpx
 LT8XUkSH1FfSPEnTqlN4zvymypLCdwxsX1M8OG9Z+apuVQ7fP/f+VEZ82KOWby4BE1Gr
 T37A==
X-Gm-Message-State: AOAM533xyhsoJkvDHxqj4QJJQbZVY0AvBL/mTgLSuo4B9QuctURQJTtD
 idcGK5P+9XuOypmavBXjy4BXXRo8R9CLJw==
X-Google-Smtp-Source: ABdhPJx4MKq91q9WLqBKA9DFnqGoXg+jdRjN2YKYMkMfeFHZpxwt7ff/XrTnqitsZSMCmFToXpHjFQ==
X-Received: by 2002:a9d:4696:: with SMTP id z22mr9849141ote.293.1632920792156; 
 Wed, 29 Sep 2021 06:06:32 -0700 (PDT)
Received: from localhost.localdomain ([172.58.171.248])
 by smtp.gmail.com with ESMTPSA id w1sm442823ote.41.2021.09.29.06.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 06:06:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 16/26] linux-user/nios2: Document non-use of setup_sigtramp
Date: Wed, 29 Sep 2021 09:05:43 -0400
Message-Id: <20210929130553.121567-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210929130553.121567-1-richard.henderson@linaro.org>
References: <20210929130553.121567-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alex.bennee@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/nios2/target_signal.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/nios2/target_signal.h b/linux-user/nios2/target_signal.h
index aebf749f12..fe266c4c51 100644
--- a/linux-user/nios2/target_signal.h
+++ b/linux-user/nios2/target_signal.h
@@ -19,4 +19,7 @@ typedef struct target_sigaltstack {
 
 #include "../generic/signal.h"
 
+/* Nios2 uses a fixed address on the kuser page for sigreturn. */
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 0
+
 #endif /* NIOS2_TARGET_SIGNAL_H */
-- 
2.25.1


