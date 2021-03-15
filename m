Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDED933C7E2
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 21:41:54 +0100 (CET)
Received: from localhost ([::1]:51652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLu2D-0003Nm-Mo
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 16:41:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLu0Y-0002eV-NT
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 16:40:10 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:45929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLu0V-000218-QX
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 16:40:10 -0400
Received: by mail-qk1-x729.google.com with SMTP id m186so16465484qke.12
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 13:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0HNRdXOLI0iSRy67gqzQq2Zt89PPHYP+0Szsh23enG4=;
 b=DIeWgFsEJOr6LZp4zgWd5DQfb4Z9wDWilcBdKeBEx/IFJSajP+ZmIJvrnlFEBGsQGM
 mGk/fqBtMW5yh/wGbcE+K6BENA1JuL7wjjyhyrvGF4CZT7yxS9XlhrAQym32DXIc7Z6h
 BxNKw7001ycG27rvPP/gshAZNkixjogdbOZFukf18mg0qoKXgU1lWHWMfNgPOTzFl6Tw
 RvygGEXdIBHHY4pbZ43ZVdGRTodnFeACu6PcR8mvcvNij1bv7r54CANq5aVdgUupwfo0
 NHlO2Y8U2qDL1ulAu5EK5NSfibJDBe712ZyNrevLvy63cfOF7OMY77IKfwX6jDQVVzRX
 DR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0HNRdXOLI0iSRy67gqzQq2Zt89PPHYP+0Szsh23enG4=;
 b=BFSIlnnuN1GnTcy+eXAZbqoLPkIZ5u/ZNSwgCtKs6ln91aONzF0G5jVG74ELQXlgXh
 05CraO061mUFC0S/m6UPTfKeE90Nxs3/ipSOEsr7yqQuuHkHgp3mljgAU9PJwSbFDy+V
 7JmRJhI/4lzLOyYwbgGEvHhGjSapHki+t3xbTRkDBdg0w4XRqbRK2vVihFao/yNyCK1y
 wpJ4JfGRUFQAIlMChyzaymQk/rOpJqlisG0bhVfPdWfLuAwRlSKQ/AEfCqQiPWCUZ901
 p9Vv5xYfcaH1s8BF83XxN+DwsphvFcAl+OnTjbwhfOAgyc4784H+yMirhdaOThUALOF0
 hkUw==
X-Gm-Message-State: AOAM532hEFtnzFof+kV2mMRQxVJYUi2iweVonGvPbnB76QUNVZ9Hdk0f
 8w7XvsEx5JSbvLku+choTFCSZLjzkNmYUUaP
X-Google-Smtp-Source: ABdhPJxAIJV4CAcgq3vRx/PEIGWlr0i1dOyeRT4BYhKEln2OwSOozAm3JHrU6sdIg1ZeqIjNf1n1ig==
X-Received: by 2002:a37:44e:: with SMTP id 75mr26398851qke.150.1615840806336; 
 Mon, 15 Mar 2021 13:40:06 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id g74sm13495472qke.3.2021.03.15.13.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 13:40:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user: Use signed lengths in uaccess.c
Date: Mon, 15 Mar 2021 14:40:04 -0600
Message-Id: <20210315204004.2025219-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x729.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Partially revert 09f679b62dff, but only for the length arguments.
Instead of reverting to long, use ssize_t.  Reinstate the > 0 check
in unlock_user.

Fixes: 09f679b62dff
Reported-by: Coverity (CID 1446711)
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/qemu.h    | 15 +++++++++------
 linux-user/uaccess.c | 12 ++++++------
 2 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 52c981710b..74e06e7121 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -627,8 +627,8 @@ static inline bool access_ok(CPUState *cpu, int type,
  * buffers between the target and host.  These internally perform
  * locking/unlocking of the memory.
  */
-int copy_from_user(void *hptr, abi_ulong gaddr, size_t len);
-int copy_to_user(abi_ulong gaddr, void *hptr, size_t len);
+int copy_from_user(void *hptr, abi_ulong gaddr, ssize_t len);
+int copy_to_user(abi_ulong gaddr, void *hptr, ssize_t len);
 
 /* Functions for accessing guest memory.  The tget and tput functions
    read/write single values, byteswapping as necessary.  The lock_user function
@@ -638,16 +638,19 @@ int copy_to_user(abi_ulong gaddr, void *hptr, size_t len);
 
 /* Lock an area of guest memory into the host.  If copy is true then the
    host area will have the same contents as the guest.  */
-void *lock_user(int type, abi_ulong guest_addr, size_t len, bool copy);
+void *lock_user(int type, abi_ulong guest_addr, ssize_t len, bool copy);
 
 /* Unlock an area of guest memory.  The first LEN bytes must be
    flushed back to guest memory. host_ptr = NULL is explicitly
    allowed and does nothing. */
 #ifndef DEBUG_REMAP
-static inline void unlock_user(void *host_ptr, abi_ulong guest_addr, size_t len)
-{ }
+static inline void unlock_user(void *host_ptr, abi_ulong guest_addr,
+                               ssize_t len)
+{
+    /* no-op */
+}
 #else
-void unlock_user(void *host_ptr, abi_ulong guest_addr, long len);
+void unlock_user(void *host_ptr, abi_ulong guest_addr, ssize_t len);
 #endif
 
 /* Return the length of a string in target memory or -TARGET_EFAULT if
diff --git a/linux-user/uaccess.c b/linux-user/uaccess.c
index c696913016..82b833b8f1 100644
--- a/linux-user/uaccess.c
+++ b/linux-user/uaccess.c
@@ -4,7 +4,7 @@
 
 #include "qemu.h"
 
-void *lock_user(int type, abi_ulong guest_addr, size_t len, bool copy)
+void *lock_user(int type, abi_ulong guest_addr, ssize_t len, bool copy)
 {
     void *host_addr;
 
@@ -24,7 +24,7 @@ void *lock_user(int type, abi_ulong guest_addr, size_t len, bool copy)
 }
 
 #ifdef DEBUG_REMAP
-void unlock_user(void *host_ptr, abi_ulong guest_addr, size_t len);
+void unlock_user(void *host_ptr, abi_ulong guest_addr, ssize_t len);
 {
     void *host_ptr_conv;
 
@@ -35,7 +35,7 @@ void unlock_user(void *host_ptr, abi_ulong guest_addr, size_t len);
     if (host_ptr == host_ptr_conv) {
         return;
     }
-    if (len != 0) {
+    if (len > 0) {
         memcpy(host_ptr_conv, host_ptr, len);
     }
     g_free(host_ptr);
@@ -48,14 +48,14 @@ void *lock_user_string(abi_ulong guest_addr)
     if (len < 0) {
         return NULL;
     }
-    return lock_user(VERIFY_READ, guest_addr, (size_t)len + 1, 1);
+    return lock_user(VERIFY_READ, guest_addr, len + 1, 1);
 }
 
 /* copy_from_user() and copy_to_user() are usually used to copy data
  * buffers between the target and host.  These internally perform
  * locking/unlocking of the memory.
  */
-int copy_from_user(void *hptr, abi_ulong gaddr, size_t len)
+int copy_from_user(void *hptr, abi_ulong gaddr, ssize_t len)
 {
     int ret = 0;
     void *ghptr = lock_user(VERIFY_READ, gaddr, len, 1);
@@ -69,7 +69,7 @@ int copy_from_user(void *hptr, abi_ulong gaddr, size_t len)
     return ret;
 }
 
-int copy_to_user(abi_ulong gaddr, void *hptr, size_t len)
+int copy_to_user(abi_ulong gaddr, void *hptr, ssize_t len)
 {
     int ret = 0;
     void *ghptr = lock_user(VERIFY_WRITE, gaddr, len, 0);
-- 
2.25.1


