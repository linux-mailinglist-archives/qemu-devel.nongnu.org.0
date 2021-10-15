Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F49642E825
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:55:56 +0200 (CEST)
Received: from localhost ([::1]:45756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbFG7-0006dc-DT
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:55:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEcJ-00070P-T1
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:49 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:45904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEcI-00030d-2S
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:47 -0400
Received: by mail-pf1-x42c.google.com with SMTP id f11so3410927pfc.12
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OxMgM7wzD4BcAcUx2qJmodE4BwJ9QwGNSAt09qoFyFU=;
 b=n2oEhFHE1FfC+NGrQFPyUFWLxN7nZbYmgUcOZZXMymDYfFnaE6FG98C8jxVGAVAb/n
 r1niXz3J9VA8S2nYLT+fA8trxPYESN4A0Un874SfVpqHg7AIKpnoYjMmLENVKLa1qZCw
 Cxa8mXZvQQCBdA7K/SDZkZfsdN6KV+4FjzvLQr0+/Ifg09Sr8fLGI5YQQbemE4ZVlj2u
 2W9/z4NaU+Bl1gXhrsGh4bu0c+fmR2V91e6y3qceyS9vjKeF5v+RHhupR1rWqu6IQ2rC
 WvA5FaNT6zY7+pLWlSEXPAYrq/XPLECr8v/EsnXuVx+VGRa9/rR/qylSHAIGTM81MmMN
 l6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OxMgM7wzD4BcAcUx2qJmodE4BwJ9QwGNSAt09qoFyFU=;
 b=C3g0YuyKDQ+6B7EQ+pO/QmIt4LglhoT7DrivFnUyQUMmSf2BnhvvsZ941BqfE9XC6o
 tUsELF3Cb0lkwMrtkTWzxXuXVfXYvK4178FysZNHYDq3U3tTf6LYyZi6UrQ7rmjpKv3r
 IjUNOQZTQAD4f6c9CuqnlDUsLblUwCll5cNfdtA3M54j1eK8HLE0gOfwElxMr5P6Ddq1
 ESkaI2dPhZ2TXxDz/sGffhprFG4FJUaNVqEQMKk0WTPyNpEdfJJCeh5PBKVEVSWKZiJO
 KHL1o+3jAcLY+K5vAnSj2UE4yG0jo7WLxeZ+ry9UXd/P1raHux65xXcGNEoSCis5Iyxe
 FEag==
X-Gm-Message-State: AOAM531Udum5GvQZTGhQKqGlcvsT27jfJE6sdare3I3GqYkbTZ9KujhK
 +l+EnBwoEw7zXEt5geYr7Bwr4v5K6rfAAw==
X-Google-Smtp-Source: ABdhPJzU5WyYM2wvrxYswB4YVz+8MpfLMk4k83W+vO8WZDLXvJZ3MuKEkp6U2EFWe6MfC5VeKgc2nw==
X-Received: by 2002:a05:6a00:8d0:b0:44c:26e6:1c13 with SMTP id
 s16-20020a056a0008d000b0044c26e61c13mr9506973pfu.28.1634271284454; 
 Thu, 14 Oct 2021 21:14:44 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q8sm10236885pja.52.2021.10.14.21.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:14:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 63/67] linux-user: Disable more prctl subcodes
Date: Thu, 14 Oct 2021 21:10:49 -0700
Message-Id: <20211015041053.2769193-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com
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


