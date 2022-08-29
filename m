Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B425A40F9
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 04:13:20 +0200 (CEST)
Received: from localhost ([::1]:38840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSUH8-0000OJ-LR
	for lists+qemu-devel@lfdr.de; Sun, 28 Aug 2022 22:13:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oSUEA-0003Rh-F8
 for qemu-devel@nongnu.org; Sun, 28 Aug 2022 22:10:14 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:34653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oSUE8-0001bC-MV
 for qemu-devel@nongnu.org; Sun, 28 Aug 2022 22:10:14 -0400
Received: by mail-pl1-x629.google.com with SMTP id f24so3857462plr.1
 for <qemu-devel@nongnu.org>; Sun, 28 Aug 2022 19:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=MtNh2w+4V2y5mwzf678UGVcQqp1eS0dpxGcLnKcxRPA=;
 b=ykxb3D+jBicZuCoKrxF2tf0nUUnJpeuYoCdvWAQpGUaIMA8p1FGZRNVlb85I6jEct5
 1zPi3NHjRJvn+wkIuZ9Zz0msqzvSwVRIS3Cn1yk+bMCFSILCLptBzIH7Bk2/zjl2bxFX
 MEIbbiZyVYzvD6Ugzx+8Wiuj8GuaMlJyDFWew4CI2FrGPogtPr6JwcMF1ZEgvrpFHsS8
 CHnlQ00mS8CZ9EgIbVi9RgsWBe40HdEKHR0zePW+UJ8KGa3484f1rS+wmJG9/vddev6V
 WIEPi+HLRs4H6SSFcKxqCGJUYK5djIv5srYGyCsOgVqIs2MXu4kmDhsLht6b4425tTJ2
 fEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=MtNh2w+4V2y5mwzf678UGVcQqp1eS0dpxGcLnKcxRPA=;
 b=CrL1zWnDuZV1rm4JFSb8E0QnL7TYkBrlHCihFI9NIKdcR5N9SGu7vnYAJxU/EEKvng
 0IGJYTQvY01gxkkyeyf55lWWG9ao3BXiZOxYtGU+Y1Eyw2COLf1WFcUpWzf2Gai4DznI
 zOTXlK0f0yESFELBMVPFNB9UHGDEcxy+7E1cHEO3TdLEY2gM7bRqhU5fzTxVluaoXJwc
 DJlthei06x36bq5kamXe8clRpn9RO2F5hcGc0sEUX4EeAQTDAnRrB2h2nnUC/PfSJHQ7
 Z/m7d1rOwJbeIs8vq9aA8B+23PmU2zlkcprpcchRKbYIwmvjFXtQ9O7+bSdI0RZiWCgX
 Nolw==
X-Gm-Message-State: ACgBeo0oy9RS3iacjKJKWkBeSmdLQz0OX/jwSmG3XNTwsMMrBMRUFgC5
 c7FguzEi1UL5DNI7+6e3itcbZ/HVoIHPNQ==
X-Google-Smtp-Source: AA6agR7c2Z2wNMXzI33uLb4+1nNBBGUwgeqI0ROnFkilsfDcTFlRnRAtjQBvHjsubZH9NV4s+68cKg==
X-Received: by 2002:a17:90b:1c8e:b0:1f7:524f:bfcc with SMTP id
 oo14-20020a17090b1c8e00b001f7524fbfccmr16186305pjb.132.1661739011064; 
 Sun, 28 Aug 2022 19:10:11 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:2fa6:2ab5:a96e:2a35])
 by smtp.gmail.com with ESMTPSA id
 ik30-20020a170902ab1e00b0016bdc98730bsm6035139plb.151.2022.08.28.19.10.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Aug 2022 19:10:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH 2/8] linux-user: Sink call to do_safe_futex
Date: Sun, 28 Aug 2022 19:10:00 -0700
Message-Id: <20220829021006.67305-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220829021006.67305-1-richard.henderson@linaro.org>
References: <20220829021006.67305-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

