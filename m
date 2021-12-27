Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C19CF47FE16
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Dec 2021 16:06:50 +0100 (CET)
Received: from localhost ([::1]:60364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1raL-0003RR-TM
	for lists+qemu-devel@lfdr.de; Mon, 27 Dec 2021 10:06:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n1rVF-0005fl-Ob
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 10:01:33 -0500
Received: from [2607:f8b0:4864:20::62b] (port=46713
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n1rVD-0000k2-Lt
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 10:01:33 -0500
Received: by mail-pl1-x62b.google.com with SMTP id w7so11015797plp.13
 for <qemu-devel@nongnu.org>; Mon, 27 Dec 2021 07:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=izV3rTj1g1h7Dgy2QwGrzIGLl+XIrmq7G80zvPDCcv0=;
 b=hbbLs0DvXH4z/3amFST6Tp9ZinE+VriP1x06WuQlRkTsdSEu4qS2uUTJKN0tnMTJ4+
 zUU+qo9Cp03DDgADWWi1jt46oNpfY4pwWIuUpaFP4G9g+IDacXLBYRpWSqtRdB/fFxG0
 6U0Vx+PYZpHfbUs0VEiaiuRDoNnXX/zEsU9LJeV2jUiv45AekReGyHRuLkTvFfeQRUFn
 3NbKWeNZIev+y2Vjmlmz2qK5IE+VvxrevaUQ3ntlljqE4jfJlvBszF46oEB3xWKWXiuE
 AJxDTu4tCjcMKuGETuNCTcoRjYdYEGYaWdPWE1QnSe+7yALHEI6Vapl47/34/v5NKOud
 fLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=izV3rTj1g1h7Dgy2QwGrzIGLl+XIrmq7G80zvPDCcv0=;
 b=Iwa/FIWkwDgQdUJ8RZrVgZTWLnNpRAuQl4ULehZH3rBcZPhmi5+5mfuTHcm/gvAnw6
 w+F++1sxkwP0SmkfI9IS8yiT7n2Gd1sGlVnYj5eps5YZnqv3l0t1FiL12wn1MMumfOv9
 HbSBG41OJbo3xVA9GpFIY6EOKZSJgq4T2E51dZMWiQE/0x7+SaMJLzyr6JqO++Nm155n
 Mhsvdin4daCKHFo4OD17NBfeLr+H1t5MtQGd1IgTam/z1L+JVhaleqOyPqIA4912o45G
 88kPUO6sifb+jxnBn/uvUKEUP5k10ikBTy/2x4yCiAnsHWNwncnBc9Clcxkhd3Vs8nfH
 WAbg==
X-Gm-Message-State: AOAM533H4T6WowUicX9bPQB0UuasERuj6YAntDM/O+UmLYJcGPkuZRDO
 FvVN+tDs4qnsW6lq4IMueHmVXxkfE8z3aQ==
X-Google-Smtp-Source: ABdhPJwFUnVeSLg5e4NHDnhU8glajoTTPszM6hjUvWQoSoduhnKTPUmeUGtcce42c+OCiClgcloUQA==
X-Received: by 2002:a17:902:a58b:b0:149:2d53:b49 with SMTP id
 az11-20020a170902a58b00b001492d530b49mr16856065plb.69.1640617289635; 
 Mon, 27 Dec 2021 07:01:29 -0800 (PST)
Received: from localhost.localdomain (76-14-210-194.or.wavecable.com.
 [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id m13sm14756743pgt.22.2021.12.27.07.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 07:01:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/6] linux-user: Disable more prctl subcodes
Date: Mon, 27 Dec 2021 07:01:23 -0800
Message-Id: <20211227150127.2659293-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211227150127.2659293-1-richard.henderson@linaro.org>
References: <20211227150127.2659293-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create a list of subcodes that we want to pass on, a list of
subcodes that should not be passed on because they would affect
the running qemu itself, and a list that probably could be
implemented but require extra work. Do not pass on unknown subcodes.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Log unknown prctl options.
---
 linux-user/syscall.c | 58 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 55 insertions(+), 3 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 0f0f67d567..d868ef2910 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6337,6 +6337,13 @@ abi_long do_arch_prctl(CPUX86State *env, int code, abi_ulong addr)
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
 
@@ -6433,13 +6440,58 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
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
+    case PR_SET_SYSCALL_USER_DISPATCH:
+    case PR_GET_THP_DISABLE:
+    case PR_SET_THP_DISABLE:
+    case PR_GET_TSC:
+    case PR_SET_TSC:
+    case PR_GET_UNALIGN:
+    case PR_SET_UNALIGN:
+        /* Disable to prevent the target disabling stuff we need. */
         return -TARGET_EINVAL;
+
     default:
-        /* Most prctl options have no pointer arguments */
-        return get_errno(prctl(option, arg2, arg3, arg4, arg5));
+        qemu_log_mask(LOG_UNIMP, "Unsupported prctl: " TARGET_ABI_FMT_ld "\n",
+                      option);
+        return -TARGET_EINVAL;
     }
 }
 
-- 
2.25.1


