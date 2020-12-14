Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 902BD2D9980
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:12:53 +0100 (CET)
Received: from localhost ([::1]:34972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kooaq-0002CO-IS
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:12:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSA-0001pJ-8P
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:03:54 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:41561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooS8-0003xQ-6n
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:03:53 -0500
Received: by mail-oi1-x241.google.com with SMTP id 15so19240603oix.8
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ymGaL1EBSCPIcfDoxvwITy+pJqgcYkV9uyyni3CD1Bk=;
 b=HARW748hdlNXi7hvkDwarWVJml0h8sdonvyvZjbTxaVlmbICF7hgl4Ivwuz7MeHBEt
 uNXEIwnbioG2OQ7Qx+psBQ0IXPi8jB+BOJ6qoJpC1jAJ3LZ0TGtMF/SMuiMos3iQsiOU
 O6Nt26sMAWNQ8wcttMO7zFEjWBRpi41ALaCt4cXNsg+ceJ4nMSDVZ/M1ZTmqTg3fivQv
 BMgmrwRaSX9cx0WSS5dxWJSQHqdLFSyUQ21yjLdLED/QVii3xPe4CQNRANc4Q5sPppmU
 yVeIj06Zmf88ZTnuKcZ72ef8sH/9Vq3BO1/aLxtQemSTpjcdq2k7fHDAOvCENjwoJoXX
 zvgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ymGaL1EBSCPIcfDoxvwITy+pJqgcYkV9uyyni3CD1Bk=;
 b=cwh2JNmLEy04c5WdFysvtqBIEQHBS0a7lF/+TyMY+eAF8EICVkXqSdwPbW+BjKwY7f
 bsmRvzH+6zCgRiOub6gnnq6qciq/GkSV8fz9qWUEAlKJPz1rDTCbYVBzm5AgCyBNzsmR
 IAh9cR7UoS6Nkr2vRBA1BhH8ahHaIVpsWBhSeeMyqDeLAr5I4RVcbqRVjcrY3ln2T5FH
 UljXU7H+XcLF19fdExWuNlgoAMWsXfkkEz+DAJmfFHcrRC/GFQ6/rig8A3zTIozlvWr/
 qJk/PpSgvbFxMgcjSrYL2uql/1ryPDz+/ttqrTV00m+2maIE1VOd7LG44UpWqusnfhc3
 7f9A==
X-Gm-Message-State: AOAM533XqfcUos8uMIdXv6/psftiyHbbp/lHlAF2PJBdwU+EkGxLSa+b
 5a3F33cuh1tAHY9DKkcK6Wfj3FWjfUcbr81B
X-Google-Smtp-Source: ABdhPJzH9pvZi7G8w9m/y3rfWLogH1apEoyjLTZdNFojxB2HKHu8oQLtQoY8hEn+rHBp621JUjDHhQ==
X-Received: by 2002:aca:538c:: with SMTP id h134mr19014639oib.44.1607954629758; 
 Mon, 14 Dec 2020 06:03:49 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm3940146oou.4.2020.12.14.06.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:03:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 19/43] accel/tcg: Support split-wx for darwin/iOS with
 vm_remap
Date: Mon, 14 Dec 2020 08:02:50 -0600
Message-Id: <20201214140314.18544-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214140314.18544-1-richard.henderson@linaro.org>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x241.google.com
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
Cc: Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cribbed from code posted by Joelle van Dyne <j@getutm.app>,
and rearranged to a cleaner structure.

Reviewed-by: Joelle van Dyne <j@getutm.app>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 65 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 1931e65365..17df6c94fa 100644
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
@@ -1201,6 +1263,9 @@ static bool alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
 #ifdef CONFIG_TCG_INTERPRETER
     /* The tcg interpreter does not need execute permission. */
     prot = PROT_READ | PROT_WRITE;
+#elif defined(CONFIG_DARWIN)
+    /* Applicable to both iOS and macOS (Apple Silicon). */
+    flags |= MAP_JIT;
 #endif
 
     return alloc_code_gen_buffer_anon(size, prot, flags, errp);
-- 
2.25.1


