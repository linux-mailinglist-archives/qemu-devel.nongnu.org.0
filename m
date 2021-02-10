Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F286315AE1
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 01:20:44 +0100 (CET)
Received: from localhost ([::1]:53468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9dFL-0003Y9-53
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 19:20:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cyQ-0003sZ-OR
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:03:15 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:34693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cy1-00084d-C9
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:03:14 -0500
Received: by mail-pl1-x632.google.com with SMTP id u15so223881plf.1
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 16:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rmu2PU4rJNhYRjC32Fq6chUgbDJkHTIm3xnv7XFmDE4=;
 b=tXKI7lQ4CjlSKoJDr5mBsnNU3+httqOAqdKxIah51QgHEKd40SWouHNTzMdApXc4e5
 lwLxY3z+ztn7o4Ai99CxGeUBtf6Z+ymYIG6GThgl0ec3gQH+SgvHf8JfS4KcHypjCH4D
 B9MkFCUDhSuxxb8Kv3r6Ge1CDBlfG+1TjGLUf8PpatoFoXQHuuH6+350rNQQ/znyTOJD
 HVBiiJqjFg22Lm3BbrFJKFqXZepVa8ka4luFBO8+AO+/eP4o4iFGpztHCX7NJE+sYcJ9
 Kna/wFwgdaQmZ8INkAwCMY58HtKRt0BZbvz4hzSgHuxVLSPri9hRubbyPZl68SkafjWK
 fXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rmu2PU4rJNhYRjC32Fq6chUgbDJkHTIm3xnv7XFmDE4=;
 b=ApDcd0aI48oQ82sd3kBzgmCMxUcj7s1hZ4o3GeDvSS+Em4JHgpKAhjtcQYQB7CBu6N
 zJi6R80oSfuthcM0b9NIGjq9iYrgAU6btp9cTOMa1xCIyVKU2pdsifVYIlGvY2nM3ouh
 spnATwIJ6dBJr6uC9OCk55u7JZwfwlReuJuzQqTqpEJsYJph4zqRb+Lmc2z5h0OS++m3
 qLxUVw+41lCBNuX0u2maZbVemG6MEnxDNmvjS8/IeyOAdK/9ruxxUERmseixibWMWe6Q
 dEy6oxb9AQTIZ+rZ5lOoUmWrOfGBDrQGlVmk79yRLFKbkWcM1+anjy0GOlgoRSbUsCZJ
 HGyQ==
X-Gm-Message-State: AOAM530RBfaIciJUwC70PWDRXl9VTM201I6SAUUTP87Uw/cTEoB5dNQw
 SthYK4tEG78XtXJrbQPXVba9Ie3V8QnboA==
X-Google-Smtp-Source: ABdhPJyMrtrc+WLwLS08thJ0YIbGd45u4JAXmSCZkmjcZh1A67pDFjGvLDs5oQv1IGwskZdZs2cR+Q==
X-Received: by 2002:a17:90a:184:: with SMTP id 4mr359713pjc.87.1612915367493; 
 Tue, 09 Feb 2021 16:02:47 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id me3sm164189pjb.32.2021.02.09.16.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 16:02:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 18/31] linux-user: Fix types in uaccess.c
Date: Tue,  9 Feb 2021 16:02:10 -0800
Message-Id: <20210210000223.884088-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210000223.884088-1-richard.henderson@linaro.org>
References: <20210210000223.884088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

For copy_*_user, only 0 and -TARGET_EFAULT are returned; no need
to involve abi_long.  Use size_t for lengths.  Use bool for the
lock_user copy argument.  Use ssize_t for target_strlen, because
we can't overflow the host memory space.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/qemu.h    | 14 ++++++--------
 linux-user/uaccess.c | 45 ++++++++++++++++++++++----------------------
 2 files changed, 29 insertions(+), 30 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 36b58bd840..d25a5dafc0 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -7,8 +7,6 @@
 #include "exec/cpu_ldst.h"
 
 #undef DEBUG_REMAP
-#ifdef DEBUG_REMAP
-#endif /* DEBUG_REMAP */
 
 #include "exec/user/abitypes.h"
 
