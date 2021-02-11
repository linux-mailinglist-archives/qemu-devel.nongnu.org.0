Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1A3318BEB
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:25:50 +0100 (CET)
Received: from localhost ([::1]:51642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAByf-0004dD-Nb
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:25:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABYz-000873-EC
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:17 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:37276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABYx-0008RQ-SW
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:17 -0500
Received: by mail-wm1-x331.google.com with SMTP id m1so5642960wml.2
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=k24l6V2v0PKg+s2YVxBs6b556yq59N9tvuPY0mxSPMk=;
 b=ylKsB2WKERWij7lfxJhhp9Gr1hQF8/30glw9WlHf9t0t1eLd7J61JUZJBIH60Ny696
 UlnVmOsfCYbOZFbEbCnyCk2HE+wqaWP0eJoGYlDg/VXdeh9w3IKfvu8OkzQry2R85EFk
 Gcxp3RKZkrb4GJXe3oGkrHF7cMlnPjndQb3VDKArw2f/96fbZ+u9b7apivKAhOieygqX
 oakRIFGCO6FTSFzuR5R4o8s4l+p3Rs9vSKAtfQk8VPvyujxOAzelNm1qZ1MBVvWPfZXv
 h5E5ztElCbhOtvuBZvvYdDWl1kufG4bBgBQu77/5dtWavN1afhsCA4j/QbAwqsqQ04d1
 hh9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k24l6V2v0PKg+s2YVxBs6b556yq59N9tvuPY0mxSPMk=;
 b=hVEvU+n8KV84oc7h1gfqlCQH9ODt9r2C2nW3HsbIOtFYj0Qu/tvRI0f/x7S1pV76Sd
 9d5Ljku4QGTWIS+2jS52rjyFt+o/1O3prTohwJ2HbE9M8onw7fOkJkk0KGnJTaawPdMb
 4WD4sHVCF6s7qW7il6xNMY2btSVWEeowx8ppCd/Ch8cVtYA/hcWJvIGKepzCDjYCRlaX
 XxJcKWikYz2Q42oRRDnOkw/jxJ4L9oitgNCSzBvJNOMtBJPZ1m4lmKA536/RiL01Eonu
 JY1ap0WlXEdYY2yWA6nuyN1zKRMyTr8nAGNLTxbDM6sHXft+FxzhH10zA7XFo1Lxn9i/
 vsuA==
X-Gm-Message-State: AOAM532npIvpyG5SmD2CNeUlDON1DkVoQ3y26lQUocjQD3NZnL8/BHjK
 Olg3Om1sZzbxyU4ED4qAFb73lf9nze0E5Q==
X-Google-Smtp-Source: ABdhPJxMczFN1d8qrvR+zOSNFIiy1FyRmv3OtKiy5VVWd8HwE7xiexQ5pt/41+aqOOylBqIHiXhmPQ==
X-Received: by 2002:a1c:7312:: with SMTP id d18mr5023438wmb.155.1613048354606; 
 Thu, 11 Feb 2021 04:59:14 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g15sm4955716wrx.1.2021.02.11.04.59.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:59:14 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/45] linux-user: Tidy VERIFY_READ/VERIFY_WRITE
Date: Thu, 11 Feb 2021 12:58:31 +0000
Message-Id: <20210211125900.22777-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211125900.22777-1-peter.maydell@linaro.org>
References: <20210211125900.22777-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210210000223.884088-8-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/qemu.h | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 441ba6a78bb..9251337daf2 100644
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
2.20.1


