Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFF7359F92
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 15:11:43 +0200 (CEST)
Received: from localhost ([::1]:49264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUqvG-0008Dr-Or
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 09:11:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lUqtK-00077f-Mt
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 09:09:44 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:39045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lUqtI-0002TX-DP
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 09:09:42 -0400
Received: from localhost.localdomain ([82.142.18.94]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Ma1D8-1l16hn0huu-00Vu27; Fri, 09 Apr 2021 15:09:35 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/1] linux-user: Use signed lengths in uaccess.c
Date: Fri,  9 Apr 2021 15:09:31 +0200
Message-Id: <20210409130931.382887-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210409130931.382887-1-laurent@vivier.eu>
References: <20210409130931.382887-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:14RCEMsWGYmT6btiYmyHUgJHs6icoawS3iuqva5Z1kDFgIjcAwu
 GDnnw0g4lgczb55EjKdjo5S+Gq9xwI+MvBToGD/avZy00T+ip14/Fr6DVWwU2g9nux6p/kr
 CrKOlBn6/ShVaZi0+7moF5TOEbgrl1T2cAZ8EqVf3vcOYDCnXspRvCRSWnubT5PHwIu6fFx
 8rtSIsoeeH/wrXtseZ6Uw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YFLv/vX0vbs=:9stfelHvIrT9CJQuCozAke
 hh3Kfnk2f+XuN9Nv5wHIkl+rCUM3psc6TXvo8y+4fQjzJbYWRwTChqQE0vh75dLd66HeQ4Rxw
 kC9p5sNEtS9CZzt7IFMp2kM/51CwbI2fzxpeQgXgzNQA8VKGevix5avstecHlfUKHUXb31VYB
 8gIhH/kokVA60GOdUrypsq+C1Lk6EFMfGopDfIklDFS97U5EOBGfHe22OUV9H4gZDSbi5KH0g
 J+0ZPtuGeRz34VjnG5WSPqtJfSjgzN1Fhnv/EjYkNebhGRupaLcRL4YALzPjuzMdHzU0Ym6EB
 u4XfS0Nv47kbd0Fqg1myyKQDoYnwn2MyJYbi3Z/VW8sBd3dV1c0y7Jt8JhaeGeF0Ymq2R2e4L
 +fJZ5vXM7QgToZjclXgUQAncuVM8HkKRTgj/BspPbFHCHIW8ix+YWwlH9dNsh6v0/6VYQuVyp
 dV0LEzXu6/oltxmaHcqDJhBZQT5AtV/UFfTuLD3Gm0B3zzUeu9mI
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Partially revert 09f679b62dff, but only for the length arguments.
Instead of reverting to long, use ssize_t.  Reinstate the > 0 check
in unlock_user.

Fixes: 09f679b62dff
Reported-by: Coverity (CID 1446711)
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210315204004.2025219-1-richard.henderson@linaro.org>
[lv: remove superfluous semicolon]
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/qemu.h    | 15 +++++++++------
 linux-user/uaccess.c | 12 ++++++------
 2 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 52c981710b4c..74e06e7121c5 100644
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
index c69691301637..6a5b029607c6 100644
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
+void unlock_user(void *host_ptr, abi_ulong guest_addr, ssize_t len)
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
2.30.2


