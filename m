Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7548D5A4103
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 04:16:55 +0200 (CEST)
Received: from localhost ([::1]:33560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSUKc-0005Ar-HH
	for lists+qemu-devel@lfdr.de; Sun, 28 Aug 2022 22:16:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oSUE9-0003RX-Cv
 for qemu-devel@nongnu.org; Sun, 28 Aug 2022 22:10:13 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:45737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oSUE7-0001b7-Hf
 for qemu-devel@nongnu.org; Sun, 28 Aug 2022 22:10:13 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 h13-20020a17090a648d00b001fdb9003787so1852775pjj.4
 for <qemu-devel@nongnu.org>; Sun, 28 Aug 2022 19:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=0RVm116KJVpIo1WmvyYIGakdNu7H4Sz7hO6ZwQRM5+8=;
 b=Nzz2cicTkHlT/rQiuUBxpgG+TWlPsWFWRUvWuzsJZyjAzlnG2wJ1uPT5I0h/VOB/gH
 z5sCvKp+4X9M8EndyKvvmYdUBk+ptY8AmiS2HLuVD3gIzjDNJiKskKPKiavIZpqvMq8h
 o/SNK7Y8Brq6p0Wxywg/+Vfiiwfq4naKxSfg71qP86LCY4itP/iIZGOHfOzncePWKb3B
 AIKrYzd2ZQGhAeSLwIEcv2OHiHIgdckrV5b/jZL7n28BVBCEYJ+j4q8tEp91iblCaPGY
 pZFCgfSStUcTy4w+iH8hNgzxPpcC8aBYV+K6oJgknHinw8143khjY/ONUFLYoGcNgP4P
 67Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=0RVm116KJVpIo1WmvyYIGakdNu7H4Sz7hO6ZwQRM5+8=;
 b=ScPuMU6mP22WsL/cYHsijvW1ASLwC1mBUl+ck52F9BkzUsLUZt6ztdhjebnz9DUqwb
 VOBedHWtOslJZTEddaTOKlJYpsGXMxlgpWTk+5WB2/xdHkp4kNotyYouV0jZVeNvR88p
 M55HBwn1E4/PlNYPNilEekB7/BBB8YTqKVbo06e+rzHBbAGedYRIL31gDsF+TONiovrX
 q0GbPdctMP/KjMsdTJj6VFDHHNTeV3Z66+a3ephDyF3je6rfdrX4rnFTBP1TY/zqfQWJ
 me6LGz1NDmABOLGcCCo76TnB6q4hyyq7bzpt+KPeuSYhqarQkL/LLeoN267ZcVg//4PZ
 j5OA==
X-Gm-Message-State: ACgBeo0qPKcysjmcpkbQyelsOgXIEranuzKQdSWBsebh60JJ2UIe1XlQ
 zsSIiA96ohNlZ5WsPdE9/yWR5mFhb9Alqw==
X-Google-Smtp-Source: AA6agR7A5ARwCfOdHAlp4sRpq+wrK3vAooJBy1NKNr4Q9WpVRPO5mO7t4l/6K8i0+OBAGa28lO2aQg==
X-Received: by 2002:a17:902:dac8:b0:174:cf17:6e87 with SMTP id
 q8-20020a170902dac800b00174cf176e87mr2324253plx.129.1661739010031; 
 Sun, 28 Aug 2022 19:10:10 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:2fa6:2ab5:a96e:2a35])
 by smtp.gmail.com with ESMTPSA id
 ik30-20020a170902ab1e00b0016bdc98730bsm6035139plb.151.2022.08.28.19.10.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Aug 2022 19:10:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH 1/8] linux-user: Combine do_futex and do_futex_time64
Date: Sun, 28 Aug 2022 19:09:59 -0700
Message-Id: <20220829021006.67305-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220829021006.67305-1-richard.henderson@linaro.org>
References: <20220829021006.67305-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

