Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF903D03F8
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 23:41:42 +0200 (CEST)
Received: from localhost ([::1]:58042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5xUj-0004HU-3l
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 17:41:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5xQr-00069y-2p
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 17:37:41 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:42599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5xQn-0000Fl-LM
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 17:37:40 -0400
Received: by mail-pg1-x535.google.com with SMTP id i16so6208751pgi.9
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 14:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IYPOS53QXxnMU3psldAYFVGdynnCru1uw1bavCP9XhE=;
 b=X5308y0BiJBp0zaWKUfw5dpozIpqRfuPKpWZhWmMGBjjdHhmVyxXZ+Kef13TLObjrX
 YmuRFmKzBelrL/ZU6Yo4VfOPfcKsCmJqXrYQr7z5zGN7pRqCYV0Py3XJrRNrvraK/GGb
 RYZh3VGynnsipyKm9xQaECN4NzH1PI8XxVqQPX0oVN1o1cmNYE3wpBhdCnPgK3KPwTDW
 tx1IelbQHrPzhyQeHhLDYhlG1DLK9j89XmXlP0/9mHdv0PLVQ9y3GOdC6FanfI/RIx1j
 Z37Z6e4P7UiG3guF6Ry25C1r6Ud00hPF7+QMRGhVRP5OS1LFsmhs6eYDsz2z/h9zV/oY
 qjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IYPOS53QXxnMU3psldAYFVGdynnCru1uw1bavCP9XhE=;
 b=Mg5nnyVE/Iilt0i9pY7lv/dvBXyybmKxtc8cpS0e1qKcamoXSdjCUOH+qEIUALgcjn
 U9LBSLgFf7xYLFKxv+t4ltkHQHQfyaD+AUNKgbq9ecvwAE9mZO32Rd4s+YYi8UtMKSO8
 9UZAiFbwskU8xbGr57pn8d2gLBJ/9HbZMnt/NgqsJdsmuHgtAZWYdORzXsy7jlzSzAP/
 0LEn/r4FRfFoqJWy2E8fdfZ3V+vnarNNvsOlLjzT0w/y7XpRFAhJjIaYgQXI8A2D6oY4
 iXb0u4EsagQOu6WkRWjHslTUcsk44IqRTKSTm48YDa/JZ3vnTNgHvMJlWn+bLQSeVLJW
 fNCQ==
X-Gm-Message-State: AOAM532MZWLQM+ktEtTTJI5XhDHLhicC3bxuvizP9wF4nVw3M9P8qtAK
 y6RpR+EASh9NgGiI0rnvmiDikMk0UxVbTA==
X-Google-Smtp-Source: ABdhPJy8RPY8zw7VlGTopdPWKQKWIh7BQA8JPWVIHFyTt8ft+LAJFYnOeZ5rod3J23kaueadJ/5vCg==
X-Received: by 2002:a63:5505:: with SMTP id j5mr32901966pgb.250.1626817056581; 
 Tue, 20 Jul 2021 14:37:36 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id r10sm24376813pff.7.2021.07.20.14.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 14:37:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/10] accel/tcg: Remove ATOMIC_MMU_DECLS
Date: Tue, 20 Jul 2021 11:37:20 -1000
Message-Id: <20210720213723.630552-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720213723.630552-1-richard.henderson@linaro.org>
References: <20210720213723.630552-1-richard.henderson@linaro.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All definitions are now empty.

Tested-by: Cole Robinson <crobinso@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/atomic_template.h | 12 ------------
 accel/tcg/cputlb.c          |  1 -
 accel/tcg/user-exec.c       |  1 -
 3 files changed, 14 deletions(-)

