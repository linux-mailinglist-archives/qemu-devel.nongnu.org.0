Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3188C31A549
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 20:23:55 +0100 (CET)
Received: from localhost ([::1]:54162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAe2k-0001bH-7t
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 14:23:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVY-0001oF-Fz
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:36 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:39053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVT-0007q9-FT
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:36 -0500
Received: by mail-pg1-x531.google.com with SMTP id o63so245561pgo.6
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 10:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rmu2PU4rJNhYRjC32Fq6chUgbDJkHTIm3xnv7XFmDE4=;
 b=zSJXWIQaXGfP5Qck+HSWS4lMOHNwAZ8McYIMM+fNo2TxDMxKSY3h2ILRjmNZ/snR//
 9MQaGCLCnUDjnyrXBbHzKetHnDZFCgXRgZ1ibXtt3uvEAPTi5YIZVkZMtLQLYEThke7T
 Oo+2aGIRzuv+UgHaSxwN+h/mQC0iKkd8fWRd1vB9LEa2h8kn5ItPGcp3HsZZMCrRv6AW
 iknUvVztbI1ADXbyz+IK15/fOo7wIU0OUv44bimQVUJM5TUJ1fOm6ZojQLgzWxHoKAzr
 gcKnfU4kT6Qk304kkWG8QCDV0I+vfQ3r6bDXUJ3m+5hwuYdHVcjP+CaaqIpqFjm53ttk
 E0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rmu2PU4rJNhYRjC32Fq6chUgbDJkHTIm3xnv7XFmDE4=;
 b=qqhV5lYwVQ5tL6hLNkjV7zo/bJrp9hn11eViWBqEDJ/hhWVfOFBNAZ54TH8IYgDLkh
 buOOBq6VYITmvxg7no6m1TpZZz/NMkjmNLMWNcox5Il1nyR+Xp5oSfGoDpCZC5JfgCXS
 46XwnvcgHRquQW6G2TKeLi2Bnzx5UxAv5PNEuLJ7FaZkrEpzgSGdysH6bfCklCwmjfEO
 tIA8MqWF+fQIWpsAUocbAoFEeiGvgQsqiJfXWrBlYZYmLjp0IP4WV1hmtf702o/VBIea
 eY/C2OLPGaATrnwSrcAfyx4SOT9/2xFNmqV/h114N03IC3Ux7T30A2AltThjjSbB69bu
 lAFA==
X-Gm-Message-State: AOAM531ntm1KGrRSxpHbwQy/x8O7i0TVrPNzIduTP7WkbDMrl773uMs/
 H5OdMCKT/hTly/I2SsXrGNuNH9IOOj917g==
X-Google-Smtp-Source: ABdhPJwNwarMlzdSu85LqRcI0cCgUHFOktbKuViYUnoRBheHRvQgzeID5AjM+S9zGDKt9/H4EoBWNQ==
X-Received: by 2002:a62:fb0b:0:b029:1d8:fdca:60f2 with SMTP id
 x11-20020a62fb0b0000b02901d8fdca60f2mr4039312pfm.70.1613155766234; 
 Fri, 12 Feb 2021 10:49:26 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id k5sm9427618pfi.31.2021.02.12.10.49.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 10:49:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 18/31] linux-user: Fix types in uaccess.c
Date: Fri, 12 Feb 2021 10:48:49 -0800
Message-Id: <20210212184902.1251044-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210212184902.1251044-1-richard.henderson@linaro.org>
References: <20210212184902.1251044-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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


