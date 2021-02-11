Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5C3318C1B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:35:58 +0100 (CET)
Received: from localhost ([::1]:49788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAC8N-0008W2-1M
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:35:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZG-0008L8-6s
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:35 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:34189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZ8-00004t-9g
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:33 -0500
Received: by mail-wm1-x32f.google.com with SMTP id o10so5932301wmc.1
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=u7gQJdYfeB2TD4ECturIjPYtiu4xSyaQm8fEdsXqpVI=;
 b=WeV9fQflPVrwParK0E94Nf7FuHgOA3FB8Zme+PcF6ujHDVQbqcv5/yeOB+2YIur+gJ
 symK+GN7HtrkGB3VfKGvZqKMIXyzkamfA06D9B0wD5erHXKIqu4RiPiETAjUkJPjN9+m
 dlgmnqJF3Rc+tR+wa6TpVkBqD4FJ1refMH1jaDLJFeEFpiRh8Fr5IRTSVBun3t4jHL5r
 HC6mlhQ3Dthqno/IEr+sEKyQ9et/J7aGjAR1WerLw3jjuMNqwMAxGWz4o7k5V8fTbxBo
 V0Ikc0zeiHI3ALenFKn61T7NSLKs7WOGadJ4XR7Eemt7JJK+B/i/8ljEsSv6eJJNMASO
 3Y3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u7gQJdYfeB2TD4ECturIjPYtiu4xSyaQm8fEdsXqpVI=;
 b=CnU4Wro1AbFDzmZ79+/Fzf2J1NfgMLZNgndWQW9Xe8ZnSDAGb4W9639Pu8kqlQq68U
 LfP16Mw84z2VZX+BnOZh8j0EDAL8iinjO0HcVb6OptZIO7/An/npj5XjyFbwPl0M9Prq
 r9Ehe2aQ9Xhj9MLTaBScsV7tPkOx2DlE6c45u9ahv0pxIcMxI8NjYwaCArlUghrkS4I/
 Q2tr+VDvtYO4eO/TjQkF02T5dHzic81h4NzkOZXgU0F/De0GEzNtNoLVF9ZtjNVYYmH3
 0HKOUcnINgshmvNq3X76DdfvFkw9JLnE6TZqNQy25PFKQZvkdzswfpgIjV5SoJBWxX1c
 eRpQ==
X-Gm-Message-State: AOAM533EtXpCW3VyFe+7aHGV3dDAt+F6zCAAHyCKR9pbrpnKc9lvbDoI
 Jjzzuk7HEfS9/z3EENVUmLJ5nAwfQwo7MQ==
X-Google-Smtp-Source: ABdhPJzwG39nNvn7B6xQUvMEoQCXxHHymIkZLdNbDfCXlgHAf9nJOohs4wJOEgmuO2551TlqTkQPkA==
X-Received: by 2002:a7b:c95a:: with SMTP id i26mr5014145wml.164.1613048363284; 
 Thu, 11 Feb 2021 04:59:23 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g15sm4955716wrx.1.2021.02.11.04.59.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:59:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/45] linux-user: Fix types in uaccess.c
Date: Thu, 11 Feb 2021 12:58:42 +0000
Message-Id: <20210211125900.22777-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211125900.22777-1-peter.maydell@linaro.org>
References: <20210211125900.22777-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

For copy_*_user, only 0 and -TARGET_EFAULT are returned; no need
to involve abi_long.  Use size_t for lengths.  Use bool for the
lock_user copy argument.  Use ssize_t for target_strlen, because
we can't overflow the host memory space.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210210000223.884088-19-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/qemu.h    | 14 ++++++--------
 linux-user/uaccess.c | 45 ++++++++++++++++++++++----------------------
 2 files changed, 29 insertions(+), 30 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 36b58bd840f..d25a5dafc0f 100644
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
index bba012ed159..76af6a92b11 100644
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
2.20.1


