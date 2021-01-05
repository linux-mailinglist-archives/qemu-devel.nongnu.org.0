Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAC52EB1BE
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:48:35 +0100 (CET)
Received: from localhost ([::1]:57488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwqRe-0005dQ-AZ
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:48:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0y-00033p-4Q
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:21:00 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:42811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0w-0006kv-Eg
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:59 -0500
Received: by mail-pf1-x42c.google.com with SMTP id h10so110696pfo.9
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 09:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PZBhVDepUcDpkv6qOWXmKFUYbcFXiGc8v0ZHGvlO+rI=;
 b=YqmPi+JhWp9PVGRjdJSJO+y2w2PYNV9xtuKuBMM7xiBJ8WgO4MK00VhGGJIPoUXrBD
 TgVi+7uPBWMO5lBuL2lASyHEWXZdvVB7vMRWt7JNVST7UweU3vAEf0T7XDcmRa8XbQvl
 eTi9x9ShGzTxyTlrbzrC38+TrUjSi41Oabsqtc2t721cynxBAwk36DcG8VRN5w7bv/5w
 gM9knVt4flOlzeyutik7ppySxsyb/oWS6MosinviIVc8W9GDDuvlIe++V/EVCNiCrkPB
 nY0VQnAmC3sA30w8Z0kblATctD28nL4pIB12KWwikJHy/cFmzgMcj5Wwp7FSCtPA/H8D
 MVzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PZBhVDepUcDpkv6qOWXmKFUYbcFXiGc8v0ZHGvlO+rI=;
 b=fu8c1e7dWkKctSnkUDbrQeyUY51elFyEJc/CzKbLOSXXlPCXNIAoVm1/SA+3SZGelS
 6lAnu4XhtJhk/zJ/Al1S3aDSRD1yD1XN/cf+MMXBoxO0CgRxeLVWMGDUvHIN7t14fC74
 LoAsIjHPH+ntuGo0nT9aFtrjU7vwhRR9RLF1v+r2V12tNV3wlCN35ufYM3VXm67dypGB
 KzsDzHfpyvGc1o923FnnuTm4ocCBGNJiTO99PHngKY610UM1jn7CyMrdy1/4CgJxHv4/
 pT7xntciFAApVhbn74QR3ZvJOsxEXGJ5+SM24bJIyB9wZoamrXq0wZ7HwC5DGr/m62tQ
 AgQA==
X-Gm-Message-State: AOAM533bwa99bKGIGXp6KyON8OK7DRYtGoL4je/WWPO7pSKVVRqKqT27
 H3oNcJUJJm03RMqSAXru8jH6lRfQTbKoOg==
X-Google-Smtp-Source: ABdhPJwdnLAsYuuXJDvY+yhseCVxS79NFRlR30s35gLJtxFx+H8qT6xC9Q7zAocvJLxYQfuRh1Re0w==
X-Received: by 2002:a63:ea4b:: with SMTP id l11mr338097pgk.61.1609867256783;
 Tue, 05 Jan 2021 09:20:56 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id u12sm2010pfh.98.2021.01.05.09.20.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:20:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 37/43] accel/tcg: Add mips support to
 alloc_code_gen_buffer_splitwx_memfd
Date: Tue,  5 Jan 2021 07:19:44 -1000
Message-Id: <20210105171950.415486-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105171950.415486-1-richard.henderson@linaro.org>
References: <20210105171950.415486-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

Re-use the 256MiB region handling from alloc_code_gen_buffer_anon,
and replace that with the shared file mapping.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 46 ++++++++++++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 8 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 0c0f9c3e62..39a0413524 100644
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


