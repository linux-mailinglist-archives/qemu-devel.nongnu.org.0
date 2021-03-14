Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA2B33A85D
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 22:52:46 +0100 (CET)
Received: from localhost ([::1]:58762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLYfF-0006XY-C4
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 17:52:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYH8-0006BK-Mo
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:50 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:34582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYH7-0008GN-0L
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:50 -0400
Received: by mail-qk1-x72c.google.com with SMTP id t4so29950123qkp.1
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 14:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eK04d/bo+QTgBddX7q0xdbozbAL0+oUVhNKLX/4OLZA=;
 b=zmL8y45JHUuZuFhWXxgi/ZsDWCdDLKmNjJdywF8q2VlzzTQh7n+wawJvyaliJAd7NQ
 LsHFQXoSde6Go3YQbMn9Ci4sWPGTz/HhBZZi+OAa3vOxTQ8rp1fpUkfuMX6jo5FFxY5M
 +JQEWLSxLL3GImIjDfHBkCYgmdoL9UlWO2hc2ZJWysveDFsfoZ8/TCxvxWNnA43mOmHV
 jE1mqK+kxLHWXu6IAze7Tb6XXgAlDid71c/DtrpB+fOaHmEdyoI50BXsRmbFcjHHRKkS
 YRLweATzhQuDiXRdq5gF7ITPUfZCVm9RBX6Da9jL/9CimE4hVmujE601EaqzD2QTIxCi
 D+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eK04d/bo+QTgBddX7q0xdbozbAL0+oUVhNKLX/4OLZA=;
 b=JbZANrDqO6IWink3iCFtSBLOAiWjdnhhkZXtCaWE3jcoKU6beKGIbnSxrW0VPYJtCn
 fZOOCi6Vc6/Kwg/Cyltl/c6A3LRvxSN/kZcv3MxpFXSzLr+qZlY0gIt3llpiHbf3xRUX
 vFIU8v5XMhF9lFFlUlTd0GXd9dc0HLYYA48shbF0OpyEDjXLy2K+e5OXqjyCpFPE4vI0
 ka+egSPqX4j/79EbODOqRruXnYk4U9V0ZWqhxHMB5EdNu8r297KJ72vK8toR0HRApr/X
 uCz42KT/wA3Lro9hiI5Kc0e/ib+JJnbbJFlJEQPCycU2SCkz2PaZjtLmEh9xaFW1ii/Q
 Zqqw==
X-Gm-Message-State: AOAM532RCTTNp+oYI1kuFVeYD4jpSrTeNtrWXFPOwnkFlL4g5mTrI0gg
 RoVdtDOWrsZC0xmu8Bo+Nrk6lcOUba9nHCo2
X-Google-Smtp-Source: ABdhPJzZ6YUURZ8xl8exLQ5pYjOud2b0uRx0fREUTB6geYeOxE/QtOKpGYy2id79SUeTtkP7A3beBA==
X-Received: by 2002:a37:4690:: with SMTP id
 t138mr22528857qka.394.1615757268014; 
 Sun, 14 Mar 2021 14:27:48 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t2sm9337749qtd.13.2021.03.14.14.27.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 14:27:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/29] tcg: Tidy split_cross_256mb
Date: Sun, 14 Mar 2021 15:27:14 -0600
Message-Id: <20210314212724.1917075-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314212724.1917075-1-richard.henderson@linaro.org>
References: <20210314212724.1917075-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72c.google.com
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
index 23b3459c61..45c1178815 100644
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


