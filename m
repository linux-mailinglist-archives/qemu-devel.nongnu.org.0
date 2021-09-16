Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABE140DF8F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 18:10:42 +0200 (CEST)
Received: from localhost ([::1]:46136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtyD-0000nE-FW
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 12:10:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtM5-00029T-UH
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:31:19 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:38894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLj-0002gF-G6
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:31:14 -0400
Received: by mail-pg1-x529.google.com with SMTP id w8so6486608pgf.5
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zxXZyIG+Pw01TAIshh/v24ac5SJa+rYMBmTa7I6pYe8=;
 b=i3qy1MUF7NrohW/phU3qwMsmnhqBGpAQOZditdLxgWX/87KuQvGf4+gkmcaRKOI/Tf
 rlLPYQIGFNDGtqePfAomKnMQxIPtjdQXolV8UHXhrPDGkIOa1kbKyEVR59zATPHuxwFt
 bolX28j/6PQkvolQ6zYB/m4Ltx4Lf7/uiR3dTYMk6J1SrWs3+iNDr6zHCNDZVsJqGlNU
 zJKmXsIJQuDZNZw09ZfDySV/R7T7yvcdrvrKO0a70IgH+cZkR2bxs8EdW9M3CLsZRmoC
 JWAyJJ4Qis+wNy8sc76BGbY8mYU+MUDHMcytssbRhZhAVXNji/sfXkSHf5SomUPqiTQ5
 madg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zxXZyIG+Pw01TAIshh/v24ac5SJa+rYMBmTa7I6pYe8=;
 b=8ERAok5lL4nR9t7ZF/5sXH3+5I63teLvMqfkYEZuyFCjFLi1J9Iy1ybxDwbVE1N/uq
 RZuq49tSl7Mc2cyBBO8S6QklgXbT3Uqc1VQ3+mPqrj/EQjtLmo1lYz0IGtbvfsOXIkvg
 TueiNZufT382rS/ngaAoArrr5gPDs33u2QX0Jwtmon6QhQ7TsWC0jZFaUzWVUn8L41+2
 3L886sYlZdOU76834puCo0yJkllqQGG/HZHpgra27BpP89VHrl2hQ1prS+RA3dig5OmL
 s1WnFxOYpgXr3pjbr6x2H2dBGFe5j3IQsy/EsikWZDZQA+ZnynjO6E5uI+zSmFGk1k9o
 /s5w==
X-Gm-Message-State: AOAM531wH6NkUtwx+J0EURGEcWfBQODXho8/byS/R0NQC4WZHFjO/FHK
 pgu5Cmqq0bCDNUUBVNmB7PWawi6ER9ehcg==
X-Google-Smtp-Source: ABdhPJyonU3OOXhpNRCPrjHbrneBCRUB91ytAALUHljZF4sDGUR3wagTwvK99CBHVp/K7v8dJVxrVw==
X-Received: by 2002:a63:150e:: with SMTP id v14mr5507189pgl.126.1631806250492; 
 Thu, 16 Sep 2021 08:30:50 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b7sm3779447pgs.64.2021.09.16.08.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 08:30:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 35/35] tcg/mips: Drop special alignment for code_gen_buffer
Date: Thu, 16 Sep 2021 08:30:25 -0700
Message-Id: <20210916153025.1944763-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916153025.1944763-1-richard.henderson@linaro.org>
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/region.c | 91 ----------------------------------------------------
 1 file changed, 91 deletions(-)

diff --git a/tcg/region.c b/tcg/region.c
index e64c3ea230..9cc30d4922 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -467,38 +467,6 @@ static size_t tcg_n_regions(size_t tb_size, unsigned max_cpus)
   (DEFAULT_CODE_GEN_BUFFER_SIZE_1 < MAX_CODE_GEN_BUFFER_SIZE \
    ? DEFAULT_CODE_GEN_BUFFER_SIZE_1 : MAX_CODE_GEN_BUFFER_SIZE)
 
