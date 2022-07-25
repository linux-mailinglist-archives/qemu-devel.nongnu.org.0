Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA7357FE04
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 13:03:24 +0200 (CEST)
Received: from localhost ([::1]:36480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFvrv-0000Na-0V
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 07:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oFvpJ-00067x-W4
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 07:00:42 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oFvpI-0008Vl-A4
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 07:00:41 -0400
Received: by mail-wr1-x42e.google.com with SMTP id u5so15425797wrm.4
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 04:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mEQoXa7IYp0GkwsZ9db5gJWuruSBrDHu6zu3PBQmph0=;
 b=zOHorEBOyQTRwZ/lXObi5bIjfsn3BXYFOtRHJIbU/6D4Bs5YafBSEFArISDe4JluhE
 MIY7DrpYPgyKeFZIsGmcD0AFMmH5MI/a3sbkGppm8AQ+PFLNqEefC+Z8zC10rV6H3XHz
 W7Q6I/4UPXKoUMlUg26XKJjNl//scTMt9g5rtp9SueCIE7+BJeK3pRYh7V+/BwGRzgly
 g8t5BVTFTBtqTrEPSeOFj6H4voqqfTXqjobHfAAZMTB2JZIqKtExOHlj45y1jIe/Y8Bk
 2chdrNNI5oguU8WKX0rfIYtmvmx5ueleoFYyx7sEy3QEYgKbvvKdwoo8Ir3A6CF1ppXR
 BAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mEQoXa7IYp0GkwsZ9db5gJWuruSBrDHu6zu3PBQmph0=;
 b=kzJYLb7/ogLAirjC5MXfvwYt1mln7L//Bg1y8liNOpHAgh6MbcRxg6ZWglAGl8e/3Q
 HbIWfz9JY403ehi2jAU7KTFiB2K6W7bDR57tRq5JHp+br0t+ytobC81m7rPUUiR/cOPN
 7grkwTg67kQpFKSkWtzpxdIDTUdk9RM3jWf6P1KMAA7QYjvVrestsI5aIOYcXidxaLfe
 zmstqSlSajVhytPygkPA88XTlLS8sz3mD+2bpL06AG1M9kLoa6/IKMlW8LdhF/b+c2Fm
 oTzyUYePytGgZidUWVhnrPXHwwM98nWh5FnHxYtCbjo16Xz9L/yFJgiljaDODISIBbtD
 Iv8g==
X-Gm-Message-State: AJIora8+A6lVB54cVQo9Wj8zOXcw3tqjRQNlhCFI2K+Kb4sYQqsKG2Cb
 fbu6B8zhx7K4GfO0bIrxF/F5VgUy9Li0hw==
X-Google-Smtp-Source: AGRyM1uUJRCMSF7MUq6SZwhn5qY77bIskKXIsGWHby7WC8GRVbrroJeFUwxzZMSxRCkNLCsRaSzRBA==
X-Received: by 2002:a5d:5112:0:b0:21e:5755:e9ae with SMTP id
 s18-20020a5d5112000000b0021e5755e9aemr7686089wrt.638.1658746837818; 
 Mon, 25 Jul 2022 04:00:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a05600c001200b003a31169a7f4sm17309943wmc.12.2022.07.25.04.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 04:00:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Jon Alduan <jon.alduan@gmail.com>
Subject: [PATCH] linux-user: Don't assume 0 is not a valid host timer_t value
Date: Mon, 25 Jul 2022 12:00:35 +0100
Message-Id: <20220725110035.1273441-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

For handling guest POSIX timers, we currently use an array
g_posix_timers[], whose entries are a host timer_t value, or 0 for
"this slot is unused".  When the guest calls the timer_create syscall
we look through the array for a slot containing 0, and use that for
the new timer.

This scheme assumes that host timer_t values can never be zero.  This
is unfortunately not a valid assumption -- for some host libc
versions, timer_t values are simply indexes starting at 0.  When
using this kind of host libc, the effect is that the first and second
timers end up sharing a slot, and so when the guest tries to operate
on the first timer it changes the second timer instead.

Rework the timer allocation code, so that:
 * the 'slot in use' indication uses a separate array from the
   host timer_t array
 * we grab the free slot atomically, to avoid races when multiple
   threads call timer_create simultaneously
 * releasing an allocated slot is abstracted out into a new
   free_host_timer_slot() function called in the correct places

This fixes:
 * problems on hosts where timer_t 0 is valid
 * the FIXME in next_free_host_timer() about locking
 * bugs in the error paths in timer_create where we forgot to release
   the slot we grabbed, or forgot to free the host timer

Reported-by: Jon Alduan <jon.alduan@gmail.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/syscall.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 991b85e6b4d..b75de1bc8d6 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -497,20 +497,25 @@ _syscall4(int, sys_prlimit64, pid_t, pid, int, resource,
 
 #if defined(TARGET_NR_timer_create)
 /* Maximum of 32 active POSIX timers allowed at any one time. */
-static timer_t g_posix_timers[32] = { 0, } ;
+#define GUEST_TIMER_MAX 32
+static timer_t g_posix_timers[GUEST_TIMER_MAX];
+static int g_posix_timer_allocated[GUEST_TIMER_MAX];
 
 static inline int next_free_host_timer(void)
 {
-    int k ;
-    /* FIXME: Does finding the next free slot require a lock? */
-    for (k = 0; k < ARRAY_SIZE(g_posix_timers); k++) {
-        if (g_posix_timers[k] == 0) {
-            g_posix_timers[k] = (timer_t) 1;
+    int k;
+    for (k = 0; k < ARRAY_SIZE(g_posix_timer_allocated); k++) {
+        if (qatomic_xchg(g_posix_timer_allocated + k, 1) == 0) {
             return k;
         }
     }
     return -1;
 }
+
+static inline void free_host_timer_slot(int id)
+{
+    qatomic_store_release(g_posix_timer_allocated + id, 0);
+}
 #endif
 
 static inline int host_to_target_errno(int host_errno)
@@ -12832,15 +12837,18 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
                 phost_sevp = &host_sevp;
                 ret = target_to_host_sigevent(phost_sevp, arg2);
                 if (ret != 0) {
+                    free_host_timer_slot(timer_index);
                     return ret;
                 }
             }
 
             ret = get_errno(timer_create(clkid, phost_sevp, phtimer));
             if (ret) {
-                phtimer = NULL;
+                free_host_timer_slot(timer_index);
             } else {
                 if (put_user(TIMER_MAGIC | timer_index, arg3, target_timer_t)) {
+                    timer_delete(*phtimer);
+                    free_host_timer_slot(timer_index);
                     return -TARGET_EFAULT;
                 }
             }
@@ -12976,7 +12984,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
         } else {
             timer_t htimer = g_posix_timers[timerid];
             ret = get_errno(timer_delete(htimer));
-            g_posix_timers[timerid] = 0;
+            free_host_timer_slot(timerid);
         }
         return ret;
     }
-- 
2.25.1


