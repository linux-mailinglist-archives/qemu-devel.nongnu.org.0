Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E8560D93A
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:23:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVtZ-0004rz-4G; Tue, 25 Oct 2022 22:11:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVtX-0004rG-4R
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:11:51 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVtU-00018k-Uc
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:11:50 -0400
Received: by mail-pf1-x430.google.com with SMTP id m6so13947143pfb.0
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lr67oXB56bbJgvMwnludmlYvcig0N2zDKwaiJaZMxR8=;
 b=aYoF6EIGRUXWjawAT0CGvM72eJeXJ8e5Tptg4gmSzD+wMBdF+A4SzhKy/MDnfVS7D7
 4Y2cs+0FJjhoBy7x1C1YYJThylXKO/1Bk8h/kbOhTqjl8L02PwnVvnMw7F23vC1VrdUX
 QKGwI49M7OB358yxlHNETNAFXwSFuqbCCBlV2xrdkII+2FwckZjsU3gMjxOjUdvBaxwY
 bpDl/An87dP5FBqyQLzhxOXiADzRdHZ7FFtGnhOdXNs6DaEj66FMK7uxGr8WH4pSidJb
 +iFsjSw/xE/c2whODV5Aa/QRB1cLDJ/4uXcKp3HCJnHrQcXW4i+On2Gyh04f5IGX9QX+
 kGtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lr67oXB56bbJgvMwnludmlYvcig0N2zDKwaiJaZMxR8=;
 b=MPUlZVoyYrQO7c9gu9uEnCGd1gNFt5mEeJ/5Fgb982YXHkEjLxbR0QZtv7v5OuhwtV
 UARbZE+5ehAEpsOcUe8TnO7rUwzIGyDU+/OSm/yLVciJ/8MPVTnmc4CC7UozaO2atDE4
 +lJw+16NmZ557t72AJgzDYnoUmb8FNQe1p+ool5KmGQhfbJGIzSVRdWsw+o/KFRJ7jFy
 mefBPr4Btvm0OJfwbXNGk+v7GTXdXo7w0f3WWv6/iLoBHSJilpKe2Rw4zHqPbaTWS3Dr
 9ZtFCe7bFEbLBlF5pBn2bDi/MJBMPHCWkrMhpMd5FLJBc2ZxenwfqtF4sM6mYVHRZBQp
 GZjw==
X-Gm-Message-State: ACrzQf38GqoDIdcENfYwz3XvnkPmJvZ/nB9X4oxIFqVYKPOGUbIVrsh8
 lHWum1FzEEc+xxVGNDhNaXfb+3askIRDVgjE
X-Google-Smtp-Source: AMsMyM6iC7UCyxKbgswm/2A73noSbAD7ge6udQKLx7Nlgo15QJj0XDOo4W9vSdviFvUmgD6/YIImfw==
X-Received: by 2002:a63:4d0c:0:b0:46f:932:450a with SMTP id
 a12-20020a634d0c000000b0046f0932450amr11556371pgb.204.1666750307517; 
 Tue, 25 Oct 2022 19:11:47 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a635d5d000000b0043c9da02729sm1897833pgm.6.2022.10.25.19.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:11:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 08/47] accel/tcg: Make page_alloc_target_data allocation
 constant
Date: Wed, 26 Oct 2022 12:10:37 +1000
Message-Id: <20221026021116.1988449-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

Use a constant target data allocation size for all pages.
This will be necessary to reduce overhead of page tracking.
Since TARGET_PAGE_DATA_SIZE is now required, we can use this
to omit data tracking for targets that don't require it.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h    | 9 ++++-----
 target/arm/cpu.h          | 8 ++++++++
 target/arm/internals.h    | 4 ----
 accel/tcg/translate-all.c | 8 ++++++--
 target/arm/mte_helper.c   | 3 +--
 5 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 16b7df41bf..854adc4ac2 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -281,19 +281,18 @@ void page_reset_target_data(target_ulong start, target_ulong end);
 int page_check_range(target_ulong start, target_ulong len, int flags);
 
 /**
- * page_alloc_target_data(address, size)
+ * page_alloc_target_data(address)
  * @address: guest virtual address
- * @size: size of data to allocate
  *
- * Allocate @size bytes of out-of-band data to associate with the
- * guest page at @address.  If the page is not mapped, NULL will
+ * Allocate TARGET_PAGE_DATA_SIZE bytes of out-of-band data to associate
+ * with the guest page at @address.  If the page is not mapped, NULL will
  * be returned.  If there is existing data associated with @address,
  * no new memory will be allocated.
  *
  * The memory will be freed when the guest page is deallocated,
  * e.g. with the munmap system call.
  */
