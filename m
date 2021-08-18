Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F593F0CDF
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:37:41 +0200 (CEST)
Received: from localhost ([::1]:59878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGSJg-0008Hq-5K
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:37:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGS2N-00088T-CV
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:19:47 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:38466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGS2K-0006Eg-AE
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:19:47 -0400
Received: by mail-pf1-x436.google.com with SMTP id a21so3338394pfh.5
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 13:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dLKp0mDnjjRjPauDQA0yKsYIxkun+14IJ8e0NroxfP0=;
 b=GjB/NbVw8c/qldv19W4yn+SplSDazvAR4v+6xK6LORpPnHxueKRFeb4MYOfCrUQAlt
 ftIfq60avd7E3zDS19MIKBE1WK0G9OVrzWGz9ShkKh9bwOIFqnRqZzubipDSqPRTd5kH
 u/ETyGYNafabrcbxqnOiE4fxri7VnlZChK9mI9VVR2Bb8qKn7QtLT5iG6By6yUtSx2hl
 RJssyFuiV5BJfP4P0xaf4BSjd5HGKSGozu9P5S486sf8oDWyhRZVMUN2sAgBbqPKxbrU
 B1QFKYiEoZuo1AYiPT1Xg+uESjQFQ4FryjSASwYwj3eqoNMBtH0k9VYpnnwdyJ5+whZL
 BK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dLKp0mDnjjRjPauDQA0yKsYIxkun+14IJ8e0NroxfP0=;
 b=h7+osDcfeT89N7aGujNdwl37MFBGWA+t0Uq83QbKdDuXE0YA0pBPKah6ljO5OJhzMj
 wcluKczbDD07/a33lboOJFMp97Zir6P74KCEwTJrjUutocP6ygDMbkb99MwNs4N4exBZ
 kooiljQMSda6kafD95YxOVUj9Lfsg/XGlFKwHQcmQM7QyX7pHvrJ6tbS1gxbIClfMP/4
 33iP6KUiZtOaRrrDxykqQASIr4fsTmvnEQKqTuWp8WX76lNSrHvJ8BFDwJGcECAZW/+v
 NAqQYvnvf547OO/bRguTi9WYlXYPcCdm4zAqwekeez7yIQci5MBZlQn6V0GT3Jrwoctn
 VmRg==
X-Gm-Message-State: AOAM532GldZmr+Lr/9I6JDtkxkjQoanDKIaiCIAZDxz1mjhCCXZ+fxXs
 uqXXIG4bMXeJ71IPfBdeieM9GMDG1CrAxQ==
X-Google-Smtp-Source: ABdhPJzBIZdcYlRlmaXu33vv/LYxJSiiHIiuhBWh0FcDCQl88m5rqZWo2uUuQmn4kKJRBJXjf8oT+w==
X-Received: by 2002:a63:fd54:: with SMTP id m20mr10564431pgj.104.1629317983053; 
 Wed, 18 Aug 2021 13:19:43 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id x13sm619621pjh.30.2021.08.18.13.19.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 13:19:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/16] tcg/mips: Drop special alignment for code_gen_buffer
Date: Wed, 18 Aug 2021 10:19:24 -1000
Message-Id: <20210818201931.393394-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818201931.393394-1-richard.henderson@linaro.org>
References: <20210818201931.393394-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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


