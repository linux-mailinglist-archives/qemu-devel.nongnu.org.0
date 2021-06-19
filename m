Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A223ADB61
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 20:36:05 +0200 (CEST)
Received: from localhost ([::1]:37940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lufp6-0002Rp-Hl
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 14:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufV4-000103-NC
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:23 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:44911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUw-0002PJ-4D
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:22 -0400
Received: by mail-pl1-x634.google.com with SMTP id x22so4790017pll.11
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 11:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jM82TdfgD8ZhKwShzjucUE8ayynZiFP9Xnq8vxxePe0=;
 b=UIOuRIf526KN79GvU4inBWOgtFYJ14PwuzaLwrZWucLpF2bx0axEWo/6kVEFHNwEIF
 ctgydSJLFj1O0IDv0sIfbQRdx4m7eez4sHL9oFaN9BLFyP7mv8th+g0xXCDCmrarswvi
 Az5awNAeXtIwADlFi6l8p+M3T9OkV8l246WszZwyXyUsHN5Y2Xto87KnAkxz0Q2nDnKj
 NNiatBwSZcZOtrgPQnzfR3UuW5ye/1LNVnkgAbPFTbFdu8eH0o2o6oTKgpy+rMIIJ283
 cVr5d/L0uhAzWtEh62Hd3iTlaOZhEADdNHygdomMDpIVNAtifdqpnlaPoRxzrZEqkLA0
 KCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jM82TdfgD8ZhKwShzjucUE8ayynZiFP9Xnq8vxxePe0=;
 b=YbCu/RLlpRFCV4e4G+BBz0HAz2p3KXbUoOpyQ53c3K6WJd1Ytq9OxWvw4oYhFwPbs4
 5QUwchNZkccEhle2x3qSFYkdJ7/u9YH7Q77WhGHYrwjNSKdaHbj3q5DvirYW6VbEJi0r
 D/ZWP4p6gj7Mysm1U6a8gu7xeYRqe0YGknqMXNRu+qPcLLyxRM0jcQpIB41M0P77W0Y3
 AHiWI63QrbdsI5LQI3SIh44n1ya5L6tLcBUizX1QxfVMEGSiy3jwK/lhteyCvep6pOLX
 u+TeYgJWxYlCqT+zxtaXFa0MiZsIRe7mVFEhzflax/OgWE1W/v0aCKeUofnNf17181ao
 LD3w==
X-Gm-Message-State: AOAM530SPBquk90BnthTTBzn63PO0PwwAU7mVygbPH+Rm4/By65kl2qX
 YBdT6rZWRQAExXy71B34vWjP2oiyDe267Q==
X-Google-Smtp-Source: ABdhPJxz8rzkbQwvcHyTbBOae8Oa8wIyiojq91YgM0xwDwwiL6ifOt2B+WsovJG+uM7AKx7nB37ATQ==
X-Received: by 2002:a17:90a:6001:: with SMTP id
 y1mr27477352pji.5.1624126512266; 
 Sat, 19 Jun 2021 11:15:12 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k35sm12059113pgi.21.2021.06.19.11.15.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 11:15:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/33] util/oslib-win32: Fix fatal assertion in
 qemu_try_memalign
Date: Sat, 19 Jun 2021 11:14:52 -0700
Message-Id: <20210619181452.877683-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619181452.877683-1-richard.henderson@linaro.org>
References: <20210619181452.877683-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Weil <sw@weilnetz.de>

The function is called with alignment == 0 which caused an assertion.
Use the code from oslib-posix.c to fix that regression.

Fixes: ed6f53f9ca9
Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210611105846.347954-1-sw@weilnetz.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 util/oslib-win32.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index ee3a3692d8..af559ef339 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -58,7 +58,11 @@ void *qemu_try_memalign(size_t alignment, size_t size)
     void *ptr;
 
     g_assert(size != 0);
-    g_assert(is_power_of_2(alignment));
+    if (alignment < sizeof(void *)) {
+        alignment = sizeof(void *);
+    } else {
+        g_assert(is_power_of_2(alignment));
+    }
     ptr = _aligned_malloc(size, alignment);
     trace_qemu_memalign(alignment, size, ptr);
     return ptr;
-- 
2.25.1


