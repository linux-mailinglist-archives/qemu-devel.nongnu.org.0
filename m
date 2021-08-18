Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBB43F0BD7
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:33:49 +0200 (CEST)
Received: from localhost ([::1]:48234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRJs-0002si-UA
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:33:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6O-0000lX-I4
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:54 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:33609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6L-0000AU-Sp
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:52 -0400
Received: by mail-pf1-x42e.google.com with SMTP id w68so3174755pfd.0
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DmIhPz5TPVXbbigs7Q5NjzG9ob6whdFwbwdubQ9UQp4=;
 b=KddNVoRFqaDeWHyIAmVh3l02GjqkkZOMo/y/sWd7VQ8uENUWCWoSgG6HxZjpZYWK6f
 mEiGblCDzMPlnS09gih/ELKhlC1xRMJIUDbcO/DWytPBnKru887GzAfgDmm813xaAtkX
 HjOfJqowshhqRch2+5RTaQQW3C1AxcrBgiJHlFFa9P/4K66L1wL9wKkxGv2NBasCha92
 g3UV7qYLg+MTAFRmPLPSO8Rhih4phZvj2zrTZiK6sD2qwAlbbUI+R+UnFbVCptDvtPay
 zTlzHu+ZbclRZNMMp86WnlyF/qHFrPvQsdPzn4NKr8a68N+ff8+Z0yc1k01TP+lC7Wjp
 j0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DmIhPz5TPVXbbigs7Q5NjzG9ob6whdFwbwdubQ9UQp4=;
 b=IWgQZ9LXUz3meKS+k3+8Tzvtnv19PaRj3CKChedT8xFl5GWFSJ8O55pkhzgWPk5+QH
 boTIWVNaiO20V22CEGnfONhKYhLSkdfwx/AvlrbvSusMAW95tnGBi/7ARc/sf+g/FKrm
 ktayRn0thgoB4Hd9MX+B1H3qONQEK779ubgRC/HEqDDDdFgHPwD9tL6QacfCs/OYa+kK
 oYYWlXOIqVTKvs36gKoap9iDwtSigFtqdmGQTzEF54tKFDyWa+b52u4v0GVgwfOKdc2A
 a0NQI5MFZ/j6x32nsLBb7bkSCLJ4eiugmhyUk7vjg6eqFv9/XpOxYyQ0xOGrnj/4Tsf6
 FnhA==
X-Gm-Message-State: AOAM531XrBQtxaZWC2t5QRAxRhplkMz5oPfGQgwPJUS2rmvOgay1ukT9
 4jU/h92FW5iB5k88JvYaaWmFcfRlQyFYJA==
X-Google-Smtp-Source: ABdhPJy7gKs1vmijnuiw7nijnxbks/dPGl3NrNDegAZCle6ttgV1Oe/vBE1sAqglSduK2lfHnIFUeA==
X-Received: by 2002:a62:e308:0:b0:3e1:4077:4fbd with SMTP id
 g8-20020a62e308000000b003e140774fbdmr10969820pfh.51.1629314388646; 
 Wed, 18 Aug 2021 12:19:48 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id a6sm524108pjs.40.2021.08.18.12.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:19:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 21/66] accel/tcg: Report unaligned atomics for user-only
Date: Wed, 18 Aug 2021 09:18:35 -1000
Message-Id: <20210818191920.390759-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the newly exposed cpu_unaligned_access for atomic_mmu_lookup,
which has access to complete alignment info from the TCGMemOpIdx arg.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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


