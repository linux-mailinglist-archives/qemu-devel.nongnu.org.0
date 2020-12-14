Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD9A2D9A27
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:41:54 +0100 (CET)
Received: from localhost ([::1]:34100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kop2v-00035i-Iz
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:41:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSd-0002MG-KS
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:04:27 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:46734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSb-00042E-RA
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:04:23 -0500
Received: by mail-ot1-x344.google.com with SMTP id w3so15757999otp.13
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vrSqwZKXMyaSyRVRtm4Hh+vS+LTe1orOUMFlnbJhADM=;
 b=ZTrJ9csEkHzMvHpyiiud4BUrYZ8IFUysHkcvYdfcPv6AEQ6OApcrNueWmkVau6kIZY
 xes6h0iIoU4cNLvZ00ZD4O+IRsufw1SdxdJbJjg7E6yFbPj4HD2Igcff9D8iDNEUkdo3
 wnycvVfQkWGilSlgSobzcRjy0obqGGu6z/kr1yMqZQd7p1MYgjoZcnzEg8dHDjnklOHz
 C03thYH/sGhTXgPDT5oSdwfMunP+ukjTT0xTnUgWVn9zGJuIS30YKqETOwHlGmjOMp9k
 zRtnbHPlZg2tzcg9WVF8/fnHpdxYd13xGNJVbRPPMOX+GSH+67ybadW6XyCFQQ6Aa6ti
 gm9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vrSqwZKXMyaSyRVRtm4Hh+vS+LTe1orOUMFlnbJhADM=;
 b=O9+nbakkG82a56CdabecWoF4Qxa9VBw82jg7F1gV2MW7AwFV/Vo+7439zOg2VUQ0lS
 hEx0znfQ/4AjnCteF5FEkSvlN/FyVLGWnv34wcw4Oyg5OYwf/vvlHaepuzE6lTVINill
 uvVfSkLiUd+uD0welFwbW81Qh7D4i6yo9VjfuvMsgT2Cqx2XDqZx7aQMwp1mQ13XdVlo
 i+vsf+Z0ikapW8DPl30nFONWSMGFPpcHhZDKJtUuEfxPJcgXnOHO63fgrWNQBpNUABZQ
 GYTv3O9fFh36LZUP1YvY9iwE3J2cNfV8euB1UL/q6A5qLFYlydyyqd5KtGuDhPwYHfJT
 7mtg==
X-Gm-Message-State: AOAM5323PNXEXcVBC024EIZAdGUReAtlmivKnJc+TLFCbPCRSdTk4+t6
 jB2TOTmXYgnwp0HXoqkS7hK8dhMQ+fk9vAGJ
X-Google-Smtp-Source: ABdhPJxAzA6SZTTeebkG7Gc7VkjdZ5b0/65qge62qL0BNmo+GR3mhiDS20U8g88MXvj3fhosppwaGg==
X-Received: by 2002:a9d:508:: with SMTP id 8mr19943863otw.338.1607954660242;
 Mon, 14 Dec 2020 06:04:20 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm3940146oou.4.2020.12.14.06.04.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:04:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 37/43] accel/tcg: Add mips support to
 alloc_code_gen_buffer_splitwx_memfd
Date: Mon, 14 Dec 2020 08:03:08 -0600
Message-Id: <20201214140314.18544-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214140314.18544-1-richard.henderson@linaro.org>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x344.google.com
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
index 17df6c94fa..b49aaf1026 100644
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


