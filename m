Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34188370FE0
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 01:36:23 +0200 (CEST)
Received: from localhost ([::1]:56174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldLdO-00059z-94
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 19:36:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMd-0008Lz-MX
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:19:06 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:40600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMb-0002xF-9B
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:19:03 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 l10-20020a17090a850ab0290155b06f6267so4700332pjn.5
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+T1+Qy3MoywAjez6Ef0bmMy71JTW9fUaEucN6MXf9Xc=;
 b=tWBNMCTHNcU1/pmqgs2oD4oF6MPoTHUel6RgvFpDllUhVcjEsiBYlftsknFFcpTeAX
 cTl0GQR12zHDo+Jbo6WfJX8qKFan7HQuIMdooU9GFR/G1d1/ljmJtcnxmLh4WbK+xJG1
 m3Nr88tyotYXA/HK85uoLD5fA2Aszqsb00iNuwGuNYPkXXYOU7iO9GrBqH4jh+mClwVY
 2zo22q/FwK2KsNVICfumYY8SYxAEvRjq3xlj1p3OCpqllfHQmo7kdztnYU/df6fRj2nU
 2VEe++WGkQMQ0JOKZ4HsFP1Z3dDizz8wTxinGBP/DvefD7jxrGs45tdGEbFWsJryx95Z
 NzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+T1+Qy3MoywAjez6Ef0bmMy71JTW9fUaEucN6MXf9Xc=;
 b=q3bNr4QsQeXZfpb2UCpoz/2fCPM403nqAR/MPK/ZKof8rHDa9c69mWMh9GBC4FhYEj
 9aJVFt+SUuS7J4IBfQFu4SuXrX2QmRXxcGrQ8Fo1vD9Y0yOiK8sYBhPn/AKixHCYUxdb
 ZGbwFyuO4S0ANYT0tW0gF6uAufZc0EvtoG7JyTX4g/LRA3AAVzgyaY0Pyde+kawpW55o
 oaCANjWiABVxKot8AnRmSFmTuVhd+rGjoikNcS1ZaxXsK0xjJWH9s7KgeOtBPtzKEheV
 FEp9MxyHkKsUehouK6DbcI/qFxZrL20jMhNTIhHKqh8cprS7cD1Uy/hYcRtdc7t8tE48
 fUhg==
X-Gm-Message-State: AOAM531wJWOSVs2SgdzlBAbjxmgI5GL78gL0tR3wSVtMI42P/kcK56bT
 AARL/V8h9IGLnN6u5om3mQytrErza/TvTg==
X-Google-Smtp-Source: ABdhPJwfzSiYv5Qu6JgWI92zDvh6/5MU+jIyjOzhZ8w8I7bPmHf3NkMepljGAP+0kmaw02jngTZ46A==
X-Received: by 2002:a17:90a:e64e:: with SMTP id
 ep14mr17940878pjb.103.1619997539975; 
 Sun, 02 May 2021 16:18:59 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id k17sm7146236pfa.68.2021.05.02.16.18.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:18:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 19/28] tcg: Tidy split_cross_256mb
Date: Sun,  2 May 2021 16:18:35 -0700
Message-Id: <20210502231844.1977630-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502231844.1977630-1-richard.henderson@linaro.org>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

Return output buffer and size via output pointer arguments,
rather than returning size via tcg_ctx->code_gen_buffer_size.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/region.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/tcg/region.c b/tcg/region.c
index b44246e1aa..652f328d2c 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -467,7 +467,8 @@ static inline bool cross_256mb(void *addr, size_t size)
 /* We weren't able to allocate a buffer without crossing that boundary,
    so make do with the larger portion of the buffer that doesn't cross.
    Returns the new base of the buffer, and adjusts code_gen_buffer_size.  */
-static inline void *split_cross_256mb(void *buf1, size_t size1)
+static inline void split_cross_256mb(void **obuf, size_t *osize,
+                                     void *buf1, size_t size1)
 {
     void *buf2 = (void *)(((uintptr_t)buf1 + size1) & ~0x0ffffffful);
     size_t size2 = buf1 + size1 - buf2;
@@ -478,8 +479,8 @@ static inline void *split_cross_256mb(void *buf1, size_t size1)
         buf1 = buf2;
     }
 
-    tcg_ctx->code_gen_buffer_size = size1;
-    return buf1;
+    *obuf = buf1;
+    *osize = size1;
 }
 #endif
 
@@ -509,12 +510,10 @@ static bool alloc_code_gen_buffer(size_t tb_size, int splitwx, Error **errp)
     if (size > tb_size) {
         size = QEMU_ALIGN_DOWN(tb_size, qemu_real_host_page_size);
     }
-    tcg_ctx->code_gen_buffer_size = size;
 
 #ifdef __mips__
     if (cross_256mb(buf, size)) {
-        buf = split_cross_256mb(buf, size);
-        size = tcg_ctx->code_gen_buffer_size;
+        split_cross_256mb(&buf, &size, buf, size);
     }
 #endif
 
@@ -525,6 +524,7 @@ static bool alloc_code_gen_buffer(size_t tb_size, int splitwx, Error **errp)
     qemu_madvise(buf, size, QEMU_MADV_HUGEPAGE);
 
     tcg_ctx->code_gen_buffer = buf;
+    tcg_ctx->code_gen_buffer_size = size;
     return true;
 }
 #elif defined(_WIN32)
@@ -583,8 +583,7 @@ static bool alloc_code_gen_buffer_anon(size_t size, int prot,
             /* fallthru */
         default:
             /* Split the original buffer.  Free the smaller half.  */
-            buf2 = split_cross_256mb(buf, size);
-            size2 = tcg_ctx->code_gen_buffer_size;
+            split_cross_256mb(&buf2, &size2, buf, size);
             if (buf == buf2) {
                 munmap(buf + size2, size - size2);
             } else {
-- 
2.25.1


