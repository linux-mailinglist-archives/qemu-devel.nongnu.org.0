Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C75BBEC3
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 01:07:24 +0200 (CEST)
Received: from localhost ([::1]:37098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCXQQ-00020u-VJ
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 19:07:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35709)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iCXJW-0005Qy-CG
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 19:00:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iCXJV-00080O-55
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 19:00:14 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:41685)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iCXJU-0007zh-VH
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 19:00:13 -0400
Received: by mail-pg1-x541.google.com with SMTP id s1so7779579pgv.8
 for <qemu-devel@nongnu.org>; Mon, 23 Sep 2019 16:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DLSBL7HpLmLBUzIEzjw9q9aafzQEGfd8fwlel43TucU=;
 b=cjawjnekOI9pYfGesh2bquow7IgGYQHFqQGvA0o3qE+iyx8ON9ptVksJ3HXoaBcHwT
 d9ESK6K9bmxN8Tind2EJse+zTuDNNeJJ/pVGN4/5rm/yxOFYeLhMwU2RwtvHIE/V662y
 zNOGgC78fGhVMLc25ZqeXiLPcUgEtIHlRaH5ORq5vly/tT/+LlXLFr6nDCX+UImvuPPX
 iV0Nij+vKZjPlpDlV6qsiftInLcVZRF6Flsrv3bYUqSm9jA8jl5cWXnuX+fJicNuCQU+
 ACDQoraNALA6vI7O9DO4s0DkPK1vMOBZB998a7biQNVhPOE8T3//6yJFuYRJjiIAE8uG
 p/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DLSBL7HpLmLBUzIEzjw9q9aafzQEGfd8fwlel43TucU=;
 b=ltHzcvd1VsmcMpFp8MW39g14gmpc2j5p6TjFwSZ0llRGNNPTemH9a5Lt2X7togx+eL
 Y2lO8Ks1sS1Cd850vR57ye8H3WD0v8Y88j83mjEwwgAD/R5PobBLkv0gh76EaCDhTIxm
 uHhBeN3uTMonW90S3ZDiu4lLm6D/m6/ppRkRVanUBVJNYUr61Sq1AWJz3ThdNxTt8qQj
 qJicXlE6fA6mpTVzqJtkk2oGOgA4jjeUW5jXnyg8LigtAK5mskA31/0uwgwAtuRVZrYk
 xdzlOWsENgsFqayRa3qYa0peQzRiJ2unUYpeDrPVA0+DGKkXzyNKLyDYsDzYS7DzSDih
 dlmw==
X-Gm-Message-State: APjAAAWCuNpMlFVjf1VkEg3VCkb1axXWRXKm3NYif3NKiaZDJfQCZ70Q
 fQ52DUSONH7gM9leqe6A/Y+CPn8GKeg=
X-Google-Smtp-Source: APXvYqwzB9AwJZqplCtR9Dn8KJ2a7NOOTV6VjHUd/ljzSzBrVVyat0Vx56dQDOtKWKeJBSiGrS7rVw==
X-Received: by 2002:a63:c050:: with SMTP id z16mr2314463pgi.250.1569279611464; 
 Mon, 23 Sep 2019 16:00:11 -0700 (PDT)
Received: from localhost.localdomain ([12.206.46.59])
 by smtp.gmail.com with ESMTPSA id 74sm11674810pfy.78.2019.09.23.16.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 16:00:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/16] cputlb: Disable __always_inline__ without
 optimization
Date: Mon, 23 Sep 2019 15:59:50 -0700
Message-Id: <20190923230004.9231-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190923230004.9231-1-richard.henderson@linaro.org>
References: <20190923230004.9231-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org, stefanha@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This forced inlining can result in missing symbols,
which makes a debugging build harder to follow.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/compiler.h | 11 +++++++++++
 accel/tcg/cputlb.c      |  4 ++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index 09fc44cca4..20780e722d 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -170,6 +170,17 @@
 # define QEMU_NONSTRING
 #endif
 
+/*
+ * Forced inlining may be desired to encourage constant propagation
+ * of function parameters.  However, it can also make debugging harder,
+ * so disable it for a non-optimizing build.
+ */
+#if defined(__OPTIMIZE__)
+#define QEMU_ALWAYS_INLINE  __attribute__((always_inline))
+#else
+#define QEMU_ALWAYS_INLINE
+#endif
+
 /* Implement C11 _Generic via GCC builtins.  Example:
  *
  *    QEMU_GENERIC(x, (float, sinf), (long double, sinl), sin) (x)
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index abae79650c..2222b87764 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1281,7 +1281,7 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
 typedef uint64_t FullLoadHelper(CPUArchState *env, target_ulong addr,
                                 TCGMemOpIdx oi, uintptr_t retaddr);
 
-static inline uint64_t __attribute__((always_inline))
+static inline uint64_t QEMU_ALWAYS_INLINE
 load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
             uintptr_t retaddr, MemOp op, bool code_read,
             FullLoadHelper *full_load)
@@ -1530,7 +1530,7 @@ tcg_target_ulong helper_be_ldsl_mmu(CPUArchState *env, target_ulong addr,
  * Store Helpers
  */
 
-static inline void __attribute__((always_inline))
+static inline void QEMU_ALWAYS_INLINE
 store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
              TCGMemOpIdx oi, uintptr_t retaddr, MemOp op)
 {
-- 
2.17.1


