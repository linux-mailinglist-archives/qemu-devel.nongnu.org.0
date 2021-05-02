Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAB3370FE3
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 01:38:13 +0200 (CEST)
Received: from localhost ([::1]:33340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldLfA-0007Ks-89
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 19:38:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMp-0008QV-Jd
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:19:15 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:37642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMh-0002zc-IQ
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:19:15 -0400
Received: by mail-pf1-x429.google.com with SMTP id b15so2955826pfl.4
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=IMH7OG6KjuztYAF/Ih9G+wS1HMzIPcW7GkKKX50tasw=;
 b=yQRkuLRQB3qzWS6HhVFazYf0EL9goICi5FTd4Lym+MSO2KwgNeslFEdq45AHh6jH/E
 CVYQwIyZz+10ja4mqTYB5UfckV1vccACUyKcZQ2vDiMK94MUF1AF36mDsyV7NYd0B57q
 TVdL6Tt0/nR7HZoc6R7p9gRZa9iHRnnQFLhFGxQZiO2bmExKw9VeWh2erzbuzZTVyznp
 isxZzhRMDCSoxDigJBQ8kMr+eIGzxEpL1LeNmSOE44OW0MiQT0vJOUYV9D50CPokDiL+
 llX/EDPuQWw+oqNYTsoZvlGOkicmC83pr3xWRzer/HJL3ggs2hsuVAmxDYQRM2P2QPXV
 HjeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IMH7OG6KjuztYAF/Ih9G+wS1HMzIPcW7GkKKX50tasw=;
 b=jpO75RIofoHLQaaPeE7L0vprKrgtXMwI41uRv2pJhpw8jtofro2IzbAcV3+PijZz6N
 gu0l2emKrcp2Zx8enp3/sZWtFj/7GZSna8uHXio2aJfHPdoFDq2leZYT/MVfMie2a9Mw
 o1LC2+KVJmLR/71hrwzTrnBqyGyUkuD/xZlpoAfQAs3f23KEBLnx7BagiekMnYAdkHHy
 eYODOCrFERqHnMtYH7ico2dycnbHYCPC/OeFXal5LQxnjSxD4Cl5ymiMM+MAghtRgHrF
 GPY9iDsNkblJcwZiQlgCB6Eci2kIAFFK0bKqlahhnr7o2S/sGXHMLrHctJzHC1CwlJMr
 84dw==
X-Gm-Message-State: AOAM5313qZ++oPR9C6TiLSNBfakKMDcI6VaknpWbu/XWYdPqiV+gM8N9
 8ytNTIfDXUCSlFSMzN+Djc1CEFF2g1wfwg==
X-Google-Smtp-Source: ABdhPJyW3TD5xwZuAHyBsVfe2ntG+ZpJ+I6x0LO4cWAK9b/2UHUWxHExl9NgBYt0eBEvBjtZjh4r5g==
X-Received: by 2002:a62:ed0f:0:b029:257:7278:e72b with SMTP id
 u15-20020a62ed0f0000b02902577278e72bmr16172218pfh.17.1619997546077; 
 Sun, 02 May 2021 16:19:06 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id k17sm7146236pfa.68.2021.05.02.16.19.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:19:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 27/28] tcg: When allocating for !splitwx,
 begin with PROT_NONE
Date: Sun,  2 May 2021 16:18:43 -0700
Message-Id: <20210502231844.1977630-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502231844.1977630-1-richard.henderson@linaro.org>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

There's a change in mprotect() behaviour [1] in the latest macOS
on M1 and it's not yet clear if it's going to be fixed by Apple.

In this case, instead of changing permissions of N guard pages,
we change permissions of N rwx regions.  The same number of
syscalls are required either way.

[1] https://gist.github.com/hikalium/75ae822466ee4da13cbbe486498a191f

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/region.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/tcg/region.c b/tcg/region.c
index 604530b902..5e00db4cfb 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -765,12 +765,15 @@ static int alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
         error_free_or_abort(errp);
     }
 
-    prot = PROT_READ | PROT_WRITE | PROT_EXEC;
+    /*
+     * macOS 11.2 has a bug (Apple Feedback FB8994773) in which mprotect
+     * rejects a permission change from RWX -> NONE when reserving the
+     * guard pages later.  We can go the other way with the same number
+     * of syscalls, so always begin with PROT_NONE.
+     */
+    prot = PROT_NONE;
     flags = MAP_PRIVATE | MAP_ANONYMOUS;
-#ifdef CONFIG_TCG_INTERPRETER
-    /* The tcg interpreter does not need execute permission. */
-    prot = PROT_READ | PROT_WRITE;
-#elif defined(CONFIG_DARWIN)
+#ifdef CONFIG_DARWIN
     /* Applicable to both iOS and macOS (Apple Silicon). */
     if (!splitwx) {
         flags |= MAP_JIT;
@@ -901,11 +904,7 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
             }
         }
         if (have_prot != 0) {
-            /*
-             * macOS 11.2 has a bug (Apple Feedback FB8994773) in which mprotect
-             * rejects a permission change from RWX -> NONE.  Guard pages are
-             * nice for bug detection but are not essential; ignore any failure.
-             */
+            /* Guard pages are nice for bug detection but are not essential. */
             (void)qemu_mprotect_none(end, page_size);
         }
     }
-- 
2.25.1


