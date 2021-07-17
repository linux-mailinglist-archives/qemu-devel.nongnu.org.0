Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E40823CC09B
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 03:44:28 +0200 (CEST)
Received: from localhost ([::1]:51134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4ZNT-00009v-Vw
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 21:44:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4ZKd-0000xo-07
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 21:41:31 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:34737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4ZKZ-0000zh-5u
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 21:41:30 -0400
Received: by mail-pg1-x534.google.com with SMTP id 62so11745964pgf.1
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 18:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kKAPYCM9sq+PBbkfhlQ3eZgZ+KZzapfWPIkOR6AXlB4=;
 b=zou724i3uCJ4LjW6CRriaflBDkdHOTSF86Xfw/t/Il12umkFavBuODT9ml9cRjc9Bn
 8kVnEWbjj8WMMbDyBPlgIUjf3ZLjPKo4NsEOZM5uCBoojyfHRNgzyPoh/edqOZ85fudt
 SG7JgGwilNzhWhxJmXUg3lKALdwa6Xhp88WHuchpGxA4iBwsQpJazPiCKRrl8Y+KTtHw
 4i9mJ3IDB6YIrR+fwXXp4JVA9M0Nu7WHAq25013YzpnwsVBfDx9dUwk278NtbSjYgDHH
 fEtAP2WgLGbAFsJ/DYoO10rG+FTFxZLqKr+Ydsd53riJA0rGvD0eSaUj+WHIVu3H6kgT
 cB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kKAPYCM9sq+PBbkfhlQ3eZgZ+KZzapfWPIkOR6AXlB4=;
 b=VVLNVCJ+evSuj12vG2EwQmcx5bHJUjiFyhGy11IcPdoKKJxcA8XD+h7Yt4iENgdWpn
 Ycd+/XP68vadV6XjyR9nCFIlR49jSRi7zY+ZIiGbC7j9BKGpcNdQP0UXry/bEjH78C9o
 gvxKD00d1KbC5kLRnJ306iJ0vsBgvA/t9+GPzTwhqv4reoELQCSJSIRRgNUJwQfZ8ICE
 DKz7b9neYaS9N95P4fpzga52QxtM/HLOagKQf/Q/fGE55sNQAH/8a2R6WDhHAKQEaNbn
 O56sNIGpcP5/U5FFx26qWpGVXmLCNXdPF6kgYxkVwPYyX8ZE//9ArcIYMRdAlyFIjMH8
 vArw==
X-Gm-Message-State: AOAM533lWG5OFzqFMNhkN1bmYZizPVThGqimz/yZF5sq24aKO7fzvQyJ
 ZqTpVcCiG8umx/SiqZDGr3DQzzmfox+A4w==
X-Google-Smtp-Source: ABdhPJwxWY8AJf/FEMdPosVjqI2VSU+pNjSD3M6M0YXVnzU64EULMvqzaeTOArZY3aLFskGN4qTT1A==
X-Received: by 2002:a62:2bc6:0:b029:2e7:a7c2:201 with SMTP id
 r189-20020a622bc60000b02902e7a7c20201mr13113150pfr.64.1626486085921; 
 Fri, 16 Jul 2021 18:41:25 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id q18sm12812738pgj.8.2021.07.16.18.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 18:41:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/11] qemu/atomic: Add aligned_{int64,uint64}_t types
Date: Fri, 16 Jul 2021 18:41:14 -0700
Message-Id: <20210717014121.1784956-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717014121.1784956-1-richard.henderson@linaro.org>
References: <20210717014121.1784956-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, crobinso@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use it to avoid some clang-12 -Watomic-alignment errors,
forcing some structures to be aligned and as a pointer when
we have ensured that the address is aligned.

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
index a45f115fe1..6e9d8b3882 100644
--- a/include/qemu/atomic.h
+++ b/include/qemu/atomic.h
@@ -238,7 +238,19 @@
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
 #define qatomic_read_i64  qatomic_read__nocheck
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


