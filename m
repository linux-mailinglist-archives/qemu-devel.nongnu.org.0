Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B675D5F5F9B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 05:26:52 +0200 (CEST)
Received: from localhost ([::1]:60888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogHX9-0006Ld-S5
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 23:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHIU-00066v-55
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:42 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:43623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHIS-00070e-2x
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:41 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 g1-20020a17090a708100b00203c1c66ae3so525493pjk.2
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=0dnjfsBXDy5rRQ39KsZnlcakGwGZWrxEz9jQMseFkII=;
 b=iX41Gad281pokn2zxnAmHJGFQdL8UfofTU0X5OKlMFYenav0ZakTVNMT6bBDhZTXyc
 2HlfXXXjOh44ZorSKULegkAluyInhGd85ks48g3ibGkkFHbWK00gJJmmTUPWEmoYr7zq
 hBJYfWkROnhrEo7xdH/v0UYSn6eAM7vNR8jn9uL/exazzRX58SmrfYoCzcZvDN3AldxU
 D+3dqA77uQfArtepDJw/LWv0MAFIAs/F4UNgz5704K/l8IBL1TPbzezoF1XXGKim+4Vn
 6zMOVrUrftAfUY51yBee4JDusdnqY3p2JZQyFl1q2m9LHTxgFJwZJNHKuGRpsAHVa+RC
 dfow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=0dnjfsBXDy5rRQ39KsZnlcakGwGZWrxEz9jQMseFkII=;
 b=QdwyNz723Va/HCxjB/JEyOBZsREUD/QdD1CikipiOl7XkLWpY0GW+GdYoWhiDvlREY
 JLOj78al6cVa5pIzQyrWcW/p7yg+jmBUyco7rD0v+v0K9o05wHaZkY5oXWupibmMZXAW
 8hM46MaxukqGfB77EgzeBbamJCcn4C/khB7+jQ4V1vfAaAFfaEX02EjhgISaSqsBUwD5
 KKgQ/yl/RuFZyeBOEj66+ps8NofXBd6SgJeMMEdae3oaISeiRWzA0pIT48tWdURoV3Jz
 j0a61Hm+07nPZmUmUvx4W3gxGJUr1s/5/dCH8oL7alj5TVOLMfEqaB4K+pT6UyhsGCWH
 4Z8Q==
X-Gm-Message-State: ACrzQf1moWleJe7JCD4BiQ93sqMY9LH+QCUhHcLHpBRstovZyVXKMkiy
 ISS7e3KR4T3eIxSbqd/sJExk7ieko44b1g==
X-Google-Smtp-Source: AMsMyM56ymvsq5MI8sbXZ7pawwxNbOGOL6b3cJzDL21JvGRwDCSIYipP8kZwwZvK05BJjrUpxRDtjQ==
X-Received: by 2002:a17:902:da8f:b0:178:399b:89bb with SMTP id
 j15-20020a170902da8f00b00178399b89bbmr2539812plx.57.1665025898689; 
 Wed, 05 Oct 2022 20:11:38 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 u128-20020a627986000000b0056281da3bcbsm58360pfc.149.2022.10.05.20.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:11:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: [PATCH 19/24] accel/tcg: Simplify page_get/alloc_target_data
Date: Wed,  5 Oct 2022 20:11:08 -0700
Message-Id: <20221006031113.1139454-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006031113.1139454-1-richard.henderson@linaro.org>
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
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

Since the only user, Arm MTE, always requires allocation,
merge the get and alloc functions to always produce a
non-null result.  Also assume that the user has already
checked page validity.

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
index 62d36c127f..d8eefabcd3 100644
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


