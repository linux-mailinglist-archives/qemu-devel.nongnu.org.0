Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A8E376E7C
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:19:08 +0200 (CEST)
Received: from localhost ([::1]:39934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCYd-000061-Pj
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC59-0004YR-SV
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:40 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:41887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4x-0003ed-0G
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:39 -0400
Received: by mail-pl1-x629.google.com with SMTP id z18so2556760plg.8
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MzK67c0LqpIZxoZVvjAbHdBDY8rBUVMdqwYx5iyXsWY=;
 b=JR1h2RVsk7eRFTWXZCB6c2EFXIw54jIMcJnMufiPi+ID2/Sy7G7Z87FYixhJdhPDHq
 UvG6uv4xnIecpnVQwGawmNFmQl8k+NQcB4tgE1rleyF9SvoUWFjFo19Iut9hrty0Xtq5
 GBF3olYM949xEaDx7/ivkHnrmrFktRQBKfGN5y0aIPAdP3A5WzhFtOXcRcKh9vmVfXab
 TPYPRv9Y3JXtbh2dmslKRGMgVhitICOzzqjHvTqfnZn//xFrjzgDbgrQ4pz08dJcR48g
 XxiDUvSNc/LERgg2Xn9flhPJDNAQUSElx2kLGOBZ9CtC0GOuZlLdYqXPwLgGORCxSEf/
 IZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MzK67c0LqpIZxoZVvjAbHdBDY8rBUVMdqwYx5iyXsWY=;
 b=eQcN2g9OVPqmsFpPlXScY/Nc3jT0lwvQ9rBcvSJu5RvPletB8WLfNxZ84pdM9CE9Nc
 xJvCIUexpXR0dqqRZFMQKTb926Sxr4G4CyO/lmDsA7sxPalX6Y5mPv2+Q9iFbw2YwjxH
 MqtDwhJEWLnQA5LYLt4UIpOrQjIcqCH9GDHavEqHEL2a13arJBAX8y1rv62FNua2yoYg
 M8e+jMWidvy++vOoN5/WusvvW4j9YJ+HKS2m0+YBMHLzfx2OLwUEZNArX0xn+fcO5UkN
 VUXNlkID2lQyDTZwh8eD3R0KvD4NaMdggAJeYaq7fTF0B8rBXLaVdOJ6CrVPAdq8rno1
 6qiw==
X-Gm-Message-State: AOAM533kuEgGczsW/lVGy60Msdtu8N5qTpe6GMHVR3U/Ge4Y6MNHMmeY
 40NxJM+0k6fjdMifW7a3SiFtI+AxzxljUg==
X-Google-Smtp-Source: ABdhPJxeQUHj9DiI+nG0d9rpskQPobERFlfe9baIhyyT+XGsg6J9u0MJdfi5WwaNB0lTjqm6ScEEGw==
X-Received: by 2002:a17:90a:7063:: with SMTP id
 f90mr26818761pjk.95.1620438505050; 
 Fri, 07 May 2021 18:48:25 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t4sm5819681pfq.165.2021.05.07.18.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:48:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 33/72] softfloat: Use uadd64_carry,
 usub64_borrow in softfloat-macros.h
Date: Fri,  7 May 2021 18:47:23 -0700
Message-Id: <20210508014802.892561-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Cc: alex.bennee@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use compiler support for carry arithmetic.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat-macros.h | 95 +++++++++-------------------------
 1 file changed, 25 insertions(+), 70 deletions(-)

diff --git a/include/fpu/softfloat-macros.h b/include/fpu/softfloat-macros.h
index a35ec2893a..2e3760a9c1 100644
--- a/include/fpu/softfloat-macros.h
+++ b/include/fpu/softfloat-macros.h
@@ -83,6 +83,7 @@ this code that are retained.
 #define FPU_SOFTFLOAT_MACROS_H
 
 #include "fpu/softfloat-types.h"
+#include "qemu/host-utils.h"
 
 /*----------------------------------------------------------------------------
 | Shifts `a' right by the number of bits given in `count'.  If any nonzero
@@ -403,16 +404,12 @@ static inline void
 | are stored at the locations pointed to by `z0Ptr' and `z1Ptr'.
 *----------------------------------------------------------------------------*/
 
