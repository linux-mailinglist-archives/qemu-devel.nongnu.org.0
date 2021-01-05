Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E002EB15B
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:28:37 +0100 (CET)
Received: from localhost ([::1]:54206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwq8K-0004Vl-EW
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:28:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0Y-0002Ob-DO
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:36 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:46614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0T-0006bP-R9
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:33 -0500
Received: by mail-pg1-x52f.google.com with SMTP id c22so251665pgg.13
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 09:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eOIoFRufaJyIw+Oc9PubO7k3MAtBUycjaNlTW//kLYE=;
 b=EdzMGYE8qddmzTjJ2Xhq67S7P48+nbYMWwmBFXkmqfw6/1OjLkEGTIpNXM3nRY4/kj
 KenehbIIHL7tJFyHW3ndyDJTSLDXB4nhXiHjzh3eEuYT/c7ynfqJ1Ljg0KYsnq6WXEwr
 kTCBCP5iMw93T7CIv5JLOXCTbfOUS8FZxe4fwUVRqO7JCsMrKOAhRnmrw2jxMQag6+tH
 t2geJHUS5md/eeHO8ZOJE9SDifcp4fJJ7nCxCB+1Vf4O2j326Dc1PFeAvedcuLvKtxW/
 le2Ri5DQfTMOSBDfhmnNF2lN8vuOGkplnP7e9ETr8XVmQj4Vm1stabARJNz5lENYwjmq
 E4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eOIoFRufaJyIw+Oc9PubO7k3MAtBUycjaNlTW//kLYE=;
 b=bX+/po+mGSwC810AwEYJb2RwEfB2F8SAK1xTH6/i4A+idrr3CaYBwLs/rc8SsTy31r
 uaPykry8vhiFCrZtUlqsgtsNZyHyCKEiKc8YArGjSlnUb31oAdA3gtOKoGNZvE/YWEL7
 SVfeW9FHbah0sUqs1wrZ+UZBx7xXA2m+szMTYIlE/tyGtDZFu1vkmlbi3SCLAbPajAft
 C39sTBPpICNg0E3/GtiLAnwRyE1Dc4BKv+zTU9AOkhgAB7JMfnLW1FGqba8IWQ9RfstV
 A53361FSk+1puHkMmZ+N53KYmehA5axhOyT3k6XbOhr3D3cIigwEDSKwvphRgYJNsmdc
 i3mg==
X-Gm-Message-State: AOAM533WdK+2FdvB48gEcR5qDnX3c1cb5w3fmBT9sUHeiwUJSApDMu06
 W99wqLnP6as/qQ6UYTeeGDpWm32zE15+wA==
X-Google-Smtp-Source: ABdhPJyij8L/hgdc6hqT7/mKJW+SaiLJrWWECNrUh27/4YQufcyUE24NpXV7kaBzjtPUeQK5fNzGaQ==
X-Received: by 2002:aa7:96d8:0:b029:19e:bc79:cf7 with SMTP id
 h24-20020aa796d80000b029019ebc790cf7mr237418pfq.22.1609867227705; 
 Tue, 05 Jan 2021 09:20:27 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id u12sm2010pfh.98.2021.01.05.09.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:20:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 18/43] accel/tcg: Support split-wx for linux with memfd
Date: Tue,  5 Jan 2021 07:19:25 -1000
Message-Id: <20210105171950.415486-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105171950.415486-1-richard.henderson@linaro.org>
References: <20210105171950.415486-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

We cannot use a real temp file, because we would need to find
a filesystem that does not have noexec enabled.  However, a
memfd is not associated with any filesystem.

Reviewed-by: Joelle van Dyne <j@getutm.app>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 84 +++++++++++++++++++++++++++++++++++----
 1 file changed, 76 insertions(+), 8 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 0c1801b034..27c88527ea 100644
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