Pass a boolean to select between time32 and time64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall.c | 67 ++++++++------------------------------------
 1 file changed, 11 insertions(+), 56 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index f409121202..a7e66d8d28 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -7753,9 +7753,10 @@ static int do_safe_futex(int *uaddr, int op, int val,
    futexes locally would make futexes shared between multiple processes
    tricky.  However they're probably useless because guest atomic
    operations won't work either.  */
-#if defined(TARGET_NR_futex)
-static int do_futex(CPUState *cpu, target_ulong uaddr, int op, int val,
-                    target_ulong timeout, target_ulong uaddr2, int val3)
+#if defined(TARGET_NR_futex) || defined(TARGET_NR_futex_time64)
+static int do_futex(CPUState *cpu, bool time64, target_ulong uaddr,
+                    int op, int val, target_ulong timeout,
+                    target_ulong uaddr2, int val3)
 {
     struct timespec ts, *pts;
     int base_op;
@@ -7772,7 +7773,11 @@ static int do_futex(CPUState *cpu, target_ulong uaddr, int op, int val,
     case FUTEX_WAIT_BITSET:
         if (timeout) {
             pts = &ts;
-            target_to_host_timespec(pts, timeout);
+            if (time64
+                ? target_to_host_timespec64(pts, timeout)
+                : target_to_host_timespec(pts, timeout)) {
+                return -TARGET_EFAULT;
+            }
         } else {
             pts = NULL;
         }
@@ -7802,56 +7807,6 @@ static int do_futex(CPUState *cpu, target_ulong uaddr, int op, int val,
 }
 #endif
 
-#if defined(TARGET_NR_futex_time64)
-static int do_futex_time64(CPUState *cpu, target_ulong uaddr, int op,
-                           int val, target_ulong timeout,
-                           target_ulong uaddr2, int val3)
-{
-    struct timespec ts, *pts;
-    int base_op;
-
-    /* ??? We assume FUTEX_* constants are the same on both host
-       and target.  */
-#ifdef FUTEX_CMD_MASK
-    base_op = op & FUTEX_CMD_MASK;
-#else
-    base_op = op;
-#endif
-    switch (base_op) {
-    case FUTEX_WAIT:
-    case FUTEX_WAIT_BITSET:
-        if (timeout) {
-            pts = &ts;
-            if (target_to_host_timespec64(pts, timeout)) {
-                return -TARGET_EFAULT;
-            }
-        } else {
-            pts = NULL;
-        }
-        return do_safe_futex(g2h(cpu, uaddr), op,
-                             tswap32(val), pts, NULL, val3);
-    case FUTEX_WAKE:
-        return do_safe_futex(g2h(cpu, uaddr), op, val, NULL, NULL, 0);
-    case FUTEX_FD:
-        return do_safe_futex(g2h(cpu, uaddr), op, val, NULL, NULL, 0);
-    case FUTEX_REQUEUE:
-    case FUTEX_CMP_REQUEUE:
-    case FUTEX_WAKE_OP:
-        /* For FUTEX_REQUEUE, FUTEX_CMP_REQUEUE, and FUTEX_WAKE_OP, the
-           TIMEOUT parameter is interpreted as a uint32_t by the kernel.
-           But the prototype takes a `struct timespec *'; insert casts
-           to satisfy the compiler.  We do not need to tswap TIMEOUT
-           since it's not compared to guest memory.  */
-        pts = (struct timespec *)(uintptr_t) timeout;
-        return do_safe_futex(g2h(cpu, uaddr), op, val, pts, g2h(cpu, uaddr2),
-                             (base_op == FUTEX_CMP_REQUEUE
-                              ? tswap32(val3) : val3));
-    default:
-        return -TARGET_ENOSYS;
-    }
-}
-#endif
-
 #if defined(TARGET_NR_name_to_handle_at) && defined(CONFIG_OPEN_BY_HANDLE)
 static abi_long do_name_to_handle_at(abi_long dirfd, abi_long pathname,
                                      abi_long handle, abi_long mount_id,
@@ -12318,11 +12273,11 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
 #endif
 #ifdef TARGET_NR_futex
     case TARGET_NR_futex:
-        return do_futex(cpu, arg1, arg2, arg3, arg4, arg5, arg6);
+        return do_futex(cpu, false, arg1, arg2, arg3, arg4, arg5, arg6);
 #endif
 #ifdef TARGET_NR_futex_time64
     case TARGET_NR_futex_time64:
-        return do_futex_time64(cpu, arg1, arg2, arg3, arg4, arg5, arg6);
+        return do_futex(cpu, true, arg1, arg2, arg3, arg4, arg5, arg6);
 #endif
 #ifdef CONFIG_INOTIFY
 #if defined(TARGET_NR_inotify_init)
-- 
2.34.1


