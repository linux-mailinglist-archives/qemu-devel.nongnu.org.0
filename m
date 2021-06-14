Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFBA3A6A03
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:24:54 +0200 (CEST)
Received: from localhost ([::1]:48552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsoSL-0003UV-Op
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEX-0000ve-OE
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:37 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:44808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEM-0000HD-Tj
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:37 -0400
Received: by mail-wr1-x431.google.com with SMTP id f2so14930912wri.11
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g+MkORdyxrUpm6RPHbrcYTE1KJKpVHZOg8V/ZE/H9t0=;
 b=o5gqDHeby4Mg+cKyPU7rlts256SexWiigC+r1iWOSt2sVBlceWbKFOUIH8L1jgj/5J
 c7rmE5DVr9FvciY4uc5r/+5N+n/1sURMz1cb3My/kbF36iVNb2bMfysXa9e66kMlRmxA
 Woqn7kvqLItB1ceaqDRL3rIOFbtY6ZsrjnF4jOfqkOZyDZLR0BubijS0jK9p1pzS8COX
 3FL2nvoQ4i+XhsieJNK7o61lKvOoNK4nAlvPVren32ABY5G3pL1BxfVrAWVqQYh+AtEU
 eggfCObX4xAzbVLGteSMjaTKstuxRgZifQHbL4kT8/WipXWLtIEFfzfBJEZ/t77Pbc2+
 sxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g+MkORdyxrUpm6RPHbrcYTE1KJKpVHZOg8V/ZE/H9t0=;
 b=YNtnOtkwjTMWmn+E4rmdg/i5+xaiP/rWPYGhYktDZf5x+pzvmXCh/p5LaL4OiA7Jt/
 ImIddz17Hnez9xDHl5TEd5rWiJ/4saL3wt1cGmtTHix5l0flp5RM7X2d9p7jGYjgqEcn
 F/ViGIcTV0WedLCzQjmAP2a9XO0f/NUmkpNjlvdNEl+F5QIUUlT3ugsC+XqVmHTFQ3Mb
 xIBN/sHXy8EBqiTolpYI49WZbK6jajkN9fVJxTzF0ZFUKkMJoDM5KeMYHKboFNbXZfxo
 6xgTIOnbMstO/aX1XbWdpo9Uukku/ybOvMlI/M0KVQXbwzqCg8kZVdKGr3Anzs50QlYe
 cTNQ==
X-Gm-Message-State: AOAM531l7qN4HOMVD44b3KQMxGm3N5/fZ5dqnPZwiYz8euIdM2EnZqNl
 Ras9LT72koOt6ns5ePtn4wOBgQ==
X-Google-Smtp-Source: ABdhPJwYpIVuuWIfLoWeyfjNz//EhLwr624if+HcDrJ6pmxjMsmUy3shx/tGvk0iS1xUZZv701PjMg==
X-Received: by 2002:a5d:648a:: with SMTP id o10mr19172609wri.274.1623683422367; 
 Mon, 14 Jun 2021 08:10:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 13/57] target/arm: Move expand_pred_b() data to translate.c
Date: Mon, 14 Jun 2021 16:09:23 +0100
Message-Id: <20210614151007.4545-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For MVE, we want to re-use the large data table from expand_pred_b().
Move the data table to translate.c so it is no longer in an SVE
specific source file.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/vec_internal.h |   3 ++
 target/arm/sve_helper.c   | 103 ++------------------------------------
 target/arm/vec_helper.c   | 102 +++++++++++++++++++++++++++++++++++++
 3 files changed, 109 insertions(+), 99 deletions(-)

diff --git a/target/arm/vec_internal.h b/target/arm/vec_internal.h
index 613f3421b9c..865d2139447 100644
--- a/target/arm/vec_internal.h
+++ b/target/arm/vec_internal.h
@@ -50,6 +50,9 @@
 #define H8(x)   (x)
 #define H1_8(x) (x)
 