diff --git a/accel/tcg/atomic_template.h b/accel/tcg/atomic_template.h
index 52fb26a274..ae6b6a03be 100644
--- a/accel/tcg/atomic_template.h
+++ b/accel/tcg/atomic_template.h
@@ -74,7 +74,6 @@ ABI_TYPE ATOMIC_NAME(cmpxchg)(CPUArchState *env, target_ulong addr,
                               ABI_TYPE cmpv, ABI_TYPE newv,
                               TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    ATOMIC_MMU_DECLS;
     DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_RW;
     DATA_TYPE ret;
     uint16_t info = trace_mem_build_info(SHIFT, false, 0, false,
@@ -96,7 +95,6 @@ ABI_TYPE ATOMIC_NAME(cmpxchg)(CPUArchState *env, target_ulong addr,
 ABI_TYPE ATOMIC_NAME(ld)(CPUArchState *env, target_ulong addr,
                          TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    ATOMIC_MMU_DECLS;
     DATA_TYPE val, *haddr = ATOMIC_MMU_LOOKUP_R;
     uint16_t info = trace_mem_build_info(SHIFT, false, 0, false,
                                          ATOMIC_MMU_IDX);
@@ -111,7 +109,6 @@ ABI_TYPE ATOMIC_NAME(ld)(CPUArchState *env, target_ulong addr,
 void ATOMIC_NAME(st)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
                      TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    ATOMIC_MMU_DECLS;
     DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_W;
     uint16_t info = trace_mem_build_info(SHIFT, false, 0, true,
                                          ATOMIC_MMU_IDX);
@@ -126,7 +123,6 @@ void ATOMIC_NAME(st)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
 ABI_TYPE ATOMIC_NAME(xchg)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
                            TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    ATOMIC_MMU_DECLS;
     DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_RW;
     DATA_TYPE ret;
     uint16_t info = trace_mem_build_info(SHIFT, false, 0, false,
@@ -143,7 +139,6 @@ ABI_TYPE ATOMIC_NAME(xchg)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
 ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
                         ABI_TYPE val, TCGMemOpIdx oi, uintptr_t retaddr) \
 {                                                                   \
-    ATOMIC_MMU_DECLS;                                               \
     DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_RW;                        \
     DATA_TYPE ret;                                                  \
     uint16_t info = trace_mem_build_info(SHIFT, false, 0, false,    \
@@ -177,7 +172,6 @@ GEN_ATOMIC_HELPER(xor_fetch)
 ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
                         ABI_TYPE xval, TCGMemOpIdx oi, uintptr_t retaddr) \
 {                                                                   \
-    ATOMIC_MMU_DECLS;                                               \
     XDATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_RW;                       \
     XDATA_TYPE cmp, old, new, val = xval;                           \
     uint16_t info = trace_mem_build_info(SHIFT, false, 0, false,    \
@@ -223,7 +217,6 @@ ABI_TYPE ATOMIC_NAME(cmpxchg)(CPUArchState *env, target_ulong addr,
                               ABI_TYPE cmpv, ABI_TYPE newv,
                               TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    ATOMIC_MMU_DECLS;
     DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_RW;
     DATA_TYPE ret;
     uint16_t info = trace_mem_build_info(SHIFT, false, MO_BSWAP, false,
@@ -245,7 +238,6 @@ ABI_TYPE ATOMIC_NAME(cmpxchg)(CPUArchState *env, target_ulong addr,
 ABI_TYPE ATOMIC_NAME(ld)(CPUArchState *env, target_ulong addr,
                          TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    ATOMIC_MMU_DECLS;
     DATA_TYPE val, *haddr = ATOMIC_MMU_LOOKUP_R;
     uint16_t info = trace_mem_build_info(SHIFT, false, MO_BSWAP, false,
                                          ATOMIC_MMU_IDX);
@@ -260,7 +252,6 @@ ABI_TYPE ATOMIC_NAME(ld)(CPUArchState *env, target_ulong addr,
 void ATOMIC_NAME(st)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
                      TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    ATOMIC_MMU_DECLS;
     DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_W;
     uint16_t info = trace_mem_build_info(SHIFT, false, MO_BSWAP, true,
                                          ATOMIC_MMU_IDX);
@@ -277,7 +268,6 @@ void ATOMIC_NAME(st)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
 ABI_TYPE ATOMIC_NAME(xchg)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
                            TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    ATOMIC_MMU_DECLS;
     DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_RW;
     ABI_TYPE ret;
     uint16_t info = trace_mem_build_info(SHIFT, false, MO_BSWAP, false,
@@ -294,7 +284,6 @@ ABI_TYPE ATOMIC_NAME(xchg)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
 ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
                         ABI_TYPE val, TCGMemOpIdx oi, uintptr_t retaddr) \
 {                                                                   \
-    ATOMIC_MMU_DECLS;                                               \
     DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_RW;                        \
     DATA_TYPE ret;                                                  \
     uint16_t info = trace_mem_build_info(SHIFT, false, MO_BSWAP,    \
@@ -326,7 +315,6 @@ GEN_ATOMIC_HELPER(xor_fetch)
 ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
                         ABI_TYPE xval, TCGMemOpIdx oi, uintptr_t retaddr) \
 {                                                                   \
-    ATOMIC_MMU_DECLS;                                               \
     XDATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_RW;                       \
     XDATA_TYPE ldo, ldn, old, new, val = xval;                      \
     uint16_t info = trace_mem_build_info(SHIFT, false, MO_BSWAP,    \
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index cc0e673222..dc646e964a 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2693,7 +2693,6 @@ void cpu_stq_le_data(CPUArchState *env, target_ulong ptr, uint64_t val)
 
 #define ATOMIC_NAME(X) \
     glue(glue(glue(cpu_atomic_ ## X, SUFFIX), END), _mmu)
-#define ATOMIC_MMU_DECLS
 #define ATOMIC_MMU_LOOKUP_RW \
     atomic_mmu_lookup(env, addr, oi, DATA_SIZE, PAGE_READ | PAGE_WRITE, retaddr)
 #define ATOMIC_MMU_LOOKUP_R \
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index f6f8ddeb60..bc4a38b4df 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -1243,7 +1243,6 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
 
 #define ATOMIC_NAME(X) \
     glue(glue(glue(cpu_atomic_ ## X, SUFFIX), END), _mmu)
-#define ATOMIC_MMU_DECLS
 #define ATOMIC_MMU_LOOKUP_RW  atomic_mmu_lookup(env, addr, DATA_SIZE, retaddr)
 #define ATOMIC_MMU_LOOKUP_R   ATOMIC_MMU_LOOKUP_RW
 #define ATOMIC_MMU_LOOKUP_W   ATOMIC_MMU_LOOKUP_RW
-- 
2.25.1


