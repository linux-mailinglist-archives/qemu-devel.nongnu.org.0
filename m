Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5553DE50D
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:24:34 +0200 (CEST)
Received: from localhost ([::1]:54338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAlyj-0003Jx-Rn
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:24:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpf-0003PL-VN
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:11 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:54873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpe-0002Hf-9j
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:11 -0400
Received: by mail-pj1-x1031.google.com with SMTP id a8so5028842pjk.4
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=S4xfwzkgV75iY6Ms9jicJ1wRxG0Yk5EsOM0WRCiSap4=;
 b=tql1oGuoGbNY+IWYJxIoh9sXujNZUAM5rq46zCmmgk+t4F6FZd37ViQIJ54PhgXu9V
 Xe3LlhWRwPwxTkM7hKFrZvYD8FVjJzCW6u8qJPrO5cudb1rBQ2KU5clFDxqGl58gWZaE
 m5Df+GHGZp9ZgfNafCozx1tOLZIvpgpZoYFUe817LSsgjm0JA8Z/xJIXl/nTcBqAz92/
 UUkL+iXvmamO1HI0TSX6Fjd5FZaWs367WN2CnjroeobOXUpWQC4zjU5Emv8sgxUKZxYu
 /xz+fcTbBwoW2cfmR22ooHnxv/naF1u0dguL5TFWdTZAIJ3k1hEHOmtia63CKcRL32ui
 33eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S4xfwzkgV75iY6Ms9jicJ1wRxG0Yk5EsOM0WRCiSap4=;
 b=lw4wb0icWLLpv6p2MSRA9C+JGaKbUBNe/2LiG7BiDF8WkUh2V7CuWt0v5ETXiDomBT
 Rgp4S5cNXgMhbN1K/xxKBCeQbMSweVYNmHxz5jAAdriHtG/CxNqRBKiwzI+r9bTwedS5
 SZnz222NBtOKDqXaQELxu37iNP63WNjXm2NcLk5hy9eLMybBBUEt4UD76KEABpO4gZmY
 dQh1BAkj3Xsivv+26Du7n5bZ22Ykjb+pTst6+tEdgVSVj6GT9O6kBOWtlAcT2HpBGzak
 NYadBQIn3A+OdhCB0ncW7soJtU5RhmLAWSpir/NxKR/7aUiyys93wRJtYGnFJaBye1K2
 YQmg==
X-Gm-Message-State: AOAM533doclbHTsIaJBQPqN3+5lLcRDv+hb1B6vV8F2x6mCJVS22W2gD
 LTc+4nztHIU319SkTYRzzTBE2TFZx5U16Q==
X-Google-Smtp-Source: ABdhPJwR9kWXklsVw9c4hIIInB9kR4MNDfMYg4A3/1dR6EB0Ld7nCD/coOlC/bwWuDmfnm6j24h4Ag==
X-Received: by 2002:a63:c0a:: with SMTP id b10mr205781pgl.447.1627964109000;
 Mon, 02 Aug 2021 21:15:09 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id c23sm13718532pfn.140.2021.08.02.21.15.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:15:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/55] accel/tcg: Report unaligned atomics for user-only
Date: Mon,  2 Aug 2021 18:14:08 -1000
Message-Id: <20210803041443.55452-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the newly exposed cpu_unaligned_access for atomic_mmu_lookup,
which has access to complete alignment info from the TCGMemOpIdx arg.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/user-exec.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 90d1a2d327..5ad808a25a 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -28,6 +28,7 @@
 #include "qemu/atomic128.h"
 #include "trace/trace-root.h"
 #include "trace/mem.h"
+#include "internal.h"
 
 #undef EAX
 #undef ECX
@@ -1230,11 +1231,22 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
                                TCGMemOpIdx oi, int size, int prot,
                                uintptr_t retaddr)
 {
+    MemOp mop = get_memop(oi);
+    int a_bits = get_alignment_bits(mop);
+    void *ret;
+
+    /* Enforce guest required alignment.  */
+    if (unlikely(addr & ((1 << a_bits) - 1))) {
+        MMUAccessType t = prot == PAGE_READ ? MMU_DATA_LOAD : MMU_DATA_STORE;
+        cpu_unaligned_access(env_cpu(env), addr, t, get_mmuidx(oi), retaddr);
+    }
+
     /* Enforce qemu required alignment.  */
     if (unlikely(addr & (size - 1))) {
         cpu_loop_exit_atomic(env_cpu(env), retaddr);
     }
-    void *ret = g2h(env_cpu(env), addr);
+
+    ret = g2h(env_cpu(env), addr);
     set_helper_retaddr(retaddr);
     return ret;
 }
-- 
2.25.1


