Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D4E355AB5
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 19:48:05 +0200 (CEST)
Received: from localhost ([::1]:34762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTpo4-00016h-QY
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 13:48:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTpgz-0001nN-44
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:40:45 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:40936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTpgv-0006My-Oa
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:40:44 -0400
Received: by mail-pl1-x630.google.com with SMTP id h8so7904425plt.7
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 10:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZaA3NtLF5Ui7foJuQjgVLcu0S8y+Fhr8vfitmrcwFuI=;
 b=qvjFN2vpjrKFab1daG84wTGcDW0Xwkl7KxTDer267wj3SZebbxlRyYKGI7xvqDB5Cx
 xuBj8PTwoOksc2s/NnilR52lNijPe+CIX+Bw8/Pmh2LpxzEQrdQyPTqxZ3LPHvCvvEBE
 IHjOU08fD8ZFFY5GxqoWXcTRCnkddMwSzT8LMQry6S57qF5hVFDZ0Ny6lNUv+jmALMpN
 M0dUK60+dqKlccPj8lRYblKwoKxfWQgqXRGNjC9QpLdmEZhK66s2P8HVj0mSiu2H7+YA
 0OPtpqe7FeSzT3iHgaBXfebJCbpXO9cYkoh9mBG7Jt09aZjnlm4xxYaeVBOXgGFK8cPD
 ZGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZaA3NtLF5Ui7foJuQjgVLcu0S8y+Fhr8vfitmrcwFuI=;
 b=cNBs/5ADvoY+xXsKhf7015rlZTp2MaWIWnsqpY4GFPMqvvWe0QOAREgBtf0Zil7Whd
 Xs0NWFGL/BOAwqVvwiqUEidGOp76dh2Gk8uguT8uyT178sOAoCt5F6p5WrODLc8T3hEs
 yCw2IYkJ8XZKZ6XBIib/4Gmq5758FlVJ7WhcUMlufMHsZBpQCg1XCR0jkADtGgfh3SRA
 noKzYupUaClNPH4txROIyy/wSjYmcoxwc6s3gzyqIckpjewT6EFqIpzzxH7tpxEMFRiu
 vGxXNvsnefRvCZqWF9rrJLx+Zz+YL8pSfzB4m86kJk0GsWGgxrJzMDXNbdcyKyuWYHLY
 taGw==
X-Gm-Message-State: AOAM5333xv36Jb27hopE5Z/C0mkVS3uHl0uQjLKc5v5qICDXIcR2YcCu
 00biVNZXrJL0iRXvX6XiuOXQioaHNUPK1w==
X-Google-Smtp-Source: ABdhPJzO0hOtejl4EjTcrMlDrPy8Wh1Q8lTzzemYJ8bhuEE7WWNQT7r8QTeoUAfBDE4/PaA+GyLi/w==
X-Received: by 2002:a17:902:a587:b029:e7:347d:4872 with SMTP id
 az7-20020a170902a587b02900e7347d4872mr30396100plb.2.1617730840241; 
 Tue, 06 Apr 2021 10:40:40 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id h15sm19148056pfo.20.2021.04.06.10.40.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 10:40:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/12] target/arm: Replace MTEDESC ESIZE+TSIZE with SIZEM1
Date: Tue,  6 Apr 2021 10:40:26 -0700
Message-Id: <20210406174031.64299-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406174031.64299-1-richard.henderson@linaro.org>
References: <20210406174031.64299-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After recent changes, mte_checkN does not use ESIZE,
and mte_check1 never used TSIZE.  We can combine the
two into a single field: SIZEM1.

Choose to pass size - 1 because size == 0 is never used,
our immediate need in mte_probe_int is for the address
of the last byte (ptr + size - 1), and since almost all
operations are powers of 2, this makes the immediate
constant one bit smaller.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h     |  4 ++--
 target/arm/mte_helper.c    | 18 ++++++++----------
 target/arm/translate-a64.c |  5 ++---
 target/arm/translate-sve.c |  5 ++---
 4 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index f11bd32696..2c77f2d50f 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -26,6 +26,7 @@
 #define TARGET_ARM_INTERNALS_H
 
 #include "hw/registerfields.h"
+#include "tcg/tcg-gvec-desc.h"
 #include "syndrome.h"
 
 /* register banks for CPU modes */
@@ -1142,8 +1143,7 @@ FIELD(MTEDESC, MIDX,  0, 4)
 FIELD(MTEDESC, TBI,   4, 2)
 FIELD(MTEDESC, TCMA,  6, 2)
 FIELD(MTEDESC, WRITE, 8, 1)
