Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CF0336905
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 01:40:02 +0100 (CET)
Received: from localhost ([::1]:43014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK9Mv-0007d5-Av
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 19:40:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95y-0004yU-17
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:30 -0500
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34]:34423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95r-0001Oe-Ip
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:29 -0500
Received: by mail-oo1-xc34.google.com with SMTP id
 j10-20020a4ad18a0000b02901b677a0ba98so260485oor.1
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 16:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wd9+7ltjhmP/a9jKr96hm3ap7k0nNt217fYvtp6ZByM=;
 b=pKBU/pxKXv+QSQm2aK9LdQhPbHWiOCAeJ+bf3JW2sSKDnWKlLepiSpc3hvH1u8uWfD
 fV4te8T217FPUYsBYE9hGY8YPTzB2TynZYlGwB3mrg+DnXJ8nEzgKtyR0Xm8qxnALrlW
 XgyhiwIXWNUJO+0IGhfBG7/1pIHc3Qzm+YCGOuPU5tf+zulIMnpoX1JmfgwkIhR3lIBF
 md/jCh4F6kU/QZ22e+QbTR27/775l6JJ8zB2ogl6XFwgQCAGSVhI///K3W5OPas9uM6u
 of+aJX6MzNA1QrFdTKnbkzXLhge8cutxQAnyB1cZaL4EhMOYgUZCMojt3komALBxzAcZ
 iAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wd9+7ltjhmP/a9jKr96hm3ap7k0nNt217fYvtp6ZByM=;
 b=NWo6XMa7kzWGGz4wXWnnS8XebV8caf1V5TvFCQoUszf/XDj4g7stwz5Km8vVGrwVHh
 jXKM6naxh5RvVZW3PG38+2rutouaTkUbuLVvBn5WBlIWQhgwS7GO/50hj6USlPnQ2mZU
 DgpFZKPuysfAmAKSVUBhOoWkSZqpCtO1JsA6x40ck0Fk684KS4WnslQr+6sQou6be04D
 KHZlCmTRRnh4InYYgXToRDmJwyM8nr+OyyPxo/NxUXxwz8QNPtuSWoqP+UzEHwwDbPsd
 erWt6UQ16HT8sgA1gpTxBbwQpqd8YfGKJjbVx5preejelGm9oHe2iAUIKDwRnAFdvPCR
 tZYw==
X-Gm-Message-State: AOAM532oGkZyzLJzT1JD6cxNXvdyzSgeauc2AJcoMJe3BPYCbt8nW4MW
 mbDibO5Qg1xkKGqWL9Q9cc6qrESDJO0DMuz3
X-Google-Smtp-Source: ABdhPJwR8PqgAH5oX9VBuLJUaYijoCrKVleGYLJfIHOXaa9nsdNdaUQDi3mfFGWCEfULjxaOEQaKyw==
X-Received: by 2002:a4a:c316:: with SMTP id c22mr4434828ooq.65.1615422142355; 
 Wed, 10 Mar 2021 16:22:22 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id a6sm300962otq.79.2021.03.10.16.22.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 16:22:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/26] tcg: Tidy split_cross_256mb
Date: Wed, 10 Mar 2021 18:21:49 -0600
Message-Id: <20210311002156.253711-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311002156.253711-1-richard.henderson@linaro.org>
References: <20210311002156.253711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c34;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc34.google.com
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
Cc: r.bolshakov@yadro.com, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Return output buffer and size via output pointer arguments,
rather than returning size via tcg_ctx->code_gen_buffer_size.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/region.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/tcg/region.c b/tcg/region.c
index 57017c1e80..f719a3edf3 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -464,7 +464,8 @@ static inline bool cross_256mb(void *addr, size_t size)
 /* We weren't able to allocate a buffer without crossing that boundary,
    so make do with the larger portion of the buffer that doesn't cross.
    Returns the new base of the buffer, and adjusts code_gen_buffer_size.  */
-static inline void *split_cross_256mb(void *buf1, size_t size1)
+static inline void split_cross_256mb(void **obuf, size_t *osize,
+                                     void *buf1, size_t size1)
 {
     void *buf2 = (void *)(((uintptr_t)buf1 + size1) & ~0x0ffffffful);
     size_t size2 = buf1 + size1 - buf2;
@@ -475,8 +476,8 @@ static inline void *split_cross_256mb(void *buf1, size_t size1)
         buf1 = buf2;
     }
 
-    tcg_ctx->code_gen_buffer_size = size1;
-    return buf1;
+    *obuf = buf1;
+    *osize = size1;
 }
 #endif
 
@@ -506,12 +507,10 @@ static bool alloc_code_gen_buffer(size_t tb_size, int splitwx, Error **errp)
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
 
@@ -522,6 +521,7 @@ static bool alloc_code_gen_buffer(size_t tb_size, int splitwx, Error **errp)
     qemu_madvise(buf, size, QEMU_MADV_HUGEPAGE);
 
     tcg_ctx->code_gen_buffer = buf;
+    tcg_ctx->code_gen_buffer_size = size;
     return true;
 }
 #elif defined(_WIN32)
@@ -580,8 +580,7 @@ static bool alloc_code_gen_buffer_anon(size_t size, int prot,
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


