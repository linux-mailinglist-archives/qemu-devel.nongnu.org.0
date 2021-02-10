Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FA4315AD9
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 01:17:02 +0100 (CET)
Received: from localhost ([::1]:46054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9dBl-0007wK-EQ
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 19:17:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cyQ-0003rM-5P
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:03:14 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:35571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cxz-00083l-Fn
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:03:11 -0500
Received: by mail-pl1-x62f.google.com with SMTP id g3so219910plp.2
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 16:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ch6p0n2lq/t8EpS2QR/TzUItBZtqRgmNxCQ2fBsn7Kg=;
 b=Su1UPiD00wQK4FQpCKw+m1T7Z2CFC/0uZFs7LzOAxca/JS+qJm6BDhxPCkiXMG+zhp
 3GVUAhRKbRpqjyvhGjNJrx8dkvY9wOKezdCPF/K4JHuHzkMxEF9+vWvPWyo/iJVCCf8j
 OfQDZSWRnI1KKJBH1wqtSsNjzKeXf5BGIyEgpPbktW2V4IyCsF8zxxfZLbc4L0+vO17F
 a2vZog8MZFiNrNP3aNZILr6RlQKReCug7Ic/ydfh+3WYFo/UzA8Z9a31IY3/AQgWNiW5
 eV5FnE8GIDw6bGHGTDkIPJgT+hOCtMK8aPIl8M162/dE/GC1gmHD4g1q02QDbfJHJzdO
 A08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ch6p0n2lq/t8EpS2QR/TzUItBZtqRgmNxCQ2fBsn7Kg=;
 b=RcAMswBqs07EG10d9hwlaxQ1XmoUsixKbBDc1PR6UY5BV/UWaA3URp22898NHw6yYQ
 /22cS+Wu/vSVDvWSoiAUf/K4iuJ5uQ3UdEnV6NsNZT+TBb4h3I1dhzP2uzKcbaFkIl2R
 ks5TylXTCFWtNRF/dzt1noJcnZ8WaFBKZPz8qrb0xiQT/t1Zk49AVTd/NBJwOxGbY/pO
 U0zYxUh7TttLqM1Tt5z1JXn85D7/XYCTXwITOxxcroacGFSnqHA8KQjAdWbFwtcZV/Uq
 hLG8iShkfB5JpaoBsnr+cCJFSL7KbX34g2YpRXENyItZ/qhDKxNrP5VYYubdO4QTXEtI
 pn8g==
X-Gm-Message-State: AOAM532aTbXMwkS3rB1f3KcFsKoXr7EF4d6oXPWAFcNf0ZSH8JZk6yjd
 KgZwW4Pyae5yLugAQjj7f0rm7P1QYMUG+A==
X-Google-Smtp-Source: ABdhPJzn5rLukdJz3mJDXHoj36YCX4VhkuCrnIF1SOBqdOzyNpO8DpWcLn1DS6l9h68mt5LkuW12OA==
X-Received: by 2002:a17:902:8602:b029:e2:8386:7aed with SMTP id
 f2-20020a1709028602b02900e283867aedmr495801plo.36.1612915366207; 
 Tue, 09 Feb 2021 16:02:46 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id me3sm164189pjb.32.2021.02.09.16.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 16:02:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 17/31] linux-user: Move lock_user et al out of line
Date: Tue,  9 Feb 2021 16:02:09 -0800
Message-Id: <20210210000223.884088-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210000223.884088-1-richard.henderson@linaro.org>
References: <20210210000223.884088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


