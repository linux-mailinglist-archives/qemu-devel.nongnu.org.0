Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D340B31CE36
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 17:39:37 +0100 (CET)
Received: from localhost ([::1]:52494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC3Nw-00061e-SS
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 11:39:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32v-0008Ht-Im
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:53 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:39893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32J-0002RR-Aa
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:53 -0500
Received: by mail-wm1-x32d.google.com with SMTP id v62so5490617wmg.4
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 08:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=5JWfwKowe7rah/3Vj4T/sMmaK9HUgrKB3BjWRcVxMcw=;
 b=DuB8HQfSsz7qSwT47EVWeBnojAgzlhbJ3VEAY5sg6Xc3moqp5XC64DgHI38O2tsqQF
 OcY3GBAuBeabkBQBL9kW5yhjz1ZMGElDw22yTyE0WwDyEeDG3kJNUJ4njVoHTG7gRWhj
 ijVMCicQUGbn29M8nJKMJJPIc1/Fvk3Hm2AgUpUkAEJqKiWYRNg7kI/YpGQrME41h7xi
 vxXDt7E6Zf4KwoZgcL6nHj46K8I4aDRL+FzHH+pmICNP0wmKFZt1sqcLuL5UpActWRjM
 0gDGSubPdBzkcV5/HGoUbVyEO5FoVaR+yhwWAIHyEBofL56XTD/nJyQF3FqJMVk/fsKZ
 dcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5JWfwKowe7rah/3Vj4T/sMmaK9HUgrKB3BjWRcVxMcw=;
 b=UM4SZnbHNxy3wVa0TYNF2pvIWdXv95OGyJtAm9TxqWWCUyJr8ARSrS6qpl7TARnHbo
 QU4vTrb2wEbfNAeQwR7K0Yk62rIFb5QecFmz4AY35cDv0biBOQm5SZv5H2AijOeP0MG8
 tZ0t8TBITzhvjuN1rTaR6foR1c4x96AT17luTisWrB8U0kGkk1X+yIVAabu5I46QDU/6
 hPLHPEFhZVJbakhZ2H+5ePSIPjJ4J3N1k76ipWwUfBw3ODigaTN8bXxKa7PUE24KcR41
 ENpD02frjRQTqbFwTAIrn8X6Yc+MEh2QTGxeiwSh1HxFY6XaAf+JJMbnPEPEO+MmixVX
 purQ==
X-Gm-Message-State: AOAM532uw4a4fUyvohEAa/zWOLnJlwaWfSkgZUbVTsqgS5MpDIIK1sBk
 c/LCqQfcFrluOT8CG5+UYK9fxzoofUGIVg==
X-Google-Smtp-Source: ABdhPJy3fMoc4pwlQQwblOIeb1KLL2i9C19+Yeuz1C6oSZNmU5tYYnBkabMKj2GrWNiu1J/TxCAkjg==
X-Received: by 2002:a1c:6387:: with SMTP id x129mr3934170wmb.84.1613492233458; 
 Tue, 16 Feb 2021 08:17:13 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d5sm30630482wrb.14.2021.02.16.08.17.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 08:17:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/40] linux-user: Fix types in uaccess.c
Date: Tue, 16 Feb 2021 16:16:36 +0000
Message-Id: <20210216161658.29881-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210216161658.29881-1-peter.maydell@linaro.org>
References: <20210216161658.29881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210212184902.1251044-19-richard.henderson@linaro.org
[PMM: moved fix for ifdef error to previous commit]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/qemu.h    | 12 +++++-------
 linux-user/uaccess.c | 45 ++++++++++++++++++++++----------------------
 2 files changed, 28 insertions(+), 29 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 971af97a2fb..d25a5dafc0f 100644
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
 #ifndef DEBUG_REMAP
-static inline void unlock_user(void *host_ptr, abi_ulong guest_addr, long len)
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


