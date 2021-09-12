Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63265407E6D
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 18:10:20 +0200 (CEST)
Received: from localhost ([::1]:38750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPS3f-0004Av-AL
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 12:10:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPRs8-0002ST-2r
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:58:25 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:33286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPRs1-0003xc-TD
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:58:23 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 mi6-20020a17090b4b4600b00199280a31cbso3735332pjb.0
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 08:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0lgwAN4JLa+eJyUWPeSpGCyCJ0/V+S2YWU/Kqpi1gBQ=;
 b=yP51pHcwrmx2oxBxaPl9XGJ8pj+i76hA6At+8sZWguIVn2hF/x9/PWxkAh6URyuZCt
 fb9Q9Wh1FNC58ihi8vnShAPgORQQz6uCbelqTLte4IasOFpI9fi8d5V33ieVUOQCkXdP
 1iSIXq8t3f3augEBnz9q1YAavXG/jzn1Cb2bZKgZu1qPEWEJYLUAOOM10KC8Ht0YiERB
 84QmhCA89vOLUVZvE6arskHQjhH9E7nxr90a6ijDYer6vackcZw60k8j7OmHn9LBxSwu
 18hFt9+yqUKB2PI1JeBsG8BoWsOu84eDifX0gXHnXxIhn6GZYpv8XFGzff5HTrpTDeE+
 7elg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0lgwAN4JLa+eJyUWPeSpGCyCJ0/V+S2YWU/Kqpi1gBQ=;
 b=JeU+DNz+MK+Lqf7WYW9HDzD3uoN0Hh/iPTWB+M73I1FldY9rK/lO0zYsf/vKYu2MHg
 3ww4aYFt7wd7GxWLMD+JHNI0A37tVpe5/Ft7fGgacr5c9vjTQ2SHZlMNZ+pz2ltjpm9J
 SHi/AU1YA4tumjwQwlerFSToaHaSh75m6HoEpELzohITwIRL3D1lK/BrZyyGKkZMzGZh
 o7mOFAC3b6MOnmaOaI6aEVxq1iyTqsGMmZZOXSRSxl3ilPm9wBBPR3Otg32QavKHu/rW
 /tO55nmOd2oB3Z8t/QhTWltteqUngbPkniZDOd1OX2TD2ltyJgzzvB9kOpKWNt6KuVsP
 4+Gw==
X-Gm-Message-State: AOAM533K6DWSBASvXoXPNreTIbgrXlrMW7OIPeZw8W3eHPq+lha1g2Fk
 J1Fr4UMip1GMmqlC5KIirI7UpqIrW9xw1w==
X-Google-Smtp-Source: ABdhPJyrfxdOvHjt6OuXbdgl0Yrm0CGbf7+2WYBuCWZ4nN6jep3OKP8JFOOc4lMGIFR3s/w6xni5Eg==
X-Received: by 2002:a17:90b:1102:: with SMTP id
 gi2mr8195486pjb.43.1631462296624; 
 Sun, 12 Sep 2021 08:58:16 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id v13sm4439415pfm.16.2021.09.12.08.58.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 08:58:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 8/9] tcg/ppc: Ensure _CALL_SYSV is set for 32-bit ELF
Date: Sun, 12 Sep 2021 08:58:08 -0700
Message-Id: <20210912155809.196236-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210912155809.196236-1-richard.henderson@linaro.org>
References: <20210912155809.196236-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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


