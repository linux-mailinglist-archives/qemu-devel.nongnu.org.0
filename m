Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC3E381F04
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 15:10:23 +0200 (CEST)
Received: from localhost ([::1]:39774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liGXG-0007pW-GD
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 09:10:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFzc-0007sJ-Bp
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:36 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:42745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFz7-0007rr-QB
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:36 -0400
Received: by mail-qk1-x72f.google.com with SMTP id o27so3288084qkj.9
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g5JrLWpPIY2+zmkGea0CLj546B5kax6Igz9HQumup6Y=;
 b=wBjeJnjq56qyDsvLr6dujVjn5vRr6AVblwxMcjjZKjdeU9FwYv4QubAp1p4aYt8CQR
 0KS7XTwX+n0bpv/u1NMoDm1bDeW9ZXt32I0C7IpjYkhcLxNVplXVXaocxNy5RSRXiag2
 zMFZ8D9NVZky+WaewFlk8uInJmZOc5FgcifeGDjJrBMKSB0zyhNMLRcrwQo2VhjrfgFz
 3sUI3aitw8a1rlLwPtZiGyvZD6vrC/dYv5tDquyWjD8eav3PITNzVIPxrkB2Mo3UmWLN
 DCwh9/ti9vCcUaPi38nooxs/yLdD2LYK6UbS5qj2RsXXygzy3IggLJmismdxXhj8OI9B
 DXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g5JrLWpPIY2+zmkGea0CLj546B5kax6Igz9HQumup6Y=;
 b=d8ba9G3joedWr6cf4B3DGYi5NKiBm2R70hcCYxp+dM02MMlcR3LFx5x/FiAGIrKOyF
 bWUMoKHrfXwuLJ0CoBvxXRPLXIHOJf8ZGa4sst6xSQsRB04ghKodNVEb5ItS3jk9Drg6
 JBp96f1xL3pJoNwvrpDu2zBh9BcJkS1PnttnN7uLd3F8f5f0IIuUAlGzzp8XsR7GPwTv
 ENCPnfjXuTHuqxbHkmFCtmUF8gDx3Sp5sTHYqxuNc0qIugXr1SwtDEL6TJfHJe1QU1BI
 RQ/JVXG1gCa8qp3pTtWKMZwwSPMpq/ZPPsX5IoF5KDi8fEEBvdVu4qVCMJLkRpTsGtVW
 GrJQ==
X-Gm-Message-State: AOAM5331XVUwFZU8CvwiHbd2U97nYje+liwNZ/l7/8z89Br8YXAa6QiH
 O2MdnYohSPVO5a2mAnddSVGqJcanD1OxGuJO0VE=
X-Google-Smtp-Source: ABdhPJwck5D1QNznmMtx71FQMv2T2jKIMIYS1M0Esl94jf0goWXR0f9WtPsNIGHEkmHaQJFDcbNtNg==
X-Received: by 2002:a05:620a:1585:: with SMTP id
 d5mr20319823qkk.29.1621168504786; 
 Sun, 16 May 2021 05:35:04 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id s5sm8500553qkg.88.2021.05.16.05.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:35:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 39/46] softfloat: Use add192 in mul128To256
Date: Sun, 16 May 2021 07:34:24 -0500
Message-Id: <20210516123431.718318-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516123431.718318-1-richard.henderson@linaro.org>
References: <20210516123431.718318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72f.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can perform the operation in 6 total adds instead of 8.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat-macros.h | 37 +++++++++++-----------------------
 1 file changed, 12 insertions(+), 25 deletions(-)

diff --git a/include/fpu/softfloat-macros.h b/include/fpu/softfloat-macros.h
index f6dfbe108d..76327d844d 100644
--- a/include/fpu/softfloat-macros.h
+++ b/include/fpu/softfloat-macros.h
@@ -511,34 +511,21 @@ static inline void
 | the locations pointed to by `z0Ptr', `z1Ptr', `z2Ptr', and `z3Ptr'.
 *----------------------------------------------------------------------------*/
 
-static inline void
- mul128To256(
-     uint64_t a0,
-     uint64_t a1,
-     uint64_t b0,
-     uint64_t b1,
-     uint64_t *z0Ptr,
-     uint64_t *z1Ptr,
-     uint64_t *z2Ptr,
-     uint64_t *z3Ptr
- )
+static inline void mul128To256(uint64_t a0, uint64_t a1,
+                               uint64_t b0, uint64_t b1,
+                               uint64_t *z0Ptr, uint64_t *z1Ptr,
+                               uint64_t *z2Ptr, uint64_t *z3Ptr)
 {
-    uint64_t z0, z1, z2, z3;
-    uint64_t more1, more2;
+    uint64_t z0, z1, z2;
+    uint64_t m0, m1, m2, n1, n2;
 
-    mul64To128( a1, b1, &z2, &z3 );
-    mul64To128( a1, b0, &z1, &more2 );
-    add128( z1, more2, 0, z2, &z1, &z2 );
-    mul64To128( a0, b0, &z0, &more1 );
-    add128( z0, more1, 0, z1, &z0, &z1 );
-    mul64To128( a0, b1, &more1, &more2 );
-    add128( more1, more2, 0, z2, &more1, &z2 );
-    add128( z0, z1, 0, more1, &z0, &z1 );
-    *z3Ptr = z3;
-    *z2Ptr = z2;
-    *z1Ptr = z1;
-    *z0Ptr = z0;
+    mul64To128(a1, b0, &m1, &m2);
+    mul64To128(a0, b1, &n1, &n2);
+    mul64To128(a1, b1, &z2, z3Ptr);
+    mul64To128(a0, b0, &z0, &z1);
 
+    add192( 0, m1, m2,  0, n1, n2, &m0, &m1, &m2);
+    add192(m0, m1, m2, z0, z1, z2, z0Ptr, z1Ptr, z2Ptr);
 }
 
 /*----------------------------------------------------------------------------
-- 
2.25.1


