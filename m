Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0472EE749
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 21:58:44 +0100 (CET)
Received: from localhost ([::1]:59554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxcMl-0004Pj-Ib
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 15:58:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbhe-0001cO-Jz
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:16:14 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:40029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbhV-0001ik-1L
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:16:14 -0500
Received: by mail-pl1-x633.google.com with SMTP id q4so4154865plr.7
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 12:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LaTXN69dgwbs1ISFkqvlbDLmQMLsIvhLpgwyriKzsQg=;
 b=oTLAhLjuLOaoGuw+0B9oPUa/NCe7gzFOOztzsrY+8L6Y3bSh18DfzIqLxvi9wSSNym
 cJtBVpMZG2QeMAv9YF9XuYzFQ5MBmEKKZaXMrZjV9gW8244Em1zY31V8ywpk3MZtsW/5
 7jdro5/ZTm9bZUvUbNuWM9zW3oXsr7Nkvi/9vX38rleiR+WybzHErxNPWhuJuaTTFFXW
 W9GYv7DJOyDh0FcnzVs2nt+NTmJoLju7ORZkP4J+gZCBAGFVwUGbkzrebguA7zqq3TSd
 RwWMSy+W+Q3ZYMmdYREXmRHRoJ9yjb16CTKjPOYGupIo7OYPQXrUuxtp1h633BxOWZIW
 nFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LaTXN69dgwbs1ISFkqvlbDLmQMLsIvhLpgwyriKzsQg=;
 b=Jlrjd86XWBlPpQtgA+yXdw5W8OAG0UGFbv6b0+yO/Qo5Hou2mGzjuDDK++H/QfstKJ
 L3kxfXRv84OHUFVfClZu4q0bYeNpaAz2MEfiZcL4m0Dvr8yrJOjXhM8nop0PqeoDDPyc
 mlDU4zh3N/C3i0JqqW0tKpK55BMuEdUKhkH6iO80LD1Nu38wRajnW4uE8mOjf7weyDfs
 bojU635ROWIaLhI/Uo8orawXsG2u0zfiWgTk4ITS96UySbfRpRdkG4bRCDNrD2XkocsN
 DiMR3SO1CBypOKzI2uw/WH5HP4ENJVJq9wLDfGDdESooPJKEaaKcgam8snFNd/G57GpA
 6/2A==
X-Gm-Message-State: AOAM533lzCghHPkCCYldI+vuftHLv1/18g/Wes8NyfAtWpWuRLJ2Egsb
 RsRGuN2+yrYdBrJOf9M0o9mt8W7WATw9bQ==
X-Google-Smtp-Source: ABdhPJzei2RvjwRqB/w4ntYffX7Oah+LVq8Ic22wo2OhsxHZmkzOSa0OPt7MquhIAcQM6ohwe/HazA==
X-Received: by 2002:a17:90a:2e83:: with SMTP id
 r3mr192934pjd.112.1610050562097; 
 Thu, 07 Jan 2021 12:16:02 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v6sm6516265pfi.31.2021.01.07.12.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 12:16:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 41/47] accel/tcg: Add mips support to
 alloc_code_gen_buffer_splitwx_memfd
Date: Thu,  7 Jan 2021 10:14:42 -1000
Message-Id: <20210107201448.1152301-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107201448.1152301-1-richard.henderson@linaro.org>
References: <20210107201448.1152301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Re-use the 256MiB region handling from alloc_code_gen_buffer_anon,
and replace that with the shared file mapping.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 46 ++++++++++++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 8 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index c37718db4d..02e1b05c42 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1137,24 +1137,40 @@ static bool alloc_code_gen_buffer_anon(size_t size, int prot,
 
 static bool alloc_code_gen_buffer_splitwx_memfd(size_t size, Error **errp)
 {
-    void *buf_rw, *buf_rx;
+    void *buf_rw = NULL, *buf_rx = MAP_FAILED;
     int fd = -1;
 
+#ifdef __mips__
+    /* Find space for the RX mapping, vs the 256MiB regions. */
+    if (!alloc_code_gen_buffer_anon(size, PROT_NONE,
+                                    MAP_PRIVATE | MAP_ANONYMOUS |
+                                    MAP_NORESERVE, errp)) {
+        return false;
+    }
+    /* The size of the mapping may have been adjusted. */
+    size = tcg_ctx->code_gen_buffer_size;
+    buf_rx = tcg_ctx->code_gen_buffer;
+#endif
+
     buf_rw = qemu_memfd_alloc("tcg-jit", size, 0, &fd, errp);
     if (buf_rw == NULL) {
-        return false;
+        goto fail;
     }
 
+#ifdef __mips__
+    void *tmp = mmap(buf_rx, size, PROT_READ | PROT_EXEC,
+                     MAP_SHARED | MAP_FIXED, fd, 0);
+    if (tmp != buf_rx) {
+        goto fail_rx;
+    }
+#else
     buf_rx = mmap(NULL, size, PROT_READ | PROT_EXEC, MAP_SHARED, fd, 0);
     if (buf_rx == MAP_FAILED) {
-        error_setg_errno(errp, errno,
-                         "failed to map shared memory for execute");
-        munmap(buf_rw, size);
-        close(fd);
-        return false;
+        goto fail_rx;
     }
-    close(fd);
+#endif
 
+    close(fd);
     tcg_ctx->code_gen_buffer = buf_rw;
     tcg_ctx->code_gen_buffer_size = size;
     tcg_splitwx_diff = buf_rx - buf_rw;
@@ -1163,6 +1179,20 @@ static bool alloc_code_gen_buffer_splitwx_memfd(size_t size, Error **errp)
     qemu_madvise(buf_rw, size, QEMU_MADV_HUGEPAGE);
     qemu_madvise(buf_rx, size, QEMU_MADV_HUGEPAGE);
     return true;
+
+ fail_rx:
+    error_setg_errno(errp, errno, "failed to map shared memory for execute");
+ fail:
+    if (buf_rx != MAP_FAILED) {
+        munmap(buf_rx, size);
+    }
+    if (buf_rw) {
+        munmap(buf_rw, size);
+    }
+    if (fd >= 0) {
+        close(fd);
+    }
+    return false;
 }
 #endif /* CONFIG_POSIX */
 
-- 
2.25.1


