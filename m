Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C14283D1774
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 22:02:27 +0200 (CEST)
Received: from localhost ([::1]:53428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6IQE-0005Ju-Oo
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 16:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6INw-0002P4-IV
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:04 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:33605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6INu-0005bu-Mq
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:04 -0400
Received: by mail-pl1-x633.google.com with SMTP id d1so1664195plg.0
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 13:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gByINc+ktkYg8pbHnFAwT6K5mm8lqzrOGXD9r55vivo=;
 b=AkVocfRZiKZhd73C+a0h/ZY5HZSViAcZN26dlO7Ff+KDG+mP2MifHJyPex/FLzdpFU
 tOmc4o5a9SfEPrzgP5vybbhVd1UOjTkz9bbIofxCErZiv/eZEkhOsBJx1iwe7OeppJn0
 zK+U9mTGNS0tYKsKpie25sVCLwpHeSXU7lBxbPNXuHFhQiaruNAM4DEDA99aXDd7mudV
 XR2kEIgOdGDjkECZiIrlhnjLpBqagLNSQ2HCAQaGgnOI/0Y53aQdv6bDydHu8dmNt+15
 xSjrKDV1KZBqam4nwv3eYfuG6GVk8wG+FJGcyllOFYbJ/ifGKnutJHjLtzdfk04ceJWU
 343g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gByINc+ktkYg8pbHnFAwT6K5mm8lqzrOGXD9r55vivo=;
 b=YIZMyvA/llDTBFxsJk791gxipITOfakgfK+dOiwIZ/fWyP5hxzPIxfU3K/qf/Ca1Rx
 5E74Bslmi6EryXT0f818/ZMS4y2bGysk/xez0Pz+0xAGdNO2KAma0RoFkwCH8Zu+R/u1
 cxb0s025qVXF3ybYjxcyl4roNIKXKIvfANz6LJZgN65AaFXnqhxQ2IrSj386WYcmNpNM
 FUMLpDhgeNIrs097XMeFOKz9Iul/g9nedTdQG91wBah+SyZ1BhB/Uwl2kFg332rdNW8B
 7j7m8uk6xU7e8o1KUiq06wJj4eCzWgTEhktnXIKO7KRBRAwFJthK+uWeYrYNINeso03K
 mCyw==
X-Gm-Message-State: AOAM531pYxmKt/++yjnzfOw0/fFdPUFEgTbZfohFihNKwnqZowHzQtZ6
 9bNlnmWtTjFaN9fo7p/L863ctstp1lclTQ==
X-Google-Smtp-Source: ABdhPJza7rSDz8t1oOTVx9qHQMTyTBmSrUPTak0CIoGWbzjgDoY7ap16Cv6w9sqWsQByFj/MDRDFYg==
X-Received: by 2002:a65:64cf:: with SMTP id t15mr37296068pgv.131.1626897601346; 
 Wed, 21 Jul 2021 13:00:01 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id w3sm706028pjq.12.2021.07.21.13.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 13:00:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/27] qemu/atomic: Add aligned_{int64,uint64}_t types
Date: Wed, 21 Jul 2021 09:59:30 -1000
Message-Id: <20210721195954.879535-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721195954.879535-1-richard.henderson@linaro.org>
References: <20210721195954.879535-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use it to avoid some clang-12 -Watomic-alignment errors,
forcing some structures to be aligned and as a pointer when
we have ensured that the address is aligned.

Tested-by: Cole Robinson <crobinso@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/atomic_template.h |  4 ++--
 include/qemu/atomic.h       | 14 +++++++++++++-
 include/qemu/stats64.h      |  2 +-
 softmmu/timers-state.h      |  2 +-
 linux-user/hppa/cpu_loop.c  |  2 +-
 util/qsp.c                  |  4 ++--
 6 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/accel/tcg/atomic_template.h b/accel/tcg/atomic_template.h
