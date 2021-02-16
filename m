Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8004331CDF3
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 17:25:58 +0100 (CET)
Received: from localhost ([::1]:51600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC3Aj-0001Il-Gl
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 11:25:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32N-00075o-Cc
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:20 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:54082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32B-0002NM-2X
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:19 -0500
Received: by mail-wm1-x336.google.com with SMTP id x16so1186296wmk.3
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 08:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=KtovKvTGdkOvy7IKN3clRcQY8cM5rmonWpslYQHWQiY=;
 b=xnUOCJdJmqp7Az6JvKr6mYt162i1ua0kXURL16kcb/zPRnDgAGSdakWE0d05fsD0Gl
 EG3xcEOO2SigmBZJX9zxMghXUzLK0XhhUOv72uuczbqzHtf5LM3yTYSjbjpT9Zwdj/S4
 bkFsQ1yvpMXxo3GSbBezr5P90KW0vkSjvTX39GmDA0zcmp+YmwLJ7NhTpJytdEX15dcc
 TfWTpWVv7zbylWMDj5nfJFGL7K+c5VhbefsOX8us6hY4cj1q/QKxJnOkYzbX/sFK3flE
 fvSlHkh7dO6Fuqwa/9d/8YANxioitWWmEplLpyV1+vG4rfxQWOvdkUqacH5yo384Co1C
 YZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KtovKvTGdkOvy7IKN3clRcQY8cM5rmonWpslYQHWQiY=;
 b=C+AGBxENaYMPzMGAHFFsodNUZtVKP04SroZYWHFP2B+Rp70HVPjiCgnPeFX4BLOq0J
 UFjURHoQZOOwywQsoLvtIu3JTrESyYUoGhYz2B/T815XGhS3n9072iQMUqYuioMy849Z
 ctCPpWM+KhqjVn7+e/26btJ0ylJnnvmphiCiWF+7l6MrQwkWD59Tj3x19s/Y9/SaUi95
 C21t3HixCBvKWMWpquMkZof+cFjWtu4NQrlEMTX0pRAaMlcJBQ0+a7cUvGaqnM21I3C2
 4EpFSSgxzf2rpr2Zu3/asRIE3QlBLEzVQnlsYsv7Z64wIe3GTAenT+u0MBYv3tsdlCQj
 qoKg==
X-Gm-Message-State: AOAM533OtQAnTxctaHl5Zk6aS5L5jImJYtlMoz5nnEmSbq9pNYM0nwHu
 MGiGwus/Z6mlXrkESb/m3rjzLhG/Xj7zTg==
X-Google-Smtp-Source: ABdhPJx/UJb1djm+b+6LkyS96EzGNtI7NtdHJo3EwSZmwON2PaKXV1UT8bqTYGJpQWHZnCo92pWZVg==
X-Received: by 2002:a1c:1dcc:: with SMTP id d195mr3993473wmd.42.1613492225765; 
 Tue, 16 Feb 2021 08:17:05 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d5sm30630482wrb.14.2021.02.16.08.17.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 08:17:05 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/40] bsd-user: Tidy VERIFY_READ/VERIFY_WRITE
Date: Tue, 16 Feb 2021 16:16:26 +0000
Message-Id: <20210216161658.29881-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210216161658.29881-1-peter.maydell@linaro.org>
References: <20210216161658.29881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

These constants are only ever used with access_ok, and friends.
Rather than translating them to PAGE_* bits, let them equal
the PAGE_* bits to begin.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210212184902.1251044-9-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 bsd-user/qemu.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index f8bb1e5459d..4076adabd08 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -218,13 +218,12 @@ extern unsigned long x86_stack_size;
 
 /* user access */
 
-#define VERIFY_READ 0
-#define VERIFY_WRITE 1 /* implies read access */
+#define VERIFY_READ  PAGE_READ
+#define VERIFY_WRITE (PAGE_READ | PAGE_WRITE)
 
-static inline int access_ok(int type, abi_ulong addr, abi_ulong size)
+static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
 {
-    return page_check_range((target_ulong)addr, size,
-                            (type == VERIFY_READ) ? PAGE_READ : (PAGE_READ | PAGE_WRITE)) == 0;
+    return page_check_range((target_ulong)addr, size, type) == 0;
 }
 
 /* NOTE __get_user and __put_user use host pointers and don't check access. */
-- 
2.20.1


