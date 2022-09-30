Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1A55F1535
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 23:49:58 +0200 (CEST)
Received: from localhost ([::1]:34494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeNtN-0002sZ-22
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 17:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeNX9-00076P-Gb
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 17:26:59 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:42940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeNX7-0005Rz-UW
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 17:26:59 -0400
Received: by mail-qk1-x72a.google.com with SMTP id d15so3609192qka.9
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 14:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=N5kqswpGeydfw7dvf5MO+UlFHzfp0nRUBM8Fh5E48cY=;
 b=kUUY5LuG62oTMUJWtVOk0p5BQRD4sZhamyDzxUIOJNAoc7soFvryWhijc4OuQ1ca6y
 tldoeFhXYb1Dx+R3Tsfl8Du0EYAPOnMVHBA0RWG6Ra4x64Cqs1EdzGazOOOEKqCCy0/P
 EAE62V833szwAptfEWD4X5g67YozNwJNpD0FhF1fqYh9USNpjmVRkhZKyJyaM/3JwxOK
 MEaM1l8+5cLYr0KflyomyO7UuKCmGfwvJefv9JvB6VKK0HLUdm9jmD+XHSFoID+IkDJu
 A7hS18119KLCcV9eP95hSjVeSdQVvCIUG3Wyw/cDpgELTfCoJVC32Ww/IQaA0feCVqJ7
 zi/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=N5kqswpGeydfw7dvf5MO+UlFHzfp0nRUBM8Fh5E48cY=;
 b=cDDOUAvk9sjUNjH7NHcLrbtfqj5MhconMOeXyjX9j5GuFWBdZE4X2Ej90ByTwurtzV
 Di3ZWQwtPWwufd/JTPBc2GIZquH4n94CsEmlF9JIwY7E/nICTpgv6EWknlix35UnydLU
 CXv92u8eJAWSIymoho4OU1YtBamlPrJ+Z0OBmUxgXEh4nOy+28xR85hOIG1S62Xc8PWq
 kILUzf/tdN66NFWUN6iwCYZVuq4I+sZaGbOhp1g6YZEPqgKMVHa1642YQxPmKQSn1/p3
 rVFmOcgzymNhvrKjR2Cj/isFaJvyiFbEFoaSEw5ZTNmEO7YY2gKDvUi02esY5pUa8L2O
 tvQQ==
X-Gm-Message-State: ACrzQf1eoFC/I2cXDoBmTRVlCQwZhL1W5lPab/dGIaWfhV909YdNEjWB
 kSmiW3/NYs3qaP6arwzW0fb5cfCj1acD+Q==
X-Google-Smtp-Source: AMsMyM4UkfzSBwYZVacdevNMRj5SCOhlhP/6eisfg/wFGFokv6Os8Jnib7vRD1xgCmYHIfgyiEk+tQ==
X-Received: by 2002:a05:620a:31aa:b0:6ce:b6f8:e235 with SMTP id
 bi42-20020a05620a31aa00b006ceb6f8e235mr7673640qkb.733.1664573216811; 
 Fri, 30 Sep 2022 14:26:56 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80a1:5a60:d0d7:468b:5667:114b])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a05620a28d200b006ce813bb306sm3696370qkp.125.2022.09.30.14.26.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 14:26:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linux.org,
	alex.bennee@linux.org
Subject: [PATCH v6 14/18] accel/tcg: Inline tb_flush_jmp_cache
Date: Fri, 30 Sep 2022 14:26:18 -0700
Message-Id: <20220930212622.108363-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220930212622.108363-1-richard.henderson@linaro.org>
References: <20220930212622.108363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

This function has two users, who use it incompatibly.
In tlb_flush_page_by_mmuidx_async_0, when flushing a
single page, we need to flush exactly two pages.
In tlb_flush_range_by_mmuidx_async_0, when flushing a
range of pages, we need to flush N+1 pages.

This avoids double-flushing of jmp cache pages in a range.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index a0db2d32a8..c7909fb619 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -107,14 +107,6 @@ static void tb_jmp_cache_clear_page(CPUState *cpu, target_ulong page_addr)
     }
 }
 
-static void tb_flush_jmp_cache(CPUState *cpu, target_ulong addr)
-{
-    /* Discard jump cache entries for any tb which might potentially
-       overlap the flushed page.  */
-    tb_jmp_cache_clear_page(cpu, addr - TARGET_PAGE_SIZE);
-    tb_jmp_cache_clear_page(cpu, addr);
-}
-
 /**
  * tlb_mmu_resize_locked() - perform TLB resize bookkeeping; resize if necessary
  * @desc: The CPUTLBDesc portion of the TLB
@@ -541,7 +533,12 @@ static void tlb_flush_page_by_mmuidx_async_0(CPUState *cpu,
     }
     qemu_spin_unlock(&env_tlb(env)->c.lock);
 
-    tb_flush_jmp_cache(cpu, addr);
+    /*
+     * Discard jump cache entries for any tb which might potentially
+     * overlap the flushed page, which includes the previous.
+     */
+    tb_jmp_cache_clear_page(cpu, addr - TARGET_PAGE_SIZE);
+    tb_jmp_cache_clear_page(cpu, addr);
 }
 
 /**
@@ -792,8 +789,14 @@ static void tlb_flush_range_by_mmuidx_async_0(CPUState *cpu,
         return;
     }
 
-    for (target_ulong i = 0; i < d.len; i += TARGET_PAGE_SIZE) {
-        tb_flush_jmp_cache(cpu, d.addr + i);
+    /*
+     * Discard jump cache entries for any tb which might potentially
+     * overlap the flushed pages, which includes the previous.
+     */
+    d.addr -= TARGET_PAGE_SIZE;
+    for (target_ulong i = 0, n = d.len / TARGET_PAGE_SIZE + 1; i < n; i++) {
+        tb_jmp_cache_clear_page(cpu, d.addr);
+        d.addr += TARGET_PAGE_SIZE;
     }
 }
 
-- 
2.34.1