index afa8a9daf3..d347462af5 100644
--- a/accel/tcg/atomic_template.h
+++ b/accel/tcg/atomic_template.h
@@ -28,8 +28,8 @@
 # define SHIFT      4
 #elif DATA_SIZE == 8
 # define SUFFIX     q
-# define DATA_TYPE  uint64_t
-# define SDATA_TYPE int64_t
+# define DATA_TYPE  aligned_uint64_t
+# define SDATA_TYPE aligned_int64_t
 # define BSWAP      bswap64
 # define SHIFT      3
 #elif DATA_SIZE == 4
diff --git a/include/qemu/atomic.h b/include/qemu/atomic.h
index fe5467d193..112a29910b 100644
--- a/include/qemu/atomic.h
+++ b/include/qemu/atomic.h
@@ -271,7 +271,19 @@
     _oldn;                                                              \
 })
 
-/* Abstractions to access atomically (i.e. "once") i64/u64 variables */
+/*
+ * Abstractions to access atomically (i.e. "once") i64/u64 variables.
+ *
+ * The i386 abi is odd in that by default members are only aligned to
+ * 4 bytes, which means that 8-byte types can wind up mis-aligned.
+ * Clang will then warn about this, and emit a call into libatomic.
+ *
+ * Use of these types in structures when they will be used with atomic
+ * operations can avoid this.
+ */
+typedef int64_t aligned_int64_t __attribute__((aligned(8)));
+typedef uint64_t aligned_uint64_t __attribute__((aligned(8)));
+
 #ifdef CONFIG_ATOMIC64
 /* Use __nocheck because sizeof(void *) might be < sizeof(u64) */
 #define qatomic_read_i64(P) \
diff --git a/include/qemu/stats64.h b/include/qemu/stats64.h
index fdd3d1b8f9..802402254b 100644
--- a/include/qemu/stats64.h
+++ b/include/qemu/stats64.h
@@ -21,7 +21,7 @@
 
 typedef struct Stat64 {
 #ifdef CONFIG_ATOMIC64
-    uint64_t value;
+    aligned_uint64_t value;
 #else
     uint32_t low, high;
     uint32_t lock;
diff --git a/softmmu/timers-state.h b/softmmu/timers-state.h
index 8c262ce139..94bb7394c5 100644
--- a/softmmu/timers-state.h
+++ b/softmmu/timers-state.h
@@ -47,7 +47,7 @@ typedef struct TimersState {
     int64_t last_delta;
 
     /* Compensate for varying guest execution speed.  */
-    int64_t qemu_icount_bias;
+    aligned_int64_t qemu_icount_bias;
 
     int64_t vm_clock_warp_start;
     int64_t cpu_clock_offset;
diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index 3aaaf3337c..82d8183821 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -82,7 +82,7 @@ static abi_ulong hppa_lws(CPUHPPAState *env)
                 o64 = *(uint64_t *)g2h(cs, old);
                 n64 = *(uint64_t *)g2h(cs, new);
 #ifdef CONFIG_ATOMIC64
-                r64 = qatomic_cmpxchg__nocheck((uint64_t *)g2h(cs, addr),
+                r64 = qatomic_cmpxchg__nocheck((aligned_uint64_t *)g2h(cs, addr),
                                                o64, n64);
                 ret = r64 != o64;
 #else
diff --git a/util/qsp.c b/util/qsp.c
index bacc5fa2f6..8562b14a87 100644
--- a/util/qsp.c
+++ b/util/qsp.c
@@ -83,8 +83,8 @@ typedef struct QSPCallSite QSPCallSite;
 struct QSPEntry {
     void *thread_ptr;
     const QSPCallSite *callsite;
-    uint64_t n_acqs;
-    uint64_t ns;
+    aligned_uint64_t n_acqs;
+    aligned_uint64_t ns;
     unsigned int n_objs; /* count of coalesced objs; only used for reporting */
 };
 typedef struct QSPEntry QSPEntry;
-- 
2.25.1