@@ -629,8 +627,8 @@ static inline bool access_ok(CPUState *cpu, int type,
  * buffers between the target and host.  These internally perform
  * locking/unlocking of the memory.
  */
-abi_long copy_from_user(void *hptr, abi_ulong gaddr, size_t len);
-abi_long copy_to_user(abi_ulong gaddr, void *hptr, size_t len);
+int copy_from_user(void *hptr, abi_ulong gaddr, size_t len);
+int copy_to_user(abi_ulong gaddr, void *hptr, size_t len);
 
 /* Functions for accessing guest memory.  The tget and tput functions
    read/write single values, byteswapping as necessary.  The lock_user function
@@ -640,13 +638,13 @@ abi_long copy_to_user(abi_ulong gaddr, void *hptr, size_t len);
 
 /* Lock an area of guest memory into the host.  If copy is true then the
    host area will have the same contents as the guest.  */
-void *lock_user(int type, abi_ulong guest_addr, long len, int copy);
+void *lock_user(int type, abi_ulong guest_addr, size_t len, bool copy);
 
 /* Unlock an area of guest memory.  The first LEN bytes must be
    flushed back to guest memory. host_ptr = NULL is explicitly
    allowed and does nothing. */
-#ifdef DEBUG_REMAP
-static inline void unlock_user(void *host_ptr, abi_ulong guest_addr, long len)
+#ifndef DEBUG_REMAP
+static inline void unlock_user(void *host_ptr, abi_ulong guest_addr, size_t len)
 { }
 #else
 void unlock_user(void *host_ptr, abi_ulong guest_addr, long len);
@@ -654,7 +652,7 @@ void unlock_user(void *host_ptr, abi_ulong guest_addr, long len);
 
 /* Return the length of a string in target memory or -TARGET_EFAULT if
    access error. */
-abi_long target_strlen(abi_ulong gaddr);
+ssize_t target_strlen(abi_ulong gaddr);
 
 /* Like lock_user but for null terminated strings.  */
 void *lock_user_string(abi_ulong guest_addr);
diff --git a/linux-user/uaccess.c b/linux-user/uaccess.c
index bba012ed15..76af6a92b1 100644
--- a/linux-user/uaccess.c
+++ b/linux-user/uaccess.c
@@ -4,7 +4,7 @@
 
 #include "qemu.h"
 
-void *lock_user(int type, abi_ulong guest_addr, long len, int copy)
+void *lock_user(int type, abi_ulong guest_addr, size_t len, bool copy)
 {
     if (!access_ok_untagged(type, guest_addr, len)) {
         return NULL;
@@ -26,7 +26,7 @@ void *lock_user(int type, abi_ulong guest_addr, long len, int copy)
 }
 
 #ifdef DEBUG_REMAP
-void unlock_user(void *host_ptr, abi_ulong guest_addr, long len);
+void unlock_user(void *host_ptr, abi_ulong guest_addr, size_t len);
 {
     if (!host_ptr) {
         return;
@@ -34,7 +34,7 @@ void unlock_user(void *host_ptr, abi_ulong guest_addr, long len);
     if (host_ptr == g2h_untagged(guest_addr)) {
         return;
     }
-    if (len > 0) {
+    if (len != 0) {
         memcpy(g2h_untagged(guest_addr), host_ptr, len);
     }
     g_free(host_ptr);
@@ -43,53 +43,53 @@ void unlock_user(void *host_ptr, abi_ulong guest_addr, long len);
 
 void *lock_user_string(abi_ulong guest_addr)
 {
-    abi_long len = target_strlen(guest_addr);
+    ssize_t len = target_strlen(guest_addr);
     if (len < 0) {
         return NULL;
     }
-    return lock_user(VERIFY_READ, guest_addr, (long)(len + 1), 1);
+    return lock_user(VERIFY_READ, guest_addr, (size_t)len + 1, 1);
 }
 
 /* copy_from_user() and copy_to_user() are usually used to copy data
  * buffers between the target and host.  These internally perform
  * locking/unlocking of the memory.
  */
-abi_long copy_from_user(void *hptr, abi_ulong gaddr, size_t len)
+int copy_from_user(void *hptr, abi_ulong gaddr, size_t len)
 {
-    abi_long ret = 0;
-    void *ghptr;
+    int ret = 0;
+    void *ghptr = lock_user(VERIFY_READ, gaddr, len, 1);
 
-    if ((ghptr = lock_user(VERIFY_READ, gaddr, len, 1))) {
+    if (ghptr) {
         memcpy(hptr, ghptr, len);
         unlock_user(ghptr, gaddr, 0);
-    } else
+    } else {
         ret = -TARGET_EFAULT;
-
+    }
     return ret;
 }
 
-
-abi_long copy_to_user(abi_ulong gaddr, void *hptr, size_t len)
+int copy_to_user(abi_ulong gaddr, void *hptr, size_t len)
 {
-    abi_long ret = 0;
-    void *ghptr;
+    int ret = 0;
+    void *ghptr = lock_user(VERIFY_WRITE, gaddr, len, 0);
 
-    if ((ghptr = lock_user(VERIFY_WRITE, gaddr, len, 0))) {
+    if (ghptr) {
         memcpy(ghptr, hptr, len);
         unlock_user(ghptr, gaddr, len);
-    } else
+    } else {
         ret = -TARGET_EFAULT;
+    }
 
     return ret;
 }
 
 /* Return the length of a string in target memory or -TARGET_EFAULT if
    access error  */
-abi_long target_strlen(abi_ulong guest_addr1)
+ssize_t target_strlen(abi_ulong guest_addr1)
 {
     uint8_t *ptr;
     abi_ulong guest_addr;
-    int max_len, len;
+    size_t max_len, len;
 
     guest_addr = guest_addr1;
     for(;;) {
@@ -101,11 +101,12 @@ abi_long target_strlen(abi_ulong guest_addr1)
         unlock_user(ptr, guest_addr, 0);
         guest_addr += len;
         /* we don't allow wrapping or integer overflow */
-        if (guest_addr == 0 || 
-            (guest_addr - guest_addr1) > 0x7fffffff)
+        if (guest_addr == 0 || (guest_addr - guest_addr1) > 0x7fffffff) {
             return -TARGET_EFAULT;
-        if (len != max_len)
+        }
+        if (len != max_len) {
             break;
+        }
     }
     return guest_addr - guest_addr1;
 }
-- 
2.25.1