-static inline void
- add128(
-     uint64_t a0, uint64_t a1, uint64_t b0, uint64_t b1, uint64_t *z0Ptr, uint64_t *z1Ptr )
+static inline void add128(uint64_t a0, uint64_t a1, uint64_t b0, uint64_t b1,
+                          uint64_t *z0Ptr, uint64_t *z1Ptr)
 {
-    uint64_t z1;
-
-    z1 = a1 + b1;
-    *z1Ptr = z1;
-    *z0Ptr = a0 + b0 + ( z1 < a1 );
-
+    bool c = 0;
+    *z1Ptr = uadd64_carry(a1, b1, &c);
+    *z0Ptr = uadd64_carry(a0, b0, &c);
 }
 
 /*----------------------------------------------------------------------------
@@ -423,34 +420,14 @@ static inline void
 | `z1Ptr', and `z2Ptr'.
 *----------------------------------------------------------------------------*/
 
-static inline void
- add192(
-     uint64_t a0,
-     uint64_t a1,
-     uint64_t a2,
-     uint64_t b0,
-     uint64_t b1,
-     uint64_t b2,
-     uint64_t *z0Ptr,
-     uint64_t *z1Ptr,
-     uint64_t *z2Ptr
- )
+static inline void add192(uint64_t a0, uint64_t a1, uint64_t a2,
+                          uint64_t b0, uint64_t b1, uint64_t b2,
+                          uint64_t *z0Ptr, uint64_t *z1Ptr, uint64_t *z2Ptr)
 {
-    uint64_t z0, z1, z2;
-    int8_t carry0, carry1;
-
-    z2 = a2 + b2;
-    carry1 = ( z2 < a2 );
-    z1 = a1 + b1;
-    carry0 = ( z1 < a1 );
-    z0 = a0 + b0;
-    z1 += carry1;
-    z0 += ( z1 < carry1 );
-    z0 += carry0;
-    *z2Ptr = z2;
-    *z1Ptr = z1;
-    *z0Ptr = z0;
-
+    bool c = 0;
+    *z2Ptr = uadd64_carry(a2, b2, &c);
+    *z1Ptr = uadd64_carry(a1, b1, &c);
+    *z0Ptr = uadd64_carry(a0, b0, &c);
 }
 
 /*----------------------------------------------------------------------------
@@ -461,14 +438,12 @@ static inline void
 | `z1Ptr'.
 *----------------------------------------------------------------------------*/
 
-static inline void
- sub128(
-     uint64_t a0, uint64_t a1, uint64_t b0, uint64_t b1, uint64_t *z0Ptr, uint64_t *z1Ptr )
+static inline void sub128(uint64_t a0, uint64_t a1, uint64_t b0, uint64_t b1,
+                          uint64_t *z0Ptr, uint64_t *z1Ptr)
 {
-
-    *z1Ptr = a1 - b1;
-    *z0Ptr = a0 - b0 - ( a1 < b1 );
-
+    bool c = 0;
+    *z1Ptr = usub64_borrow(a1, b1, &c);
+    *z0Ptr = usub64_borrow(a0, b0, &c);
 }
 
 /*----------------------------------------------------------------------------
@@ -479,34 +454,14 @@ static inline void
 | pointed to by `z0Ptr', `z1Ptr', and `z2Ptr'.
 *----------------------------------------------------------------------------*/
 
-static inline void
- sub192(
-     uint64_t a0,
-     uint64_t a1,
-     uint64_t a2,
-     uint64_t b0,
-     uint64_t b1,
-     uint64_t b2,
-     uint64_t *z0Ptr,
-     uint64_t *z1Ptr,
-     uint64_t *z2Ptr
- )
+static inline void sub192(uint64_t a0, uint64_t a1, uint64_t a2,
+                          uint64_t b0, uint64_t b1, uint64_t b2,
+                          uint64_t *z0Ptr, uint64_t *z1Ptr, uint64_t *z2Ptr)
 {
-    uint64_t z0, z1, z2;
-    int8_t borrow0, borrow1;
-
-    z2 = a2 - b2;
-    borrow1 = ( a2 < b2 );
-    z1 = a1 - b1;
-    borrow0 = ( a1 < b1 );
-    z0 = a0 - b0;
-    z0 -= ( z1 < borrow1 );
-    z1 -= borrow1;
-    z0 -= borrow0;
-    *z2Ptr = z2;
-    *z1Ptr = z1;
-    *z0Ptr = z0;
-
+    bool c = 0;
+    *z2Ptr = usub64_borrow(a2, b2, &c);
+    *z1Ptr = usub64_borrow(a1, b1, &c);
+    *z0Ptr = usub64_borrow(a0, b0, &c);
 }
 
 /*----------------------------------------------------------------------------
-- 
2.25.1


