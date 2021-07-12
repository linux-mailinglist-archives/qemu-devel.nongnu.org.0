Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE7A3C6602
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 00:08:03 +0200 (CEST)
Received: from localhost ([::1]:56088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m345r-0002CN-1M
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 18:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m33u0-0000pt-Uy
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 17:55:49 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:39908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m33tx-0006vO-E7
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 17:55:48 -0400
Received: by mail-pg1-x52b.google.com with SMTP id a2so19733511pgi.6
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 14:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0lgwAN4JLa+eJyUWPeSpGCyCJ0/V+S2YWU/Kqpi1gBQ=;
 b=jSeeyBOO6E1wn6rLvdqyssZgCsyTAk6ZQMxdqWqJmQteU98MAxr5t9kgWkDGqPuza/
 9llyvUrs/Zp2s3pBP++0Sc5qqt77w3qo5Gfk7AAYD/MY2ma39xeHjLbBP7E7vf+69g31
 nFYgY3Xpxh/eOWIGezyiKcQ8NxDr/me7cssZxyYSFI92VPF6XxNdoW4LPVepxi0JJcWa
 +c7ffaYBvJm0InMl2Qo5PAnuyBUXv+6I8A6VolEiwXH28MZW30GW4zeSdOVPWCaGUNjd
 UMUNs0iPGPy7MKSwYDiQnYkiBCjyGqsI+XtjWqGwI6WX6P6IYIKkXKCjsIAdIwRqeCzx
 6qqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0lgwAN4JLa+eJyUWPeSpGCyCJ0/V+S2YWU/Kqpi1gBQ=;
 b=rZ113owFtb4pUjv+tpj5QeKMUO0maiGVzD5sws52e1QLMrWyMF698VzWRckyXDJWEt
 fcTeeZoZdUipjy+sjfRaHDlBlWg9jVgUhyjFx0FXXvvl+XfH3WQVjJDRYBqX69Ae9DKI
 LsMp+2ce5SqMRmFQGXtXG/A7zHe0OXaDLMi0J5Bssi3Vo7UYjdTVKZ/ksFK2CswBvXtw
 dWpX0DfZ3ZfTcisOCxY26xzei10ZU4aQa9dWuE6Ujf7E0FbTUXJ99H5VPH57E9A33YMY
 vtF6E0SY5GGgPdYe4TrcgOvn98z0i6VIq1s+osaVilcrdTeVfzpYmUXeX5tL/VwX9cYg
 V7jw==
X-Gm-Message-State: AOAM532J+5Q0yH5TB9Ima5hBgWT8ctlwwER4gDMFK7vWc0ZV0yMrOzLd
 SsjfqNCS0ljEWDgIpUb7MNlaUhRpEwOVpA==
X-Google-Smtp-Source: ABdhPJzTKKJJq+iDZjuFN/rST22OxgxAb6thaMQGN6cvTvsDWkA3Kve/23oBsxjC98UySGzLgo8ysg==
X-Received: by 2002:a05:6a00:1805:b029:328:4602:4dbb with SMTP id
 y5-20020a056a001805b029032846024dbbmr1074161pfa.45.1626126944025; 
 Mon, 12 Jul 2021 14:55:44 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id d2sm376932pjo.50.2021.07.12.14.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 14:55:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/11] tcg/ppc: Ensure _CALL_SYSV is set for 32-bit ELF
Date: Mon, 12 Jul 2021 14:55:35 -0700
Message-Id: <20210712215535.1471256-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712215535.1471256-1-richard.henderson@linaro.org>
References: <20210712215535.1471256-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: Brad Smith <brad@comstyle.com>
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


