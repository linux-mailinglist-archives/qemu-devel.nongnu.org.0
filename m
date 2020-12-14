Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA2F2D99A1
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:19:38 +0100 (CET)
Received: from localhost ([::1]:59956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koohN-0003wy-LC
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:19:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooS9-0001oG-Lz
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:03:53 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:36395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooS5-0003x8-Vq
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:03:53 -0500
Received: by mail-ot1-x342.google.com with SMTP id y24so15768326otk.3
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QxiqvQ209wXHxoJuZyW/ayX9Rmszqy3dKezpaxev5Pc=;
 b=q+eUyja2nllJDD6BeT4HYX1+kVRwBFT1LDi0GAvRYWrYlZ+P/AELr+2iXTzQuv6W9X
 vd2mxuAB1vz3din0cQIPEYn475V9Fw0R7wa2oow1mcIOQkqLgvdOzxexSpCTNvur+0q+
 L7tkKzpRyciu4+uQfLedQ7E6qhAAqKZhloN10omU7HIs+jEIUrl9Go4Njs/D2BQVEP9G
 XqWOBgXNZFvr2QXeNRfiUW/uXQu3ECBS/yE9pvBubWhGMU5iRqI0ZR6lvd4JNZ97wHbE
 Dv/Mtqk4swhkOFOGjp+vf9TyqmCEM3QfviwtxxjTxOWEC5iHGVrLmfvGfNRC6QwRVa3U
 cTRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QxiqvQ209wXHxoJuZyW/ayX9Rmszqy3dKezpaxev5Pc=;
 b=UMJ0f9qSoJ1B66uDaZaX/62Le1q7qJ3mGM+vh4733C1J8Jygv+MqSNL6UhwOqWtKTO
 U4RooKunlM4q9zYmS8SQaeTQdpzpiDKP4kqQbnH2H37YZAc8IIOc23RtnsyUMZCxGdxS
 DuoqD3XVV05jjJshDJXE2uxa66Nxl9+y+FbhlFSE4DnedNfEEtO9sT/8YGh/ouXVHwXv
 prR9Ib5UA63jG4/qUmXSN8l3vKtNoC1/D5jzjKslwzHQMmUTCwzOeUzYLVZWc/kkSwNG
 BNdYkMWrrED3qPr5NGYKYPhXtFOX8YCwsT3wS0gsm/xVqAVJmvGYL1zqAGNxjALonf/A
 5mcA==
X-Gm-Message-State: AOAM532uoDu34kSfUl9BBbp17zdwaMVNnotVoYlvnhNsSMt0tkiodzLb
 9I11wBNY5JjS4OEDQB7QEx2L6E3yRfz+y1Z6
X-Google-Smtp-Source: ABdhPJw7RdT4uSEwnj3dvnV6Wd5w5RhBa7ik6iCKU8kqgvp5n5S+IBQCF/mX/QGOnT1VvMRCC1XKIw==
X-Received: by 2002:a9d:6414:: with SMTP id h20mr19425547otl.28.1607954628088; 
 Mon, 14 Dec 2020 06:03:48 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm3940146oou.4.2020.12.14.06.03.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:03:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 18/43] accel/tcg: Support split-wx for linux with memfd
Date: Mon, 14 Dec 2020 08:02:49 -0600
Message-Id: <20201214140314.18544-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214140314.18544-1-richard.henderson@linaro.org>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x342.google.com
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

We cannot use a real temp file, because we would need to find
a filesystem that does not have noexec enabled.  However, a
memfd is not associated with any filesystem.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 84 +++++++++++++++++++++++++++++++++++----
 1 file changed, 76 insertions(+), 8 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index a29cb4a42e..1931e65365 100644
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


