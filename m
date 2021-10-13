Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D6042B30E
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 05:04:09 +0200 (CEST)
Received: from localhost ([::1]:40420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maUYq-0000K2-IF
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 23:04:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUI0-0004yW-Ei
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:44 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:44991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHy-00058j-QS
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:44 -0400
Received: by mail-pf1-x42c.google.com with SMTP id w6so1131734pfd.11
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=OxMgM7wzD4BcAcUx2qJmodE4BwJ9QwGNSAt09qoFyFU=;
 b=Tb6Cp1cgY8OBfvyhPmsjUTlr/Dpqx0iV0P617ZHJTnpJyD2bliSSVuXt5LZxGhiZta
 uXxZ1krBrUCiwxzFRazOgsdNhMeTp9uZlLd/c4ygbMbxCVaxWMVd0a2CLM2E6toBhn5N
 TU7AXfIvC6tMUCLtHR6ZGEcCydEQ3s0Jm2+VDz38pt9H13KEA6CMjfxAr7+mPbAdFjDj
 ELt7iiQaVAhFpQYlbmxAUioAEYyJj/MC5KIvi+iYLG3WWt5V5ehsqRdtN7OnLkEtZPg+
 F8QNRSkKLZLszVdNLcmRWjb2nsriPjxmHkE4K3eW9FHIZma/v3q6cc8S7zDL2NJDHuCT
 5rnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OxMgM7wzD4BcAcUx2qJmodE4BwJ9QwGNSAt09qoFyFU=;
 b=vnJUHTbIHVV12lClkJSojDO3xpf8r7bugoO2Cr/+JWnqwnoaVwQMmW1NRvfWiLzQka
 /Qi4A7FB/+zlzEYOr9Gii/X8L7zFnjHnre9EY7EQa61ayrZh5DKAT05j0qQwy2dKu3tO
 dewJspfdR+MTwi33h9emlhB7nKbf0vyDyGldIAJkCTkqSUpJNTryNuj97ca5QfYsIzep
 ldiHbQYFBmVKIijV3bpvHb19W89VDx5qwCGN8mFI6t6g3NnAVbyXI8C0qED92+5Li+uk
 emPzThQf0o9/KfaQ7l+BgGHYO24qB1d7okI8kQXD8+CpuNeGYr9CK0J+qNldM93S0mvC
 SUPw==
X-Gm-Message-State: AOAM530fpU9PWuNK7Tg9k6l0prq8GEeFWI2Q91i9m4wPb52qsvATQorJ
 Gr7OD0D8icIZGTi7UHxa89Xw4XCWALAvDA==
X-Google-Smtp-Source: ABdhPJwDFRBpL59+pxRRYKwbEoH62nsNnaQdqnH51WkdIkCfizwcdFodiudPzDMKmzDKGxIeFTRjiQ==
X-Received: by 2002:a62:1995:0:b0:44c:728e:323b with SMTP id
 143-20020a621995000000b0044c728e323bmr35081202pfz.54.1634093201429; 
 Tue, 12 Oct 2021 19:46:41 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id qe17sm4855014pjb.39.2021.10.12.19.46.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:46:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 32/48] linux-user: Disable more prctl subcodes
Date: Tue, 12 Oct 2021 19:45:51 -0700
Message-Id: <20211013024607.731881-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
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