-void *page_alloc_target_data(target_ulong address, size_t size);
+void *page_alloc_target_data(target_ulong address);
 
 /**
  * page_get_target_data(address)
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 64fc03214c..db9ec6a038 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3410,6 +3410,14 @@ extern const uint64_t pred_esz_masks[5];
 #define PAGE_MTE            PAGE_TARGET_2
 #define PAGE_TARGET_STICKY  PAGE_MTE
 
+/* We associate one allocation tag per 16 bytes, the minimum.  */
+#define LOG2_TAG_GRANULE 4
+#define TAG_GRANULE      (1 << LOG2_TAG_GRANULE)
+
+#ifdef CONFIG_USER_ONLY
+#define TARGET_PAGE_DATA_SIZE (TARGET_PAGE_SIZE >> (LOG2_TAG_GRANULE + 1))
+#endif
+
 #ifdef TARGET_TAGGED_ADDRESSES
 /**
  * cpu_untagged_addr:
diff --git a/target/arm/internals.h b/target/arm/internals.h
index c3c3920ded..b26c9ca17b 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1164,10 +1164,6 @@ void arm_log_exception(CPUState *cs);
  */
 #define GMID_EL1_BS  6
 
-/* We associate one allocation tag per 16 bytes, the minimum.  */
-#define LOG2_TAG_GRANULE 4
-#define TAG_GRANULE      (1 << LOG2_TAG_GRANULE)
-
 /*
  * SVE predicates are 1/8 the size of SVE vectors, and cannot use
  * the same simd_desc() encoding due to restrictions on size.
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 4ed75a13e1..64a2601f9f 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2271,6 +2271,7 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
 
 void page_reset_target_data(target_ulong start, target_ulong end)
 {
+#ifdef TARGET_PAGE_DATA_SIZE
     target_ulong addr, len;
 
     /*
@@ -2293,15 +2294,17 @@ void page_reset_target_data(target_ulong start, target_ulong end)
         g_free(p->target_data);
         p->target_data = NULL;
     }
+#endif
 }
 
+#ifdef TARGET_PAGE_DATA_SIZE
 void *page_get_target_data(target_ulong address)
 {
     PageDesc *p = page_find(address >> TARGET_PAGE_BITS);
     return p ? p->target_data : NULL;
 }
 
-void *page_alloc_target_data(target_ulong address, size_t size)
+void *page_alloc_target_data(target_ulong address)
 {
     PageDesc *p = page_find(address >> TARGET_PAGE_BITS);
     void *ret = NULL;
@@ -2309,11 +2312,12 @@ void *page_alloc_target_data(target_ulong address, size_t size)
     if (p->flags & PAGE_VALID) {
         ret = p->target_data;
         if (!ret) {
-            p->target_data = ret = g_malloc0(size);
+            p->target_data = ret = g_malloc0(TARGET_PAGE_DATA_SIZE);
         }
     }
     return ret;
 }
+#endif /* TARGET_PAGE_DATA_SIZE */
 
 int page_check_range(target_ulong start, target_ulong len, int flags)
 {
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index e85208339e..a9c5fc2cb2 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -96,8 +96,7 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
 
     tags = page_get_target_data(clean_ptr);
     if (tags == NULL) {
-        size_t alloc_size = TARGET_PAGE_SIZE >> (LOG2_TAG_GRANULE + 1);
-        tags = page_alloc_target_data(clean_ptr, alloc_size);
+        tags = page_alloc_target_data(clean_ptr);
         assert(tags != NULL);
     }
 
-- 
2.34.1