Leave only the argument adjustments within the shift,
and sink the actual syscall to the end.  Sink the
timespec conversion as well, as there will be more users.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall.c | 60 +++++++++++++++++++++++---------------------
 1 file changed, 31 insertions(+), 29 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index a7e66d8d28..8fbd5a9556 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -7758,11 +7758,11 @@ static int do_futex(CPUState *cpu, bool time64, target_ulong uaddr,
                     int op, int val, target_ulong timeout,
                     target_ulong uaddr2, int val3)
 {
-    struct timespec ts, *pts;
+    struct timespec ts, *pts = NULL;
+    void *haddr2 = NULL;
     int base_op;
 
-    /* ??? We assume FUTEX_* constants are the same on both host
-       and target.  */
+    /* We assume FUTEX_* constants are the same on both host and target. */
 #ifdef FUTEX_CMD_MASK
     base_op = op & FUTEX_CMD_MASK;
 #else
@@ -7771,39 +7771,41 @@ static int do_futex(CPUState *cpu, bool time64, target_ulong uaddr,
     switch (base_op) {
     case FUTEX_WAIT:
     case FUTEX_WAIT_BITSET:
-        if (timeout) {
-            pts = &ts;
-            if (time64
-                ? target_to_host_timespec64(pts, timeout)
-                : target_to_host_timespec(pts, timeout)) {
-                return -TARGET_EFAULT;
-            }
-        } else {
-            pts = NULL;
-        }
-        return do_safe_futex(g2h(cpu, uaddr),
-                             op, tswap32(val), pts, NULL, val3);
+        val = tswap32(val);
+        break;
     case FUTEX_WAKE:
-        return do_safe_futex(g2h(cpu, uaddr),
-                             op, val, NULL, NULL, 0);
+        timeout = 0;
+        break;
     case FUTEX_FD:
-        return do_safe_futex(g2h(cpu, uaddr),
-                             op, val, NULL, NULL, 0);
-    case FUTEX_REQUEUE:
+        timeout = 0;
+        break;
     case FUTEX_CMP_REQUEUE:
+        val3 = tswap32(val3);
+        /* fall through */
+    case FUTEX_REQUEUE:
     case FUTEX_WAKE_OP:
-        /* For FUTEX_REQUEUE, FUTEX_CMP_REQUEUE, and FUTEX_WAKE_OP, the
-           TIMEOUT parameter is interpreted as a uint32_t by the kernel.
-           But the prototype takes a `struct timespec *'; insert casts
-           to satisfy the compiler.  We do not need to tswap TIMEOUT
-           since it's not compared to guest memory.  */
-        pts = (struct timespec *)(uintptr_t) timeout;
-        return do_safe_futex(g2h(cpu, uaddr), op, val, pts, g2h(cpu, uaddr2),
-                             (base_op == FUTEX_CMP_REQUEUE
-                              ? tswap32(val3) : val3));
+        /*
+         * For these, the 4th argument is not TIMEOUT, but VAL2.
+         * But the prototype of do_safe_futex takes a pointer, so
+         * insert casts to satisfy the compiler.  We do not need
+         * to tswap VAL2 since it's not compared to guest memory.
+          */
+        pts = (struct timespec *)(uintptr_t)timeout;
+        timeout = 0;
+        haddr2 = g2h(cpu, uaddr2);
+        break;
     default:
         return -TARGET_ENOSYS;
     }
+    if (timeout) {
+        pts = &ts;
+        if (time64
+            ? target_to_host_timespec64(pts, timeout)
+            : target_to_host_timespec(pts, timeout)) {
+            return -TARGET_EFAULT;
+        }
+    }
+    return do_safe_futex(g2h(cpu, uaddr), op, val, pts, haddr2, val3);
 }
 #endif
 
-- 
2.34.1


