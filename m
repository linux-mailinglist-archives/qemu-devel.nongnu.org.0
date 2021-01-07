Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD142EE6FC
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 21:35:01 +0100 (CET)
Received: from localhost ([::1]:45578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxbzo-0007QY-BX
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 15:35:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbh6-0001Pb-Mw
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:15:41 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:46958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbh0-0001d7-FG
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:15:40 -0500
Received: by mail-pl1-x62b.google.com with SMTP id v3so4137894plz.13
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 12:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qgYqS6tOZzMDkyU6hbsvYTQLjO0dALugPDUkQ7apIPE=;
 b=XdIvH3/67mjY96bfvCKMUT7RJPb6di9MwRX9V0XaIgj5Ii64zgTg0qotlcZhQiVeul
 FAjjrHBdPfiOjieHjzel31gLxzyQABM7gX4XR1VAUpeuEcl8Mx3pHjDbyw7fCez/ZGQz
 5qPgPDR2yIiZegeny2GXbuOFOuH2QG9CPkSn4QD/hSkp9NblGq9FoBQL8iBh7M0AlCOf
 zmll1vNw8WM5TQ6sGKxE+CReo+6rXDk2Xo7GEL0+lUaA/LKdDF4xuXfF63ACSMvD8+UC
 ULpS7Pv/lz8xWMx7cokRd709U5il2Krp3SKspLOfnPL5dmiyXSjpNGK5TnfxjgE7r61g
 KQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qgYqS6tOZzMDkyU6hbsvYTQLjO0dALugPDUkQ7apIPE=;
 b=Y1gAZ4d40g6OCNgdX+EH7iQO73MJkWytKJuaqOV+AR3qLrbEYdix8rBBlba85ZWm53
 XGapKyQ6b6mL2cMCg8sU7y2jxHBNZUE4AFJayIvQ/GSHETpZdOYUH704MPbpC/2jvL0T
 V8WVOgIPB8E4C85qhqBoD95s6tj2N3KLBF6YvQehsvS+480nr9iMGeZex/dSzILEc243
 8YrO/3cZ3dHngzdg27maceoRQuGaklu2wG0SaS2BQUg6hhHYpHmggdQDWc8SBD4vB5ow
 x0Kmlo/GXKLuKEb6e54bgx2T6acRe6d0PzGSckgvpWDHvYKrpJEvrVqEl8Xdpr7I6KE6
 UM+g==
X-Gm-Message-State: AOAM532yBhbHiByuoRHysOPezo12E/QHsF6NugX5HJgjxDeKkScnGi0K
 4Mn0+8Gi1TL/qsEwXLOkxSV8a61iP7ZFlQ==
X-Google-Smtp-Source: ABdhPJyfvaEwJ7vKsyCX/Xw/iZpSm2xECBymAS4boMrxszyFqpjkG4oblwa29rIZMWexEpdkwVwLMQ==
X-Received: by 2002:a17:90a:f683:: with SMTP id
 cl3mr194601pjb.136.1610050532842; 
 Thu, 07 Jan 2021 12:15:32 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v6sm6516265pfi.31.2021.01.07.12.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 12:15:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/47] accel/tcg: Support split-wx for darwin/iOS with vm_remap
Date: Thu,  7 Jan 2021 10:14:24 -1000
Message-Id: <20210107201448.1152301-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107201448.1152301-1-richard.henderson@linaro.org>
References: <20210107201448.1152301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: peter.maydell@linaro.org, Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cribbed from code posted by Joelle van Dyne <j@getutm.app>,
and rearranged to a cleaner structure.

Reviewed-by: Joelle van Dyne <j@getutm.app>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 67 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 3b6804578d..c37718db4d 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1166,9 +1166,71 @@ static bool alloc_code_gen_buffer_splitwx_memfd(size_t size, Error **errp)
 }
 #endif /* CONFIG_POSIX */
 
+#ifdef CONFIG_DARWIN
+#include <mach/mach.h>
+
+extern kern_return_t mach_vm_remap(vm_map_t target_task,
+                                   mach_vm_address_t *target_address,
+                                   mach_vm_size_t size,
+                                   mach_vm_offset_t mask,
+                                   int flags,
+                                   vm_map_t src_task,
+                                   mach_vm_address_t src_address,
+                                   boolean_t copy,
+                                   vm_prot_t *cur_protection,
+                                   vm_prot_t *max_protection,
+                                   vm_inherit_t inheritance);
+
+static bool alloc_code_gen_buffer_splitwx_vmremap(size_t size, Error **errp)
+{
+    kern_return_t ret;
+    mach_vm_address_t buf_rw, buf_rx;
+    vm_prot_t cur_prot, max_prot;
+
+    /* Map the read-write portion via normal anon memory. */
+    if (!alloc_code_gen_buffer_anon(size, PROT_READ | PROT_WRITE,
+                                    MAP_PRIVATE | MAP_ANONYMOUS, errp)) {
+        return false;
+    }
+
+    buf_rw = (mach_vm_address_t)tcg_ctx->code_gen_buffer;
+    buf_rx = 0;
+    ret = mach_vm_remap(mach_task_self(),
+                        &buf_rx,
+                        size,
+                        0,
+                        VM_FLAGS_ANYWHERE,
+                        mach_task_self(),
+                        buf_rw,
+                        false,
+                        &cur_prot,
+                        &max_prot,
+                        VM_INHERIT_NONE);
+    if (ret != KERN_SUCCESS) {
+        /* TODO: Convert "ret" to a human readable error message. */
+        error_setg(errp, "vm_remap for jit splitwx failed");
+        munmap((void *)buf_rw, size);
+        return false;
+    }
+
+    if (mprotect((void *)buf_rx, size, PROT_READ | PROT_EXEC) != 0) {
+        error_setg_errno(errp, errno, "mprotect for jit splitwx");
+        munmap((void *)buf_rx, size);
+        munmap((void *)buf_rw, size);
+        return false;
+    }
+
+    tcg_splitwx_diff = buf_rx - buf_rw;
+    return true;
+}
+#endif /* CONFIG_DARWIN */
+
 static bool alloc_code_gen_buffer_splitwx(size_t size, Error **errp)
 {
     if (TCG_TARGET_SUPPORT_MIRROR) {
+#ifdef CONFIG_DARWIN
+        return alloc_code_gen_buffer_splitwx_vmremap(size, errp);
+#endif
 #ifdef CONFIG_POSIX
         return alloc_code_gen_buffer_splitwx_memfd(size, errp);
 #endif
@@ -1201,6 +1263,11 @@ static bool alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
 #ifdef CONFIG_TCG_INTERPRETER
     /* The tcg interpreter does not need execute permission. */
     prot = PROT_READ | PROT_WRITE;
+#elif defined(CONFIG_DARWIN)
+    /* Applicable to both iOS and macOS (Apple Silicon). */
+    if (!splitwx) {
+        flags |= MAP_JIT;
+    }
 #endif
 
     return alloc_code_gen_buffer_anon(size, prot, flags, errp);
-- 
2.25.1


