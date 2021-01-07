Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C992EE706
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 21:37:27 +0100 (CET)
Received: from localhost ([::1]:54034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxc2A-0002nS-UC
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 15:37:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbh7-0001Q2-3y
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:15:41 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:36985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbgz-0001bq-Lh
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:15:40 -0500
Received: by mail-pl1-x629.google.com with SMTP id be12so4159725plb.4
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 12:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dbx3vswVkUZktM/v/IchbClKMtfRLLh1m8Fm+DK5izs=;
 b=WHuhgjVD7K/qBQT1i19Ra0pb8ysajPuLehee4KKjmRupK7+BtBsG+OIk3jVNtnSFQG
 0QQCAp9je59hjYkMGH8cKwFhicT2KI2vwD+KaU+o9eNPaKLYlN+E1KaF3VSXYL16OYxo
 FabPkA8q/lv3GzIatlOR+gYaJ0xyd4+37Gd7sjtfEvujksUxYeU6Tr0DW8BIVSMgeDTl
 fXlBVBy20nD/DhCSwxeE0d+FT/mbhwmBUR+DZga0Qj7ochSsofQl4DixqW9+ctOwJslM
 WpzNbjsULDhoudz43JDhd4dDOxa8lATegPG+vr4ehFYikBSfZ+ABSLjQwzEfW2WoLAsZ
 0dJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dbx3vswVkUZktM/v/IchbClKMtfRLLh1m8Fm+DK5izs=;
 b=JlNRXNQIxAzOzF7C6h/6FnKs4mKXsrdHMeWAf3qTqEWrt6RNCqCyeyv2mzXUxcT4K8
 sXbPsTaQfsnEVmG6SKiqvBMk5Y0rx69gydmtCsngX4kFKDufidl+8Yi0PhhMZoEmSWHI
 pITlG3fQw+g9PaGqvduxhup1JFIvDoBs7BASylaYoyFUyq0pCzO0rLe9vyDnv0vzVIUX
 VrOUJ1QDt00DlW/82ijuSaEsN01yW5tAmG+TXeVgc37tYxFNqI4ssS4H/HvkSx+JIfhB
 2bR1Gur5gC5CXiI5sUfnkMWCuQUjei/mbxptlGceRqek2aH7cqRZ9C6nueMh7QImxT1t
 Dh6g==
X-Gm-Message-State: AOAM533zGCWWmg+1Dmvpm6PltVnAcRu/zHj70R/gv3VUIjSv6qhNwYn1
 /2bnZi+NLOOGgTtGRhFNG4r2crmp9K6Xrg==
X-Google-Smtp-Source: ABdhPJyTghBJfl5WvsH17L6f9L7i+2s0O+8zCA117R/E15d2Fy1+fFTMi9zP63n6jECKLjdM/Hj8QA==
X-Received: by 2002:a17:90a:9f47:: with SMTP id q7mr175132pjv.93.1610050531183; 
 Thu, 07 Jan 2021 12:15:31 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v6sm6516265pfi.31.2021.01.07.12.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 12:15:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/47] accel/tcg: Support split-wx for linux with memfd
Date: Thu,  7 Jan 2021 10:14:23 -1000
Message-Id: <20210107201448.1152301-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107201448.1152301-1-richard.henderson@linaro.org>
References: <20210107201448.1152301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

We cannot use a real temp file, because we would need to find
a filesystem that does not have noexec enabled.  However, a
memfd is not associated with any filesystem.

Reviewed-by: Joelle van Dyne <j@getutm.app>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 84 +++++++++++++++++++++++++++++++++++----
 1 file changed, 76 insertions(+), 8 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 022f9c743d..3b6804578d 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1078,17 +1078,11 @@ static bool alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
     return true;
 }
 #else
-static bool alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
+static bool alloc_code_gen_buffer_anon(size_t size, int prot,
+                                       int flags, Error **errp)
 {
-    int prot = PROT_WRITE | PROT_READ | PROT_EXEC;
-    int flags = MAP_PRIVATE | MAP_ANONYMOUS;
     void *buf;
 
-    if (splitwx > 0) {
-        error_setg(errp, "jit split-wx not supported");
-        return false;
-    }
-
     buf = mmap(NULL, size, prot, flags, -1, 0);
     if (buf == MAP_FAILED) {
         error_setg_errno(errp, errno,
@@ -1137,6 +1131,80 @@ static bool alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
     tcg_ctx->code_gen_buffer = buf;
     return true;
 }
+
+#ifdef CONFIG_POSIX
+#include "qemu/memfd.h"
+
+static bool alloc_code_gen_buffer_splitwx_memfd(size_t size, Error **errp)
+{
+    void *buf_rw, *buf_rx;
+    int fd = -1;
+
+    buf_rw = qemu_memfd_alloc("tcg-jit", size, 0, &fd, errp);
+    if (buf_rw == NULL) {
+        return false;
+    }
+
+    buf_rx = mmap(NULL, size, PROT_READ | PROT_EXEC, MAP_SHARED, fd, 0);
+    if (buf_rx == MAP_FAILED) {
+        error_setg_errno(errp, errno,
+                         "failed to map shared memory for execute");
+        munmap(buf_rw, size);
+        close(fd);
+        return false;
+    }
+    close(fd);
+
+    tcg_ctx->code_gen_buffer = buf_rw;
+    tcg_ctx->code_gen_buffer_size = size;
+    tcg_splitwx_diff = buf_rx - buf_rw;
+
+    /* Request large pages for the buffer and the splitwx.  */
+    qemu_madvise(buf_rw, size, QEMU_MADV_HUGEPAGE);
+    qemu_madvise(buf_rx, size, QEMU_MADV_HUGEPAGE);
+    return true;
+}
+#endif /* CONFIG_POSIX */
+
+static bool alloc_code_gen_buffer_splitwx(size_t size, Error **errp)
+{
+    if (TCG_TARGET_SUPPORT_MIRROR) {
+#ifdef CONFIG_POSIX
+        return alloc_code_gen_buffer_splitwx_memfd(size, errp);
+#endif
+    }
+    error_setg(errp, "jit split-wx not supported");
+    return false;
+}
+
+static bool alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
+{
+    ERRP_GUARD();
+    int prot, flags;
+
+    if (splitwx) {
+        if (alloc_code_gen_buffer_splitwx(size, errp)) {
+            return true;
+        }
+        /*
+         * If splitwx force-on (1), fail;
+         * if splitwx default-on (-1), fall through to splitwx off.
+         */
+        if (splitwx > 0) {
+            return false;
+        }
+        error_free_or_abort(errp);
+    }
+
+    prot = PROT_READ | PROT_WRITE | PROT_EXEC;
+    flags = MAP_PRIVATE | MAP_ANONYMOUS;
+#ifdef CONFIG_TCG_INTERPRETER
+    /* The tcg interpreter does not need execute permission. */
+    prot = PROT_READ | PROT_WRITE;
+#endif
+
+    return alloc_code_gen_buffer_anon(size, prot, flags, errp);
+}
 #endif /* USE_STATIC_CODE_GEN_BUFFER, WIN32, POSIX */
 
 static bool tb_cmp(const void *ap, const void *bp)
-- 
2.25.1


