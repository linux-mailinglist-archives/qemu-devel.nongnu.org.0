Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D576D3D9B0F
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 03:25:53 +0200 (CEST)
Received: from localhost ([::1]:40042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8uo4-0001f1-VX
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 21:25:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uD4-0005AD-OR
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:40 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:53949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uD0-0002qZ-98
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:38 -0400
Received: by mail-pj1-x1036.google.com with SMTP id j1so7758536pjv.3
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 17:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MPcoI+GU4YIlFaFdEswFbEW7HTIkYtVOm59HXH71gHM=;
 b=moFnYbdwSNSXat3jXSQSvPWyIZn6EIGBW+uU9vOMYdqfPRzCnrHmeX+IqaIOcHL5c2
 NBerw8Xx1vT77+wS5i2xMZHJXXRUrs6iWf3td2QTnj/ILL8FS7c4NIwiQHJXLn6S8Vo2
 IWk17dV1rzF5xZkEKHtmzgbS/gPROpc4EE3IgKJ5QYQvEKZv6xQ0omjKs9IBD7D8N9YE
 lTE61AJoF+N9mF/q978wnxUIWh3Bn94ib2L73pASgSPgXe0PGZm5u/AJXBINEdT0bnlY
 jDBRVOLiYHxCIlSItZY6Kw+Empzzp+pmI8qFj/zYERzL3TheT6UCcYsq/hPnDu2Hk4X+
 3Kdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MPcoI+GU4YIlFaFdEswFbEW7HTIkYtVOm59HXH71gHM=;
 b=KYgPYL0QNKgKvyZVTwTGrnp3+4v1CKOEHh7Pbj/mDngxyV0ydLP+/8jTAuytt2BYqO
 QECqrz1qqhJBL6JRH1dJkfaXPU83v3vgqs7sQ+9+y7TuCtT+bowvGrniI5yLU3lDpQ7h
 6gUF9rYRL+B+8CUEe70xKvB0tyc0GpNpKgje+6e77ICAl0ra5uKjDaxXfcWZPzLylYAH
 MI0IJJwQZZuEj7n3Ht5ZpTk/WCdJsT80eGLugI/cnAw72NkxC9jeaXm2AGU5xdylzFwb
 fD+1e6XFR40CkDNL+37HbdlvfXp/Y9TiiDh5rI1d3W7qztRWS/bpd2bBD5gIYKUp7HMv
 Neow==
X-Gm-Message-State: AOAM531nuVUwqv+Aq2HYTZazdZIYk9Z1RsoY48nnRsLYVfcqLWuASTKc
 bxIPnd/F1eSAbgAiqR2Xlm/DjIUpdobpqA==
X-Google-Smtp-Source: ABdhPJwBzPIroHOBXfj5dO+dmb67yxRi0JzOvZFJ1F3plcFr9uBQlGYni+wLV06MNfic4zNFGYkWZA==
X-Received: by 2002:a63:1214:: with SMTP id h20mr1429090pgl.355.1627519653093; 
 Wed, 28 Jul 2021 17:47:33 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id t205sm1305005pfc.32.2021.07.28.17.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 17:47:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 36/43] target/s390x: Use cpu_*_mmu instead of
 helper_*_mmu
Date: Wed, 28 Jul 2021 14:46:40 -1000
Message-Id: <20210729004647.282017-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The helper_*_mmu functions were the only thing available
when this code was written.  This could have been adjusted
when we added cpu_*_mmuidx_ra, but now we can most easily
use the newest set of interfaces.

Cc: qemu-s390x@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/mem_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index b20a82a914..4115cadbd7 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -248,13 +248,13 @@ static void do_access_memset(CPUS390XState *env, vaddr vaddr, char *haddr,
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
@@ -290,7 +290,7 @@ static uint8_t do_access_get_byte(CPUS390XState *env, vaddr vaddr, char **haddr,
      * Do a single access and test if we can then get access to the
      * page. This is especially relevant to speed up TLB_NOTDIRTY.
      */
-    byte = helper_ret_ldub_mmu(env, vaddr + offset, oi, ra);
+    byte = cpu_ldb_mmu(env, vaddr + offset, oi, ra);
     *haddr = tlb_vaddr_to_host(env, vaddr, MMU_DATA_LOAD, mmu_idx);
     return byte;
 #endif
@@ -324,7 +324,7 @@ static void do_access_set_byte(CPUS390XState *env, vaddr vaddr, char **haddr,
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


