Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA2E40A1E3
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 02:27:16 +0200 (CEST)
Received: from localhost ([::1]:48372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPwI7-0004vT-4n
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 20:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6N-0001fz-Fp
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:07 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:46704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6K-0007cE-LY
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:07 -0400
Received: by mail-pl1-x630.google.com with SMTP id bg1so6961603plb.13
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0lgwAN4JLa+eJyUWPeSpGCyCJ0/V+S2YWU/Kqpi1gBQ=;
 b=buhfcxqLaQjAy+ak4SKns+Dc3NqFS59nntcmX3Qi42s4pMJNaKGdzwqSoCgzbgyzEz
 hjtspcq1T9sP0UdiZj1xDzgHRFgw7XMIbzUmcs0ph1uMgPCQVPxJzrwpScW/ZWk6417o
 iUE3Q6KE/H8Pi3HNoFFcUiUTqk5ivyzdO/MDhgjQb3FRHTZmBbbQN5lcQBINxBQSdXwi
 9A+Yp0F7TMy+iyQNeb0dU4PZMbFNucV1+3YjNiBgfAdqaD9UcQ4aJQYUKXRFVNUP7bAD
 gX6MAgIz6aFJPLzPn1tEH4LYRbDfdazrvcWKY84FxvEUzjDV4DwFe5AHqAGZGxg1oHF3
 J/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0lgwAN4JLa+eJyUWPeSpGCyCJ0/V+S2YWU/Kqpi1gBQ=;
 b=i70XHpwtFaC/i0rsUnzh1SJB/DAYGY/1wx1akXYobjovqo/gOs4/bQYO8Y7TbEPJkr
 Q9JkoTP8WAL7mqDnCa3VjtRmORQf2wURls7ezKjfLoEoA1MMOypq2ej5UnENc8Q1uliW
 ysxpQp9jsv8Wazmw8fS6VxOaIuXl9RYsBtsDYG8kTSW32gZ+/BU/CjPDP8vtVNnpGijd
 f9/ejGrkjkwHbCL1OUZ1dIVdFB+UP4yrnD7xMf4LPwEaRlCzdB3RZbuE1M3B8z+wnS34
 Po976BSf5Jq3d9y7OzhRy5KEUd4xP+5MKg5xSrqKamdijtg6hQ6rumwvx/7QuKcBWcJp
 7Rmw==
X-Gm-Message-State: AOAM531hVPlL7urInl3hepMMy/VmnPZpnOeZj0x9E1/jrQO6YITFCEBF
 5+3y2A35LD/r34qlvOoVQKbu3K8kOuBZeQ==
X-Google-Smtp-Source: ABdhPJx0+JqtId9wzTy2M6bGtj7A7yM8n4x+YvidIi3bxmwlzYz0gI8KdT5HAdoPSVW/h9i8VUA4ig==
X-Received: by 2002:a17:902:6e02:b0:13a:41f5:1666 with SMTP id
 u2-20020a1709026e0200b0013a41f51666mr12731629plk.39.1631578503312; 
 Mon, 13 Sep 2021 17:15:03 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m7sm9334179pgn.32.2021.09.13.17.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:15:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/44] tcg/ppc: Ensure _CALL_SYSV is set for 32-bit ELF
Date: Mon, 13 Sep 2021 17:14:19 -0700
Message-Id: <20210914001456.793490-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: peter.maydell@linaro.org, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Clang only sets _CALL_ELF for ppc64, and nothing at all to specify
the ABI for ppc32.  Make a good guess based on other symbols.

Reported-by: Brad Smith <brad@comstyle.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 2202ce017e..5e1fac914a 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -25,9 +25,24 @@
 #include "elf.h"
 #include "../tcg-pool.c.inc"
 
-#if !defined _CALL_DARWIN && defined __APPLE__
-#define _CALL_DARWIN 1
-#endif
+/*
+ * Standardize on the _CALL_FOO symbols used by GCC:
+ * Apple XCode does not define _CALL_DARWIN.
+ * Clang defines _CALL_ELF (64-bit) but not _CALL_SYSV (32-bit).
+ */
+#if !defined(_CALL_SYSV) && \
+    !defined(_CALL_DARWIN) && \
+    !defined(_CALL_AIX) && \
+    !defined(_CALL_ELF)
+# if defined(__APPLE__)
+#  define _CALL_DARWIN
+# elif defined(__ELF__) && TCG_TARGET_REG_BITS == 32
+#  define _CALL_SYSV
+# else
+#  error "Unknown ABI"
+# endif
+#endif 
+
 #ifdef _CALL_SYSV
 # define TCG_TARGET_CALL_ALIGN_ARGS   1
 #endif
-- 
2.25.1


