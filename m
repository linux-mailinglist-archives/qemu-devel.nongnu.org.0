Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 549E931A51B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 20:13:43 +0100 (CET)
Received: from localhost ([::1]:33342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAdss-0005Uo-A6
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 14:13:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVX-0001mL-6G
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:35 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:36329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVO-0007ps-Nu
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:34 -0500
Received: by mail-pl1-x630.google.com with SMTP id e9so327683plh.3
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 10:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ch6p0n2lq/t8EpS2QR/TzUItBZtqRgmNxCQ2fBsn7Kg=;
 b=J8Vy1Pgq6mnzhXkriN8kz+WDoUwbEzT7beUh165ZlTLDQOaHvibR/UpTRW4j1W0fXy
 oovTTuaj7I/8RLq8NBgUXNCxiJKeMWRgTtR0PYJC0G39DIjrC0daVkCdkCMSDVdk5F1U
 WWfncKdivSqLcYoB3v8gR6rDtE609JKMvHIDZYj+iUNnXx/SVwCawZTETBDOBTY92RpK
 A7/jiNkF3HdZJJeARD0DHpsJzVIIyFleOdJpQ/et2CteR9TCzS2EnZSF0GvTz66J82tB
 rhKT+SrLgx8cXlpaweeW82xYtxrmd4OTKLqZk+XNCCslwd4MQmPX9u0ZU+9zUe9DVlL9
 jXPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ch6p0n2lq/t8EpS2QR/TzUItBZtqRgmNxCQ2fBsn7Kg=;
 b=rA3g7Lwnv/8HescpXSGYac8GN1rW7URIr6zE/ag+/+e7oBBu3U1Ub8ztLtNXk0A88z
 iOHuT0By4xLDwEuyQNR0AtKgkkNcw993w43ZkB8iODLR5Vt6gD/K7zqzH7GqFD+hueKn
 BzalgoQFsQ0r8hZUGg68QpQrWiwRM8R8OTY2itW7ndwcebRhD2qDr3zoRBiM0ewIxBvy
 Wd0wCmzOY2UuehLf5nxZPSCWhH21eo7ye+SKPzMPXscjJj68znYGCvc6whL8qKu8uKfU
 mZ4z6UHgfGfJs0V8Z3D7b4eg3LxC2+2tUmwYrWnRAla06KFt04VeKPFAIbdCp+FgoJW1
 ToOQ==
X-Gm-Message-State: AOAM532P6FWgXASSGOnXdOQTeLA742d4qPE7exsBAoY+FEtRDS0zDcET
 cD2eRpmPGBQsZCYtNkXt+57AGGkZ5YPjDQ==
X-Google-Smtp-Source: ABdhPJzlEfY8ZQwzS3cfQq6xLjKfDbKgy3PeUvmrxu9rtf+os5j2U6exH/HyWAfXtUuedzSAOUa7Dg==
X-Received: by 2002:a17:90b:a58:: with SMTP id
 gw24mr3963764pjb.143.1613155765248; 
 Fri, 12 Feb 2021 10:49:25 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id k5sm9427618pfi.31.2021.02.12.10.49.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 10:49:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 17/31] linux-user: Move lock_user et al out of line
Date: Fri, 12 Feb 2021 10:48:48 -0800
Message-Id: <20210212184902.1251044-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210212184902.1251044-1-richard.henderson@linaro.org>
References: <20210212184902.1251044-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

These functions are not small, except for unlock_user
without debugging enabled.  Move them out of line, and
add missing braces on the way.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/qemu.h    | 45 ++++++-------------------------------------
 linux-user/uaccess.c | 46 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+), 39 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 82eabb73f8..36b58bd840 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -640,57 +640,24 @@ abi_long copy_to_user(abi_ulong gaddr, void *hptr, size_t len);
 
 /* Lock an area of guest memory into the host.  If copy is true then the
    host area will have the same contents as the guest.  */
-static inline void *lock_user(int type, abi_ulong guest_addr, long len, int copy)
-{
-    if (!access_ok_untagged(type, guest_addr, len)) {
-        return NULL;
-    }
-#ifdef DEBUG_REMAP
-    {
-        void *addr;
-        addr = g_malloc(len);
-        if (copy)
-            memcpy(addr, g2h(guest_addr), len);
-        else
-            memset(addr, 0, len);
-        return addr;
-    }
-#else
-    return g2h_untagged(guest_addr);
-#endif
-}
+void *lock_user(int type, abi_ulong guest_addr, long len, int copy);
 
 /* Unlock an area of guest memory.  The first LEN bytes must be
    flushed back to guest memory. host_ptr = NULL is explicitly
    allowed and does nothing. */
-static inline void unlock_user(void *host_ptr, abi_ulong guest_addr,
-                               long len)
-{
-
 #ifdef DEBUG_REMAP
-    if (!host_ptr)
-        return;
-    if (host_ptr == g2h_untagged(guest_addr))
-        return;
-    if (len > 0)
-        memcpy(g2h_untagged(guest_addr), host_ptr, len);
-    g_free(host_ptr);
+static inline void unlock_user(void *host_ptr, abi_ulong guest_addr, long len)
+{ }
+#else
+void unlock_user(void *host_ptr, abi_ulong guest_addr, long len);
 #endif
-}
 
 /* Return the length of a string in target memory or -TARGET_EFAULT if
    access error. */
 abi_long target_strlen(abi_ulong gaddr);
 
 /* Like lock_user but for null terminated strings.  */
-static inline void *lock_user_string(abi_ulong guest_addr)
-{
-    abi_long len;
-    len = target_strlen(guest_addr);
-    if (len < 0)
-        return NULL;
-    return lock_user(VERIFY_READ, guest_addr, (long)(len + 1), 1);
-}
+void *lock_user_string(abi_ulong guest_addr);
 
 /* Helper macros for locking/unlocking a target struct.  */
 #define lock_user_struct(type, host_ptr, guest_addr, copy)	\
diff --git a/linux-user/uaccess.c b/linux-user/uaccess.c
index e215ecc2a6..bba012ed15 100644
--- a/linux-user/uaccess.c
+++ b/linux-user/uaccess.c
@@ -4,6 +4,52 @@
 
 #include "qemu.h"
 
+void *lock_user(int type, abi_ulong guest_addr, long len, int copy)
+{
+    if (!access_ok_untagged(type, guest_addr, len)) {
+        return NULL;
+    }
+#ifdef DEBUG_REMAP
+    {
+        void *addr;
+        addr = g_malloc(len);
+        if (copy) {
+            memcpy(addr, g2h(guest_addr), len);
+        } else {
+            memset(addr, 0, len);
+        }
+        return addr;
+    }
+#else
+    return g2h_untagged(guest_addr);
+#endif
+}
+
+#ifdef DEBUG_REMAP
+void unlock_user(void *host_ptr, abi_ulong guest_addr, long len);
+{
+    if (!host_ptr) {
+        return;
+    }
+    if (host_ptr == g2h_untagged(guest_addr)) {
+        return;
+    }
+    if (len > 0) {
+        memcpy(g2h_untagged(guest_addr), host_ptr, len);
+    }
+    g_free(host_ptr);
+}
+#endif
+
+void *lock_user_string(abi_ulong guest_addr)
+{
+    abi_long len = target_strlen(guest_addr);
+    if (len < 0) {
+        return NULL;
+    }
+    return lock_user(VERIFY_READ, guest_addr, (long)(len + 1), 1);
+}
+
 /* copy_from_user() and copy_to_user() are usually used to copy data
  * buffers between the target and host.  These internally perform
  * locking/unlocking of the memory.
-- 
2.25.1