+/* Data for expanding active predicate bits to bytes, for byte elements. */
+extern const uint64_t expand_pred_b_data[256];
+
 static inline void clear_tail(void *vd, uintptr_t opr_sz, uintptr_t max_sz)
 {
     uint64_t *d = vd + opr_sz;
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index a373f8c573e..321098e2651 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -103,108 +103,13 @@ uint32_t HELPER(sve_predtest)(void *vd, void *vg, uint32_t words)
     return flags;
 }
 
-/* Expand active predicate bits to bytes, for byte elements.
- *  for (i = 0; i < 256; ++i) {
- *      unsigned long m = 0;
- *      for (j = 0; j < 8; j++) {
- *          if ((i >> j) & 1) {
- *              m |= 0xfful << (j << 3);
- *          }
- *      }
- *      printf("0x%016lx,\n", m);
- *  }
+/*
+ * Expand active predicate bits to bytes, for byte elements.
+ * (The data table itself is in vec_helper.c as MVE also needs it.)
  */
 static inline uint64_t expand_pred_b(uint8_t byte)
 {
-    static const uint64_t word[256] = {
-        0x0000000000000000, 0x00000000000000ff, 0x000000000000ff00,
-        0x000000000000ffff, 0x0000000000ff0000, 0x0000000000ff00ff,
-        0x0000000000ffff00, 0x0000000000ffffff, 0x00000000ff000000,
-        0x00000000ff0000ff, 0x00000000ff00ff00, 0x00000000ff00ffff,
-        0x00000000ffff0000, 0x00000000ffff00ff, 0x00000000ffffff00,
-        0x00000000ffffffff, 0x000000ff00000000, 0x000000ff000000ff,
-        0x000000ff0000ff00, 0x000000ff0000ffff, 0x000000ff00ff0000,
-        0x000000ff00ff00ff, 0x000000ff00ffff00, 0x000000ff00ffffff,
-        0x000000ffff000000, 0x000000ffff0000ff, 0x000000ffff00ff00,
-        0x000000ffff00ffff, 0x000000ffffff0000, 0x000000ffffff00ff,
-        0x000000ffffffff00, 0x000000ffffffffff, 0x0000ff0000000000,
-        0x0000ff00000000ff, 0x0000ff000000ff00, 0x0000ff000000ffff,
-        0x0000ff0000ff0000, 0x0000ff0000ff00ff, 0x0000ff0000ffff00,
-        0x0000ff0000ffffff, 0x0000ff00ff000000, 0x0000ff00ff0000ff,
-        0x0000ff00ff00ff00, 0x0000ff00ff00ffff, 0x0000ff00ffff0000,
-        0x0000ff00ffff00ff, 0x0000ff00ffffff00, 0x0000ff00ffffffff,
-        0x0000ffff00000000, 0x0000ffff000000ff, 0x0000ffff0000ff00,
-        0x0000ffff0000ffff, 0x0000ffff00ff0000, 0x0000ffff00ff00ff,
-        0x0000ffff00ffff00, 0x0000ffff00ffffff, 0x0000ffffff000000,
-        0x0000ffffff0000ff, 0x0000ffffff00ff00, 0x0000ffffff00ffff,
-        0x0000ffffffff0000, 0x0000ffffffff00ff, 0x0000ffffffffff00,
-        0x0000ffffffffffff, 0x00ff000000000000, 0x00ff0000000000ff,
-        0x00ff00000000ff00, 0x00ff00000000ffff, 0x00ff000000ff0000,
-        0x00ff000000ff00ff, 0x00ff000000ffff00, 0x00ff000000ffffff,
-        0x00ff0000ff000000, 0x00ff0000ff0000ff, 0x00ff0000ff00ff00,
-        0x00ff0000ff00ffff, 0x00ff0000ffff0000, 0x00ff0000ffff00ff,
-        0x00ff0000ffffff00, 0x00ff0000ffffffff, 0x00ff00ff00000000,
-        0x00ff00ff000000ff, 0x00ff00ff0000ff00, 0x00ff00ff0000ffff,
-        0x00ff00ff00ff0000, 0x00ff00ff00ff00ff, 0x00ff00ff00ffff00,
-        0x00ff00ff00ffffff, 0x00ff00ffff000000, 0x00ff00ffff0000ff,
-        0x00ff00ffff00ff00, 0x00ff00ffff00ffff, 0x00ff00ffffff0000,
-        0x00ff00ffffff00ff, 0x00ff00ffffffff00, 0x00ff00ffffffffff,
-        0x00ffff0000000000, 0x00ffff00000000ff, 0x00ffff000000ff00,
-        0x00ffff000000ffff, 0x00ffff0000ff0000, 0x00ffff0000ff00ff,
-        0x00ffff0000ffff00, 0x00ffff0000ffffff, 0x00ffff00ff000000,
-        0x00ffff00ff0000ff, 0x00ffff00ff00ff00, 0x00ffff00ff00ffff,
-        0x00ffff00ffff0000, 0x00ffff00ffff00ff, 0x00ffff00ffffff00,
-        0x00ffff00ffffffff, 0x00ffffff00000000, 0x00ffffff000000ff,
-        0x00ffffff0000ff00, 0x00ffffff0000ffff, 0x00ffffff00ff0000,
-        0x00ffffff00ff00ff, 0x00ffffff00ffff00, 0x00ffffff00ffffff,
-        0x00ffffffff000000, 0x00ffffffff0000ff, 0x00ffffffff00ff00,
-        0x00ffffffff00ffff, 0x00ffffffffff0000, 0x00ffffffffff00ff,
-        0x00ffffffffffff00, 0x00ffffffffffffff, 0xff00000000000000,
-        0xff000000000000ff, 0xff0000000000ff00, 0xff0000000000ffff,
-        0xff00000000ff0000, 0xff00000000ff00ff, 0xff00000000ffff00,
-        0xff00000000ffffff, 0xff000000ff000000, 0xff000000ff0000ff,
-        0xff000000ff00ff00, 0xff000000ff00ffff, 0xff000000ffff0000,
-        0xff000000ffff00ff, 0xff000000ffffff00, 0xff000000ffffffff,
-        0xff0000ff00000000, 0xff0000ff000000ff, 0xff0000ff0000ff00,
-        0xff0000ff0000ffff, 0xff0000ff00ff0000, 0xff0000ff00ff00ff,
-        0xff0000ff00ffff00, 0xff0000ff00ffffff, 0xff0000ffff000000,
-        0xff0000ffff0000ff, 0xff0000ffff00ff00, 0xff0000ffff00ffff,
-        0xff0000ffffff0000, 0xff0000ffffff00ff, 0xff0000ffffffff00,
-        0xff0000ffffffffff, 0xff00ff0000000000, 0xff00ff00000000ff,
-        0xff00ff000000ff00, 0xff00ff000000ffff, 0xff00ff0000ff0000,
-        0xff00ff0000ff00ff, 0xff00ff0000ffff00, 0xff00ff0000ffffff,
-        0xff00ff00ff000000, 0xff00ff00ff0000ff, 0xff00ff00ff00ff00,
-        0xff00ff00ff00ffff, 0xff00ff00ffff0000, 0xff00ff00ffff00ff,
-        0xff00ff00ffffff00, 0xff00ff00ffffffff, 0xff00ffff00000000,
-        0xff00ffff000000ff, 0xff00ffff0000ff00, 0xff00ffff0000ffff,
-        0xff00ffff00ff0000, 0xff00ffff00ff00ff, 0xff00ffff00ffff00,
-        0xff00ffff00ffffff, 0xff00ffffff000000, 0xff00ffffff0000ff,
-        0xff00ffffff00ff00, 0xff00ffffff00ffff, 0xff00ffffffff0000,
-        0xff00ffffffff00ff, 0xff00ffffffffff00, 0xff00ffffffffffff,
-        0xffff000000000000, 0xffff0000000000ff, 0xffff00000000ff00,
-        0xffff00000000ffff, 0xffff000000ff0000, 0xffff000000ff00ff,
-        0xffff000000ffff00, 0xffff000000ffffff, 0xffff0000ff000000,
-        0xffff0000ff0000ff, 0xffff0000ff00ff00, 0xffff0000ff00ffff,
-        0xffff0000ffff0000, 0xffff0000ffff00ff, 0xffff0000ffffff00,
-        0xffff0000ffffffff, 0xffff00ff00000000, 0xffff00ff000000ff,
-        0xffff00ff0000ff00, 0xffff00ff0000ffff, 0xffff00ff00ff0000,
-        0xffff00ff00ff00ff, 0xffff00ff00ffff00, 0xffff00ff00ffffff,
-        0xffff00ffff000000, 0xffff00ffff0000ff, 0xffff00ffff00ff00,
-        0xffff00ffff00ffff, 0xffff00ffffff0000, 0xffff00ffffff00ff,
-        0xffff00ffffffff00, 0xffff00ffffffffff, 0xffffff0000000000,
-        0xffffff00000000ff, 0xffffff000000ff00, 0xffffff000000ffff,
-        0xffffff0000ff0000, 0xffffff0000ff00ff, 0xffffff0000ffff00,
-        0xffffff0000ffffff, 0xffffff00ff000000, 0xffffff00ff0000ff,
-        0xffffff00ff00ff00, 0xffffff00ff00ffff, 0xffffff00ffff0000,
-        0xffffff00ffff00ff, 0xffffff00ffffff00, 0xffffff00ffffffff,
-        0xffffffff00000000, 0xffffffff000000ff, 0xffffffff0000ff00,
-        0xffffffff0000ffff, 0xffffffff00ff0000, 0xffffffff00ff00ff,
-        0xffffffff00ffff00, 0xffffffff00ffffff, 0xffffffffff000000,
-        0xffffffffff0000ff, 0xffffffffff00ff00, 0xffffffffff00ffff,
-        0xffffffffffff0000, 0xffffffffffff00ff, 0xffffffffffffff00,
-        0xffffffffffffffff,
-    };
-    return word[byte];
+    return expand_pred_b_data[byte];
 }
 
 /* Similarly for half-word elements.
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index e8138d3d222..034f6b84f78 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -25,6 +25,108 @@
 #include "qemu/int128.h"
 #include "vec_internal.h"
 
+/*
+ * Data for expanding active predicate bits to bytes, for byte elements.
+ *
+ *  for (i = 0; i < 256; ++i) {
+ *      unsigned long m = 0;
+ *      for (j = 0; j < 8; j++) {
+ *          if ((i >> j) & 1) {
+ *              m |= 0xfful << (j << 3);
+ *          }
+ *      }
+ *      printf("0x%016lx,\n", m);
+ *  }
+ */
+const uint64_t expand_pred_b_data[256] = {
+    0x0000000000000000, 0x00000000000000ff, 0x000000000000ff00,
+    0x000000000000ffff, 0x0000000000ff0000, 0x0000000000ff00ff,
+    0x0000000000ffff00, 0x0000000000ffffff, 0x00000000ff000000,
+    0x00000000ff0000ff, 0x00000000ff00ff00, 0x00000000ff00ffff,
+    0x00000000ffff0000, 0x00000000ffff00ff, 0x00000000ffffff00,
+    0x00000000ffffffff, 0x000000ff00000000, 0x000000ff000000ff,
+    0x000000ff0000ff00, 0x000000ff0000ffff, 0x000000ff00ff0000,
+    0x000000ff00ff00ff, 0x000000ff00ffff00, 0x000000ff00ffffff,
+    0x000000ffff000000, 0x000000ffff0000ff, 0x000000ffff00ff00,
+    0x000000ffff00ffff, 0x000000ffffff0000, 0x000000ffffff00ff,
+    0x000000ffffffff00, 0x000000ffffffffff, 0x0000ff0000000000,
+    0x0000ff00000000ff, 0x0000ff000000ff00, 0x0000ff000000ffff,
+    0x0000ff0000ff0000, 0x0000ff0000ff00ff, 0x0000ff0000ffff00,
+    0x0000ff0000ffffff, 0x0000ff00ff000000, 0x0000ff00ff0000ff,
+    0x0000ff00ff00ff00, 0x0000ff00ff00ffff, 0x0000ff00ffff0000,
+    0x0000ff00ffff00ff, 0x0000ff00ffffff00, 0x0000ff00ffffffff,
+    0x0000ffff00000000, 0x0000ffff000000ff, 0x0000ffff0000ff00,
+    0x0000ffff0000ffff, 0x0000ffff00ff0000, 0x0000ffff00ff00ff,
+    0x0000ffff00ffff00, 0x0000ffff00ffffff, 0x0000ffffff000000,
+    0x0000ffffff0000ff, 0x0000ffffff00ff00, 0x0000ffffff00ffff,
+    0x0000ffffffff0000, 0x0000ffffffff00ff, 0x0000ffffffffff00,
+    0x0000ffffffffffff, 0x00ff000000000000, 0x00ff0000000000ff,
+    0x00ff00000000ff00, 0x00ff00000000ffff, 0x00ff000000ff0000,
+    0x00ff000000ff00ff, 0x00ff000000ffff00, 0x00ff000000ffffff,
+    0x00ff0000ff000000, 0x00ff0000ff0000ff, 0x00ff0000ff00ff00,
+    0x00ff0000ff00ffff, 0x00ff0000ffff0000, 0x00ff0000ffff00ff,
+    0x00ff0000ffffff00, 0x00ff0000ffffffff, 0x00ff00ff00000000,
+    0x00ff00ff000000ff, 0x00ff00ff0000ff00, 0x00ff00ff0000ffff,
+    0x00ff00ff00ff0000, 0x00ff00ff00ff00ff, 0x00ff00ff00ffff00,
+    0x00ff00ff00ffffff, 0x00ff00ffff000000, 0x00ff00ffff0000ff,
+    0x00ff00ffff00ff00, 0x00ff00ffff00ffff, 0x00ff00ffffff0000,
+    0x00ff00ffffff00ff, 0x00ff00ffffffff00, 0x00ff00ffffffffff,
+    0x00ffff0000000000, 0x00ffff00000000ff, 0x00ffff000000ff00,
+    0x00ffff000000ffff, 0x00ffff0000ff0000, 0x00ffff0000ff00ff,
+    0x00ffff0000ffff00, 0x00ffff0000ffffff, 0x00ffff00ff000000,
+    0x00ffff00ff0000ff, 0x00ffff00ff00ff00, 0x00ffff00ff00ffff,
+    0x00ffff00ffff0000, 0x00ffff00ffff00ff, 0x00ffff00ffffff00,
+    0x00ffff00ffffffff, 0x00ffffff00000000, 0x00ffffff000000ff,
+    0x00ffffff0000ff00, 0x00ffffff0000ffff, 0x00ffffff00ff0000,
+    0x00ffffff00ff00ff, 0x00ffffff00ffff00, 0x00ffffff00ffffff,
+    0x00ffffffff000000, 0x00ffffffff0000ff, 0x00ffffffff00ff00,
+    0x00ffffffff00ffff, 0x00ffffffffff0000, 0x00ffffffffff00ff,
+    0x00ffffffffffff00, 0x00ffffffffffffff, 0xff00000000000000,
+    0xff000000000000ff, 0xff0000000000ff00, 0xff0000000000ffff,
+    0xff00000000ff0000, 0xff00000000ff00ff, 0xff00000000ffff00,
+    0xff00000000ffffff, 0xff000000ff000000, 0xff000000ff0000ff,
+    0xff000000ff00ff00, 0xff000000ff00ffff, 0xff000000ffff0000,
+    0xff000000ffff00ff, 0xff000000ffffff00, 0xff000000ffffffff,
+    0xff0000ff00000000, 0xff0000ff000000ff, 0xff0000ff0000ff00,
+    0xff0000ff0000ffff, 0xff0000ff00ff0000, 0xff0000ff00ff00ff,
+    0xff0000ff00ffff00, 0xff0000ff00ffffff, 0xff0000ffff000000,
+    0xff0000ffff0000ff, 0xff0000ffff00ff00, 0xff0000ffff00ffff,
+    0xff0000ffffff0000, 0xff0000ffffff00ff, 0xff0000ffffffff00,
+    0xff0000ffffffffff, 0xff00ff0000000000, 0xff00ff00000000ff,
+    0xff00ff000000ff00, 0xff00ff000000ffff, 0xff00ff0000ff0000,
+    0xff00ff0000ff00ff, 0xff00ff0000ffff00, 0xff00ff0000ffffff,
+    0xff00ff00ff000000, 0xff00ff00ff0000ff, 0xff00ff00ff00ff00,
+    0xff00ff00ff00ffff, 0xff00ff00ffff0000, 0xff00ff00ffff00ff,
+    0xff00ff00ffffff00, 0xff00ff00ffffffff, 0xff00ffff00000000,
+    0xff00ffff000000ff, 0xff00ffff0000ff00, 0xff00ffff0000ffff,
+    0xff00ffff00ff0000, 0xff00ffff00ff00ff, 0xff00ffff00ffff00,
+    0xff00ffff00ffffff, 0xff00ffffff000000, 0xff00ffffff0000ff,
+    0xff00ffffff00ff00, 0xff00ffffff00ffff, 0xff00ffffffff0000,
+    0xff00ffffffff00ff, 0xff00ffffffffff00, 0xff00ffffffffffff,
+    0xffff000000000000, 0xffff0000000000ff, 0xffff00000000ff00,
+    0xffff00000000ffff, 0xffff000000ff0000, 0xffff000000ff00ff,
+    0xffff000000ffff00, 0xffff000000ffffff, 0xffff0000ff000000,
+    0xffff0000ff0000ff, 0xffff0000ff00ff00, 0xffff0000ff00ffff,
+    0xffff0000ffff0000, 0xffff0000ffff00ff, 0xffff0000ffffff00,
+    0xffff0000ffffffff, 0xffff00ff00000000, 0xffff00ff000000ff,
+    0xffff00ff0000ff00, 0xffff00ff0000ffff, 0xffff00ff00ff0000,
+    0xffff00ff00ff00ff, 0xffff00ff00ffff00, 0xffff00ff00ffffff,
+    0xffff00ffff000000, 0xffff00ffff0000ff, 0xffff00ffff00ff00,
+    0xffff00ffff00ffff, 0xffff00ffffff0000, 0xffff00ffffff00ff,
+    0xffff00ffffffff00, 0xffff00ffffffffff, 0xffffff0000000000,
+    0xffffff00000000ff, 0xffffff000000ff00, 0xffffff000000ffff,
+    0xffffff0000ff0000, 0xffffff0000ff00ff, 0xffffff0000ffff00,
+    0xffffff0000ffffff, 0xffffff00ff000000, 0xffffff00ff0000ff,
+    0xffffff00ff00ff00, 0xffffff00ff00ffff, 0xffffff00ffff0000,
+    0xffffff00ffff00ff, 0xffffff00ffffff00, 0xffffff00ffffffff,
+    0xffffffff00000000, 0xffffffff000000ff, 0xffffffff0000ff00,
+    0xffffffff0000ffff, 0xffffffff00ff0000, 0xffffffff00ff00ff,
+    0xffffffff00ffff00, 0xffffffff00ffffff, 0xffffffffff000000,
+    0xffffffffff0000ff, 0xffffffffff00ff00, 0xffffffffff00ffff,
+    0xffffffffffff0000, 0xffffffffffff00ff, 0xffffffffffffff00,
+    0xffffffffffffffff,
+};
+
 /* Signed saturating rounding doubling multiply-accumulate high half, 8-bit */
 int8_t do_sqrdmlah_b(int8_t src1, int8_t src2, int8_t src3,
                      bool neg, bool round)
-- 
2.20.1