-FIELD(MTEDESC, ESIZE, 9, 5)
-FIELD(MTEDESC, TSIZE, 14, 10)  /* mte_checkN only */
+FIELD(MTEDESC, SIZEM1, 9, SIMD_DATA_BITS - 9)  /* size - 1 */
 
 bool mte_probe1(CPUARMState *env, uint32_t desc, uint64_t ptr);
 uint64_t mte_check1(CPUARMState *env, uint32_t desc,
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 619c4b9351..9dfbb14358 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -692,13 +692,13 @@ static int checkN(uint8_t *mem, int odd, int cmp, int count)
  * Return positive on success with tbi enabled.
  */
 static int mte_probe_int(CPUARMState *env, uint32_t desc, uint64_t ptr,
-                         uintptr_t ra, uint32_t total, uint64_t *fault)
+                         uintptr_t ra, uint64_t *fault)
 {
     int mmu_idx, ptr_tag, bit55;
     uint64_t ptr_last, prev_page, next_page;
     uint64_t tag_first, tag_last;
     uint64_t tag_byte_first, tag_byte_last;
-    uint32_t tag_count, tag_size, n, c;
+    uint32_t sizem1, tag_count, tag_size, n, c;
     uint8_t *mem1, *mem2;
     MMUAccessType type;
 
@@ -718,9 +718,10 @@ static int mte_probe_int(CPUARMState *env, uint32_t desc, uint64_t ptr,
 
     mmu_idx = FIELD_EX32(desc, MTEDESC, MIDX);
     type = FIELD_EX32(desc, MTEDESC, WRITE) ? MMU_DATA_STORE : MMU_DATA_LOAD;
+    sizem1 = FIELD_EX32(desc, MTEDESC, SIZEM1);
 
     /* Find the addr of the end of the access, and of the last element. */
-    ptr_last = ptr + total - 1;
+    ptr_last = ptr + sizem1;
 
     /* Round the bounds to the tag granule, and compute the number of tags. */
     tag_first = QEMU_ALIGN_DOWN(ptr, TAG_GRANULE);
@@ -738,7 +739,7 @@ static int mte_probe_int(CPUARMState *env, uint32_t desc, uint64_t ptr,
     if (likely(tag_last - prev_page <= TARGET_PAGE_SIZE)) {
         /* Memory access stays on one page. */
         tag_size = ((tag_byte_last - tag_byte_first) / (2 * TAG_GRANULE)) + 1;
-        mem1 = allocation_tag_mem(env, mmu_idx, ptr, type, total,
+        mem1 = allocation_tag_mem(env, mmu_idx, ptr, type, sizem1 + 1,
                                   MMU_DATA_LOAD, tag_size, ra);
         if (!mem1) {
             return 1;
@@ -792,8 +793,7 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
                     uint64_t ptr, uintptr_t ra)
 {
     uint64_t fault;
-    uint32_t total = FIELD_EX32(desc, MTEDESC, TSIZE);
-    int ret = mte_probe_int(env, desc, ptr, ra, total, &fault);
+    int ret = mte_probe_int(env, desc, ptr, ra, &fault);
 
     if (unlikely(ret == 0)) {
         mte_check_fail(env, desc, fault, ra);
@@ -812,8 +812,7 @@ uint64_t mte_check1(CPUARMState *env, uint32_t desc,
                     uint64_t ptr, uintptr_t ra)
 {
     uint64_t fault;
-    uint32_t total = FIELD_EX32(desc, MTEDESC, ESIZE);
-    int ret = mte_probe_int(env, desc, ptr, ra, total, &fault);
+    int ret = mte_probe_int(env, desc, ptr, ra, &fault);
 
     if (unlikely(ret == 0)) {
         mte_check_fail(env, desc, fault, ra);
@@ -837,8 +836,7 @@ uint64_t HELPER(mte_check1)(CPUARMState *env, uint32_t desc, uint64_t ptr)
 bool mte_probe1(CPUARMState *env, uint32_t desc, uint64_t ptr)
 {
     uint64_t fault;
-    uint32_t total = FIELD_EX32(desc, MTEDESC, ESIZE);
-    int ret = mte_probe_int(env, desc, ptr, 0, total, &fault);
+    int ret = mte_probe_int(env, desc, ptr, 0, &fault);
 
     return ret != 0;
 }
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 0b42e53500..3af00ae90e 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -272,7 +272,7 @@ static TCGv_i64 gen_mte_check1_mmuidx(DisasContext *s, TCGv_i64 addr,
         desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
         desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
         desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
-        desc = FIELD_DP32(desc, MTEDESC, ESIZE, 1 << log2_size);
+        desc = FIELD_DP32(desc, MTEDESC, SIZEM1, (1 << log2_size) - 1);
         tcg_desc = tcg_const_i32(desc);
 
         ret = new_tmp_a64(s);
@@ -306,8 +306,7 @@ TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
         desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
         desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
         desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
-        desc = FIELD_DP32(desc, MTEDESC, ESIZE, 1 << log2_esize);
-        desc = FIELD_DP32(desc, MTEDESC, TSIZE, total_size);
+        desc = FIELD_DP32(desc, MTEDESC, SIZEM1, total_size - 1);
         tcg_desc = tcg_const_i32(desc);
 
         ret = new_tmp_a64(s);
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 0eefb61214..5179c1f836 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4509,8 +4509,7 @@ static void do_mem_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
         desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
         desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
         desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
-        desc = FIELD_DP32(desc, MTEDESC, ESIZE, 1 << msz);
-        desc = FIELD_DP32(desc, MTEDESC, TSIZE, mte_n << msz);
+        desc = FIELD_DP32(desc, MTEDESC, SIZEM1, (mte_n << msz) - 1);
         desc <<= SVE_MTEDESC_SHIFT;
     } else {
         addr = clean_data_tbi(s, addr);
@@ -5189,7 +5188,7 @@ static void do_mem_zpz(DisasContext *s, int zt, int pg, int zm,
         desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
         desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
         desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
-        desc = FIELD_DP32(desc, MTEDESC, ESIZE, 1 << msz);
+        desc = FIELD_DP32(desc, MTEDESC, SIZEM1, (1 << msz) - 1);
         desc <<= SVE_MTEDESC_SHIFT;
     }
     desc = simd_desc(vsz, vsz, desc | scale);
-- 
2.25.1


