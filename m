Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A62B45F5F58
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 05:14:13 +0200 (CEST)
Received: from localhost ([::1]:45062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogHKu-0002Qm-OO
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 23:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHI9-0005BE-NX
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:21 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:37504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHI7-0006vn-L9
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:21 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 p3-20020a17090a284300b0020a85fa3ffcso3143070pjf.2
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=GNx/wZFYP3b5pXqqccbxReodi1Cirhgoe15NhYoUnUs=;
 b=s1+LYIqD+rV3i6IsETTLOP2oNElBn0LmkiV3JGqNeWov79OBS3jgsd53xW1KP5hyyp
 le0gvc63XBkxcWa1SxWITLiBPdq14YA3jWABnvPV2X0ZnSUjISN/rFdxKChMWg941I1g
 y5+d8N63MivO+SQKtBClbWaSn896FasmDxwLmvEIrC4dJclzRjrKEwGuz3WxaD5jam6t
 rkVYmFLwLK/CUcdiEgPaSRk3IMMiZjzWYXZlyGox8FQcLTOepA6vplzQqnpsGErU5mPM
 k2xJT2DF7EpHcwlMFampCKsbubJYQL+ERBO2mDqES1deFHqgp4QTA8oWZQhotsw3Cv9j
 /1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=GNx/wZFYP3b5pXqqccbxReodi1Cirhgoe15NhYoUnUs=;
 b=Fp5kdfF00sAdbYijwFU7KzIaq2yWN5e49UCQk30Uu+iGH1lYcb80oqbfSCNTBI96Bj
 5hIxFdDEP+7bQIFeNbwZ9ZE64jg5HJ1NcI8OPTaGUxxsJ4jisjTL8s6qhT+jqJ9jdGIJ
 PnuDO29Zo5WRE+OfKMb7Np5bSZbF3jzmGOub4Dang0j+1bcLj1HzLLxIYwRPMcTW0ZHE
 WL4Z7EfqKOjC/OUf2MqWFOb3mnn8nKapELrurpWiWxJZdmg+rIz6MZClfLPcDNknmcP+
 cAunfPzpp/2DQ4q4FJp7SmNpPF6DmOHHIU+4g2P4vtcvd1+9xRd+obNe/xTiq72U7op6
 fjuA==
X-Gm-Message-State: ACrzQf3KqecpeV8FHPq7vzSgaegpbBSjiIlZ6Hw/vctG64kRwPBL1TN9
 1bK/OjLC0ibolv6LL5AK87uc7AVYZlhSuA==
X-Google-Smtp-Source: AMsMyM7qt2Ksw9HjShoHaeWj/4toHagFIoNFbWqEwxEfz5kfpKI2JIFU1LeCvviebyiTRX7C1RBMYA==
X-Received: by 2002:a17:90b:3b81:b0:202:597a:c71d with SMTP id
 pc1-20020a17090b3b8100b00202597ac71dmr8066080pjb.105.1665025878171; 
 Wed, 05 Oct 2022 20:11:18 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 u128-20020a627986000000b0056281da3bcbsm58360pfc.149.2022.10.05.20.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:11:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: [PATCH 02/24] accel/tcg: Make page_alloc_target_data allocation
 constant
Date: Wed,  5 Oct 2022 20:10:51 -0700
Message-Id: <20221006031113.1139454-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006031113.1139454-1-richard.henderson@linaro.org>
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

Use a constant target data allocation size for all pages.
This will be necessary to reduce overhead of page tracking.
Since TARGET_PAGE_DATA_SIZE is now required, we can use this
to omit data tracking for targets that don't require it.

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
index 429ed42eec..2f44f7afc7 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3423,6 +3423,14 @@ static inline MemTxAttrs *typecheck_memtxattrs(MemTxAttrs *x)
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
index 307a596505..d94efbaf5b 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1165,10 +1165,6 @@ void arm_log_exception(CPUState *cs);
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
index fdd23ab3f8..62d36c127f 100644
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


