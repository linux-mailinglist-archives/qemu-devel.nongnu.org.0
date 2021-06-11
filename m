Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E633A4B7E
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 01:58:06 +0200 (CEST)
Received: from localhost ([::1]:39528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrr2L-00013o-Hj
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 19:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmp-0002we-Ke
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:42:03 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:35462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqml-0002il-2T
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:42:03 -0400
Received: by mail-pg1-x535.google.com with SMTP id o9so3687920pgd.2
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Epfwc7nVLk2TJt9lsf9tUTggNPYxuLWV6aCxBH+NF1Y=;
 b=kAltVy+Op8N5hAXmCNrsrhmeoPDBNtV+h78rIlVA5B+y8wDs1encc1G/LOao4f9KeS
 jVFssaWWn5Kd6CwYtBVpKE2APOJRqs55On370Kv0lfZhjNesCAuV8B2EhnfHL6aWSKpW
 mLKxREHuooK7Ba6NA8djJGVHhB2LvD7ikYlPcH43DA7Owjzg6dqM9B9VRBacm/y5IkrW
 Fa+4j4HavzBlshoUQ1/Bk2CJEgCm5Kw6zcZf3f7qh9QpTE/TrNmf+2YCYHZdFRMG8d+U
 rp/1SV3+bGGBJ0qHbUXfPeL0T2tm6CQjdm4+iQKX8evzoHMyxblj4GFWLZeaqTCjK8jo
 rMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Epfwc7nVLk2TJt9lsf9tUTggNPYxuLWV6aCxBH+NF1Y=;
 b=NbnLNdO49bbS8NIf5TUNY0D0v+ATfwZMbIgb55qRNfOLryLvhZnacVm0hN9Ry3ifsl
 7lPKOrRihgEtQmE+i24rZuxOw2J9NVNMuWXnYKQv/rjteQhLwYn9R+yThOc4e0OPslsI
 /pxAEDrAfi+SnbqOFbaYX/GQ4Gc6BiS4ocAX1klIORAQpHTqdEyavoNY11clNuQPCsUs
 /sIiWicacetJpOWzSxnTT1lVab/a5W1fLOaNg7evh+p79rcoKoddQtcJdogjXpaX+ADl
 yLOaiP7dKXI6FRgu/1NIg9vgR5zx/cqdVbPFHarYwlUZqpKMw/6gyemeO4OHMGhg0K6U
 7JFg==
X-Gm-Message-State: AOAM532QRwDd6RcrNY1dpw6JxWByoogUvjQ3rOErIftS/fBdFgU5qK4G
 CXID0hTGB0klnBjsHBB6WtR3Z4a4xeUp/w==
X-Google-Smtp-Source: ABdhPJzpLZ38O3//4w2osl3wgcZKXfkhUIiaKUlbnsUJ1JkBBVoDu51Y88/LK2FEidifiyAvKJ2rMw==
X-Received: by 2002:aa7:8ec8:0:b029:2ea:32b:9202 with SMTP id
 b8-20020aa78ec80000b02902ea032b9202mr10508385pfr.36.1623454917589; 
 Fri, 11 Jun 2021 16:41:57 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id q23sm6139829pgm.31.2021.06.11.16.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:41:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/34] tcg: Tidy split_cross_256mb
Date: Fri, 11 Jun 2021 16:41:30 -0700
Message-Id: <20210611234144.653682-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611234144.653682-1-richard.henderson@linaro.org>
References: <20210611234144.653682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Return output buffer and size via output pointer arguments,
rather than returning size via tcg_ctx->code_gen_buffer_size.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/region.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/tcg/region.c b/tcg/region.c
index 037a01e4ed..445a278702 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -470,9 +470,10 @@ static inline bool cross_256mb(void *addr, size_t size)
 /*
  * We weren't able to allocate a buffer without crossing that boundary,
  * so make do with the larger portion of the buffer that doesn't cross.
- * Returns the new base of the buffer, and adjusts code_gen_buffer_size.
+ * Returns the new base and size of the buffer in *obuf and *osize.
  */
-static inline void *split_cross_256mb(void *buf1, size_t size1)
+static inline void split_cross_256mb(void **obuf, size_t *osize,
+                                     void *buf1, size_t size1)
 {
     void *buf2 = (void *)(((uintptr_t)buf1 + size1) & ~0x0ffffffful);
     size_t size2 = buf1 + size1 - buf2;
@@ -483,8 +484,8 @@ static inline void *split_cross_256mb(void *buf1, size_t size1)
         buf1 = buf2;
     }
 
-    tcg_ctx->code_gen_buffer_size = size1;
-    return buf1;
+    *obuf = buf1;
+    *osize = size1;
 }
 #endif
 
@@ -514,12 +515,10 @@ static bool alloc_code_gen_buffer(size_t tb_size, int splitwx, Error **errp)
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
 
@@ -530,6 +529,7 @@ static bool alloc_code_gen_buffer(size_t tb_size, int splitwx, Error **errp)
     qemu_madvise(buf, size, QEMU_MADV_HUGEPAGE);
 
     tcg_ctx->code_gen_buffer = buf;
+    tcg_ctx->code_gen_buffer_size = size;
     return true;
 }
 #elif defined(_WIN32)
@@ -566,7 +566,6 @@ static bool alloc_code_gen_buffer_anon(size_t size, int prot,
                          "allocate %zu bytes for jit buffer", size);
         return false;
     }
-    tcg_ctx->code_gen_buffer_size = size;
 
 #ifdef __mips__
     if (cross_256mb(buf, size)) {
@@ -588,8 +587,7 @@ static bool alloc_code_gen_buffer_anon(size_t size, int prot,
             /* fallthru */
         default:
             /* Split the original buffer.  Free the smaller half.  */
-            buf2 = split_cross_256mb(buf, size);
-            size2 = tcg_ctx->code_gen_buffer_size;
+            split_cross_256mb(&buf2, &size2, buf, size);
             if (buf == buf2) {
                 munmap(buf + size2, size - size2);
             } else {
@@ -606,6 +604,7 @@ static bool alloc_code_gen_buffer_anon(size_t size, int prot,
     qemu_madvise(buf, size, QEMU_MADV_HUGEPAGE);
 
     tcg_ctx->code_gen_buffer = buf;
+    tcg_ctx->code_gen_buffer_size = size;
     return true;
 }
 
-- 
2.25.1


