Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE2F2F88FC
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 23:58:29 +0100 (CET)
Received: from localhost ([::1]:46512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Y32-0005Wa-8O
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 17:58:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0XsF-0003du-PV
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:47:19 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:42960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0Xs1-0005FM-6J
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:47:19 -0500
Received: by mail-pg1-x52a.google.com with SMTP id g15so6927559pgu.9
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 14:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cekQQRp0i5HZWYUW7TcRhFHir1r8zA6FY8NgWmITL0g=;
 b=jWLwcRYiTngZ/Nzz67lB7NXK3iTuCNdax0+JWEbw4ZbC3U3xoWG/MaR5AOW2OwF0BB
 wbAETgmrWBV8aZ6tqMm8j8Qjl0gIutGuAvU2+sBOBKrlcakQLADxK+jSwxefH69a4c/t
 vB7HG3edLYHC4TEXrRmyyME2Kkt/IfiVl1hIXRS/A+up3JLGmngS9I+mSFqrfqn3fYV7
 4e7IPFPTegFAa6LcAiFwrONaKLXfNy5JjXM4CxrwYLyzaeFLhuLMv8Fc80XLtLju9U+V
 uNTczzPWKSv6Tc6jEDOE8LfeuqfZB6DF1xQWt4ZWCw9HNZdI/16zg20pL486EHWK4A0j
 JoTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cekQQRp0i5HZWYUW7TcRhFHir1r8zA6FY8NgWmITL0g=;
 b=phSy/9BWyjKWAIiZ1YFWxP4BNLwrjSOBSAlAaWEt6bXUOUOUgmY1Gr8dXy1gAsorlO
 Lzbb7/n4zx15VtBTh2jjG9aphsgv9BS4yU6SJI6pNCfGjAk82HCIwAp3FLoa70iltSuA
 qV2q9H5+9dGKj163Aa1IhWAFHT8cBkmGhxLU4Ss/qa50EApeSVxSsaXptu/vQ4/7TKzM
 opBqOnSEYDp6YpOhYQ4bzE4DvLxwdqXsHJWBDbGihxhzaydEyb9G6UFdnIhe9I453wX3
 UOoxAMnc+YIJAlXWrJLv0/aeZDRipKK1UKIO2fCYyoXl1CyxfnDsNR8AxEohWdGW0Aij
 /jBA==
X-Gm-Message-State: AOAM531O5OAVK4XyHtma2AHY7VHDRJ+RdlgQr/uyvEvzCu7Do5GfiZFD
 7VugjfCDCVh1DzlEK4erOHTB1FxJGR2c9ypE
X-Google-Smtp-Source: ABdhPJwybbMjXU099WikbW4ojpTd6f9K0ktxyEX6YnamUwcN+OFzbjsCekDghIjlNqKpLAraB9p9CA==
X-Received: by 2002:a63:6305:: with SMTP id x5mr14466820pgb.216.1610750821621; 
 Fri, 15 Jan 2021 14:47:01 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id s13sm9521700pfd.99.2021.01.15.14.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 14:47:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/21] bsd-user: Tidy VERIFY_READ/VERIFY_WRITE
Date: Fri, 15 Jan 2021 12:46:32 -1000
Message-Id: <20210115224645.1196742-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115224645.1196742-1-richard.henderson@linaro.org>
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These constants are only ever used with access_ok, and friends.
Rather than translating them to PAGE_* bits, let them equal
the PAGE_* bits to begin.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/qemu.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index f8bb1e5459..4076adabd0 100644
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
2.25.1