-#ifdef __mips__
-/*
- * In order to use J and JAL within the code_gen_buffer, we require
- * that the buffer not cross a 256MB boundary.
- */
-static inline bool cross_256mb(void *addr, size_t size)
-{
-    return ((uintptr_t)addr ^ ((uintptr_t)addr + size)) & ~0x0ffffffful;
-}
-
-/*
- * We weren't able to allocate a buffer without crossing that boundary,
- * so make do with the larger portion of the buffer that doesn't cross.
- * Returns the new base and size of the buffer in *obuf and *osize.
- */
-static inline void split_cross_256mb(void **obuf, size_t *osize,
-                                     void *buf1, size_t size1)
-{
-    void *buf2 = (void *)(((uintptr_t)buf1 + size1) & ~0x0ffffffful);
-    size_t size2 = buf1 + size1 - buf2;
-
-    size1 = buf2 - buf1;
-    if (size1 < size2) {
-        size1 = size2;
-        buf1 = buf2;
-    }
-
-    *obuf = buf1;
-    *osize = size1;
-}
-#endif
-
 #ifdef USE_STATIC_CODE_GEN_BUFFER
 static uint8_t static_code_gen_buffer[DEFAULT_CODE_GEN_BUFFER_SIZE]
     __attribute__((aligned(CODE_GEN_ALIGN)));
@@ -526,12 +494,6 @@ static int alloc_code_gen_buffer(size_t tb_size, int splitwx, Error **errp)
         size = QEMU_ALIGN_DOWN(tb_size, qemu_real_host_page_size);
     }
 
-#ifdef __mips__
-    if (cross_256mb(buf, size)) {
-        split_cross_256mb(&buf, &size, buf, size);
-    }
-#endif
-
     region.start_aligned = buf;
     region.total_size = size;
 
@@ -573,39 +535,6 @@ static int alloc_code_gen_buffer_anon(size_t size, int prot,
         return -1;
     }
 
-#ifdef __mips__
-    if (cross_256mb(buf, size)) {
-        /*
-         * Try again, with the original still mapped, to avoid re-acquiring
-         * the same 256mb crossing.
-         */
-        size_t size2;
-        void *buf2 = mmap(NULL, size, prot, flags, -1, 0);
-        switch ((int)(buf2 != MAP_FAILED)) {
-        case 1:
-            if (!cross_256mb(buf2, size)) {
-                /* Success!  Use the new buffer.  */
-                munmap(buf, size);
-                break;
-            }
-            /* Failure.  Work with what we had.  */
-            munmap(buf2, size);
-            /* fallthru */
-        default:
-            /* Split the original buffer.  Free the smaller half.  */
-            split_cross_256mb(&buf2, &size2, buf, size);
-            if (buf == buf2) {
-                munmap(buf + size2, size - size2);
-            } else {
-                munmap(buf, size - size2);
-            }
-            size = size2;
-            break;
-        }
-        buf = buf2;
-    }
-#endif
-
     region.start_aligned = buf;
     region.total_size = size;
     return prot;
@@ -620,35 +549,15 @@ static bool alloc_code_gen_buffer_splitwx_memfd(size_t size, Error **errp)
     void *buf_rw = NULL, *buf_rx = MAP_FAILED;
     int fd = -1;
 
-#ifdef __mips__
-    /* Find space for the RX mapping, vs the 256MiB regions. */
-    if (alloc_code_gen_buffer_anon(size, PROT_NONE,
-                                   MAP_PRIVATE | MAP_ANONYMOUS |
-                                   MAP_NORESERVE, errp) < 0) {
-        return false;
-    }
-    /* The size of the mapping may have been adjusted. */
-    buf_rx = region.start_aligned;
-    size = region.total_size;
-#endif
-
     buf_rw = qemu_memfd_alloc("tcg-jit", size, 0, &fd, errp);
     if (buf_rw == NULL) {
         goto fail;
     }
 
-#ifdef __mips__
-    void *tmp = mmap(buf_rx, size, PROT_READ | PROT_EXEC,
-                     MAP_SHARED | MAP_FIXED, fd, 0);
-    if (tmp != buf_rx) {
-        goto fail_rx;
-    }
-#else
     buf_rx = mmap(NULL, size, PROT_READ | PROT_EXEC, MAP_SHARED, fd, 0);
     if (buf_rx == MAP_FAILED) {
         goto fail_rx;
     }
-#endif
 
     close(fd);
     region.start_aligned = buf_rw;
-- 
2.25.1


