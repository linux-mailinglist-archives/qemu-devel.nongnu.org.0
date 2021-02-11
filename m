Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D20318BE6
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:23:10 +0100 (CET)
Received: from localhost ([::1]:43198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lABw5-000144-89
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:23:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABYz-00085q-0v
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:17 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:32797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABYx-0008QW-8N
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:16 -0500
Received: by mail-wr1-x42c.google.com with SMTP id 7so4127443wrz.0
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=OnfOygHIMNXAAkLXI4Fs2xQ1ZBnGDlgl1MLlwjZp+qg=;
 b=L2+1HmwfbKYrq8a20zuaE796fdN0RYQjB2CnkiTrFqqMBmn1b3n8EH7bEuP3d55a/e
 q1DcRSl1wqsRNMxH2fiHKp5xv2+WF4yDvMylSuhfeE6JZFEWGNiPFyNbHsK9KDkG4HZZ
 w4eG/6PzpgHVVtX9tgCcYUvxyIFATSRTAjzmAv5oToEgN3O5E6cqudmOuEZNAuAuF6yK
 VbY1gPyXze84eED2YKq7BWLDr2q+jityQ8z7tPfKD8/nM9keIEQUq6aKoYXPUZUD10WO
 so8/7zUIY5NE+CdQd4CO9q6WlJfbBUcFS2VsY190C8rL+YzFnllX6+kfIu1mAPPC5BOK
 yeig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OnfOygHIMNXAAkLXI4Fs2xQ1ZBnGDlgl1MLlwjZp+qg=;
 b=WQjGAyXxDTBEGAbkuw7uzHGfvGpNsJjIH2q5/YyKwltXxdZxcm25XasguBiVxWaG3l
 xbyNDhjUJHfOrde/h00/KZr3grWOAYohyMMCgPSMaAiCwKStl+r/+oOb70mWOdeXQ+VE
 ZD7JGv6ioRhRfhRXHGiIaoJPe715cqsH3heFLKVVIeslz3kyCtalgSHWCJ6RRp5upqG4
 mHfWCg/3Y2D2sKAGXki22m37P8HiEUyqjmEH1+V5GorIZAPVyoKlqnIRECrAubm7UorT
 Yn+cJG4KUKZtvIYgb74YLOBSiobPuW8jQXmbraLexjSpGzcaBAA6c0SdhKeZUyTc10+u
 UXpw==
X-Gm-Message-State: AOAM532HmvAS7l/XJ9M70KWqd7aPAgN4moJY9gXqNuLHqc5W5lif3EqY
 cZQXEy2amZ/PJ7gQa1nF7tIluJKV50FaNA==
X-Google-Smtp-Source: ABdhPJx4lYa+PjJbCccT9xQN/DvrarbBpv0PMpmiHQcQlLjwu0RY3q8kJMf6c1YkA05bHojI+Y4xLw==
X-Received: by 2002:adf:e511:: with SMTP id j17mr5781754wrm.251.1613048354005; 
 Thu, 11 Feb 2021 04:59:14 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g15sm4955716wrx.1.2021.02.11.04.59.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:59:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/45] linux-user: Check for overflow in access_ok
Date: Thu, 11 Feb 2021 12:58:30 +0000
Message-Id: <20210211125900.22777-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211125900.22777-1-peter.maydell@linaro.org>
References: <20210211125900.22777-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Verify that addr + size - 1 does not wrap around.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210210000223.884088-7-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/qemu.h | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 17aa9921657..441ba6a78bb 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -491,12 +491,19 @@ extern unsigned long guest_stack_size;
 #define VERIFY_READ 0
 #define VERIFY_WRITE 1 /* implies read access */
 
-static inline int access_ok(int type, abi_ulong addr, abi_ulong size)
+static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
 {
-    return guest_addr_valid(addr) &&
-           (size == 0 || guest_addr_valid(addr + size - 1)) &&
-           page_check_range((target_ulong)addr, size,
-                            (type == VERIFY_READ) ? PAGE_READ : (PAGE_READ | PAGE_WRITE)) == 0;
+    if (!guest_addr_valid(addr)) {
+        return false;
+    }
+    if (size != 0 &&
+        (addr + size - 1 < addr ||
+         !guest_addr_valid(addr + size - 1))) {
+        return false;
+    }
+    return page_check_range((target_ulong)addr, size,
+                            (type == VERIFY_READ) ? PAGE_READ :
+                            (PAGE_READ | PAGE_WRITE)) == 0;
 }
 
 /* NOTE __get_user and __put_user use host pointers and don't check access.
-- 
2.20.1


