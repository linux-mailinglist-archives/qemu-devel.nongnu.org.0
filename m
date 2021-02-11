Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6447F318C3A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:40:52 +0100 (CET)
Received: from localhost ([::1]:37424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lACDD-0007DO-D3
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:40:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZC-0008K2-G8
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:32 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:39921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZ6-0008Vx-AJ
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:30 -0500
Received: by mail-wm1-x331.google.com with SMTP id u14so5650328wmq.4
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=kS0wcoQoiBYMcu4/cbxljJngWS6Q8+y8v/3NNJnmd7E=;
 b=fa116oVH6sL8mM94Nxm3AWGyUnqeQvxdHgCDxCJ1qgEU2+r74mRAkw3CROJv7+ryl8
 Wox/pE3C8hfWxeKjDUmlHHZJYkRcGC4cV0LqlGdHGeNxPDzxJDG7/xBzqJrjrIU5rXBa
 4dTApUCw9RcEBwihSrj7IALTFqVtxl8YNh7RtiQIa9pXCZr1DbOPxmk2WUAFWehnbvdR
 OzbCbfvQrmkhnt62I9CjRpVwxe1eWvDJcGTcMeFJ2NNi9NelIUqITprNWe6YNAL46iig
 puuU7K5doP0Iufh1PVvPjvU+ivmTtvb1aekO8wD76REgMmbmV3InE1YcRWyi3BGXBh4O
 HBeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kS0wcoQoiBYMcu4/cbxljJngWS6Q8+y8v/3NNJnmd7E=;
 b=RLH4ekiUQtw9tsmo6CLijNYtvQN/e2V9+NbhiJ/J4N5m2weNDI4UrYveiS/U4XOgBo
 24Sfl3AfPrqjqE+Mx3ajkFZhfePaUN78sM2VXgweaoqNe/Grxy9zlDe66c4b5SJEwt6T
 9ZfhoKTxXnMdHvSLF3UUuSjshsdxF0eSYB1houH5awq5O8BOnC64o32uVciRPoa8K4cB
 37CO3a+E6gbdRgFzcIqFgtqZhveOnnYdbV+w5OFFAflcRayjrOBId/zvfgjV7gB/yX/d
 su4q2EpqUmiRhTie67d8nxXLavNpow04zC3Wyypx+MqUom6l95cmN+McDebnXf/peJG6
 N6YQ==
X-Gm-Message-State: AOAM5302Y70PpDg5aNfF9eod5Fq/idyXijIi1LRrJUncMbn+vIlp8ncK
 aWAu05lJ5LgD0F1AfDgWe163L+lMAz8+vQ==
X-Google-Smtp-Source: ABdhPJzoiezDkEyp4HeIcxGXcKeTnR8mBOnMNK/xAJnQuxlZTPOL+TPH4nUCPODw758OB2i+S8yL6A==
X-Received: by 2002:a1c:720b:: with SMTP id n11mr5180555wmc.154.1613048362541; 
 Thu, 11 Feb 2021 04:59:22 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g15sm4955716wrx.1.2021.02.11.04.59.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:59:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/45] linux-user: Move lock_user et al out of line
Date: Thu, 11 Feb 2021 12:58:41 +0000
Message-Id: <20210211125900.22777-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211125900.22777-1-peter.maydell@linaro.org>
References: <20210211125900.22777-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

These functions are not small, except for unlock_user
without debugging enabled.  Move them out of line, and
add missing braces on the way.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210210000223.884088-18-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/qemu.h    | 45 ++++++-------------------------------------
 linux-user/uaccess.c | 46 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+), 39 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 82eabb73f80..36b58bd840f 100644
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
index e215ecc2a60..bba012ed159 100644
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
2.20.1


