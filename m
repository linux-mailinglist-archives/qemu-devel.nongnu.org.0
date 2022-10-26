Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7A260D93C
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:24:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVuG-0005Ar-GO; Tue, 25 Oct 2022 22:12:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVuD-00053l-VB
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:33 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVuC-0001Fb-6d
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:33 -0400
Received: by mail-pg1-x535.google.com with SMTP id f9so9052640pgj.2
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vryp12SHv8mRaikMdMN6WhOo1Wb00PiLQIFS7b2+pVU=;
 b=iZhbpTRCT8I1b9yLHmfCO1uy5szw5kJ/tpiKmd83oDv48V7i5C3tjLeKeI/D2TCKvB
 mp6NQQ6G9Sb4deLlfXK1WWyV274hyg5Lp/2cuuZybhLPYN9D/evwopcmDKSDt02gjxOW
 fOTMUO/pGeVirRE0wI/S7vztstEcJyF9A94L15a67Mrs6X/R7PvqKd6ecGcF0fEmAPXh
 2DNvI8dn9Sc1E3rhuVFuE6Z8kf6MzC4vc5gSbs2NB5ad5XyR7H2rk0Fz1Mv4bAFS+c+C
 MSUgsCLr1pqt8ldmKqmTT3CRH6pRV+RkPIZAu47HszT8QDMbXJG7HtjEPiUO0g3yf0YG
 7s9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vryp12SHv8mRaikMdMN6WhOo1Wb00PiLQIFS7b2+pVU=;
 b=JnTx3kwcQbQ1Ao7gcoZVGy3isKqkcvjUEaIyeikjSygx5OEAhVI/UZRrqPexR6wiiS
 BsP7XV+zMMpw4GnQb6CDGW5pdCM6+Nh3s0xoJKdKUHDshzw6WFkEJGVxFJEB/rERsRrh
 uVElJOY6ihGL0gGjwCNsZiAtt+qDlqkSo9cetqpPS1rlSa+qbQ4h3p4lmWDVuE+0Rxf3
 OR0tTMCKmOMgBauQO/bFv8DyLLwFHhuEO1KdMU7JxM93ipQW5OtbpTddfwWfWvNUoOlj
 dBLBSeeGNBewk2KIaoeRhQpAnw1dnwvRof6F3idWpzkGamC1Ui88KJfsgM6GZXDWVVXZ
 Vezw==
X-Gm-Message-State: ACrzQf3Vr83DlMSt88OY+KrAQ4crA7ygiAfKxlQWtto+oiqS/Dg+UG6N
 zETTGEEt3Chxf9VHfTivYPEPZkXjQbOtJvc+
X-Google-Smtp-Source: AMsMyM7f8brYSk/gMwOLPy0dVnpdbR5+SsEwF3812BkuEhazBv54ECie5/yDGYq7wUr3V/wGEQoW4w==
X-Received: by 2002:a63:2b48:0:b0:434:eb45:9c6a with SMTP id
 r69-20020a632b48000000b00434eb459c6amr34521876pgr.508.1666750350808; 
 Tue, 25 Oct 2022 19:12:30 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a635d5d000000b0043c9da02729sm1897833pgm.6.2022.10.25.19.12.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:12:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 24/47] accel/tcg: Simplify page_get/alloc_target_data
Date: Wed, 26 Oct 2022 12:10:53 +1000
Message-Id: <20221026021116.1988449-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since the only user, Arm MTE, always requires allocation,
merge the get and alloc functions to always produce a
non-null result.  Also assume that the user has already
checked page validity.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h  | 21 ++++++---------------
 accel/tcg/user-exec.c   | 16 ++++------------
 target/arm/mte_helper.c |  4 ----
 3 files changed, 10 insertions(+), 31 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 854adc4ac2..2eb1176538 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -281,27 +281,18 @@ void page_reset_target_data(target_ulong start, target_ulong end);
 int page_check_range(target_ulong start, target_ulong len, int flags);
 
 /**
- * page_alloc_target_data(address)
+ * page_get_target_data(address)
  * @address: guest virtual address
  *
- * Allocate TARGET_PAGE_DATA_SIZE bytes of out-of-band data to associate
- * with the guest page at @address.  If the page is not mapped, NULL will
- * be returned.  If there is existing data associated with @address,
- * no new memory will be allocated.
+ * Return TARGET_PAGE_DATA_SIZE bytes of out-of-band data to associate
+ * with the guest page at @address, allocating it if necessary.  The
+ * caller should already have verified that the address is valid.
  *
  * The memory will be freed when the guest page is deallocated,
  * e.g. with the munmap system call.
  */
-void *page_alloc_target_data(target_ulong address);
-
-/**
- * page_get_target_data(address)
- * @address: guest virtual address
- *
- * Return any out-of-bound memory assocated with the guest page
- * at @address, as per page_alloc_target_data.
- */
-void *page_get_target_data(target_ulong address);
+void *page_get_target_data(target_ulong address)
+    __attribute__((returns_nonnull));
 #endif
 
 CPUArchState *cpu_copy(CPUArchState *env);
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 927b91900f..fb7d6ee9e9 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -242,19 +242,11 @@ void page_reset_target_data(target_ulong start, target_ulong end)
 void *page_get_target_data(target_ulong address)
 {
     PageDesc *p = page_find(address >> TARGET_PAGE_BITS);
-    return p ? p->target_data : NULL;
-}
+    void *ret = p->target_data;
 
-void *page_alloc_target_data(target_ulong address)
-{
-    PageDesc *p = page_find(address >> TARGET_PAGE_BITS);
-    void *ret = NULL;
-
-    if (p->flags & PAGE_VALID) {
-        ret = p->target_data;
-        if (!ret) {
-            p->target_data = ret = g_malloc0(TARGET_PAGE_DATA_SIZE);
-        }
+    if (!ret) {
+        ret = g_malloc0(TARGET_PAGE_DATA_SIZE);
+        p->target_data = ret;
     }
     return ret;
 }
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index a9c5fc2cb2..86b3754838 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -95,10 +95,6 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
     }
 
     tags = page_get_target_data(clean_ptr);
-    if (tags == NULL) {
-        tags = page_alloc_target_data(clean_ptr);
-        assert(tags != NULL);
-    }
 
     index = extract32(ptr, LOG2_TAG_GRANULE + 1,
                       TARGET_PAGE_BITS - LOG2_TAG_GRANULE - 1);
-- 
2.34.1


