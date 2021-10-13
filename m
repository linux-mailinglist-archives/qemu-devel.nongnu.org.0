Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 004D442C8D8
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 20:38:18 +0200 (CEST)
Received: from localhost ([::1]:45854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maj8s-0007eg-4G
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 14:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maiu3-00044R-9J
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 14:22:59 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:44641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maiu0-00035u-9A
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 14:22:58 -0400
Received: by mail-pl1-x629.google.com with SMTP id t11so2396112plq.11
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 11:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lyfgi2ONrOj/+YzbGSRpxf/dd8yNNIAG41Iz34Hu60w=;
 b=zPkiLj2mzvwKVJ58tztNeslkFEBtx7Pyn8uHG66Ut/hjZlvf7xGNCuvj+soHCOv1C6
 p7CR4Wz1JsUgKDqvTgG3tngdOy0vX9YyZuu31+iM3yp7qCDh0B+36AxAyx7xvFfmUEx0
 rwk4mIwq2PZXM4qRzTmGm3lYj9cSCocE6J11Rh8DK9NREjGKKb4Qmpytmpa4ZrECZ/MM
 K61iSPC0BdS0q5UPfQfJ8HN+iNRNWKHiTyEEtqzmjUzHHhXZNJAs0l6gJnHKS0Z1eQeH
 LMBNxDK1Jo1IJaa3zU4I7Ju/EBIYbrtsKYpkKxY9SnQtWNnhgfvhxz559B4sDLUP5OTd
 O74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lyfgi2ONrOj/+YzbGSRpxf/dd8yNNIAG41Iz34Hu60w=;
 b=CnjnwnvON/vuHlZnNON1pSTWv4La4s1O5jKjOYYx/1kTnYMh40KqZkwKD2mhRNBzKU
 c7xf4s+N8zBgu/cRPJ5JLuQJ0PhMPlzJ6/MxBAR3hOP7gZvqx0S2QM1qwMwuDigaAS0R
 o6CbnTR1FHQV7OGDwtetw58mMt9ZgibiTTqKdZSgGmW8jIJt0qN+EGKAYhHnuQ+cSik0
 XOGg/lnp7j+2XL6qY/BErKrlpciEw2yVSngnxdWkhlcGtanavDpgSZ30I9+Ka9KM63e+
 XkEX2VXdBKC+ifU+IsX92lqLPKI3X6WvnXguKIbs6Lmraf+snz6b70qmrrV00Gs3baI6
 reHA==
X-Gm-Message-State: AOAM533s+I1U9wcL5ZyYIvr3/HDzCIHBAEHg72UFb3SMkwEj4rZ2A4PJ
 +XIALXfct4TLse6nDtwGbEeXwkKKSgeQWg==
X-Google-Smtp-Source: ABdhPJzMpCZzEYrMGmPWBoiETxJaJJ6QCtmVsRtMBY6azdyN0JJ6lAi2C3+T2hF/O6IARmyqr4MF5A==
X-Received: by 2002:a17:902:f703:b029:12c:982:c9ae with SMTP id
 h3-20020a170902f703b029012c0982c9aemr751338plo.20.1634149374894; 
 Wed, 13 Oct 2021 11:22:54 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z2sm177140pfe.210.2021.10.13.11.22.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 11:22:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/15] target/s390x: Use cpu_*_mmu instead of helper_*_mmu
Date: Wed, 13 Oct 2021 11:22:35 -0700
Message-Id: <20211013182239.991127-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013182239.991127-1-richard.henderson@linaro.org>
References: <20211013182239.991127-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The helper_*_mmu functions were the only thing available
when this code was written.  This could have been adjusted
when we added cpu_*_mmuidx_ra, but now we can most easily
use the newest set of interfaces.

Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/mem_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 251d4acf55..17e3f83641 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -249,13 +249,13 @@ static void do_access_memset(CPUS390XState *env, vaddr vaddr, char *haddr,
          * page. This is especially relevant to speed up TLB_NOTDIRTY.
          */
         g_assert(size > 0);
-        helper_ret_stb_mmu(env, vaddr, byte, oi, ra);
+        cpu_stb_mmu(env, vaddr, byte, oi, ra);
         haddr = tlb_vaddr_to_host(env, vaddr, MMU_DATA_STORE, mmu_idx);
         if (likely(haddr)) {
             memset(haddr + 1, byte, size - 1);
         } else {
             for (i = 1; i < size; i++) {
-                helper_ret_stb_mmu(env, vaddr + i, byte, oi, ra);
+                cpu_stb_mmu(env, vaddr + i, byte, oi, ra);
             }
         }
     }
@@ -291,7 +291,7 @@ static uint8_t do_access_get_byte(CPUS390XState *env, vaddr vaddr, char **haddr,
      * Do a single access and test if we can then get access to the
      * page. This is especially relevant to speed up TLB_NOTDIRTY.
      */
-    byte = helper_ret_ldub_mmu(env, vaddr + offset, oi, ra);
+    byte = cpu_ldb_mmu(env, vaddr + offset, oi, ra);
     *haddr = tlb_vaddr_to_host(env, vaddr, MMU_DATA_LOAD, mmu_idx);
     return byte;
 #endif
@@ -325,7 +325,7 @@ static void do_access_set_byte(CPUS390XState *env, vaddr vaddr, char **haddr,
      * Do a single access and test if we can then get access to the
      * page. This is especially relevant to speed up TLB_NOTDIRTY.
      */
-    helper_ret_stb_mmu(env, vaddr + offset, byte, oi, ra);
+    cpu_stb_mmu(env, vaddr + offset, byte, oi, ra);
     *haddr = tlb_vaddr_to_host(env, vaddr, MMU_DATA_STORE, mmu_idx);
 #endif
 }
-- 
2.25.1


