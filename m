Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F018331A4C7
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 19:53:00 +0100 (CET)
Received: from localhost ([::1]:47162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAdYp-0003cW-UE
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 13:52:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVO-0001b1-7M
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:26 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:43095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVH-0007mi-SF
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:25 -0500
Received: by mail-pf1-x42b.google.com with SMTP id c11so51791pfp.10
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 10:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yq9neRE5uhExlneFuBSgGmaVVsCJdyYjAvE1n9KBmpg=;
 b=zhkIkZmBz73By3nW8zYF3JRnY4XVdW2rmTidi/D7e7+M4GGChAFNJppCmLMiE0FUZj
 v/W1x6+EIzxLP3kjEwBEPs0PdcLUyGHMY6JiY1p2HXQJpEncEwgbr3pskZzKNEKZ5kxJ
 uevQDtfGdyJ381rSXZ0Yx3E+X1hXefnuhnpffDLw7D8UGM0i5xPM7ClvzrliP6/QLx8f
 cEeJ1dszdmrh7YHEr8HYso/D/EZ1qBbuzqweP9AP8j2QZbyVYqN48ODcb48RYTGK6nAR
 owE2WDlTvGcBxfFwqdlH5JLHiOk5GVgzwRKppApRCydOL+Wx5DKkuzZIA8pERigM8eIZ
 eNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yq9neRE5uhExlneFuBSgGmaVVsCJdyYjAvE1n9KBmpg=;
 b=Rs6Z99LYnQ25UCi7J2pFIP8F2TOzJwVvraVFB7swNfec8W88W3KyxjmtfcT6TZtLmx
 lyzP7Y8FR5j525rEgY5EdnMNefYc1YdZbUqCYzP7+GXV1UAHoq0oFUasmo5/TzPGQ9rq
 O2MgJVKz4odQDPvmAUITOc+CTHXQq1BSpjqQbPk0zCjssiOYFHhCOPCqJouLjlrnstg6
 onN3Fb0I5Heyr6JKLNFi8L3/Yq0CTm5LIFKgeO+w4INYuVrdXzGSwqEesnNLvByudOR8
 3DS6uATzXSsdbKSCR2xtEb9VDQ4vBJfmY9RBxE7cEt642Tumwo3oALGyZhuL4WegW4vQ
 dY2w==
X-Gm-Message-State: AOAM530AHdg/N+iaWJMWxqe2mIIpoDfh7QuBsSBuyniAP+JEfnZ6BTse
 78cdLqW2LwUJC1N5eNsJAysT/s2pm8/eog==
X-Google-Smtp-Source: ABdhPJwfNj3Ww/a0PLq2WnyrqS2cgbsggYP1Uajso/Ewfws/9kFy3MJ6rRDS0y053xIAlx1Z18zusA==
X-Received: by 2002:a63:5705:: with SMTP id l5mr4520134pgb.415.1613155754362; 
 Fri, 12 Feb 2021 10:49:14 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id k5sm9427618pfi.31.2021.02.12.10.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 10:49:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 08/31] bsd-user: Tidy VERIFY_READ/VERIFY_WRITE
Date: Fri, 12 Feb 2021 10:48:39 -0800
Message-Id: <20210212184902.1251044-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210212184902.1251044-1-richard.henderson@linaro.org>
References: <20210212184902.1251044-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: peter.maydell@linaro.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These constants are only ever used with access_ok, and friends.
Rather than translating them to PAGE_* bits, let them equal
the PAGE_* bits to begin.

Reviewed-by: Warner Losh <imp@bsdimp.com>
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


