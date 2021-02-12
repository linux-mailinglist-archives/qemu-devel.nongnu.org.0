Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA7731A52B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 20:16:07 +0100 (CET)
Received: from localhost ([::1]:37178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAdvC-0007HP-RA
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 14:16:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVO-0001bB-Df
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:27 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:36328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVG-0007m2-1C
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:25 -0500
Received: by mail-pl1-x630.google.com with SMTP id e9so327439plh.3
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 10:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VyGOgXRVYXE4KsV9afYsCBAI5eV0Qm7bovPtD8hErTQ=;
 b=DlQ9nXFood1iSmBqjhhD9Nlo3i+GQYdJ0P9SaBRww/pda8UxNta4ePWy4qhwKhzcD/
 spPPVRRH+cBhvxL+RBKWAEj4p216Dw6I8veebOL6nqV8ieHTeapq7TpIlq1j6/OCQNll
 frf/wWCn5TAeQO3y0c87TH3PvQvRx0JIt4bimlFLmj/Hzm0rxRYZbyb8hcjafdUizG1e
 lQ+aISuChOVEsuWvWBwDLBhINt8t0N9lReEEWhFIDOP80YxGxKkmY9X7WPZEszIjdfZZ
 89vc75j64zGqwVjA77rMonVXyJHGkKt7hsO5syClZ1TS9vnZNpLHll8azav1g9frQ5HO
 ZjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VyGOgXRVYXE4KsV9afYsCBAI5eV0Qm7bovPtD8hErTQ=;
 b=kZqUxG65w3ixaO/GYPErZE0Lys5Bl6zimlkbFHEbJ1cYRYoyAxdBzideyJ5wNwq4Pc
 hf8kjYcwsghLYr3oOgw0f9QC5inyn18HP+dccwDiOCs9eSsSQ2PI9DseRsWLKvSbyYEO
 8RD8Nh3BXIs3d9Y4QpvcwHRD5JrkHbJNv9Roq67pc37ImnQqVzmo5NTGVzkQHJrjHXdm
 Rnjb0hUCxyscgLs4cwLKfR6RXw4eYZ4BOO7jcW/aPZ9FDEFzcmcBxXxzM5GOsvunUwEW
 frMBYcHP7knj3q/TXGhWUgfl0CGqWfPExbyv7HtMUINUcxc0jqVxHnPLTeC/Unvo5dC9
 /oxA==
X-Gm-Message-State: AOAM531DgxLD3r3aShph6mVZMfQ398IV+sNTXuQsUzQMW5FY5mpTtuhU
 /J2zfwwHDYv1/T4A1V2L/nY6+cUDodzRxA==
X-Google-Smtp-Source: ABdhPJwHyD3mXCIT5+HuwWaRZa4j3hoY30UQ+plSh1Woxl/IargxQWHqhUwheG62odCvB4SFL3npvw==
X-Received: by 2002:a17:90b:4a8c:: with SMTP id
 lp12mr3890918pjb.214.1613155753476; 
 Fri, 12 Feb 2021 10:49:13 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id k5sm9427618pfi.31.2021.02.12.10.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 10:49:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 07/31] linux-user: Tidy VERIFY_READ/VERIFY_WRITE
Date: Fri, 12 Feb 2021 10:48:38 -0800
Message-Id: <20210212184902.1251044-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210212184902.1251044-1-richard.henderson@linaro.org>
References: <20210212184902.1251044-1-richard.henderson@linaro.org>
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These constants are only ever used with access_ok, and friends.
Rather than translating them to PAGE_* bits, let them equal
the PAGE_* bits to begin.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/qemu.h | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 441ba6a78b..9251337daf 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -488,8 +488,8 @@ extern unsigned long guest_stack_size;
 
 /* user access */
 
-#define VERIFY_READ 0
-#define VERIFY_WRITE 1 /* implies read access */
+#define VERIFY_READ  PAGE_READ
+#define VERIFY_WRITE (PAGE_READ | PAGE_WRITE)
 
 static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
 {
@@ -501,9 +501,7 @@ static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
          !guest_addr_valid(addr + size - 1))) {
         return false;
     }
-    return page_check_range((target_ulong)addr, size,
-                            (type == VERIFY_READ) ? PAGE_READ :
-                            (PAGE_READ | PAGE_WRITE)) == 0;
+    return page_check_range((target_ulong)addr, size, type) == 0;
 }
 
 /* NOTE __get_user and __put_user use host pointers and don't check access.
-- 
2.25.1


