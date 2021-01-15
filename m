Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9ED2F88ED
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 23:53:49 +0100 (CET)
Received: from localhost ([::1]:36810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0XyV-0001Rw-IG
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 17:53:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0XsC-0003ZK-0F
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:47:17 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:42969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0Xrw-0005EB-FJ
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:47:14 -0500
Received: by mail-pg1-x534.google.com with SMTP id g15so6927498pgu.9
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 14:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rr4uhte3iLsKjX8Cbli6gBSl01cB/KM2FqNYctfYPe4=;
 b=ZwiPCxB+pgxqBSVhiKyzXLXxQL2ZxeJzOVekdmh0Png2yTdh5LHtbGJfe4xgh5KT5j
 MONKrUNjyAZIo/Q1APKbecM5C3a2XWQ9n1SkdQYEIAjD3by8a1EfLqIC78kqEvzPy2Iw
 X/eFDlBpD3YCYzZa19NwkpOOx/Y3yf+HWoCgmgKo2BTMP+Trc3cJb3vfouNGqfVOHF2Y
 J5j3S2NZgFFGIVUnvR5Mzy56uZgnFXNcA5fWhPpPP37Eb9xSnyHYOAKi9+o1+1smjgD0
 z6HBA6xwvzedCCq9CzuCJnhO++Kf0zAKKG6opn1QJNchgzU6sBesjQK/wu7znGiPrZRK
 7YOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rr4uhte3iLsKjX8Cbli6gBSl01cB/KM2FqNYctfYPe4=;
 b=fvocsuirMti1xAdwBkMBLcM61BeENGLSNeVZOIOjcOsSiWEtEqyYxO8jYhUEbwu78l
 E2qFSku8qxDAAXgugjDS2CCOYmdJW+tztxMSHQOng6Zw87ihn6qxMVw6JBK395Ha5g0V
 jBtvDNVRizfendt1Mja/Y/mo6HTrCSXtYUYa7mSRWhu3T9EKUaHAdm1UYDCRYePHrTy1
 XJvnbveKvMT7iK5aez8mzB/dLEAw+Bzfc5EENWyo3qmv2Dw+hAQ1YMESt9pdDR5m+K2Z
 sr9qaiQLFHfk/VZHIdsKl7V/5i7japDm43ka539/3EgfZCXMhCCHsaDU5DXIe1YNLHv8
 D3PA==
X-Gm-Message-State: AOAM5336ioucxHpnVxox26ZmbXxl2jI609vOkfLjBaF3loccH5vSy4dp
 +4JsawQIcSguPqef4av2lBYl0+PJ2wleX7OD
X-Google-Smtp-Source: ABdhPJxcsT7aNJHrEI9kefNnsvCzOZVgUW1giA0hGvYOCmrvP2zkMcewy7L+kS2jcSFk2KJJ6Kc8Cg==
X-Received: by 2002:aa7:9706:0:b029:19d:a2c6:aeb with SMTP id
 a6-20020aa797060000b029019da2c60aebmr14865467pfg.36.1610750818505; 
 Fri, 15 Jan 2021 14:46:58 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id s13sm9521700pfd.99.2021.01.15.14.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 14:46:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/21] linux-user: Check for overflow in access_ok
Date: Fri, 15 Jan 2021 12:46:30 -1000
Message-Id: <20210115224645.1196742-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115224645.1196742-1-richard.henderson@linaro.org>
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Verify that addr + size - 1 does not wrap around.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/qemu.h | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 534753ca12..a0f670832e 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -489,12 +489,19 @@ extern unsigned long guest_stack_size;
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
2.25.1


