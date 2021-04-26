Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D0D36AAE3
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 04:58:43 +0200 (CEST)
Received: from localhost ([::1]:35992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1larSM-0004ea-KA
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 22:58:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNl-0007xp-NQ
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:53:57 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:42768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNX-0007Yn-Ni
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:53:57 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so4407521pjv.1
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 19:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1NawdC6TWJEBCTs9JjIuIiWT2xY8OIdl/qnUnKxqfyM=;
 b=N2izx1BAbzpwTwblSKAB7iKPH6bO37vpg9a5+pFxWmpkk8yNHt7Qffkla74hDb8W9e
 M6brJV1L9x9KJtcxxe3SWtYoykK5bCUHfYlQlaqDHMeZD9Y1OoYfI8KLkpm65Q6w1s5C
 PEvgBTxfMY/VEgfHkvL5WJ7SftCRCNeyQS30WGCu/VS/XzTYZ/W2DYGwJ0uW32jXcdJr
 q5v2amlMPLVVgrZqvUWFbThrk3Q3vKsBUA/XETkmDmRZWBlf4NZD9ABmwkqvr8dg8ZY+
 M5L3XNccH1I34obFoMEA5oHPIwm91R1IilmuB8e0sqg/yHk5jaU7Uw/XFq4sGRoStEQk
 qlyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1NawdC6TWJEBCTs9JjIuIiWT2xY8OIdl/qnUnKxqfyM=;
 b=nZmHamhxazuVm08EC329KHrkshrAlTPkQNdzJpKkfYTrshQHkq5DnuGuCTWsfZnNVE
 bN3iHx4E7XGht2dlm6u/7hKa5xfuB4n28m2csDeuBjysEE+Zf3srQCfD6Strio/p4nSF
 IEQ2PZ9xovn6PKrFeceZRdYOuIbiN4rzjBN0yHb86FUdhGBz5vFHDnbwFQJbHKGiKuGC
 IzGpDHlqPNhymyf1Kidv5iLsBy/XRYc8j3ADcOdq1olVi1h+rgnCZXg+h7r59DyAFNZv
 ffkB4D2VoI2a5s2y4RB53SPAyyKzazTXQeVrlOsLwAf82u/UQkhdepKmhEVCMYH7rFLP
 doUQ==
X-Gm-Message-State: AOAM531AJF3ULXgcVAitlthgC/WazzWquXIyzfDSriXZZgNNPCcHbqHR
 HlIPKXyFiroJr2X1q5MipyyY3Mpvrci8Cw==
X-Google-Smtp-Source: ABdhPJy+QR2wa9MFnhhG1ztGUlgYhlLXv/fZ14bmzId57erlHSpsfnqgaGKLF6FGStm+jTt0CrKUnw==
X-Received: by 2002:a17:902:788b:b029:ec:c151:b5e with SMTP id
 q11-20020a170902788bb02900ecc1510b5emr16200554pll.75.1619405622019; 
 Sun, 25 Apr 2021 19:53:42 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e23sm9805680pgg.76.2021.04.25.19.53.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 19:53:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/25] linux-user/sparc: Merge sparc64 target_elf.h
Date: Sun, 25 Apr 2021 19:53:17 -0700
Message-Id: <20210426025334.1168495-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210426025334.1168495-1-richard.henderson@linaro.org>
References: <20210426025334.1168495-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc64/target_elf.h | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/linux-user/sparc64/target_elf.h b/linux-user/sparc64/target_elf.h
index d6e388f1cf..023b49b743 100644
--- a/linux-user/sparc64/target_elf.h
+++ b/linux-user/sparc64/target_elf.h
@@ -1,14 +1 @@
-/*
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation, or (at your option) any
- * later version. See the COPYING file in the top-level directory.
- */
-
-#ifndef SPARC64_TARGET_ELF_H
-#define SPARC64_TARGET_ELF_H
-static inline const char *cpu_get_model(uint32_t eflags)
-{
-    return "TI UltraSparc II";
-}
-#endif
+#include "../sparc/target_elf.h"
-- 
2.25.1


