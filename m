Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B063C6006
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 18:03:07 +0200 (CEST)
Received: from localhost ([::1]:51396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2yOg-0003HO-4q
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 12:03:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2yL5-0000MS-Ms
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:59:27 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:39605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2yL4-00074i-4F
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:59:23 -0400
Received: by mail-pg1-x52d.google.com with SMTP id a2so18711313pgi.6
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 08:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L/58asou9sVz0CWQlJ3eJYnasOlqmgcxUQzFR2mZ0sk=;
 b=Rr4l8Pq0Fru7J1aM6DENrUZ3knxuIUnxPuYfR+bOhE9P5T44c+aIwtoNyGvqJE+K4c
 ZDXFGVrHPHJf34K9PqfxXNv7U9+KQjJEtqVyTl1IFYOglKuhH6YKKLM8sii4YOrphBL/
 4nG4ne69zYgkwRKErlSmkWw04nQYoq5U+19I5R6TDH62+QjdbwBN6C5cMcQR7TPQgNlf
 TUC0oOta5NMOtm72W/TXcl1zeoRGey8HPuUcBnuPbK/dZlwHGoyUAfC0gWA3RPAG2Qd2
 5Qt8+MmAbkKZ0+/W3+diOw7S92G7Q59uLu7IhMFPra30XY3TjnVYYHP//qLKKNuqy/aw
 gqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L/58asou9sVz0CWQlJ3eJYnasOlqmgcxUQzFR2mZ0sk=;
 b=VGJDp/yT1DNfypaCufVWRCwnd6LdLx6GWAzbtlSzUb/iLxW6DdE6aI1M1Ij6NFlLYU
 qOPCkVn48PuccycLqIhgjtpU3m2XBySnHW8ihU173LfPUCXNvN39ewF4nt9QjxFNxHam
 Wi9V+Gv4fJXVbp3gIxWfuVMhPuxEIKsiHrcpD8SueqL7/oCO7foKMqxlK7oTJXLHQycO
 JgKSAn/NgBT9kSyPsAW4tAom4pJ5v+iJH1YYd3c0/kFjfg3R7/oc5/MfQMFLe0LX9fan
 uJ31LIJwAwd8I/CaMDlh6c7u2mFQ1YSw5jIOfjxz0qJiZ+g6uA3BmFT5VZVbWK9VMXUu
 zn+w==
X-Gm-Message-State: AOAM532NfYUMp8G8Pzr8pl2NoFFjTR3kfTSqVk54RXF6A7dihiigskk+
 pbKgL0+tAkMoYFb2fDSy5Gs8XDomCkWP7w==
X-Google-Smtp-Source: ABdhPJxsmkyIszw4RLgkHf8xKN2wKW/5IJuSi+Afie7lPmt0BS94yXfMOPYJbCVsDBf8IvyCQCzkhg==
X-Received: by 2002:a05:6a00:2403:b029:309:8a37:2d51 with SMTP id
 z3-20020a056a002403b02903098a372d51mr54062484pfh.79.1626105560566; 
 Mon, 12 Jul 2021 08:59:20 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j16sm16745021pfi.165.2021.07.12.08.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 08:59:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] qemu/atomic: Use macros for CONFIG_ATOMIC64
Date: Mon, 12 Jul 2021 08:59:17 -0700
Message-Id: <20210712155918.1422519-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712155918.1422519-1-richard.henderson@linaro.org>
References: <20210712155918.1422519-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, crobinso@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Clang warnings about questionable atomic usage get localized
to the inline function in atomic.h.  By using a macro, we get
the full traceback to the original use that caused the warning.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/atomic.h | 25 +++++--------------------
 1 file changed, 5 insertions(+), 20 deletions(-)

diff --git a/include/qemu/atomic.h b/include/qemu/atomic.h
index c5d6df6bf8..bf89855209 100644
--- a/include/qemu/atomic.h
+++ b/include/qemu/atomic.h
@@ -273,26 +273,11 @@
 
 /* Abstractions to access atomically (i.e. "once") i64/u64 variables */
 #ifdef CONFIG_ATOMIC64
-static inline int64_t qatomic_read_i64(const int64_t *ptr)
-{
-    /* use __nocheck because sizeof(void *) might be < sizeof(u64) */
-    return qatomic_read__nocheck(ptr);
-}
-
-static inline uint64_t qatomic_read_u64(const uint64_t *ptr)
-{
-    return qatomic_read__nocheck(ptr);
-}
-
-static inline void qatomic_set_i64(int64_t *ptr, int64_t val)
-{
-    qatomic_set__nocheck(ptr, val);
-}
-
-static inline void qatomic_set_u64(uint64_t *ptr, uint64_t val)
-{
-    qatomic_set__nocheck(ptr, val);
-}
+/* Use __nocheck because sizeof(void *) might be < sizeof(u64) */
+#define qatomic_read_i64  qatomic_read__nocheck
+#define qatomic_read_u64  qatomic_read__nocheck
+#define qatomic_set_i64   qatomic_set__nocheck
+#define qatomic_set_u64   qatomic_set__nocheck
 
 static inline void qatomic64_init(void)
 {
-- 
2.25.1


