Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3909F6A1166
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 21:45:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVIRl-0002wa-9M; Thu, 23 Feb 2023 15:44:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVIRj-0002ti-GP
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 15:44:07 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVIRh-0007PT-Rc
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 15:44:07 -0500
Received: by mail-pl1-x632.google.com with SMTP id e5so15563839plg.8
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 12:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yTc8B4JFMt2BP2s8OFGRKyLxOfXJWkbz6vP1/iv9tl8=;
 b=KtMMPbbnac41HdsjB0iPOxFkQMHlwQmJNk4nxVGxYUcUd0k5e0ViKo4Y6DNICfbS3H
 sQsmSgF8Lawd5ijlnks0Vuut6+4xtZa1cdW2yqkGu9HJRVN/uXy07qrbZVyA+GEHG9og
 5TSc7K6JLFVR/OnTWetN8b+xCqbFwd2QHYhPKTzFSXVh+398ARvZLlDJVNq5QCMTJjOA
 cn7Yh8ayd62xc57krVEXwgjxXR3SuFRgPE+/bAZrZerMPtruWI8iYNvr/0SbGnTFhH+x
 frvjzSfyTlk2A9ZelIu5jfC5sMzyJ9P+9Ky9DhnLcj2GCvrG3xLNsu1ohIfe2CX1VuXH
 0GKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yTc8B4JFMt2BP2s8OFGRKyLxOfXJWkbz6vP1/iv9tl8=;
 b=10owN3+nyKau4jS42EKzJsVWXDykoSsRxmMRtL/cBRNqzsYhFmJV4FYRVl84dvnW98
 7LbpfFMtAPqASB0wW2WYY1I5Qt6HeW3D3TxjOHHi3GRcb3O6eJXigk/OT8FoqSEZVwyp
 ll/3se5CuovpM9G3haxA5rwkMeTCv6X+Ff6u3igOQNkVnTNalcEU61bzR8Yv/rDsjfPP
 1VlS0EIDwXu7GxC3yyNukL/k2Yvwr4MFPCmLVPmojYxu87fQMCFc9F/2DqVyysKfF6Uy
 ZzwE1FsVSg3CvK85BW99p3m9lAjM71T3hKsC/YGRmx+g5z8QzYqe8NwSgnLevYG8zwNK
 +ZbQ==
X-Gm-Message-State: AO0yUKU5J2SEtHs7euG3aBontdCZhOQRmeftXgZ1+BlPUksmrG575XYZ
 VbEoqH+Gij1I1l1/HTQ5oe8ueNbrsE9I5U+FQts=
X-Google-Smtp-Source: AK7set+Ber1ERYP1MO2u5xrsxVUVQYJLd2mkg9V8Msue4RxE+cSLMCAfIQnEBEsgbvNmq6Tc+qbSpg==
X-Received: by 2002:a17:90b:3847:b0:233:e426:6501 with SMTP id
 nl7-20020a17090b384700b00233e4266501mr13056943pjb.19.1677185045020; 
 Thu, 23 Feb 2023 12:44:05 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 e187-20020a6369c4000000b004b1fef0bf16sm5992850pgc.73.2023.02.23.12.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 12:44:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 11/13] accel/tcg: Add TLB_CHECK_ALIGNED
Date: Thu, 23 Feb 2023 10:43:40 -1000
Message-Id: <20230223204342.1093632-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230223204342.1093632-1-richard.henderson@linaro.org>
References: <20230223204342.1093632-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This creates a per-page method for checking of alignment.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h |  4 +++-
 accel/tcg/cputlb.c     | 25 ++++++++++++++++++++++++-
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index f3b2f4229c..5bb04782ba 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -399,8 +399,10 @@ CPUArchState *cpu_copy(CPUArchState *env);
 #define TLB_BSWAP            (1 << 0)
 /* Set if TLB entry contains a watchpoint.  */
 #define TLB_WATCHPOINT       (1 << 1)
+/* Set if TLB entry requires aligned accesses.  */
+#define TLB_CHECK_ALIGNED    (1 << 2)
 
-#define TLB_SLOW_FLAGS_MASK  (TLB_BSWAP | TLB_WATCHPOINT)
+#define TLB_SLOW_FLAGS_MASK  (TLB_BSWAP | TLB_WATCHPOINT | TLB_CHECK_ALIGNED)
 
 /* The two sets of flags must not overlap. */
 QEMU_BUILD_BUG_ON(TLB_FLAGS_MASK & TLB_SLOW_FLAGS_MASK);
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index a90688ac30..c692e71766 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1546,7 +1546,7 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
     flags |= full->slow_flags[access_type];
 
     /* Fold all "mmio-like" bits into TLB_MMIO.  This is not RAM.  */
-    if (unlikely(flags & ~(TLB_WATCHPOINT | TLB_NOTDIRTY))) {
+    if (flags & ~(TLB_WATCHPOINT | TLB_NOTDIRTY | TLB_CHECK_ALIGNED)) {
         *phost = NULL;
         return TLB_MMIO;
     }
@@ -1885,6 +1885,29 @@ static bool mmu_lookup(CPUArchState *env, target_ulong addr, MemOpIdx oi,
         tcg_debug_assert((flags & TLB_BSWAP) == 0);
     }
 
+    /*
+     * This alignment check differs from the one above, in that this is
+     * based on the atomicity of the operation. The intended use case is
+     * the ARM memory type field of each PTE, where access to pages with
+     * Device memory type require alignment.
+     */
+    if (unlikely(flags & TLB_CHECK_ALIGNED)) {
+        MemOp atmax = l->memop & MO_ATMAX_MASK;
+        MemOp atom = l->memop & MO_ATOM_MASK;
+        MemOp size = l->memop & MO_SIZE;
+
+        if (size != MO_8 && atom != MO_ATOM_NONE) {
+            if (atmax == MO_ATMAX_SIZE) {
+                a_bits = size;
+            } else {
+                a_bits = atmax >> MO_ATMAX_SHIFT;
+            }
+            if (addr & ((1 << a_bits) - 1)) {
+                cpu_unaligned_access(env_cpu(env), addr, type, l->mmu_idx, ra);
+            }
+        }
+    }
+
     return crosspage;
 }
 
-- 
2.34.1


