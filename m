Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5D33F0BEC
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:40:32 +0200 (CEST)
Received: from localhost ([::1]:45586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRQN-0003Ht-Ph
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:40:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR9o-00075s-Mx
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:24 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:54059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR9n-0002iy-5r
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:24 -0400
Received: by mail-pj1-x1033.google.com with SMTP id j1so3287100pjv.3
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=f2K4PGLb2oKqgETEBS112ablWl1xVg86v5mEsLdMH5A=;
 b=PugB75/Ty5GruABAsQJwikeP6pZ22I/PyAnMJaOHTz6IfVAY1PPl5K7iInSRIuA1Jz
 O1+uivuTZgld/z8CgZrhYR1403wChBH2P7U2Ogs3vbLQq9RCyVKcbXeEO5PLylTVKHZw
 8p4ASisucrKVA1OKXALVtRAQORdt99JGdP53tm3v+2EdeWs7x2ZoO5fe4MBZN0aA043a
 H/BBXLM1RyWsgRnK7RHCtGgq2bZY7PiQxfYWChcBx8HotJdR7RYXhjSbX5TpK3nZGUZ5
 SZYlMZMAv4dXHHEjE6wfmoW7pdrA8FfXX4ZO1zGVCBkdpTwEUnVXa3pPLui0jBf88Y75
 ECtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f2K4PGLb2oKqgETEBS112ablWl1xVg86v5mEsLdMH5A=;
 b=WBOO++X4Qv1KHjzvnenmjebSuXX+TDyCUFv6Zve+mKQKGwcVo6Rtl0rz69cEiU6ksb
 c+acSqJ4IzYTvhfI+aiX8iCdO+OztxnYSCAXMXuYXepb4Qej8X3TYPV9r9Jldqr5tr0I
 3Au28r9GiwaKpmZFKXuLZ1LycKjqRwBW4dfGoDFleS3l3jNEygG+ckN8MBuU5oBA05ew
 Viw8AxcaWhiRb37rH545wKn+bVeFzKW8wh+d1fja0aGoLLzBCmUaADPQ0y8VprapenPf
 4EBLXkRlBFC9iqzSkbQSxawO8LM3q4bW7dLaphGMzry/xwF+KcpLZSnIhoMI1HG2Haew
 ykOw==
X-Gm-Message-State: AOAM53101hPJgjsFogaPFtZqyCuBa+bwGl9LuqLikAc+ov2S/hzCOOaj
 80LtuKTJ0BE7lK2/aydK9YdcEn84YIXReA==
X-Google-Smtp-Source: ABdhPJzOQbRxLCG6A6c0cUw53YowG6pLd4Nb2SIcqYZ82uW7/sI5ZEjY5h2MNtz52oUEImtaqIlyUA==
X-Received: by 2002:a17:90a:ff94:: with SMTP id
 hf20mr10718491pjb.64.1629314601846; 
 Wed, 18 Aug 2021 12:23:21 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id w82sm569302pff.112.2021.08.18.12.23.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:23:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 47/66] linux-user: Disable more prctl subcodes
Date: Wed, 18 Aug 2021 09:19:01 -1000
Message-Id: <20210818191920.390759-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

Create a list of subcodes that we want to pass on, a list of
subcodes that should not be passed on because they would affect
the running qemu itself, and a list that probably could be
implemented but require extra work. Do not pass on unknown subcodes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall.c | 56 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 52 insertions(+), 4 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 6e630745fa..e303a9da7f 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6325,6 +6325,13 @@ abi_long do_arch_prctl(CPUX86State *env, int code, abi_ulong addr)
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
 
 static abi_long do_prctl_get_fp_mode(CPUArchState *env)
 {
@@ -6632,13 +6639,54 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
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


