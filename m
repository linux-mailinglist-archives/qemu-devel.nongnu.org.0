Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBAA440B50
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 20:39:41 +0200 (CEST)
Received: from localhost ([::1]:34338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgtGW-00068g-Dm
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 14:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs21-0001gI-Le
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:37 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:38680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1z-0002JM-3F
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:37 -0400
Received: by mail-pf1-x432.google.com with SMTP id l1so5883533pfu.5
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OxMgM7wzD4BcAcUx2qJmodE4BwJ9QwGNSAt09qoFyFU=;
 b=mDBOvEjWkGkgjoMtShmnNxJDU4RQJedFJFxPCOu0ivToaxhErXKlx0cAQWkRnR8wMw
 TY6phnyTr7hpmscfJCzpMzruO+e2rN8Lkj7yYf3QnoFX8hME1IjjiJK5NkCts8QVqmN1
 U+wL/l3pBgZpIZ1T6BAFnFjpHpojWtd0Euqkrga2GiUpBVb++F5cltsaXw1HQBnbQO6z
 VbfDKEOgIfOjm0yzVxQxYI40X5/5c5MdTgDd16C64CD32o+fIeqji8KqzH+cn5ZJhYGa
 EQOImi69+nL+lujFceyJ7SBxWmgMZWAKz5b3i1y+beHwmKo5mg/mRqcccHDLYT2ctBkI
 xu3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OxMgM7wzD4BcAcUx2qJmodE4BwJ9QwGNSAt09qoFyFU=;
 b=f/Oe9Q4QyN3WodPvccM9qxk12rlBkKZZxI1OO0bBG0xWSLn/NRX6Ar66NeCz2sFTnR
 MvF8/gMp+mePfw45gdbO8vgbIUjQk91f/QXO7mgRyiVVVW4jVZKrOCzwrAIeQPbutZhG
 B5qgvqnn9gB86w4GScrHtlW4LF6gXKJHutwuOMXvksj3acCRim6/uceSsF56eX5Mr44c
 PhHuz6h+KiK+uoOlLzjvrxLbKH9lJ73LpwZW1FWlJFelEbWh8SoId2Dm5EwrWDV7I+6u
 Pixy+CjRvwwOso4ErzT6yWqZ6R1tD5C1TRD6Q2AySY/AeqQfM1pz3JYH0RUqG2V+YE3r
 ycTg==
X-Gm-Message-State: AOAM532I8lukv/TVIiu3eYQ5rQIDunCafX5CBf5EGUss0cDuBd2ZveED
 pQqWzMAU7C5zpdNZlDDn4z38fK9Q3BngpQ==
X-Google-Smtp-Source: ABdhPJwWDKaaVloWakpwFSsNM3F5yCh46iUSeSRknyCWkZg5DRZnZKxf49Pra5oeCTuf1UIK0WOxMg==
X-Received: by 2002:a63:7c0d:: with SMTP id x13mr13782375pgc.410.1635614433462; 
 Sat, 30 Oct 2021 10:20:33 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k14sm9584798pji.45.2021.10.30.10.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:20:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 62/66] linux-user: Disable more prctl subcodes
Date: Sat, 30 Oct 2021 10:16:31 -0700
Message-Id: <20211030171635.1689530-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create a list of subcodes that we want to pass on, a list of
subcodes that should not be passed on because they would affect
the running qemu itself, and a list that probably could be
implemented but require extra work. Do not pass on unknown subcodes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall.c | 56 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 52 insertions(+), 4 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index a417396981..7635c2397a 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6334,6 +6334,13 @@ abi_long do_arch_prctl(CPUX86State *env, int code, abi_ulong addr)
 # define PR_MTE_TAG_SHIFT       3
 # define PR_MTE_TAG_MASK        (0xffffUL << PR_MTE_TAG_SHIFT)
 #endif
+#ifndef PR_SET_IO_FLUSHER
+# define PR_SET_IO_FLUSHER 57
+# define PR_GET_IO_FLUSHER 58
+#endif
+#ifndef PR_SET_SYSCALL_USER_DISPATCH
+# define PR_SET_SYSCALL_USER_DISPATCH 59
+#endif
 
 #include "target_prctl.h"
 
@@ -6430,13 +6437,54 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
             return -TARGET_EINVAL;
         }
         return do_prctl_get_tagged_addr_ctrl(env);
+
+    case PR_GET_DUMPABLE:
+    case PR_SET_DUMPABLE:
+    case PR_GET_KEEPCAPS:
+    case PR_SET_KEEPCAPS:
+    case PR_GET_TIMING:
+    case PR_SET_TIMING:
+    case PR_GET_TIMERSLACK:
+    case PR_SET_TIMERSLACK:
+    case PR_MCE_KILL:
+    case PR_MCE_KILL_GET:
+    case PR_GET_NO_NEW_PRIVS:
+    case PR_SET_NO_NEW_PRIVS:
+    case PR_GET_IO_FLUSHER:
+    case PR_SET_IO_FLUSHER:
+        /* Some prctl options have no pointer arguments and we can pass on. */
+        return get_errno(prctl(option, arg2, arg3, arg4, arg5));
+
+    case PR_GET_CHILD_SUBREAPER:
+    case PR_SET_CHILD_SUBREAPER:
+    case PR_GET_SPECULATION_CTRL:
+    case PR_SET_SPECULATION_CTRL:
+    case PR_GET_TID_ADDRESS:
+        /* TODO */
+        return -TARGET_EINVAL;
+
+    case PR_GET_FPEXC:
+    case PR_SET_FPEXC:
+        /* Was used for SPE on PowerPC. */
+        return -TARGET_EINVAL;
+
+    case PR_GET_ENDIAN:
+    case PR_SET_ENDIAN:
+    case PR_GET_FPEMU:
+    case PR_SET_FPEMU:
+    case PR_SET_MM:
     case PR_GET_SECCOMP:
     case PR_SET_SECCOMP:
-        /* Disable seccomp to prevent the target disabling syscalls we need. */
-        return -TARGET_EINVAL;
+    case PR_SET_SYSCALL_USER_DISPATCH:
+    case PR_GET_THP_DISABLE:
+    case PR_SET_THP_DISABLE:
+    case PR_GET_TSC:
+    case PR_SET_TSC:
+    case PR_GET_UNALIGN:
+    case PR_SET_UNALIGN:
     default:
-        /* Most prctl options have no pointer arguments */
-        return get_errno(prctl(option, arg2, arg3, arg4, arg5));
+        /* Disable to prevent the target disabling stuff we need. */
+        return -TARGET_EINVAL;
     }
 }
 
-- 
2.25.1


