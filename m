Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 508EC2EB18D
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:41:21 +0100 (CET)
Received: from localhost ([::1]:33624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwqKe-0003zW-Ap
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:41:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0Z-0002P6-5R
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:36 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:34935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0U-0006bg-P4
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:34 -0500
Received: by mail-pj1-x1035.google.com with SMTP id b5so27658pjl.0
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 09:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a/0Vgv50hc1LXXX4C7/zC4wpNnScirkNY5xQi7vT9aQ=;
 b=djZUjhCMewsq21/c+tjVafsy2FGjVfvpxuDMBM5dNiyFxfw3gbMYdfjx2iu2bjeVGm
 9n9cbW5tjFUcvRZV21LvItkuv2wLhA3iMtIwBCLbzGvT+RaV6jVOBLu0JXj7URLlsZIJ
 2ORMa8hKdac0ARs8//aHhphXlo632tRkxTtiQW8iAZ0YE8BsCb3MTE2lqXUrmph/WVnY
 lqwupssdW16Sq792cy5Uwv0vw0hOTk+Xgq1ghQTs1/07d7DQ/prSSroBsZEjQj7O6em1
 CzlqP5e5skjDTv8V1Fl8pl2KrMdGt0b9Jn6AaGfUuz3d1WlPVXo6N/7Qq4BMH/vKIacg
 l2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a/0Vgv50hc1LXXX4C7/zC4wpNnScirkNY5xQi7vT9aQ=;
 b=d/3Q2qFmwa34L1AczUPLaEuZWrV4A1eCgsoHnZc86+oartfqN8GcZGxU5sj/t1XMg3
 G+O+gXEacwimm759YZAqZYo02IK+kaLkFfR4dxfaputCDBeWz1U5Szb+DQq0sAU/KTJy
 opAhQanaOV3gaAcijmVdgKgPlRvbuIeyaUT5TS+6hef5KIxM6YX4QWTPnBbPOksFNTHg
 VAxteAWrz4AMvgP3+6PFLdFypsx8Q7rYSkKVV4FuYYw86WJ0yhP1UJ6t8YNzeA4fopxS
 /d+r6Uuuo+LGw1nTtlOlHZ45OU8uvvnyrNufbMUcfhrotjTymzNC0GloGi+pG57VcJz8
 u1eQ==
X-Gm-Message-State: AOAM533/wrV1LTxUP30HcCTKEU/psFZm/rXUewqMtnuBRSmw6J8vuVXz
 ZknebQBZy5BRPJHsn3j3k/rpsrIMdhjNnA==
X-Google-Smtp-Source: ABdhPJzlvREPjbtdxe/bqoHjQcVYDSdLb5Ci+NOKYHC8wNPxfFmjhY2m4pNc3f3jjIWbmw8BDNhZoQ==
X-Received: by 2002:a17:902:ac98:b029:da:cd0f:b6a4 with SMTP id
 h24-20020a170902ac98b02900dacd0fb6a4mr323216plr.71.1609867229247; 
 Tue, 05 Jan 2021 09:20:29 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id u12sm2010pfh.98.2021.01.05.09.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:20:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 19/43] accel/tcg: Support split-wx for darwin/iOS with
 vm_remap
Date: Tue,  5 Jan 2021 07:19:26 -1000
Message-Id: <20210105171950.415486-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105171950.415486-1-richard.henderson@linaro.org>
References: <20210105171950.415486-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
 accel/tcg/translate-all.c | 67 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 27c88527ea..0c0f9c3e62 100644
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


